from django.contrib import admin
from . models import (
    UserProfile,
    Statistic,
    Razones,
    Areas,
    Mensaje,
    Quienes_Somo,
    Mision,
    Vision,
    Principios,
    Valores,
    Testimonial,
    Blog,
    Equipo,
    Contact,
    Politica,
    UserContact,
    UserCita,
    Schedule
    )
# Register your models here.

@admin.register(UserProfile)
class UserProfileAdmin(admin.ModelAdmin):
	list_display = ('id', 'name')


#@admin.register(Statistic)
#class StatisticAdmin(admin.ModelAdmin):
#    list_display = ('id', 'number_one', 'number_two', 'number_three', 'number_four')


@admin.register(Razones)
class RazonesAdmin(admin.ModelAdmin):
    list_display = ('id', 'heading', 'is_active')

@admin.register(Areas)
class AreasAdmin(admin.ModelAdmin):
    list_display = ('id', 'area', 'is_active')
    
@admin.register(Politica)
class PoliticaAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'is_active')

@admin.register(Mensaje)
class MensajeAdmin(admin.ModelAdmin):
    list_display = ('id', 'heading_one', 'heading_two', 'number', 'is_active')

@admin.register(Quienes_Somo)
class QuienesAdmin(admin.ModelAdmin):
    list_display = ('id', 'titulo', 'is_active')

@admin.register(Mision)
class MisionAdmin(admin.ModelAdmin):
    list_display = ('id', 'titulo', 'is_active')

@admin.register(Vision)
class VisionAdmin(admin.ModelAdmin):
    list_display = ('id', 'titulo', 'is_active')

@admin.register(Principios)
class PrincipioAdmin(admin.ModelAdmin):
    list_display = ('id', 'titulo', 'is_active')

@admin.register(Valores)
class ValoresAdmin(admin.ModelAdmin):
    list_display = ('id', 'titulo', 'is_active')


#@admin.register(Testimonial)
#class TestimonialAdmin(admin.ModelAdmin):
#    list_display = ('id', 'name', 'quote', 'is_active')


#@admin.register(Blog)
#class BlogAdmin(admin.ModelAdmin):
#    list_display = ('id', 'heading', 'description', 'is_active')

@admin.register(Equipo)
class EquipoAdmin(admin.ModelAdmin):
    list_display = ('id', 'persona', 'descripcion', 'is_active')


@admin.register(Contact)
class ContactAdmin(admin.ModelAdmin):
    list_display = ('id', 'address', 'email', 'call', 'support', 'is_active')

@admin.register(UserContact)
class UserContactAdmin(admin.ModelAdmin):
    list_display = ('name', 'email', 'phone', 'subject', 'message')

@admin.register(UserCita)
class UserCitaAdmin(admin.ModelAdmin):
    list_display = ('name', 'email', 'phone', 'time', 'message')

#@admin.register(Schedule)
#class ScheduleAdmin(admin.ModelAdmin):
#    list_display = ('day', 's_time', 'e_time', 'date', 'is_active')
#pip freeze > requirements.txt