from pydantic import BaseModel


class Evento(BaseModel):
    id: str | None
    titulo: str    
    descripcion: str
    nombre: str 
    apellido: str 
    TipoEmpleado: str
    facultad: str 
    lugar: str
    ciudad: str    
    email: str
    comentarios: str | None