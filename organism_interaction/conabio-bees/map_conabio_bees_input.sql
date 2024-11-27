-- Start with the premise that the occurrenceID in ecoab_occurrences best represents a
-- materialEntityID, as it is constructed from a Darwin Core triplet.
-- Generate gathering Event eventIDs based on the MaterialEntities.
-- Fill the Material Table.
INSERT INTO material (
    material_entity_id,
    material_entity_type,
    institution_code,
    collection_code,
    catalog_number,
    other_catalog_numbers,
    material_gathering_id
)
(
SELECT 
    occurrenceID,
    'Organism' AS material_entity_type,
    'ECOSUR-SC' AS institution_code,
    collectionCode,
    catalogNumber,
    occurrenceID AS other_catalog_numbers,
    gen_random_uuid()::TEXT AS material_gathering_id
FROM ecoab_occurrences
);
-- n = 17265

-- Make MaterialGathering Events to match the material
INSERT INTO event (
    event_id, 
    event_class,
    event_type, 
    year, 
    month, 
    day, 
    location_id, 
    country, 
    state_province, 
    municipality, 
    locality, 
    decimal_latitude, 
    decimal_longitude, 
    minimum_elevation_in_meters, 
    event_conducted_by, 
    event_conducted_by_id, 
    event_date
)
(SELECT
    material_gathering_id AS event_id,
    'Material Gathering'::EVENT_CLASS AS event_class, 
    'Material Gathering' AS event_type, 
    year, 
    month, 
    day, 
    locationID, 
    country, 
    stateProvince, 
    municipality, 
    locality, 
    decimalLatitude, 
    decimalLongitude, 
    minimumElevationInMeters, 
    recordedBy, 
    recordedByID, 
    eventDate 
FROM ecoab_occurrences a
JOIN material b ON occurrenceID=material_entity_id
);
-- n = 17265

-- Create the MaterialGathering table
INSERT INTO material_gathering (
  material_gathering_id
)
SELECT
  material_gathering_id
  FROM material;
-- n=17265 rows added

-- Make the capitalization consistent on occurrenceID and resourceID in the 
-- ecoab_interaction_data table.
UPDATE ecoab_interaction_data
SET 
occurrenceID = UPPER(occurrenceID),
resourceID = UPPER(resourceID);
-- n = 17265

-- Make a temp_organism_interaction table with minted eventIDs for the 
-- OrganismInteractions, subject Occurrences, and object Occurrences
-- subject occurrenceIDs for the object Organisms.
SELECT 
    gen_random_uuid()::TEXT AS organism_interaction_id,
    occurrenceID AS subject_organism_id,
    gen_random_uuid()::TEXT AS subject_occurrence_id,
    relatedResourceID,
    gen_random_uuid()::TEXT AS object_occurrence_id,
    relationshipOfResource AS organism_interaction_type,
    relationshipOfResourceID AS organism_interaction_type_iri
INTO TABLE temp_organism_interaction
FROM ecoab_interaction_data;
-- n = 17265

-- Make OrganismInteraction Events
INSERT INTO event (
    event_id, 
    event_class,
    event_type, 
    year, 
    month, 
    day, 
    location_id, 
    country, 
    state_province, 
    municipality, 
    locality, 
    decimal_latitude, 
    decimal_longitude, 
    minimum_elevation_in_meters, 
    event_conducted_by, 
    event_conducted_by_id, 
    event_date
)
(SELECT
    organism_interaction_id AS event_id,
    'Organism Interaction'::EVENT_CLASS AS event_class, 
    'Organism Interaction' AS event_type, 
    year, 
    month, 
    day, 
    locationID, 
    country, 
    stateProvince, 
    municipality, 
    locality, 
    decimalLatitude, 
    decimalLongitude, 
    minimumElevationInMeters, 
    recordedBy, 
    recordedByID, 
    eventDate 
FROM ecoab_occurrences a
JOIN temp_organism_interaction b 
ON a.occurrenceID=b.subject_organism_id
);
-- n = 17265

-- Make Occurrence Events to match the subject Occurrences
INSERT INTO event (
    event_id, 
    event_class,
    event_type, 
    year, 
    month, 
    day, 
    location_id, 
    country, 
    state_province, 
    municipality, 
    locality, 
    decimal_latitude, 
    decimal_longitude, 
    minimum_elevation_in_meters, 
    event_conducted_by, 
    event_conducted_by_id, 
    event_date
)
(SELECT
    subject_occurrence_id AS event_id,
    'Occurrence'::EVENT_CLASS AS event_class, 
    'Occurrence' AS event_type, 
    year, 
    month, 
    day, 
    locationID, 
    country, 
    stateProvince, 
    municipality, 
    locality, 
    decimalLatitude, 
    decimalLongitude, 
    minimumElevationInMeters, 
    recordedBy, 
    recordedByID, 
    eventDate 
FROM ecoab_occurrences a
JOIN temp_organism_interaction b 
ON a.occurrenceID=b.subject_organism_id
);
-- n = 17265

