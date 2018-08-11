from elasticsearch_dsl import analyzer

__all__ = (
    'html_strip',
)

html_strip = analyzer(
    'html_strip',
    tokenizer="standard",
    filter=["standard", "lowercase", "stop", "snowball", "asciifolding"],
    char_filter=["html_strip"]
)

