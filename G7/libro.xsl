<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:param name="libro" />
<xsl:template match="biblioteca">
    <html>
        <head>
            <title><xsl:value-of select="//libro[@id=$libro]/titulo"/></title>
        </head>
        <body>
            <xsl:apply-templates/>
            <xsl:call-template name="imprimir_libro">
                <xsl:with-param name="book" select="//libro[@id=$libro]" />
            </xsl:call-template>
        </body>
    </html>
</xsl:template>

<xsl:template name="imprimir_libro">
    <xsl:param name="book" />
    <h1><xsl:value-of select="$book/titulo"/></h1>
    <h3>Autor</h3>
    <p>
        <xsl:value-of select="$book/autor"/>
    </p>
        <h3>ISBN</h3>
    <p>
        <xsl:value-of select="$book/isbn"/>
    </p>
        <h3>Descripcion</h3>
    <p>
        <xsl:value-of select="$book/descripcion"/>
    </p>
</xsl:template>

<xsl:template match="libros"/>

<xsl:template match="usuarios"/>

</xsl:stylesheet>