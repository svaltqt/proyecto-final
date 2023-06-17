def evento_schema(evento) -> dict:
    return {"id": str(evento["_id"]),
            "titulo": evento["titulo"],
            "descripcion": evento["descripcion"],
            "nombre": evento["nombre"],
            "apellido": evento["apellido"],
            "TipoEmpleado": evento["TipoEmpleado"], 
            "facultad": evento["facultad"],
            "lugar": evento["lugar"], 
            "ciudad": evento["ciudad"],          
            "email": evento["email"],
            "comentarios": evento["comentarios"]
            }

def eventos_schema(eventos) -> list:
    return [evento_schema(evento) for evento in eventos]