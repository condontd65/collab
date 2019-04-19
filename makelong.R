library(tidyr)
library(data.table)

# Import
wide <- read.csv('17-18 Partnership Landscape Data - Cleaned_v4.csv')

# Limit to only needed data
wide.small <- wide [ , c(1, 38:164)]

# Make data consistent, removing True / False / Unknowns / NAs
wide.small [ wide.small == TRUE ] <- 'Yes'
wide.small [ wide.small == FALSE ] <- 'No'
wide.small [ wide.small == 'UNKNOWN' | wide.small == 'Unknown' | wide.small == 'unknown' | is.na(wide.small)] <- ''

# Convert factor data to character (this can be changed back later if desired)
wide.small[] <- lapply(wide.small, as.character)

# Convert to Long format not using Partnership_ID
long3 <- wide.small %>% gather(key, value, -Partnership_ID)





