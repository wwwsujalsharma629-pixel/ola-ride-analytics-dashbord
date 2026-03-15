create database ola;
USE ola;

select* from bookings;
#1.To see successfull booking status
Create view Succesfull_Bookings as
select *from bookings
where `Booking Status` = 'Success';
select *from `Successfull Bookings`;

#2.find the average ride distance for each vehicle type
create view ride_distance_for_each_vehicle as
select `Vehicle Type`,avg(`ride distance`)
as avg_distance from bookings 
group by `Vehicle Type`;
select *from ride_distance_for_each_vehicle;

#3.Get the total number of rides cancelled rides by customers
create view rides_cancelled_ride_by_customers as
select count(*)from bookings 
where `Booking Status` = 'Cancelled';
select *from rides_cancelled_ride_by_customers;

#4.select top 10 regular customers for gifts
create view regular_customers_for_gifts as
select `Customer ID`,count(`Booking ID`) as total_rides
from bookings
group by `Customer ID`
order by total_rides desc limit 10;
select *from regular_customers_for_gifts;
 
 
 #5.Rides cancelled by the customer by change of plans
 create view cancelled_by_the_customer_by_change_of_plans as
select count(*)from bookings
 where `Reason by Customer` = 'Change of plans'  ;
 select *from cancelled_by_the_customer_by_change_of_plans ;
 
 #6.find the min and max driver ratings per vehicle type:
 select max(`Driver Ratings`) as Max_ratings,
 min(`Driver Ratings`) as Min_ratings
 from bookings where `Vehicle Type` ='Prime Sedan';
 
 
 #7.for drop location = 'frazer town'
 create view `for drop location = 'frazer town'` as
 select *from Bookings where 
 `Drop Location`= 'Frazer Town';
 
 #8.find the average customer rating per vehicle type:
 create view customer_rating_per_vehicle_type as
 select `Vehicle Type`,avg(`Customer Rating`)  as 
 avg_customer_ratings from Bookings group by
 `Vehicle Type`;
 select *from customer_rating_per_vehicle_type ;
 
 #9.calculate sum of booking value where status = 'Successful
 select sum('Booking Value') as total_value
 from Bookings
 where `Booking Status` = 'Success';
 
 #10. see cancel Booking
 create view `see cancel Booking` as
 select *from bookings where
 `Booking Status` = 'Cancelled';
 select *from  `see cancel Booking`;
  
#11 .List all camcelled rides along with the reason
create view `incomplete ride reason with Booking id` as
 select `Booking ID`,`Incomplete Ride Reason`
 from bookings
 where `Incomplete Rides` = 'yes';
  select *from `incomplete ride reason with Booking id`;
 
 #see bookings with different payment methods
 create view `payment_methods` as 
 select payment_method,
 count(*) from bookings
 group by payment_method;
 select *from `payment_methods`;
 
 
 ALTER TABLE bookings
ADD COLUMN payment_method VARCHAR(50);
DESC bookings;
SET SQL_SAFE_UPDATES = 0;
UPDATE bookings
SET payment_method =
ELT(FLOOR(1 + (RAND() * 5)),
    'Cash',
    'UPI',
    'Credit Card',
    'Debit Card',
    'Net Banking'
);
select *from bookings