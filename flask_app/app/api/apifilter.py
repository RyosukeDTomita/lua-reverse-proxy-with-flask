# from flask import current_app


# class RequestFilter():
#     def get(self, endpoint: str):  # TODO endpointをenumerateにする。
#         def decorator(f):

#             @current_app.route(url, methods=['GET'], endpoint=f.__name__)
#             def _print_info(*args, **kwargs):
#                 current_app.logger.info("====================")
#                 current_app.logger.info("ACCESSURL: {0}".format(url))
#                 current_app.logger.info("====================")
#                 return f(*args, **kwargs)
#             return _print_info
#         return decorator
