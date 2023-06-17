from pydantic import BaseModel

class Comentarios(BaseModel):
    texto: str
    usuario: str