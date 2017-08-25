Query 1 - Find the total number of customers who joined at 2012 January.
====
#### Input
```xquery
xquery version "1.0";
let $result := (
	for $x in doc("XML-Document.xml")
/DVDStore/CustomerList/Customer
	where 
		month-from-date($x/dateJoined) = 1 and
		year-from-date($x/dateJoined) = 2012
	return $x
)
return <NoOfCustomerJoinedAt2012Jan>{count($result)}</NoOfCustomerJoinedAt2012Jan>
```
#### Output
```xml
<?xml version="1.0" encoding="UTF-8"?>
<NoOfCustomerJoinedAt2012Jan>4</NoOfCustomerJoinedAt2012Jan>
```
Query 2 - List DVD(s) that has more than average rating of 3
====

### Input
```xquery
xquery version "1.0";
let $all_dvd := 
	for $dvd in doc("XML-Document.xml")/DVDStore/DVDList/DVD
	return <DVD dvd_id="{$dvd/@dvd_id}" name="{$dvd/title}">
	{
		let $rating_of_current_DVD :=	    
			for $customer in doc("XML-Document.xml")/DVDStore/CustomerList/Customer
			return <Customer>
				{
					for $rating in $customer/ratingList/rating
					where $rating/@dvd_id = $dvd/@dvd_id
					return $rating/@value		
				}
			</Customer>
		return
		if(count($rating_of_current_DVD[@value]) > 0) then (
			<AverageRating> {sum($rating_of_current_DVD/@value) div count($rating_of_current_DVD[@value])} </AverageRating>
		)
		else (
			<AverageRating> 0 </AverageRating>		
		)
	}
	</DVD>
	
for $highly_rated_dvd in $all_dvd[AverageRating > 3]
	order by $highly_rated_dvd/AverageRating ascending 
	return $highly_rated_dvd
```

### Output
```xquery
<?xml version="1.0" encoding="UTF-8"?>
<DVD dvd_id="d5" name="The Mummy">
   <AverageRating>3.25</AverageRating>
</DVD>
<DVD dvd_id="d1" name="Spiderman1">
   <AverageRating>4.4</AverageRating>
</DVD>
<DVD dvd_id="d4" name="Baywatch">
   <AverageRating>4.5</AverageRating>
</DVD>
```

Query 3 - List all the items sold from the beginning of time until now
====
### Input
```xquery
xquery version "1.0";
let $all_sold_items := 
	for $order in doc("XML-Document.xml")/DVDStore/OrderList/Order
		return 		
			for $item in $order/ItemList/Item
				let $dvd_title := 
					for $dvd in doc("XML-Document.xml")/DVDStore/DVDList/DVD
					where $dvd/@dvd_id = $item/@dvd_id
					return $dvd/title
				let $dvd_cost := 
					for $dvd in doc("XML-Document.xml")/DVDStore/DVDList/DVD
					where $dvd/@dvd_id = $item/@dvd_id
					return $dvd/cost
				return <Item 
					dvd_id = "{$item/@dvd_id}"
					quantity = "{$item/@quantity}"			
					dvd_title = "{$dvd_title}"
					cost = "{$dvd_cost}"
					dateTime = "{$order/@dateTime}"
				/>
return $all_sold_items
```
### Output
```xml
<?xml version="1.0" encoding="UTF-8"?>
<Item dvd_id="d1"
      quantity="1"
      dvd_title="Spiderman1"
      cost="20"
      dateTime="2015-08-10T05:17:55"/>
<Item dvd_id="d2"
      quantity="2"
      dvd_title="Hacksaw Ridge"
      cost="25"
      dateTime="2015-08-10T05:17:55"/>
<Item dvd_id="d1"
      quantity="1"
      dvd_title="Spiderman1"
      cost="20"
      dateTime="2016-08-15T09:22:55"/>
<Item dvd_id="d3"
      quantity="1"
      dvd_title="Fast And Furious 6"
      cost="18"
      dateTime="2016-08-15T09:22:55"/>
<Item dvd_id="d5"
      quantity="1"
      dvd_title="The Mummy"
      cost="22"
      dateTime="2016-08-15T09:22:55"/>
<Item dvd_id="d9"
      quantity="1"
      dvd_title="Batman Begins"
      cost="10"
      dateTime="2013-02-10T12:54:55"/>
<Item dvd_id="d10"
      quantity="3"
      dvd_title="Star Wars 1"
      cost="10"
      dateTime="2017-03-10T14:54:55"/>
<Item dvd_id="d2"
      quantity="2"
      dvd_title="Hacksaw Ridge"
      cost="25"
      dateTime="2015-06-15T23:23:55"/>
<Item dvd_id="d4"
      quantity="2"
      dvd_title="Baywatch"
      cost="15"
      dateTime="2015-06-15T23:23:55"/>
<Item dvd_id="d1"
      quantity="1"
      dvd_title="Spiderman1"
      cost="20"
      dateTime="2014-05-09T11:23:55"/>
<Item dvd_id="d3"
      quantity="1"
      dvd_title="Fast And Furious 6"
      cost="18"
      dateTime="2014-05-09T11:23:55"/>
<Item dvd_id="d1"
      quantity="1"
      dvd_title="Spiderman1"
      cost="20"
      dateTime="2013-04-23T05:13:55"/>
<Item dvd_id="d9"
      quantity="1"
      dvd_title="Batman Begins"
      cost="10"
      dateTime="2013-04-23T05:13:55"/>
<Item dvd_id="d4"
      quantity="1"
      dvd_title="Baywatch"
      cost="15"
      dateTime="2014-05-15T23:23:55"/>
<Item dvd_id="d5"
      quantity="1"
      dvd_title="The Mummy"
      cost="22"
      dateTime="2016-12-01T03:23:55"/>
<Item dvd_id="d2"
      quantity="3"
      dvd_title="Hacksaw Ridge"
      cost="25"
      dateTime="2017-01-19T08:44:09"/>
<Item dvd_id="d10"
      quantity="1"
      dvd_title="Star Wars 1"
      cost="10"
      dateTime="2017-01-19T08:44:09"/>
<Item dvd_id="d1"
      quantity="1"
      dvd_title="Spiderman1"
      cost="20"
      dateTime="2015-01-25T10:24:09"/>
<Item dvd_id="d5"
      quantity="1"
      dvd_title="The Mummy"
      cost="22"
      dateTime="2017-06-12T16:21:50"/>
<Item dvd_id="d5"
      quantity="1"
      dvd_title="The Mummy"
      cost="22"
      dateTime="2017-02-28T06:53:25"/>
```

