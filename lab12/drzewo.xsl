<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml"/>

  <xsl:template match="*">
    <xsl:copy>
      <xsl:attribute name="A.Poziom">
        <xsl:value-of select="count(ancestor::*)"/>
      </xsl:attribute>
      <xsl:attribute name="B.Bliżniacy">
        <xsl:value-of select="count(following-sibling::*[1]) + count(preceding-sibling::*[1])"/>
      </xsl:attribute>
      <xsl:attribute name="C.Rodzeństwo">
        <xsl:value-of select="count(following-sibling::*) + count(preceding-sibling::*)"/>
      </xsl:attribute>
      <xsl:attribute name="D.Dzieci">
        <xsl:value-of select="count(child::*)"/>
      </xsl:attribute>
      <xsl:attribute name="E.Potomkowie">
        <xsl:value-of select="count(descendant::*)"/>
      </xsl:attribute>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
