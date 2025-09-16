from django.http import HttpResponse

def index(request):
    return HttpResponse("Ivan Hello, world! This is my Django index page. TEST ")