-- Update Material Gathering Event parentEventIDs with the co-occurring occurrenceIDs
UPDATE material
SET evidence_for_occurrence_id = subject_occurrence_id
FROM temp_organism_interaction
WHERE material.material_entity_id = subject_organism_id;

-- Make Occurrence Events to match the object Occurrences
INSERT INTO event (
    event_id, 
    event_type, 
    year, 
    month, 
    day, 
    location_id, 
    country, 
    state_province, 
    municipality, 
    locality, 
    decimal_latitude, 
    decimal_longitude, 
    minimum_elevation_in_meters, 
    event_conducted_by, 
    event_conducted_by_id, 
    event_date
)
(SELECT
    object_occurrence_id AS event_id,
    'Occurrence' AS event_type, 
    year, 
    month, 
    day, 
    locationID, 
    country, 
    stateProvince, 
    municipality, 
    locality, 
    decimalLatitude, 
    decimalLongitude, 
    minimumElevationInMeters, 
    recordedBy, 
    recordedByID, 
    eventDate 
FROM ecoab_occurrences a
JOIN temp_organism_interaction b 
ON a.occurrenceID=b.subject_organism_id
);
-- n = 17265
-- All Events have now been made

-- Make Occurrences to match the subject Occurrences
INSERT INTO occurrence (
    occurrence_id,
    organism_quantity,
    organism_quantity_type,
    sex,
    occurrence_status,
    organism_id,
    organism_scope    
)
(SELECT
    subject_occurrence_id,
    '1',
    'Individuals',
    sex,
    'Present' AS occurrence_status,
    occurrenceID as organism_id,
    'Multicellular Organism'
FROM ecoab_occurrences a
JOIN temp_organism_interaction b
ON a.occurrenceID=b.subject_organism_id
);
-- n = 17265
-- Make Occurrences to match the object Occurrences
INSERT INTO occurrence (
    occurrence_id,
    organism_quantity,
    organism_quantity_type,
    occurrence_status,
    organism_scope    
)
(SELECT
    object_occurrence_id,
    '1',
    'Individuals',
    'Present' AS occurrence_status,
    'Multicellular Organism'
FROM ecoab_occurrences a
JOIN temp_organism_interaction b
ON a.occurrenceID=b.subject_organism_id
);
-- n = 17265
-- All Occurrences have now been made

-- Make OrganismInteractions
INSERT INTO organism_interaction (
    organism_interaction_id,
    subject_occurrence_id,
    organism_interaction_type,
    organism_interaction_type_iri,
    object_occurrence_id
)
(SELECT
    organism_interaction_id,
    subject_occurrence_id,
    organism_interaction_type,
    organism_interaction_type_iri,
    object_occurrence_id
FROM temp_organism_interaction
);
-- n = 17265

-- Make identification records for MaterialEntities.
INSERT INTO identification (
  identification_id,
  identification_based_on_material_entity_id,
  identification_type,
  verbatim_identification,
  is_accepted_identification,
  taxon_formula,
  identified_by,
  identified_by_id,
  kingdom,
  scientific_name,
  taxon_rank
)
(
SELECT
  gen_random_uuid()::TEXT AS identification_id,
  occurrenceID AS identification_based_on_material_entity_id,
  'Material Entity',
  verbatimScientificName AS verbatim_identification,
  TRUE,
  'A',
  identifiedBy,
  identifiedByID,
  kingdom,
  scientificName,
  taxonRank
FROM ecoab_occurrences a
JOIN ecoab_occurrence_taxa b
ON a.taxonID=b.taxonID
);
-- n = 17265

-- Make identification records for object Organisms.
INSERT INTO identification (
  identification_id,
  identification_based_on_occurrence_id,
  identification_type,
  verbatim_identification,
  is_accepted_identification,
  taxon_formula,
  kingdom,
  scientific_name,
  taxon_rank
)
(
SELECT
  gen_random_uuid()::TEXT AS identification_id,
  occurrenceID AS identification_based_on_occurrence_id,
  'Human Observation',
  verbatimScientificName AS verbatim_identification,
  TRUE,
  'A',
  kingdom,
  scientificName,
  taxonRank
FROM ecoab_interaction_data a
JOIN ecoab_occurrence_taxa b
ON a.relatedResourceID=b.taxonID
);
-- n = 17265
-- All Identifications have now been made
