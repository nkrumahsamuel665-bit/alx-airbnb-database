-- Insert sample Users
INSERT INTO users (id, name, email)
VALUES
  (1, 'Alice Johnson', 'alice@example.com'),
  (2, 'Michael Smith', 'michael@example.com'),
  (3, 'Sophia Brown', 'sophia@example.com');

-- Insert sample Properties
INSERT INTO properties (id, user_id, title, location, price_per_night)
VALUES
  (1, 1, 'Cozy Apartment', 'Accra', 50),
  (2, 2, 'Beach House', 'Cape Coast', 120),
  (3, 3, 'Mountain Cabin', 'Kumasi', 80);

-- Insert sample Bookings
INSERT INTO bookings (id, user_id, property_id, start_date, end_date, status)
VALUES
  (1, 2, 1, '2025-09-10', '2025-09-15', 'confirmed'),
  (2, 3, 2, '2025-09-20', '2025-09-22', 'pending'),
  (3, 1, 3, '2025-10-01', '2025-10-05', 'confirmed');

-- Insert sample Payments
INSERT INTO payments (id, booking_id, amount, status, payment_date)
VALUES
  (1, 1, 250, 'paid', '2025-09-05'),
  (2, 3, 320, 'pending', '2025-09-28');

-- Insert sample Reviews
INSERT INTO reviews (id, booking_id, rating, comment)
VALUES
  (1, 1, 5, 'Amazing stay, very comfortable!'),
  (2, 3, 4, 'Great experience, but a bit chilly at night.');
