<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="text" encoding="UTF-8" />

  <!-- Plantilla principal que aplica la transformación al XML -->
  <xsl:template match="/">

    <!-- Iniciar el array JSON -->
    [
      <!-- Iterar sobre las filas del XML -->
      <xsl:for-each select="//row">
        <!-- Crear un objeto JSON para cada fila -->
        {
          "census_tract_2020": "<xsl:value-of select='_2020_census_tract'/>",
          "base_msrp": "<xsl:value-of select='base_msrp'/>",
          "cafv_type": "<xsl:value-of select='cafv_type'/>",
          "city": "<xsl:value-of select='city'/>",
          "county": "<xsl:value-of select='county'/>",
          "dol_vehicle_id": "<xsl:value-of select='dol_vehicle_id'/>",
          "electric_range": "<xsl:value-of select='electric_range'/>",
          "electric_utility": "<xsl:value-of select='electric_utility'/>",
          "ev_type": "<xsl:value-of select='ev_type'/>",
          "geocoded_column": "<xsl:value-of select='geocoded_column'/>",
          "legislative_district": "<xsl:value-of select='legislative_district'/>",
          "make": "<xsl:value-of select='make'/>",
          "model": "<xsl:value-of select='model'/>",
          "model_year": "<xsl:value-of select='model_year'/>",
          "state": "<xsl:value-of select='state'/>",
          "vin": "<xsl:value-of select='vin_1_10'/>",
          "zip_code": "<xsl:value-of select='zip_code'/>"
        }
        <!-- Separar objetos por coma, excepto el último -->
        <xsl:if test="position() != last()">,</xsl:if>
      </xsl:for-each>
    ]
  </xsl:template>

</xsl:stylesheet>
