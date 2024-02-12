SELECT
    gusto_guests.id,
    reservation_id
FROM gusto_guests, gusto_reservations
WHERE
    gusto_reservations.id = gusto_guests.reservation_id AND gusto_reservations.cancelled = FALSE AND gusto_reservations.reservation_date >= '2059-12-03 18:00:00' AND gusto_reservations.reservation_date <= '2059-12-03 21:00:00';
