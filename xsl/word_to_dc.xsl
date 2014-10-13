<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/" >

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <oai_dc:dc xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/"
            xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/oai_dc/ http://www.openarchives.org/OAI/2.0/oai_dc.xsd">
            <xsl:apply-templates select="word" />
        </oai_dc:dc>
    </xsl:template>
    
    <xsl:template match="word">
        <dc:title>
        <xsl:apply-templates select="spelling"/>
        </dc:title>
        <xsl:apply-templates select="definition" />
    </xsl:template>

    <xsl:template match="spelling">
            <xsl:value-of select="."/>
        <xsl:if test="position() != last()">
            <xsl:text> </xsl:text>
        </xsl:if>
            </xsl:template>

    <xsl:template match="definition">
        <dc:description>
            <xsl:apply-templates select="@lang"/>
            <xsl:value-of select="."/>
        </dc:description>
    </xsl:template>

    <xsl:template match="@lang">
        <xsl:attribute name="xml:lang">
            <xsl:value-of select="."/>
        </xsl:attribute>
    </xsl:template>

</xsl:stylesheet>
