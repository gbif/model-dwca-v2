-- Populate event with OrganismInteraction Events

-- Set the event_type to match the preferred controlled vocabulary value.
UPDATE in_event
SET event_type = 'Occurrence'
WHERE event_type = 'OCCURRENCE';

-- Create a table with just one georeference per location.
WITH ranked_georeferences AS (
    SELECT 
      *,
      ROW_NUMBER() OVER (PARTITION BY location_id ORDER BY georeference_id ASC) AS rn
    FROM in_georeference
)
SELECT *
INTO TABLE temp_georeference
FROM ranked_georeferences
WHERE rn = 1;
-- n=7004 rows

-- Create the event table from the input Events.

INSERT INTO event (
  event_id, parent_event_id, preferred_event_name, event_type, field_number,
  event_conducted_by, event_conducted_by_id, event_date, year, month, day, verbatim_event_date,
  verbatim_locality, verbatim_elevation, verbatim_depth, verbatim_coordinates,
  verbatim_latitude, verbatim_longitude, verbatim_coordinate_system, verbatim_srs,
  georeference_verification_status, habitat, protocol_description, sample_size_value,
  sample_size_unit, event_effort, field_notes, event_remarks, location_id, 
  higher_geography_id, higher_geography, continent, water_body, island_group, island, 
  country, country_code, state_province, county, municipality, locality, 
  minimum_elevation_in_meters, maximum_elevation_in_meters, vertical_datum, 
  minimum_depth_in_meters, maximum_depth_in_meters, 
  minimum_distance_above_surface_in_meters, maximum_distance_above_surface_in_meters, 
  location_remarks, decimal_latitude, decimal_longitude, geodetic_datum, 
  coordinate_uncertainty_in_meters, coordinate_precision, point_radius_spatial_fit,
  footprint_wkt, footprint_srs, footprint_spatial_fit, georeferenced_by, 
  georeferenced_date, georeference_protocol, georeference_sources, georeference_remarks, 
  preferred_spatial_representation
)
SELECT 
  event_id, parent_event_id, event_name, event_type, field_number,
  recorded_by, recorded_by_id, event_date, year, month, day, verbatim_event_date,
  verbatim_locality, verbatim_elevation, verbatim_depth, verbatim_coordinates,
  verbatim_latitude, verbatim_longitude, verbatim_coordinate_system, verbatim_srs,
  georeference_verification_status, habitat, protocol_description, sample_size_value,
  sample_size_unit, event_effort, field_notes, event_remarks, a.location_id, 
  higher_geography_id, higher_geography, continent, water_body, island_group, island, 
  country, country_code, state_province, county, municipality, locality, 
  minimum_elevation_in_meters, maximum_elevation_in_meters, vertical_datum, 
  minimum_depth_in_meters, maximum_depth_in_meters, 
  minimum_distance_above_surface_in_meters, maximum_distance_above_surface_in_meters, 
  location_remarks, decimal_latitude, decimal_longitude, geodetic_datum, 
  coordinate_uncertainty_in_meters, coordinate_precision, point_radius_spatial_fit,
  footprint_wkt, footprint_srs, footprint_spatial_fit, georeferenced_by, 
  georeferenced_date, georeference_protocol, georeference_sources, georeference_remarks, 
  preferred_spatial_representation
  FROM in_event a
  JOIN in_location b ON a.location_id = b.location_id
  JOIN in_occurrence d ON a.event_id = d.occurrence_id
  LEFT JOIN temp_georeference c ON b.location_id = c.location_id;
-- n=21146 rows

-- The event table now has Occurrences, but needs separate GatheringEvents for the 
-- material records.

SELECT 
event_id,
gen_random_uuid() AS gathering_event_id
INTO TABLE temp_gathering_event
FROM event;
-- n=21146 rows

