-- name: GetData :many
SELECT id, name, value FROM data;

-- name: GetUser :one
SELECT id, name, email, password_hash FROM Users
    WHERE email = $1;

-- name: GetUserChallenges :one
SELECT 
    id, 
    user_id,
    title,
    bet_amount,
    start_date,
    end_date,
    missed_days_count,
    max_allowed_missed_days,
    status,
    created_at FROM Challenges
    WHERE user_id = $1
