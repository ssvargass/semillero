import datetime
from django.db import models
from django_fsm import FSMField, transition
from django.conf import settings
from tinymce.models import HTMLField
from semillero.users.models import User
from semillero.proyecto.utils import get_current_user



import urllib.parse


class State(object):
    """
    Constants to represent the `state`s of the PublishableModel
    """
    DRAFT = 'borrador'
    REVIEW = 'revisado'
    PUBLISHED = 'publicado'
    DELETED = 'deleted'

    CHOICES = (
        (DRAFT, DRAFT),
        (PUBLISHED, PUBLISHED),
    )

class Dificultad(models.Model):
    name = models.CharField(max_length=120, verbose_name='Nombre de la dificultad')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "Dificultad"
        verbose_name_plural = "Dificultades"

class Sector(models.Model):
    name = models.CharField(max_length=120, verbose_name='Nombre del sector')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "Sector"
        verbose_name_plural = "Sectores"

class Ambito(models.Model):
    name = models.CharField(max_length=120, verbose_name='Nombre del ámbito')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "Ámbito"
        verbose_name_plural = "Ámbitos"

class Orientacion(models.Model):
    name = models.CharField(max_length=120, verbose_name='Nombre de la orientación')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "Orientación"
        verbose_name_plural = "Orientaciones"

class Influencia(models.Model):
    name = models.CharField(max_length=120, verbose_name='Nombre de la influencia')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "Influencia"
        verbose_name_plural = "Influencias"

class Grupo(models.Model):
    name = models.CharField(max_length=120, verbose_name='Nombre del grupo')
    lider = models.ForeignKey(User, models.SET_NULL, null=True, verbose_name='Líder de grupo',
                                  related_name='lider')
    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "Grupo"
        verbose_name_plural = "Grupos"

class Linea(models.Model):
    name = models.CharField(max_length=120, verbose_name='Nombre de la línea de investigación')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "Línea"
        verbose_name_plural = "Líneas"

class Facultad(models.Model):
    name = models.CharField(max_length=120, verbose_name='Nombre de la facultad/Centro')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "Facultad"
        verbose_name_plural = "Facultades"


