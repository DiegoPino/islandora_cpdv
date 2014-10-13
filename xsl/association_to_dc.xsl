<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/" >

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <oai_dc:dc xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/"
            xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/oai_dc/ http://www.openarchives.org/OAI/2.0/oai_dc.xsd">
            <xsl:apply-templates/>
        </oai_dc:dc>
    </xsl:template>

    <xsl:template match="identification">
        <dc:title>
            <xsl:value-of select="name"/>
        </dc:title>
    </xsl:template>

    <xsl:template match="descriptionGroup">
        <dc:description>
            <xsl:apply-templates select="@lang"/>
            <xsl:value-of select="description"/>
        </dc:description>
    </xsl:template>

    <xsl:template match="link">
        <dc:type>Service</dc:type>
    </xsl:template>

    <xsl:template match="classification">
        <xsl:apply-templates select="keywordGroup" />
    </xsl:template>

    <xsl:template match="keywordGroup">
        <dc:subject>
            <xsl:apply-templates select="@lang"/>
            <xsl:apply-templates/>
        </dc:subject>
    </xsl:template>

    <xsl:template match="@lang">
        <xsl:attribute name="xml:lang">
            <xsl:value-of select="."/>
        </xsl:attribute>
    </xsl:template>

</xsl:stylesheet>
