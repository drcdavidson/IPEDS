##Install Libraries 
library(tidyverse)

##Import CSVs & Remove Extra Columns
AdmitPerc <- read.csv(file = 'https://raw.githubusercontent.com/drcdavidson/IPEDS/main/CSVs/AdmitPercent.csv') 
AdmitPerc <- AdmitPerc[-15]
COA <- read.csv(file = 'https://raw.githubusercontent.com/drcdavidson/IPEDS/main/CSVs/COA.csv')
COA <- COA[-39]
Endowment <- read.csv(file = 'https://raw.githubusercontent.com/drcdavidson/IPEDS/main/CSVs/Endowment.csv')
Endowment <- Endowment[-15]
Enrollment <- read.csv(file = 'https://raw.githubusercontent.com/drcdavidson/IPEDS/main/CSVs/Enrollment.csv')
Enrollment <- Enrollment[-56]
FinAid <- read.csv(file = 'https://raw.githubusercontent.com/drcdavidson/IPEDS/main/CSVs/FinAid.csv')
FinAid <- FinAid[-21]
FTE <- read.csv('https://raw.githubusercontent.com/drcdavidson/IPEDS/main/CSVs/FTE.csv')
FTE <- FTE[-9]
GradRate <- read.csv('https://raw.githubusercontent.com/drcdavidson/IPEDS/main/CSVs/GradRate.csv')
GradRate <- GradRate[-9]
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
Undup_Head <- read.csv('https://raw.githubusercontent.com/drcdavidson/IPEDS_Data/main/CSVs/Unduplicated_Headcount.csv')
Undup_Head <- Undup_Head[-15]
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
#Rename FTE