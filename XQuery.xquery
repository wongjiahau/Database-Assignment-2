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


