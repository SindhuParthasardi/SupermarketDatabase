-- 2. Some retailers believe that revenue in food and beverages can be increased amongst women by focusing on Ewallets, 
USE supermarketdb;
SELECT sum(IV.Total) AS Purchase_Total, CT.Gender, PL.ProductLineType, PY.PaymentType
FROM invoices IV
JOIN productline PL ON IV.ProductLine_ProductLineID = PL.ProductLineID
JOIN customertype CT ON IV.CustomerType_CustomerTypeID = CT.CustomerTypeID 
JOIN payment PY ON IV.Payment_PaymentTypeID = PY.PaymentTypeID
WHERE CT.Gender = "Male" AND PL.ProductLineType = "Electronic accessories" AND PY.PaymentType="Ewallet"
UNION 
SELECT sum(IV.Total) AS Purchase_Total, CT.Gender, PL.ProductLineType, PY.PaymentType
FROM invoices IV
JOIN productline PL ON IV.ProductLine_ProductLineID = PL.ProductLineID
JOIN customertype CT ON IV.CustomerType_CustomerTypeID = CT.CustomerTypeID 
JOIN payment PY ON IV.Payment_PaymentTypeID = PY.PaymentTypeID
WHERE CT.Gender = "Female" AND PL.ProductLineType = "Food and beverages" AND PY.PaymentType = "Ewallet";