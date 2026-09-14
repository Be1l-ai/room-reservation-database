-- 1. JOIN
-- Shows every booking together with the requester's name and the room booked.
SELECT
    b.booking_id,
    u.full_name AS requester,
    r.room_code,
    b.start_time,
    b.end_time,
    b.status
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN rooms r ON b.room_id = r.room_id
ORDER BY b.start_time;


-- 2. WHERE
-- Finds all bookings that ended up as no-shows or cancellations
SELECT booking_id, user_id, room_id, start_time, status
FROM bookings
WHERE status IN ('no-show', 'cancelled');


-- 3. GROUP BY + COUNT (aggregate)
-- Counts how many times each room has been booked, to spot
SELECT
    r.room_code,
    COUNT(b.booking_id) AS times_booked
FROM rooms r
LEFT JOIN bookings b ON r.room_id = b.room_id
GROUP BY r.room_code
ORDER BY times_booked DESC;


-- 4. GROUP BY + AVG (aggregate)
-- Average trust score per user role, to see which group is
SELECT
    role,
    AVG(trust_score) AS avg_trust_score,
    COUNT(*) AS num_users
FROM users
GROUP BY role
ORDER BY avg_trust_score DESC;


-- 5. JOIN + WHERE + GROUP BY + COUNT (aggregate)
-- Counts waitlist entries per room, filtered to only rooms
SELECT
    r.room_code,
    COUNT(w.waitlist_id) AS waitlist_count
FROM waitlist w
JOIN rooms r ON w.room_id = r.room_id
WHERE w.status IN ('waiting', 'offered')
GROUP BY r.room_code
HAVING COUNT(w.waitlist_id) >= 1
ORDER BY waitlist_count DESC;
