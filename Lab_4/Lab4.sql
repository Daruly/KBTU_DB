SELECT ticket_price FROM booking
    CASE 
    WHEN ticket_price < 5000 THEN "CHEAP"
    WHEN ticket_price BETWEEN 5000 AND 7500 THEN "MEDIUM"
    WHEN ticket_price > 7500 THEN "EXPENSIVE"


-- ORDER BY DESC()
