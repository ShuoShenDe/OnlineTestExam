# -*- coding:utf-8 -*-

from django.shortcuts import render
from django.contrib.auth import authenticate,login
from django.contrib.auth.backends import ModelBackend
from users.models import UserProfile
from django.db.models import Q #支持后面的并集查询
from django.views.generic.base import View
from django.contrib.auth.hashers import make_password
from .forms import QuestionFormChoice, QuestionFormJD, QuestionFormJudge
from coures.models import Paper, Question, CourseList, PaperList, UserPaperLog
from .models import UserAnswerLog, UserScore, UserNote
from datetime import datetime
from users.models import FileStroe

from django.db import connection, transaction


class PaperListView(View):
    """试题列表页面"""

    def get(self, request):
        cursor = connection.cursor()
        papers = PaperList.objects.filter(is_allow=True)
        paper_index = 0
        paper_no_list = []
        for i in papers:
            answer_flag = 0
            
            sql = "select * from coures_userpaperlog where paper_name_id=" + str(i.id) + " and user_id=" + str(request.user.id)
            cursor.execute(sql)
            row = cursor.fetchone()
            print row
            if not row: 
                papers[paper_index].status_name = "未完成"
                #print i
                paper_no_list.append(i)
                
        return render(request, "paper_list.html", {"papers": paper_no_list, "title": u"试题列表页面"})



class PaperListOkView(View):
    """试题列表页面"""

    def get(self, request):
        cursor = connection.cursor()
        papers = PaperList.objects.filter(is_allow=True)
        paper_index = 0
        paper_no_list = []
        for i in papers:
            answer_flag = 0
            
            sql = "select * from coures_userpaperlog where paper_name_id=" + str(i.id) + " and user_id=" + str(request.user.id)
            print sql
            cursor.execute(sql)
            row = cursor.fetchone()
            print '-----'
            print row
            print '-----'
            if row and row[3] != 0: 
                if row[3] == 1:
                    papers[paper_index].status_name = "未评分"
                else:
                    papers[paper_index].status_name = "已评分"
                    papers[paper_index].score = row[5]
                paper_no_list.append(i)
            else:
                papers[paper_index].status_name = "未提交"
                #print i
            paper_index += 1

            
        return render(request, "paper_ok_list.html", {"papers": paper_no_list, "title": u"试题列表页面"})




class PaperView(View):
    def get(self, request, paper_id):
        if request.user.is_authenticated():
            paper_list_id = PaperList.objects.filter(id=paper_id)#找到目标试卷     
            paper_list_info = PaperList.objects.get(id=paper_id)#找到目标试卷     

            papers = Paper.objects.filter(paper_name__id=paper_list_id)#找到所有试题
            
            answer_flag = 0
            UserPaperLog_info = UserPaperLog.objects.raw("select * from coures_userpaperlog where (status=1 or status=2) and paper_name_id=" + str(paper_list_info.id) + " and user_id=" + str(request.user.id))
            print UserPaperLog_info
            print len(list(UserPaperLog_info))
            if 0 < len(list(UserPaperLog_info)):
                answer_flag = 1
            if 1 == answer_flag:
                title = paper_list_info.name  
                return render(request, "score.html", {"score": 0, "title": title})   
                         
            question_list = []
            question_id_list = []
            for paper in papers:
                print 'paper is ', paper
                question = Question.objects.get(pk=paper.question_id)
                question_list.append(question)

                question_id_list.append(question.id)


            title = paper.paper_name

            print 'get 方法里用户获取的题目编号为', question_id_list  # 显示当前题目编号列表
            question_now = tuple(question_list)  # 题目元组

            question_count = len(question_now)  # 题目数
            return render(request, "paper_question.html", {"paper_list_name": paper_list_info.name, "question": question_now,
                                                           "question_count": question_count, "title": title})
        else:
            return render(request, "login.html", {"msg": u'为保证考试客观公正，考题不对未登录用户开放'})

    def post(self, request, paper_id):
        if request.user.is_authenticated():
            paper_list_id = PaperList.objects.filter(id=paper_id)  # 找到目标试卷
            paper_list_info = PaperList.objects.get(id=paper_id)  # 找到目标试卷
            papers = Paper.objects.filter(paper_name__id=paper_list_id)  # 找到所有试题
            question_id_list = []
            for paper in papers:
                print 'paper is ', paper
                
                #
                cursor = connection.cursor()
                sql = "select * from coures_userpaperlog where paper_name_id=" + str(paper_list_info.id) + " and user_id=" + str(request.user.id)
                
                cursor.execute(sql)
                row  = cursor.fetchone()
                print row
                if row:
                    paper_log_id = row[0]
                    sql = "update coures_userpaperlog set status=1 where paper_name_id=" + str(paper_list_info.id) + " and user_id=" + str(request.user.id)
                    cursor.execute(sql)
                    
                else:
                    sql = "insert coures_userpaperlog(paper_name_id, user_id, status, add_time, score) value('" + str(paper_list_info.id) + "', '" + str(request.user.id) + "',1,'" + str(datetime.now()) + "', '')"
                    cursor.execute(sql)
                    paper_log_id = cursor.lastrowid
                
                                
                question = Question.objects.get(pk=paper.question_id)
                question_id_list.append(question.id)
            
                user_UserAnswerLog = UserAnswerLog()
                # 记录用户
                user_UserAnswerLog.user = request.user
                # 记录试卷名
                user_UserAnswerLog.paper = paper
                
                user_UserAnswerLog.paper_log_id = paper_log_id
                
                # 记录做题时间
                user_UserAnswerLog.add_time = datetime.now()
                
                user_UserAnswerLog.score = -1
            
                # 根据编号找到用户提交的对应题号的答案
                user_ans = request.POST.get(str(question.id), "")
                user_UserAnswerLog.answer = user_ans
                user_UserAnswerLog.save()
 

                
            
            title = paper.paper_name.name   
            return render(request, "score.html", {"score": 0, "title": title, "msg": "你已经完成考试, 请耐心等待评分"})    


