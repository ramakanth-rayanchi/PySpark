-- Databricks notebook source
-- MAGIC %md
-- MAGIC ## Added by Ramakanth for demo - 29 May 2022

-- COMMAND ----------

-- MAGIC %md ## Create SQL Tables

-- COMMAND ----------

-- MAGIC %md https://docs.databricks.com/getting-started/quick-start.html

-- COMMAND ----------

-- DBTITLE 1,Create a Database
CREATE DATABASE IF NOT EXISTS awproject

-- COMMAND ----------

-- DBTITLE 1,Change Database Context
USE awproject

-- COMMAND ----------

-- MAGIC %md ## New Syntax requirement - muse use absolute file path, need to add / to beginning of the path. 

-- COMMAND ----------

-- DBTITLE 1,Create dimdate table
DROP TABLE IF EXISTS dimdate;

CREATE TABLE dimdate USING CSV
OPTIONS (path "/FileStore/tables/DimDate.csv", header="true", inferSchema="true" );

SELECT * from dimdate LIMIT 2;

-- COMMAND ----------

-- DBTITLE 1,Create dimcustomer Table
DROP TABLE IF EXISTS dimcustomer;

CREATE TABLE dimcustomer USING CSV
OPTIONS (path="/FileStore/tables/DimCustomer.csv", header="true", inferSchema="true");

SELECT * FROM dimcustomer LIMIT 2;

-- COMMAND ----------

-- DBTITLE 1,Create dimgeography table
DROP TABLE IF EXISTS dimgeography;

CREATE TABLE dimgeography USING CSV
OPTIONS (path ="/FileStore/tables/DimGeography.csv", header="true", inferSchema="true");

SELECT * FROM dimgeography LIMIT 2; 

-- COMMAND ----------

-- DBTITLE 1,Create dimproduct table
DROP TABLE IF EXISTS dimproduct;

CREATE TABLE dimproduct USING CSV
OPTIONS (path="/FileStore/tables/DimProduct.csv", header="true", inferSchema="true");

SELECT * FROM dimproduct LIMIT 2;

-- COMMAND ----------

-- DBTITLE 1,Create dimproductcategory table
DROP TABLE IF EXISTS dimproductcategory;

CREATE TABLE dimproductcategory USING CSV OPTIONS (path="/FileStore/tables/DimProductCategory.csv", header="true", inferSchema="true");

SELECT * FROM dimproductcategory LIMIT 2;

-- COMMAND ----------

-- DBTITLE 1,Create dimproductsubcategory
DROP TABLE IF EXISTS dimproductsubcategory;

CREATE TABLE dimproductsubcategory USING CSV OPTIONS(path="/FileStore/tables/DimProductSubcategory.csv", header="True", inferSchema="True");

SELECT * FROM dimproductsubcategory LIMIT 2;

-- COMMAND ----------

-- DBTITLE 1,Create dimsalesreason table
DROP TABLE IF EXISTS dimsalesreason;

CREATE TABLE dimsalesreason USING CSV OPTIONS(path="/FileStore/tables/DimSalesReason.csv", header="true", inferSchema="True");

SELECT * FROM dimsalesreason LIMIT 2;

-- COMMAND ----------

-- DBTITLE 1,Create dimsalesterritory table
DROP TABLE IF EXISTS dimsalesterritory;

CREATE TABLE dimsalesterritory USING CSV OPTIONS (path="/FileStore/tables/DimSalesTerritory.csv", header="True", inferSchema="True");

SELECT * FROM dimsalesterritory LIMIT 2;

-- COMMAND ----------

-- DBTITLE 1,Create factinternetsales table
DROP TABLE IF EXISTS factinternetsales;

CREATE TABLE factinternetsales USING CSV OPTIONS (path="/FileStore/tables/FactInternetSales.csv", header="True", inferSchema="True");

SELECT * FROM factinternetsales LIMIT 2;

-- COMMAND ----------

-- DBTITLE 1,Create factinternetsalesreasontable defining column names and types
DROP TABLE IF EXISTS factinternetsalesreason;

CREATE TABLE factinternetsalesreason (SalesOrderNumber string, SalesOrderLineNumber int, SalesReasonKey int)
USING CSV OPTIONS (path="/FileStore/tables/FactInternetSalesReason.csv", header="False", inferSchema="False");

SELECT * FROM factinternetsalesreason LIMIT 2;

-- COMMAND ----------

DESC TABLE EXTENDED factinternetsalesreason

-- COMMAND ----------

SHOW TABLES
