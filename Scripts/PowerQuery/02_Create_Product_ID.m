let
    Source = D_Products,
    #"Conditional Column" = Table.AddColumn(Source, "Custom", each 
        if [Product] = "Carretera" then 0
        else if [Product] = "Montana" then 1
        else if [Product] = "Paseo" then 2
        else if [Product] = "Velo" then 3
        else if [Product] = "VTT" then 4
        else if [Product] = "Amarilla" then 5
        else -1),
    #"Renamed Columns" = Table.RenameColumns(#"Conditional Column", {{"Custom", "Product_ID"}}),
    #"Reordered Columns" = Table.ReorderColumns(#"Renamed Columns", {"Product_ID", "Product", "Average Units Sold", "Average Sales Value", "Median Sales Value", "Maximum Sales Value", "Minimum Sales Value"})
in
    #"Reordered Columns"