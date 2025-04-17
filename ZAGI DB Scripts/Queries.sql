USE ZAGI_Retail_DB;

/*1. Retrieve the entire contents of the relation Product*/
CREATE OR REPLACE VIEW allContent AS 
SELECT * FROM Product;

/*2. Display the VendorID and VendorName for all vendors.  */
CREATE OR REPLACE VIEW VendorIDAndName AS
SELECT VendorID, VendorName
FROM vendor;

/*3. Display the CustomerName and CustomerZip for all customers.*/
CREATE OR REPLACE VIEW CustomerNameAndCustomerZIP AS
SELECT CustomerName, CustomerZip
From customer;

/*4. Retrieve the entire contents of the relation PRODUCT and show the columns in the following order:
ProductName, ProductID, VendorID, CategoryID, ProductPrice.  */
CREATE OR REPLACE VIEW ProductInOrder AS
SELECT ProductName, ProductID, VendorID, CategoryID, ProductPrice
From Product;

/*5. For the table PRODUCT, show the columns ProductId and ProductPrice and a column showing
ProductPrice increased by 40% (Multiply ProductPrice by 1.40). */
CREATE OR REPLACE VIEW ProductMult AS
SELECT ProductId, ProductPrice, (ProductPrice * 1.4) AS MultipliedPrice
FROM Product;

/*6. Display the ProductId, ProductName, and ProductPrice for products with a ProductPrice of $100 or
higher.  */
CREATE OR REPLACE VIEW ProductAbove100 AS
SELECT ProductId, ProductName, ProductPrice
FROM Product
WHERE ProductPrice > 100;

/*7. Retrieve the product ID, ProductName, VendorId, CategoryId, and ProductPrice of products in the FW
category whose price is equal to or below $200 (Hint: two conditions in WHERE clause)*/
CREATE OR REPLACE VIEW ProductId200 AS
SELECT ProductID, ProductName, VendorID, CategoryID, ProductPrice
From Product
WHERE CategoryID = 'FW' AND ProductPrice <= 200;

/*8. Show one instance of all the different VendorID values in the relation Product */
CREATE OR REPLACE VIEW OneInstance_dif_vendorID AS
SELECT DISTINCT VendorID
FROM product;

/*9. Retrieve the average price of all products. (Hint: Use AVG (product price))  */
CREATE OR REPLACE VIEW All_Average_prices AS
SELECT ProductID, ProductName, AVG(ProductPrice) AS Average_Price
From product;

/*10. Show how many products are there for sale. (Hint: COUNT)  */
CREATE OR REPLACE VIEW Products_for_sale AS
SELECT count(ProductID) AS ProductsAvalible
FROM Product;

/*11. Count how many distinct vendors are there in the product table. (Hint: you must get the answer 4) */
CREATE OR REPLACE VIEW 11_distinc_vendors AS
SELECT COUNT(VendorID) AS Vendors_Count
From Product;

/*12. Retrieve the number of products, average product price, lowest product price, and highest product
price in the CP product category.  */
CREATE OR REPLACE VIEW 12_Category AS
SELECT COUNT(ProductID), AVG(ProductPrice), MIN(ProductPrice), MAX(ProductPrice)
FROM product
WHERE categoryid = 'CP';

/*13.Retrieve the product ID, product name, category ID, and product price for each product in the FW
product category, sorted by product price in descending order */
CREATE OR REPLACE VIEW 13_Product AS
SELECT productID, productname, categoryID, productprice
FROM product
WHERE categoryid = 'FW'
ORDER BY ProductPrice DESC;

/*14. For each product, retrieve the ProductID value and the total number of product items sold
within all sales transactions. (Hint: sales transactions can be found in SoldVia table. NoOfItem attribute
holds how many items sold in one transaction, but we need total sold of a product in all transactio */
CREATE OR REPLACE VIEW 14_SalesTrans AS
SELECT ProductID, SUM(noofitems)
FROM soldvia
group by productid;

/*15 */
/* */

/* */

/* */

