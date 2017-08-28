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

Query 4 - Total cost and quantity sold between August 2016 and August 2017
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

Query 5 - User want to search the DVD title end with 'my'and within the date from 2005-10-01 to 2007-10-01 and show the dvd detail
===
### Input
```
xquery version "1.0";
declare namespace functx = "http://www.functx.com";
declare function functx:between-inclusive
  ( $value as xs:anyAtomicType? ,
    $minValue as xs:anyAtomicType ,
    $maxValue as xs:anyAtomicType )  as xs:boolean {
	$value >= $minValue and $value <= $maxValue
 } ;

for $x in doc("XML-Document.xml")/DVDStore/DVDList/DVD
 
return
if(contains($x/title, 'my'))
 	then (
    	if (functx:between-inclusive(xs:date($x/datePurchased),
                      xs:date('2005-10-15'),
                      xs:date('2007-11-01')))
                     
				then ($x)
		else ())
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

Query 6 - List the total item bought and total money spent of each customer 
===
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
					customer_id = "{$order/@customer_id}"
					quantity = "{$item/@quantity}"			
					dvd_title = "{$dvd_title}"
					cost = "{$dvd_cost * $item/@quantity}"
					dateTime = "{$order/@dateTime}"
				/>
let $all_customer_orders := 
	for $customer in doc("XML-Document.xml")/DVDStore/CustomerList/Customer		
	return 	<CustomerOrder customer_id="{$customer/@customer_id}" customer_name="{$customer/name}">
			{
				for $item in $all_sold_items
				where $item/@customer_id = $customer/@customer_id
				return $item
			}
			</CustomerOrder>
			
for $customer_order in $all_customer_orders
return <CustomerSummary 	customer_id = "{$customer_order/@customer_id}" 
						customer_name = "{$customer_order/@customer_name}"
						total_item_bought = "{sum($customer_order/Item/@quantity)}"
						money_spent = "{sum($customer_order/Item/@cost)}"
						>
</CustomerSummary>
```
### Output
```xml
<?xml version="1.0" encoding="UTF-8"?>
<CustomerSummary customer_id="c1"
                 customer_name="Wong Ah Kau"
                 total_item_bought="3"
                 money_spent="70"/>
<CustomerSummary customer_id="c2"
                 customer_name="Choy Yi Zhen"
                 total_item_bought="3"
                 money_spent="60"/>
<CustomerSummary customer_id="c3"
                 customer_name="Chin Zai Zai"
                 total_item_bought="4"
                 money_spent="40"/>
<CustomerSummary customer_id="c4"
                 customer_name="Lim Da Zhong"
                 total_item_bought="4"
                 money_spent="80"/>
<CustomerSummary customer_id="c5"
                 customer_name="Lufina"
                 total_item_bought="2"
                 money_spent="38"/>
<CustomerSummary customer_id="c6"
                 customer_name="Yap Ben Ben"
                 total_item_bought="2"
                 money_spent="30"/>
<CustomerSummary customer_id="c7"
                 customer_name="Hoo Mei Mei"
                 total_item_bought="2"
                 money_spent="37"/>
<CustomerSummary customer_id="c8"
                 customer_name="Victor"
                 total_item_bought="4"
                 money_spent="85"/>
<CustomerSummary customer_id="c9"
                 customer_name="Felix Goh"
                 total_item_bought="2"
                 money_spent="42"/>
<CustomerSummary customer_id="c10"
                 customer_name="Chan Suh Suh"
                 total_item_bought="1"
                 money_spent="22"/>
```
Query 7 - List popularity of genre of DVDs among customers based on purchase quantity.
===
```xquery
xquery version "1.0";
let $all_sold_items := 
	for $order in doc("XML-Document.xml")/DVDStore/OrderList/Order
		return 		
			for $item in $order/ItemList/Item
				let $matched_dvd := doc("XML-Document.xml")/DVDStore/DVDList/DVD
[@dvd_id = $item/@dvd_id]
				return <SoldItem 
					order_id = "{$order/@order_id}"
					dvd_id = "{$item/@dvd_id}"
					quantity = "{$item/@quantity}"			
					dvd_title = "{$matched_dvd/title}"
					cost = "{$matched_dvd/cost * $item/@quantity}"
					genre = "{$matched_dvd/genre}"
					dateTime = "{$order/@dateTime}"
				/>

let $all_genres := 
	for $dvd in doc("XML-Document.xml")/DVDStore/DVDList/DVD
	return <Genre>{$dvd/genre}</Genre>
	
let $distinct_genres :=
	for $genre in distinct-values($all_genres)
	return <Genre>{$genre}</Genre>


let $sold_item_grouped_by_genres :=
	for $genre in $distinct_genres
	return
	<SoldItemGroup genre = "{$genre}">
		{$all_sold_items[@genre=$genre]}
	</SoldItemGroup>

let $summaries_of_each_genre :=
	
for $sold_item_group in $sold_item_grouped_by_genres
	
return <Genre 	value="{$sold_item_group/@genre}" 
	
				QuantitySold="{sum($sold_item_group/SoldItem/@quantity)}"
	
				MoneyMade="{sum($sold_item_group/SoldItem/@cost)}">
	
</Genre>

for $summary in $summaries_of_each_genre 
	order by $summary/@QuantitySold descending
	return $summary										
```
```xml
<?xml version="1.0" encoding="UTF-8"?>
<Genre value="Action" QuantitySold="9" MoneyMade="156"/>
<Genre value="Adventure" QuantitySold="8" MoneyMade="128"/>
<Genre value="Biography" QuantitySold="7" MoneyMade="175"/>
<Genre value="Comedy" QuantitySold="3" MoneyMade="45"/>
<Genre value="Mystery" QuantitySold="0" MoneyMade="0"/>
<Genre value="Horror" QuantitySold="0" MoneyMade="0"/>
```
Query 8 - Numbers of orders of DVDs in specific date (month or year).
====
#### Input
```xquery
xquery version "1.0";
let $all_sold_items := 
	for $order in doc("XML-Document.xml")/DVDStore/OrderList/Order
		return 		
			for $item in $order/ItemList/Item
				let $matched_dvd := 
					for $dvd in doc("XML-Document.xml")/DVDStore/DVDList/DVD
					where $dvd/@dvd_id = $item/@dvd_id
					return $dvd
				return <SoldItem 
					order_id = "{$order/@order_id}"
					dvd_id = "{$item/@dvd_id}"
					quantity = "{$item/@quantity}"			
					dvd_title = "{$matched_dvd/title}"
					cost = "{$matched_dvd/cost * $item/@quantity}"
					genre = "{$matched_dvd/genre}"
					dateTime = "{$order/@dateTime}"
				/>
				
let $all_title := 
	for $dvd in doc("XML-Document.xml")/DVDStore/DVDList/DVD
	return <Title>{$dvd/title}</Title>


 
let $sold_item_group_by_titles :=
	for $title in $all_title
	return
	<SoldItemGroup title = "{$title}">
	{
		for $item in $all_sold_items
		return if($item/@dvd_title = $title) then ($item)
		else ()
	}
	</SoldItemGroup>	
				
let $summaries_of_each_title :=
	for $sold_item_group in $sold_item_group_by_titles
	return <Title value="{$sold_item_group/@title}"
			quantity="{sum($sold_item_group/SoldItem/@quantity)}">
		</Title>
		
	for $summary in $summaries_of_each_title
		order by $summary/@value ascending
		return $summary
```
#### Output
```xml
<?xml version="1.0" encoding="UTF-8"?>
<Title value="Annabelle" quantity="0"/>
<Title value="Batman Begins" quantity="2"/>
<Title value="Baywatch" quantity="3"/>
<Title value="Fast And Furious 6" quantity="2"/>
<Title value="Gone Girl" quantity="0"/>
<Title value="Hacksaw Ridge" quantity="7"/>
<Title value="Spiderman1" quantity="5"/>
<Title value="Star Wars 1" quantity="4"/>
<Title value="The Mummy" quantity="4"/>
<Title value="The Wolf Of Wall Street" quantity="0"/>
```
