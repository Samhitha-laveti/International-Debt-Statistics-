use international_debt_statistics;
select * from debt limit 20 ;


-- Find the number of distinct countries?
select count(distinct (country_name)) as countries_with_debt from debt  ;

-- There are total 124 countries having debt at world bank.



-- What is the most common debt indicator?
select indicator_code ,count(indicator_code) from debt group by indicator_code order by count(indicator_code) desc;

/* DT.INT.DLXF.CD
DT.AMT.MLAT.CD
DT.INT.MLAT.CD
DT.AMT.OFFT.CD
DT.INT.OFFT.CD
DT.AMT.DLXF.CD are the most common debt indicators with each indicator used by 124 countries,followed by DT.DIS.DLXF.CD with 123 countries */



--  What is the average amount of debt across indicators?
select floor(avg(debt)) as avg_debt ,indicator_name from debt group by indicator_name order by avg_debt desc;

-- The indicator method, Principal repayments on external debt, long-term (AMT, current US$) has the highest average amount of debt.



--  Which Country has the highest debt?
select country_name,sum(debt) as total_debt from debt group by country_name order by total_debt desc limit 1;

-- China has the highest total debt at world bank and Sao Tome and Principe is the country with lowest debt .



-- Find out the distinct debt indicators?
select distinct indicator_name from debt;

-- There are 25 distinct debt indicator categories.



-- What is the highest amount of principal repayments?
select indicator_name ,country_name,max(debt) as max_debt from debt
 group by indicator_name,country_name having indicator_name like '%principal%' order by max_debt desc limit 10 ;
 
 --  China owes the highest amount of Principal repayments on external debt, long-term (AMT, current US$)



-- What is Total amount of debt owed by the countries?
select sum(debt) as total_debt from debt;

-- The total debt of amount 3079734487692.09 has been owed by all the countries from world bank.

