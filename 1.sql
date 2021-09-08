-- 1. Some retailers believe that there is more money to be made in selling fashion accessories to men than sports and travel to women.Is this true?
USE supermarketdb;
SELECT sum(IV.Total) AS Purchase_Total, CT.Gender, PL.ProductLineType
FROM invoices IV
JOIN productline PL ON IV.ProductLine_ProductLineID = PL.ProductLineID
JOIN customertype CT ON IV.CustomerType_CustomerTypeID = CT.CustomerTypeID 
WHERE CT.Gender = "Male" AND PL.ProductLineType = "Fashion accessories"
UNION 
SELECT sum(IV.Total) AS Purchase_Total, CT.Gender, PL.ProductLineType
FROM invoices IV
JOIN productline PL ON IV.ProductLine_ProductLineID = PL.ProductLineID
JOIN customertype CT ON IV.CustomerType_CustomerTypeID = CT.CustomerTypeID 
WHERE CT.Gender = "Female" AND PL.ProductLineType = "Sports and travel";