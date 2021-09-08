-- 4. Some retailers believe that their members are spending more per purchase while members believe they are spending less per purchase. Who is right?
-- T: Select CustomerType, Purchase average from invoices table join customer type table and group by customer type
-- C: Select CustomerType, round(avg(IV.Total), 2) as Purchase_Avg from invoices join customertype on 
-- CustomerType_CustomerTypeID = CustomerTypeID group by CT.CustomerType
USE supermarketdb;
SELECT CT.CustomerType, round(avg(IV.Total), 2) AS Purchase_Avg
FROM invoices IV
JOIN customertype CT ON IV.CustomerType_CustomerTypeID = CT.CustomerTypeID
GROUP BY CT.CustomerType;
