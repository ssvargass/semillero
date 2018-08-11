from django.conf import settings
from django.urls import include, path
from django.conf.urls.static import static
from django.contrib import admin
from django.views.generic import TemplateView
from django.views import defaults as default_views
# from rest_framework_extensions.routers import ExtendedDefaultRouter
from rest_framework.routers import DefaultRouter
from semillero.proyecto.views import ProyectoDocumentView, ProjectView, FacultadView, GrupoView, LineaView, HitoView

router = DefaultRouter()

proyectos = router.register(
    "",
    ProyectoDocumentView,
    base_name='proyectodocument'
)

admin.site.site_header = "SEMILLEROS"

urlpatterns = [
    path("jet/", include('jet.urls', 'jet')),
    path("jet/dashboard/", include('jet.dashboard.urls', 'jet-dashboard')),
    path(
        "about/",
        TemplateView.as_view(template_name="pages/about.html"),
        name="about",
    ),
    # Django Admin, use {% url 'admin:index' %}
    path(settings.ADMIN_URL, admin.site.urls),
    # User management
    path(
        "users/",
        include("semillero.users.urls", namespace="users"),
    ),
    path("accounts/", include("allauth.urls")),
    path("tinymce/", include('tinymce.urls')),
    # path(r'^search/', include(router.urls)),
    path("api/search/", include(router.urls)),
    path("api/proyecto/", ProjectView.as_view(), name='proyecto'),
    path("api/facultad/", FacultadView.as_view(), name='facultades'),
    path("api/grupo/", GrupoView.as_view(), name='grupos'),
    path("api/linea/", LineaView.as_view(), name='lineas'),
    path("api/hito/", HitoView.as_view(), name='Hitos'),
    path("", TemplateView.as_view(template_name="pages/home.html"), name="home"),
    # Your stuff: custom urls includes go here
] + static(
    settings.MEDIA_URL, document_root=settings.MEDIA_ROOT
)

if settings.DEBUG:
    # This allows the error pages to be debugged during development, just visit
    # these url in browser to see how these error pages look like.
    urlpatterns += [
        path(
            "400/",
            default_views.bad_request,
            kwargs={"exception": Exception("Bad Request!")},
        ),
        path(
            "403/",
            default_views.permission_denied,
            kwargs={"exception": Exception("Permission Denied")},
        ),
        path(
            "404/",
            default_views.page_not_found,
            kwargs={"exception": Exception("Page not Found")},
        ),
        path("500/", default_views.server_error),
    ]
    if "debug_toolbar" in settings.INSTALLED_APPS:
        import debug_toolbar

        urlpatterns = [path("__debug__/", include(debug_toolbar.urls))] + urlpatterns
