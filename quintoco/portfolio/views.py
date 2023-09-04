import statistics
from django.http import HttpRequest
from django.shortcuts import render, get_object_or_404,redirect

from .forms import (
    UserContactForm,
    FormularioContactoa,
    FormCitas,
)

from django.contrib import messages
from django.core.mail import EmailMessage
from .models import (
		UserProfile,
        Statistic,
        Razones,
        Areas,
        Mensaje,
        Quienes_Somo,
        Vision,
        Mision,
        Principios,
        Politica,
        Valores,
        Testimonial,
        Blog,
        Equipo,
        Contact,
        UserContact,
        Schedule
	)


from django.views import generic


# Create your views here.
def home(request):
    profile = UserProfile.objects.filter(is_active=True)
    statistics = Statistic.objects.filter(is_active=True)
    razones = Razones.objects.filter(is_active=True)
    areas = Areas.objects.filter(is_active=True)
    mensaje = Mensaje.objects.filter(is_active=True)
    quienesomos = Quienes_Somo.objects.filter(is_active=True)
    testimonial = Testimonial.objects.filter(is_active=True)
    blog = Blog.objects.filter(is_active=True)
    equipo = Equipo.objects.filter(is_active=True)

    context = {'profile': profile, 'statistics': statistics, 'razones': razones,'areas': areas, 'mensaje': mensaje,'quienesomos': quienesomos, 'testimonial': testimonial,'equipo': equipo, 'blog': blog}
    

    return render(request, 'portfolio/home.html', context)


def blog(request):
    
    profile = UserProfile.objects.filter(is_active=True)
    statistics = Statistic.objects.filter(is_active=True)
    razones = Razones.objects.filter(is_active=True)
    areas = Areas.objects.filter(is_active=True)
    mensaje = Mensaje.objects.filter(is_active=True)
    quienesomos = Quienes_Somo.objects.filter(is_active=True)
    vision = Vision.objects.filter(is_active=True)
    mision = Mision.objects.filter(is_active=True)
    principios = Principios.objects.filter(is_active=True)
    valores = Valores.objects.filter(is_active=True)
    testimonial = Testimonial.objects.filter(is_active=True)
    blog = Blog.objects.filter(is_active=True)
    equipo = Equipo.objects.filter(is_active=True)
    context = {'profile': profile, 'statistics': statistics, 'razones': razones,'areas': areas,'principios':principios,'valores':valores, 'vision':vision,'mision':mision,'quienesomos': quienesomos,'mensaje': mensaje, 'testimonial': testimonial, 'blog': blog,'equipo': equipo}
    
    return render(request, 'portfolio/blog.html', context)

def blog_details(request, blog_id):
	blog = get_object_or_404(Blog, pk=blog_id)
	return render(request, "portfolio/blog-detail.html", {"id": blog})

def equipo(request):
    
    profile = UserProfile.objects.filter(is_active=True)
    statistics = Statistic.objects.filter(is_active=True)
    razones = Razones.objects.filter(is_active=True)
    areas = Areas.objects.filter(is_active=True)
    mensaje = Mensaje.objects.filter(is_active=True)
    quienesomos = Quienes_Somo.objects.filter(is_active=True)
    vision = Vision.objects.filter(is_active=True)
    mision = Mision.objects.filter(is_active=True)
    principios = Principios.objects.filter(is_active=True)
    valores = Valores.objects.filter(is_active=True)
    testimonial = Testimonial.objects.filter(is_active=True)
    blog = Blog.objects.filter(is_active=True)
    equipo = Equipo.objects.filter(is_active=True)
    context = {'profile': profile, 'statistics': statistics, 'razones': razones,'areas': areas,'principios':principios,'valores':valores, 'vision':vision,'mision':mision,'quienesomos': quienesomos,'mensaje': mensaje, 'testimonial': testimonial, 'blog': blog,'equipo': equipo}
    
    return render(request, 'portfolio/equipo.html', context)


def equipo_details(request, equipo_id):
	equipo = get_object_or_404(Equipo, pk=equipo_id)
	return render(request, "portfolio/equipo-detail.html", {"equipo": equipo})

def politica(request):
    politica = Politica.objects.filter(is_active=True)

    context = {'politica': politica}

    return render(request, 'portfolio/politica-datos.html', context)

