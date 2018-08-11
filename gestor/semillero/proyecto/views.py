from rest_framework import generics
from .models import Proyecto, Facultad, Grupo, Linea, Hito

from django_elasticsearch_dsl_drf.viewsets import DocumentViewSet

from django_elasticsearch_dsl_drf.filter_backends import (
    FilteringFilterBackend,
    DefaultOrderingFilterBackend,
    OrderingFilterBackend,
    SearchFilterBackend,
)

from .documents import ProjectoDocument
from .serializers import (
    ProyectoDocumentSerializer,
    ProyectoSearchDocumentSerializer,
    FacultadSerializer,
    GrupoSerializer,
    LineaSerializer,
    HitoSerializer
)


class ProyectoDocumentView(DocumentViewSet):
    """The PublisherDocument view."""

    document = ProjectoDocument
    serializer_class = ProyectoSearchDocumentSerializer
    lookup_field = 'id'
    filter_backends = [
        FilteringFilterBackend,
        OrderingFilterBackend,
        DefaultOrderingFilterBackend,
        SearchFilterBackend,
    ]
    # Define search fields
    search_fields = (
        'name',
        'linea',
        'grupo',
        'resumen',
        'abstract',
        'principal.name',
        'facultad.name'
    )
    # Define filtering fields
    filter_fields = {
        'id': None,
        'name': 'name.raw',
        'facultad': 'facultad.name.raw',
        'state': 'state.raw',
    }
    # Define ordering fields
    ordering_fields = {
        'id': None,
        'name': None,
    }
    # Specify default ordering
    ordering = ('id', 'name',)


class ProjectView(generics.ListAPIView):
    serializer_class = ProyectoDocumentSerializer

    def get_queryset(self):
        queryset = Proyecto.objects.all()
        queryset = queryset.filter(state='publicado')

        id = self.request.GET.get('id', None)
        facultad = self.request.GET.get('facultad', None)
        grupo = self.request.GET.get('grupo', None)
        linea = self.request.GET.get('linea', None)

        if self.request.GET:
            if id:
                queryset = queryset.filter(id=id)
            if facultad != None :
                queryset = queryset.filter(facultad__id__in=facultad)
            if grupo != None :
                queryset = queryset.filter(grupo=grupo)
            if linea != None :
                queryset = queryset.filter(linea=linea)
        return queryset

class FacultadView(generics.ListAPIView):
    serializer_class = FacultadSerializer

    def get_queryset(self):
        queryset = Facultad.objects.all()
        queryset = queryset.filter(proyectos__state='publicado')
        return queryset

class GrupoView(generics.ListAPIView):
    serializer_class = GrupoSerializer

    def get_queryset(self):
        queryset = Grupo.objects.all()
        queryset = queryset.filter(proyectos__state='publicado')
        return queryset

class LineaView(generics.ListAPIView):
    serializer_class = LineaSerializer

    def get_queryset(self):
        queryset = Linea.objects.all()
        # queryset = queryset.filter(proyectos__state='publicado')
        return queryset

class HitoView(generics.ListAPIView):
    serializer_class = HitoSerializer

    def get_queryset(self):
        queryset = Hito.objects.all()

        proyecto = self.request.GET.get('proyecto', None)

        if self.request.GET:
            if proyecto:
                queryset = queryset.filter(proyecto=proyecto)
        return queryset