class PaperOkView(View):
    def get(self, request, paper_id):
        cursor = connection.cursor()
        if request.user.is_authenticated():
            paper_list_id = PaperList.objects.filter(id=paper_id)#找到目标试卷     
            paper_list_info = PaperList.objects.get(id=paper_id)#找到目标试卷     

            papers = Paper.objects.filter(paper_name__id=paper_list_id)#找到所有试题
                                   
            question_list = []
            question_id_list = []
            paper_index = 0
            for paper in papers:
                print 'paper is ', paper
                question = Question.objects.get(pk=paper.question_id)
                

                question_id_list.append(question.id)
                sql = "select * from operate_useranswerlog where paper_id=" + str(paper.id) + " and user_id=" + str(request.user.id)

                cursor.execute(sql)
                row  = cursor.fetchone()
                if row:
                    print row
                    question.useranswer= row[1]
                    question.userscore= row[2]
                    question_list.append(question)
                paper_index += 1

            title = paper.paper_name

            print 'get 方法里用户获取的题目编号为', question_id_list  # 显示当前题目编号列表
            question_now = tuple(question_list)  # 题目元组

            question_count = len(question_now)  # 题目数
            return render(request, "paper_ok_question.html", {"paper_list_name": paper_list_info.name, "question": question_now,
                                                           "question_count": question_count, "title": title})
        else:
            return render(request, "login.html", {"msg": u'为保证考试客观公正，考题不对未登录用户开放'})


class QuestionList(View):
   def get(self, request):
        cursor = connection.cursor()
        if request.user.is_authenticated():

            sql = "select * from coures_question"
            cursor.execute(sql)
            question_list  = cursor.fetchall()
            question_count = len(question_list)
            print question_list
            title = "题库"


            #return render(request, "login.html", {"msg": u'为保证考试客观公正，考题不对未登录用户开放'})
            return render(request, "question_list.html", {"question_list": question_list, 
                                                           "question_count": question_count, "title": title})
        else:
            return render(request, "login.html", {"msg": u'为保证考试客观公正，考题不对未登录用户开放'})


class QuestionViewAdd(View):
   def get(self, request):
        cursor = connection.cursor()
        if request.user.is_authenticated():

            #return render(request, "login.html", {"msg": u'为保证考试客观公正，考题不对未登录用户开放'})
            return render(request, "question_view_add.html")
        else:
            return render(request, "login.html", {"msg": u'为保证考试客观公正，考题不对未登录用户开放'})

   def post(self, request):
        cursor = connection.cursor()
        if request.user.is_authenticated():

            content = request.POST.get('content')
            answer = request.POST.get('answer')
            score = request.POST.get('score')
            sql = "insert into coures_question(content, answer, score, add_time) value('" + content+ "','" + answer + "','" + score + "','" + str(datetime.now()) + "')"
            cursor.execute(sql)
            #return render(request, "login.html", {"msg": u'为保证考试客观公正，考题不对未登录用户开放'})
            return render(request, "score.html", {"score": 0, "title": "新增题库", "msg": "新增题库成功"})  
                
        else:
            return render(request, "login.html", {"msg": u'为保证考试客观公正，考题不对未登录用户开放'})




