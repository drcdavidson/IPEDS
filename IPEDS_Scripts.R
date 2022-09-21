##Install Libraries 
library(tidyverse)

##Import CSVs & Remove Extra Columns
AdmitPerc <- read.csv(file = 'https://raw.githubusercontent.com/drcdavidson/IPEDS/main/CSVs/AdmitPercent.csv') 
AdmitPerc <- AdmitPerc[-15]
COA <- read.csv(file = 'https://raw.githubusercontent.com/drcdavidson/IPEDS/main/CSVs/COA.csv')
COA <- COA[-17]
EndowFASB <- read.csv(file = 'https://raw.githubusercontent.com/drcdavidson/IPEDS_Data/main/CSVs/EndowFASB.csv')
EndowFASB <- EndowFASB[-9]
EndowGASB <- read.csv(file = 'https://raw.githubusercontent.com/drcdavidson/IPEDS_Data/main/CSVs/EndowGASB.csv')
EndowGASB <- EndowGASB[-9]
Enrollment <- read.csv(file = 'https://raw.githubusercontent.com/drcdavidson/IPEDS/main/CSVs/Enrollment.csv')
Enrollment <- Enrollment[-21]
FinAid <- read.csv(file = 'https://raw.githubusercontent.com/drcdavidson/IPEDS/main/CSVs/FinAid.csv')
FinAid <- FinAid[-21]
FTE <- read.csv('https://raw.githubusercontent.com/drcdavidson/IPEDS/main/CSVs/FTE.csv')
FTE <- FTE[-9]
GradRate <- read.csv('https://raw.githubusercontent.com/drcdavidson/IPEDS/main/CSVs/GradRate.csv')
GradRate <- GradRate[-9]
Headcount <- read.csv('https://raw.githubusercontent.com/drcdavidson/IPEDS/main/CSVs/Headcount.csv')
Headcount <- Headcount[-21]
INST <- read.csv('https://raw.githubusercontent.com/drcdavidson/IPEDS/main/CSVs/INST.csv')
INST <- INST[-8]
INST_SectorSize <- read.csv('https://raw.githubusercontent.com/drcdavidson/IPEDS/main/CSVs/INST_SectorSize.csv')
INST_SectorSize <- INST_SectorSize[-6]
INST_SectorSizeLabels <- read.csv('https://raw.githubusercontent.com/drcdavidson/IPEDS/main/CSVs/INST_SectorSizeLabels.csv')
INST_TypeLabels <- read.csv('https://raw.githubusercontent.com/drcdavidson/IPEDS/main/CSVs/INST_TypeLabels.csv')
INST_Type <- read.csv('https://raw.githubusercontent.com/drcdavidson/IPEDS/main/CSVs/INSTType.csv')
INST_Type <- INST_Type[-6]
Retention <- read.csv('https://raw.githubusercontent.com/drcdavidson/IPEDS/main/CSVs/Retention.csv')
Retention <- Retention[-9]
Stu2Faculty <- read.csv('https://raw.githubusercontent.com/drcdavidson/IPEDS/main/CSVs/Stu2Faculty.csv')
Stu2Faculty <- Stu2Faculty[-9]

##Clean Individual CSV Files by Renaming Columns 
colnames(INST) <- c('INST_ID','INST_Name','Address','City','Zip','Longitude','Latitude')
colnames(INST_SectorSize) <- c('INST_ID','INST_Name','State','Sector','Size')

#Create Sector DF
print(INST_SectorSizeLabels)
Sector_Desc <- c("Public, 4-year or above","Private not-for-profit, 4-year or above")
Sector <- c(1:2)
Sector <- data.frame(Sector = c(1:2),
                     Sector_Desc = c("Public, 4-year or above","Private not-for-profit, 4-year or above"))
rm(Sector_Code,Sector_Desc)

#Create Size DF
Size <- data.frame(Size = INST_SectorSizeLabels[c(54:60),2],
                   Size_Desc = INST_SectorSizeLabels[c(54:60),3])

States <- data.frame(State = INST_SectorSizeLabels[c(1:51),2],
                     State_Desc = INST_SectorSizeLabels[c(1:51),3])
rm(INST_SectorSizeLabels)

#Create Control, Land Grant, and Carnegie DFs
print(INST_TypeLabels)

