-- schema.sql  (PostgreSQL)

-- Users
CREATE TABLE IF NOT EXISTS users (
    user_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name  VARCHAR(50) NOT NULL,
    email      VARCHAR(100) NOT NULL UNIQUE,
    password   VARCHAR(255) NOT NULL,
    phone      VARCHAR(30),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Properties (listings)
CREATE TABLE IF NOT EXISTS properties (
    property_id SERIAL PRIMARY KEY,
    user_id     INT NOT NULL,
    title       VARCHAR(100) NOT NULL,
    description TEXT,
    location    VARCHAR(120) NOT NULL,
    price_per_night DECIMAL(10,2) NOT NULL CHECK (price_per_night >= 0),
    created_at  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_properties_owner
      FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- Bookings
CREATE TABLE IF NOT EXISTS bookings (
    booking_id  SERIAL PRIMARY KEY,
    user_id     INT NOT NULL,
    property_id INT NOT NULL,
    start_date  DATE NOT NULL,
    end_date    DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL CHECK (total_price >= 0),
    status      VARCHAR(20) NOT NULL DEFAULT 'pending'
               CHECK (status IN ('pending','confirmed','canceled')),
    created_at  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_bookings_user
      FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    CONSTRAINT fk_bookings_property
      FOREIGN KEY (property_id) REFERENCES properties(property_id) ON DELETE CASCADE,
    CONSTRAINT chk_dates CHECK (start_date < end_date)
);

-- Reviews (one review per booking)
CREATE TABLE IF NOT EXISTS reviews (
    review_id  SERIAL PRIMARY KEY,
    booking_id INT NOT NULL UNIQUE,
    rating     INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comment    TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_reviews_booking
      FOREIGN KEY (booking_id) REFERENCES bookings(booking_id) ON DELETE CASCADE
);

-- Payments
CREATE TABLE IF NOT EXISTS payments (
    payment_id  SERIAL PRIMARY KEY,
    booking_id  INT NOT NULL,
    amount      DECIMAL(10,2) NOT NULL CHECK (amount >= 0),
    payment_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status      VARCHAR(20) NOT NULL
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
