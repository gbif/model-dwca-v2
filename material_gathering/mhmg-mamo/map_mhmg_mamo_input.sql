-- Create the Agent table
INSERT INTO agent (
  agent_id, 
  agent_type, 
  preferred_agent_name
)
SELECT
  agent_id, 
  agent_type, 
  preferred_agent_name
  FROM in_agent;
-- n=10 rows

-- Create the Collection table
INSERT INTO collection (
  collection_id, 
  collection_type, 
  collection_code, 
  institution_code, 
  institution_id
)
SELECT
  collection_id, 
  collection_type, 
  collection_code, 
  institution_code, 
  institution_id
  FROM in_collection;
-- n=1 rows

-- Create the Media table
INSERT INTO media (
  media_id, 
  media_target_id, 
  media_target_type, 
  media_type, 
  access_uri, 
  web_statement, 
  owner, 
  source, 
  creator, 
  media_language
)
SELECT
  media_id, 
  media_target_id, 
  media_target_type::COMMON_TARGETS, 
  media_type, 
  access_uri, 
  web_statement, 
  owner, 
  source, 
  creator, 
  media_language
  FROM in_media;
-- n=8 rows

-- Create Occurrence/MaterialGathering lookup table
SELECT 
occurrence_id,
organism_id,
gen_random_uuid() AS material_gathering_id
INTO TABLE temp_gathering_event
FROM in_occurrence;

-- Create the event table from the input Events.
INSERT INTO event (
  event_id, 
  event_class, 
  event_type, 
  event_date, 
  year, 
  month, 
  day, 
  verbatim_locality, 
  verbatim_latitude, 
  verbatim_longitude, 
  decimal_latitude, 
  decimal_longitude
)
SELECT 
  event_id, 
  'Occurrence', 
  event_type, 
  event_date,  
  NULLIF(year, '')::smallint, 
  NULLIF(month, '')::smallint, 
  NULLIF(day, '')::smallint, 
  verbatim_locality, 
  verbatim_latitude, 
  verbatim_longitude, 
  NULLIF(decimal_latitude, '')::numeric, 
  NULLIF(decimal_longitude, '')::numeric
  FROM in_event a;
-- n=9 rows
 
-- The event table now has Occurrences, but needs separate GatheringEvents for the 
-- material records.
INSERT INTO event (
  event_id, 
  event_class, 
  event_type, 
  event_date, 
  year, 
  month, 
  day, 
  verbatim_locality, 
  verbatim_latitude, 
  verbatim_longitude, 
  decimal_latitude, 
  decimal_longitude
)
SELECT 
  material_gathering_id, 
  'Material Gathering', 
  'Material Gathering', 
  event_date,  
  NULLIF(year, '')::smallint, 
  NULLIF(month, '')::smallint, 
  NULLIF(day, '')::smallint, 
  verbatim_locality, 
  verbatim_latitude, 
  verbatim_longitude, 
  NULLIF(decimal_latitude, '')::numeric, 
  NULLIF(decimal_longitude, '')::numeric
FROM in_event a 
JOIN temp_gathering_event b ON a.event_id=b.occurrence_id;
-- n=9 rows added
-- n=18 rows total

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
  occurrence_status,
  organism_id
)
SELECT
  occurrence_id,
  organism_quantity,
  organism_quantity_type,
  sex,
  life_stage,
  occurrence_status::OCCURRENCE_STATUS,
  organism_id
FROM in_occurrence;
-- n=9 rows

-- Create the material_gathering table.
INSERT INTO material_gathering (
  material_gathering_id
)
SELECT
  event_id
  FROM event
  WHERE event_class='Material Gathering';
-- n=9 rows

-- Create the identification table.
INSERT INTO identification (
  identification_id,
  identification_based_on_material_entity_id,
  identification_type,
  taxon_formula,
  type_status,
  identified_by,
  identified_by_id,
  identification_remarks,
  verbatim_identification,
  taxon_id,
  kingdom,
  scientific_name,
  taxon_rank
)
SELECT
  identification_id,
  identification_based_on_material_entity_id,
  identification_type,
  taxon_formula,
  type_status,
  identified_by,
  identified_by_id,
  identification_remarks,
  verbatim_identification,
  taxon_id,
  kingdom,
  scientific_name,
  taxon_rank
FROM in_identification;
-- n=10 rows

