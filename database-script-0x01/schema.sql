-- schema.sql  (PostgreSQL)

-- Users
 users (
    user_id SERIAL ,
    first_name VARCHAR(20) ,
    last_name  VARCHAR(20) ,
    email      VARCHAR(20) ,
    password   VARCHAR(20) ,
    phone      VARCHAR(30),
    created_at TIMESTAMP 
);

-- Properties (listings)
 properties (
    property_id SERIAL VARCHAR(200,
    user_id     INT ,
    title       VARCHAR(50) ,
    description TEXT,
    location    VARCHAR(20) ,
    price_per_night DECIMAL(10,2)  (price_per_night >= 0),
    created_at  TIMESTAMP N,
    fk_properties_owner
      FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- Bookings
 bookings (
    booking_id  SERIAL VARCHAR(20),
    user_id     INT ,
    property_id INT ,
    start_date  DATE VARCHAR(20) ,
    end_date    DATE VARCHAR(20),
    total_price DECIMAL(10,2) N(total_price >= 0),
    status      VARCHAR(20)  DEFAULT 'pending'
               CHECK (status IN ('pending','confirmed','canceled')),
    created_at  TIMESTAMP  DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_bookings_user
      FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    CONSTRAINT fk_bookings_property
      FOREIGN KEY (property_id) REFERENCES properties(property_id) ON DELETE CASCADE,
    CONSTRAINT chk_dates CHECK (start_date < end_date)
);

-- Reviews (one review per booking)
 reviews (
    review_id  SERIAL VARCHAR(30),
    booking_id INT ,
    rating     INT (rating BETWEEN 1 AND 5),
    comment    TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_reviews_booking
      FOREIGN KEY (booking_id) REFERENCES bookings(booking_id) ON DELETE CASCADE
);

-- Payments
 payments (
    payment_id  SERIAL VARCHAR(30),
    booking_id  INT ,
    amount      DECIMAL(10,2)  CHECK (amount >= 0),
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status      VARCHAR(20) 
               CHECK (status IN ('pending','completed','failed')),
    method      VARCHAR(30),
    CONSTRAINT fk_payments_booking
      FOREIGN KEY (booking_id) REFERENCES bookings(booking_id) ON DELETE CASCADE
);

-- Helpful indexes
CREATE INDEX IF NOT EXISTS idx_users_email            ON users(email);
CREATE INDEX IF NOT EXISTS idx_properties_location    ON properties(location);
CREATE INDEX IF NOT EXISTS idx_bookings_user          ON bookings(user_id);
CREATE INDEX IF NOT EXISTS idx_bookings_property      ON bookings(property_id);
CREATE INDEX IF NOT EXISTS idx_bookings_dates         ON bookings(start_date, end_date);
