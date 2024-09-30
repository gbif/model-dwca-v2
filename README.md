# Data Publishing using Darwin Core Archives Version 2 (DwCA_v2)
This repository provides examples of datasets structured to take advantage of the expanded capabilities of Darwin Core Archives Version 2. Datasets are divided into categories of the datasets based on the basic types of Events they document (Observations, MaterialGatherings, eDNA, OrganismInteractions, and Biotic Surveys) and each dataset occupies a directory within the most appropriate type of dataset.

A PostgreSQL 'Extended Occurrence' database schema ([schema.sql](./gbif/schema.sql)) provides a structure within which to test use cases supported by the Extended Occurrence Data Publishing Model. 

Each example dataset includes TSV files of data and a script to load these data into a Extended Occurrence PostgreSQL database.

A [directory](./controlled_vocabularies) with suggestions for preferred labels for concepts that are recommended to use controlled vocabularies is also provided. Some fields whose values are strictly controlled have TYPE ENUMS defined in [schema.sql](./gbif/schema.sql)] . For example, the term dwc:occurrenceStatus MUST be populated with either 'Present' or 'Absent'.

```
CREATE TYPE OCCURRENCE_STATUS AS ENUM (
  'Present',
  'Absent'
);
```

The basic process to test the loading of a dataset is to 
1) From the ./gbif directory, create an instance of the database from schema.sql if the database does not yet exist
  `createdb extended_occurrence && psql extended_occurrence -f schema.sql`
2) From the ./gbif directory, drop and recreate the database from schema.sql if the database needs to be reinitiated with no data
  `dropdb extended_occurrence && createdb extended_occurrence && psql extended_occurrence -f schema.sql`
3) From a dataset directory, load the TSV files into the database
  `psql extended_occurrence -f load-mhmg-mamo.sql` (Example)