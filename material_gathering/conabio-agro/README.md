# CONABIO Agro dataset for the DwCA_v2 publishing model

Original data already mapped the the Unified Model version 4.5 are shared in https://github.com/gbif/model-material/tree/master/conabio-agro/data.

An original dataset restructured for the Unified Model version 4.5 is shared in https://github.com/gbif/model-material/tree/master/conabio-agro/data. A copy of those data was made in the [input data folder](../input_data).

The process to create the output dataset for the DwCA_v2 publishing model is as follows:

## Create a postgreSQL database to hold the input data and the output data mapped to the dwca_v2 publishing model:
```cd material_gathering/conabio-agro```

(First time) ```createdb conabio_agro && psql conabio_agro -f ../../gbif/dwca_v2_schema.sql && psql conabio_agro -f ./schema_input_conabio_agro.sql```

(Subsequent times) ```dropdb conabio_agro && createdb conabio_agro && psql conabio_agro -f ../../gbif/dwca_v2_schema.sql && psql conabio_agro -f ./schema_input_conabio_agro.sql```

## Load the input data into the conabio_bees database:
```psql conabio_agro -f load_input_conabio_agro.sql```

## Run the script to produce the publishing model tables within the same database:
```psql conabio_agro -f map_conabio_agro_input.sql```

## Run the script to export the publishing model tables as TSV files:
```psql conabio_agro -f export_conabio_agro_tsvs.sql```

