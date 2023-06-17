from fastapi import APIRouter, HTTPException, status
import psycopg2
from db.models.eventos import Evento
from db.client import db_client
from db.client import conn
from db.schemas.evento import evento_schema, eventos_schema
from bson import ObjectId


router = APIRouter(prefix="/evento",
                   tags=["evento"],
                   responses={status.HTTP_404_NOT_FOUND:{"message": "No encontrado"}})

# GET: Obtener todos los eventos
@router.get("/", response_model=list[Evento])
async def get_eventos():
    return eventos_schema(db_client.eventos.find())

# GET: Obtener un evento por su ID
@router.get("/{id}")
async def get_evento(id: str):
    return search_evento("_id", ObjectId(id))

# POST: Crear un nuevo evento
@router.post("/", response_model=Evento, status_code=status.HTTP_201_CREATED)
async def create_evento(evento: Evento):
    if search_evento("titulo", evento.titulo):
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST, detail="El evento ya existe")

    evento_dict = evento.dict(exclude={"id"})
    id = db_client.eventos.insert_one(evento_dict).inserted_id

    new_evento = search_evento("_id", id)

    return Evento(**new_evento)

# PUT: Actualizar un evento existente
@router.put("/{id}", response_model=Evento)
async def update_evento(id: str, evento: Evento):
    evento_dict = evento.dict(exclude={"id"})
    try:
        db_client.eventos.update_one(
            {"_id": ObjectId(id)}, {"$set": evento_dict}
        )
    except:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND, detail="No se pudo actualizar el evento"
        )

    return search_evento("_id", ObjectId(id))

# DELETE: Eliminar un evento por su ID
@router.delete("/{id}", status_code=status.HTTP_204_NO_CONTENT)
async def delete_evento(id: str):
    found = db_client.eventos.find_one_and_delete({"_id": ObjectId(id)})
    if not found:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND, detail="No se encontró el evento")

# Función para buscar un evento en la base de datos
def search_evento(field: str, key):
    try:
        evento = db_client.eventos.find_one({field: key})
        if evento:
            return evento_schema(evento)
        else:
            return None
    except:
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR, detail="Error al buscar el evento")


def verificar_nombre_asistente(nombre):    
    try:        
        cursor = conn.cursor()
        
        query = "SELECT nombres FROM empleados WHERE nombres = %s"
        cursor.execute(query, (nombre,))
        
        asistente = cursor.fetchone()
        existe_asistente = asistente is not None

        cursor.close()
        conn.close()

        return existe_asistente

    except (Exception, psycopg2.Error) as error:
        # Maneja cualquier error que ocurra durante la consulta
        print("Error al consultar la base de datos:", error)
        return False
