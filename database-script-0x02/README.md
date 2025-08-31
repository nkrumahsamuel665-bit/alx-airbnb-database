# Database Script 0x02: Seed Data

This folder contains the SQL script for *seeding the database* with sample data.  
The purpose of this script is to populate the tables with initial records for testing and development.

## Files
- *seed.sql* → Contains INSERT statements for sample data.

## Entities Covered
- Users
- Properties
- Bookings
- Payments
- Reviews

## Usage
1. Ensure the database schema (schema.sql) has been created.
2. Run the seed script in your SQL environment:
   ```sql
   source database-script-0x02/seed.sql;
