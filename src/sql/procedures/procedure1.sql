--create artist

CREATE OR REPLACE PROCEDURE create_artist(
    a_name VARCHAR(20),
    a_surname VARCHAR(20),
    a_information VARCHAR(150)
)
LANGUAGE plpgsql
AS $$
    BEGIN
        INSERT INTO artist(artist_name, artist_surname, artist_information)
        VALUES (a_name,a_surname, a_information);
    END;
$$;


