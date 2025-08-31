# ER Diagram Requirements

## Entities and Attributes

### User
- user_id (Primary Key)
- name
- email
- password

### Property
- property_id (Primary Key)
- title
- location
- price

### Booking
- booking_id (Primary Key)
- user_id (Foreign Key)
- property_id (Foreign Key)
- start_date
- end_date

## Relationships
- A User can make multiple Bookings.
- A Property can have multiple Bookings.
- Each Booking belongs to one User and one Property.
