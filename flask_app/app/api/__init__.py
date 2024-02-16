from flask import current_app, request, Response

from .apifilter import request_filter


@current_app.route('/')
def root():
    return Response("<h1>Hello, World</h1>", status=200)
