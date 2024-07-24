-- First query: Retrieve all records from owners and vehicles tables
-- using FULL OUTER JOIN to include all owners and vehicles, even if there are no matches.
SELECT * FROM owners o 
FULL OUTER JOIN vehicles v 
  ON o.id = v.owner_id;

-- Second query: Retrieve the first and last names of owners and the count of vehicles they own.
-- It joins the owners and vehicles tables on the owner's ID and groups the results by first and last name.
-- Results are ordered by the owner's first name.
SELECT first_name, last_name, 
  COUNT(owner_id) as vehicle_count
FROM owners o 
JOIN vehicles v on o.id = v.owner_id 
GROUP BY (first_name, last_name) 
ORDER BY first_name;

-- Third query: Retrieve the first and last names of owners, average price of their vehicles, 
-- and the count of vehicles they own. 
-- The results include only owners with more than one vehicle and an average vehicle price over 10,000.
-- Results are ordered by the owner's first name in descending order.
SELECT 
  first_name, last_name, 
  ROUND(AVG(price)) as average_price, 
  COUNT(owner_id) as vehicle_count
FROM owners o 
JOIN vehicles v on o.id = v.owner_id 
GROUP BY 
  (first_name, last_name) 
HAVING 
  COUNT(owner_id) > 1 AND ROUND(AVG(price)) > 10000 
ORDER BY first_name DESC;
