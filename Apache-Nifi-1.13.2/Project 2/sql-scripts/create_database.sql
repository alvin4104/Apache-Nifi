USE sakila;

CREATE TABLE youtube_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    video_title VARCHAR(255),
    video_description TEXT,
    channel_name VARCHAR(255),
    published_at DATETIME
);
