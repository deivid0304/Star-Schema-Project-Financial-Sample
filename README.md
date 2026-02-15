## Star Schema with Financial Sample

## Overview
This project consists of transforming the single **Financial Sample** table into a dimensional Star Schema model using Power BI, as specified in the project challenge.

## Objective
Create a dimensional model focused on sales analysis, containing:
- Fact Table (F_Sales)
- 5 Dimension Tables (D_Products, D_Product_Details, D_Discounts, D_Details, D_Calendar)
- Backup of the original table (Financials_origem)

## Model Structure

### Tables Created

| Table | Type | Description |
|--------|------|-----------|
| Financials_origem | Backup | Exact copy of the original table (hidden mode) |
| D_Products | Dimension | Products with aggregated metrics |
| D_Product_Details | Dimension | Price and sales details by product |
| D_Discounts | Dimension | Discount information by product |
| D_Details | Dimension | Complementary information (segment, country, dates) |
| D_Calendar | Dimension | Date table created with DAX |
| F_Sales | Fact | Sales records with foreign keys |

## Construction Process

### Step 1: Backup
- Creation of the `Financials_origem` table as an exact copy
- Configured as hidden mode

### Step 2: D_Products (Grouping)
Using the **Group By** functionality in Power Query:

| Column | Operation |
|--------|----------|
| Average Units Sold | Average |
| Average Sales Value | Average |
| Median Sales Value | Median |
| Maximum Sales Value | Maximum |
| Minimum Sales Value | Minimum |

### Step 3: Product_ID (Conditional Column)
Creation of numeric index for products:

| Product | Product_ID |
|---------|------------|
| Carretera | 0 |
| Montana | 1 |
| Paseo | 2 |
| Velo | 3 |
| VTT | 4 |
| Amarilla | 5 |

### Step 4: Other Dimensions
- **D_Product_Details**: Specific column selection + Product_ID
- **D_Discounts**: Duplicate removal + selected columns
- **D_Details**: Information not covered in other dimensions

### Step 5: D_Calendar (DAX)
```dax
D_Calendar = 
ADDCOLUMNS(
    CALENDAR(
        MIN(Financials[Date]),
        MAX(Financials[Date])
    ),
    "Year", YEAR([Date]),
    "Month Number", MONTH([Date]),
    "Month Name", FORMAT([Date], "MMMM"),
    "Quarter", QUARTER([Date]),
    "Weekday", WEEKDAY([Date]),
    "Weekday Name", FORMAT([Date], "DDDD"),
    "Week of Year", WEEKNUM([Date]),
    "Year-Month", FORMAT([Date], "YYYY-MM")
)