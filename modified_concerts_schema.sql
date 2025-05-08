CREATE TABLE artists (
  artist_id INTEGER(10) PRIMARY KEY,
  artist_name VARCHAR(128) NOT NULL,
  genre VARCHAR(64),
  debut_year YEAR
);

CREATE TABLE albums (
  album_id INTEGER(10) PRIMARY KEY,
  album_title VARCHAR(256) NOT NULL,
  release_date DATE
);

CREATE TABLE album_artists (
  album_id INTEGER(10),
  artist_id INTEGER(10),
  PRIMARY KEY (album_id, artist_id),
  FOREIGN KEY (album_id) REFERENCES albums(album_id),
  FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

CREATE TABLE songs (
  song_id INTEGER(10) PRIMARY KEY,
  song_title VARCHAR(128) NOT NULL,
  length REAL,
  release_date DATE
);

CREATE TABLE song_albums (
  song_id INTEGER(10),
  album_id INTEGER(10),
  PRIMARY KEY (song_id, album_id),
  FOREIGN KEY (song_id) REFERENCES songs(song_id),
  FOREIGN KEY (album_id) REFERENCES albums(album_id)
);

CREATE TABLE concerts (
  concert_id INTEGER(10) PRIMARY KEY,
  concert_title VARCHAR(256) NOT NULL,
  location VARCHAR(256),
  date_of_concert DATE
);

CREATE TABLE concert_artists (
  concert_id INTEGER(10),
  artist_id INTEGER(10),
  PRIMARY KEY (concert_id, artist_id),
  FOREIGN KEY (concert_id) REFERENCES concerts(concert_id),
  FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

CREATE TABLE concert_songs (
  concert_id INTEGER(10),
  song_id INTEGER(10),
  order_performance TINYINT(4),
  PRIMARY KEY (concert_id, song_id),
  FOREIGN KEY (concert_id) REFERENCES concerts(concert_id),
  FOREIGN KEY (song_id) REFERENCES songs(song_id)
);

CREATE TABLE fans (
  fan_id INTEGER(10) PRIMARY KEY,
  fan_name VARCHAR(128) NOT NULL,
  fan_email VARCHAR(128) UNIQUE NOT NULL,
  age TINYINT(3)
  fan_type VARCHAR(20) DEFAULT 'adult'
);

CREATE TABLE fan_favourite_artists (
  fan_id INTEGER(10),
  artist_id INTEGER(10),
  PRIMARY KEY (fan_id, artist_id),
  FOREIGN KEY (fan_id) REFERENCES fans(fan_id),
  FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

CREATE TABLE tickets (
  ticket_id INTEGER(10) PRIMARY KEY,
  concert_id INTEGER(10),
  purchase_date DATE,
  ticket_price DOUBLE,
  seat_zone VARCHAR(16),
  seat_number VARCHAR(16),
  FOREIGN KEY (concert_id) REFERENCES concerts(concert_id)
);

CREATE TABLE fan_tickets (
  fan_id INTEGER(10),
  ticket_id INTEGER(10),
  PRIMARY KEY (fan_id, ticket_id),
  FOREIGN KEY (fan_id) REFERENCES fans(fan_id),
  FOREIGN KEY (ticket_id) REFERENCES tickets(ticket_id)
);
