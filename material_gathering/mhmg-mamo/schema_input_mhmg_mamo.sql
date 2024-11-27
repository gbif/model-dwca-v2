---
-- Schema for input data to be mapped to dwca_v2 publishing model.
--

CREATE TABLE in_agent (
    agent_id TEXT PRIMARY KEY, 
    agent_type TEXT, 
    preferred_agent_name TEXT
);

CREATE TABLE in_assertion (
    assertion_id TEXT PRIMARY KEY,
    assertion_target_id TEXT,
    assertion_target_type TEXT,
    assertion_type TEXT,
    assertion_made_date TEXT,
    assertion_value TEXT,
    assertion_value_numeric TEXT,
    assertion_unit TEXT,
    assertion_by TEXT,
    assertion_by_id TEXT
);
CREATE INDEX idx_assertion_target_id ON in_assertion(assertion_target_id);

CREATE TABLE in_citation (
    citation_id TEXT PRIMARY KEY,
    citation_target_id TEXT,
    citation_target_type TEXT,
    citation_type TEXT,
    bibliographic_citation TEXT,
    reference_id TEXT,
    reference_type TEXT,
    reference_year SMALLINT,
    is_peer_reviewed BOOLEAN
);
CREATE INDEX idx_citation_target_id ON in_citation(citation_target_id);

CREATE TABLE in_collection (
    collection_id TEXT PRIMARY KEY, 
    collection_type TEXT, 
    collection_code TEXT, 
    institution_code TEXT, 
    institution_id TEXT
);
CREATE INDEX idx_institution_id ON in_collection(institution_id);

CREATE TABLE in_event (
    event_id TEXT PRIMARY KEY,
    event_type TEXT,
    event_date TEXT,
    year TEXT,
    month TEXT,
    day TEXT,
    verbatim_locality TEXT,
    verbatim_latitude TEXT,
    verbatim_longitude TEXT,
    decimal_latitude TEXT,
    decimal_longitude TEXT
);

CREATE TABLE in_genetic_sequence (
    genetic_sequence_id TEXT PRIMARY KEY, 
    derived_from_material_entity_id TEXT, 
    genetic_sequence_type TEXT, 
    genetic_sequence TEXT, 
    genetic_sequence_citation TEXT
);
CREATE INDEX idx_sequence_derived_from_material_entity_id ON in_genetic_sequence(derived_from_material_entity_id);

CREATE TABLE in_identification (
    identification_id TEXT PRIMARY KEY,
    identification_based_on_material_entity_id TEXT, 
    identification_type TEXT,
    taxon_formula TEXT,
    type_status TEXT, 
    identified_by TEXT, 
    identified_by_id TEXT, 
    identification_remarks TEXT, 
    verbatim_identification TEXT, 
    taxon_id TEXT, 
    kingdom TEXT, 
    scientific_name TEXT, 
    taxon_rank TEXT
);
CREATE INDEX idx_identification_based_on_material_entity_id ON in_identification(identification_based_on_material_entity_id);
CREATE INDEX idx_identified_by_id ON in_identification(identified_by_id);

CREATE TABLE in_identifier (
    identifier TEXT PRIMARY KEY, 
    identifier_target_id TEXT, 
    identifier_target_type TEXT, 
    identifier_type TEXT
);
CREATE INDEX idx_identifier_target_id ON in_identifier(identifier_target_id);

CREATE TABLE in_material (
    material_entity_id TEXT PRIMARY KEY,
    material_entity_type TEXT,
    institution_id TEXT,
    institution_code TEXT,
    owner_institution_code TEXT,
    collection_id TEXT,
    collection_code TEXT,
    catalog_number TEXT,
    other_catalog_numbers TEXT,
    preparations TEXT,
    associated_sequences TEXT,
    material_citation TEXT,
    derived_from_material_entity_id TEXT,
    derivation_type TEXT,
    part_of_material_entity_id TEXT
);
CREATE INDEX idx_material_institution_id ON in_material(institution_id);
CREATE INDEX idx_derived_from_material_entity_id ON in_material(derived_from_material_entity_id);
CREATE INDEX idx_part_of_material_entity_id ON in_material(part_of_material_entity_id);

CREATE TABLE in_media (
    media_id TEXT PRIMARY KEY, 
    media_target_id TEXT, 
    media_target_type TEXT, 
    media_type TEXT, 
    access_uri TEXT, 
    web_statement TEXT, 
    owner TEXT, 
    source TEXT, 
    creator TEXT, 
    media_language TEXT
);
CREATE INDEX idx_media_target_id ON in_media(media_target_id);

CREATE TABLE in_occurrence (
  occurrence_id TEXT PRIMARY KEY,
  organism_quantity TEXT,
  organism_quantity_type TEXT,
  sex TEXT,
  life_stage TEXT,
  occurrence_status TEXT,
  organism_id TEXT
);