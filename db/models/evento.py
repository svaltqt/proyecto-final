from pydantic import BaseModel
from datetime import datetime
from db.models.lugar import Lugar
from db.models.asistentes import Asistentes
from db.models.comentarios import Comentarios

class Evento(BaseModel):
    id: str | None
    titulo: str
    descripcion: str
    categoria: str
    facultad: str
    fecha: datetime
    lugar: list[Lugar]
    asistentes: list[Asistentes]
    comentarios: list[Comentarios]

### Json del modelo

{
  "Evento": {
    "titulo": "string",
    "descripcion": "string",
    "categoria": "string",
    "facultad": "string",
    "fecha": "datetime",
    "lugar_de_evento": [
      {
        "nombre": "string",
        "direccion": "string",
        "ciudad": "string"
      }
    ],
    "asistentes": [
      {
        "id": 0,
        "usuario_asist": "string",
        "nombre_asist": "string",
        "tipo_relacion": "string",
        "email": "string",
        "ciudad": [
          {
            "nombre": "string",
            "departamento": "string",
            "pais": "string"
          }
        ]
      }
    ],
    "comentarios": [
      {
        "texto": "string",
        "usuario": "string"
      }
    ]
  }
}






