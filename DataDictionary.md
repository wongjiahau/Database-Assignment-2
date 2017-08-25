# Data Dictionary
## DVD
| Element name     | Description                                                                          | Data type | PK  | Require | Examples                | Constraints                                               |
|------------------|--------------------------------------------------------------------------------------|-----------|-----|---------|-------------------------|-----------------------------------------------------------|
| dvd_id           | Unique identifier for each kind of DVD. Note that this is not the same as object id. | string    | Yes | Yes     | d1, d10                 | Must start with small letter 'd' and ends with an integer |
| title            | Title of the movie of the DVD                                                        | string    | No  | Yes     | Spiderman1, Superman    | No                                                        |
| format           | The type of CD                                                                       | string    | No  | Yes     | DVD , Bluray            | Must be DVD or Blueray only                               |
| genre            | The type of movie                                                                    | string    | No  | Yes     | Action, Comedy          | No                                                        |
| keyStarFeatured  | The key actor in this movie                                                          | string    | No  | Yes     | Michael Jackson, Jason  | Must be at least one actor                                |
| yearReleased     | The year of this DVD release                                                         | gYear     | No  | Yes     | 2015,2000               | No                                                        |
| cost             | The price of the DVD                                                                 | string    | No  | Yes     | 25,99                   | The minimum  cost is 1                                    |
| datePurchased    | The date of this DVD being purchased by customer                                     | date      | No  | Yes     | 2015-09-21,2017-04-28   | No                                                        |
| purchaseQuantity | The amount of purchase of this DVD                                                   | integer   | No  | Yes     | 1,6                     | The minimum value is 1                                    |
                                                   


## Customer
| Element name | Description                                             | Data type | PK  | Require | Examples               | Constraints                                               |
|--------------|---------------------------------------------------------|-----------|-----|---------|------------------------|-----------------------------------------------------------|
| customer_id  | Unique identifier for each customer                     | string    | Yes | Yes     | c12,c0                 | Must start with small letter 'c' and ends with an integer |
| name         | The name of the customer                                | string    | No  | Yes     | Lawrence, Wong Fa Chai | Cannot contain all weird symbol except for this 3 '. -    |
| postAddress  | The address of the customer                             | string    | No  | Yes     | 16,Jalan Hock lee,...  | No                                                        |
| email        | The email address of customer                           | string    | No  | Yes     | JiaYu@gmail.com        | No                                                        |
| dateOfBirth  | The date of customer born                               | date      | No  | Yes     | 2000-09-07,2011-09-11  | No                                                        |
| dateJoined   | The date of the customer joined membership of this shop | date      | No  | Yes     | 2012-02-23,2018-09-04  | No                                                        |

## Order
| Element name | Description                                   | Data type | PK  | Require | Examples            | Constraints                                               |
|--------------|-----------------------------------------------|-----------|-----|---------|---------------------|-----------------------------------------------------------|
| order_id     | Unique identifier of each order               | string    | Yes | Yes     | o12,o111            | Must start with small letter 'o' and ends with an integer |
| datetime     | The date and time of the customer buy the DVD | dateTime  | No  | Yes     | 2002-09-10T05:17:55 | No                                                        |
| quantity     | The purchase quantity of the DVD              | integer   | No  | Yes     | 1,100               | The minimum value is 1                                    |

## Comment
| Element name | Description                      | Data type | PK | Require | Examples            | Constraints |
|--------------|----------------------------------|-----------|----|---------|---------------------|-------------|
| comment      | The detail of the comment        | string    | No | Yes     | No bad,good         | No          |
| datetime     | The date and time of the comment | dateTime  | No | Yes     | 2002-09-10T05:17:55 | No          |

## Rating
| Element name | Description                                     | Data type | PK | Require | Examples            | Constraints                            |
|--------------|-------------------------------------------------|-----------|----|---------|---------------------|----------------------------------------|
| value        | The rating value of the movie                   | integer   | No | Yes     | 3,1                 | The value of the rating is from 1 to 5 |
| datetime     | The date and time of when customer doing rating | dateTime  | No | Yes     | 2002-09-10T05:17:55 | No                                     |
