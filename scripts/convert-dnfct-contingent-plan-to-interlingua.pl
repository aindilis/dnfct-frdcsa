#!/usr/bin/perl -w



# # [check_light(room5), if(occupied(room5), [bring(room6, room3), bring(room2, room6)], [bring(room2, room5), check_light(room3), if(occupied(room3), [bring(room6, room4)], [bring(room6, room3)])])]

# node(check_light_room5,'check_light(room5)'),
# decisionPoint(if_occupied_room5,'occupied(room5)'),
# unlabelledEdge(check_light_room5,if_occupied_room5),

# node(bring_room6_room3,'bring(room6,room3)'),
# node(bring_room2_room5,'bring(room2,room5)'),

# labelledEdge(if_occupied_room5,bring_room6_room3,'Yes'),
# labelledEdge(if_occupied_room5,bring_room2_room5,'No'),

# node(bring_room2_room6,'bring(room2,room6)'),
# unlabelledEdge(bring_room6_room3,bring_room2_room6),

# node(check_light_room3,'check_light(room3)'),
# unlabelledEdge(bring_room2_room5,check_light_room3),

# decisionPoint(if_occupied_room3,'occupied(room3)'),
# unlabelledEdge(check_light_room3,if_occupied_room3),

# node(bring_room6_room4,'bring(room6,room4)'),
# node(bring_room6_room3_2,'bring(room6,room3)'),

# labelledEdge(if_occupied_room3,bring_room6_room4,'Yes'),
# labelledEdge(if_occupied_room3,bring_room6_room3_2,'No')











# come up with a pantry planning domain here

# node(start,'Go to Food Pantry:\n1621 McCormick Dr, Flint, MI 48532'),
# unlabelledEdge(start,foodPantry),
# decisionPoint(foodPantry,'Able to get food?'),
# labelledEdge(foodPantry,cellPhone,'Yes'),
# labelledEdge(foodPantry,updateFoodPantryHours,'No'),
# node(cellPhone,'Go to Locust Wireless:\n1823 McCormick Dr., Flint, MI 48532'),
# node(updateFoodPantryHours,'Please update food pantry hours on form here:'),
# unlabelledEdge(updateFoodPantryHours,soupKitchen),
# node(soupKitchen,'Go to Soup Kitchen:\n443 Beecher Rd., Flint, MI 48503'),
# unlabelledEdge(soupKitchen,ableToGetMeal),
# decisionPoint(ableToGetMeal,'Able to get warm meal?'),
# labelledEdge(ableToGetMeal,cellPhone,'Yes'),
# labelledEdge(ableToGetMeal,goToMeijer,'No'),
# node(goToMeijer,'Go to Meijer:\n2333 H. Holland, Flint, MI 45519'),
# unlabelledEdge(cellPhone,ableToGetCellPhone),
# decisionPoint(ableToGetCellPhone,'Able to get free cell phone?'),
# labelledEdge(ableToGetCellPhone,callFLP,'Yes'),
# node(callFLP,'Call the Free Life Planner 1-800-GET-HELP')
