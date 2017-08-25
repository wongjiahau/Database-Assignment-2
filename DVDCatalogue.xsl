<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<html>
<head>
	<title>DVD Catalogue</title>
</head>
<body>
  <h1 style="text-align: center;" >DVD Catalog</h1>
  <table width="100%" border="1px" style="text-align: center;" >
    <tr style="background-color: black; color: white;" >
      <th>ID</th>
      <th>Title</th>
      <th>Format</th>
      <th>Genre</th>
      <th>Key Stars Featured</th>
      <th>Year Released</th>
      <th>Cost</th>
    </tr>
      <xsl:for-each select="DVDStore/DVDList/DVD">
      <xsl:sort select="title"></xsl:sort>
    	<tr>
        	<td><xsl:value-of select="@dvd_id" /></td>
        	<td><xsl:value-of select="title" /></td>
        	<td><xsl:value-of select="format" /></td>
        	<td><xsl:value-of select="genre" /></td>
        	<td>
	        	<xsl:for-each select="keyStarsFeatured/Star">
            		<xsl:value-of select="@Name" />
            		<xsl:if test="position() != last()">,</xsl:if>
            	</xsl:for-each>
        	</td>
        	<td><xsl:value-of select="yearReleased" /></td>
        	<td><xsl:value-of select="cost" /></td>
    	</tr>
      </xsl:for-each>

  </table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
