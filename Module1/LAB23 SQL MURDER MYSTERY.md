![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)
# Lab | SQL Murder Mystery

## Introduction

In this lab we will continue to learn SQL via some kind of gamefication.

## Getting Started
Please go [here] (https://mystery.knightlab.com/) and read the task. 
Please save the final code in your repo in Github and send the name of the killer to your TA.
Enjoy :)


## Deliverables

- a file with the queries

# find description of the murder
SELECT * from crime_scene_report
WHERE crime_scene_report.type = "murder" 
AND lower(crime_scene_report.city) = 'sql city' AND crime_scene_report.date = '20180115';

# find witnesses and their coments (transcription)

SELECT * FROM interview 
JOIN person ON person.id = interview.person_id 
WHERE (person.address_street_name = 'Northwestern Dr') 
OR (person.name LIKE '%Annabel%' AND person.address_street_name = 'Franklin Ave'); 
# find suspect 
SELECT * FROM get_fit_now_member
JOIN get_fit_now_check_in 
ON get_fit_now_member.id = membership_id 
WHERE membership_status = 'gold' 
	AND membership_id LIKE '48Z%'; 

# after two suspects, examine next condition (driver licence)          
SELECT person.name, person.license_id FROM person 
join drivers_license
on person.license_id =drivers_license.id
WHERE person.id in ('28819', '67318')
and drivers_license.plate_number LIKE '%H42W%';




- killer's name: Jeremy Bowers




