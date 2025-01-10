from ninja import NinjaAPI
from scalar_django_ninja import ScalarViewer
from shortener.api import shortener_router

api = NinjaAPI(
    version="1.0.0",
    title="Encurtador de Link",
    description="API para encurtar links",
    docs=ScalarViewer(),
    docs_url="/docs/"
)
api.add_router('', shortener_router)