-- foreign key checking deferred due to circular dependencies
BEGIN;
SET CONSTRAINTS ALL DEFERRED;

\copy public.in_assertion FROM './input_data/assertion.tsv' WITH DELIMITER E'\t' CSV HEADER;
\copy public.in_citation FROM './input_data/citation.tsv' WITH DELIMITER E'\t' CSV HEADER;
\copy public.in_entity FROM './input_data/entity.tsv' WITH DELIMITER E'\t' CSV HEADER;
\copy public.in_event FROM './input_data/event.tsv' WITH DELIMITER E'\t' CSV HEADER;
\copy public.in_georeference FROM './input_data/georeference.tsv' WITH DELIMITER E'\t' CSV HEADER;
\copy public.in_identification FROM './input_data/identification.tsv' WITH DELIMITER E'\t' CSV HEADER;
\copy public.in_location FROM './input_data/location.tsv' WITH DELIMITER E'\t' CSV HEADER;
\copy public.in_material_entity FROM './input_data/material_entity.tsv' WITH DELIMITER E'\t' CSV HEADER;
\copy public.in_occurrence_evidence FROM './input_data/occurrence_evidence.tsv' WITH DELIMITER E'\t' CSV HEADER;
\copy public.in_occurrence FROM './input_data/occurrence.tsv' WITH DELIMITER E'\t' CSV HEADER;
\copy public.in_organism FROM './input_data/organism.tsv' WITH DELIMITER E'\t' CSV HEADER;
\copy public.in_protocol FROM './input_data/protocol.tsv' WITH DELIMITER E'\t' CSV HEADER;
\copy public.in_reference FROM './input_data/reference.tsv' WITH DELIMITER E'\t' CSV HEADER;
\copy public.in_taxon_identification FROM './input_data/taxon_identification.tsv' WITH DELIMITER E'\t' CSV HEADER;
\copy public.in_taxon FROM './input_data/taxon.tsv' WITH DELIMITER E'\t' CSV HEADER;

COMMIT;