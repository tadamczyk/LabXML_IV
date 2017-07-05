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
      <xsl:element name="Ssaki">
        <xsl:for-each select="Zoo/*[@Gatunek='Ssaki']">
          <xsl:element name="{@Gromada}">
            <xsl:apply-templates/>
          </xsl:element>
        </xsl:for-each>
      </xsl:element>
      <xsl:element name="Ptaki">
        <xsl:for-each select="Zoo/*[@Gatunek='Ptaki']">
          <xsl:element name="{@Gromada}">
            <xsl:apply-templates/>
          </xsl:element>
        </xsl:for-each>
      </xsl:element>
      <xsl:element name="Gady">
        <xsl:for-each select="Zoo/*[@Gatunek='Gady']">
          <xsl:element name="{@Gromada}">
            <xsl:apply-templates/>
          </xsl:element>
        </xsl:for-each>
      </xsl:element>
    </Zoo>
  </xsl:template>

</xsl:stylesheet>
