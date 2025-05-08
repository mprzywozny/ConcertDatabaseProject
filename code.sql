/*Task 3: Create a view for the modified schema. The view must use a join and both GROUP BY and
HAVING clauses. Aim at demonstrating advanced SQL skills.*/
CREATE VIEW artist_ticket_sales AS
SELECT 
    a.artist_id,
    a.artist_name,
    COUNT(t.ticket_id) AS total_tickets_sold
FROM artists a
JOIN concert_artists ca ON a.artist_id = ca.artist_id
JOIN concerts c ON ca.concert_id = c.concert_id
JOIN tickets t ON c.concert_id = t.concert_id
GROUP BY a.artist_id, a.artist_name
HAVING COUNT(t.ticket_id) > 1000;

/*Task 4: Write one BEFORE and one AFTER trigger for the modified schema.*/
/*BEFORE Trigger*/
CREATE TRIGGER before_insert_fan_age_check
BEFORE INSERT ON fans
FOR EACH ROW
BEGIN
    
    IF NEW.age < 16 THEN
    
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Age must be 16 or older to sign up.';
    END IF;
END;

/*AFTER Trigger*/
CREATE TRIGGER after_insert_fan_type
AFTER INSERT ON fans
FOR EACH ROW
BEGIN
    IF NEW.age < 18 THEN
        UPDATE fans
        SET fan_type = 'child'
        WHERE fan_id = NEW.fan_id;
    END IF;
END;


/*Task 5: Write a stored function that returns the total number of occupied seats for a given concert_id.*/
DELIMITER $

CREATE FUNCTION total_occupied_seats(concert_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE sum_occupied_seats INT;
    SELECT COUNT(*)
    INTO sum_occupied_seats
    FROM tickets
    WHERE concert_id = concert_id;
    RETURN sum_occupied_seats;
END $

DELIMITER ;


/*Task 6: Write a stored procedure that checks whether a given song_id is associated with a given
album_id. If not, insert this association into the database. Additionally, adjust the song’s release
date if it is later than the album’s.*/
DELIMITER $$

CREATE PROCEDURE CheckAndInsertSongAlbum(
    IN input_song_id INT,
    IN input_album_id INT
)
BEGIN
    DECLARE album_release_date DATE;
    DECLARE song_release_date DATE;

    SELECT release_date INTO album_release_date
    FROM albums
    WHERE album_id = input_album_id;

    SELECT release_date INTO song_release_date
    FROM songs
    WHERE song_id = input_song_id;

    IF NOT EXISTS (
        SELECT 1
        FROM song_albums
        WHERE song_id = input_song_id AND album_id = input_album_id
    ) THEN
    
        INSERT INTO song_albums (song_id, album_id)
        VALUES (input_song_id, input_album_id);
    END IF;

    -- Update the song's release date if it is later than the album's release date
    IF song_release_date > album_release_date THEN
        UPDATE songs
        SET release_date = album_release_date
        WHERE song_id = input_song_id;
    END IF;
END$$

DELIMITER ;