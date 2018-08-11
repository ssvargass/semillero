from semillero.proyecto.utils import set_current_user

class CurrentUserMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        # Code to be executed for each request before
        # the view (and later middleware) are called.
        set_current_user(request.user)

        response = self.get_response(request)

        # Code to be executed for each request/response after
        # the view is called.

        return response