-- Use the temp_gathering_event to generate the MaterialGathering Events
INSERT INTO event (
  event_id, parent_event_id, preferred_event_name, event_type, field_number,
  event_conducted_by, event_conducted_by_id, event_date, year, month, day, verbatim_event_date,
  verbatim_locality, verbatim_elevation, verbatim_depth, verbatim_coordinates,
  verbatim_latitude, verbatim_longitude, verbatim_coordinate_system, verbatim_srs,
  georeference_verification_status, habitat, protocol_description, sample_size_value,
  sample_size_unit, event_effort, field_notes, event_remarks, location_id, 
  higher_geography_id, higher_geography, continent, water_body, island_group, island, 
  country, country_code, state_province, county, municipality, locality, 
  minimum_elevation_in_meters, maximum_elevation_in_meters, vertical_datum, 
  minimum_depth_in_meters, maximum_depth_in_meters, 
  minimum_distance_above_surface_in_meters, maximum_distance_above_surface_in_meters, 
  location_remarks, decimal_latitude, decimal_longitude, geodetic_datum, 
  coordinate_uncertainty_in_meters, coordinate_precision, point_radius_spatial_fit,
  footprint_wkt, footprint_srs, footprint_spatial_fit, georeferenced_by, 
  georeferenced_date, georeference_protocol, georeference_sources, georeference_remarks, 
  preferred_spatial_representation
)
SELECT
  gathering_event_id, a.event_id, preferred_event_name, 'Material Gathering', field_number,
  event_conducted_by, event_conducted_by_id, event_date, year, month, day, verbatim_event_date,
  verbatim_locality, verbatim_elevation, verbatim_depth, verbatim_coordinates,
  verbatim_latitude, verbatim_longitude, verbatim_coordinate_system, verbatim_srs,
  georeference_verification_status, habitat, protocol_description, sample_size_value,
  sample_size_unit, event_effort, field_notes, event_remarks, a.location_id, 
  higher_geography_id, higher_geography, continent, water_body, island_group, island, 
  country, country_code, state_province, county, municipality, locality, 
  minimum_elevation_in_meters, maximum_elevation_in_meters, vertical_datum, 
  minimum_depth_in_meters, maximum_depth_in_meters, 
  minimum_distance_above_surface_in_meters, maximum_distance_above_surface_in_meters, 
  location_remarks, decimal_latitude, decimal_longitude, geodetic_datum, 
  coordinate_uncertainty_in_meters, coordinate_precision, point_radius_spatial_fit,
  footprint_wkt, footprint_srs, footprint_spatial_fit, georeferenced_by, 
  georeferenced_date, georeference_protocol, georeference_sources, georeference_remarks, 
  preferred_spatial_representation
  FROM event a
  JOIN temp_gathering_event b ON a.event_id=b.event_id;
-- n=21146 rows added
-- n=42292 rows
-- All Events Occurrence and MaterialGathering Events now included
-- Create the occurrence table.
-- All occurrence_status values are 'PRESENT' on input, which will map to default 
-- 'Present' if not included in SELECT.

INSERT INTO occurrence (
  occurrence_id,
  organism_quantity,
  organism_quantity_type,
  sex,
  life_stage,
  reproductive_condition,
  behavior,
  establishment_means,
  degree_of_establishment,
  pathway,
  occurrence_remarks,
  organism_id
)
SELECT
  occurrence_id,
  organism_quantity,
  organism_quantity_type,
  sex,
  life_stage,
  reproductive_condition,
  behavior,
  establishment_means,
  degree_of_establishment,
  pathway,
  occurrence_remarks,
  organism_id
FROM in_occurrence;
-- n=21146 rows

-- Create the identification table.
INSERT INTO identification (
  identification_id,
  identification_based_on_material_entity_id,
  identification_type,
  verbatim_identification,
  taxon_formula,
  type_status,
  type_designation_type,
  identified_by,
  identified_by_id,
  date_identified,
  identification_references,
  identification_verification_status,
  identification_remarks,
  taxon_id,
  kingdom,
  scientific_name,
  taxon_rank,
  taxon_remarks
)
SELECT
  a.identification_id,
  organism_id AS identification_based_on_material_entity_id,
  identification_type,
  verbatim_identification,
  taxon_formula,
  type_status,
  type_designation_type,
  identified_by,
  identified_by_id,
  date_identified,
  identification_references,
  identification_verification_status,
  identification_remarks,
  b.taxon_id,
  kingdom,
  scientific_name,
  taxon_rank,
  taxon_remarks
