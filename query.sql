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
