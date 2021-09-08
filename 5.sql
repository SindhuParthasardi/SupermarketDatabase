-- 5. Some retailers believe that their male members are bringing in more overall revenue per purchase while others believe female non-members 
-- are bringing in more revenue per purchase of fashion accessories. Who is right?
USE supermarketdb;
SELECT avg(IV.Total) AS Purchase_Avg, CT.Gender, PL.ProductLineType, CT.CustomerType
FROM invoices IV
JOIN productline PL ON IV.ProductLine_ProductLineID = PL.ProductLineID
JOIN customertype CT ON IV.CustomerType_CustomerTypeID = CT.CustomerTypeID 
WHERE CT.CustomerTypeID = 1003 AND PL.ProductLineType = "Fashion accessories" 
UNION 
SELECT avg(IV.Total) AS Purchase_Avg, CT.Gender, PL.ProductLineType, CT.CustomerType
FROM invoices IV
JOIN productline PL ON IV.ProductLine_ProductLineID = PL.ProductLineID
JOIN customertype CT ON IV.CustomerType_CustomerTypeID = CT.CustomerTypeID 
WHERE CT.CustomerTypeID = 1002 AND PL.ProductLineType = "Fashion accessories";