---
-- Schema for the dwca_v2 extended occurrences publishing model.
-- 

-- Event classes
CREATE TYPE EVENT_CLASS AS ENUM (
  'Event',
  'Material Gathering',
  'Occurrence',
  'Organism Interaction',
  'Survey'
);

-- Target types for the common tables (AgentRole, Assertion, Citation, Identifier, Media
--   Relationship)
CREATE TYPE COMMON_TARGETS AS ENUM (
  'Event',
  'Occurrence',
  'Identification',
  'Material Gathering',
  'Material Entity',
  'Collection',
  'Genetic Sequence',
  'Chronometric Age',
  'Geological Context',
  'Organism Interaction',
  'Survey',
  'Agent',
  'Agent Role',
  'Assertion',
  'Citation',
  'Media',
  'Identifier',
  'Protocol',
  'Resource Relationship'
);

CREATE TYPE INCLUDE_OR_EXCLUDE AS ENUM (
  'Include',
  'Exclude'
);

CREATE TYPE OCCURRENCE_STATUS AS ENUM (
  'Present',
  'Absent'
);

CREATE TYPE TAXON_COMPLETENESS_REPORTED AS ENUM (
  'not reported',
  'reported complete',
  'reported incomplete'
);

-- Event (https://dwc.tdwg.org/terms/#event)
--   Something that happened at a place and time
--   Zero or one parent Event per Event

CREATE TABLE event (
  event_id TEXT PRIMARY KEY,
  parent_event_id TEXT REFERENCES event ON DELETE CASCADE DEFERRABLE,
  preferred_event_name TEXT,
  event_class EVENT_CLASS DEFAULT 'Event' NOT NULL,
  event_type TEXT NOT NULL,
  event_type_iri TEXT,
  event_type_vocabulary TEXT,
  field_number TEXT,
  event_conducted_by TEXT,
  event_conducted_by_id TEXT,
  event_date TEXT,
  event_time TEXT,
  start_day_of_year SMALLINT CHECK (start_day_of_year BETWEEN 1 AND 366),
  end_day_of_year SMALLINT CHECK (start_day_of_year BETWEEN 1 AND 366),
  year SMALLINT,
  month SMALLINT CHECK (month BETWEEN 1 AND 12),
  day SMALLINT CHECK (day BETWEEN 1 and 31), 
  verbatim_event_date TEXT,
  verbatim_locality TEXT,
  verbatim_elevation TEXT,
  verbatim_depth TEXT,
  verbatim_coordinates TEXT,
  verbatim_latitude TEXT,
  verbatim_longitude TEXT,
  verbatim_coordinate_system TEXT,
  verbatim_srs TEXT,
  georeference_verification_status TEXT,
  habitat TEXT,
  sample_size_value TEXT,
  sample_size_unit TEXT,
  event_effort TEXT,
  field_notes TEXT,
  event_citation TEXT,
  event_remarks TEXT,
  protocol_id TEXT,
  protocol_name TEXT,
  protocol_description TEXT,
  protocol_citation TEXT,
  protocol_remarks TEXT,
  location_id TEXT,
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
  vertical_datum TEXT,
  minimum_depth_in_meters NUMERIC CHECK (minimum_depth_in_meters BETWEEN 0 AND 11000),
  maximum_depth_in_meters NUMERIC CHECK (maximum_depth_in_meters BETWEEN 0 AND 11000),
  minimum_distance_above_surface_in_meters NUMERIC,
  maximum_distance_above_surface_in_meters NUMERIC,
  location_remarks TEXT,
  decimal_latitude NUMERIC CHECK (decimal_latitude BETWEEN -90 AND 90),
  decimal_longitude NUMERIC CHECK (decimal_longitude BETWEEN -180 AND 180),
  geodetic_datum TEXT,
  coordinate_uncertainty_in_meters NUMERIC CHECK (coordinate_uncertainty_in_meters > 0  AND coordinate_uncertainty_in_meters <= 20037509),
  coordinate_precision NUMERIC CHECK (coordinate_precision BETWEEN 0 AND 90),
  point_radius_spatial_fit NUMERIC CHECK (point_radius_spatial_fit = 0 OR point_radius_spatial_fit >= 1),
  footprint_wkt TEXT,
  footprint_srs TEXT,
  footprint_spatial_fit NUMERIC CHECK (footprint_spatial_fit >= 0),
  georeferenced_by TEXT,
  georeferenced_by_id TEXT,
  georeferenced_date TEXT,
  georeference_protocol_id TEXT,
  georeference_protocol TEXT,
  georeference_sources TEXT,
  georeference_remarks TEXT,
  preferred_spatial_representation TEXT
);
CREATE INDEX ON event(parent_event_id);
CREATE INDEX ON event(event_conducted_by_id);
CREATE INDEX ON event(protocol_id);
CREATE INDEX ON event(georeferenced_by_id);
CREATE INDEX ON event(georeference_protocol_id);

-- Occurrence (https://dwc.tdwg.org/terms/#occurrence)
--   An Event establishing the presence or absence of a dwc:Organism within a place and 
--   during an interval of time.
--   One Event per Occurrence

CREATE TABLE occurrence (
  occurrence_id TEXT PRIMARY KEY REFERENCES event ON DELETE CASCADE DEFERRABLE,
  organism_quantity TEXT,
  organism_quantity_type TEXT,
  organism_quantity_type_iri TEXT,
  organism_quantity_type_vocabulary TEXT,
  sex TEXT,
  life_stage TEXT,
  reproductive_condition TEXT,
  caste TEXT,
  behavior TEXT,
  vitality TEXT,
  establishment_means TEXT,
  degree_of_establishment TEXT,
  pathway TEXT,
  occurrence_status OCCURRENCE_STATUS DEFAULT 'Present' NOT NULL,
  occurrence_remarks TEXT,
  organism_id TEXT,
  organism_scope TEXT DEFAULT 'Multicellular Organism' NOT NULL,
  organism_scope_iri TEXT,
  organism_scope_vocabulary TEXT,
  organism_name TEXT,
  organism_remarks TEXT
);

-- Identification (https://dwc.tdwg.org/terms/#identification)
--    An assignment of one or more taxa to an Occurrence, MaterialEntity or GeneticSequence.
--    Zero or one Agent as identified_by_id

CREATE TABLE identification (
  identification_id TEXT PRIMARY KEY,
  identification_based_on_occurrence_id TEXT,
  identification_based_on_material_entity_id TEXT,
  identification_based_on_genetic_sequence_id TEXT,
  identification_based_on_media_id TEXT,
  identification_type TEXT,
  identification_type_iri TEXT,
  identification_type_vocabulary TEXT,
  verbatim_identification TEXT,
  is_accepted_identification BOOLEAN,
  taxon_formula TEXT DEFAULT 'A' NOT NULL,
  type_status TEXT,
  type_designation_type TEXT,
  identified_by TEXT,
  identified_by_id TEXT,
  date_identified TEXT,
  identification_references TEXT,
  identification_verification_status TEXT,
  identification_remarks TEXT,
  taxon_id TEXT,
  kingdom TEXT,
  scientific_name TEXT NOT NULL,
  taxon_rank TEXT,
  taxon_remarks TEXT
);
CREATE INDEX ON identification(identification_based_on_occurrence_id);
CREATE INDEX ON identification(identification_based_on_material_entity_id);
CREATE INDEX ON identification(identification_based_on_genetic_sequence_id);
CREATE INDEX ON identification(identification_based_on_media_id);
CREATE INDEX ON identification(identified_by_id);

-- IdentificationTaxon
--    The components and positions of dwc:scientificNames in dwc:Identifications.
--    Zero or one Agent as identified_by_id

CREATE TABLE identification_taxon (
  identification_id TEXT REFERENCES identification ON DELETE CASCADE DEFERRABLE,
  taxon_id TEXT,
  taxon_order SMALLINT CHECK (taxon_order >= 1),
  kingdom TEXT,
  scientific_name TEXT NOT NULL,
  taxon_rank TEXT,
  taxon_remarks TEXT
);

-- MaterialGathering
--   An Event in which a dwc:MaterialEntity was gathered.
--   One Event per Occurrence

CREATE TABLE material_gathering (
  material_gathering_id TEXT PRIMARY KEY REFERENCES event ON DELETE CASCADE DEFERRABLE
);

-- Material (https://dwc.tdwg.org/terms/#materialentity)
--  Includes dwc:Organisms, dwc:MaterialEntities

CREATE TABLE material (
  material_entity_id TEXT PRIMARY KEY,
  material_entity_type TEXT NOT NULL,
  material_entity_type_iri TEXT,
  material_entity_type_vocabulary TEXT,
  institution_code TEXT,
  institution_id TEXT, 
  owner_institution_code TEXT,
  owner_institution_id TEXT,
  collection_code TEXT,
  collection_id TEXT,
  catalog_number TEXT,
  other_catalog_numbers TEXT,
  record_number TEXT,
  preparations TEXT,
  disposition TEXT,
  verbatim_label TEXT,
  associated_sequences TEXT,
  material_citation TEXT,
  material_entity_remarks TEXT,
  material_gathering_id TEXT,
  evidence_for_occurrence_id TEXT,
  derived_from_material_entity_id TEXT,
  derivation_type TEXT,
  derivation_type_iri TEXT,
  derivation_type_vocabulary TEXT,
  part_of_material_entity_id TEXT
);
CREATE INDEX ON material(institution_id);
CREATE INDEX ON material(owner_institution_id);
CREATE INDEX ON material(collection_id);
CREATE INDEX ON material(material_gathering_id);
CREATE INDEX ON material(evidence_for_occurrence_id);
CREATE INDEX ON material(derived_from_material_entity_id);
CREATE INDEX ON material(part_of_material_entity_id);

-- Collection (see Latimer Core)
--   A type of Agent that maintains material and/or media.
--   An organizational agent that maintains Entities.

CREATE TABLE collection (
  collection_id TEXT PRIMARY KEY,
  collection_type TEXT,
  collection_type_iri TEXT,
  collection_type_vocabulary TEXT,
  institution_code TEXT,
  institution_id TEXT, 
  collection_name TEXT,
  collection_code TEXT);
CREATE INDEX ON collection(institution_id);

-- GeneticSequence
--   An DigitalEntity describing a genetic sequence.

CREATE TABLE genetic_sequence (
  genetic_sequence_id TEXT PRIMARY KEY,
  material_gathering_id TEXT,
  derived_from_material_entity_id TEXT,
  genetic_sequence_type TEXT NOT NULL,
  genetic_sequence TEXT NOT NULL,
  genetic_sequence_citation TEXT,
  genetic_sequence_remarks TEXT
);
CREATE INDEX ON genetic_sequence(material_gathering_id);
CREATE INDEX ON genetic_sequence(derived_from_material_entity_id);

-- ChronometricAge (https://tdwg.github.io/chrono/terms/#chronometricage)
--   Evidence-based temporal placement
--   Zero or more ChronometricAges per GatheringEvent
--   Zero or more ChronometricAges per materialDated

CREATE TABLE chronometric_age (
  chronometric_age_id TEXT PRIMARY KEY, 
  material_gathering_id TEXT REFERENCES event ON DELETE CASCADE DEFERRABLE,
  verbatim_chronometric_age TEXT,
  chronometric_age_protocol TEXT,
  chronometric_age_protocol_id TEXT,
  uncalibrated_chronometric_age TEXT,
  chronometric_age_conversion_protocol TEXT,
  chronometric_age_conversion_protocol_id TEXT,
  earliest_chronometric_age INTEGER,
  earliest_chronometric_age_reference_system TEXT,
  latest_chronometric_age INTEGER,
  latest_chronometric_age_reference_system TEXT,
  chronometric_age_uncertainty_in_years INTEGER,
  chronometric_age_uncertainty_method TEXT,
  material_dated TEXT,
  material_dated_id TEXT,
  material_dated_relationship TEXT,
  chronometric_age_determined_by TEXT,
  chronometric_age_determined_by_id TEXT,
  chronometric_age_determined_date TEXT,
  chronometric_age_references TEXT,
  chronometric_age_remarks TEXT
);
CREATE INDEX ON chronometric_age(material_gathering_id);
CREATE INDEX ON chronometric_age(chronometric_age_protocol_id);
CREATE INDEX ON chronometric_age(chronometric_age_conversion_protocol_id);
CREATE INDEX ON chronometric_age(material_dated_id);
CREATE INDEX ON chronometric_age(chronometric_age_determined_by_id);

-- GeologicalContext (https://dwc.tdwg.org/terms/#geologicalcontext)
--   Geological context information about an Event
--   Zero or one GeologicalContexts per Event

CREATE TABLE geological_context (
  geological_context_id TEXT PRIMARY KEY,
  event_id TEXT REFERENCES event ON DELETE CASCADE DEFERRABLE,
  earliest_eon_or_lowest_eonothem TEXT,
  latest_eon_or_highest_eonothem TEXT,
  earliest_era_or_lowest_erathem TEXT,
  latest_era_or_highest_erathem TEXT,
  earliest_period_or_lowest_system TEXT,
  latest_period_or_highest_system TEXT,
  earliest_epoch_or_lowest_series TEXT,
  latest_epoch_or_highest_series TEXT,
  earliest_age_or_lowest_stage TEXT,
  latest_age_or_highest_stage TEXT,
  lowest_biostratigraphic_zone TEXT,
  highest_biostratigraphic_zone TEXT,
  lithostratigraphic_terms TEXT,
  "group" TEXT,
  formation TEXT,
  member TEXT,
  bed TEXT
);
CREATE INDEX ON geological_context(event_id);

-- OrganismInteraction 
--   (subject Organism Occurrence interaction with object Organism Orccurrence,
--   interaction from the perspective of subject to object)
--   A type of Event in which an interaction between two Organisms (two Occurrences) at a place and time is observed.
--   One subject Organism Occurrence per OrganismInteraction
--   One object Organism Occurrence per OrganismInteraction

CREATE TABLE organism_interaction (
  organism_interaction_id TEXT PRIMARY KEY REFERENCES event ON DELETE CASCADE DEFERRABLE,
  subject_occurrence_id TEXT REFERENCES occurrence ON DELETE CASCADE DEFERRABLE,
  subject_organism_part TEXT,
  organism_interaction_type TEXT,
  organism_interaction_type_iri TEXT,
  organism_interaction_type_vocabulary TEXT,
  object_occurrence_id TEXT REFERENCES occurrence ON DELETE CASCADE DEFERRABLE,
  object_organism_part TEXT
);
CREATE INDEX ON organism_interaction(subject_occurrence_id);
CREATE INDEX ON organism_interaction(object_occurrence_id);

-- Survey
--   Information associated with dwc:Events that are biotic surveys.
--   A type of Event in which a biotic survey is captured. Expected to have hierarchical Events, including Organism Occurrences.

CREATE TABLE survey (
  survey_id TEXT PRIMARY KEY REFERENCES event ON DELETE CASCADE DEFERRABLE,
  site_count SMALLINT CHECK (site_count >= 1),
  site_nesting_description TEXT,
  verbatim_site_descriptions TEXT,
  verbatim_site_names TEXT,
  geospatial_scope_area_value NUMERIC CHECK (geospatial_scope_area_value >= 0),
  geospatial_scope_area_unit TEXT,
  total_area_sampled_value NUMERIC CHECK (total_area_sampled_value >= 0),
  total_area_sampled_unit TEXT,
  reported_weather TEXT,
  reported_extreme_conditions TEXT,
  target_habitat_scope TEXT,
  excluded_habitat_scope TEXT,
  event_duration_value NUMERIC CHECK (event_duration_value >= 0),
  event_duration_unit TEXT,
  target_taxonomic_scope TEXT,
  excluded_taxonomic_scope TEXT,
  taxon_completeness_reported TAXON_COMPLETENESS_REPORTED DEFAULT 'not reported' NOT NULL,
  taxon_completeness_protocols TEXT,
  is_taxonomic_scope_fully_reported BOOLEAN,
  is_absence_reported BOOLEAN,
  absent_taxa TEXT,
  has_non_target_taxa BOOLEAN,
  non_target_taxa TEXT,
  are_non_target_taxa_fully_reported BOOLEAN,
  target_life_stage_scope TEXT,
  excluded_life_stage_scope TEXT,
  is_life_stage_scope_fully_reported BOOLEAN,
  target_degree_of_establishment_scope TEXT,
  excluded_degree_of_establishment_scope TEXT,
  is_degree_of_establishment_scope_fully_reported BOOLEAN,
  target_growth_form_scope TEXT,
  excluded_growth_form_scope TEXT,
  is_growth_form_scope_fully_reported BOOLEAN,
  has_non_target_organisms BOOLEAN,
  verbatim_target_scope TEXT,
  identified_by TEXT,
  identified_by_id TEXT,
  identification_references TEXT,
  compilation_types TEXT,
  compilation_source_types TEXT,
  inventory_types TEXT,
  protocol_names TEXT,
  protocol_descriptions TEXT,
  protocol_references TEXT,
  is_abundance_reported BOOLEAN,
  is_abundance_cap_reported BOOLEAN,
  abundance_cap SMALLINT CHECK (abundance_cap >= 0),
  is_vegetation_cover_reported BOOLEAN,
  is_least_specific_target_category_quantity_inclusive BOOLEAN,
  has_vouchers BOOLEAN,
  voucher_institutions TEXT,
  has_material_samples BOOLEAN,
  material_sample_types TEXT,
  sampling_performed_by TEXT,
  sampling_performed_by_id TEXT,
  is_sampling_effort_reported BOOLEAN,
  sampling_effort_protocol TEXT,
  sampling_effort_protocol_id TEXT,
  sampling_effort_value NUMERIC CHECK (sampling_effort_value >= 0),
  sampling_effort_unit TEXT
);
CREATE INDEX ON survey(identified_by_id);
CREATE INDEX ON survey(sampling_performed_by_id);
CREATE INDEX ON survey(sampling_effort_protocol_id);

-- SurveyTarget
--   Specifications of characteristics of dwc:Organisms that were included or excluded in a survey.
--   A Survey can have zero or more SurveyTargets.

CREATE TABLE survey_target (
  survey_target_id TEXT PRIMARY KEY,
  survey_id TEXT,
  survey_target_type TEXT,
  survey_target_type_iri TEXT,
  survey_target_type_vocabulary TEXT,
  survey_target_value TEXT,
  survey_target_value_iri TEXT,
  survey_target_value_vocabulary TEXT,
  survey_target_unit TEXT,
  survey_target_unit_iri TEXT,
  survey_target_unit_vocabulary TEXT,
  include_or_exclude INCLUDE_OR_EXCLUDE DEFAULT 'Include' NOT NULL,
  is_survey_target_fully_reported BOOLEAN
);
CREATE INDEX ON survey_target(survey_id);

-- SurveyTargetAbundance
--   Reported quantities of observed dwc:Organisms of a given dwc:Taxon in a set of SurveyTargets.
--   A SurveyTarget can have one or more SurveyTargetAbundances.

CREATE TABLE survey_target_abundance (
  survey_target_id TEXT NOT NULL,
  observed_taxon TEXT,
  observed_taxon_id TEXT,
  organism_quantity TEXT,
  organism_quantity_type TEXT,
  organism_quantity_type_iri TEXT,
  organism_quantity_type_vocabulary TEXT
);
CREATE INDEX ON survey_target_abundance(survey_target_id);


-- Agent (https://www.w3.org/TR/prov-o/#Agent)
--    An agent is something that bears some form of responsibility for an activity
--    taking place, for the existence of an entity, or for another agent's activity.

CREATE TABLE agent (
  agent_id TEXT PRIMARY KEY,
  agent_type TEXT NOT NULL,
  agent_type_iri TEXT,
  agent_type_vocabulary TEXT,
  preferred_agent_name TEXT
);

-- AgentRole
--    A role played by an Agent with respect to a thing. AgentRoles can be applied to all 
--    COMMON_TARGETS.

CREATE TABLE agent_role (
  agent_role_target_id TEXT NOT NULL,
  agent_role_target_type COMMON_TARGETS NOT NULL,
  agent_role TEXT,
  agent_role_iri TEXT,
  agent_role_vocabulary TEXT,
  agent_role_order SMALLINT NOT NULL CHECK (agent_role_order >= 1) DEFAULT 1,
  agent_role_date TEXT,
  agent_id TEXT,
  agent_type TEXT,
  agent_type_iri TEXT,
  agent_type_vocabulary TEXT,
  preferred_agent_name TEXT
);
CREATE INDEX ON agent_role(agent_role_target_id);
CREATE INDEX ON agent_role(agent_id);
ALTER TABLE agent_role ADD CONSTRAINT agent_role_unique_key UNIQUE (agent_role_target_id, 
agent_role_target_type, agent_role, agent_role_iri, agent_role_order, agent_id, 
preferred_agent_name
);

-- Assertion
--    An observation, measurement, or other statement made by an Agent with respect to a 
--    thing. Assertions can be applied to all COMMON_TARGETS.

CREATE TABLE "assertion" (
  assertion_id TEXT PRIMARY KEY,
  assertion_target_id TEXT NOT NULL,
  assertion_target_type COMMON_TARGETS NOT NULL,
  assertion_type TEXT NOT NULL,
  assertion_type_iri TEXT,
  assertion_type_vocabulary TEXT,
  assertion_made_date TEXT,
  assertion_effective_date TEXT,
  assertion_value TEXT,
  assertion_value_numeric NUMERIC,
  assertion_unit TEXT,
  assertion_unit_iri TEXT,
  assertion_unit_vocabulary TEXT,
  assertion_by TEXT, 
  assertion_by_id TEXT REFERENCES agent ON DELETE CASCADE DEFERRABLE,
  assertion_protocol TEXT,
  assertion_protocol_id TEXT,
  assertion_citation TEXT,
  assertion_remarks TEXT
);
CREATE INDEX ON "assertion"(assertion_by_id);
CREATE INDEX ON "assertion"(assertion_target_id);
CREATE INDEX ON "assertion"(assertion_protocol_id);

-- Citation
--   A specific citation of a thing in a Reference. Citations can be applied to all 
--   COMMON_TARGETS.

CREATE TABLE citation (
  citation_id TEXT PRIMARY KEY,
  citation_target_id TEXT NOT NULL,
  citation_target_type COMMON_TARGETS NOT NULL,
  citation_type TEXT,
  citation_type_iri TEXT,
  citation_type_vocabulary TEXT,
  bibliographic_citation TEXT,
  page_number TEXT,
  reference_id TEXT,
  reference_type TEXT,
  reference_type_iri TEXT,
  reference_type_vocabulary TEXT,
  reference_year SMALLINT,
  is_peer_reviewed BOOLEAN,
  citation_remarks TEXT
);
CREATE INDEX ON citation(citation_target_id);

-- Media
--   Media (dcmi:Sounds, dcmi:StillImages, dcmi:MovingImages or dcmi:Text) about other 
--   entities. Media can have any COMMON_TARGETS as the subject matter.

CREATE TABLE media (
  media_id TEXT PRIMARY KEY,
  media_target_id TEXT,
  media_target_type COMMON_TARGETS NOT NULL,
  media_type TEXT,
  media_type_iri TEXT,
  media_type_vocabulary TEXT,
  access_uri TEXT,
  web_statement TEXT,
  format TEXT,
  rights TEXT,
  owner TEXT,
  source TEXT,
  creator TEXT,
  creator_id TEXT,
  create_date TEXT,
  modified TEXT,
  media_language TEXT,
  media_subject_category TEXT,
  media_subject_category_iri TEXT,
  media_subject_category_vocabulary TEXT,
  media_description TEXT
);
CREATE INDEX ON media(media_target_id);
CREATE INDEX ON media(creator_id);

-- Identifier
--    An alternate identifier for a thing. Identifiers are separated by the specific 
--    classes they identify and the type of identifier (e.g., 'DOI', 'ORCID').

CREATE TABLE identifier (
  identifier TEXT NOT NULL,
  identifier_target_id TEXT NOT NULL,
  identifier_target_type COMMON_TARGETS NOT NULL,
  identifier_type TEXT,
  identifier_type_iri TEXT,
  identifier_type_vocabulary TEXT,
  identifier_language TEXT
);
CREATE INDEX ON identifier(identifier_target_id);

-- Protocol
--    A method used during an action.

CREATE TABLE protocol (
  protocol_id TEXT PRIMARY KEY,
  protocol_target_id TEXT,
  protocol_target_type COMMON_TARGETS,
  protocol_type TEXT,
  protocol_type_iri TEXT,
  protocol_type_vocabulary TEXT,
  protocol_name TEXT,
  protocol_description TEXT,
  protocol_citation TEXT,
  protocol_remarks TEXT
);
CREATE INDEX ON protocol(protocol_target_id);

-- Relationship
--   Any direct relationship between two Entities.
--   Zero or one EntityRelationships upon which the EntityRelationship depends.
--   Exactly one subject Entity
--   Exactly one object Entity (either via object_entity_id or object_entity_iri)

CREATE TABLE relationship (
  relationship_id TEXT PRIMARY KEY,
  subject_resource_id TEXT NOT NULL,
  subject_resource_type COMMON_TARGETS NOT NULL,
  subject_resource_type_iri TEXT,
  subject_resource_type_vocabulary TEXT,
  relationship_type TEXT,
  relationship_type_iri TEXT,
  relationship_type_vocabulary TEXT,
  related_resource_id TEXT NOT NULL,
  related_resource_type COMMON_TARGETS NOT NULL,
  related_resource_type_iri TEXT,
  related_resource_type_vocabulary TEXT,
  relationship_order SMALLINT NOT NULL DEFAULT 1 CHECK (relationship_order >= 1),
  relationship_according_to TEXT,
  relationship_according_to_id TEXT,
  relationship_effective_date TEXT,
  entity_remarks TEXT
);
CREATE INDEX ON relationship(subject_resource_id);
CREATE INDEX ON relationship(related_resource_id);
CREATE INDEX ON relationship(relationship_according_to_id);