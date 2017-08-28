<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<html>
<head>
	<title>Customer List</title>
</head>
<body>
  <h1 style="text-align: center;" >Customer Records</h1>
  <table width="100%" style="text-align : center; border-collapse : collapse;"  border="1px">
    <tr style="background-color: black; color: white;" >
      <th rowspan="2">CUSTOMER ID</th>
      <th rowspan="2">NAME</th>
      <th rowspan="2">EMAIL</th>
      <th rowspan="2">ADDRESS</th>
      <th rowspan="2">DATE JOINED</th>
      <th colspan="3">DVD BOUGHT</th>
    </tr>
    <tr style="background-color: black; color: white;">
    	<th width="35px">DVD ID</th>
    	<th width="40px">QUANTITY</th>
    	<th>DATE BOUGHT</th>
    </tr>
      <xsl:for-each select="/DVDStore/CustomerList/Customer">
      <xsl:sort select="name"></xsl:sort>
    	<tr style="height: 50px;" >
    		<td><xsl:value-of select="@customer_id" /></td>
    		<td><xsl:value-of select="name" /></td>
    		<td><xsl:value-of select="email" /></td>
			<td><xsl:value-of select="postAddress" /></td>
			<td><xsl:value-of select="dateJoined" /></td>
			<td colspan="3" >
			<table border="1px" style="border-collapse : collapse; margin : -2; text-align: center;" width="300px"  >
			<xsl:call-template name="display_order">
				<xsl:with-param name="customer_id" select="@customer_id"></xsl:with-param>
			</xsl:call-template>
			</table>
			</td>
    	</tr>
      </xsl:for-each>
  </table>
</body>
</html>
</xsl:template>
<xsl:template name="display_order">
	<xsl:param name="customer_id" />
	<xsl:for-each select="/DVDStore/OrderList/Order">
		<xsl:if test="@customer_id = $customer_id">
			<xsl:for-each select="ItemList/Item">
					<tr style="height : 60px;">
						<td width="35px"><xsl:value-of select="@dvd_id" /></td>
						<td width="87px"><xsl:value-of select="@quantity" /></td>
						<td><xsl:value-of select="../../@dateTime" /></td>
					</tr>
			</xsl:for-each>
		</xsl:if>
	</xsl:for-each>
</xsl:template>
</xsl:stylesheet>
