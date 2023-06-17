from fastapi import APIRouter, HTTPException, status
import psycopg2
from db.models.eventos import Evento
from db.client import db_client
from db.client import conn
from db.schemas.evento import evento_schema, eventos_schema
from bson import ObjectId

cursor = conn.cursor()

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
    # Extraer solo el nombre de los asistentes
    nombre_email = evento.email

    # Verificar si el evento ya existe en MongoDB
    if search_evento("titulo", evento.titulo):
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST, detail="El evento ya existe")

    # Consultar en la base de datos PostgreSQL si el nombre de asistente existe
    query = "SELECT email FROM empleados WHERE email = %s"
    cursor.execute(query, (nombre_email,))
    empleado_existente = cursor.fetchone()

    # Una vez obtenemos el nombre de datos PostgreSQL, verificamos si este está en la base de datos
    # si no está, ingresar datos con normalidad en la base de datos
    if empleado_existente:
        # Lista de querys necesarios para la modificación de datos PostgreSQL
       
        empleado_info = empleados_todo(nombre_email)

        nombre_empleado = empleado_info[0]
        apellido_empleado = empleado_info[1]
        tipo_empleado = empleado_info[2]
        facultad_empleado = empleado_info[3]
        ciudad_evento = empleado_info[4]
        lugar_evento = empleado_info[5]

        # Creamos la información a enviar
        evento_dict = evento.dict(exclude={"id"})
        
        evento_dict["nombre"] = nombre_empleado
        evento_dict["apellido"] = apellido_empleado
        evento_dict["TipoEmpleado"] = tipo_empleado
        evento_dict["facultad"] = facultad_empleado
        evento_dict["ciudad"] = ciudad_evento
        evento_dict["lugar"] = lugar_evento

        # Enviar la información a la base de datos en la nube MongoDBAtlas
        id = db_client.eventos.insert_one(evento_dict).inserted_id

        new_evento = search_evento("_id", id)

        return Evento(**new_evento)
    else:
        # Crear la información a enviar sin modificaciones
        evento_dict = evento.dict(exclude={"id"})

        # Enviar la información a la base de datos en la nube MongoDBAtlas
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


def empleados_todo(correo):    
    cursor = conn.cursor()
    query = ''' SELECT e.nombres, e.apellidos, tipoe.nombre as TEmpleado, f.nombre as Facultad, ciu.nombre as ciudad, se.nombre as Sede
                FROM empleados as e
                JOIN facultades as f
                ON e.id_facultades = f._id
                JOIN tipos_contratacion as tiposc
                ON e.tipo_contratacion = tiposc._id
                JOIN tipos_empleado as tipoe
                ON e.tipo_empleado = tipoe._id
                JOIN sedes as se
                ON e.id_sedes = se._id
                JOIN ciudades as ciu
                ON se.cod_ciudades = ciu._id
                WHERE email =%s'''
    
    cursor.execute(query, (correo,))
    empleado_info = cursor.fetchone()

    conn.close()

    return empleado_info

    
