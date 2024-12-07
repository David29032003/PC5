<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- Plantilla principal que aplica la transformación al XML -->
  <xsl:template match="/">

    <html>
      <head>
        <title>Vehículos Eléctricos en USA</title>
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
        <h1>Lista de Vehículos Eléctricos en USA</h1>
        <table>
          <tr>
            <th>Census Tract 2020</th>
            <th>Base MSRP</th>
            <th>CAFV Type</th>
            <th>Ciudad</th>
            <th>Condado</th>
            <th>Dol Vehicle ID</th>
            <th>Rango Eléctrico</th>
            <th>Compañía Eléctrica</th>
            <th>Tipo de Vehículo</th>
            <th>Columna Geocodificada</th>
            <th>Distrito Legislativo</th>
            <th>Marca</th>
            <th>Modelo</th>
            <th>Año de Modelo</th>
            <th>Estado</th>
            <th>VIN</th>
            <th>Código Postal</th>
          </tr>

          <!-- Iterar sobre cada fila del XML -->
          <!--xsl:for-each select="//row"-->
          <!-- Iterar sobre las primeras 100 filas del XML -->
          <xsl:for-each select="//row[position() &lt;= 100]">
            <tr>
              <!-- Ajustar las rutas a las etiquetas según las columnas del XML -->
              <td><xsl:value-of select="_2020_census_tract" /></td>
              <td><xsl:value-of select="base_msrp" /></td>
              <td><xsl:value-of select="cafv_type" /></td>
              <td><xsl:value-of select="city" /></td>
              <td><xsl:value-of select="county" /></td>
              <td><xsl:value-of select="dol_vehicle_id" /></td>
              <td><xsl:value-of select="electric_range" /></td>
              <td><xsl:value-of select="electric_utility" /></td>
              <td><xsl:value-of select="ev_type" /></td>
              <td><xsl:value-of select="geocoded_column" /></td>
              <td><xsl:value-of select="legislative_district" /></td>
              <td><xsl:value-of select="make" /></td>
              <td><xsl:value-of select="model" /></td>
              <td><xsl:value-of select="model_year" /></td>
              <td><xsl:value-of select="state" /></td>
              <td><xsl:value-of select="vin_1_10" /></td>
              <td><xsl:value-of select="zip_code" /></td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>

  </xsl:template>

</xsl:stylesheet>

