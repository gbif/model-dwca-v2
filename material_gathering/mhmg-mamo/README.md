# Material Gathering Dataset - MHNG Mammal Example
This is dataset is an example of an Extended Occurrence based on gathered Material curated in a museum, with separate parts of the Material and GeneticSequences derived from Material, with multiple Identifications, and with Citations for the Identifications and GeneticSequences. 

This example dataset was derived from the original [SwissCollNet](https://github.com/gbif/model-material/tree/master/swisscollnet) example data set shared as part of Unified Model testing for Material.

This dataset has been tested to populate the [PostgreSQL database](https://github.com/gbif/model-dwca-v2/tree/master/gbif/schema.sql) that implements the Extended Occurrence Publishing Model, using the TSV files in this directory and the [script](./load-mhmg-mamo.sql) to load those data into the database using

`psql extended_occurrence -f load-mhmg-mamo.sql`