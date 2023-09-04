from datetime import date
from email import message
from email.mime import image
from django.db import models
from django.contrib.auth.models import User
from django.template.defaultfilters import slugify

#parte1 home
class UserProfile(models.Model):

    class Meta:
        verbose_name = 'Perfil usuario'
    
    name = models.CharField(max_length=40, blank=True, null=True, verbose_name='Escribe un Titulo')
    tag_line = models.CharField(max_length=200, blank=True, null=True, verbose_name='Escribe un Mensaje')
    btn_txt = models.CharField(max_length=30, blank=True, null=True, verbose_name='Escribe texto para boton cita')
    image = models.ImageField(blank=True, null=True, upload_to="profile_images", verbose_name='Suba una imagen')
    image_caption = models.CharField(max_length=50, blank=True, null=True, verbose_name='Escribe un Mensjae para la imagen')
    is_active = models.BooleanField(default=True)


    def __str__(self):
        return f'{self.name} {self.tag_line}'

    
    @property
    def imageURL(self):
        try:
            url = self.image.url
        except:
            url = ''
        return 



class Statistic(models.Model):
    class Meta:
        verbose_name_plural = 'Statistics'
        verbose_name = 'Statistic'


    number_one = models.IntegerField(default=0, verbose_name='Enter Number For Field One')
    field_one = models.CharField(max_length=50, blank=True, null=True, default="Total Case", verbose_name='Name of Field One')
    number_two = models.IntegerField(default=0, verbose_name='Enter Number For Field Two')
    field_two = models.CharField(max_length=50, blank=True, null=True,default="Active Case", verbose_name='Name of Field Two')
    number_three = models.IntegerField(default=0, verbose_name='Enter Number For Field Three')
    field_three = models.CharField(max_length=50, blank=True, null=True, default="Successful", verbose_name='Name of Field Three')
    number_four = models.IntegerField(default=0, verbose_name='Enter Number For Field Four')
    field_four = models.CharField(max_length=50, blank=True, null=True, default="Award Won", verbose_name='Name of Field Four')
    is_active = models.BooleanField(default=True)

    def __str__(self):
        return f'{self.number_one} {self.number_two} {self.number_three} {self.number_four}'


#2
class Razones(models.Model):
    class Meta:
        verbose_name_plural = 'Razones'
        verbose_name = 'Razones'

    heading = models.CharField(max_length=50, blank=True, null=True, verbose_name='Escribe una Razon')
    description = models.CharField(max_length=300, blank=True, null=True, verbose_name='Escribe una Descripción')
    class_name = models.CharField(max_length=50, blank=True, null=True, default="icon-box-clr-1", verbose_name='')
    class_name_icon = models.CharField(max_length=50, blank=True, null=True, default="fas fa-user-friends", verbose_name='')
    is_active = models.BooleanField(default=True)


    def __str__(self):
        return f'{self.heading} {self.description}'


#3    
class Politica(models.Model):
    
    class Meta:
        verbose_name_plural = 'Politicas'
        verbose_name = 'Politica'
        
    
    name = models.CharField(verbose_name="Name",max_length=100)
    subject = models.CharField(verbose_name="Subject",max_length=100)
    message = models.TextField(verbose_name="Message")
    is_active = models.BooleanField(default=True)
    def __str__(self):
        return f'{self.name}'

#4
class Areas(models.Model):
    class Meta:
        verbose_name_plural = 'areas'
        verbose_name = 'area'

    area = models.CharField(max_length=100, blank=True, null=True, verbose_name='Escribe una Area')
    descripcion = models.CharField(max_length=150, blank=True, null=True, verbose_name='Escribe una Descripción corta')
    definicion = models.CharField(max_length=300, blank=True, null=True, verbose_name='Escribe una Definición')
    class_name = models.CharField(max_length=50, blank=True, null=True, default="icon-box-clr-1", verbose_name='Escribe una clase para asiganr color')
    image = models.ImageField(blank=True, null=True, upload_to="areas_images", verbose_name='Subir Imagen inicial')
    image_principal = models.ImageField(blank=True, null=True, upload_to="areas_images", verbose_name='Subir Imagen Principal')
    #class_name_imagen = models.CharField(max_length=50, blank=True, null=True, default="fas fa-user-friends", verbose_name='Write a Class Name for Change Icon')
    is_active = models.BooleanField(default=True)

    

    def __str__(self):
        return f'{self.area} {self.descripcion}'

    @property
    def imageURL(self):
        try:
            url = self.image.url
        except:
            url = ''
        return url
    
    @property
    def principal_imageURL(self):
        try:
            url = self.image_principal.url
        except:
            url = ''
        return url

