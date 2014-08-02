public sub go(csv_file_name as string)

    dim csv_rows as long
    dim csv_cols as long
 
    dim range_shrunk_csv
 
    dim shape_  as shape
    dim chart_  as chart

    With ActiveSheet.QueryTables.Add(Connection:=  "TEXT;" & csv_file_name ,  Destination:=Range("$A$1"))

        .name = "csv_data"
        .fieldNames                    = true
        .textFileParseType             = xlDelimited
        .textFileTextQualifier         = xlTextQualifierDoubleQuote
        .textFileConsecutiveDelimiter  = false
        .textFileTabDelimiter          = false
        .textFileSemicolonDelimiter    = false
        .textFileCommaDelimiter        = true
        .textFileSpaceDelimiter        = false
        .textFileColumnDataTypes       = array(1, 1, 1, 1, 1, 1, 1)
        .refresh BackgroundQuery:=False
    end with

    set shape_ = ActiveSheet.Shapes.AddChart
    set chart_ = shape_.chart

    chart_.chartType = xlLineMarkers


    csv_rows = range("csv_data").rows.count
    csv_cols = range("csv_data").columns.count

    set range_shrunk_csv = range("csv_data").offset(0, 1)

    set range_shrunk_csv = range_shrunk_csv.resize(csv_rows-0 , csv_cols - 1)

    chart_.setSourceData source := range_shrunk_csv

    chart_.ChartType = xlLine
    chart_.SeriesCollection(1).XValues = range(cells(2,1), cells(csv_rows-1, 1))

 '  alignShapeWithCells(): https://github.com/ReneNyffenegger/runVBAFilesInOffice/blob/master/Excel/helpers.bas
    call alignShapeWithCells(shape_, "f2", "t32")

    dim color_m as long
    dim color_f as long

    color_m = RGB(70, 70, 255)
    color_f = RGB(255, 70, 70)

    call formatLine(chart_, "F 3", msoLineSysDot , color_f)
    call formatLine(chart_, "M 3", msoLineSysDot , color_m)

    call formatLine(chart_, "F 2", msoLineSysDash, color_f)
    call formatLine(chart_, "M 2", msoLineSysDash, color_m)

    call formatLine(chart_, "F 1", msoLineSolid  , color_f)
    call formatLine(chart_, "M 1", msoLineSolid  , color_m)


    activeWorkbook.saved = true
end sub

private sub formatLine(chart_ as chart, seriesName as string, byVal dash_ as msoLineDashStyle, color_ as long)

    dim fmt_    as lineFormat
    set fmt     = chart_.seriesCollection(seriesName).format.line

    fmt.dashStyle     = dash_
    fmt.foreColor.rgb = color_

end sub
