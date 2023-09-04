from django.contrib import admin
from django.urls import path, include
from django.conf.urls.static import static
from django.conf import settings
from portfolio import views
from portfolio.views import FormularioContacto, FormularioCitas
admin.site.site_header = "Admin Panel"
admin.site.site_title = "My Admin Portal"
admin.site.index_title = "Welcome to My Admin Panel"


urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.home, name='home'),
    path('quienesomos/', views.quienesomos, name='quienesomos'),
    path('equipo/', views.equipo, name='equipo'),
    path('equipo/<int:equipo_id>/', views.equipo_details, name="equipo_details"),
    path('areas/', views.areas, name='areas'),
    path('politica-datos/', views.politica, name='politica-datos'),
    path('areas/<int:areas_id>/', views.areas_details, name="areas_details"),
    path('blog/', views.blog, name='blog'),
    path('blog/<int:blog_id>/', views.blog_details, name="blog_details"),
    path('contact/', views.contact, name='contact'),
    path('contacto/', FormularioContacto.contacto, name='contacto'),
     path('citas/', views.citas, name='citas'),
 #   path('citas/', FormularioCitas.citas, name='citas'),
 #   path('contacto/', views.contacto, name='contacto'),
    path('guardarcontacto/', FormularioContacto.procesar_formulario, name='guardarcontacto'),
    path('cit/', views.schedule, name='cit'),
]
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)