# Data Dictionary
## DVD
| Element name     | Description                                                                          | Data type | PK  | Require | Examples                | Constraints                                               |
|------------------|--------------------------------------------------------------------------------------|-----------|-----|---------|-------------------------|-----------------------------------------------------------|
| dvd_id           | Unique identifier for each kind of DVD. Note that this is not the same as object id. | int       | Yes | Yes     | d1, d10                 | Must start with small letter 'd' and ends with an integer |
| title            | Title of the movie of the DVD                                                        | string    | No  | Yes     | Spiderman1, Superman    | No                                                        |
| format           | The type of CD                                                                       | string    | No  | Yes     | DVD , Bluray            | Must be DVD or Blueray only                               |
| genre            | The type of movie                                                                    | string    | No  | Yes     | Action, Comedy          | No                                                        |
| keyStarFeatured  | The key actor in this movie                                                          | string    | No  | Yes     | Michael Jackson, Jason  | Must be at least one actor                                |
| yearReleased     | The year of this DVD release                                                         | gYear     | No  | Yes     | 2015,2000               | No                                                        |
| cost             | The price of the DVD                                                                 | string    | No  | Yes     | 25,99                   | The minimum  cost is 1                                    |
| datePurchased    | The date of this DVD being purchased by customer                                     | date      | No  | Yes     | 2015-09-21,2017-04-28   | No                                                        |
| purchaseQuantity | The amount of purchase of this DVD                                                   | integer   | No  | Yes     | 1,6                     | The minimum value is 1                                    |
                                                     |


## Customer
| Element name | Description | Data type | PK | FK | Nullable | Examples | Constraints |
|--------------|-------------|-----------|----|----|----------|----------|-------------|
| customer_id  |             |           |    |    |          |          |             |
| name         |             |           |    |    |          |          |             |
| postAddress  |             |           |    |    |          |          |             |
| email        |             |           |    |    |          |          |             |
| dateOfBirth  |             |           |    |    |          |          |             |
| dateJoined   |             |           |    |    |          |          |             |

## Order