class Proyecto(models.Model):
    # General
    name = models.CharField(max_length=255, verbose_name='Nombre del proyecto')
    grupo = models.ForeignKey(Grupo, models.SET_NULL, null=True, default=None,
                                   verbose_name='Grupo', related_name='proyectos')
    linea = models.ForeignKey(Linea, models.SET_NULL, null=True, default=None,
                              verbose_name='Línea', related_name='proyectos')
    facultad = models.ManyToManyField(Facultad, blank=True, related_name="proyectos",
                                         verbose_name='Facultad')
    resumen = HTMLField(blank=True, null=True, verbose_name="Resumen")
    abstract = HTMLField(blank=True, null=True, verbose_name="Abstract")
    justificacion = HTMLField(blank=True, null=True, verbose_name="Justificación")
    objetivos = HTMLField(blank=True, null=True, verbose_name="Objetivos")
    metas = HTMLField(blank=True, null=True, verbose_name="Metas")

    # Fechas
    inicio = models.DateField(blank=True, null=True, verbose_name='Inicio')
    fin = models.DateField(blank=True, null=True, verbose_name='Fin')

    # Clasificacion
    dificultad = models.ForeignKey(Dificultad, models.SET_NULL, null=True, blank=True, default=None,
                                   verbose_name='Nivel de dificultad', related_name='dificultad')
    sector = models.ManyToManyField(Sector, blank=True, related_name="sector", verbose_name='Sector de la industria')
    ambito = models.ManyToManyField(Ambito, blank=True, related_name="ambito", verbose_name='Ámbito')
    orientacion = models.ManyToManyField(Orientacion, blank=True, related_name="orientacion", verbose_name='Orientación')
    influencia = models.ForeignKey(Influencia, models.SET_NULL, null=True, blank=True, default=None,
                                   verbose_name='Influencia', related_name='influencia')

    # Personal
    principal = models.ForeignKey(User, models.SET_NULL, null=True, verbose_name='Investigador Principal',
                                  related_name='principal')
    investigadores = models.ManyToManyField(settings.AUTH_USER_MODEL, blank=True, verbose_name='Investigadores', related_name='investigadores')

    # Publicacion
    created = models.DateTimeField(auto_now_add=True)
    created_by = models.ForeignKey(settings.AUTH_USER_MODEL, models.SET_NULL, null=True, related_name='created_by')

    state = FSMField(
        default=State.DRAFT,
        verbose_name='Publication State',
        choices=State.CHOICES,
        protected=True,
    )

    def save(self, *args, **kwargs):
        user = get_current_user()
        if user and user.is_authenticated:
            if not self.id:
                self.created_by = user
        super(Proyecto, self).save(*args, **kwargs)

    class Meta:
        permissions = (
            ("can_publish", "Can publish project"),
        )
        verbose_name = "Proyecto"
        verbose_name_plural = "Proyectos"

    def __str__(self):
        return self.name

    def __unicode__(self):
        return self.name

    def get_absolute_url(self):
        name = self.name.lower()
        return "/proyecto/" + urllib.parse.quote_plus(name)

    @property
    def percentage(self):
        now = datetime.date.today()
        diff = (self.fin - self.inicio).days
        today = (now - self.inicio).days
        percentage = (today * 100) / diff if (now < self.fin) else 100
        return percentage


    ########################################################
    # Workflow (state) Transitions

    @transition(field=state, source=State.PUBLISHED, target=State.DRAFT, custom=dict(admin=True))
    def ajustar(self):
        """
        Publish the object.
        """

    @transition(field=state, source=State.DRAFT, target=State.PUBLISHED, permission="proyecto.can_publish", custom=dict(admin=True))
    def publicar(self):
        """
        Revert to the approved state
        """


class Documento(models.Model):
    title = models.CharField(max_length=120, verbose_name='Titulo del documento')
    descripcion = HTMLField(blank=True, null=True, verbose_name="Descripción")
    file = models.FileField(upload_to='uploads/', blank=True, null=True)
    proyecto = models.ForeignKey(Proyecto, models.SET_NULL, null=True, related_name="documento")

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = "Documento"
        verbose_name_plural = "Documentos"


class Hito(models.Model):
    name = models.CharField(max_length=120, verbose_name='Nombre de la hito')
    descripcion = HTMLField(blank=True, null=True, verbose_name="Descripción")
    fecha = models.DateField(verbose_name='Fecha')
    proyecto = models.ForeignKey(Proyecto, models.SET_NULL, null=True, related_name="hito")
    color = models.CharField(blank=True, null=True, max_length=20, verbose_name='Color',
                             help_text="Agregar el valor definido en back, "
                                       "ejemplo: red <a target='_blank' href='https://vuecidity.wemakesites.net/style/colors'>Colores</a>.")
    icon = models.CharField(blank=True, null=True, max_length=20, verbose_name='Icono',
                            help_text="Agregar el nombre del icono, ejemplo: access_time <a target='_blank' href='https://materializecss.com/icons.html'>Iconos</a>.")

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "Hito"
        verbose_name_plural = "Hitos"


class Compromiso(models.Model):
    name = models.CharField(max_length=120, verbose_name='Título')
    pacto = models.DateField(blank=True, null=True, verbose_name='Fecha pactada')
    entrega = models.DateField(blank=True, null=True, verbose_name='Fecha de entrega')
    descripcion = HTMLField(blank=True, null=True, verbose_name="Descripción")
    file = models.FileField(upload_to='uploads/', blank=True, null=True)
    finalizado = models.BooleanField(blank=True, verbose_name="Finalizado")
    proyecto = models.ForeignKey(Proyecto, models.SET_NULL, null=True, related_name="compromiso")

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "Compromiso"
        verbose_name_plural = "Compromisos"














