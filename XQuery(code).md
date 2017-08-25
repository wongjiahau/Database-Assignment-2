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
