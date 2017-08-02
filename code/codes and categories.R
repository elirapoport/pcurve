categories <- scan("journals_categories_of_interest.txt", what="" ,sep="\n")
categories <- categories[grep("##",categories,invert=TRUE)]

asjc_codes <- read.csv("asjc_classification_codes.csv", header = TRUE)
asjc_codes <- asjc_codes[complete.cases(asjc_codes),]
names(asjc_codes) <- c("code","category")


found <- intersect(categories,asjc_codes$category)
notfound <- setdiff(categories, found)

categories[which(categories=="Genetics (clinical)")] = 
  "Genetics(clinical)"
categories[which(categories=="Neurology (clinical)")] = 
  "Clinical Neurology"
categories[which(categories=="Obstetrics and Gynecology")] = 
  "Obstetrics and Gynaecology"
categories[which(categories=="Pediatrics, Perinatology and Child Health")] = 
  "Pediatrics, Perinatology, and Child Health"
categories[which(categories=="Pharmacology (Medical)")] = 
  "Pharmacology (medical)"
categories[which(categories=="Psychiatric Mental Health")] = 
  "Phychiatric Mental Health"
categories[which(categories=="Psychiatry and Mental Health")] = 
  "Psychiatry and Mental health"
categories[which(categories=="Radiology, Nuclear Medicine and Imaging")] = 
  "Radiology Nuclear Medicine and imaging"
categories[which(categories=="Health (social science)")] = 
  "Health(social science)"
categories[which(categories=="Complementary and Alternative Medicine")] = 
  "Complementary and alternative medicine"

found <- intersect(categories,asjc_codes$category)
notfound <- setdiff(categories, found) #all matched between codes and category list

codecateg <- asjc_codes[which(asjc_codes[,2]%in%categories),]
categories = data.frame(category = codecateg$category, code = codecateg$code)