class QuestionViewEdit(View):
   def get(self, request, question_id):
        cursor = connection.cursor()
        if request.user.is_authenticated():
            sql = "select * from coures_question where id=" + question_id
            cursor.execute(sql)
            row = cursor.fetchone()
            
            #return render(request, "login.html", {"msg": u'为保证考试客观公正，考题不对未登录用户开放'})
            return render(request, "question_view_edit.html", {"question_info": row})
        else:
            return render(request, "login.html", {"msg": u'为保证考试客观公正，考题不对未登录用户开放'})

   def post(self, request, question_id):
        cursor = connection.cursor()
        if request.user.is_authenticated():
        
            content = request.POST.get('content')
            answer = request.POST.get('answer')
            score = request.POST.get('score')
            sql = "update coures_question set content='" + content + "',answer='" + answer + "', score='" + score + "' where id=" + question_id;
            cursor.execute(sql)
            #return render(request, "login.html", {"msg": u'为保证考试客观公正，考题不对未登录用户开放'})
            return render(request, "score.html", {"score": 0, "title": "新增题库", "msg": "编辑题库成功"})  
                
        else:
            return render(request, "login.html", {"msg": u'为保证考试客观公正，考题不对未登录用户开放'})


class QuestionViewDelete(View):
   def get(self, request, question_id):
        cursor = connection.cursor()
        if request.user.is_authenticated():
            sql = "delete from coures_question where id=" + question_id
            cursor.execute(sql)
            
            #return render(request, "login.html", {"msg": u'为保证考试客观公正，考题不对未登录用户开放'})
            return render(request, "score.html", {"score": 0, "title": "新增题库", "msg": "删除题库成功"})  
        else:
            return render(request, "login.html", {"msg": u'为保证考试客观公正，考题不对未登录用户开放'})


class PaperCreateList(View):
   def get(self, request):
        cursor = connection.cursor()
        if request.user.is_authenticated():
            sql = "select * from coures_paperlist"
            cursor.execute(sql)
            paper_list  = cursor.fetchall()
            print paper_list
            paper_count = len(paper_list)
            print paper_list
            title = "创建考试"
            
            #return render(request, "login.html", {"msg": u'为保证考试客观公正，考题不对未登录用户开放'})
            return render(request, "paper_create_list.html", {"question_list": paper_list, 
                                                           "question_count": paper_count, "title": title})                
        else:
            return render(request, "login.html", {"msg": u'为保证考试客观公正，考题不对未登录用户开放'})


class PaperCreate(View):
   def get(self, request):
        cursor = connection.cursor()
        if request.user.is_authenticated():
            sql = "select * from coures_question"
            cursor.execute(sql)
            question_list  = cursor.fetchall()
            print question_list
            question_count = len(question_list)
            title = "创建考试"
            
            #return render(request, "login.html", {"msg": u'为保证考试客观公正，考题不对未登录用户开放'})
            return render(request, "paper_create.html", {"question_list": question_list, 
                                                           "question_count": question_count, "title": title})                
        else:
            return render(request, "login.html", {"msg": u'为保证考试客观公正，考题不对未登录用户开放'})

   def post(self, request):
        cursor = connection.cursor()
        if request.user.is_authenticated():
            papername = request.POST.get("papername")
            question_id = request.POST.getlist("question_id")
            
            sql = "insert into coures_paperlist(name, is_allow, add_time, course_id) value('" + papername + "','1','" + str(datetime.now()) + "','1')"
            cursor.execute(sql)
            papaer_name_id = cursor.lastrowid
            for question_item in question_id:
                sql ="insert into coures_paper(add_time, paper_name_id, question_id, course_id) value('" + str(datetime.now()) + "','" + str(papaer_name_id) + "','" + str(question_item)+ "', '1')"
                cursor.execute(sql)
            #return render(request, "login.html", {"msg": u'为保证考试客观公正，考题不对未登录用户开放'})
            return render(request, "score.html", {"score": 0, "title": "创建题库", "msg": "创建题库成功"})  
                
        else:
            return render(request, "login.html", {"msg": u'为保证考试客观公正，考题不对未登录用户开放'})





class PaperScoreList(View):
   def get(self, request):
        cursor = connection.cursor()
        if request.user.is_authenticated():
            sql = "select * from coures_paperlist"
            cursor.execute(sql)
            paper_list  = cursor.fetchall()
            print paper_list
            paper_count = len(paper_list)
            print paper_list
            title = "创建考试"
            
            #return render(request, "login.html", {"msg": u'为保证考试客观公正，考题不对未登录用户开放'})
            return render(request, "paper_create_score_list.html", {"question_list": paper_list, 
                                                           "question_count": paper_count, "title": title})                
        else:
            return render(request, "login.html", {"msg": u'为保证考试客观公正，考题不对未登录用户开放'})



