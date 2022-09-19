#Install Libraries 
library(tidyverse)

#Import CSVs & Remove Extra Columns
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
Retention <- Retention[-27]
Undup_Head <- read.csv('https://raw.githubusercontent.com/drcdavidson/IPEDS/main/CSVs/Unduplicated_Headcount.csv')
Undup_Head <- Undup_Head[-27]


