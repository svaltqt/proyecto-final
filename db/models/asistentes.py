from pydantic import BaseModel
from db.models.ciudad import Ciudad

class Asistentes(BaseModel):
    id: int
    usuario_asist: str
    nombre_asist: str
    tipo_relacion: str
    email: str
    ciudad: list[Ciudad]