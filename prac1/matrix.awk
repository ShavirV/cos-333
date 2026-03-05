#!/usr/bin/env gawk -f

BEGIN {
    FS = "," #comma-separated values
    print "========================="
    print "Rectangular matrix totals"
    print "========================="
    print "Input file:", FILENAME
}

{
    row++
    rowTotal = 0

    #track maximum number of columns seen
    if (NF > maxCols)
        maxCols = NF

    for (i = 1; i <= NF; i++) {
        value = $i + 0 #+0 to force a number
        rowTotal += value
        colTotal[i] += value
        grandTotal += value
    }

    rowTotals[row] = rowTotal
}

END {
    #print row totals
    for (i = 1; i <= row; i++) {
        printf "Total for row %d: %d\n", i, rowTotals[i]
    }

    # Print column totals (missing values assumed zero)
    for (i = 1; i <= maxCols; i++) {
        printf "Total for column %d: %d\n", i, colTotal[i] + 0
    }

    # Print entire matrix total
    printf "Total for entire matrix: %d\n", grandTotal
}