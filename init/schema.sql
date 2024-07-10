CREATE TABLE IF NOT EXISTS 'trips' (
    id VARCHAR PRIMARY KEY,
    destination VARCHAR NOT NULL,
    start_date DATETIME,
    end_date DATETIME,
    owner_name VARCHAR NOT NULL,
    owner_email VARCHAR NOT NULL,
    status INTEGER --1 para True, 0 para False
);

CREATE TABLE IF NOT EXISTS 'emails_to_invite' (
    id VARCHAR PRIMARY KEY,
    trip_id VARCHAR,
    email VARCHAR NOT NULL,
    FOREIGN KEY (trip_id) REFERENCES trips(id)
);

CREATE TABLE IF NOT EXISTS 'links' (
    id VARCHAR PRIMARY KEY,
    trip_id VARCHAR,
    link VARCHAR NOT NULL,
    title VARCHAR NOT NULL,
    FOREIGN KEY (trip_id) REFERENCES trips(id)
);
