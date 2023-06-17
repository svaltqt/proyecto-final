def evento_schema(evento) -> dict:
    return {"id": str(evento["_id"]),
            "titulo": evento["titulo"],
            "descripcion": evento["descripcion"],
            "categoria": evento["categoria"],
            "lugar": evento["lugar"],
            "asistentes": evento["asistentes"],
            "comentarios": evento["comentarios"]}

def eventos_schema(eventos) -> list:
    return [evento_schema(evento) for evento in eventos]