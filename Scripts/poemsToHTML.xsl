<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" 
    xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="xhtml" indent="yes"/>
    <xsl:template match="//scroll">
        <html>
            <head>
                <script type="text/javascript">
                    function toggle_visibility(id) {
                    var e = document.getElementById('original');
                    if(e.style.display == 'block')
                    e.style.display = 'none';
                    else
                    e.style.display = 'block';
                    }
                </script>
                <link rel="stylesheet" type="text/css" href="style.css" />
                <title> Waka of the Nara period: exploring Classical Japanese and representations of home
                    life in Man'yōshū: The Text </title>
            </head>
            <body>
                
                <h1>
                    <a href="http://www.obdurodon.org">&lt;oo&gt;</a> --> <a href="http://dh.obdurodon.org"
                        >&lt;dh&gt;</a> --> &lt;japanese&gt; : a resource for classical japanese </h1>
                <div id="navigation">
                    <ul>
                        <li>
                            <a href="index.html">Home</a>
                        </li>
                        <li>
                            <a>About</a>
                            <ul>
                                <li>
                                    <a href="index2.html">Contributors</a>
                                </li>
                                <li>
                                    <a href="index2.html">Motivations &amp; Development</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="manyoshuTest.html">Man'yōshū</a>
                        </li>
                        <li>
                            <a>Research</a>
                            <ul>
                                <li>
                                    <a href="index2.html">Representations of Home Life</a>
                                </li>
                                <li>
                                    <a href="index2.html">Graphical Representations</a>
                                </li>
                                <li>
                                    <a href="index2.html">Future Research</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a>Documentation</a>
                            <ul>
                                <li>
                                    <a href="source.html">Source Code</a>
                                </li>
                                <li>
                                    <a href="index2.html">Extended Bibliography</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div id="table">
                    <table>
                        <tr>
                            <td>
                                Text Display: <a href="#" onclick="toggle_visibility('original');">[Original Text]</a> [Translation] | Verb Highlighting: [All] [Verb Only] [Inflected Suffixes Only]
                            </td>
                        </tr>
                        <tr>
                            <td id="original">
                            </td>
                            <td id="working">
                                <xsl:apply-templates select="poem"></xsl:apply-templates>
                            </td>
                            <td id="translation">
                            </td>
                        </tr>
                    </table>
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="poem">
        <xsl:apply-templates select="poem[@no='1']"/>
    </xsl:template>
</xsl:stylesheet>