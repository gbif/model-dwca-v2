-- foreign key checking deferred due to circular dependencies
BEGIN;
SET CONSTRAINTS ALL DEFERRED;

-- psql requires the following meta commands to be presented on a single line
--\copy public.in_agent (agent_id, agent_type, preferred_agent_name) FROM './input_data/agent.tsv' WITH DELIMITER E'\t' CSV HEADER;
--\copy public.in_assertion (assertion_id, assertion_target_id, assertion_target_type, assertion_type, assertion_made_date, assertion_value, assertion_value_numeric, assertion_unit, assertion_by, assertion_by_id) FROM './input_data/assertion.tsv' WITH DELIMITER E'\t' CSV HEADER;
--\copy public.in_citation (citation_id, citation_target_id, citation_target_type, citation_type, bibliographic_citation, reference_id, reference_type, reference_year, is_peer_reviewed) FROM './input_data/citation.tsv' WITH DELIMITER E'\t' CSV HEADER;
--\copy public.in_collection (collection_id, collection_type, collection_code, institution_code, institution_id) FROM './input_data/collection.tsv' WITH DELIMITER E'\t' CSV HEADER;
--\copy public.in_event (event_id, event_type, event_date, year, month, day, verbatim_locality, verbatim_latitude, verbatim_longitude, decimal_latitude, decimal_longitude) FROM './input_data/event.tsv' WITH DELIMITER E'\t' CSV HEADER;
--\copy public.in_genetic_sequence (genetic_sequence_id, derived_from_material_entity_id, genetic_sequence_type, genetic_sequence, genetic_sequence_citation) FROM './input_data/genetic_sequence.tsv' WITH DELIMITER E'\t' CSV HEADER;
--\copy public.in_identification (identification_id, identification_based_on_material_entity_id, identification_type, taxon_formula, type_status, identified_by, identified_by_id, identification_remarks, verbatim_identification, taxon_id, kingdom, scientific_name, taxon_rank) FROM './input_data/identification.tsv' WITH DELIMITER E'\t' CSV HEADER;
--\copy public.in_identifier (identifier, identifier_target_id, identifier_target_type, identifier_type) FROM './input_data/identifier.tsv' WITH DELIMITER E'\t' CSV HEADER;
--\copy public.in_material (material_entity_id, material_entity_type, institution_id, institution_code, owner_institution_code, collection_id, collection_code, catalog_number, other_catalog_numbers, preparations, associated_sequences, material_citation, derived_from_material_entity_id, derivation_type, part_of_material_entity_id) FROM './input_data/material.tsv' WITH DELIMITER E'\t' CSV HEADER;
--\copy public.in_media (media_id, media_target_id, media_target_type, media_type, access_uri, web_statement, owner, source, creator, media_language) FROM './input_data/media.tsv' WITH DELIMITER E'\t' CSV HEADER;
--\copy public.in_occurrence (occurrence_id, organism_quantity, organism_quantity_type, sex, life_stage, occurrence_status, organism_id) FROM './input_data/occurrence.tsv' WITH DELIMITER E'\t' CSV HEADER;

\copy public.in_agent FROM './input_data/agent.tsv' WITH DELIMITER E'\t' HEADER;
\copy public.in_assertion FROM './input_data/assertion.tsv' WITH DELIMITER E'\t' HEADER;
\copy public.in_citation FROM './input_data/citation.tsv' WITH DELIMITER E'\t' HEADER;
\copy public.in_collection FROM './input_data/collection.tsv' WITH DELIMITER E'\t' HEADER;
\copy public.in_event FROM './input_data/event.tsv' WITH DELIMITER E'\t' HEADER;
\copy public.in_genetic_sequence FROM './input_data/genetic_sequence.tsv' WITH DELIMITER E'\t' HEADER;
\copy public.in_identification FROM './input_data/identification.tsv' WITH DELIMITER E'\t' HEADER;
\copy public.in_identifier FROM './input_data/identifier.tsv' WITH DELIMITER E'\t' HEADER;
\copy public.in_material FROM './input_data/material.tsv' WITH DELIMITER E'\t' HEADER;
\copy public.in_media FROM './input_data/media.tsv' WITH DELIMITER E'\t' HEADER;
\copy public.in_occurrence FROM './input_data/occurrence.tsv' WITH DELIMITER E'\t' HEADER;

COMMIT;