<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml" version="2.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all">
    <xsl:output indent="yes"/>
    <xsl:template match="/">
        <xsl:variable name="sorted" as="node()+">
            <xsl:for-each select="//author">
                <xsl:sort select="nature[@party='Democrat'] div sum(nature)"
                    order="descending"/>
                <xsl:copy-of select="current()"/>
            </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="barInterval" select="15"/>
        <xsl:variable name="barHeight" select="300"/>
        <html>
            <head>
                <title>Nature Reference results</title>
                <link rel="stylesheet" type="text/css" href="http://www.obdurodon.org/css/style.css"/>
                <link rel="stylesheet" type="text/css" href="style.css"/>
                <link rel="stylesheet" type="text/css" href="election.css"/>
                <script type="text/javascript" src="nature.js">//</script>
            </head>
            <body>
                <h1>Results of nature Reference in Man'yoshu</h1>
                <div id="svg-wrap">
                    <svg xmlns="http://www.w3.org/2000/svg" height="375">
                        <g transform="translate(30, 330)">
                            <line x1="20" x2="20" y1="0" y2="-320" stroke="black" stroke-width="1"/>
                            <line x1="20"
                                x2="{count(//author)*$barInterval + count(sum(//author/@trait))*2 + 20}"
                                y1="0" y2="0" stroke="black" stroke-width="1"/>
                            <text x="10" y="5" text-anchor="end">0%</text>
                            <text x="10" y="{5 - $barHeight div 2}" text-anchor="end">50%</text>
                            <text x="10" y="{5 - $barHeight}" text-anchor="end">100%</text>
                            <xsl:for-each select="$sorted">
                                <xsl:variable name="authorPos" select="position()-1"/>
                                <xsl:variable name="xPosition"
                                    select="$authorPos*$barInterval + sum($sorted[position() lt ($authorPos + 1)]/@trait)*2 + 22"/>
                                <xsl:variable name="totalReferences" select="sum(nature)"/>
                                <xsl:variable name="elec" select="@trait"/>
                                <xsl:variable name="acro" select="@acro"/>
                                <g id="{$acro}" class="wrapper">
                                    <text x="{$xPosition + ($elec)}" y="20" text-anchor="middle">
                                        <xsl:value-of select="$acro"/>
                                    </text>
                                    <text x="{$xPosition + ($elec)}" y="35" text-anchor="middle">
                                        <xsl:value-of select="$elec"/>
                                    </text>
                                    <xsl:for-each select="nature">
                                        <xsl:variable name="percentage"
                                            select="current() div $totalReferences"/>
                                        <xsl:variable name="color">
                                            <xsl:choose>
                                                <xsl:when test="@party='Democrat'">blue</xsl:when>
                                                <xsl:when test="@party='Republican'">red</xsl:when>
                                                <xsl:when test="@party='Libertarian'"
                                                    >yellow</xsl:when>
                                                <xsl:when test="@party='Green'">green</xsl:when>
                                            </xsl:choose>
                                        </xsl:variable>
                                        <rect x="{$xPosition}"
                                            y="{-($percentage+(sum(../nature[@party lt current()/@party]) div $totalReferences))*$barHeight}"
                                            stroke="black" stroke-width=".5" fill="{$color}"
                                            width="{$elec*2}" height="{($percentage*$barHeight)}"/>
                                    </xsl:for-each>
                                </g>
                            </xsl:for-each>
                            <line x1="{20}"
                                x2="{count(//author)*$barInterval + sum(//author/@trait)*2 + 20}"
                                y1="-{$barHeight div 2}" y2="-{$barHeight div 2}" stroke="black"
                                opacity="0.5" stroke-dasharray="8 4" stroke-width="1"/>
                        </g>
                    </svg>
                </div>
                <h2>References for <span id="current-author">PA</span></h2>
                <table id="results" border="1">
                    <tr>
                        <th>Party</th>
                        <th>References</th>
                        <th>Percent</th>
                    </tr>
                    <xsl:for-each select="//author">
                        <xsl:variable name="total" select="sum(nature)"/>
                        <xsl:variable name="trait" select="@trait"/>
                        <tbody id="tbody-{@season}">
                            <xsl:if test="not(@season = 'autumn')">
                                <xsl:attribute name="style">display: none;</xsl:attribute>
                            </xsl:if>
                            <xsl:for-each select="nature">
                                <xsl:sort select="@type" order="descending"/>
                                <xsl:variable name="pct" select=". div $total" as="xs:double"/>
                                <tr class="{@type}">
                                    <xsl:if test="($pct * 100) gt 50">
                                        <xsl:attribute name="style"
                                            >font-weight:bold;</xsl:attribute>
                                    </xsl:if>
                                    <td>
                                        <xsl:value-of select="@type"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="format-number(.,'#,###')"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="format-number($pct,'0.00%')"/>
                                    </td>
                                </tr>
                            </xsl:for-each>
                            <tr style="font-weight: bold;">
                                <td>Total</td>
                                <td>
                                    <xsl:value-of select="format-number($total,'#,###')"/>
                                </td>
                                <td>Electoral: <xsl:value-of select="@trait"/></td>
                            </tr>
                        </tbody>
                    </xsl:for-each>
                    <tr style="font-weight: bold; visibility:hidden">
                        <td>Nature Reference</td>
                        <td>10,000,000</td>
                        <td>Electoral: 0615</td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>