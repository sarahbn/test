1-
SELECT `addressLine1`,`addressLine2`,`city`FROM offices
ORDER BY `country`DESC,`state`


2-

SELECT `productCode`,`productName`FROM products
WHERE `productLine`='Planes'
ORDER BY `productVendor`,`quantityInStock`DESC

3-
SELECT `productName`,`productVendor`,`MSRP`
FROM products
WHERE `MSRP`>='132$'
ORDER BY `productName`

4-

SELECT `productCode`,`productName`,`productScale`,`quantityInStock`
FROM products
WHERE `productScale` IN ('1:10','1:18')
ORDER BY `quantityInStock`DESC

5 SELECT `productCode`,`productName`,`buyPrice` 
FROM `products` 
WHERE `buyPrice` BETWEEN 60 AND 90 ORDER BY `buyPrice`


6 SELECT `productName`,`productVendor`,`quantityInStock`,(`MSRP`-`buyPrice`)AS marge 
FROM `products` 
WHERE `productLine` = 'Motorcycles' 
ORDER BY `productScale`ASC 


7 SELECT `orderNumber`,`orderDate`,`requiredDate`, DATEDIFF(`shippedDate`,`orderDate`) AS ecart,`status` 
FROM `orders` 
WHERE `status`='In Process' OR (`status`='Shipped' AND DATEDIFF(`shippedDate`,`orderDate`) > 10 ) 
ORDER BY ecart DESC,`orderDate` 


8 SELECT `productName`,`quantityInStock`
FROM `products` 
WHERE `productName` LIKE '196%' 


9  SELECT `productVendor`, AVG(`MSRP`)
FROM `products` 
GROUP BY `productVendor` 

10 SELECT COUNT(productLine)
FROM products
GROUP BY `productLine`

11  SELECT `productLine`,SUM(`quantityInStock`) AS quantity,SUM(`quantityInStock`*`MSRP`)AS valeur 
FROM `products` WHERE `MSRP`>100 
GROUP BY `productLine` 

12 SELECT`productVendor`, MAX(`quantityInStock`) 
FROM `products` 
GROUP BY `productVendor` 

13 SELECT MIN(`buyPrice`) FROM `products` WHERE `productLine`= 'Planes' 

14  SELECT `customerNumber`, SUM(`amount`)AS credit  
FROM payments WHERE `paymentDate` BETWEEN '2004-01-01' AND '2004-12-31' 
GROUP BY `customerNumber` HAVING credit > 20000
ORDER BY credit DESC 


15  SELECT `lastName`,`firstName`,`jobTitle`,offices.addressLine1 ,offices.addressLine2,offices.city 
FROM `employees` 
INNER JOIN `offices` ON employees.officeCode = offices.officeCode 

16 SELECT `customerName`, `contactFirstName`, `contactLastName`, `country`, `lastName`, `firstName`
FROM customers
INNER JOIN employees ON customers.salesRepEmployeeNumber = employees.employeeNumber
WHERE `country` IN ('France', 'USA')
ORDER BY `contactLastName`, `contactFirstName`