#5
class Mensaje(models.Model):

    class Meta:
        verbose_name_plural = 'Mensajes'
        verbose_name = 'Mensaje'


    image = models.ImageField(blank=True, null=True, upload_to="appointment_images", verbose_name='Suba una imagen para la sección') 
    heading_one = models.CharField(max_length=50, blank=True, null=True, default="Get a Appointment Today!", verbose_name='Escribir un titulo para la sección')
    description_one = models.CharField(max_length=200, blank=True, null=True, verbose_name='Escribe una descripción para la sección')
    heading_two = models.CharField(max_length=50, blank=True, null=True, default="We Are The Best Choice For Your Case", verbose_name='Escribir otro titulo para la sección')
    description_two = models.CharField(max_length=200, blank=True, null=True, verbose_name='Escribe una descripción para la sección')
    number = models.IntegerField(default=0, verbose_name='Introduce un numero de telefono')
    check_point_one = models.CharField(max_length=50, blank=True, null=True, verbose_name='Escribe primera caracteristica')
    check_point_two = models.CharField(max_length=50, blank=True, null=True, verbose_name='Escribe segunda caracteristica')
    check_point_three = models.CharField(max_length=50, blank=True, null=True, verbose_name='Escribe tercera caracteristica')
    btn_text = models.CharField(max_length=15, blank=True, null=True, default="Obtener Cita", verbose_name='Escribe un texto para el boton cita')
    is_active = models.BooleanField(default=True)


    def __str__(self):
        return f'{self.heading_one} {self.description_one}'

    
    @property
    def imageURL(self):
        try:
            url = self.image.url
        except:
            url = ''
        return url

#6
class Quienes_Somo(models.Model):

    class Meta:
        verbose_name_plural = 'Quienes_Somos'
        verbose_name = 'Quienes_Somo'


    image = models.ImageField(blank=True, null=True, upload_to="quienes_images", verbose_name='Suba imagen a la seccion Quienes somos') 
 #   heading_one = models.CharField(max_length=50, blank=True, null=True, default="Get a Appointment Today!", verbose_name='Write a Heading For First Card')
  #  description_one = models.CharField(max_length=200, blank=True, null=True, verbose_name='Write a Description For First Card')
    titulo = models.CharField(max_length=50, blank=True, null=True, default="Somos tu mejor Opción", verbose_name='Escribe un titulo para el Contenido')
    parrafo1 = models.CharField(max_length=1000, blank=True, null=True, verbose_name='Escribe primer parrafo')
    parrafo2 = models.CharField(max_length=1000, blank=True, null=True, verbose_name='Escribe segundo parrafo')
    parrafo3 = models.CharField(max_length=1000, blank=True, null=True, verbose_name='Escribe tercer parrafo')
    #number = models.IntegerField(default=0, verbose_name='Enter Number For Appointment')
    #check_point_one = models.CharField(max_length=50, blank=True, null=True, verbose_name='Write a First Check Point')
    #check_point_two = models.CharField(max_length=50, blank=True, null=True, verbose_name='Write a Second Check Point')
    #check_point_three = models.CharField(max_length=50, blank=True, null=True, verbose_name='Write a Third Check Point')
#    btn_text = models.CharField(max_length=15, blank=True, null=True, default="Get Appointment", verbose_name='Write a Button Text')
    is_active = models.BooleanField(default=True)


    def __str__(self):
        return f'{self.titulo} {self.parrafo1}'

    
    @property
    def imageURL(self):
        try:
            url = self.image.url
        except:
            url = ''
        return url

#7
class Mision(models.Model):

    class Meta:
        verbose_name_plural = 'Mision'
        verbose_name = 'Misiones'


    image = models.ImageField(blank=True, null=True, upload_to="quienes_images", verbose_name='Suba imagen para Mision') 
    titulo = models.CharField(max_length=50, blank=True, null=True, default="Misión", verbose_name='Escribe un titulo para el Contenido')
    parrafo1 = models.CharField(max_length=1000, blank=True, null=True, verbose_name='Escribe la misión')    #number = models.IntegerField(default=0, verbose_name='Enter Number For Appointment')
 
    is_active = models.BooleanField(default=True)


    def __str__(self):
        return f'{self.titulo} {self.parrafo1}'

    
    @property
    def imageURL(self):
        try:
            url = self.image.url
        except:
            url = ''
        return url
class Vision(models.Model):

    class Meta:
        verbose_name_plural = 'Vision'
        verbose_name = 'Visiones'


    image = models.ImageField(blank=True, null=True, upload_to="quienes_images", verbose_name='Suba imagen para Vision') 
    titulo = models.CharField(max_length=50, blank=True, null=True, default="Visión", verbose_name='Escribe un titulo para el Contenido')
    parrafo1 = models.CharField(max_length=1000, blank=True, null=True, verbose_name='Escribe la Visión')    #number = models.IntegerField(default=0, verbose_name='Enter Number For Appointment')
 
    is_active = models.BooleanField(default=True)


    def __str__(self):
        return f'{self.titulo} {self.parrafo1}'

    
    @property
    def imageURL(self):
        try:
            url = self.image.url
        except:
            url = ''
        return url