def areas(request):
    
    profile = UserProfile.objects.filter(is_active=True)
    statistics = Statistic.objects.filter(is_active=True)
    razones = Razones.objects.filter(is_active=True)
    areas = Areas.objects.filter(is_active=True)
    mensaje = Mensaje.objects.filter(is_active=True)
    quienesomos = Quienes_Somo.objects.filter(is_active=True)
    vision = Vision.objects.filter(is_active=True)
    mision = Mision.objects.filter(is_active=True)
    principios = Principios.objects.filter(is_active=True)
    valores = Valores.objects.filter(is_active=True)
    testimonial = Testimonial.objects.filter(is_active=True)
    blog = Blog.objects.filter(is_active=True)
    equipo = Equipo.objects.filter(is_active=True)
  
    context = {'profile': profile, 'statistics': statistics, 'razones': razones,'areas': areas,'principios':principios,'valores':valores, 'vision':vision,'mision':mision,'quienesomos': quienesomos,'mensaje': mensaje, 'testimonial': testimonial, 'blog': blog,'equipo': equipo}
    
    return render(request, 'portfolio/areas.html', context)

def areas_details(request, areas_id):
	areas = get_object_or_404(Areas, pk=areas_id)
	return render(request, "portfolio/areas-detail.html", {"areas": areas})



def quienesomos(request):
    
    profile = UserProfile.objects.filter(is_active=True)
    statistics = Statistic.objects.filter(is_active=True)
    razones = Razones.objects.filter(is_active=True)
    areas = Areas.objects.filter(is_active=True)
    mensaje = Mensaje.objects.filter(is_active=True)
    quienesomos = Quienes_Somo.objects.filter(is_active=True)
    vision = Vision.objects.filter(is_active=True)
    mision = Mision.objects.filter(is_active=True)
    principios = Principios.objects.filter(is_active=True)
    valores = Valores.objects.filter(is_active=True)
    testimonial = Testimonial.objects.filter(is_active=True)
    blog = Blog.objects.filter(is_active=True)
    equipo = Equipo.objects.filter(is_active=True)
    context = {'profile': profile, 'statistics': statistics, 'razones': razones,'areas': areas,'principios':principios,'valores':valores, 'vision':vision,'mision':mision,'quienesomos': quienesomos,'mensaje': mensaje, 'testimonial': testimonial, 'blog': blog,'equipo': equipo}
    
    return render(request, 'portfolio/quienesomos.html', context)



def schedule(request):
    schedule = Schedule.objects.filter(is_active=True)
    context = {'schedule': schedule}

    return render(request, 'portfolio/citas.html', context)

def contactoa(request):
    formulario_contacto=UserContactForm()
    return render(request,"portfolio/contacto.html",{'miFormulario':formulario_contacto})

def contactos(request):
    formulario_contacto=FormularioContacto()
    if request.method=="POST":
        formulario_contacto=FormularioContacto(data=request.POST)
        if formulario_contacto.is_valid():
            nombre=request.POST.get("nombre")
            email=request.POST.get("email")
            contenido=request.POST.get("contenido")

            email =EmailMessage("Mensaje desde App Django",
                                "El Usuario con Nombre {} Con la dirección {} Escribe lo Siguiente:\n\n {}".format(nombre,email,contenido),
                                "",["efrenqg2022@gmail.com"])

            return redirect("/contacto/?valido")
    return render(request,"portfolio/contacto.html",{'miFormulario':formulario_contacto})

def citas(request):
        contact = Contact.objects.filter(is_active=True)


        formulario_contacto= FormCitas()
        if request.method=="POST":
            formulario_contacto=FormCitas(data=request.POST)
            if formulario_contacto.is_valid():
                nombre=request.POST.get("name")
                email=request.POST.get("email")
                telefono = request.POST.get("phone")
                asunto = request.POST.get("time")    
                contenido=request.POST.get("message")

                email1 =EmailMessage(asunto,
                                    "El Usuario con los Siguientes datos solicita asesoria: \n\n Nombre {} \n\n Con correo electronico: {} \n\n Escribe lo Siguiente:\n\n {}. \n\n llamar al telefono: {}".format(nombre,email,contenido,telefono),
                                    "",["efrenqg2022@gmail.com"],reply_to=[email])
                
                email2 =EmailMessage(asunto,
                                    "Hemos Recibido tu mensaje con los Siguientes datos: \n\n Nombre:  {}  \n\n correo electronico: {} \n\n Mensaje:\n\n {}. \n\n telefono: {} \n\n Información Recibida correctamente, gracias por contactarnos nos veremos pronto".format(nombre,email,contenido,telefono),
                                    "",[email])
                try:
                    email1.send()
                    email2.send()
                    formulario_contacto.save()
                    messages.success(request, 'Información enviada correctamente, gracias nos veremos pronto')

                    return redirect("/citas/?valido")
            
                except:
                    messages.error(request, 'Ocurrió un error al enviar el correo.')
                    return redirect("/citas/?novalido")
        context = {'contact': contact, 'miFormulario':formulario_contacto}

        return render(request,"portfolio/citas.html", context)

