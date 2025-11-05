-- Airbnb Clone Database Schema

-- USER TABLE
CREATE TABLE Users (
    user_id UUID PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    role ENUM('guest', 'host', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- PROPERTY TABLE
CREATE TABLE Properties (
    property_id UUID PRIMARY KEY,
    host_id UUID REFERENCES Users(user_id),
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    price_per_night DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- BOOKING TABLE
CREATE TABLE Bookings (
    booking_id UUID PRIMARY KEY,
    property_id UUID REFERENCES Properties(property_id),
    user_id UUID REFERENCES Users(user_id),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- PAYMENT TABLE
CREATE TABLE Payments (
    payment_id UUID PRIMARY KEY,
    booking_id UUID REFERENCES Bookings(booking_id),
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL
);

-- REVIEW TABLE
CREATE TABLE Reviews (
    review_id UUID PRIMARY KEY,
    property_id UUID REFERENCES Properties(property_id),
    user_id UUID REFERENCES Users(user_id),
    rating INTEGER CHECK (rating BETWEEN 1 AND 5) NOT NULL,
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- MESSAGE TABLE
CREATE TABLE Messages (
    message_id UUID PRIMARY KEY,
    sender_id UUID REFERENCES Users(user_id),
    recipient_id UUID REFERENCES Users(user_id),
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
