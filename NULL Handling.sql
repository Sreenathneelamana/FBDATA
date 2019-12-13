select * from python_dataset



select mon_pub,tue_pub,wed_pub,thu_pub,fri_pub,sat_pub,sun_pub 
from python_dataset

update python_dataset set mon_pub=1 
where mon_pub is null and tue_pub='0' and wed_pub='0' and thu_pub='0' and fri_pub='0' and sat_pub='0' and sun_pub ='0'

update python_dataset set thu_pub=1 
where thu_pub is null and tue_pub='0' and wed_pub='0' and mon_pub='0' and fri_pub='0' and sat_pub='0' and sun_pub ='0'

update python_dataset set mon_pub=0 
where mon_pub is null and thu_pub is not null

update python_dataset set thu_pub=0 
where mon_pub is not null and thu_pub is null

update python_dataset set mon_pub=0 
where mon_pub is null and (tue_pub!='0' or wed_pub!='0'  or fri_pub!='0' or sat_pub!='0' or sun_pub! ='0')

update python_dataset set thu_pub=0 
where thu_pub is null and (tue_pub!='0' or wed_pub!='0'  or fri_pub!='0' or sat_pub!='0' or sun_pub! ='0')

update python_dataset set thu_pub=1
where mon_pub is null and thu_pub is null and ( fri_base!=0 or sat_base!=0 or sun_base!=0) and basetime<=70

update python_dataset set mon_pub=1
where mon_pub is null and thu_pub is null and ( tue_base!=0 or wed_base!=0 ) and basetime<70

update python_dataset set mon_pub=1
where mon_pub is null and thu_pub is null and ( thu_base=1) and basetime>15

update python_dataset set thu_pub=1
where mon_pub is null and thu_pub is null and ( thu_base=1 or fri_base!=0 or sat_base!=0 or sun_base!=0) and basetime<15

update python_dataset set mon_pub=0
where thu_pub=1 and mon_pub is null

update python_dataset set thu_pub=0
where mon_pub=1 and thu_pub is null

update python_dataset set mon_pub=1
where  mon_pub is null and thu_pub is null and basetime<15 and tue_base=0 and wed_base=0 and thu_base=0 and fri_base=0 and sat_base=0 and sun_base=0

update python_dataset set thu_pub=0
where  thu_pub is null and basetime<15 and tue_base=0 and wed_base=0 and thu_base=0 and fri_base=0 and sat_base=0 and sun_base=0

------------------------------------------------------------------------------------------------------------------------------------------------------------

select * from python_dataset


update python_dataset set mon_base=1
where mon_base is null and tue_base=0 and wed_base=0 and thu_base=0 and fri_base=0 and sat_base=0 and sun_base=0


select *
from python_dataset
where mon_base is null and tue_base=0 and wed_base=0 and thu_base=0 and fri_base=0 and sat_base=0 and sun_base=0

----------------------------------------------------------------------------------------------------------------------------------------------------------------

select comm24-"diff_24,48" from python_dataset
where comm48 is null


update python_dataset set comm48=comm24-"diff_24,48"
where comm48 is null

-------------------------------------------------------------------------------------------------------------

select * from python_dataset


select *
from ml_dataset
where Returns is null


update python_dataset set Returns=10
where Returns is null and Category='24' and likes='950' 

update python_dataset set Returns=5
where Returns is null and Category='24' and likes='1620' 


update python_dataset set Returns=5
where Returns is null and Category='16' and likes='8415'

-----------------------------------------------------------------------------------------------------------


select *
from python_dataset
where Category is null

update python_dataset set Category=8
where category is null and Returns ='283570' and likes='8488256'

update python_dataset set Category=8
where category is null and Returns ='991' and likes='259412'

update python_dataset set Category=8
where category is null and Returns ='3' and likes='18481'

update python_dataset set Category=76
where category is null and Returns ='525' and likes='5957'

---------------------------------------------------------------------------------------------------------------

select days,count(*)
from (
select case
when sun_pub=1 then 'sunday'
when mon_pub=1 then 'monday'
when tue_pub=1 then 'tuesday'
when wed_pub=1 then 'wednesday'
when thu_pub=1 then 'thrusday'
when fri_pub=1 then 'friday'
when sat_pub=1 then 'saturday'
end as days
from python_dataset) a
group by days