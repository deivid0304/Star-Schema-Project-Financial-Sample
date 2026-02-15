let
    Source = financials,
    #"Grouped Rows" = Table.Group(Source, {"Product"}, {
        {"Average Units Sold", each List.Average([Units Sold]), type number},
        {"Average Sales Value", each List.Average([Sale Price]), type number},
        {"Median Sales Value", each List.Median([Sale Price]), type number},
        {"Maximum Sales Value", each List.Max([Sale Price]), type number},
        {"Minimum Sales Value", each List.Min([Sale Price]), type number}
    })
in
    #"Grouped Rows"