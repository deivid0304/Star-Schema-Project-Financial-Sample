let
    Source = financials,
    #"Add Product_ID" = Table.AddColumn(Source, "Product_ID", each 
        if [Product] = "Carretera" then 0
        else if [Product] = "Montana" then 1
        else if [Product] = "Paseo" then 2
        else if [Product] = "Velo" then 3
        else if [Product] = "VTT" then 4
        else if [Product] = "Amarilla" then 5
        else -1),
    #"Add SK_ID" = Table.AddIndexColumn(#"Add Product_ID", "SK_ID", 1, 1, Int64.Type),
    #"Selected Columns" = Table.SelectColumns(#"Add SK_ID", {"SK_ID", "Product_ID", "Product", "Units Sold", "Sale Price", "Discount Band", "Segment", "Country", "Profit", "Date"}),
    #"Renamed Columns" = Table.RenameColumns(#"Selected Columns", {{"Sale Price", "Sales Price"}})
in
    #"Renamed Columns"