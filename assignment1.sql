-- Question 1: HNL has the furthest distance
select dest, distance
from flights
order by distance DESC
LIMIT 1;

-- Question 2 Part 1: The number of engines are 1, 2, 3, 4
select engines
from planes
group by engines;

/*Question 2 Part 2: 
1-OTTER DHC-3 has 16 seats
2-777-200, 777-232, 777-224, and 777-222 each have 400 seats
3-A330-223
4-747-451
*/
select engines, model, seats
from planes
where seats >=
case
when engines = 2 then (select seats from planes where engines = 2 group by model order by seats desc limit 1)
when engines = 3 then (select seats from planes where engines = 3 order by seats desc limit 1)
when engines = 4 then (select seats from planes where engines = 4 order by seats desc limit 1)
else (select seats from planes where engines = 1 order by seats desc limit 1)
end
group by model
order by engines asc;


-- Question 3: There are 336,776 flights
select count(*)
from flights;

-- Question 4: Shown by running query
select carrier, count(carrier) AS NumberOfFlights
from flights
group by carrier;

-- Question 5: Shown by running query
select carrier, count(carrier) AS NumberOfFlights
from flights
group by carrier
order by NumberOfFlights DESC;

/*Question 6
UA - 58,665
B6 - 54,635
EV - 54, 173
DL - 48,110
AA - 32,729
*/
select carrier, count(carrier) AS NumberOfFlights
from flights
group by carrier
order by NumberOfFlights DESC
limit 5;

/*Question 7
UA - 41,135
B6 - 30,022
DL - 28,096
AA - 23,583
EV - 6,248
*/
select carrier, count(carrier) AS NumberOfFlights
from flights
where distance >= 1000
group by carrier
order by NumberOfFlights DESC
limit 5;

-- Question 8 Which carrier offers flights with the maximum total distance covered? UA - 89,705,524
select carrier, sum(distance) AS 'Total Distance'
from flights
group by carrier
order by 'Total Distance'
limit 1;