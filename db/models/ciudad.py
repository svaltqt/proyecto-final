from pydantic import BaseModel

class Ciudad(BaseModel):
    nombre: str
    departamento: str
    pais: str