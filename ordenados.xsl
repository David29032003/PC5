<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- Plantilla principal que aplica la transformación al XML -->
  <xsl:template match="/">

    <html>
      <head>
        <title>Vehículos Eléctricos - Ordenados por Marca y Año</title>
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
        <h1>Vehículos Eléctricos - Ordenados por Marca y Año</h1>

        <table>
          <tr>
            <th>Marca</th>
            <th>Modelo</th>
            <th>Año de Modelo</th>
            <th>Rango Eléctrico</th>
            <th>Estado</th>
          </tr>

          <!-- Aplicar ordenación por Marca y Año, mostrando solo los primeros 100 vehículos -->
          <xsl:apply-templates select="//row[position() &lt;= 100]">
            <xsl:sort select="make" data-type="text" order="ascending"/>
            <xsl:sort select="model_year" data-type="number" order="descending"/>
          </xsl:apply-templates>
        </table>
      </body>
    </html>

  </xsl:template>

  <!-- Plantilla para cada fila -->
  <xsl:template match="row">
    <tr>
      <td><xsl:value-of select="make" /></td>
      <td><xsl:value-of select="model" /></td>
      <td><xsl:value-of select="model_year" /></td>
      <td><xsl:value-of select="electric_range" /></td>
      <td><xsl:value-of select="state" /></td>
    </tr>
  </xsl:template>

</xsl:stylesheet>

