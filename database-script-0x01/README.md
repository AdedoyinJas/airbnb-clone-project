# DataScape: Mastering Database Design

## 📖 Overview
This project is part of the ALX Airbnb Database Module. It focuses on designing a relational database for an Airbnb-like application. The goal is to ensure scalability, normalization, and data integrity.

---

## 🧱 Database Entities

### **1. Users**
Stores user information for guests, hosts, and admins.

**Fields:**
- `user_id` (UUID, PK)
- `first_name`
- `last_name`
- `email`
- `password_hash`
- `role` (guest, host, admin)
- `created_at`

### **2. Properties**
Contains details of listings hosted by users.

**Fields:**
- `property_id` (UUID, PK)
- `host_id` (FK → Users)
- `name`
- `description`
- `location`
- `price_per_night`
- `created_at`, `updated_at`

### **3. Bookings**
Stores all booking records.

**Fields:**
- `booking_id` (UUID, PK)
- `property_id` (FK → Properties)
- `user_id` (FK → Users)
- `start_date`, `end_date`
- `total_price`
- `status`

### **4. Payments**
Tracks all payment transactions.

**Fields:**
- `payment_id` (UUID, PK)
- `booking_id` (FK → Bookings)
- `amount`
- `payment_method`
- `payment_date`

### **5. Reviews**
Stores user reviews on properties.

**Fields:**
- `review_id` (UUID, PK)
- `property_id` (FK → Properties)
- `user_id` (FK → Users)
- `rating`
- `comment`
- `created_at`

### **6. Messages**
Enables communication between users.

**Fields:**
- `message_id` (UUID, PK)
- `sender_id`, `recipient_id` (FK → Users)
- `message_body`
- `sent_at`

---

## 🔐 Constraints and Integrity Rules
- **Unique:** `email` in Users.
- **Foreign Keys:** Proper links between tables.
- **Check Constraints:** Rating between 1–5.
- **Cascade Deletes:** Optional for relationships if implemented.

---

## ⚙️ Normalization
The database follows **3rd Normal Form (3NF)**:
1. Each column holds atomic values.
2. No partial dependencies on composite keys.
3. Non-key attributes depend only on primary keys.

---

## 🧰 Tools Used
- PostgreSQL / MySQL
- Draw.io (for ERD)
- GitHub (for version control)