class PaperCreateScore(View):
   def get(self, request, paper_id):
        cursor = connection.cursor()
        if request.user.is_authenticated():
            sql = "select * from coures_userpaperlog paperlog left join users_userprofile userprofile on paperlog.user_id = userprofile.id where paperlog.paper_name_id=" + str(paper_id)
            cursor.execute(sql)
            question_list  = cursor.fetchall()
            print question_list
            question_count = len(question_list)
            title = "创建考试"
            
            #return render(request, "login.html", {"msg": u'为保证考试客观公正，考题不对未登录用户开放'})
            return render(request, "paper_create_score.html", {"question_list": question_list, 
                                                           "question_count": question_count, "title": title})                
        else:
            return render(request, "login.html", {"msg": u'为保证考试客观公正，考题不对未登录用户开放'})

   def post(self, request, paper_id):
        cursor = connection.cursor()
        if request.user.is_authenticated():
            papername = request.POST.get("papername")
            question_id = request.POST.getlist("question_id")
            
            sql = "insert into coures_paperlist(name, is_allow, add_time, course_id) value('" + papername + "','1','" + str(datetime.now()) + "','1')"
            cursor.execute(sql)
            papaer_name_id = cursor.lastrowid
            for question_item in question_id:
                sql ="insert into coures_paper(add_time, paper_name_id, question_id, course_id) value('" + str(datetime.now()) + "','" + str(papaer_name_id) + "','" + str(question_item)+ "', '1')"
                cursor.execute(sql)
            #return render(request, "login.html", {"msg": u'为保证考试客观公正，考题不对未登录用户开放'})
            return render(request, "score.html", {"score": 0, "title": "创建题库", "msg": "创建题库成功"})  
                
        else:
            return render(request, "login.html", {"msg": u'为保证考试客观公正，考题不对未登录用户开放'})



class PaperScore(View):
   def get(self, request, paper_log_id):
        cursor = connection.cursor()
        if request.user.is_authenticated():
            sql = "select question.id,answerlog.id,answerlog.answer, question.score,question.content, question.answer from operate_useranswerlog answerlog left join coures_paper paper on answerlog.paper_id=paper.id left join coures_question question on question.id = paper.question_id where answerlog.paper_log_id=" + str(paper_log_id)
            cursor.execute(sql)
            question_now  = cursor.fetchall()
            print question_now
            question_count = len(question_now)
            title = "创建考试"
            
            #return render(request, "login.html", {"msg": u'为保证考试客观公正，考题不对未登录用户开放'})
            return render(request, "paper_score_question.html", {"question": question_now, 
                                                           "question_count": question_count, "title": title})                
        else:
            return render(request, "login.html", {"msg": u'为保证考试客观公正，考题不对未登录用户开放'})

   def post(self, request, paper_log_id):
        cursor = connection.cursor()
        if request.user.is_authenticated():
            papername = request.POST.get("papername")
            answerlog_id = request.POST.getlist("answerlog_id")
            
            print answerlog_id
            totalscore = 0
            for answerlog_id_item in answerlog_id:
                score = request.POST.get(answerlog_id_item)
                if not score:
                    score = 0
                sql = "update operate_useranswerlog set score='" + str(score) + "' where id=" + answerlog_id_item
                cursor.execute(sql)
                totalscore += int(score)

            sql = "update coures_userpaperlog set status=2,score='" + str(totalscore) + "' where id=" + paper_log_id
            cursor.execute(sql)
            
            #return render(request, "login.html", {"msg": u'为保证考试客观公正，考题不对未登录用户开放'})
            return render(request, "score.html", {"score": 0, "title": "创建题库", "msg": "评分成功"})  
                
        else:
            return render(request, "login.html", {"msg": u'为保证考试客观公正，考题不对未登录用户开放'})


class DownloadFunView(View):
    def get(self, request, page_number):
        file_list = FileStroe.objects.all()
        return render(request, "download.html", {"file_list": file_list})


class DownAddView(View):
    def post(self, request):
        file_list = FileStroe.objects.all()
        file_id = request.POST.get("file_id")
        print "asdfsasdfasdf", file_id
        file = FileStroe.objects.get(pk=file_id)
        file.down_count += 1
        file.save()
        return render(request, "download.html", {"file_list": file_list})
