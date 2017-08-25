<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<html>
<head>
	<title>Customer List</title>
</head>
<body>
  <h1 style="text-align: center;" >Customer Records</h1>
  <table width="100%" style="text-align : center;"  border="1px">
    <tr style="background-color: black; color: white;" >
      <th>Customer ID</th>
      <th>Name</th>
      <th>Email</th>
      <th>Address</th>
      <th>Date Joined</th>
      <th>DVD Bought(DVD ID, Date Bought)</th>
    </tr>
      <xsl:for-each select="DVDStore/CustomerList/Customer">
      <xsl:sort select="name"></xsl:sort>
    	<tr style="height: 50px;" >
    		<td><xsl:value-of select="@customer_id" /></td>
    		<td><xsl:value-of select="name" /></td>
    		<td><xsl:value-of select="email" /></td>
			<td><xsl:value-of select="postAddress" /></td>
			<td><xsl:value-of select="dateJoined" /></td>
    		<td>
    			<xsl:for-each select="ratingList/rating">
    				[ <xsl:value-of select="@dvd_id" />, <xsl:value-of select="@dateTime" /> ]
    			</xsl:for-each>
    		</td>
    	</tr>
      </xsl:for-each>
  </table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
