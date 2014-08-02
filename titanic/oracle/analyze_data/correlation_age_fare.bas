public sub main (csv_file_name as string)

    dim csv_rows as long
    dim csv_cols as long

    dim shape_  as shape
    dim chart_  as chart

 '  Insert the chart first, so that no range or what
 '  messes with it!
    set shape_ = ActiveSheet.Shapes.AddChart
    set chart_ = shape_.chart

    chart_.ChartType = xlXYScatter

    with activesheet.queryTables.add(connection:=  "TEXT;" & csv_file_name, destination:=Range("$A$1")) ' {
         .name                          ="csv_data"
         .fieldNames                    = true

         .textFileParseType             = xlDelimited
         .textFileTextQualifier         = xlTextQualifierDoubleQuote
         .textFileConsecutiveDelimiter  = false
         .textFileTabDelimiter          = false
         .textFileSemicolonDelimiter    = false
         .textFileCommaDelimiter        = true
         .textFileSpaceDelimiter        = false

         .refresh BackgroundQuery:=False
    end with ' }

    csv_rows = range("csv_data").rows.   count
    csv_cols = range("csv_data").columns.count

    call addSeries(chart_, 2, csv_rows)
    call addSeries(chart_, 3, csv_rows)
    call addSeries(chart_, 4, csv_rows)
    
 '  alignShapeWithCells(): https://github.com/ReneNyffenegger/runVBAFilesInOffice/blob/master/Excel/helpers.bas
    call alignShapeWithCells(shape_, "f2", "t31")

    call format_series(chart_.seriesCollection("Fare 3rd class"), RGB(255, 0, 0))
    call format_series(chart_.seriesCollection("Fare 2nd class"), RGB(0, 255, 0))
    call format_series(chart_.seriesCollection("Fare 1st class"), RGB(0, 0, 255))

    activeWorkbook.saved = true
end sub

private sub format_series(series_ as series, color_ as long) ' {

' TODO: Why do the dots in the legend look so strange?

  series_.format.fill.solid
  series_.markerStyle = 8
  series_.markerSize  = 4
  series_.format.fill.foreColor.rgb = color_

  for each point_ in series_.points
      point_.markerForegroundColorIndex = xlColorIndexNone
  next

end sub ' }

private sub addSeries(chart_ as chart, col as long, numRows as long) ' {

    set series_     = chart_.seriesCollection.newSeries

    series_.name    = cells(1, col)
    series_.xvalues = range(cells(2,1  ), cells(numRows, 1  ))
    series_.values  = range(cells(2,col), cells(numRows, col))

end sub ' }
