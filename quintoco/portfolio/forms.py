from django import forms
from .models import UserContact, UserCita


class FormularioContactoa(forms.Form):

    nombre=forms.CharField(label="Nombre", required=True)
    email=forms.CharField(label="Email",required=True)
    contenido=forms.CharField(label="Contenido",widget=forms.Textarea)


class FormCitas(forms.ModelForm):

	name = forms.CharField(max_length=100, required=True,
		widget=forms.TextInput(attrs={
			'placeholder': 'Nombre y Apellido',
			
			}))

	email = forms.EmailField(max_length=254, required=True, 
		widget=forms.TextInput(attrs={
			'placeholder': 'Email',
			
			}))


	phone = forms.CharField(max_length=20, required=True, 
		widget=forms.TextInput(attrs={
			'placeholder': 'Numero Celular',
			
			}))
	


	time = forms.CharField(max_length=200, required=True, 
		widget=forms.TextInput(attrs={
			'placeholder': 'Hora de Cita',
			
			}))

	fecha_cita = forms.DateField(required=True, 
		widget=forms.DateInput(attrs={
			'placeholder': 'Hora de Cita',
			
			}))
			
	message = forms.CharField(max_length=1000, required=True, 
		widget=forms.Textarea(attrs={
			'placeholder': 'Ingrese su mensaje aquí',
			'rows': 6,
			}))

	class Meta:
		model = UserCita
		fields = ('name', 'email', 'phone', 'time', 'fecha_cita','message',)
#   s_time = models.TimeField(verbose_name="Hora cita")
#	subject = forms.CharField(max_length=200, required=True, 
#		widget=forms.TextInput(attrs={
#			'placeholder': 'Asunto',
			
#			}))
			
#	message = forms.CharField(max_length=1000, required=True, 
#		widget=forms.Textarea(attrs={
#			'placeholder': 'Ingrese su mensaje aquí',
#			'rows': 6,
#			}))



class UserContactForm(forms.ModelForm):

	name = forms.CharField(max_length=100, required=True,
		widget=forms.TextInput(attrs={
			'placeholder': 'Nombre y Apellido',
			
			}))

	email = forms.EmailField(max_length=254, required=True, 
		widget=forms.TextInput(attrs={
			'placeholder': 'Email',
			
			}))


	phone = forms.CharField(max_length=20, required=True, 
		widget=forms.TextInput(attrs={
			'placeholder': 'Numero Celular',
			
			}))

	subject = forms.CharField(max_length=200, required=True, 
		widget=forms.TextInput(attrs={
			'placeholder': 'Asunto',
			
			}))
			
	message = forms.CharField(max_length=1000, required=True, 
		widget=forms.Textarea(attrs={
			'placeholder': 'Ingrese su mensaje aquí',
			'rows': 6,
			}))


	class Meta:
		model = UserContact
		fields = ('name', 'email', 'phone', 'subject', 'message',)