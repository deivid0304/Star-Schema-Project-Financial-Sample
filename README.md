# Star Schema Project – Financial Sample

## Project Overview

This project consists of transforming a single table (Financial Sample) into a dimensional Star Schema model using Power BI. The goal is to create an optimized structure for sales analysis, enabling more efficient queries and better data organization.

## Model Structure

### Created Tables

1. **Financials_Origin** (Hidden Backup)  
   - Exact copy of the original table  
   - Hidden from report view  

2. **D_Products** (Dimension)  
   - `ID_Product` (Primary Key)  
   - `Product`  
   - Aggregated metrics: Average Units Sold, Mean, Median, Maximum, and Minimum Sales Value  

3. **D_Products_Details** (Dimension)  
   - `ID_Product`  
   - `Product`  
   - `Discount Band`  
   - `Sale Price`  
   - `Units Sold`  
   - `Manufacturing Price`  

4. **D_Discounts** (Dimension)  
   - `ID_Product`  
   - `Product`  
   - `Discount Band`  
   - `Discount` (percentage)  

5. **D_Details** (Dimension)  
   - Additional information: Segment, Country, Dates  

6. **D_Calendar** (Dimension – DAX)  
   - Created via `CALENDAR()` function  
   - Columns: Year, Month, Quarter, Day of Week, etc.  

7. **F_Sales** (Fact)  
   - `SK_ID` (Unique surrogate key)  
   - `ID_Product` (Foreign key)  
   - Metrics: Units Sold, Sales Price, Profit  
   - Dimensions: Segment, Country, Date  

## Build Process

### Step 1: Backup and Preparation  
- Create **Financials_Origin** as an exact copy of the original data  
- Configure the table to be hidden in the reporting layer  

### Step 2: Product Dimension  
- Use "Group By" functionality to aggregate metrics per product  
- Calculate statistics: average, median, min, max  

### Step 3: Product ID Implementation  
- Create a conditional column to map products to numeric IDs  
- Use Power Query’s "Add Conditional Column" interface  

### Step 4: Other Dimensions  
- Select specific columns for each dimension  
- Remove duplicates when necessary (e.g., D_Discounts)  

### Step 5: Calendar Dimension  
- Create via DAX using `CALENDAR()`  
- Add calculated columns for different time granularities  

### Step 6: Fact Table  
- Combine all metrics and foreign keys  
- Add `SK_ID` as a unique surrogate key  
- Establish relationships with all dimensions  

## DAX Functions and Features Used

### Table Functions  
- `CALENDAR()` – Creates a continuous date table  
- `ADDCOLUMNS()` – Adds calculated columns to a table  

### Time Intelligence Functions (for future analysis)  
- `TOTALYTD()` – Year-to-date accumulation  
- `SAMEPERIODLASTYEAR()` – Compare with previous period  
- `DATEADD()` – Date shifting  

### Power Query Aggregation Functions  
- `List.Average()` – Mean  
- `List.Median()` – Median  
- `List.Max()` – Maximum  
- `List.Min()` – Minimum  

## Benefits of the Star Schema Model

1. **Performance**: Faster queries due to controlled denormalization  
2. **Maintainability**: Clear and organized structure  
3. **Scalability**: Easy to add new metrics and dimensions  
4. **Usability**: Intuitive navigation for business users  

## Possible Analyses with the Model

- Sales by product and period  
- Performance by segment and country  
- Discount analysis and impact on profit  
- Sales trends over time  
- Product and category comparisons  

## How to Use

1. Open the `.pbix` file in Power BI Desktop  
2. Explore the model to view relationships  
3. Use dimension tables for filters and slicers  
4. Create custom DAX measures for specific analyses  
5. Build reports and dashboards based on the model  

## Diagram

![Financial Sample Star Schema](./Star-Schema-Project–Financial-Sample.png)
