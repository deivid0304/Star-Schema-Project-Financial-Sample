
---

## File: Documentation/Data_Dictionary.md

# Data Dictionary - Challenge 2

## Table: Financials_origem (Backup - Hidden Mode)
Exact copy of the original table for reference and recovery.

## Table: D_Products
| Field | Type | Description |
|-------|------|-----------|
| Product_ID | Integer | Primary key (0 to 5) |
| Product | Text | Product name |
| Average Units Sold | Decimal | Historical average of units sold |
| Average Sales Value | Decimal | Average sales price |
| Median Sales Value | Decimal | Median sales price |
| Maximum Sales Value | Decimal | Highest recorded sales price |
| Minimum Sales Value | Decimal | Lowest recorded sales price |

## Table: D_Product_Details
| Field | Type | Description |
|-------|------|-----------|
| Product_ID | Integer | Primary/foreign key |
| Product | Text | Product name |
| Discount Band | Text | Discount range applied |
| Sale Price | Decimal | Unit sales price |
| Units Sold | Integer | Number of units sold |
| Manufacturing Price | Decimal | Manufacturing cost |

## Table: D_Discounts
| Field | Type | Description |
|-------|------|-----------|
| Product_ID | Integer | Primary/foreign key |
| Product | Text | Product name |
| Discount Band | Text | Discount range |
| Discount | Decimal | Discount percentage applied |

## Table: D_Details
| Field | Type | Description |
|-------|------|-----------|
| Product_ID | Integer | Foreign key |
| Segment | Text | Market segment |
| Country | Text | Sale country |
| Date | Date | Sale date |
| Month Number | Integer | Month number |
| Month Name | Text | Month name |
| Year | Integer | Sale year |

## Table: D_Calendar
| Field | Type | Description |
|-------|------|-----------|
| Date | Date | Primary key |
| Year | Integer | Year |
| Month Number | Integer | Month number (1-12) |
| Month Name | Text | Month name |
| Quarter | Integer | Quarter (1-4) |
| Weekday | Integer | Weekday (1-7) |
| Weekday Name | Text | Weekday name |
| Week of Year | Integer | Week number |
| Year-Month | Text | Year and month in YYYY-MM format |

## Table: F_Sales
| Field | Type | Description |
|-------|------|-----------|
| SK_ID | Integer | Unique surrogate key (PK) |
| Product_ID | Integer | Foreign key (FK) |
| Product | Text | Product name |
| Units Sold | Integer | Units sold |
| Sales Price | Decimal | Sales price |
| Discount Band | Text | Discount range |
| Segment | Text | Segment |
| Country | Text | Country |
| Profit | Decimal | Profit |
| Date | Date | Sale date (FK to D_Calendar) |