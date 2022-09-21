##Install Libraries 
library(tidyverse)

##Import CSVs & Remove Extra Columns
AdmitPerc <- read.csv(file = 'https://raw.githubusercontent.com/drcdavidson/IPEDS/main/CSVs/AdmitPercent.csv') 
AdmitPerc <- AdmitPerc[-c(2,21)]
COA <- read.csv(file = 'https://raw.githubusercontent.com/drcdavidson/IPEDS/main/CSVs/COA.csv')
COA <- COA[-17]
EndowFASB <- read.csv(file = 'https://raw.githubusercontent.com/drcdavidson/IPEDS_Data/main/CSVs/EndowFASB.csv')
EndowFASB <- EndowFASB[-9]
EndowGASB <- read.csv(file = 'https://raw.githubusercontent.com/drcdavidson/IPEDS_Data/main/CSVs/EndowGASB.csv')
EndowGASB <- EndowGASB[-9]
FinAid <- read.csv(file = 'https://raw.githubusercontent.com/drcdavidson/IPEDS/main/CSVs/FinAid.csv')
FinAid <- FinAid[-21]
FTE <- read.csv('https://raw.githubusercontent.com/drcdavidson/IPEDS/main/CSVs/FTE.csv')
FTE <- FTE[-9]
GradRate <- read.csv('https://raw.githubusercontent.com/drcdavidson/IPEDS/main/CSVs/GradRate.csv')
GradRate <- GradRate[-c(2,9)]
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
INST_SectorSize <- INST_SectorSize[-2] 

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
INST_Type <- INST_Type[-2]

#Rename Retention Columns
colnames(Retention) <- c('INST_ID','INST_Name','F2020_Ret','F2019_Ret',
                         'F2018_Ret','F2017_Ret','F2016_Ret','F2015_Ret')
Retention <- Retention[-2]

#Rename Stu2Faculty Columns
colnames(Stu2Faculty) <- c('INST_ID','INST_Name','2020S:F','2019S:F','2018S:F',
                           '2017S:F','2016S:F','2015S:F')
Stu2Faculty <- Stu2Faculty[-2]

#Rename GradRate Columns 
colnames(GradRate) <- c("INST_ID","GR2020","GR2019","GR2018",
                        "GR2017","GR2016","GR2015")

#Rename FTE Columns
colnames(FTE) <- c("INST_ID","INST_Name","FTE2020","FTE2019","FTE2018",
                   "FTE2017","FTE2016","FTE2015")
FTE <- FTE[-2]

#Rename AdmitPerc
colnames(AdmitPerc) <- c("UNIT_ID","2020APP","2020ADM","2020ENR",
                         "2019APP","2019ADM","2019ENR",
                         "2018APP","2018ADM","2018ENR",
                         "2017APP","2017ADM","2017ENR",
                         "2016APP","2016ADM","2016ENR",
                         "2015APP","2015ADM","2015ENR")
colnames(AdmitPerc)[1] <- "INST_ID"
##Calculate Admission & Enrollment Rates
AdmitPerc <- AdmitPerc %>% mutate(
  '2020ADM_Rate' = `2020ADM`/`2020APP`,
  '2020ENR_Rate' = `2020ENR`/`2020ADM`,
  '2019ADM_Rate' = `2019ADM`/`2019APP`,
  '2019ENR_Rate' = `2019ENR`/`2019ADM`,
  '2018ADM_Rate' = `2018ADM`/`2018APP`,
  '2018ENR_Rate' = `2018ENR`/`2018ADM`,
  '2017ADM_Rate' = `2017ADM`/`2017APP`,
  '2017ENR_Rate' = `2017ENR`/`2017ADM`,
  '2016ADM_Rate' = `2016ADM`/`2016APP`,
  '2016ENR_Rate' = `2016ENR`/`2016ADM`,
  '2015ADM_Rate' = `2015ADM`/`2015APP`,
  '2015ENR_Rate' = `2015ENR`/`2015APP`)
AdmitPerc <- AdmitPerc[-c(2:19)]
AdmitPerc <- AdmitPerc[complete.cases(AdmitPerc),] #Drop NAs

#Rename COA Columns
colnames(COA)<- c("INST_ID","INST_Name",
                  "IN_2122_ON","OUT_2122_ON",
                  "IN_2021_ON","OUT_2021_ON",
                  "IN_1920_ON","OUT_1920_ON",
                  "IN_1819_ON","OUT_1819_ON",
                  "IN_1718_ON","OUT_1718_ON",
                  "IN_1617_ON","OUT_1617_ON",
                  "IN_1516_ON","OUT_1516_ON")
