CREATE TABLE users (
    user_id uuid DEFAULT uuid_generate_v4(),
    user_name VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    PRIMARY KEY(user_id)
)