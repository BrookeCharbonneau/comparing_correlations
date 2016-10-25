library(cocor)
library (tydyverse)
library(apaTables)

# create correlation table
apa.cor.table(bfi)

# Look at correlation between A1 and C1 (agreeableness) and (conscientiousness
# and E1 and O1(extraversion and openness)
cocor(~A1+C1|E1+O1, data=as.data.frame(bfi))

# Does agreeableness correlate more with conscientiousness or 
# does agreeableness correlate more with extraversion - OR
# does CI predict A1 better than E1 does??
cocor(~A1+C1|A1+E1, data=as.data.frame(bfi))
# delta r = .08, 95% CO [-.13, -.03]

# create data sets for men and women
bfi_men <- bfi %>% filter(gender==1) %>% select(-gender)
bfi_women <- bfi %>% filter(gender==2) %>% select(-gender)

# create correlation tables
apa.cor.table(bfi_men)
apa.cor.table(bfi_women)

#compate
bfi_men <- as.data.frame(bfi_men)
bfi_women <- as.data.frame(bfi_women)

cocor(~A1+E1|A1+E1, data=list(bfi_men, bfi_women))

