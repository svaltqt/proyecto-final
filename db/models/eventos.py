from pydantic import BaseModel


class Evento(BaseModel):
    id: str | None
    titulo: str    
    descripcion: str
    categoria: str
    lugar: str | None
    asistentes: str
    comentarios: str