COA <- COA[-2]

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
Endow <- Endow[-2]

#Rename Headount Columns
colnames(Headcount) <- c("INST_ID","INST_Name","Head_21_TOTAL","Head_21_UG",
                         "Head_21_GR","Head_20_TOTAL","Head_20_UG","Head_20_GR",
                         "Head_19_TOTAL","Head_19_UG","Head_19_GR","Head_18_TOTAL",
                         "Head_18_UG","Head_18_GR","Head_17_TOTAL","Head_17_UG",
                         "Head_17_GR","Head_16_TOTAL","Head_16_UG","Head_16_GR")
Headcount <- Headcount[-2]

#Rename FinAid Columns
FinAid <- FinAid[-2]
colnames(FinAid) <- c("INST_ID","UG_TOTAL_1920","UG_AID_PERC_1920",	
                      "UG_PELL_PERC_1920","UG_TOTAL_1819","UG_AID_PERC_1819",
                      "UG_PELL_PERC_1819","UG_TOTAL_1718","UG_AID_PERC_1718",	
                      "UG_PELL_PERC_1718","UG_TOTAL_1617","UG_AID_PERC_1617",
                      "UG_PELL_PERC_1617","UG_TOTAL_1516","UG_AID_PERC_1516",
                      "UG_PELL_PERC_1516","UG_TOTAL_1415","UG_AID_PERC_1415",
                      "UG_PELL_PERC_1415")	

######Create Dataset for Tableau and Analysis
INST <- left_join(INST, INST_SectorSize, by="INST_ID")
INST <- INST[c(1,2,3,4,8,5:7,9:10)]
rm(INST_SectorSize)

#Add Sector & Size
INST <- left_join(INST, Sector, by="Sector")
INST <- INST[-9]
rm(Sector)
colnames(INST)[9] <- "Sector"
INST <- INST %>% mutate(Size = as.character(Size))
INST <- left_join(INST, Size, by="Size")
INST <- INST[-9]
colnames(INST)[10] <- "Size"
rm(Size)

#Recode Sector 
INST <- INST %>% mutate(Sector = recode(Sector, 'Public, 4-year or above'='Public',
               'Private not-for-profit, 4-year or above'='Private'))

#Add INST_Type
INST <- left_join(INST, INST_Type, by="INST_ID")
rm(INST_Type)
colnames(INST)[11] <- "LandGrant"
LandGrant <- LandGrant %>% mutate(LandGrant_Desc = 
                                    recode(LandGrant_Desc, 'Land Grant Institution'='Yes', 
                                           'Not a Land Grant Institution'='No'))
INST <- left_join(INST,LandGrant, by = "LandGrant")
INST <- INST[-11]
colnames(INST)[13] <- "LandGrant"
rm(LandGrant)

INST <- left_join(INST,Control,by="Control")
INST <- INST[-c(11,14)] #Removed Control because already in dataset
rm(Control)

INST <- left_join(INST,Carnegie,by="Carnegie")
INST <- INST[-11]
colnames(INST)[12] <- "Carnegie"
rm(Carnegie)
rm(States) #Meant to delete this earlier

#Add Admission & Enrollment Rates
INST <- left_join(INST,AdmitPerc,by="INST_ID")
rm(AdmitPerc)

#Add Headcount to INST
INST <- left_join(INST,Headcount,ny="INST_ID")
rm(Headcount)

#Add FTE to INST
INST <- left_join(INST,FTE,by="INST_ID")
rm(FTE)

#Add Retention to INST
INST <- left_join(INST,Retention,by="INST_ID")
rm(Retention)

#Add Grad Rate to INST
INST <- left_join(INST,GradRate,by="INST_ID")
rm(GradRate)

#Add Student to Faculty Ratio
INST <- left_join(INST,Stu2Faculty,by="INST_ID")
rm(Stu2Faculty)

#Add COA to INST
INST <- left_join(INST,COA,by="INST_ID")
rm(COA)

#Add FinAid to INST
INST <- left_join(INST,FinAid,by="INST_ID")
rm(FinAid)

#Add Endow to INST
INST <- left_join(INST,Endow,by="INST_ID")
rm(Endow)

#Remove NA Cases
INST <- INST[complete.cases(INST),]

#Save Final CSV
write.csv(INST,file="C:/Users/cdavi/OneDrive/Desktop/Documents/R_Projects/IPEDS_Data/Final_INST.csv",row.names = F)
