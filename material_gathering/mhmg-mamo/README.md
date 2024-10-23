# Material Gathering dataset - MHNG Mammal Example

This is dataset is an example of gathered Material curated in a museum, with separate parts of the Material and GeneticSequences derived from Material, with multiple Identifications, and with Citations for the Identifications and GeneticSequences.

This example dataset was derived from the original [SwissCollNet](https://github.com/gbif/model-material/tree/master/swisscollnet) example dataset shared as part of Unified Model testing for Material. These same data have been copied into this repository as [input data](./input_data).

The input data are not exactly the [original data](https://github.com/gbif/model-material/tree/master/swisscollnet), they have been manipulated to populate a [DwCA_v2 PostgreSQL database](https://github.com/gbif/model-dwca-v2/tree/master/gbif/dwca_v2_schema.sql), which implements the Darwin Core Archive Version 2 (DwCA_v2) Publishing Model, using the manipulated input TSV files and the [loading script](./load_input_mhmg_mamo.sql) invoked by:

The process to create the output dataset for the DwCA_v2 publishing model is as follows:

## Create a postgreSQL database to hold the input data and the output data mapped to the dwca_v2 publishing model:
```cd material_gathering/mhmg-mamo```

(First time) ```createdb mhmg_mamo && psql mhmg_mamo -f ../../gbif/dwca_v2_schema.sql```

(Subsequent times) ```dropdb mhmg_mamo && createdb mhmg_mamo && psql mhmg_mamo -f ../../gbif/dwca_v2_schema.sql```

## Load the input data into the database:
````psql mhmg_mamo -f load_input_mhmg_mamo.sql```

## Run the script to export the publishing model tables as TSV files:
```psql mhmg_mamo -f export_mhmg_mamo_tsvs.sql```

