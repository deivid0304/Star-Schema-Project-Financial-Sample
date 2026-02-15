let
    Source = financials,
    #"Selected Columns" = Table.SelectColumns(Source, {"Product", "Discount Band", "Sale Price", "Units Sold", "Manufacturing Price"}),
    #"Add Product_ID" = Table.AddColumn(#"Selected Columns", "Product_ID", each 
        if [Product] = "Carretera" then 0
        else if [Product] = "Montana" then 1
        else if [Product] = "Paseo" then 2
        else if [Product] = "Velo" then 3
        else if [Product] = "VTT" then 4
        else if [Product] = "Amarilla" then 5
        else -1),
    #"Reordered Columns" = Table.ReorderColumns(#"Add Product_ID", {"Product_ID", "Product", "Discount Band", "Sale Price", "Units Sold", "Manufacturing Price"})
in
    #"Reordered Columns"