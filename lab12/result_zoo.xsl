<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:output method="html"/>

  <xsl:template match="Zoo">
    <tr>
      <th>Gromada</th>
      <th>Gatunek</th>
    </tr>
    <xsl:for-each select="*/*">
      <tr>
        <td>
          <xsl:value-of select="name(..)"/>
        </td>
        <td>
          <xsl:value-of select="name(.)"/>
        </td>
      </tr>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="/">
    <html>
      <head>
        <link rel="stylesheet" href="style.css"/>
      </head>
      <body>
        <table>
          <xsl:apply-templates select="Zoo"/>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
