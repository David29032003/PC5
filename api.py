from lxml import etree
import json
from fastapi import FastAPI, Query, HTTPException
from fastapi.responses import JSONResponse

# Crear la aplicación FastAPI
app = FastAPI()

# Cargar el archivo XML y XSLT
xml_file = 'vehiculos_electricos.xml'
xslt_file = 'transformacion_json.xsl'

# Realizar la transformación y obtener los datos JSON
def transformar_xml_a_json():
    # Cargar el XML y XSLT
    xml_tree = etree.parse(xml_file)
    xslt_tree = etree.parse(xslt_file)

    # Crear el transformador XSLT
    transform = etree.XSLT(xslt_tree)

    # Realizar la transformación
    json_result = transform(xml_tree)

    # Convertir el resultado de la transformación en una cadena y luego a JSON
    json_string = str(json_result)
    json_data = json.loads(json_string)

    return json_data

# Endpoint para devolver los datos JSON
@app.get("/vehiculos")
async def obtener_vehiculos(
    page: int = Query(1, ge=1),  # Página, debe ser mayor o igual a 1
    size: int = Query(10, ge=1, le=100)  # Tamaño de la página, entre 1 y 100
):
    # Obtener los datos transformados
    json_data = transformar_xml_a_json()

    # Calcular el número total de vehículos y páginas
    total_vehiculos = len(json_data)
    total_paginas = (total_vehiculos + size - 1) // size  # Redondear hacia arriba

    # Validar que la página solicitada no sea mayor al total de páginas
    if page > total_paginas:
        raise HTTPException(status_code=400, detail="Página solicitada fuera de rango")

    # Calcular los índices de inicio y fin para la paginación
    start_index = (page - 1) * size
    end_index = start_index + size

    # Obtener los vehículos correspondientes a la página solicitada
    paginated_data = json_data[start_index:end_index]

    # Respuesta con los metadatos de paginación y los vehículos
    response = {
        "total_vehiculos": total_vehiculos,
        "total_paginas": total_paginas,
        "pagina_actual": page,
        "tamaño_pagina": size,
        "vehiculos": paginated_data
    }

    return JSONResponse(content=response)

# Iniciar el servidor
if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="127.0.0.1", port=8000)

