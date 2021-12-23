/*
	Email campaign: E-commerce store sending users their most recently viewed item 
*/

-- Get users most recently viewed items
SELECT 
	users.id 			AS user_id,
	user.email_address,
	item_id 			AS item_id,
	item.name 			AS item_name,
	items.catefory 		AS item_category
	
FROM 
  (
  SELECT 
    user_id,
    item_id,
    event_time,
    ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY event_time DESC)
      AS view_number
  FROM 
    dsv1069.view_item_events
  ) recent_views 
JOIN
  dsv1069.users
ON 
  users.id = recent_views.user_id
JOIN
  dsv1069.items
ON 
  items.id = recent_views.item_id
WHERE
	-- get most recently viewed item
	view_number = 1
AND
	-- remove users that have deleted their account
	users.deleted_at IS NOT NULL