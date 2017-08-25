# Data Dictionary
## DVD
| Element name     | Description                                                                           | Data type | PK  | FK | Nullable | Examples | Constraints                                               |
|------------------|---------------------------------------------------------------------------------------|-----------|-----|----|----------|----------|-----------------------------------------------------------|
| dvd_id           | Unique identifier for each kind of DVD. Note that this is not the same as object id.  | int       | Yes | No | No       | d1, d10  | Must start with small letter 'd' and ends with an integer |
| title            |                                                                                       |           |     |    |          |          |                                                           |
| format           |                                                                                       |           |     |    |          |          |                                                           |
| genre            |                                                                                       |           |     |    |          |          |                                                           |
| keyStarFeatured  |                                                                                       |           |     |    |          |          |                                                           |
| cost             |                                                                                       |           |     |    |          |          |                                                           |
| datePurchased    |                                                                                       |           |     |    |          |          |                                                           |
| purchaseQuantity |                                                                                       |           |     |    |          |          |                                                           |


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
