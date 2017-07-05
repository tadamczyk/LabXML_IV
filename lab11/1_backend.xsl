<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <html>
      <head>
        <link rel="stylesheet" href="style.css"/>
      </head>
      <body>
        <h2>ZOO - Ssaki</h2>
        <table>
          <tr>
            <th>Gatunek</th>
            <th>Nazwa</th>
            <th>Wiek</th>
            <th>Masa</th>
            <th>Długość</th>
            <th>Płeć</th>
            <th>Umaszczenie</th>
          </tr>

          <xsl:for-each select="Zoo/Ssaki/*">
            <xsl:sort select="Masa"/>
            <tr>
              <td><xsl:value-of select="name(..)"/></td>
              <td><xsl:value-of select="name(.)"/></td>
              <td><xsl:value-of select="Wiek"/></td>
              <td><xsl:value-of select="Masa"/></td>
              <td><xsl:value-of select="Dlugosc"/></td>
              <td><xsl:value-of select="Plec"/></td>
              <td><xsl:value-of select="Umaszczenie"/></td>
            </tr>
          </xsl:for-each>
        </table>

        <h2>ZOO - Ptaki</h2>
        <table>
          <tr>
            <th>Gatunek</th>
            <th>Nazwa</th>
            <th>Wiek</th>
            <th>Masa</th>
            <th>Długość</th>
            <th>Rozpiętość skrzydeł</th>
            <th>Płeć</th>
          </tr>

          <xsl:for-each select="Zoo/Ptaki/*">
            <xsl:sort select="Masa"/>
            <tr>
              <td><xsl:value-of select="name(..)"/></td>
              <td><xsl:value-of select="name(.)"/></td>
              <td><xsl:value-of select="Wiek"/></td>
              <td><xsl:value-of select="Masa"/></td>
              <td><xsl:value-of select="Dlugosc"/></td>
              <td><xsl:value-of select="RozpietoscSkrzydel"/></td>
              <td><xsl:value-of select="Plec"/></td>
            </tr>
          </xsl:for-each>
        </table>

        <h2>ZOO - Gady</h2>
        <table>
          <tr>
            <th>Gatunek</th>
            <th>Nazwa</th>
            <th>Wiek</th>
            <th>Masa</th>
            <th>Długość</th>
            <th>Płeć</th>
          </tr>

          <xsl:for-each select="Zoo/Gady/*">
            <xsl:sort select="Masa"/>
            <tr>
              <td><xsl:value-of select="name(..)"/></td>
              <td><xsl:value-of select="name(.)"/></td>
              <td><xsl:value-of select="Wiek"/></td>
              <td><xsl:value-of select="Masa"/></td>
              <td><xsl:value-of select="Dlugosc"/></td>
              <td><xsl:value-of select="Plec"/></td>
            </tr>
          </xsl:for-each>
        </table>

        <h2>Wyniki</h2>
        <table>
          <tr>
            <th>Średnia masa ptaków</th>
            <th>Średnia masa lądowych</th>
            <th>Średni wzrost zwierząt</th>
          </tr>

          <tr>
            <td><xsl:value-of select="sum(/Zoo/Ptaki/*/Masa) div count(/Zoo/Ptaki/*)"/></td>
            <td><xsl:value-of select="(sum(/Zoo/Ssaki/*/Masa) + sum(/Zoo/Gady/*/Masa)) div (count(/Zoo/Ssaki/*) + count(/Zoo/Gady/*))"/></td>
            <td><xsl:value-of select="sum(/Zoo/*/*/Dlugosc[@Jednostka='cm']) + (sum(/Zoo/*/*/Dlugosc[@Jednostka='mm']) div 10)"/></td>
          </tr>
        </table>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
