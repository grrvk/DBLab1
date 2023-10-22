CREATE TABLE gallery_type (
	gallery_type_id serial PRIMARY KEY,
	name VARCHAR ( 50 ) UNIQUE NOT NULL
);

CREATE TABLE gallery (
	gallery_id serial PRIMARY KEY,
	gallery_type_id INT NOT NULL,
	name VARCHAR ( 50 ) UNIQUE NOT NULL,
	description VARCHAR ( 250 ) NOT NULL,
	address VARCHAR ( 60 ) NOT NULL,
	phone VARCHAR ( 12 ) NOT NULL,
	is_open BOOLEAN NOT NULL DEFAULT TRUE,
	FOREIGN KEY (gallery_type_id)
      REFERENCES gallery_type (gallery_type_id),
	created_at TIMESTAMP NOT NULL,
	updated_at TIMESTAMP
);

CREATE TABLE room_type (
	room_type_id serial PRIMARY KEY,
	name VARCHAR ( 30 ) UNIQUE NOT NULL
);

CREATE TABLE room (
	room_id serial PRIMARY KEY,
	gallery_id INT NOT NULL,
	room_type_id INT NOT NULL,
	name VARCHAR ( 30 ) UNIQUE NOT NULL,
	FOREIGN KEY (gallery_id)
      REFERENCES gallery (gallery_id),
    FOREIGN KEY (room_type_id)
      REFERENCES room_type (room_type_id),
	created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP
);

CREATE TABLE position (
	position_id serial PRIMARY KEY,
	name VARCHAR ( 30 ) UNIQUE NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP
);

CREATE TABLE personnel (
	personnel_id serial PRIMARY KEY,
	gallery_id INT NOT NULL,
	position_id INT NOT NULL,
	room_id INT,
	name VARCHAR ( 20 ) NOT NULL,
	surname VARCHAR ( 20 ) NOT NULL,
	phone VARCHAR ( 12 ) UNIQUE NOT NULL,
	FOREIGN KEY (gallery_id)
      REFERENCES gallery (gallery_id),
    FOREIGN KEY (room_id)
      REFERENCES room (room_id),
    FOREIGN KEY (position_id)
      REFERENCES position (position_id),
	created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP
);

CREATE TABLE exhibition_type (
	exhibition_type_id serial PRIMARY KEY,
	name VARCHAR ( 50 ) UNIQUE NOT NULL
);

CREATE TABLE author (
    author_id serial PRIMARY KEY,
	name VARCHAR ( 20 ) NOT NULL,
	surname VARCHAR ( 20 ) NOT NULL,
    information VARCHAR ( 150 ),
	created_at TIMESTAMP NOT NULL,
	updated_at TIMESTAMP
);

CREATE TABLE object_type (
	object_type_id serial PRIMARY KEY,
	name VARCHAR ( 30 ) UNIQUE NOT NULL
);

CREATE TABLE exhibition (
	exhibition_id serial PRIMARY KEY,
	gallery_id INT NOT NULL,
	exhibition_type_id INT NOT NULL,
	title VARCHAR ( 50 ) UNIQUE NOT NULL,
	description VARCHAR ( 250 ) NOT NULL,
	FOREIGN KEY (gallery_id)
      REFERENCES gallery (gallery_id),
    FOREIGN KEY (exhibition_type_id)
      REFERENCES exhibition_type (exhibition_type_id),
	created_at TIMESTAMP NOT NULL,
	updated_at TIMESTAMP
);

CREATE TABLE object (
    object_id serial PRIMARY KEY,
	exhibition_id INT NOT NULL,
	author_id INT NOT NULL,
	type_id INT NOT NULL,
	name VARCHAR ( 70 ) UNIQUE NOT NULL,
	description VARCHAR ( 250 ) NOT NULL,
	FOREIGN KEY (exhibition_id)
      REFERENCES exhibition (exhibition_id),
	FOREIGN KEY (author_id)
      REFERENCES author (author_id),
    FOREIGN KEY (type_id)
      REFERENCES object_type (object_type_id),
	created_at TIMESTAMP NOT NULL,
	updated_at TIMESTAMP
);

CREATE TABLE review (
    review_id serial PRIMARY KEY,
	exhibition_id INT NOT NULL,
	reviewer_name VARCHAR ( 70 ) UNIQUE NOT NULL,
	information VARCHAR ( 250 ) NOT NULL,
	FOREIGN KEY (exhibition_id)
      REFERENCES exhibition (exhibition_id),
	created_at TIMESTAMP NOT NULL
);

CREATE TABLE publication_author (
	publication_author_id serial PRIMARY KEY,
	name VARCHAR ( 20 ) NOT NULL,
	surname VARCHAR ( 20 ) NOT NULL,
    information VARCHAR ( 150 ),
	created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP
);

CREATE TABLE publication (
	publication_id serial PRIMARY KEY,
	author_id INT NOT NULL,
	exhibition_id INT NOT NULL,
	title VARCHAR ( 50 ) UNIQUE NOT NULL,
	description VARCHAR ( 250 ) NOT NULL,
	FOREIGN KEY (author_id)
      REFERENCES publication_author (publication_author_id),
    FOREIGN KEY (exhibition_id)
      REFERENCES exhibition (exhibition_id),
	created_at TIMESTAMP NOT NULL,
	updated_at TIMESTAMP
);