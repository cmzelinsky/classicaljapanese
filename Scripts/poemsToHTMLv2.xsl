<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="text"/>
    <xsl:output method="html" indent="yes" name="html"/>
    
    <xsl:template match="/">
        <xsl:for-each select="//poem">
            <xsl:variable name="filename"
                select="concat('manyoshu_', @no,'.html')" />
            <xsl:value-of select="$filename" />
            <xsl:result-document href="{$filename}" format="html">
             <html>
                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
                    <script type="text/javascript" src="inflectionalHighlighting.js">//</script>
                    
                    <script type="text/javascript">
                        function toggle_visibility(id) {
                        var e = document.getElementById(id);
                        if (e.style.display == 'block')
                        e.style.display = 'none';
                        else
                        e.style.display = 'block';
                        }
                    </script>
                    
                    <script type="text/javascript">
                        function changeText(idElement) {
                        var element = document.getElementById(idElement);
                        if (idElement === 'arrow'){
                        if (element.innerHTML === '↧') 
                        element.innerHTML = '↥';
                        else {
                        element.innerHTML = '↧';
                        }
                        }
                        }
                    </script>
                    <link rel="stylesheet" type="text/css" href="style.css" />
                    <title> Waka of the Nara period: exploring Classical Japanese and representations of home
                        life in Man'yōshū: The Text 
                    </title>
                 </head>
                 <body>
                     <h1><a href="http://www.obdurodon.org">&lt;oo&gt;</a> --&gt; <a href="http://dh.obdurodon.org">&lt;dh&gt;</a> --&gt; &lt;japanese&gt; : a resource for classical japanese 
                     </h1>
                     <div id="navigation">
                         <ul>
                             <li><a href="index.html">Home</a></li>
                             <li><a>About</a><ul>
                                 <li><a href="index2.html">Contributors</a></li>
                                 <li><a href="index2.html">Motivations &amp; Development</a></li>
                             </ul>
                             </li>
                             <li><a>Man'yōshū</a><ul>
                                 <li><a href="authors.html">Authors</a></li>
                                 <li><a href="manyoshu.html">The Text</a></li>
                             </ul>
                             </li>
                             <li><a>Research</a><ul>
                                 <li><a href="index2.html">Representations of Home Life</a></li>
                                 <li><a href="index2.html">Graphical Representations</a></li>
                                 <li><a href="index2.html">Future Research</a></li>
                             </ul>
                             </li>
                             <li><a>Documentation</a><ul>
                                 <li><a href="source.html">Source Code</a></li>
                                 <li><a href="index2.html">Extended Bibliography</a></li>
                             </ul>
                             </li>
                         </ul>
                     </div>
                     <div class="poem">
                         <br/>
                         <h2>Poem <xsl:value-of select="@no"/> :</h2>
                         <div id="reader">
                             <table>
                                 <tr>
                                     <td>
                                         <h3>Options <a id='arrow' href="#" onclick="toggle_visibility('options'); changeText('arrow');">↧</a></h3>
                                         <div id="options" style="display:none;">
                                             Text Display: [<a href="#" onclick="toggle_visibility('original');">Original Text</a>] [<a href="#" onclick="toggle_visibility('translation');">Translation</a>] | Inflection Highlighting: [<a><span onclick="highlightAll()">All</span></a>] [<a><span id="verb" onclick="highlightElement(this)">Verb Only</span></a>]
                                             [<a><span id="inflSuffix" onclick="highlightElement(this)">Inflected Suffixes Only</span></a>] [<a><span onclick="clearHighlights()">Clear Highlighting</span></a>]
                                         </div>
                                         <hr />
                                     </td>
                                 </tr>
                             </table>
                             <table>
                                 <tr>
                                    <xsl:apply-templates select="version"/>
                                 </tr>
                             </table>
                         </div>
                         <div id="poemNavigation">
                             <ul>
                                 <xsl:for-each select="//poem">
                                     <li>
                                         <a href = "{concat('manyoshu_', @no,'.html')}"><xsl:value-of select="@no"/></a>
                                     </li>
                                 </xsl:for-each>
                             </ul>
                         </div>
                     </div>
                    </body>
                </html>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="//version">
        <td id="{@type}" style="display:block">
            <xsl:apply-templates select="line"/>
        </td>
    </xsl:template>
    
    <xsl:template match="//line">
        <xsl:apply-templates/>
        <xsl:if test="following-sibling::line">
            <br/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="//verb">
        <span class="verb">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="//inflSuffix">
        <span class="inflSuffix">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
</xsl:stylesheet>