class FormularioContacto(HttpRequest):

    def contacto(request):
        contact = Contact.objects.filter(is_active=True)


        formulario_contacto= UserContactForm()
        if request.method=="POST":
            formulario_contacto=UserContactForm(data=request.POST)
            if formulario_contacto.is_valid():
                nombre=request.POST.get("name")
                email=request.POST.get("email")
                telefono = request.POST.get("phone")
                asunto = request.POST.get("subject")    
                contenido=request.POST.get("message")

                email1 =EmailMessage(asunto,
                                    "El Usuario con los Siguientes datos solicita asesoria: \n\n Nombre {} \n\n Con correo electronico: {} \n\n Escribe lo Siguiente:\n\n {}. \n\n llamar al telefono: {}".format(nombre,email,contenido,telefono),
                                    "",["efrenqg2022@gmail.com"],reply_to=[email])
                
                email2 =EmailMessage(asunto,
                                    "Hemos Recibido tu mensaje con los Siguientes datos: \n\n Nombre:  {}  \n\n correo electronico: {} \n\n Mensaje:\n\n {}. \n\n telefono: {} \n\n Información Recibida correctamente, gracias por contactarnos nos veremos pronto".format(nombre,email,contenido,telefono),
                                    "",[email])
                try:
                    email1.send()
                    email2.send()
                    formulario_contacto.save()
                    messages.success(request, 'Información enviada correctamente, gracias nos veremos pronto')

                    return redirect("/contacto/?valido")
            
                except:
                    messages.error(request, 'Ocurrió un error al enviar el correo.')
                    return redirect("/contacto/?novalido")
        context = {'contact': contact, 'miFormulario':formulario_contacto}

        return render(request,"portfolio/contacto.html", context)
    

    def procesar_formulario(request):

            formulario_contacto= UserContactForm()
            if formulario_contacto.is_valid():
                formulario_contacto.save() 
                formulario_contacto = UserContactForm()
        
            mensaje="OK"
            context = {'mensaje': mensaje, 'UserContactForm':formulario_contacto}
#            context = {'mensaje': mensaje}
            return render(request,"portfolio/contacto.html",context)


class FormularioCitas(HttpRequest):

    def citas(request):
        contact = Contact.objects.filter(is_active=True)


        formulario_citas= FormCitas()
        if request.method=="POST":
            formulario_citas=FormCitas(data=request.POST)
            if formulario_citas.is_valid():
                nombre=request.POST.get("name")
                email=request.POST.get("email")
                telefono = request.POST.get("phone")
                fecha = request.POST.get("fecha_cita")    
                hora=request.POST.get("time")
                asunto= "Solicitu de Cita de "

                email1 =EmailMessage(asunto,
                                    "El Cliente con los Siguientes datos solicita cita:\n\n Nombres y apellidos: {} \n\n Con correo electronico: {} \n\n Fecha: {} y Hora: {}. \n\n llamar al telefono: {}".format(nombre,email,fecha,hora,telefono),
                                    "",["efrenqg2022@gmail.com"],reply_to=[email])
                
#                email2 =EmailMessage(asunto,
#                                   "Hemos Recibido tu mensaje con los Siguientes datos: \n\n Nombre:  {}  \n\n correo electronico: {} \n\n Mensaje:\n\n {}. \n\n telefono: {} \n\n Información Recibida correctamente, gracias por contactarnos nos veremos pronto".format(nombre,email,contenido,telefono),
#                                    "",[email])
                try:
                    email1.send()
 #                   email2.send()
                    formulario_citas.save()
                    messages.success(request, 'Información enviada correctamente, gracias nos veremos pronto')

                    return redirect("/citas/?valido")
            
                except:
                    messages.error(request, 'Ocurrió un error al Solicitar la cita.')
                    return redirect("/citas/?novalido")
        context = {'contact': contact, 'miFormulario':formulario_citas}

        return render(request,"portfolio/citas.html", context)
    
    def procesar_formulario(request):

            formulario_contacto= UserContactForm()
            if formulario_contacto.is_valid():
                formulario_contacto.save() 
                formulario_contacto = UserContactForm()
        
            mensaje="OK"
            context = {'mensaje': mensaje, 'UserContactForm':formulario_contacto}
#            context = {'mensaje': mensaje}
            return render(request,"portfolio/contacto.html",context)

def contact(request):
    contact = Contact.objects.filter(is_active=True)

    context = {'contact': contact}

    return render(request, 'portfolio/contacto.html', context)

def contactos(request):
    contact = Contact.objects.filter(is_active=True)

    context = {'contact': contact}

    return render(request, 'portfolio/contacto.html', context)



class ContactView(generic.FormView):
	template_name = "portfolio/contacto.html"
	form_class = UserContactForm
	success_url = "/"
	
	def form_valid(self, form):
		form.save()
		messages.success(self.request, 'Gracias. Nos veremos pronto.')
		return super().form_valid(form)