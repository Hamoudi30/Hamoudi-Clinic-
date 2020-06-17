create database clinic_system;

use clinic_system; 
 
create table patients (
	patient_id int primary key auto_increment, 
    fname varchar(201), 
    lname varchar(201), 
    patient_type int not null, 
    age int not null, 
	address varchar(201)
); 
 
create table treatment (
	treat_id int primary key auto_increment, 
    treat_type int not null
); 
 
create table equipments (
	equip_id int not null primary key auto_increment, 
    equip_name varchar(200), 
    requested_date int not null, 
    date_defected int not null
);
 
create table medicines (
	med_id int primary key auto_increment, 
    med_name varchar(200),
    quantity int not null, 
    ava_qty int not null , 
    expiry_date int not null, 
	requested_date int not null
);
 
create table check_up (
	check_id int not null primary key auto_increment,
    findings varchar(200)
);
 
insert into patients (fname, lname, patient_type, age, address) 
	values	('omar', 'ashraf', 1, 20, 'alexandria'),
			('seif', 'ahmed', 2, 22, 'cairo'),
            ('aly', 'hesham', 3, 19, 'sainai'),
            ('taha', 'maher', 4, 21, 'alexandria');
 
insert into treatment (treat_type)
	values	(1),
			(2),
            (3),
            (4);
 
insert into equipments (equip_name, requested_date, date_defected)
		values	('gloves', 2020, 2022),
				('blood_pressure_monitors',2021 , 2023),
                ('otoscopes',2022 , 2024),
                ('syringes',2023 , 2025);
 
insert into medicines (med_name, quantity, ava_qty, expiry_date, requested_date)
		values 	('ketofan',10,9, 2020, 2022),
				('congistal',10,9,2021 , 2023),
                ('reepo',10,9,2022 , 2024),
                ('tidex',10,9,2023 , 2025);
 
insert into check_up (findings)
		values	('yes'),
			('no'),
			('yes'),
			('no');
				
select * from patients; 
select * from patients order by age desc limit 3; 
select * from patients where age > 20;
select MAX(age) from patients; 
select MIN(age) from patients; 
select AVG(age) from patients;
 
select * from medicines; 
 
select concat ('ahmed','mohaed'); 
select SQRT(25);
select Char (69);  
select lower(fname)	from patients;
select Upper(lname)	from patients;
select Difference ('Hamoudi','Hamoudy');  
select CharIndex ('d','Muhammad');
select len('Hamoudi'); 
 
select * from check_up; 
select check_id from check_up where findings = 'yes'; 
select check_id from check_up where findings = 'no'; 
 
select * from treatment; 
select count(treat_type) from treatment;
select MAX(treat_type) from treatment; 
select MIN(treat_type) from treatment; 
 
select * from patients where patient_type in (select treat_type from treatment where treat_type = patient_type); 
select * from medicines where med_id in (select treat_type from treatment where med_id = treat_type); 
select * from check_up where check_id in (select equip_id from equipments where equip_id = check_id); 
select * from patients where patient_type in (select equip_id from equipments where equip_id = patient_type); 
 
select count(patient_id), address from patients group by address; 
select count(check_id), findings from check_up group by findings; 
 
 
update patients set age = 20 where fname = 'aly'; 
update treatment set treat_type = 3 where treat_id = 1; 
update medicines set ava_qty = 20 where med_id = 2;
update check_up set findings = 'no' where check_id = 1; 
update equipments set date_defected = 2030 where equip_id = 1; 
update medicines set quantity = 20, ava_qty = 11 where med_id = 2; 
update medicines set quantity = 50, ava_qty = 22 where med_id = 3; 
update medicines set quantity = 60, ava_qty = 33 where med_id = 4;
 
delete from check_up where check_id = 3;
delete from patients where fname like 'a%';
delete from equipments where equip_name like '%s';
delete from medicines where requested_date = 2025;
delete from treatment where treat_id = 4;
 
select fname, lname, age, treatment.treat_id  from patients
inner join treatment on patient_type = treat_type;
 
select med_name, ava_qty, requested_date, treatment.treat_type  from medicines
join treatment on med_id = treat_type;
 
select fname, lname, age, treatment.treat_id  from patients
right join treatment on patient_type = treat_type;
 
select fname, lname, age, treatment.treat_id  from patients
left join treatment on patient_type = treat_type;
 
select fname, lname, age, treatment.treat_id  from patients
full join treatment on patient_type = treat_type;