Query 4 Total cost and quantity sold between August 2016 and August 2017
====
### Input
```xquery
let $all_sold_items := 
	for $order in doc("XML-Document.xml")/DVDStore/OrderList/Order
		return 		
			for $item in $order/ItemList/Item
				let $dvd_title := 
					for $dvd in doc("XML-Document.xml")/DVDStore/DVDList/DVD
					where $dvd/@dvd_id = $item/@dvd_id
					return $dvd/title
				let $dvd_cost := 
					for $dvd in doc("XML-Document.xml")/DVDStore/DVDList/DVD
					where $dvd/@dvd_id = $item/@dvd_id
					return $dvd/cost
				return <Item 
					dvd_id = "{$item/@dvd_id}"
					quantity = "{$item/@quantity}"			
					dvd_title = "{$dvd_title}"
					cost = "{$dvd_cost}"
					dateTime = "{$order/@dateTime}"
				/> 	
			return 
			<Summary>	
				<TotalCost>
				{
				fn:sum(
				let $total_cost :=
						for $item in $all_sold_items
						where ($item/@dateTime lt "2017-08-01T00:00:00") and ($item/@dateTime gt "2016-08-01T00:00:00")
						return (sum($item/@cost))
					return $total_cost
					)
					}
					</TotalCost>
					
				<TotalQuantity>
				{
				fn:sum(
				let $total_quantity :=
					for $item in $all_sold_items
					where($item/@dateTime lt "2017-08-01T00:00:00") and ($item/@dateTime gt "2016-08-01T00:00:00")
					return (sum($item/@quantity))
				return $total_quantity
				)
				}
				</TotalQuantity>
			</Summary>
```
### Output
```xml
<?xml version="1.0" encoding="UTF-8"?>
<Summary>
   <TotalCost>171</TotalCost>
   <TotalQuantity>13</TotalQuantity>
</Summary>
```

Query 5 User want to search the DVD title end with 'my'
===
### Input
```
xquery version "1.0";
for $x in doc("XML-Document.xml")/DVDStore/DVDList/DVD	 		
	return
	if(contains($x/title, 'my'))then ($x)
	else()
```
### Output
```
<?xml version="1.0" encoding="UTF-8"?>
<DVD xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" dvd_id="d5">
   <title>The Mummy</title>
   <format>Bluray</format>
   <genre>Adventure</genre>
   <keyStarsFeatured>
      <Star Name=" Tom Cruise"/>
      <Star Name=" Sofia Boutella"/>
      <Star Name=" Annabelle Wallis"/>
   </keyStarsFeatured>
   <yearReleased>2007</yearReleased>
   <cost>22</cost>
   <datePurchased>2007-07-22</datePurchased>
   <purchaseQuantity>10</purchaseQuantity>
</DVD>
```

