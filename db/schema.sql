-- Users Table
CREATE TABLE Users (
    id UUID PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE INDEX idx_users_email ON Users(email);

-- Challenges Table
CREATE TABLE Challenges (
    id UUID PRIMARY KEY,
    user_id UUID NOT NULL REFERENCES Users(id),
    title VARCHAR(255) NOT NULL,
    bet_amount DECIMAL(10, 2) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    missed_days_count INT DEFAULT 0 NOT NULL,
    max_allowed_missed_days INT NOT NULL,
    status VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

-- CheckIns Table
CREATE TABLE CheckIns (
    id UUID PRIMARY KEY,
    user_id UUID NOT NULL REFERENCES Users(id),
    challenge_id UUID NOT NULL REFERENCES Challenges(id),
    date DATE NOT NULL,
    checked BOOLEAN DEFAULT FALSE NOT NULL,
    CONSTRAINT unique_checkin UNIQUE (user_id, challenge_id, date)
);

CREATE INDEX idx_checkins_date ON CheckIns(date);

