## Creating a Tableau Dashboard for Four-Year Institutions Using IPEDS Data

This repository is for the [Integrated Postsecondary Education Data System (IPEDS)](https://nces.ed.gov/ipeds/) dataset created for a Tableau Dashboard (link will be provided once completed). This repository includes the R Scripts used to create the final dataset for Tableau and the 15 .csv files from IPEDS to create the dataset. The table below gives a brief synopsis of the IPEDS .csv files.

| Name of File              | Synopsis                                                                                                                                                     |
|---------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| AdmitPercent.csv          | Data showing the number of applicants, admitted students, and enrolled students.                                                                             |
| COA.csv                   | Data showing the cost of attendance for in-state and out-of-state students living on-campus.                                                                 |
| EndowFASB.csv             | Data showing the endowments for Private not-for-profit institutions or Public institutions using the Financial Accounting Standards Board (FASB) standards.  |
| EndowGASB.csv             | Data showing the endowments for Public institutions using Governmental Accounting Standards Board (GASB) standards.                                          |
| FinAid.csv                | Data showing the number of undergraduates receiving any federal, state, or other grant aid and the percentage of students receiving Pell Grants.             |
| FTE.csv                   | Data showing the full-time-equivalent fall enrollment.                                                                                                       |
| GradRate.csv              | Data showing the 6-year (150%) graduation rate.                                                                                                              |
| Headcount.csv             | Data showing the unduplicated headcount of all, undergraduate, and graduate students.                                                                        |
| INST.csv                  | Data showing the name and address of the institution.                                                                                                        |
| INST_SectorSize.csv       | Data showing the state, sector, and size of the institution.                                                                                                 |
| INST_SectorSizeLabels.csv | Data showing the codebook for the state, sector, and size of the institution.                                                                                |
| INSTType.csv              | Data showing the land grant status, control, and the Carnegie Classification of the institution.                                                             |
| INST_TypeLabels.csv       | Data showing the codebook for the land grant status, control, and the Carnegie Classification of the institution.                                            |
| Retention.csv             | Data showing the retention rate for the fall cohort.                                                                                                         |
| Stu2Faculty.csv           | Data showing the student to faculty ratio.                                                                                                                   |

### METHODOLOGY

#### Choosing Sample of Institutions

To choose the data from IPEDS, I used the following parameters to choose the institutions: - State or Other Jurisdiction: All 50 States and DC - Sector: *Public,* *4-year or above* and *Private not-for-profit, 4-year or above*

This gave be 2,370 sample institutions.

#### Choosing Variables

A complete list of variables in the dataset can be found in :
