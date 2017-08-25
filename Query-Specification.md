Queries:

1. Number of customers joined at 2012 January.

2. DVDs which has more than average of 3 star rating.

3. DVDs title which include the specific keystar featured.

4. Number of comments for DVD whichever has 3 star rating or above.

5. DVDs with same genre released between specific range of years.
    Action (2002~2003)
    Adventure (2005~2007)
    Biography (2000~2003)
    Comedy (2007)
    Horror (2004)
    Mystery (2004)

6. DVDs which title contains particular alphabets between specific range of years.

7. Popularity of genre of DVDs among customers based on purchase quantity.

8. Display the number of comments for all DVDs.

9. DVDs which are ordered by specific customers between specific time.

10. Numbers of orders of DVDs in specific date (month or year).

11. Customers total purchase cost and quantity in descending order.

12. DVDs title which include the specific keyStarFeatured between specific years range.


## XQuery
| No. | Description                                                                         | XQuery                                                                                                                                                                                                                                                                             | Output |
|-----|-------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------|
| 1   | Number of customers joined at 2012 January.                                         | xquery version "1.0";let $result := (,for $x in doc("XML-Document.xml")/DVDStore/CustomerList/Customer,where,month-from-date($x/dateJoined) = 1 and,year-from-date($x/dateJoined) = 2012,return $x)return <NoOfCustomerJoinedAt2012>{count($result)}</NoOfCustomerJoinedAt2012Jan) |        |
| 2   | DVDs which has more than average of 3 star rating.                                  |                                                                                                                                                                                                                                                                                    |        |
| 3   | DVDs title which include the specific keystar featured.                             |                                                                                                                                                                                                                                                                                    |        |
| 4   | Number of comments for DVD whichever has 3 star rating or above.                    |                                                                                                                                                                                                                                                                                    |        |
| 5   | DVDs with same genre released between specific range of years.                      |                                                                                                                                                                                                                                                                                    |        |
| 6   | DVDs which title contains particular alphabets between specific range of years.     |                                                                                                                                                                                                                                                                                    |        |
| 7   | Popularity of genre of DVDs among customers based on purchase quantity.             |                                                                                                                                                                                                                                                                                    |        |
| 8   | Display the number of comments for all DVDs.                                        |                                                                                                                                                                                                                                                                                    |        |
| 9   | DVDs which are ordered by specific customers between specific time.                 |                                                                                                                                                                                                                                                                                    |        |
| 10  | Numbers of orders of DVDs in specific date (month or year).                         |                                                                                                                                                                                                                                                                                    |        |
| 11  | Customers total purchase cost and quantity in descending order.                     |                                                                                                                                                                                                                                                                                    |        |
| 12  | DVDs title which include the specific keyStarFeatured between specific years range. |                                                                                                                                                                                                                                                                                    |        |