class Valores(models.Model):

    class Meta:
        verbose_name_plural = 'Valores'
        verbose_name = 'Valores'


    image = models.ImageField(blank=True, null=True, upload_to="quienes_images", verbose_name='Suba imagen para Valores') 
    titulo = models.CharField(max_length=50, blank=True, null=True, default="Valores", verbose_name='Escribe un titulo para el Contenido')
    parrafo1 = models.CharField(max_length=100, blank=True, null=True, verbose_name='Escribe valores 1')    #number = models.IntegerFi<<<<<eld(default=0, verbose_name='Enter Number For Appointment')
    parrafo2 = models.CharField(max_length=100, blank=True, null=True, verbose_name='Escribe valores 2')
    parrafo3 = models.CharField(max_length=100, blank=True, null=True, verbose_name='Escribe valores 3')
    parrafo4 = models.CharField(max_length=100, blank=True, null=True, verbose_name='Escribe valores 4')
    parrafo5 = models.CharField(max_length=100, blank=True, null=True, verbose_name='Escribe valores 5')
    parrafo6 = models.CharField(max_length=100, blank=True, null=True, verbose_name='Escribe valores 6')
    parrafo7 = models.CharField(max_length=100, blank=True, null=True, verbose_name='Escribe valores 7')

    is_active = models.BooleanField(default=True)


    def __str__(self):
        return f'{self.titulo} {self.parrafo1}'

    
    @property
    def imageURL(self):
        try:
            url = self.image.url
        except:
            url = ''
        return url

class Principios(models.Model):

    class Meta:
        verbose_name_plural = 'Principio'
        verbose_name = 'Principios'


    image = models.ImageField(blank=True, null=True, upload_to="quienes_images", verbose_name='Suba imagen para Principios') 
    titulo = models.CharField(max_length=50, blank=True, null=True, default="Valores", verbose_name='Escribe un titulo para el Contenido')
    parrafo1 = models.CharField(max_length=100, blank=True, null=True, verbose_name='Escribe principio 1')    #number = models.IntegerFi<<<<<eld(default=0, verbose_name='Enter Number For Appointment')
    parrafo2 = models.CharField(max_length=100, blank=True, null=True, verbose_name='Escribe principio 2')
    parrafo3 = models.CharField(max_length=100, blank=True, null=True, verbose_name='Escribe principio 3')
    parrafo4 = models.CharField(max_length=100, blank=True, null=True, verbose_name='Escribe principio 4')
    parrafo5 = models.CharField(max_length=100, blank=True, null=True, verbose_name='Escribe principio 5')

    
    is_active = models.BooleanField(default=True)


    def __str__(self):
        return f'{self.titulo} {self.parrafo1}'

    
    @property
    def imageURL(self):
        try:
            url = self.image.url
        except:
            url = ''
        return url



class Testimonial(models.Model):

    class Meta:
        verbose_name_plural = 'Testimonials'
        verbose_name = 'Testimonial'

    
    image = models.ImageField(blank=True, null=True, upload_to="testimonial_images", verbose_name='Upload an Image of Client')
    quote = models.CharField(max_length=200, blank=True, null=True, verbose_name='Write a Quote/Good Words of Client')
    name = models.CharField(max_length=50, blank=True, null=True, verbose_name='Write Name of Client')
    class_name = models.CharField(max_length=50, blank=True, null=True, default="anim1", verbose_name='Write a Class Name for Change Card Color')
    is_active = models.BooleanField(default=True)

    def __str__(self):
        return f'{self.quote} {self.name}'


    @property
    def imageURL(self):
        try:
            url = self.image.url
        except:
            url = ''
        return url



class Blog(models.Model):
    
    class Meta:
        verbose_name_plural = 'Blogs'
        verbose_name = 'Blog'
        ordering = ["date"]

    image = models.ImageField(blank=True, null=True, upload_to="blog_images", verbose_name='Upload an Image of Blog')
    heading = models.CharField(max_length=50, blank=True, null=True, verbose_name='Write a Heading of Blog')
    description = models.CharField(max_length=200, blank=True, null=True, verbose_name='Write a Description of Blog')
    admin_image = models.ImageField(blank=True, null=True, upload_to="admin_images", verbose_name='Upload an Image of Admin')
    admin_name = models.CharField(max_length=50, blank=True, null=True, verbose_name='Write Name of Admin')
    date = models.DateTimeField(blank=True, null=True, verbose_name='Write Date of Blog')
    is_active = models.BooleanField(default=True)


    def __str__(self):
        return f'{self.heading} {self.description}'

    
    @property
    def imageURL(self):
        try:
            url = self.image.url
        except:
            url = ''
        return url

    @property
    def admin_imageURL(self):
        try:
            url = self.admin_image.url
        except:
            url = ''
        return url


