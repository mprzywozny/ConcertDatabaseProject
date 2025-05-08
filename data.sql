INSERT INTO artists (artist_id, artist_name, genre, debut_year) VALUES
(1, 'Ariana Grande', 'Pop', 2013),
(2, 'Ed Sheeran', 'Pop', 2011);

INSERT INTO albums (album_id, album_title, release_date) VALUES
(1, 'Dangerous Woman', '20/05/2016'),
(2, 'Divide', '03/03/2017');

INSERT INTO album_artists (album_id, artist_id) VALUES
(1, 1),
(2, 2);

INSERT INTO songs (song_id, song_title, length, release_date) VALUES
(1, 'Into You', 4.04, '22/03/2016'),
(2, 'Shape of You', 3.53, '06/01/2017');

INSERT INTO song_albums (song_id, album_id) VALUES
(1, 1),
(2, 2);

INSERT INTO concerts (concert_id, concert_title, location, date_of_concert) VALUES
(1, 'Sweetener World Tour', 'Madison Square Garden', '15/03/2024'),
(2, 'Mathematics Tour', 'The O2 Arena', '10/05/2024');


INSERT INTO concert_artists (concert_id, artist_id) VALUES
(1, 1), 
(2, 2); 


INSERT INTO concert_songs (concert_id, song_id, order_performance) VALUES
(1, 1, 1), 
(2, 2, 1); 


INSERT INTO fans (fan_id, fan_name, fan_email, age) VALUES
(1, 'Emily Johnson', 'emilyj777@gmail.com', 16),
(2, 'Michael Brian', 'mikebrian8821@gmail.com', 49);


INSERT INTO fan_favourite_artists (fan_id, artist_id) VALUES
(1, 1),
(2, 2); 


INSERT INTO tickets (ticket_id, concert_id, purchase_date, ticket_price, seat_zone, seat_number) VALUES
(1, 1, '01/02/2024', 180.00, 'VIP', 'C1'),
(2, 2, '01/04/2024', 120.00, 'General', 'F10');


INSERT INTO fan_tickets (fan_id, ticket_id) VALUES
(1, 1),
(2, 2); 
