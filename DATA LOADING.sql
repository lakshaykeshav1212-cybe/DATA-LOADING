CREATE TABLE Sales_Data (
    Order_ID VARCHAR(10),
    Customer_ID VARCHAR(10),
    Sales_Amount VARCHAR(50),
    Order_Date VARCHAR(20)
);

INSERT INTO Sales_Data (Order_ID, Customer_ID, Sales_Amount, Order_Date) VALUES
('O101', 'C001', '4500', '12-01-2024'),
('O102', 'C002', NULL, '15-01-2024'),
('O103', 'C003', '3200', '2024/01/18'),
('O101', 'C001', '4500', '12-01-2024'),
('O104', 'C004', 'Three Thousand', '20-01-2024'),
('O105', 'C005', '5100', '25-01-2024');

SELECT * FROM SALES_DATA;

### Q1 IN PPTX

## Q2. Primary Key Validation
#Assume ORDER_ID is the Primary Key.
#a) Is the dataset violating the Primary Key rule?
#b) Which record(s) cause this violation?

SELECT ORDER_ID, COUNT(*) AS M_VAL
FROM SALES_DATA
GROUP BY ORDER_ID
HAVING COUNT(*) > 1;

## YES,DATASET VOILATING THE PRIMARY KEY RULE
## RECORD = O101

           #### Q3. Missing Value Analysis
           #Which column(s) contain missing values?
           #a) List the affected records
		   #b) Explain why loading these records without handling missing values is risky

SELECT *
FROM SALES_DATA
WHERE SALES_AMOUNT IS NULL;
  
             ### (O102, C002, NULL, 15-01-2024)
             ### b) Why this is risky
#Aggregations (SUM, AVG) become incorrect
#Reporting errors (wrong revenue)
#Data type conversion issues



### Q4. Data Type Validation
#Identify records where Sales_Amount violates expected data type rules.
#a) Which record(s) will fail numeric validation?
#b) What would happen if this dataset is loaded into a SQL table SALES_AMOUNT with as DECIMAL?

SELECT * FROM SALES_DATA
WHERE SALES_AMOUNT IS NULL
OR SALES_AMOUNT NOT REGEXP '^[0-9]+$' ;

## Numeric values load successfully
#NULL may cause issue if NOT NULL constraint exists
#Non-numeric value ("Three Thousand") will fail or convert to 0
#Duplicate key will cause insertion failure if Primary Key is defined


## Q5. Date Format ORDER_DATE Consistency
#The ORDER_DATE column has multiple formats.
#a) List all date formats present in the dataset
#b) Why is this a problem during data loading?

SELECT * FROM SALES_DATA
WHERE ORDER_DATE = "2024/01/18";

SELECT DISTINCT * FROM SALES_DATA;

## Two date formats present:
#       DD-MM-YYYY
#       YYYY/MM/DD



# Q6 IN PPT




 






