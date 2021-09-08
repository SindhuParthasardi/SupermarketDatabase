-- 7. Yangon calls itself the most eWallet-friendly city for health and beauty while Mandalay calls itself a haven for cash spending. Does the data support their claims?
USE supermarketdb;
SELECT sum(IV.Total) AS Purchase_Total, PY.PaymentType, LT.City
FROM invoices IV
JOIN productline PL ON IV.ProductLine_ProductLineID = PL.ProductLineID
JOIN location LT ON IV.Location_BranchID = LT.BranchID 
JOIN payment PY ON IV.Payment_PaymentTypeID = PY.PaymentTypeID
WHERE PL.ProductLineType = "Health and beauty" AND PY.PaymentType="Ewallet"
GROUP BY LT.City
UNION 
SELECT sum(IV.Total) AS Purchase_Total, PY.PaymentType, LT.City
FROM invoices IV
JOIN productline PL ON IV.ProductLine_ProductLineID = PL.ProductLineID
JOIN location LT ON IV.Location_BranchID = LT.BranchID 
JOIN payment PY ON IV.Payment_PaymentTypeID = PY.PaymentTypeID
WHERE PY.PaymentType = "Cash"
GROUP BY LT.City;