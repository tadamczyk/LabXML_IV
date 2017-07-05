<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml"/>

  <xsl:template match="node()|@*">
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="/">
    <Zoo>
      <xsl:for-each select="Zoo/*/*">
        <Zwierz Gatunek="{name(..)}" Gromada="{name(.)}">
          <xsl:apply-templates/>
        </Zwierz>
      </xsl:for-each>
    </Zoo>
  </xsl:template>

</xsl:stylesheet>
