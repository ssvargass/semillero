from django.contrib import admin
from fsm_admin.mixins import FSMTransitionMixin
from reversion.admin import VersionAdmin
from jet.admin import CompactInline

from .models import Proyecto, Dificultad, Sector, Ambito, Orientacion, Influencia, Hito, Documento, Grupo, Linea, Facultad, Compromiso

class DocumentoInline(CompactInline):
    model = Documento
    extra = 1

class HitoInline(CompactInline):
    model = Hito
    extra = 1

class CompromisoInline(CompactInline):
    model = Compromiso
    extra = 1

@admin.register(Proyecto)
class DocumentoAdmin(FSMTransitionMixin, VersionAdmin, admin.ModelAdmin):

    list_display = (
        'name',
        'created',
        'state',
    )

    list_filter = (
        'created_by',
        'created',
        'state',
    )

    search_fields = ['name']

    readonly_fields = (
        'created',
        'created_by',
        'state',
    )

    fsm_field = ['state', ]

    fieldsets = (
        ('General', {
            'fields': ('name', 'grupo', 'linea', 'facultad', 'resumen', 'abstract', 'justificacion', 'objetivos', 'metas')
        }),
        ('Fechas', {
            'fields': ('inicio', 'fin')
        }),
        ('Clasificación', {
            'fields': ('dificultad', 'sector', 'ambito', 'orientacion', 'influencia'),
        }),
        ('Personal', {
            'fields': ('principal', 'investigadores'),
        }),
    )


    inlines = [HitoInline, DocumentoInline, CompromisoInline]


admin.site.register(Dificultad)
admin.site.register(Sector)
admin.site.register(Ambito)
admin.site.register(Orientacion)
admin.site.register(Influencia)
admin.site.register(Grupo)
admin.site.register(Linea)
admin.site.register(Facultad)

# admin.site.register(Documento)
# admin.site.register(Hito)
