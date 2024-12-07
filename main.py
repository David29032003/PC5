from lxml import etree

"""
# Cargar XML desde url
url = "https://data.wa.gov/api/views/f6w7-q2d2/rows.xml?accessType=DOWNLOAD"
xml_data = etree.parse(url)
"""

# Cargar XML desde un archivo local
with open("vehiculos_electricos.xml", "r") as f:
    xml_data = f.read()

# Cargar los XSLT para cada transformación
xslt_files = {
    "transformacion": "transformacion.xsl",  # Para filas alternantes (pregunta 1)
    "datos_relevantes": "datos_relevantes.xsl",  # Para los datos relevantes (pregunta 2)
    "ordenados": "ordenados.xsl",  # Para ordenación por marca y año (pregunta 2)
    "filtrados": "filtrados.xsl",  # Para filtrado y ordenación (pregunta 2)
}


# Función para realizar la transformación y guardar el resultado
def transform_xml_to_html(xml_data, xslt_file, output_file):
    # Cargar el archivo XSLT como un árbol
    xslt_tree = etree.parse(xslt_file)

    # Crear el transformador XSLT con el árbol cargado
    transform = etree.XSLT(xslt_tree)

    # Realizar la transformación del XML y obtener un árbol HTML
    xml_tree = etree.fromstring(xml_data)
    html_tree = transform(xml_tree)

    # Guardar el resultado en un archivo HTML
    with open(output_file, "wb") as f:
        f.write(etree.tostring(html_tree, pretty_print=True))

    print(f"Transformación completada. Resultado guardado en {output_file}.")


# Transformar el XML para cada archivo XSLT y guardar los resultados
for key, xslt_file in xslt_files.items():
    output_file = f"{key}.html"
    transform_xml_to_html(xml_data, xslt_file, output_file)
