<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="xhtml" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Author Lists (C1.C2) by Gender</title>
            </head>
            <body>
                <ul>
                    <xsl:apply-templates select="//authors/personList"/>
                </ul>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="//authors/personList">
        <li>
                <xsl:apply-templates select="person[@gender='m']/personName"/>
        </li>
    </xsl:template>
</xsl:stylesheet>