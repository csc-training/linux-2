#!/usr/bin/awk -f

BEGIN {
   ndata = 0
   avgmin = 0
   avgmax = 0
   totalrain = 0
}

!/#/{
    ++ndata
    mintemp = $2 ; avgmin += mintemp
    maxtemp = $3 ; avgmax += maxtemp
    rainfall = $4 ; totalrain += rainfall
    rainydays = $5
    printf("Average daily rainfall for rainy days in %s : %.2f mm m^-2\n", $1, rainfall/rainydays)    
}

END {
    if (ndata > 0) {
	avgmin /= ndata
	avgmax /= ndata
	printf("Average min/max yearly temps: %.2f / %.2f\n", avgmin, avgmax)
	print "Total precipitation = ", totalrain, " mm m^-2"
    }
}
