<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <html>
      <head>
        <link rel="stylesheet" href="style.css"/>
      </head>
      <body>
        <h2>Ogłoszenia - SAMOCHÓD</h2>
        <table>
          <tr>
            <th>Producent</th>
            <th>Model</th>
            <th>Silnik</th>
            <th>Kolor</th>
            <th>Liczba miejsc</th>
            <th>Cena</th>
          </tr>

          <xsl:for-each select="Ogłoszenie/Samochód">
            <tr>
              <td><xsl:value-of select="Producent"/></td>
              <td><xsl:value-of select="Model"/></td>
              <td><xsl:value-of select="Silnik/Pojemność"/></td>
              <td><xsl:value-of select="Kolor"/></td>
              <td><xsl:value-of select="LiczbaMiejsc"/></td>
              <td><xsl:value-of select="Cena"/></td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
