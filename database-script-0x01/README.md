# Database Schema (DDL)

This folder contains the SQL schema for the Airbnb-style database.

## Files
- schema.sql — CREATE TABLE statements, constraints, and indexes.
- README.md — This explanation.

## Entities
- *users* — stores user accounts.
- *properties* — property listings posted by users.
- *bookings* — reservations linking users to properties and dates.
- *reviews* — feedback tied to a booking (1 review per booking).
- *payments* — payment records for bookings.

## Relationships
- A user can own many properties.
- A booking belongs to one user and one property.
- A review is linked to exactly one booking.
- A payment is linked to one booking.

## Notes
- Designed for PostgreSQL.
- Includes constraints (PKs, FKs, CHECKs) and useful indexes.
