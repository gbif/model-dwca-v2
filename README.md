# Data Publishing using Darwin Core Archives Version 2 (DwCA_v2)
This repository provides examples of datasets structured to take advantage of the expanded capabilities of Darwin Core Archives Version 2. There is a folder for each of the types of datasets (material_gathering, observation, organism-interaction, and survey) for which a mapping from the original structure to the DwCA_v2 model has been tested.

The postgreSQL [database schema](./gbif/dwca_v2_schema.sql) provides the structure within which to test use cases supported by the DwCA_v2. 

Within each dataset type folder is a folder for each separate dataset. Within the dataset folders are scripts and instructions to create a copy of the database, load the input files (from the ./input_data folder), transform the data into the DwCa_v2_ structure, and write the output files (to the ./output_data folder).

The repository contains a controlled_vocabularies folder where real-world values are mapped to preferred labels that match pattern for preferred labels of Darwin Core controlled vocabularies. 

Some fields whose values are strictly controlled have TYPE ENUMS defined in this database schema. For example, the term occurrence.occurrenceStatus MUST be populated with either 'Present' or 'Absent'.

```
CREATE TYPE OCCURRENCE_STATUS AS ENUM (
  'Present',
  'Absent'
);
```