FROM in_identification a
JOIN in_taxon_identification b ON a.identification_id=b.identification_id
JOIN in_taxon c ON b.taxon_id=c.taxon_id;
-- n=21146 rows

-- Set the material_entity_type to match the preferred controlled vocabulary value.
UPDATE in_material_entity
SET material_entity_type = 'Organism'
WHERE material_entity_type = 'ORGANISM';

-- Create the material table.
INSERT INTO material (
  material_entity_id,
  material_entity_type,
  institution_id, 
  institution_code,
  owner_institution_code,
  collection_id,
  collection_code,
  catalog_number,
  other_catalog_numbers,
  record_number,
  preparations,
  disposition,
  associated_sequences,
  material_citation,
  gathering_event_id
)
SELECT
  material_entity_id,
  material_entity_type,
  institution_id,
  institution_code,
  owner_institution_code,
  collection_id,
  collection_code,
  catalog_number,
  other_catalog_numbers,
  record_number,
  preparations,
  dispositions AS disposition,
  associated_secuences AS associated_sequences,
  associated_references AS material_citation,
  gathering_event_id
FROM in_material_entity a
JOIN in_occurrence b on a.material_entity_id=b.organism_id
JOIN temp_gathering_event c ON b.occurrence_id=c.event_id;
-- n=21146 rows

UPDATE material
SET evidence_for_occurrence_id = i.occurrence_id
FROM in_occurrence_evidence i
WHERE material.material_entity_id = i.entity_id;
  
-- Set the assertion_target_type to match the COMMON_TARGETS ENUM value.
UPDATE in_assertion
SET assertion_target_type = 'Material Entity'
WHERE assertion_target_type = 'MATERIAL_ENTITY';

-- Create the assertion table.
INSERT INTO "assertion" (
  assertion_id,
  assertion_target_id,
  assertion_target_type,
  assertion_type,
  assertion_made_date,
  assertion_effective_date,
  assertion_value,
  assertion_value_numeric,
  assertion_unit,
  assertion_by, 
  assertion_by_id,
  assertion_protocol_id,
  assertion_protocol,
  assertion_remarks
)
SELECT
    assertion_id,
    assertion_target_id,
    assertion_target_type::COMMON_TARGETS,
    assertion_type,
    assertion_made_date,
    assertion_effective_date,
    assertion_value,
    assertion_value_numeric,
    assertion_unit,
    assertion_by_agent_name AS assertion_by,
    assertion_by_agent_id AS assertion_by_id,
    assertion_protocol_id,
    protocol_type AS assertion_protocol,
    assertion_remarks
FROM in_assertion a
LEFT JOIN in_protocol b ON a.assertion_protocol_id=b.protocol_id;
-- n=119686 rows

-- Set the citation_target_type to match the COMMON_TARGETS ENUM value.
UPDATE in_citation
SET citation_target_type = 'Protocol'
WHERE citation_target_type = 'PROTOCOL';

-- Create the citation table.
INSERT INTO citation (
  citation_id,
  citation_target_id,
  citation_target_type,
  citation_type,
  bibliographic_citation,
  page_number,
  reference_id,
  reference_type,
  reference_year,
  is_peer_reviewed,
  citation_remarks
)
SELECT
    gen_random_uuid() AS citation_id,
    citation_target_id,
    citation_target_type::COMMON_TARGETS,
    citation_type,
    bibliographic_citation,
    citation_page_number AS page_number,
    citation_reference_id AS reference_id,
    reference_type,
    reference_year,
    is_peer_reviewed,
    citation_remarks
FROM in_citation a
JOIN in_reference b ON a.citation_reference_id=b.reference_id;

-- Create the protocol table.
INSERT INTO protocol (
  protocol_id,
  protocol_description
)
SELECT
  protocol_id,
  protocol_type AS protocol_description
FROM in_protocol a;
