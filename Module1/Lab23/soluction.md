The results show 2 witnesses information, based on the date, city and type of murder 

SELECT * FROM crime_scene_report WHERE type='murder'and date=20180115 and city='SQL City';

Witness 1

	SELECT * FROM person WHERE name LIKE "Annabel%" and address_street_name="Franklin Ave”;

Witness 2

	SELECT * FROM person WHERE address_street_name="Northwestern Dr" ORDER BY address_number DESC LIMIT 1;

Seraching for the interview of the witness in relations with the person id

	SELECT transcript, person_id FROM interview WHERE person_id in (16371,14887) ;

Getting thre result Jeremy Bowers

	SELECT person.name, membership_start_date, gender, eye_color as eyes, hair_color as hair, plate_number FROM get_fit_now_member g JOIN person ON g.person_id = person.id JOIN drivers_license dl ON person.license_id = dl.id WHERE dl.plate_number LIKE "%H42W%" and gender='male' and membership_status='gold'

Challenge 2 cheking interview of Jeremy Bowers

	SELECT transcript, person_id FROM interview i JOIN person p ON i.person_id=p.id WHERE p.name='Jeremy Bowers' ;

Chech the mastermind of the murder = Miranda Priestly

	SELECT person.name,gender, car_make, hair_color as hair, car_model, event_name FROM facebook_event_checkin f JOIN person ON f.person_id = person.id JOIN drivers_license dl ON person.license_id = dl.id WHERE gender='female' and hair='red' and car_make='Tesla' GROUP BY event_name

Murder Jeremy Bowers
Master Mind Miranda Priestly

https://mystery.knightlab.com