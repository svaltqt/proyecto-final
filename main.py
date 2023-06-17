# Inicia el servidor: uvicorn main:app --reload
# Detener el server: CTRL+C 
# Documentacion con Swagger: http://127.0.0.1:8000/docs
# Documentacion con Redocly: http://127.0.0.1:8000/redoc


from fastapi import FastAPI
from routers import eventos
from fastapi.staticfiles import StaticFiles
app = FastAPI(
        title="REST API MONGODB + POSTGRES",
        description="Simple Rest API con sistema híbrido",
        version="0.0.1"
)


# Routers
app.include_router(eventos.router)






