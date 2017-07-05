<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:resultXSL="emptySpace">
  <xsl:namespace-alias stylesheet-prefix="resultXSL" result-prefix="xsl"/>

  <xsl:template match="/">
    <resultXSL:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
      <resultXSL:output method="html"/>
      <xsl:if test="count(Zoo/*/*) &gt; 5">
        <xsl:call-template name="basic"/>
      </xsl:if>
      <xsl:if test="count(Zoo/*/*) &gt; 1 and count(Zoo/*/*) &lt;= 5">
        <xsl:call-template name="more"/>
      </xsl:if>
      <xsl:if test="count(Zoo/*/*) = 1">
        <xsl:call-template name="full"/>
      </xsl:if>
      <resultXSL:template match="/">
        <html>
          <head>
            <link rel="stylesheet" href="style.css"/>
          </head>
          <body>
            <table>
              <resultXSL:apply-templates select="Zoo"/>
            </table>
          </body>
        </html>
      </resultXSL:template>
    </resultXSL:stylesheet>
  </xsl:template>

  <xsl:template name="basic">
    <resultXSL:template match="Zoo">
      <tr>
        <th>Gromada</th>
        <th>Gatunek</th>
      </tr>
      <resultXSL:for-each select="*/*">
        <tr>
          <td><resultXSL:value-of select="name(..)"/></td>
          <td><resultXSL:value-of select="name(.)"/></td>
        </tr>
      </resultXSL:for-each>
    </resultXSL:template>
  </xsl:template>

  <xsl:template name="more">
    <resultXSL:template match="Zoo">
      <tr>
        <th>Gromada</th>
        <th>Gatunek</th>
        <th>Wiek</th>
        <th>Masa</th>
      </tr>
      <resultXSL:for-each select="*/*">
        <tr>
          <td><resultXSL:value-of select="name(..)"/></td>
          <td><resultXSL:value-of select="name(.)"/></td>
          <td><resultXSL:value-of select="Wiek"/></td>
          <td><resultXSL:value-of select="Masa"/></td>
        </tr>
      </resultXSL:for-each>
    </resultXSL:template>
  </xsl:template>

  <xsl:template name="full">
    <resultXSL:template match="Zoo">
      <tr>
        <th>Gromada</th>
        <th>Gatunek</th>
        <th>Wiek</th>
        <th>Masa</th>
        <th>Dlugosc</th>
        <th>Plec</th>
      </tr>
      <resultXSL:for-each select="*/*">
        <tr>
          <td><resultXSL:value-of select="name(..)"/></td>
          <td><resultXSL:value-of select="name(.)"/></td>
          <td><resultXSL:value-of select="Wiek"/></td>
          <td><resultXSL:value-of select="Masa"/></td>
          <td><resultXSL:value-of select="Dlugosc"/></td>
          <td><resultXSL:value-of select="Plec"/></td>
        </tr>
      </resultXSL:for-each>
    </resultXSL:template>
  </xsl:template>

</xsl:stylesheet>
