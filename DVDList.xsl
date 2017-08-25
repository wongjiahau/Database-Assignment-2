<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<html>
<body>
  <table>
    <tr>
      <th>ID</th>
      <th>Title</th>
      <th>Format</th>
      <th>Genre</th>
      <th>Key Stars Featured</th>
      <th>Year Released</th>
      <th>Cost</th>
      <th>Date Purchased</th>
      <th>Purchase Quantity</th>
    </tr>
      <xsl:for-each select="DVDStore/DVDList/DVD">
        <td><xsl:value-of select="@dvd_id" /></td>
        <td><xsl:value-of select="title" /></td>
        <td><xsl:value-of select="format" /></td>
        <td><xsl:value-of select="genre" /></td>
        <td>
          <xsl:for-each select="keyStarsFeatured" />
            <span><xsl:value-of select="Star/@Name" /></span>
        </td>
        <td><xsl:value-of select="yearReleased" /></td>
        <td><xsl:value-of select="cost" /></td>
        <td><xsl:value-of select="datePurchased" /></td>
        <td><xsl:value-of select="purchaseQuantity" /></td>
    <tr>
    </tr>
  </table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
