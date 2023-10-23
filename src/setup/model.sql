CREATE TABLE gallery_type (
	gallery_type_id serial PRIMARY KEY,
	gallery_type_name VARCHAR ( 50 ) UNIQUE NOT NULL
);

CREATE TABLE gallery (
	gallery_id serial PRIMARY KEY,
	gallery_type_id INT NOT NULL,
	gallery_name VARCHAR ( 50 ) UNIQUE NOT NULL,
	gallery_description VARCHAR ( 250 ),
	gallery_address VARCHAR ( 60 ),
	gallery_phone VARCHAR ( 12 ),
	gallery_is_open BOOLEAN DEFAULT TRUE,
	FOREIGN KEY (gallery_type_id)
      REFERENCES gallery_type (gallery_type_id),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP
);

CREATE TABLE room_type (
	room_type_id serial PRIMARY KEY,
	room_type_name VARCHAR ( 30 ) UNIQUE NOT NULL
);

CREATE TABLE room (
	room_id serial PRIMARY KEY,
	gallery_id INT NOT NULL,
	room_type_id INT NOT NULL,
	room_name VARCHAR ( 30 ) UNIQUE NOT NULL,
	FOREIGN KEY (gallery_id)
      REFERENCES gallery (gallery_id) ON DELETE CASCADE,
    FOREIGN KEY (room_type_id)
      REFERENCES room_type (room_type_id),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP
);

CREATE TABLE position (
	position_id serial PRIMARY KEY,
	position_name VARCHAR ( 30 ) UNIQUE NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP
);

CREATE TABLE personnel (
	personnel_id serial PRIMARY KEY,
	gallery_id INT NOT NULL,
	position_id INT,
	room_id INT,
	personnel_name VARCHAR ( 20 ) NOT NULL,
	personnel_surname VARCHAR ( 20 ) NOT NULL,
	personnel_phone VARCHAR ( 12 ) UNIQUE NOT NULL,
	FOREIGN KEY (gallery_id)
      REFERENCES gallery (gallery_id) ON DELETE CASCADE,
    FOREIGN KEY (room_id)
      REFERENCES room (room_id) ON DELETE SET NULL,
    FOREIGN KEY (position_id)
      REFERENCES position (position_id) ON DELETE SET NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP
);

CREATE TABLE exhibition_type (
	exhibition_type_id serial PRIMARY KEY,
	exhibition_type_name VARCHAR ( 50 ) UNIQUE NOT NULL
);

CREATE TABLE artist (
    artist_id serial PRIMARY KEY,
	artist_name VARCHAR ( 20 ) NOT NULL,
	artist_surname VARCHAR ( 20 ) NOT NULL,
    artist_information VARCHAR ( 150 ),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP
);

CREATE TABLE object_type (
	object_type_id serial PRIMARY KEY,
	object_type_name VARCHAR ( 30 ) UNIQUE NOT NULL
);

CREATE TABLE exhibition (
	exhibition_id serial PRIMARY KEY,
	gallery_id INT NOT NULL,
	exhibition_type_id INT NOT NULL,
	exhibition_title VARCHAR ( 50 ) UNIQUE NOT NULL,
	exhibition_description VARCHAR ( 250 ) NOT NULL,
	FOREIGN KEY (gallery_id)
      REFERENCES gallery (gallery_id) ON DELETE CASCADE,
    FOREIGN KEY (exhibition_type_id)
      REFERENCES exhibition_type (exhibition_type_id),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP
);

CREATE TABLE ticket (
    ticket_id serial PRIMARY KEY,
    exhibition_id INT NOT NULL,
    ticket_cost INT NOT NULL,
    ticket_is_checked BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (exhibition_id)
      REFERENCES exhibition (exhibition_id),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP
);

CREATE TABLE object (
    object_id serial PRIMARY KEY,
	exhibition_id INT,
	artist_id INT NOT NULL,
	type_id INT NOT NULL,
	object_name VARCHAR ( 70 ) UNIQUE NOT NULL,
	object_description VARCHAR ( 250 ) NOT NULL,
	FOREIGN KEY (exhibition_id)
      REFERENCES exhibition (exhibition_id) ON DELETE SET NULL,
	FOREIGN KEY (artist_id)
      REFERENCES artist (artist_id) ON DELETE CASCADE,
    FOREIGN KEY (type_id)
      REFERENCES object_type (object_type_id),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP
);

CREATE TABLE review (
    review_id serial PRIMARY KEY,
	exhibition_id INT NOT NULL,
	reviewer_name VARCHAR ( 70 ),
	review_mark INT,
	review_information VARCHAR ( 250 ) NOT NULL,
	FOREIGN KEY (exhibition_id)
      REFERENCES exhibition (exhibition_id) ON DELETE CASCADE,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE publication_author (
	publication_author_id serial PRIMARY KEY,
	publication_author_name VARCHAR ( 20 ) NOT NULL,
	publication_author_surname VARCHAR ( 20 ) NOT NULL,
    publication_author_information VARCHAR ( 150 ),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP
);

CREATE TABLE publication (
	publication_id serial PRIMARY KEY,
	author_id INT,
	exhibition_id INT NOT NULL,
	publication_title VARCHAR ( 50 ) UNIQUE NOT NULL,
	publication_description VARCHAR ( 250 ) NOT NULL,
	FOREIGN KEY (author_id)
      REFERENCES publication_author (publication_author_id) ON DELETE SET NULL,
    FOREIGN KEY (exhibition_id)
      REFERENCES exhibition (exhibition_id) ON DELETE CASCADE,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP
);