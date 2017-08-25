### Query 1
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

### Query 2
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
