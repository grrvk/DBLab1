--get total income based on tickets cost amount for exhibition

CREATE OR REPLACE FUNCTION get_total_income_for_exhibition(
    exhID INT
) RETURNS INT
LANGUAGE plpgsql
AS $$
    DECLARE total INT;
BEGIN
        SELECT SUM(ticket_cost) INTO total FROM ticket WHERE exhibition_id = exhID;
        RETURN total;
END;
$$;