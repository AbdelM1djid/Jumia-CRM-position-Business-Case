-- By MADJID ERROUKRMA 
-- Creating a Database
CREATE DATABASE Jumia ; 
USE Jumia;

-- importing data  ...

-- Viewing data 
SELECT * 
FROM Jumia..Master; 

SELECT * 
FROM Jumia..Mtable ; 

SELECT * 
FROM Jumia.dbo.Orderr ; 

-- Question 1 : 
SELECT  TOP(10) customer#cod_customer AS Customer_Id , dsc_customer_first_name ,dsc_customer_last_name , clc_stage,
COUNT(customer#cod_customer) AS number
FROM Jumia.dbo.Orderr 
INNER JOIN Jumia..Mtable ON 
Jumia..Orderr.customer#cod_customer = Jumia..Mtable.user_id
WHERE MONTH(dategross) = 7	
GROUP BY customer#cod_customer,dsc_customer_first_name,dsc_customer_last_name,clc_stage
ORDER BY number DESC; 

-- and then export the resulting table 

-- Question 2 : 
SELECT   CAST(COUNT(IIF(clc_stage='loyal',1,NULL))AS FLOAT)/CAST(COUNT(*) AS FLOAT)*100 AS Proportion_of_loyal
FROM Jumia..Master
INNER JOIN Jumia..Orderr ON 
Jumia..Master.user_id = Jumia..Orderr.customer#cod_customer
WHERE MONTH(Jumia..Orderr.dategross) = 7 ;

-- and then export the resulting table 


--Question 3 : 
SELECT clc_stage , SUM(items#voucher_eur) AS Total_Voucher
FROM Jumia..Orderr 
INNER JOIN Jumia..Master ON 
Jumia..Orderr.customer#cod_customer = Jumia..Master.user_id
GROUP BY clc_stage 
ORDER BY Total_Voucher DESC;

-- and then export the resulting table 


