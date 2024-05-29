CREATE DATABASE IF NOT EXISTS oasis;
USE oasis;
DROP table IF EXISTS subs;

CREATE TABLE subs (
    subs_id INT AUTO_INCREMENT PRIMARY KEY not null,
    subs_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    subs_user_id INT NOT NULL,
    subs_game_id INT,
    subs_art_id INT,
    subs_status boolean,
    CONSTRAINT fk_user FOREIGN KEY (subs_user_id) REFERENCES user(user_id),
    CONSTRAINT fk_game FOREIGN KEY (subs_game_id) REFERENCES game(game_id)-- ,
    -- CONSTRAINT fk_art FOREIGN KEY (subs_art_id) REFERENCES art(art_id) 
);

INSERT INTO subs (subs_user_id, subs_game_id, subs_art_id, subs_status) VALUES
(1, 1, 1, TRUE),
(2, 2, 2, FALSE),
(1, 3, NULL, TRUE),
(3, NULL, 4, FALSE),
(2, 5, 5, TRUE),
(4, 6, NULL, FALSE),
(3, 7, 7, TRUE),
(1, NULL, 8, FALSE),
(2, 9, 9, TRUE),
(4, 10, 10, FALSE);