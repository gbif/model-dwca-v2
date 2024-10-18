---
-- Schema for input data to be mapped to dwca_v2 publishing model.
--

CREATE TABLE in_assertion (
    assertion_id TEXT PRIMARY KEY,
    assertion_target_id TEXT,
    assertion_target_type TEXT,
    assertion_parent_assertion TEXT,
    assertion_type TEXT,
    assertion_made_date TEXT,
    assertion_effective_date TEXT,
    assertion_value TEXT,
    assertion_value_numeric NUMERIC,
    assertion_unit TEXT,
    assertion_by_agent_name TEXT,
    assertion_by_agent_id TEXT,
    assertion_protocol TEXT,
    assertion_protocol_id TEXT,
    assertion_remarks TEXT
);
CREATE INDEX idx_assertion_target_id ON in_assertion(assertion_target_id);

CREATE TABLE in_citation (
    citation_target_id TEXT,
    citation_target_type TEXT,
    citation_reference_id TEXT,
    citation_type TEXT,
    citation_page_number TEXT,
    citation_remarks TEXT
);
CREATE INDEX idx_citation_target_id ON in_citation(citation_target_id);
CREATE INDEX idx_citation_reference_id ON in_citation(citation_reference_id);

CREATE TABLE in_entity (
    entity_id TEXT PRIMARY KEY,
    entity_type TEXT,
    dataset_id TEXT,
    entity_name TEXT,
    entity_remarks TEXT
);

CREATE TABLE in_event (
    event_id TEXT PRIMARY KEY,
    parent_event_id TEXT,
    dataset_id TEXT,
    location_id TEXT,
    protocol_id TEXT,
    event_type TEXT,
    event_name TEXT,
    field_number TEXT,
    event_date TEXT,
    year SMALLINT,
    month SMALLINT,
    day SMALLINT,
    verbatim_event_date TEXT,
    verbatim_locality TEXT,
    verbatim_elevation TEXT,
    verbatim_depth TEXT,
    verbatim_coordinates TEXT,
    verbatim_latitude TEXT,
    verbatim_longitude TEXT,
    verbatim_coordinate_system TEXT,
    verbatim_srs TEXT,
    habitat TEXT,
    protocol_description TEXT,
    sample_size_value TEXT,
    sample_size_unit TEXT,
    event_effort TEXT,
    field_notes TEXT,
    event_remarks TEXT
);
CREATE INDEX idx_parent_event_id ON in_event(parent_event_id);
CREATE INDEX idx_location_id ON in_event(location_id);
CREATE INDEX idx_protocol_id ON in_event(protocol_id);

CREATE TABLE in_georeference (
  georeference_id TEXT PRIMARY KEY,
  location_id TEXT,
  decimal_latitude NUMERIC CHECK (decimal_latitude BETWEEN -90 AND 90),
  decimal_longitude NUMERIC CHECK (decimal_longitude BETWEEN -180 AND 180),
  geodetic_datum TEXT,
  coordinate_uncertainty_in_meters NUMERIC CHECK (coordinate_uncertainty_in_meters > 0 AND coordinate_uncertainty_in_meters <= 20037509),
  coordinate_precision NUMERIC CHECK (coordinate_precision BETWEEN 0 AND 90),
  point_radius_spatial_fit NUMERIC CHECK (point_radius_spatial_fit = 0 OR point_radius_spatial_fit >= 1),
  footprint_wkt TEXT,
  footprint_srs TEXT,
  footprint_spatial_fit NUMERIC CHECK (footprint_spatial_fit >= 0),
  georeferenced_by TEXT,
  georeferenced_date TEXT,
  georeference_protocol TEXT,
  georeference_sources TEXT,
  georeference_remarks TEXT,
  preferred_spatial_representation TEXT
);
CREATE INDEX idx_georeference_location_id ON in_georeference(location_id);

CREATE TABLE in_identification (
  identification_id TEXT PRIMARY KEY,
  organism_id TEXT,
  identification_type TEXT,
  taxon_formula TEXT,
  verbatim_identification TEXT,
  type_status TEXT,
  identified_by TEXT,
  identified_by_id TEXT,
  date_identified TEXT,
  identification_references TEXT,
  identification_verification_status TEXT,
  identification_remarks TEXT,
  type_designation_type TEXT,
  type_designated_by TEXT
);
CREATE INDEX idx_identification_id ON in_identification(identification_id);
CREATE INDEX idx_organism_id ON in_identification(organism_id);

