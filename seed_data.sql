INSERT INTO users (full_name, email, role, trust_score) VALUES
('Maria Santos',   'maria.santos@school.edu',   'student', 95),
('John Dela Cruz', 'john.delacruz@school.edu',  'student', 60),
('Ana Reyes',      'ana.reyes@school.edu',      'faculty', 100),
('Carlo Mendoza',  'carlo.mendoza@school.edu',  'org',     80),
('Grace Villanueva','grace.villanueva@school.edu','janitor',100),
('Rico Bautista',  'rico.bautista@school.edu',  'admin',   100);

INSERT INTO rooms (room_code, building_number, building_name, floor, room_number, capacity) VALUES
('3104', 3, 'Engineering',        1, 4,  25),
('2305', 2, 'Comp Lab',           3, 5,  25),
('5201', 5, 'Senior High',        2, 1,  30),
('6201', 6, 'Canteen / MPH',      2, 1,  100),
('7306', 7, 'Law',                3, 6,  30);

INSERT INTO room_features (feature_name) VALUES
('Aircon'),
('TV'),
('Projector');

INSERT INTO room_feature_map (room_id, feature_id) VALUES
(1, 1), (1, 2),
(2, 1), (2, 3),
(3, 1), (3, 2), (3, 3),
(4, 3),
(5, 1), (5, 3);

INSERT INTO bookings (user_id, room_id, start_time, end_time, status, priority_score_used) VALUES
(1, 1, '2026-09-14 09:00:00', '2026-09-14 10:00:00', 'completed', 5),
(2, 2, '2026-09-14 10:00:00', '2026-09-14 11:00:00', 'no-show',   5),
(3, 3, '2026-09-14 13:00:00', '2026-09-14 14:30:00', 'completed', 10),
(4, 1, '2026-09-15 09:00:00', '2026-09-15 10:00:00', 'cancelled', 5),
(1, 4, '2026-09-15 11:00:00', '2026-09-15 12:00:00', 'completed', 5),
(2, 5, '2026-09-15 14:00:00', '2026-09-15 15:00:00', 'no-show',   5);

INSERT INTO check_ins (booking_id, checkin_time, method) VALUES
(1, '2026-09-14 09:02:00', 'QR'),
(3, '2026-09-14 13:03:00', 'QR'),
(5, '2026-09-15 11:01:00', 'QR'),
(2, NULL, NULL),
(6, NULL, NULL);

INSERT INTO staff_verifications (booking_id, staff_user_id, verified_time, notes) VALUES
(2, 5, '2026-09-14 10:15:00', 'Confirmed empty room, marked as no-show'),
(6, 5, '2026-09-15 14:15:00', 'Confirmed empty room, marked as no-show'),
(4, 6, '2026-09-15 09:10:00', 'Booking cancelled by user before start'),
(1, 5, '2026-09-14 09:05:00', 'Room in use as expected'),
(3, 6, '2026-09-14 13:05:00', 'Room in use as expected');

INSERT INTO waitlist (user_id, room_id, requested_time, status) VALUES
(3, 2, '2026-09-14 10:05:00', 'claimed'),
(4, 2, '2026-09-14 10:05:00', 'expired'),
(2, 1, '2026-09-15 09:05:00', 'claimed'),
(1, 5, '2026-09-15 14:05:00', 'offered'),
(3, 5, '2026-09-15 14:05:00', 'waiting');
