from pydantic import BaseModel


class Lugar(BaseModel):
    nombre: str
    direccion: str
    ciudad: str