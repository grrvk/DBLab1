--create artist

CREATE OR REPLACE PROCEDURE create_ticket(
    t_exhibition_id INT,
    t_ticket_cost INT,
    b_buyer_name VARCHAR(50),
    b_buyer_surname VARCHAR(70),
    b_buyer_phone VARCHAR(12),
    b_buyer_email VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
    DECLARE
        t_id INT;
    BEGIN
        INSERT INTO ticket(exhibition_id, ticket_cost)
        VALUES (t_exhibition_id,t_ticket_cost) RETURNING ticket_id INTO t_id;
        INSERT INTO buyer(ticket_id, buyer_name, buyer_surname,
                          buyer_phone, buyer_email)
        VALUES (t_id,b_buyer_name, b_buyer_surname, b_buyer_phone,
                b_buyer_email);
    END;
$$;