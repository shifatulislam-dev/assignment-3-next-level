DROP TABLE IF EXISTS Bookings;
DROP TABLE IF EXISTS Matches;
DROP TABLE IF EXISTS Users;

-- 1. USERS TABLE
CREATE TABLE Users (
    user_id INTEGER PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    role VARCHAR(30) NOT NULL,
    phone_number VARCHAR(20),

    CONSTRAINT chk_users_role
        CHECK (role IN ('Ticket Manager', 'Football Fan'))
);

-- 2. MATCHES TABLE
CREATE TABLE Matches (
    match_id INTEGER PRIMARY KEY,
    fixture VARCHAR(150) NOT NULL,
    tournament_category VARCHAR(100) NOT NULL,
    base_ticket_price NUMERIC(10, 2) NOT NULL,
    match_status VARCHAR(30) NOT NULL,

    CONSTRAINT chk_matches_ticket_price
        CHECK (base_ticket_price >= 0),

    CONSTRAINT chk_matches_status
        CHECK (
            match_status IN (
                'Available',
                'Selling Fast',
                'Sold Out',
                'Postponed'
            )
        )
);

-- 3. BOOKINGS TABLE
CREATE TABLE Bookings (
    booking_id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    match_id INTEGER NOT NULL,
    seat_number VARCHAR(20),
    payment_status VARCHAR(30),
    total_cost NUMERIC(10, 2) NOT NULL,

    CONSTRAINT fk_bookings_user
        FOREIGN KEY (user_id)
        REFERENCES Users(user_id),

    CONSTRAINT fk_bookings_match
        FOREIGN KEY (match_id)
        REFERENCES Matches(match_id),

    CONSTRAINT chk_bookings_total_cost
        CHECK (total_cost >= 0),

    CONSTRAINT chk_bookings_payment_status
        CHECK (
            payment_status IS NULL
            OR payment_status IN (
                'Pending',
                'Confirmed',
                'Cancelled',
                'Refunded'
            )
        )
);