-- Create the material table.
INSERT INTO material (
  material_entity_id,
  material_entity_type,
  institution_code,
  institution_id, 
  owner_institution_code,
  collection_code,
  collection_id,
  catalog_number,
  other_catalog_numbers,
  preparations,
  associated_sequences,
  material_citation,
  derived_from_material_entity_id,
  derivation_type,
  part_of_material_entity_id
)
SELECT
  material_entity_id,
  material_entity_type,
  institution_code,
  institution_id,
  owner_institution_code,
  collection_code,
  collection_id,
  catalog_number,
  other_catalog_numbers,
  preparations,
  associated_sequences,
  material_citation,
  derived_from_material_entity_id,
  derivation_type,
  part_of_material_entity_id
FROM in_material a;
-- n=29 rows

-- Set the material_gathering_id for material with Occurrences.
UPDATE material 
SET 
  material_gathering_id = b.material_gathering_id
FROM 
  temp_gathering_event b
WHERE 
  material.material_entity_id = b.organism_id;

-- Set the material_gathering_id for material derived from Organisms.
UPDATE material 
SET 
  material_gathering_id = b.material_gathering_id
FROM 
  material b
WHERE 
  material.derived_from_material_entity_id = b.material_entity_id;
  
-- Set the material_gathering_id for material that is part of an Organism.
UPDATE material 
SET 
  material_gathering_id = b.material_gathering_id
FROM 
  material b
WHERE 
  material.part_of_material_entity_id = b.material_entity_id;

-- Set the evidence_for_occurrence_id for material with Occurrences.
UPDATE material 
SET 
  evidence_for_occurrence_id = b.occurrence_id
FROM 
  temp_gathering_event b
WHERE 
  material.material_entity_id = b.organism_id;

-- Set the evidence_for_occurrence_id for material derived from Organisms.
UPDATE material 
SET 
  evidence_for_occurrence_id = b.evidence_for_occurrence_id
FROM 
  material b
WHERE 
  material.derived_from_material_entity_id = b.material_entity_id;
  
-- Set the evidence_for_occurrence_id for material that is part of an Organism.
UPDATE material 
SET 
  evidence_for_occurrence_id = b.evidence_for_occurrence_id
FROM 
  material b
WHERE 
  material.part_of_material_entity_id = b.material_entity_id;


-- Create the GeneticSequence table
INSERT INTO genetic_sequence (
  genetic_sequence_id, 
  material_gathering_id,
  derived_from_material_entity_id, 
  genetic_sequence_type, 
  genetic_sequence, 
  genetic_sequence_citation
)
SELECT
  genetic_sequence_id, 
  a.material_gathering_id,
  a.derived_from_material_entity_id, 
  genetic_sequence_type, 
  genetic_sequence, 
  genetic_sequence_citation
  FROM material a 
  JOIN in_genetic_sequence b ON a.material_entity_id = b.derived_from_material_entity_id;
-- n=10 rows

-- Create the assertion table.
INSERT INTO "assertion" (
  assertion_id,
  assertion_target_id,
  assertion_target_type,
  assertion_type,
  assertion_made_date,
  assertion_value,
  assertion_value_numeric,
  assertion_unit,
  assertion_by, 
  assertion_by_id
)
SELECT
    assertion_id,
    assertion_target_id,
    assertion_target_type::COMMON_TARGETS,
    assertion_type,
    assertion_made_date,
    assertion_value,
    NULLIF(assertion_value_numeric, '')::numeric,
    assertion_unit,
    assertion_by,
    NULLIF(assertion_by_id, '')
FROM in_assertion;
-- n=60 rows

-- Create the citation table.
INSERT INTO citation (
  citation_id,
  citation_target_id,
  citation_target_type,
  citation_type,
  bibliographic_citation,
  reference_id,
  reference_type,
  reference_year,
  is_peer_reviewed
)
SELECT
    gen_random_uuid() AS citation_id,
    citation_target_id,
    citation_target_type::COMMON_TARGETS,
    citation_type,
    bibliographic_citation,
    reference_id,
    reference_type,
    reference_year,
    is_peer_reviewed
FROM in_citation;
-- n=14 rows

-- Create the Identifier table
INSERT INTO identifier (
  identifier, 
  identifier_target_id, 
  identifier_target_type, 
  identifier_type
)
SELECT
  identifier, 
  identifier_target_id, 
  identifier_target_type::COMMON_TARGETS, 
  identifier_type
  FROM in_identifier;
-- n=8 rows
