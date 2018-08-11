from django_elasticsearch_dsl import DocType, Index, fields
from django_elasticsearch_dsl_drf.compat import KeywordField, StringField
from elasticsearch_dsl import analyzer
from elasticsearch_dsl.analysis import token_filter


from .models import Proyecto
from .analyzers import html_strip

edge_ngram_completion_filter = token_filter(
    'edge_ngram_completion_filter',
    type="edge_ngram",
    min_gram=1,
    max_gram=20
)


edge_ngram_completion = analyzer(
    "edge_ngram_completion",
    type="custom",
    tokenizer="standard",
    filter=["lowercase", edge_ngram_completion_filter]
)

# Name of the Elasticsearch index
proyecto = Index('proyectos')
# See Elasticsearch Indices API reference for available settings
proyecto.settings(
    number_of_shards=1,
    number_of_replicas=1
)

@proyecto.doc_type
class ProjectoDocument(DocType):
    id = fields.IntegerField(attr='id')
    name = StringField(
        analyzer=html_strip,
        fields={
            'raw': KeywordField(),
            'suggest': fields.CompletionField(),
            'edge_ngram_completion': StringField(
                analyzer=edge_ngram_completion
            ),
        }
    )
    resumen = StringField(
        analyzer=html_strip,
        fields={
            'raw': KeywordField(),
            'suggest': fields.CompletionField(),
            'edge_ngram_completion': StringField(
                analyzer=edge_ngram_completion
            ),
        }
    )
    abstract = StringField(
        analyzer=html_strip,
        fields={
            'raw': KeywordField(),
            'suggest': fields.CompletionField(),
            'edge_ngram_completion': StringField(
                analyzer=edge_ngram_completion
            ),
        }
    )
    justificacion = StringField(
        analyzer=html_strip,
        fields={
            'raw': KeywordField(),
        }
    )
    objetivos = StringField(
        analyzer=html_strip,
        fields={
            'raw': KeywordField(),
        }
    )
    metas = StringField(
        analyzer=html_strip,
        fields={
            'raw': KeywordField(),
        }
    )
    state = StringField(
        analyzer=html_strip,
        fields={
            'raw': KeywordField(),
        }
    )
    inicio = fields.StringField(attr='inicio')
    fin = fields.StringField(attr='fin')
    dificultad = fields.StringField(attr='dificultad.name')
    sector = fields.NestedField(properties={ 'name': fields.TextField(), })
    ambito = fields.NestedField(properties={ 'name': fields.TextField(), })
    orientacion = fields.NestedField(properties={'name': fields.TextField(), })
    influencia = fields.StringField(attr='influencia.name')
    grupo = fields.StringField(attr='grupo.name')
    linea = fields.StringField(attr='linea.name')
    principal = fields.ObjectField(properties={'name': fields.TextField(), })
    investigadores = fields.NestedField(properties={'name': fields.TextField(), })

    facultad = fields.NestedField(
        properties={
            'name': StringField(
                analyzer=html_strip,
                fields={
                    'raw': KeywordField(),
                    'suggest': fields.CompletionField(),
                }
            ),
        }
    )

    # null_field = StringField(attr='null_field_indexing')
    class Meta:
        model = Proyecto # The model associated with this DocType

