CREATE TABLE users (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    role VARCHAR(20) NOT NULL,
    trust_score INT DEFAULT 100
);

CREATE TABLE rooms (
    room_id INTEGER PRIMARY KEY AUTOINCREMENT,
    room_code VARCHAR(10) NOT NULL,
    building_number INT NOT NULL,
    building_name VARCHAR(50),
    floor INT NOT NULL,
    room_number INT NOT NULL,
    capacity INT
);

CREATE TABLE room_features (
    feature_id INTEGER PRIMARY KEY AUTOINCREMENT,
    feature_name VARCHAR(50) NOT NULL
);

CREATE TABLE room_feature_map (
    room_id INT NOT NULL,
    feature_id INT NOT NULL,
    PRIMARY KEY (room_id, feature_id),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id),
    FOREIGN KEY (feature_id) REFERENCES room_features(feature_id)
);

CREATE TABLE bookings (
    booking_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INT NOT NULL,
    room_id INT NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    status VARCHAR(20) DEFAULT 'confirmed',
    priority_score_used INT DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);

CREATE TABLE check_ins (
    checkin_id INTEGER PRIMARY KEY AUTOINCREMENT,
    booking_id INT NOT NULL,
    checkin_time DATETIME,
    method VARCHAR(20),
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);

CREATE TABLE staff_verifications (
    verification_id INTEGER PRIMARY KEY AUTOINCREMENT,
    booking_id INT NOT NULL,
    staff_user_id INT NOT NULL,
    verified_time DATETIME,
    notes VARCHAR(255),
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id),
    FOREIGN KEY (staff_user_id) REFERENCES users(user_id)
);

CREATE TABLE waitlist (
    waitlist_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INT NOT NULL,
    room_id INT NOT NULL,
    requested_time DATETIME,
    status VARCHAR(20) DEFAULT 'waiting',
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);