Control <- data.frame(Control = INST_TypeLabels[c(1:2),2],
                      Control_Desc = INST_TypeLabels[c(1:2),3])
LandGrant <- data.frame(LandGrant = INST_TypeLabels[c(3:4),2],
                        LandGrant_Desc = INST_TypeLabels[c(3:4),3])
Carnegie <- data.frame(Carnegie = INST_TypeLabels[c(5:36),2],
                       Carnegie_Desc = INST_TypeLabels[c(5:36),3])
rm(INST_TypeLabels)

#Rename INST_Type Columns
colnames(INST_Type) <- c('INST_ID','INST_Name','Land Grant','Control','Carnegie')

#Rename Retention Columns
colnames(Retention) <- c('INST_ID','INST_Name','Fall 2020 Retention','Fall 2019 Retention',
                         'Fall 2018 Retention','Fall 2017 Retention','Fall 2016 Retention',
                         'Fall 2015 Retention')
#Rename Stu2Faculty Columns
colnames(Stu2Faculty) <- c('INST_ID','INST_Name','2020 Stu2Fac','2019 Stu2Fac','2018 Stu2Fac',
                           '2017 Stu2Fac','2016 Stu2Fac','2015 Stu2Fac')

#Rename Unduplicated Headcount Columns
colnames(Undup_Head) <- c("INST_ID","INST_Name","Headcount_2021_Total",
                          "Headcount_2021_UG","Headcount_1920_Total",
                          "Headcount_1920_UG","Headcount_1819_Total",
                          "Headcount_1819_UG","Headcount_1718_Total",
                          "Headcount_1718_UG","Headcount_1617_Total",
                          "Headcount_1617_UG","Headcount_1516_Total",
                          "Headcount_1516_UG")

#Rename GradRate Columns 
colnames(GradRate) <- c("INST_ID","INST_Name","GR2020","GR2019","GR2018",
                        "GR2017","GR2016","GR2015")
#Rename FTE Columns
colnames(FTE) <- c("INST_ID","INST_Name","FTE2020","FTE2019","FTE2018",
                   "FTE2017","FTE2016","FTE2015")

#Rename AdmitPerc
colnames(AdmitPerc) <- c("INST_ID","INST_Name",
                         "Total_2020_App","Total_2020_Enroll",
                         "Total_2019_App","Total_2019_Enroll",
                         "Total_2018_App","Total_2018_Enroll",
                         "Total_2017_App","Total_2017_Enroll",
                         "Total_2016_App","Total_2016_Enroll",
                         "Total_2015_App","Total_2015_Enroll")
#Rename COA Columns
colnames(COA)<- c("INST_ID","INST_Name",
                  "IN_2122_ON","OUT_2122_ON",
                  "IN_2021_ON","OUT_2021_ON",
                  "IN_1920_ON","OUT_1920_ON",
                  "IN_1819_ON","OUT_1819_ON",
                  "IN_1718_ON","OUT_1718_ON",
                  "IN_1617_ON","OUT_1617_ON",
                  "IN_1516_ON","OUT_1516_ON")

#Rename Endowment Columns
colnames(EndowFASB) <- c("INST_ID","INST_Name",
                          "FY20_Endow","FY19_Endow",
                          "FY18_Endow","FY17_Endow",
                          "FY16_Endow","FY15_Endow")
colnames(EndowGASB) <- c("INST_ID","INST_Name",
                         "FY20_Endow","FY19_Endow",
                         "FY18_Endow","FY17_Endow",
                         "FY16_Endow","FY15_Endow")

#Drop NA Values in Combined EndowFASB & EndowGASB 
#(Dropped colleges without endowments or missing data)
Endow <- rbind(EndowFASB,EndowGASB)
Endow <- Endow[complete.cases(Endow),]
rm(EndowFASB,EndowGASB)

#Rename Headount Columns
colnames(Headcount) <- c("INST_ID","INST_Name","Head_21_TOTAL","Head_21_UG",
                         "Head_21_GR","Head_20_TOTAL","Head_20_UG","Head_20_GR",
                         "Head_19_TOTAL","Head_19_UG","Head_19_GR","Head_18_TOTAL",
                         "Head_18_UG","Head_18_GR","Head_17_TOTAL","Head_17_UG",
                         "Head_17_GR","Head_16_TOTAL","Head_16_UG","Head_16_GR")