class Equipo(models.Model):
    
    class Meta:
        verbose_name_plural = 'Equipos'
        verbose_name = 'Equipo'
       
    image = models.ImageField(blank=True, null=True, upload_to="equipo_images", verbose_name='Subir imagen del equipo')
    persona = models.CharField(max_length=50, blank=True, null=True, verbose_name='Escribe nombre del Abogado')
    descripcion = models.CharField(max_length=200, blank=True, null=True, verbose_name='Escribe una descipcion breve')
    descripcion2 = models.CharField(max_length=200, blank=True, null=True, verbose_name='Escribe otra descripcion')
    descripcion3 = models.CharField(max_length=200, blank=True, null=True, verbose_name='Escribe otra descripcion')
    descripcion4 = models.CharField(max_length=200, blank=True, null=True, verbose_name='Escribe otra descripcion')
    descripcion5 = models.CharField(max_length=200, blank=True, null=True, verbose_name='Escribe otra descripcion')
    descripcion6 = models.CharField(max_length=200, blank=True, null=True, verbose_name='Escribe otra descripcion')
    descripcion7 = models.CharField(max_length=200, blank=True, null=True, verbose_name='Escribe otra descripcion')
    descripcion8 = models.CharField(max_length=200, blank=True, null=True, verbose_name='Escribe otra descripcion')
    #admin_image = models.ImageField(blank=True, null=True, upload_to="admin_images", verbose_name='Upload an Image of Admin')
    #admin_name = models.CharField(max_length=50, blank=True, null=True, verbose_name='Write Name of Admin')
    #date = models.DateTimeField(blank=True, null=True, verbose_name='Write Date of Blog')
    is_active = models.BooleanField(default=True)


    def __str__(self):
        return f'{self.persona} {self.descripcion}'

    
    @property
    def imageURL(self):
        try:
            url = self.image.url
        except:
            url = ''
        return url

  

class Contact(models.Model):

    class Meta:
        verbose_name_plural = 'Información de Contacto'
        verbose_name = "Información de Contacto"

    
    address = models.CharField(max_length=50, blank=True, null=True, default="Dhaka, Bangladesh", verbose_name='Ingrese Su dirección')
    call = models.CharField(max_length=50, blank=True, null=True, verbose_name='Ingrese su numero de celular')
    email = models.CharField(max_length=50, blank=True, null=True, verbose_name='Ingrese Email')
    support = models.CharField(max_length=50, blank=True, null=True, verbose_name='Ingrese soporte Email')
    is_active = models.BooleanField(default=True)


    def __str__(self):
        return f'{self.address} {self.call} {self.email} {self.support}'




class UserContact(models.Model):
    
    class Meta:
        verbose_name_plural = 'Información de Contactos Usuarios'
        verbose_name = 'Información de Contactos Usuarios'
        ordering = ["timestamp"]

    timestamp = models.DateTimeField(auto_now_add=True)
    name = models.CharField(verbose_name="Nombre",max_length=100)
    email = models.EmailField(verbose_name="Email")
    phone = models.CharField(verbose_name="Telefono",max_length=100)
    subject = models.CharField(verbose_name="Asunto",max_length=100)
    message = models.TextField(verbose_name="Mensaje")

    def __str__(self):
        return f'{self.name}'

horas_citas =[
    (8,'8-9'),
    (9,'9-10')
]

class UserCita(models.Model):
    
    class Meta:
        verbose_name_plural = 'Información de Contactos con Solicitud de citas'
        verbose_name = 'Información de Contactos con Solicitud de citas'
        ordering = ["timestamp"]

    timestamp = models.DateTimeField(auto_now_add=True)
    name = models.CharField(verbose_name="Nombres y Apellidos",max_length=100)
    email = models.EmailField(verbose_name="Email")
    phone = models.CharField(verbose_name="Celular",max_length=100)
    fecha_cita = models.DateTimeField(verbose_name="Fecha cita")
    time = models.CharField(verbose_name="Hora cita",max_length=50)
#    subject = models.CharField(verbose_name="Asunto",max_length=100)
    message = models.TextField(verbose_name="Mensaje")

    def __str__(self):
        return f'{self.name}'




class Schedule(models.Model):
    class Meta:
        verbose_name_plural = 'Citas'
        verbose_name = 'Citas'

    s_time = models.TimeField(verbose_name="Start Time")
    e_time = models.TimeField(verbose_name="End Time")
    date = models.DateField(verbose_name="Date")
    day = models.CharField(verbose_name="Day",max_length=100)
    is_active = models.BooleanField(default=True)

    def __str__(self):
        return f'{self.s_time} {self.e_time} {self.date} {self.day}'

    

