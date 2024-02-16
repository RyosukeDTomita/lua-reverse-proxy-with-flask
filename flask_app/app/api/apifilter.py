class RequestFilter():
    def get(self, endpoint: EndPoint):
        def decorator(f):

            endpoint_config, api_config, url = RequestFilter._get_config(endpoint)
            @current_app.route(url, methods=['GET'], endpoint=f.__name__)
            def _print_info(*args, **kwargs):
                current_app.logger.info("====================")
                current_app.logger.info("ACCESSURL: {0}".format(url))
                current_app.logger.info("====================")
                return f(*args, **kwargs)
            return _print_info
        return decorator
