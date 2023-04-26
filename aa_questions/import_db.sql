DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

PRAGMA foreign_keys = ON;


CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);


CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    associated_author_id INTEGER NOT NULL,
    FOREIGN KEY (associated_author_id) REFERENCES users(id)
);


CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);


CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    previous_reply_id INTEGER,
    associated_author_id INTEGER NOT NULL,
    body TEXT NOT NULL,


    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (previous_reply_id) REFERENCES replies(id),
    FOREIGN KEY (associated_author_id) REFERENCES users(id)
)


CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
    users (fname, lname)
VALUES
    ('Shanna', 'Le'),
    ('Akea', 'Tolentino');

INSERT INTO
    questions (title, body, associated_author_id)
VALUES 
    ('how do I code this', "I don't know how to code this, I need help", 
    (SELECT id FROM users WHERE fname = 'Akea' AND lname = 'Tolentino'));

INSERT INTO 
    question_follows (question_id, user_id)
VALUES 
    ((SELECT id FROM questions WHERE title = 'how do I code this'),
    (SELECT id FROM users WHERE fname = 'Shanna' AND lname = 'Le'));

INSERT INTO 
    replies (question_id, previous_reply_id, associated_author_id, body)
VALUES 
    ((SELECT id FROM questions WHERE title = 'how do I code this'), NULL, 
    (SELECT id FROM users WHERE fname = 'Shanna' AND lname = 'Le'), "I don't know either. Ask someone else.")

INSERT INTO 
    question_likes (question_id, user_id)
VALUES 
    ((SELECT id FROM users WHERE fname = 'Shanna' AND lname = 'Le'),
    (SELECT id FROM questions WHERE title = 'how do I code this'))


    



