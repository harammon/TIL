from django.shortcuts import render
from django.http import HttpResponse
from django.template import loader

def exercise1(request):
    template1 = loader.get_template('exercise1.html')
    return HttpResponse(template1.render(None, request))

def exercise2(request):
    if request.method == 'POST':        # 템플릿의 form으로부터 호출되는 경우
        name = request.POST['name']
        opinion = request.POST['opinion']
        context = {'name': name, 'opinion': opinion}
    else:
        context = None
    return render(request, 'exercise2.html', context)
