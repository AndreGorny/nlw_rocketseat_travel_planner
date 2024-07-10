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

CREATE TABLE IF NOT EXISTS 'participants' (
    id VARCHAR PRIMARY KEY,
    trip_id VARCHAR NOT NULL,
    emails_to_invite_id VARCHAR NOT NULL,
    name VARCHAR NOT NULL,
    is_confirmed INTEGER, -- 1 para verdadeiro, 0 para falso
    FOREIGN KEY (trip_id) REFERENCES trips(id),
    FOREIGN KEY (emails_to_invite_id) REFERENCES emails_to_invite(id)
);

CREATE TABLE IF NOT EXISTS 'activities' (
    id VARCHAR PRIMARY KEY,
    trip_id VARCHAR NOT NULL,
    title VARCHAR NOT NULL,
    occurs_at DATETIME,
    FOREIGN KEY (trip_id) REFERENCES trips(id)
);
