# Database Normalization

## Objective
The objective of this task is to ensure that the Airbnb database design is normalized up to the Third Normal Form (3NF) to eliminate redundancy and maintain data integrity.


## Step 1: First Normal Form (1NF)
- Each table has a primary key.  
- All attributes contain atomic (indivisible) values.  
- No repeating groups are present.  

✅ Our tables (Users, Properties, Bookings, Reviews, Payments) meet this requirement.  


## Step 2: Second Normal Form (2NF)
- The database is already in 1NF.  
- All non-key attributes fully depend on the primary key.  

✅ No partial dependencies exist since each table uses a single-column primary key.  


## Step 3: Third Normal Form (3NF)
- The database is already in 2NF.  
- No transitive dependencies exist (non-key attributes do not depend on other non-key attributes).  

✅ For example, in the *Users* table, email depends only on user_id and not on name.  



## Conclusion
The database design has been checked against 1NF, 2NF, and 3NF.  
It satisfies all conditions of *Third Normal Form (3NF)*.  
Therefore, the design is normalized and optimized for reducing redundancy and ensuring consistency.
