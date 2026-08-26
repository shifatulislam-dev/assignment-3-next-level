# Football Ticket Booking Database

A PostgreSQL practice assignment that models users, football matches, and ticket bookings. The SQL script creates the database tables, applies validation rules, inserts sample records, and demonstrates filtering, joins, subqueries, null handling, sorting, and pagination.

## Contents

- `query.sql` - table definitions, sample data, and seven SQL queries
- `README.md` - project documentation

## Database Model

The database contains three tables:

### `Users`

Stores customer and staff information.

- `user_id` - primary key
- `full_name` - required user name
- `email` - required and unique email address
- `role` - either `Ticket Manager` or `Football Fan`
- `phone_number` - optional contact number

### `Matches`

Stores football fixtures and ticket availability.

- `match_id` - primary key
- `fixture` - match pairing
- `tournament_category` - competition name
- `base_ticket_price` - non-negative ticket price
- `match_status` - `Available`, `Selling Fast`, `Sold Out`, or `Postponed`

### `Bookings`

Connects users to matches through foreign keys.

- `booking_id` - primary key
- `user_id` - references `Users(user_id)`
- `match_id` - references `Matches(match_id)`
- `seat_number` - optional seat identifier
- `payment_status` - optional status: `Pending`, `Confirmed`, `Cancelled`, or `Refunded`
- `total_cost` - non-negative booking cost

## Requirements

- PostgreSQL 9.5 or later
- Access to a PostgreSQL client such as `psql`, pgAdmin, or DBeaver

The script uses `ILIKE` for case-insensitive matching, so it is intended for PostgreSQL rather than generic SQL or SQLite.

## How to Run

1. Create or select a PostgreSQL database.
2. Open `query.sql` in your SQL client.
3. Execute the complete script.

Using `psql`:

```bash
psql -U <username> -d <database_name> -f query.sql
```

The first statements drop existing `Bookings`, `Matches`, and `Users` tables. Run the script only in a practice database because existing tables with those names will be recreated.

## Query Overview

1. Finds available Champions League matches.
2. Finds users whose names start with `Tanvir` or contain `Haque`.
3. Finds bookings without a payment status and labels them `Action Required` with `COALESCE`.
4. Uses `INNER JOIN` to display booking, user, match, and cost details together.
5. Uses `LEFT JOIN` to list every user, including users with no booking.
6. Uses a subquery to find bookings costing more than the average booking cost.
7. Sorts matches by ticket price and returns the second- and third-highest prices using `OFFSET` and `LIMIT`.

## Expected Learning Outcomes

This assignment provides practice with:

- Creating tables with primary keys, foreign keys, `NOT NULL`, `UNIQUE`, and `CHECK` constraints
- Inserting relational sample data
- Filtering rows with `WHERE`, `AND`, and `OR`
- Pattern matching with `ILIKE`
- Handling null values with `COALESCE`
- Combining related tables with inner and left joins
- Comparing values against an aggregate subquery
- Ordering and limiting query results

## Resetting the Dataset

To restore the original schema and sample records, run `query.sql` again. Because the script starts by dropping the three tables, it will remove any changes made to this practice dataset before rebuilding it.
