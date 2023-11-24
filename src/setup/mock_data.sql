--gallery_type mock
INSERT INTO gallery_type (gallery_type_name) VALUES ('Artist-Run');

--exhibition_type mock
INSERT INTO exhibition_type (exhibition_type_name) VALUES ('Fine arts');

--object_type mock
INSERT INTO object_type (object_type_name) VALUES ('Picture');
INSERT INTO object_type (object_type_name) VALUES ('Sculpture');

--gallery mock
INSERT INTO gallery (gallery_type_id, gallery_name, gallery_description, gallery_address, gallery_phone)
VALUES (1, 'New gallery', 'Description', 'Street City', '380503333333');

--exhibition mock
INSERT INTO exhibition (gallery_id, exhibition_type_id, exhibition_title, exhibition_description)
VALUES (1, 1, 'First exhibition', 'Modern fine arts display');

--artist mock
INSERT INTO artist (artist_name, artist_surname, artist_information)
VALUES ('Name', 'Surname', 'Draws in his sleep');

--exhibition object mock
INSERT INTO object (exhibition_id, artist_id, type_id, object_name, object_description)
VALUES (1, 1, 1, 'Picture of cat', 'Very cool');
INSERT INTO object (exhibition_id, artist_id, type_id, object_name, object_description)
VALUES (1, 1, 2, 'Sculpture of cat', 'Very cool too');

--ticket mock
INSERT INTO ticket (exhibition_id, ticket_cost, ticket_is_checked)
VALUES (1, 12, False);