CREATE TABLE in_location (
  location_id TEXT PRIMARY KEY,
  parent_location_id TEXT,
  higher_geography_id TEXT,
  higher_geography TEXT,
  continent TEXT,
  water_body TEXT,
  island_group TEXT,
  island TEXT,
  country TEXT,
  country_code CHAR(2),
  state_province TEXT,
  county TEXT,
  municipality TEXT,
  locality TEXT,
  minimum_elevation_in_meters NUMERIC CHECK (minimum_elevation_in_meters BETWEEN -430 AND 8850),
  maximum_elevation_in_meters NUMERIC CHECK (maximum_elevation_in_meters BETWEEN -430 AND 8850),
  minimum_distance_above_surface_in_meters NUMERIC,
  maximum_distance_above_surface_in_meters NUMERIC,
  minimum_depth_in_meters NUMERIC CHECK (minimum_depth_in_meters BETWEEN 0 AND 11000),
  maximum_depth_in_meters NUMERIC CHECK (maximum_depth_in_meters BETWEEN 0 AND 11000),
  vertical_datum TEXT,
  location_according_to TEXT,
  location_remarks TEXT,
  accepted_georreference_id TEXT,
  accepted_georeference_context_id TEXT
);
CREATE INDEX idx_parent_location_id ON in_location(parent_location_id);
CREATE INDEX idx_accepted_georreference_id ON in_location(accepted_georreference_id);

CREATE TABLE in_material_entity (
  material_entity_id TEXT PRIMARY KEY,
  material_entity_type TEXT,
  preparations TEXT,
  dispositions TEXT,
  institution_code TEXT,
  institution_id TEXT,
  collection_code TEXT,
  collection_id TEXT,
  owner_institution_code TEXT,
  catalog_number TEXT,
  record_number TEXT,
  recorder_by TEXT,
  recorder_by_id TEXT,
  associated_references TEXT,
  associated_secuences TEXT,
  other_catalog_numbers TEXT
);
CREATE INDEX idx_institution_id ON in_material_entity(institution_id);
CREATE INDEX idx_collection_id ON in_material_entity(collection_id);
CREATE INDEX idx_recorder_by_id ON in_material_entity(recorder_by_id);

CREATE TABLE in_occurrence_evidence (
  occurrence_id TEXT,
  entity_id TEXT
);
CREATE INDEX idx_evidence_occurrence_id ON in_occurrence_evidence(occurrence_id);
CREATE INDEX idx_entity_id ON in_occurrence_evidence(entity_id);

CREATE TABLE in_occurrence (
  occurrence_id TEXT PRIMARY KEY,
  organism_id TEXT,
  organism_quantity TEXT,
  organism_quantity_type TEXT,
  sex TEXT,
  life_stage TEXT,
  reproductive_condition TEXT,
  behavior TEXT,
  establishment_means TEXT,
  occurrence_status TEXT,
  pathway TEXT,
  degree_of_establishment TEXT,
  georeference_verification_status TEXT,
  occurrence_remarks TEXT,
  information_withheld TEXT,
  data_generalizations TEXT,
  recorded_by TEXT,
  recorded_by_id TEXT,
  associated_media TEXT,
  associated_occurrence TEXT,
  associated_taxa TEXT
);
CREATE INDEX idx_occurrence_occurrence_id ON in_occurrence(occurrence_id);
CREATE INDEX idx_occurrence_organism_id ON in_occurrence(organism_id);
CREATE INDEX idx_recorded_by_id ON in_occurrence(recorded_by_id);

CREATE TABLE in_organism (
  organism_id TEXT PRIMARY KEY,
  organism_scope TEXT,
  accepted_identification_id TEXT
);
CREATE INDEX idx_accepted_identification_id ON in_organism(accepted_identification_id);

CREATE TABLE in_protocol (
  protocol_id TEXT PRIMARY KEY,
  protocol_type TEXT
);

CREATE TABLE in_reference (
  reference_id TEXT PRIMARY KEY,
  reference_type TEXT,
  bibliographic_citation TEXT,
  reference_year SMALLINT,
  reference_iri TEXT,
  is_peer_reviewed BOOLEAN
);

CREATE TABLE in_taxon_identification (
  taxon_id TEXT,
  identification_id TEXT,
  taxon_order SMALLINT,
  taxon_authority TEXT
);
CREATE INDEX idx_taxon_identification_identification_id ON in_taxon_identification(identification_id);
CREATE INDEX idx_taxon_identification_taxon_id ON in_taxon_identification(taxon_id);


CREATE TABLE in_taxon (
  taxon_id TEXT PRIMARY KEY,
  scientific_name TEXT,
  scientific_name_authorship TEXT,
  name_according_to TEXT,
  name_according_to_id TEXT,
  taxon_rank TEXT,
  taxon_source TEXT,
  scientific_name_id TEXT,
  taxon_remarks TEXT,
  parent_taxon_id TEXT,
  taxonomic_status TEXT,
  kingdom TEXT,
  phylum TEXT,
  "class" TEXT,
  "order" TEXT,
  family TEXT,
  subfamily TEXT,
  genus TEXT,
  subgenus TEXT,
  accepted_scientific_name TEXT
);
CREATE INDEX idx_name_according_to_id ON in_taxon(name_according_to_id);
CREATE INDEX idx_parent_taxon_id ON in_taxon(parent_taxon_id);
