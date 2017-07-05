<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <html>
      <head>
        <link rel="stylesheet" href="style.css"/>
      </head>
      <body>
        <h2>Repertuar</h2>
        <table>
          <tr>
            <th>Tytuł</th>
            <th>Reżyser</th>
            <th>Gatunek</th>
            <th>Rok produkcji</th>
          </tr>

          <xsl:for-each select="Repertuar/Film">
            <tr>
              <xsl:choose>
                <xsl:when test="MinWiek &gt; 17.9">
                  <td class="vat">
                    <xsl:value-of select="Tytul"/></td>
                </xsl:when>
                <xsl:when test="MinWiek &gt; 15.9">
                  <td class="over16">
                    <xsl:value-of select="Tytul"/></td>
                </xsl:when>
                <xsl:when test="MinWiek &gt; 11.9">
                  <td class="over12">
                    <xsl:value-of select="Tytul"/></td>
                </xsl:when>
                <xsl:otherwise>
                  <td class="novat">
                    <xsl:value-of select="Tytul"/></td>
                </xsl:otherwise>
              </xsl:choose>
              <td><xsl:value-of select="Rezyser/@Imie"/>&#160;<xsl:value-of select="Rezyser/@Nazwisko"/></td>
              <td><xsl:value-of select="Gatunek"/></td>
              <td><xsl:value-of select="RokProdukcji"/></td>
            </tr>
          </xsl:for-each>

        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
