from rest_framework import serializers
import logging
from django_elasticsearch_dsl_drf.serializers import DocumentSerializer

from .models import Proyecto, Facultad, Hito, Linea, Grupo
from .documents import ProjectoDocument

logger = logging.getLogger(__name__)

class ClasificatorSerializer(serializers.Serializer):
    name = serializers.CharField(read_only=True)

class FacultadSerializer(serializers.Serializer):
    id = serializers.IntegerField(read_only=True)
    name = serializers.CharField(read_only=True)
    proyectos = serializers.StringRelatedField(many=True)

    class Meta:
        model = Facultad
        fields = ('name', 'id', 'proyectos')

class GrupoSerializer(serializers.Serializer):
    id = serializers.IntegerField(read_only=True)
    name = serializers.CharField(read_only=True)
    proyectos = serializers.StringRelatedField(many=True)

    class Meta:
        model = Grupo
        fields = ('name', 'id', 'proyectos')

class LineaSerializer(serializers.Serializer):
    id = serializers.IntegerField(read_only=True)
    name = serializers.CharField(read_only=True)
    proyectos = serializers.StringRelatedField(many=True)

    class Meta:
        model = Linea
        fields = ('name', 'id', 'proyectos')

class UserSerializer(serializers.Serializer):
    name = serializers.CharField(read_only=True)
    photo = serializers.FileField(read_only=True)

class CompromisoSerializer(serializers.Serializer):
    name = serializers.CharField(read_only=True)
    finalizado = serializers.BooleanField()

class DocumentoSerializer(serializers.Serializer):
    title = serializers.CharField(read_only=True)
    file = serializers.FileField(read_only=True)

class HitoSerializer(serializers.Serializer):
    id = serializers.IntegerField(read_only=True)
    name = serializers.CharField(read_only=True)
    descripcion = serializers.CharField(read_only=True)
    fecha = serializers.DateField()
    color = serializers.CharField(read_only=True)
    icon = serializers.CharField(read_only=True)


class ProyectoDocumentSerializer(serializers.Serializer):
    id = serializers.IntegerField(read_only=True)
    name = serializers.CharField(read_only=True)
    resumen = serializers.CharField(read_only=True)
    abstract = serializers.CharField(read_only=True)
    justificacion = serializers.CharField(read_only=True)
    objetivos = serializers.CharField(read_only=True)
    metas = serializers.CharField(read_only=True)
    inicio = serializers.DateField(read_only=True)
    fin = serializers.DateField(read_only=True)
    dificultad = serializers.CharField(read_only=True)
    sector = ClasificatorSerializer(required=False, many=True)
    ambito = ClasificatorSerializer(required=False, many=True)
    orientacion = ClasificatorSerializer(required=False, many=True)
    influencia = serializers.CharField(read_only=True)
    principal = UserSerializer(required=False)
    investigadores = UserSerializer(required=False, many=True)
    state = serializers.CharField(read_only=True)
    linea = serializers.CharField(read_only=True)
    grupo = serializers.CharField(read_only=True)
    facultad = ClasificatorSerializer(required=False, many=True)
    compromiso = CompromisoSerializer(many=True)
    documento = DocumentoSerializer(many=True)
    hito = HitoSerializer(many=True)

    class Meta(object):
        model = Proyecto


class ProyectoSearchDocumentSerializer(DocumentSerializer):

    highlight = serializers.SerializerMethodField()

    class Meta(object):
        document = ProjectoDocument
        fields = (
            'id',
            'name',
            'grupo',
            'linea',
            'facultad',
            'principal',
            'highlight',
            'state',
            'null_field',
        )

    def get_highlight(self, obj):
        if hasattr(obj.meta, 'highlight'):
            return obj.meta.highlight.__dict__['_d_']
        return {}


