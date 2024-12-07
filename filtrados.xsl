<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- Parámetros de filtro -->
  <xsl:param name="filterBrand" select="'NISSAN'" />
  <xsl:param name="filterRange" select="75" />
  <xsl:param name="filterYear" select="2013" />

  <!-- Plantilla principal que aplica la transformación al XML -->
  <xsl:template match="/">

    <html>
      <head>
        <title>Vehículos Eléctricos - Filtrados y Ordenados</title>
        <style>
          body {
            font-family: Arial, sans-serif;
          }
          table {
            width: 100%;
            border-collapse: collapse;
          }
          table, th, td {
            border: 1px solid #ddd;
          }
          th, td {
            padding: 8px;
            text-align: left;
          }
          tr:nth-child(even) {
            background-color: #f2f2f2;
          }
          tr:nth-child(odd) {
            background-color: #ffffff;
          }
        </style>
      </head>
      <body>
        <h1>Vehículos Eléctricos - Filtrados y Ordenados</h1>

        <table>
          <tr>
            <th>Marca</th>
            <th>Modelo</th>
            <th>Año de Modelo</th>
            <th>Rango Eléctrico</th>
            <th>Estado</th>
          </tr>

          <!-- Aplicar filtros y ordenación, mostrando solo los primeros 100 vehículos -->
          <xsl:apply-templates select="//row[position() &lt;= 100]">
            <xsl:sort select="make" data-type="text" order="ascending"/>
            <xsl:sort select="model_year" data-type="number" order="descending"/>
            <xsl:sort select="electric_range" data-type="number" order="descending"/>
          </xsl:apply-templates>
        </table>
      </body>
    </html>

  </xsl:template>

  <!-- Plantilla para cada fila (con filtros y ordenación) -->
  <xsl:template match="row">
    <xsl:if test="(make = $filterBrand or $filterBrand = '') and
                  (electric_range &gt;= $filterRange or $filterRange = '') and
                  (model_year = $filterYear or $filterYear = '')">
      <tr>
        <td><xsl:value-of select="make" /></td>
        <td><xsl:value-of select="model" /></td>
        <td><xsl:value-of select="model_year" /></td>
        <td><xsl:value-of select="electric_range" /></td>
        <td><xsl:value-of select="state" /></td>
      </tr>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>
