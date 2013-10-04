<?xml version="1.0" encoding="UTF-8"?>
<!-- This XSLT transforms https://github.com/dret/sedola XMLs into github-friendly markdown. -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output name="md-text" method="text" encoding="UTF-8"/>
    <xsl:variable name="RFC" select="collection(concat('../IETF/RFC/','?select=*.xml'))"/>
    <xsl:variable name="I-D" select="collection(concat('../IETF/I-D/','?select=*.xml'))"/>
    <xsl:variable name="W3C" select="collection(concat('../W3C/','?select=*.xml'))"/>
    <xsl:variable name="allfiles" select="$RFC | $I-D | $W3C"/>
    <xsl:template match="/">
        <xsl:result-document href="../MD/headers.md" format="md-text">
            <xsl:text>HTTP Header Fields&#xa;==============&#xa;&#xa;The following HTTP header field definitions were found in </xsl:text>
            <xsl:value-of select="count($allfiles)"/>
            <xsl:text> services (</xsl:text>
            <xsl:value-of select="count($W3C)"/>
            <xsl:text> [W3C](../W3C/), </xsl:text>
            <xsl:value-of select="count($RFC)"/>
            <xsl:text> [RFC](../IETF/RFC/), </xsl:text>
            <xsl:value-of select="count($I-D)"/>
            <xsl:text> [I-D](../IETF/I-D)):&#xa;&#xa;</xsl:text>
            <xsl:for-each select="$allfiles//http-header[exists(@def)]">
                <xsl:sort select="@def"/>
                <xsl:text>* [</xsl:text>
                <xsl:value-of select="@def"/>
                <xsl:text>](</xsl:text>
                <xsl:value-of select="documentation/@source"/>
                <xsl:text> "</xsl:text>
                <xsl:value-of select="replace(documentation/text(), '&quot;', '&#x201d;')"/>
                <xsl:text>" ) : [</xsl:text>
                <xsl:value-of select="../title/text()"/>
                <xsl:text>](</xsl:text>
                <xsl:value-of select="../documentation/@source"/>
                <xsl:text> "</xsl:text>
                <xsl:value-of select="replace(../documentation/text(), '&quot;', '&#x201d;')"/>
                <xsl:text>" )&#xa;</xsl:text>
            </xsl:for-each>
        </xsl:result-document>
        <xsl:result-document href="../MD/mediatypes.md" format="md-text">
            <xsl:text>Media Types&#xa;==============&#xa;&#xa;The following media type definitions were found in </xsl:text>
            <xsl:value-of select="count($allfiles)"/>
            <xsl:text> services (</xsl:text>
            <xsl:value-of select="count($W3C)"/>
            <xsl:text> [W3C](../W3C/), </xsl:text>
            <xsl:value-of select="count($RFC)"/>
            <xsl:text> [RFC](../IETF/RFC/), </xsl:text>
            <xsl:value-of select="count($I-D)"/>
            <xsl:text> [I-D](../IETF/I-D)):&#xa;&#xa;</xsl:text>
            <xsl:for-each select="$allfiles//mediatype[exists(@def)]">
                <xsl:sort select="@def"/>
                <xsl:text>* </xsl:text>
                <xsl:value-of select="@def"/>
                <!--
                <xsl:text>](</xsl:text>
                <xsl:value-of select="documentation/@source"/>
                <xsl:text> "</xsl:text>
                <xsl:value-of select="replace(documentation/text(), '&quot;', '&#x201d;')"/>
-->
                <xsl:text> : [</xsl:text>
                <xsl:value-of select="../title/text()"/>
                <xsl:text>](</xsl:text>
                <xsl:value-of select="../documentation/@source"/>
                <xsl:text> "</xsl:text>
                <xsl:value-of select="replace(../documentation/text(), '&quot;', '&#x201d;')"/>
                <xsl:text>" )&#xa;</xsl:text>
            </xsl:for-each>
        </xsl:result-document>
        <xsl:result-document href="../MD/linkrels.md" format="md-text">
            <xsl:text>Link Relations&#xa;==============&#xa;&#xa;The following link relation definitions were found in </xsl:text>
            <xsl:value-of select="count($allfiles)"/>
            <xsl:text> services (</xsl:text>
            <xsl:value-of select="count($W3C)"/>
            <xsl:text> [W3C](../W3C/), </xsl:text>
            <xsl:value-of select="count($RFC)"/>
            <xsl:text> [RFC](../IETF/RFC/), </xsl:text>
            <xsl:value-of select="count($I-D)"/>
            <xsl:text> [I-D](../IETF/I-D)):&#xa;&#xa;Relation | Description | Specification&#xa;-------: | :---------- | :---&#xa;</xsl:text>
            <xsl:for-each select="$allfiles//link[exists(@def)]">
                <xsl:sort select="@def"/>
                <xsl:text>`</xsl:text>
                <xsl:value-of select="@def"/>
                <xsl:text>` | "[</xsl:text>
                <xsl:value-of select="documentation/text()"/>
                <xsl:text> ](</xsl:text>
                <xsl:value-of select="documentation/@source"/>
                <xsl:text>)" | [</xsl:text>
                <xsl:value-of select="../title/text()"/>
                <xsl:text>](</xsl:text>
                <xsl:value-of select="../documentation/@source"/>
                <xsl:text> "</xsl:text>
                <xsl:value-of select="replace(../documentation/text(), '&quot;', '&#x201d;')"/>
                <xsl:text>" )&#xa;</xsl:text>
            </xsl:for-each>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>