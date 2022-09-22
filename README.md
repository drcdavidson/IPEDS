## Creating a Tableau Dashboard for Four-Year Institutions Using IPEDS Data

This repository is for the [Integrated Postsecondary Education Data System (IPEDS)](https://nces.ed.gov/ipeds/) dataset created for a Tableau Dashboard (link will be provided once completed). This repository includes the [R Scripts](https://github.com/drcdavidson/IPEDS_Data/blob/main/IPEDS_Scripts.R) used to create the [final CSV file](https://github.com/drcdavidson/IPEDS_Data/blob/main/Final_INST.csv) for Tableau and the 15 [CSV files from IPEDS](https://github.com/drcdavidson/IPEDS_Data/tree/main/CSVs) to create the dataset.

### METHODOLOGY

#### Choosing Sample of Institutions

To choose the data from IPEDS, I used the following parameters to choose the institutions: - State or Other Jurisdiction: All 50 States and DC - Sector: *Public,* *4-year or above* and *Private not-for-profit, 4-year or above*

This gave be 2,370 sample institutions.

#### Choosing Variables

The following table provides information on the variables downloaded from IPEDS to create the final dataset.

| Category                      | Subcategory           | IPEDS Variable Name                        | Renamed Variable | Year of the Data | Definition  |
|--------------|------------|------------|------------|------------|------------|
| Institutional Characteristics | Directory Information | UnitID                                     | INST_ID          | 2021-22          |             |
|                               |                       | Institution Name                           | INST_Name        | 2021-22          |             |
|                               |                       | Street address or post office box (HD2021) | Address          | 2021-22          |             |
|                               |                       | City location of institution (HD2021)      | City             | 2021-22          |             |
|                               |                       | ZIP code (HD2021)                          | Zip              | 2021-22          |             |
|                               |                       | Longitude location of institution (HD2021) | Longitude        | 2021-22          |             |
|                               |                       | Latitude location of institution (HD2021)  | Latitude         | 2021-22          |             |

					
