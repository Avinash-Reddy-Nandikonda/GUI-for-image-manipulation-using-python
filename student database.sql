CREATE TABLE STUDENT (
RollNo INT(6) UNSIGNED  PRIMARY KEY,
First_Name VARCHAR(30) NOT NULL,
Last_Name VARCHAR(30) NOT NULL,
Phone_Number BIGINT,
City VARCHAR(40) NOT NULL,
State VARCHAR(40) NOT NULL,
Age INT(2)
)
select * from student

Insert into student(RollNo,First_Name,Last_Name,Phone_Number,City,State,Age) values(001,'Avinash','Panther',9876543299,'Kurnool','Andhra Pradesh',23)
Insert into student(RollNo,First_Name,Last_Name,Phone_Number,City,State,Age) values(002,'Kiran','Patnala',98752524555,'Rayalseema','Andhra Pradesh',27)
Insert into student(RollNo,First_Name,Last_Name,Phone_Number,City,State,Age) values(003,'pranay','fasak',98485221155,'Medak','Telangana',23)
Insert into student(RollNo,First_Name,Last_Name,Phone_Number,City,State,Age) values(004,'megha','mankal',9845214741,'vishakapatnam','Andhra Pradesh',26)
Insert into student(RollNo,First_Name,Last_Name,Phone_Number,City,State,Age) values(005,'maria','yesudas',9841175851,'Hyderabad','Telangana',29)
Insert into student(RollNo,First_Name,Last_Name,Phone_Number,City,State,Age) values(006,'shivam','shandilya',9755522111,'srikakulam','Andhra Pradesh',25)
Insert into student(RollNo,First_Name,Last_Name,Phone_Number,City,State,Age) values(007,'kartheek','pericherla',8852115221,'Kurnool','Andhra Pradesh',24)
Insert into student(RollNo,First_Name,Last_Name,Phone_Number,City,State,Age) values(008,'Praveen','Munari',8852115221,'Kurnool','Andhra Pradesh',22)
Insert into student(RollNo,First_Name,Last_Name,Phone_Number,City,State,Age) values(009,'Bijay','kumar',8852115221,'West Godavari','Andhra Pradesh',21)
Insert into student(RollNo,First_Name,Last_Name,Phone_Number,City,State,Age) values(010,'pravalika','goud',8546724154,'ongole','Andhra Pradesh',20)
Insert into student(RollNo,First_Name,Last_Name,Phone_Number,City,State,Age) values(011,'Abhinav','cherlakola',8852115222,'rayalaseema','Andhra Pradesh',27)
Insert into student(RollNo,First_Name,Last_Name,Phone_Number,City,State,Age) values(012,'vishnu kethan nath ','gopu',8852115223,'kadapa','Andhra Pradesh',24)
Insert into student(RollNo,First_Name,Last_Name,Phone_Number,City,State,Age) values(013,'sunil varma','mudundi',8852115225,'chitoor','Andhra Pradesh',20)
Insert into student(RollNo,First_Name,Last_Name,Phone_Number,City,State,Age) values(014,'Rakshan','Kumar',8852115224,'srisailam','Andhra Pradesh',25)
Insert into student(RollNo,First_Name,Last_Name,Phone_Number,City,State,Age) values(015,'Harshitha','srineni',8852115278,'Medak','Telangana',28)


select * from film_actor;
select * from film

#there is a ineer join between tow tables one is film_actor and film  in this from film i took title and from film_actor i took actor and joined the table 
select f.title, a.first_name, a.last_name from ((film f inner join film_actor fa on f.film_id = fa.film_id) inner join actor a on fa.actor_id = a.actor_id )
