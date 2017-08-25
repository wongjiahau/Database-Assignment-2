### Query 1 - Input
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
### Query 1 - Output
```xml
<?xml version="1.0" encoding="UTF-8"?>
<NoOfCustomerJoinedAt2012Jan>4</NoOfCustomerJoinedAt2012Jan>
```

### Query 2 - Input
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
return $all_dvd[AverageRating > 3]
```

### Query 2 - Output
```xquery
<?xml version="1.0" encoding="UTF-8"?>
<DVD dvd_id="d1" name="Spiderman1">
   <AverageRating>4.4</AverageRating>
</DVD>
<DVD dvd_id="d4" name="Baywatch">
   <AverageRating>4.5</AverageRating>
</DVD>
<DVD dvd_id="d5" name="The Mummy">
   <AverageRating>3.25</AverageRating>
</DVD>
```
