-- Create the event table from the parentmost Event (project) first.
INSERT INTO event (
  event_id,
  parent_event_id,
  preferred_event_name,
  event_class,
  event_type,
  event_type_iri,
  event_type_vocabulary,
  field_number,
  event_conducted_by,
  event_conducted_by_id,
  event_date,
  event_time,
  start_day_of_year,
  end_day_of_year,
  year,
  month,
  day,
  verbatim_event_date,
  verbatim_locality,
  verbatim_elevation,
  verbatim_depth,
  verbatim_coordinates,
  verbatim_latitude,
  verbatim_longitude,
  verbatim_coordinate_system,
  verbatim_srs,
  georeference_verification_status,
  habitat,
  sample_size_value,
  sample_size_unit,
  event_effort,
  field_notes,
  event_citation,
  event_remarks,
  protocol_id,
  protocol_name,
  protocol_description,
  protocol_citation,
  protocol_remarks,
  location_id,
  higher_geography_id,
  higher_geography,
  continent,
  water_body,
  island_group,
  island,
  country,
  country_code,
  state_province,
  county,
  municipality,
  locality,
  minimum_elevation_in_meters,
  maximum_elevation_in_meters,
  vertical_datum,
  minimum_depth_in_meters,
  maximum_depth_in_meters,
  minimum_distance_above_surface_in_meters,
  maximum_distance_above_surface_in_meters,
  location_remarks,
  decimal_latitude,
  decimal_longitude,
  geodetic_datum,
  coordinate_uncertainty_in_meters,
  coordinate_precision,
  point_radius_spatial_fit,
  footprint_wkt,
  footprint_srs,
  footprint_spatial_fit,
  georeferenced_by,
  georeferenced_by_id,
  georeferenced_date,
  georeference_protocol_id,
  georeference_protocol,
  georeference_sources,
  georeference_remarks,
  preferred_spatial_representation
)
SELECT 
  'NEON_fish' AS eventID, 
  NULL AS parentEventID,
  NULL AS preferredEventName,
  'Event'::EVENT_CLASS AS event_class, 
  'Project' AS eventType, 
  NULL AS eventTypeIRI,
  NULL AS eventTypeVocabulary,
  NULL AS fieldNumber,
  NULL AS eventConductedBy,
  NULL AS eventConductedID,
  '2019-07-01/2024-09-26' AS eventDate,  
  NULL AS eventTime,
  NULL AS startDayOfYear,
  NULL AS endDayOfYear,
  NULL AS year, 
  NULL AS month,
  NULL AS day,
  NULL AS verbatimEventDate,
  NULL AS verbatimLocality,
  NULL AS verbatimElevation,
  NULL AS verbatimDepth,
  NULL AS verbatimCoordinates,
  NULL AS verbatimLatitude,
  NULL AS verbatimLongitude,
  NULL AS verbatimCoordinateSystem,
  NULL AS verbatimSRS,
  NULL AS georeferenceVerificationStatus,
  NULL AS habitat,
  NULL AS sampleSizeValue,
  NULL AS sampleSizeUnit,
  NULL AS eventEffort,
  NULL AS fieldNotes,
  NULL AS eventCitation,
  NULL AS eventRemarks,
  NULL AS protocolID,
  NULL AS protocolName,
  NULL AS protocolDescription,
  NULL AS protocolCitation,
  NULL AS protocolRemarks,
  'BIGC' AS locationID,
  NULL AS higherGeographyID,
  NULL AS higherGeography,
  'North America' AS continent,
  NULL AS waterBody,
  NULL AS islandGroup,
  NULL AS island,
  'United States' AS country,
  'US' AS countryCode,
  NULL AS stateProvince,
  NULL AS county,
  NULL AS municipality,
  NULL AS locality,
  NULL AS minimumElevationInMeters,
  NULL AS maximumElevationInMeters,
  NULL AS verticalDatum,
  NULL AS minimumDepthInMeters,
  NULL AS maximumDepthInMeters,
  NULL AS minimumDistanceAboveSurfaceInMeters,
  NULL AS maximumDistanceAboveSurfaceInMeters,
  NULL AS locationRemarks,
  NULL AS decimalLatitude,
  NULL AS decimalLongitude,
  NULL AS geodeticDatum,
  NULL AS coordinateUncertaintyInMeters,
  NULL AS coordinatePrecision,
  NULL AS pointRadiusSpatialFit,
  NULL AS footprintWKT,
  NULL AS footprintSRS,
  NULL AS footprintSpatialFit,
  NULL AS georeferencedBy,
  NULL AS georeferencedByID,
  NULL AS georeferencedDate,
  NULL AS georeferenceProtocolID,
  NULL AS georeferenceProtocol,
  NULL AS georeferenceSources,
  NULL AS georeferenceRemarks,
  NULL AS preferredSpatialRepresentation;
-- n=1 rows added
-- n=1 rows total

-- Now add the child Site Event.
INSERT INTO event (
  event_id,
  parent_event_id,
  preferred_event_name,
  event_class,
  event_type,
  event_type_iri,
  event_type_vocabulary,
  field_number,
  event_conducted_by,
  event_conducted_by_id,
  event_date,
  event_time,
  start_day_of_year,
  end_day_of_year,
  year,
  month,
  day,
  verbatim_event_date,
  verbatim_locality,
  verbatim_elevation,
  verbatim_depth,
  verbatim_coordinates,
  verbatim_latitude,
  verbatim_longitude,
  verbatim_coordinate_system,
  verbatim_srs,
  georeference_verification_status,
  habitat,
  sample_size_value,
  sample_size_unit,
  event_effort,
  field_notes,
  event_citation,
  event_remarks,
  protocol_id,
  protocol_name,
  protocol_description,
  protocol_citation,
  protocol_remarks,
  location_id,
  higher_geography_id,
  higher_geography,
  continent,
  water_body,
  island_group,
  island,
  country,
  country_code,
  state_province,
  county,
  municipality,
  locality,
  minimum_elevation_in_meters,
  maximum_elevation_in_meters,
  vertical_datum,
  minimum_depth_in_meters,
  maximum_depth_in_meters,
  minimum_distance_above_surface_in_meters,
  maximum_distance_above_surface_in_meters,
  location_remarks,
  decimal_latitude,
  decimal_longitude,
  geodetic_datum,
  coordinate_uncertainty_in_meters,
  coordinate_precision,
  point_radius_spatial_fit,
  footprint_wkt,
  footprint_srs,
  footprint_spatial_fit,
  georeferenced_by,
  georeferenced_by_id,
  georeferenced_date,
  georeference_protocol_id,
  georeference_protocol,
  georeference_sources,
  georeference_remarks,
  preferred_spatial_representation
)
SELECT 
  'BIGC' AS eventID, 
  'NEON_fish' AS parentEventID,
  NULL AS preferredEventName,
  'Event'::EVENT_CLASS AS event_class, 
  'Site' AS eventType, 
  NULL AS eventTypeIRI,
  NULL AS eventTypeVocabulary,
  NULL AS fieldNumber,
  NULL AS eventConductedBy,
  NULL AS eventConductedID,
  '2019-04-22/2019-10-24' AS eventDate,  
  NULL AS eventTime,
  NULL AS startDayOfYear,
  NULL AS endDayOfYear,
  2019 AS year, 
  NULL AS month,
  NULL AS day,
  NULL AS verbatimEventDate,
  NULL AS verbatimLocality,
  NULL AS verbatimElevation,
  NULL AS verbatimDepth,
  NULL AS verbatimCoordinates,
  NULL AS verbatimLatitude,
  NULL AS verbatimLongitude,
  NULL AS verbatimCoordinateSystem,
  NULL AS verbatimSRS,
  NULL AS georeferenceVerificationStatus,
  'Aquatic Wadeable Stream' AS habitat,
  NULL AS sampleSizeValue,
  NULL AS sampleSizeUnit,
  NULL AS eventEffort,
  NULL AS fieldNotes,
  NULL AS eventCitation,
  NULL AS eventRemarks,
  NULL AS protocolID,
  NULL AS protocolName,
  NULL AS protocolDescription,
  NULL AS protocolCitation,
  NULL AS protocolRemarks,
  'BIGC' AS locationID,
  NULL AS higherGeographyID,
  NULL AS higherGeography,
  'North America' AS continent,
  'Upper Big Creek' AS waterBody,
  NULL AS islandGroup,
  NULL AS island,
  'United States' AS country,
  'US' AS countryCode,
  'California' AS stateProvince,
  'Fresno' AS county,
  NULL AS municipality,
  'Pacific Southwest (D17), Upper Big Creek NEON (BIGC)' AS locality,
  1003 AS minimumElevationInMeters,
  1700 AS maximumElevationInMeters,
  NULL AS verticalDatum,
  NULL AS minimumDepthInMeters,
  NULL AS maximumDepthInMeters,
  NULL AS minimumDistanceAboveSurfaceInMeters,
  NULL AS maximumDistanceAboveSurfaceInMeters,
  NULL AS locationRemarks,
  37.059719 AS decimalLatitude,
  -119.257549 AS decimalLongitude,
  'WGS84' AS geodeticDatum,
  1000 AS coordinateUncertaintyInMeters,
  0.000001 AS coordinatePrecision,
  NULL AS pointRadiusSpatialFit,
  NULL AS footprintWKT,
  NULL AS footprintSRS,
  NULL AS footprintSpatialFit,
  NULL AS georeferencedBy,
  NULL AS georeferencedByID,
  NULL AS georeferencedDate,
  NULL AS georeferenceProtocolID,
  NULL AS georeferenceProtocol,
  NULL AS georeferenceSources,
  NULL AS georeferenceRemarks,
  'point-radius' AS preferredSpatialRepresentation;
-- n=1 rows added
-- n=2 rows total

-- Create the child Reach Events.
INSERT INTO event (
  event_id, 
  parent_event_id,
  event_class, 
  event_type, 
  event_date, 
  year, 
  habitat,
  location_id,
  continent,
  water_body,
  country,
  country_code,
  state_province,
  county,
  locality,
  minimum_elevation_in_meters,
  maximum_elevation_in_meters,
  decimal_latitude, 
  decimal_longitude,
  geodetic_datum,
  coordinate_uncertainty_in_meters
)
SELECT DISTINCT
  namedLocation AS event_id, 
  'BIGC' AS parent_event_id,
  'Event'::EVENT_CLASS AS event_class, 
  'Reach' AS event_type, 
  '2019-04-22/2019-10-24' AS eventDate,  
  2019 AS year, 
  'stream' AS habitat,
  namedLocation AS location_id,
  'North America' AS continent,
  'Upper Big Creek' AS water_body,
  'United States' AS country,
  'US' AS country_code,
  'California' AS state_province,
  'Fresno' AS county,
  'Pacific Southwest (D17), Upper Big Creek NEON (BIGC)' AS locality,
  elevation::numeric-elevationUncertainty::numeric AS minimum_elevation_in_meters,
  elevation::numeric+elevationUncertainty::numeric AS maximum_elevation_in_meters,
  NULLIF(decimalLatitude, '')::numeric AS decimal_latitude, 
  NULLIF(decimalLongitude, '')::numeric AS decimal_longitude,
  geodeticDatum AS geodetic_datum,
  coordinateUncertainty::numeric AS coordinate_uncertainty_in_meters
  FROM fsh_fieldData;
-- n=6 rows added
-- n=8 rows total

-- Create a concatenation of CollectedBy fields for each reachID
CREATE TABLE temp_reach_collectors AS
SELECT 
    reachID,
    STRING_AGG(trimmed_collected_by, ' | ') AS collectors
FROM (
    SELECT 
        reachID,
        CASE WHEN aCollectedBy = 'NA' THEN '' ELSE aCollectedBy END AS trimmed_collected_by
    FROM fsh_fieldData
    UNION ALL
    SELECT 
        reachID,
        CASE WHEN bCollectedBy = 'NA' THEN '' ELSE bCollectedBy END
    FROM fsh_fieldData
    UNION ALL
    SELECT 
        reachID,
        CASE WHEN cCollectedBy = 'NA' THEN '' ELSE cCollectedBy END
    FROM fsh_fieldData
) AS collected_values
WHERE trimmed_collected_by != ''
GROUP BY reachID;
-- n=12 rows added
-- n=12 rows total

-- Create the Reach Sampling Events.
INSERT INTO event (
  event_id, 
  parent_event_id,
  event_class, 
  event_type, 
  event_conducted_by,
  event_date, 
  year, 
  habitat,
  event_remarks,
  protocol_id,
  protocol_name,
  location_id,
  continent,
  water_body,
  country,
  country_code,
  state_province,
  county,
  locality,
  minimum_elevation_in_meters,
  maximum_elevation_in_meters,
  decimal_latitude, 
  decimal_longitude,
  geodetic_datum,
  coordinate_uncertainty_in_meters
)
SELECT 
  a.reachID AS event_id, 
  namedLocation AS parent_event_id,
  'Event'::EVENT_CLASS AS event_class, 
  'Reach Sampling' AS event_type, 
  collectors AS event_conducted_by,
  startDate || '/' || EndDate AS event_date,  
  SUBSTRING(startDate FROM 1 FOR 4)::smallint AS year, 
  CASE 
    WHEN reachCondition = 'NA' THEN aquaticSiteType 
    ELSE aquaticSiteType || ', ' || reachCondition 
  END AS habitat,
  CASE 
    WHEN remarks = 'NA' THEN NULL 
    ELSE remarks 
  END AS event_remarks,
  samplingProtocolVersion AS protocol_id,
  samplingProtocolVersion AS protocol_name,
  namedLocation AS location_id,
  'North America' AS continent,
  'Upper Big Creek' AS water_body,
  'United States' AS country,
  'US' AS country_code,
  'California' AS state_province,
  'Fresno' AS county,
  'Pacific Southwest (D17), Upper Big Creek NEON (BIGC)' || ', ' || namedLocation AS locality,
  elevation::numeric-elevationUncertainty::numeric AS minimum_elevation_in_meters,
  elevation::numeric+elevationUncertainty::numeric AS maximum_elevation_in_meters,
  NULLIF(decimalLatitude, '')::numeric AS decimal_latitude, 
  NULLIF(decimalLongitude, '')::numeric AS decimal_longitude,
  geodeticDatum AS geodetic_datum,
  coordinateUncertainty::numeric AS coordinate_uncertainty_in_meters
  FROM fsh_fieldData a
  JOIN temp_reach_collectors b ON a.reachID=b.reachID;
-- n=12 rows added
-- n=20 rows total

-- Create the Pass Sampling Events.
INSERT INTO event (
  event_id, 
  parent_event_id,
  event_class, 
  event_type, 
  event_conducted_by,
  event_date, 
  year, 
  month, 
  day, 
  habitat,
  event_remarks,
  location_id,
  continent,
  water_body,
  country,
  country_code,
  state_province,
  county,
  locality,
  minimum_elevation_in_meters,
  maximum_elevation_in_meters,
  decimal_latitude, 
  decimal_longitude,
  geodetic_datum,
  coordinate_uncertainty_in_meters
)
SELECT 
  a.eventID AS event_id, 
  a.reachID AS parent_event_id,
  'Event'::EVENT_CLASS AS event_class, 
  'Pass Sampling' AS event_type, 
  c.collectors AS event_conducted_by,
  REPLACE(a.passStartTime, ' ', 'T') || '/' || 
    REPLACE(a.passEndTime, ' ', 'T') AS event_date,  
  SUBSTRING(a.passStartTime FROM 1 FOR 4)::smallint AS year, 
  SUBSTRING(a.passStartTime FROM 6 FOR 2)::smallint AS month, 
  SUBSTRING(a.passStartTime FROM 9 FOR 2)::smallint AS day, 
  'Habitat: ' || habitatType || ' Subdominant Habitat: ' || subdominantHabitatType AS habitat,
  CASE 
    WHEN a.remarks = 'NA' THEN NULL 
    ELSE a.remarks 
  END AS event_remarks,  
  a.namedLocation AS locationID,
  'North America' AS continent,
  'Upper Big Creek' AS water_body,
  'United States' AS country,
  'US' AS country_code,
  'California' AS state_province,
  'Fresno' AS county,
  'Pacific Southwest (D17), Upper Big Creek NEON (BIGC)' || ', ' || a.namedLocation AS locality,
  b.elevation::numeric-b.elevationUncertainty::numeric AS minimum_elevation_in_meters,
  b.elevation::numeric+b.elevationUncertainty::numeric AS maximum_elevation_in_meters,
  NULLIF(b.decimalLatitude, '')::numeric AS decimal_latitude, 
  NULLIF(b.decimalLongitude, '')::numeric AS decimal_longitude,
  geodeticDatum AS geodetic_datum,
  coordinateUncertainty::numeric AS coordinate_uncertainty_in_meters
  FROM fsh_perPass a
  JOIN fsh_fieldData b on a.reachID=b.reachID
  JOIN temp_reach_collectors c ON a.reachID=c.reachID;
-- n=24 rows added
-- n=44 rows total

-- Create year, month, day records for perFish Occurrences.
CREATE TABLE temp_ymd AS
SELECT 
    uid,
    CASE 
        WHEN SUBSTRING(passStartTime FROM 1 FOR 4) = SUBSTRING(passEndTime FROM 1 FOR 4) 
        THEN SUBSTRING(passStartTime FROM 1 FOR 4)::smallint
        ELSE NULL
    END AS year,
    CASE 
        WHEN SUBSTRING(passStartTime FROM 6 FOR 2) = SUBSTRING(passEndTime FROM 6 FOR 2) 
        THEN SUBSTRING(passStartTime FROM 6 FOR 2)::smallint
        ELSE NULL
    END AS month,
    CASE 
        WHEN SUBSTRING(passStartTime FROM 9 FOR 2) = SUBSTRING(passEndTime FROM 9 FOR 2) 
        THEN SUBSTRING(passStartTime FROM 9 FOR 2)::smallint
        ELSE NULL
    END AS day
FROM fsh_perFish;
-- n=672 rows added
-- n=672 rows total

-- Create year, month, day records for bulkCount Occurrences.
CREATE TABLE temp_bulk_ymd AS
SELECT 
    uid,
    CASE 
        WHEN SUBSTRING(passStartTime FROM 1 FOR 4) = SUBSTRING(passEndTime FROM 1 FOR 4) 
        THEN SUBSTRING(passStartTime FROM 1 FOR 4)::smallint
        ELSE NULL
    END AS year,
    CASE 
        WHEN SUBSTRING(passStartTime FROM 6 FOR 2) = SUBSTRING(passEndTime FROM 6 FOR 2) 
        THEN SUBSTRING(passStartTime FROM 6 FOR 2)::smallint
        ELSE NULL
    END AS month,
    CASE 
        WHEN SUBSTRING(passStartTime FROM 9 FOR 2) = SUBSTRING(passEndTime FROM 9 FOR 2) 
        THEN SUBSTRING(passStartTime FROM 9 FOR 2)::smallint
        ELSE NULL
    END AS day
FROM fsh_bulkCount;
-- n=4 rows added
-- n=4 rows total

-- Create the perFish Occurrence Event records.
INSERT INTO event (
  event_id,
  parent_event_id,
  event_class,
  event_type,
  event_type_iri,
  event_conducted_by,
  event_date,
  year,
  month,
  day, 
  habitat,
  event_remarks,
  location_id,
  continent,
  water_body,
  country,
  country_code,
  state_province,
  county,
  locality,
  minimum_elevation_in_meters,
  maximum_elevation_in_meters,
  decimal_latitude,
  decimal_longitude,
  geodetic_datum,
  coordinate_uncertainty_in_meters
)
SELECT
  a.uid AS event_id,
  a.eventID AS parent_event_id,
  'Occurrence'::EVENT_CLASS AS event_class,
  'Occurrence' AS event_type,
  'http://rs.tdwg.org/dwc/terms/Occurrence' AS event_type_iri,
  b.event_conducted_by,
  REPLACE(a.passStartTime, ' ', 'T') || '/' || 
    REPLACE(a.passEndTime, ' ', 'T') AS event_date,  
  c.year, 
  c.month,
  c.day,
  b.habitat,
  CASE 
    WHEN a.remarks = 'NA' THEN NULL 
    ELSE a.remarks 
  END AS event_remarks,  
  b.location_id,
  b.continent,
  b.water_body,
  b.country,
  b.country_code,
  b.state_province,
  b.county,
  b.locality,
  b.minimum_elevation_in_meters,
  b.maximum_elevation_in_meters,
  b.decimal_latitude, 
  b.decimal_longitude,
  b.geodetic_datum,
  b.coordinate_uncertainty_in_meters  
FROM fsh_perFish a
JOIN event b ON a.eventID=b.event_id
JOIN temp_ymd c ON a.uid=c.uid;
-- n=672 rows added
-- n=716 rows total

-- Create the bulkCount Occurrence Event records.
INSERT INTO event (
  event_id,
  parent_event_id,
  event_class,
  event_type,
  event_type_iri,
  event_conducted_by,
  event_date,
  year,
  month,
  day, 
  habitat,
  event_remarks,
  location_id,
  continent,
  water_body,
  country,
  country_code,
  state_province,
  county,
  locality,
  minimum_elevation_in_meters,
  maximum_elevation_in_meters,
  decimal_latitude,
  decimal_longitude,
  geodetic_datum,
  coordinate_uncertainty_in_meters
)
SELECT
  a.uid AS event_id,
  a.eventID AS parent_event_id,
  'Occurrence'::EVENT_CLASS AS event_class,
  'Occurrence' AS event_type,
  'http://rs.tdwg.org/dwc/terms/Occurrence' AS event_type_iri,
  b.event_conducted_by,
  REPLACE(a.passStartTime, ' ', 'T') || '/' || 
    REPLACE(a.passEndTime, ' ', 'T') AS event_date,  
  c.year, 
  c.month,
  c.day,
  b.habitat,
  CASE 
    WHEN a.remarks = 'NA' THEN NULL 
    ELSE a.remarks 
  END AS event_remarks,  
  b.location_id,
  b.continent,
  b.water_body,
  b.country,
  b.country_code,
  b.state_province,
  b.county,
  b.locality,
  b.minimum_elevation_in_meters,
  b.maximum_elevation_in_meters,
  b.decimal_latitude, 
  b.decimal_longitude,
  b.geodetic_datum,
  b.coordinate_uncertainty_in_meters  
FROM fsh_bulkCount a
JOIN event b ON a.eventID=b.event_id
JOIN temp_bulk_ymd c ON a.uid=c.uid;
-- n=4 rows added
-- n=720 rows total

-- The event table now has Occurrences, but needs separate MaterialGathering Events. 
-- CREATE the temp_gathering_event table to hold the parent_event_id associated with the 
-- material_gathering_id.
SELECT 
  eventid AS parent_event_id,
  uid AS occurrence_id,
  gen_random_uuid() AS material_gathering_id,
  vouchersampleID,
  CASE 
    WHEN dnaSampleID = 'NA' THEN NULL 
    ELSE dnaSampleID
  END AS dnaSampleID
INTO TABLE temp_gathering_event
FROM fsh_perFish
WHERE voucherSampleID<>'NA';
-- n=18 rows added
-- n=18 rows total

-- Add MaterialGathering Events to event.
INSERT INTO event (
  event_id,
  parent_event_id,
  event_class,
  event_type,
  event_conducted_by,
  event_date,
  year,
  month,
  day, 
  habitat,
  event_remarks,
  location_id,
  continent,
  water_body,
  country,
  country_code,
  state_province,
  county,
  locality,
  minimum_elevation_in_meters,
  maximum_elevation_in_meters,
  decimal_latitude,
  decimal_longitude,
  geodetic_datum,
  coordinate_uncertainty_in_meters
)
SELECT
  material_gathering_id AS event_id,
  b.parent_event_id as parent_event_id,
  'Material Gathering'::EVENT_CLASS AS event_class,
  'Material Gathering' AS event_type,
  event_conducted_by,
  event_date,
  year,
  month,
  day, 
  habitat,
  event_remarks,
  location_id,
  continent,
  water_body,
  country,
  country_code,
  state_province,
  county,
  locality,
  minimum_elevation_in_meters,
  maximum_elevation_in_meters,
  decimal_latitude,
  decimal_longitude,
  geodetic_datum,
  coordinate_uncertainty_in_meters
FROM event a
JOIN temp_gathering_event b on a.event_id=b.parent_event_id;
-- n=18 rows added
-- n=738 rows total

-- select a.event_id, a.parent_event_id, a.event_type, b.event_type as parent_event_type from event a JOIN event b ON a.parent_event_id=b.event_id where a.event_type='Material Gathering';

-- All perFish and bulkCount Occurrences plus MaterialGathering Events have now been included

-- Create the occurrence table from perFish records.
INSERT INTO occurrence (
  occurrence_id,
  organism_quantity,
  organism_quantity_type,
  life_stage
)
SELECT
  uid AS occurrence_id,
  1 AS organism_quantity,
  'individuals' AS organism_quantity_type,
  fishLifeStage AS life_stage
FROM fsh_perFish;
-- n=672 rows
-- n=672 rows total

-- Add to the occurrence table from bulkCount records.
INSERT INTO occurrence (
  occurrence_id,
  organism_quantity,
  organism_quantity_type,
  occurrence_remarks
)
SELECT
  uid AS occurrence_id,
  bulkFishCount AS organism_quantity,
  'individuals' AS organism_quantity_type,
  actualOrEstimated || ' count'
FROM fsh_bulkCount;
-- n=4 rows
-- n=676 rows total

-- All Occurrence records have now been added.

-- Create the material_gathering table.
INSERT INTO material_gathering (
  material_gathering_id
)
SELECT
  event_id
FROM event
WHERE event_class='Material Gathering';
-- n=18 rows
-- n=18 rows total

-- All MaterialGathering records have now been added.

-- Create the material table using the vouchers.
INSERT INTO material (
  material_entity_id,
  material_entity_type,
  institution_code,
  owner_institution_code,
  collection_code,
  catalog_number,
  preparations,
  material_gathering_id,
  evidence_for_occurrence_id,
  derived_from_material_entity_id,
  derivation_type,
  part_of_material_entity_id
)
SELECT
  a.voucherSampleID AS material_entity_id,
  'Organism' AS material_entity_type,
  'NEON' AS institution_code,
  'NEON' AS owner_institution_code,
  'FSH' AS collection_code,
  a.voucherSampleID AS catalog_number,
  sampleTypeCollected AS preparations,
  c.material_gathering_id,
  c.occurrence_id AS evidence_for_occurrence_id,
  NULL AS derived_from_material_entity_id,
  NULL AS derivation_type,
  NULL AS part_of_material_entity_id
FROM fsh_perFish a
JOIN event b ON a.eventid=b.event_id
JOIN temp_gathering_event c ON a.voucherSampleID=c.voucherSampleID
WHERE a.voucherSampleID <> 'NA';
-- n=18 rows
-- n=18 rows total

-- Add the DNA samples to the material table.
INSERT INTO material (
  material_entity_id,
  material_entity_type,
  institution_code,
  owner_institution_code,
  collection_code,
  catalog_number,
  preparations,
  material_gathering_id,
  evidence_for_occurrence_id,
  derived_from_material_entity_id,
  derivation_type
)
SELECT
  dnaSampleID AS material_entity_id,
  'DNA' AS material_entity_type,
  'NEON' AS institution_code,
  'NEON' AS owner_institution_code,
  'FSH' AS collection_code,
  dnaSampleID AS catalog_number,
  'DNA sample' AS preparations,
  material_gathering_id,
  occurrence_id AS evidence_for_occurrence_id,
  voucherSampleID AS derived_from_material_entity_id,
  'DNA extraction' AS derivation_type
FROM temp_gathering_event
WHERE dnaSampleID IS NOT NULL;
-- n=18 rows
-- n=29 rows total

-- All vouchers and DNA samples have now been added to the material table.

-- Create the identification table from occurrences without associated material.
INSERT INTO identification (
  identification_id,
  identification_based_on_occurrence_id,
  identification_type,
  is_accepted_identification,
  taxon_formula,
  identified_by_id,
  taxon_id,
  kingdom,
  scientific_name,
  taxon_rank
)
SELECT
  gen_random_uuid() AS identification_id,
  a.occurrence_id AS identification_based_on_occurrence_id,
  'Observation' AS identification_type,
  TRUE AS is_accepted_identification,
  'A' AS taxon_formula,
  b.identifiedBy,
  b.taxonID AS taxon_id,
  'Animalia' AS kingdom,
  CASE 
    WHEN RIGHT(scientificName, 4) = ' sp.' THEN LEFT(scientificName, LENGTH(scientificName) - 4)
    ELSE scientificName
  END AS scientific_name,
  taxonRank AS taxon_rank
FROM occurrence a
JOIN fsh_perFish b on a.occurrence_id=b.uid;
-- n=672 rows
-- n=672 rows total

-- Add identifications from perFish material.
INSERT INTO identification (
  identification_id,
  identification_based_on_material_entity_id,
  identification_type,
  is_accepted_identification,
  taxon_formula,
  identified_by_id,
  taxon_id,
  kingdom,
  scientific_name,
  taxon_rank
)
SELECT
  gen_random_uuid() AS identification_id,
  a.material_entity_id AS identification_based_on_material_entity_id,
  'Material' AS identification_type,
  TRUE AS is_accepted_identification,
  'A' AS taxon_formula,
  b.identifiedBy,
  b.taxonID AS taxon_id,
  'Animalia' AS kingdom,
  CASE 
    WHEN RIGHT(scientificName, 4) = ' sp.' THEN LEFT(scientificName, LENGTH(scientificName) - 4)
    ELSE scientificName
  END AS scientific_name,
  taxonRank AS taxon_rank
FROM material a
JOIN fsh_perFish b on a.material_entity_id=b.voucherSampleID;
-- n=18 rows
-- n=690 rows total

-- Add identifications from bulkCount observations.
INSERT INTO identification (
  identification_id,
  identification_based_on_material_entity_id,
  identification_type,
  is_accepted_identification,
  taxon_formula,
  identified_by_id,
  taxon_id,
  kingdom,
  scientific_name,
  taxon_rank
)
SELECT
  gen_random_uuid() AS identification_id,
  a.occurrence_id AS identification_based_on_occurrence_id,
  'Observation' AS identification_type,
  TRUE AS is_accepted_identification,
  'A' AS taxon_formula,
  b.identifiedBy,
  b.taxonID AS taxon_id,
  'Animalia' AS kingdom,
  CASE 
    WHEN RIGHT(scientificName, 4) = ' sp.' THEN LEFT(scientificName, LENGTH(scientificName) - 4)
    ELSE scientificName
  END AS scientific_name,
  'species' AS taxon_rank
FROM occurrence a
JOIN fsh_bulkCount b on a.occurrence_id=b.uid;
-- n=4 rows
-- n=694 rows total

-- Create the survey table for the Project.
INSERT INTO survey (
  survey_id,
  protocol_names,
  event_duration_value,
  event_duration_unit,
  protocol_references,
  sampling_performed_by,
  reported_extreme_conditions,
  identified_by_id,
  site_count,
  site_nesting_description,
  verbatim_site_descriptions,
  verbatim_site_names,
  reported_weather,
  target_taxonomic_scope,
  taxon_completeness_reported,
  taxon_completeness_protocols,
  is_taxonomic_scope_fully_reported,
  is_absence_reported,
  has_non_target_taxa,
  non_target_taxa,
  are_non_target_taxa_fully_reported,
  target_life_stage_scope,
  excluded_life_stage_scope,
  is_life_stage_scope_fully_reported,
  verbatim_target_scope,
  compilation_types,
  protocol_descriptions,
  is_abundance_reported,
  is_abundance_cap_reported,
  is_least_specific_target_category_quantity_inclusive,
  has_vouchers,
  voucher_institutions,
  has_material_samples,
  material_sample_types,
  is_sampling_effort_reported,
  sampling_effort_protocol
)
SELECT
  eventID AS survey_id,
  CASE WHEN protocolNames = 'NA' THEN NULL ELSE protocolNames END AS protocol_names,
  CASE WHEN eventDurationValue = 'NA' THEN NULL ELSE eventDurationValue::NUMERIC END AS event_duration_value,
  CASE WHEN eventDurationUnit = 'NA' THEN NULL ELSE eventDurationUnit END AS event_duration_unit,
  CASE WHEN protocolReferences = 'NA' THEN NULL ELSE protocolReferences END AS protocol_references,
  CASE WHEN samplingPerformedBy = 'NA' THEN NULL ELSE samplingPerformedBy END AS sampling_performed_by,
  CASE WHEN reportedExtremeConditions = 'NA' THEN NULL ELSE reportedExtremeConditions END AS reported_extreme_conditions,
  CASE WHEN identifiedBy = 'NA' THEN NULL ELSE 'https://orcid.org/' || identifiedBy END AS identified_by_id,
  CASE WHEN siteCount = 'NA' THEN NULL ELSE siteCount::SMALLINT END AS site_count,
  CASE WHEN siteNestingDescription = 'NA' THEN NULL ELSE siteNestingDescription END AS site_nesting_description,
  CASE WHEN verbatimSiteDescriptions = 'NA' THEN NULL ELSE verbatimSiteDescriptions END AS verbatim_site_descriptions,
  CASE WHEN verbatimSiteNames = 'NA' THEN NULL ELSE verbatimSiteNames END AS verbatim_site_names,
  CASE WHEN reportedWeather = 'NA' THEN NULL ELSE reportedWeather END AS reported_weather,
  CASE WHEN targetTaxonomicScope = 'NA' THEN NULL ELSE targetTaxonomicScope END AS target_taxonomic_scope,
  'not reported'::TAXON_COMPLETENESS_REPORTED AS taxon_completeness_reported,
  'not reported'::TAXON_COMPLETENESS_REPORTED AS taxon_completeness_protocols,
  CASE WHEN isTaxonomicScopeFullyReported = 'NA' THEN NULL ELSE isTaxonomicScopeFullyReported::BOOLEAN END AS is_taxonomic_scope_fully_reported,
  CASE WHEN isAbsenceReported = 'NA' THEN NULL ELSE isAbsenceReported::BOOLEAN END AS is_absence_reported,
  CASE WHEN hasNonTargetTaxa = 'NA' THEN NULL ELSE hasNonTargetTaxa::BOOLEAN END AS has_non_target_taxa,
  CASE WHEN nonTargetTaxa = 'NA' THEN NULL ELSE nonTargetTaxa END AS non_target_taxa,
  CASE WHEN areNonTargetTaxaFullyReported = 'NA' THEN NULL ELSE areNonTargetTaxaFullyReported::BOOLEAN END AS are_non_target_taxa_fully_reported,
  CASE WHEN targetLifeStageScope = 'NA' THEN NULL ELSE targetLifeStageScope END AS target_life_stage_scope,
  CASE WHEN excludedLifeStageScope = 'NA' THEN NULL ELSE excludedLifeStageScope END AS excluded_life_stage_scope,
  CASE WHEN isLifeStageScopeFullyReported = 'NA' THEN NULL ELSE isLifeStageScopeFullyReported::BOOLEAN END AS is_life_stage_scope_fully_reported,
  CASE WHEN verbatimTargetScope = 'NA' THEN NULL ELSE verbatimTargetScope END AS verbatim_target_scope,
  CASE WHEN compilationTypes = 'NA' THEN NULL ELSE compilationTypes END AS compilation_types,
  CASE WHEN protocolDescriptions = 'NA' THEN NULL ELSE protocolDescriptions END AS protocol_descriptions,
  CASE WHEN isAbundanceReported = 'NA' THEN NULL ELSE isAbundanceReported::BOOLEAN END AS is_abundance_reported,
  CASE WHEN isAbundanceCapReported = 'NA' THEN NULL ELSE isAbundanceCapReported::BOOLEAN END AS is_abundance_cap_reported,
  CASE WHEN isLeastSpecificTargetCategoryQuantityInclusive = 'NA' THEN NULL ELSE isLeastSpecificTargetCategoryQuantityInclusive::BOOLEAN END AS is_least_specific_target_category_quantity_inclusive,
  CASE WHEN hasVouchers = 'NA' THEN NULL ELSE hasVouchers::BOOLEAN END AS has_vouchers,
  CASE WHEN voucherInstitutions = 'NA' THEN NULL ELSE voucherInstitutions END AS voucher_institutions,
  CASE WHEN hasMaterialSamples = 'NA' THEN NULL ELSE hasMaterialSamples::BOOLEAN END AS has_material_samples,
  CASE WHEN materialSampleTypes = 'NA' THEN NULL ELSE materialSampleTypes END AS material_sample_types,
  CASE WHEN isSamplingEffortReported = 'NA' THEN NULL ELSE isSamplingEffortReported::BOOLEAN END AS is_sampling_effort_reported,
  CASE WHEN samplingEffortProtocol = 'NA' THEN NULL ELSE samplingEffortProtocol END AS sampling_effort_protocol
FROM dwcav1_event;
-- n=44 rows
-- n=44 rows total

-- Create the assertion table with measuredReachLength from fsh_fieldData table.
INSERT INTO "assertion" (
  assertion_id,
  assertion_target_id,
  assertion_target_type,
  assertion_type,
  assertion_type_iri,
  assertion_type_vocabulary,
  assertion_made_date,
  assertion_effective_date,
  assertion_value,
  assertion_value_numeric,
  assertion_unit,
  assertion_unit_iri,
  assertion_unit_vocabulary,
  assertion_by, 
  assertion_by_id,
  assertion_protocol,
  assertion_protocol_id,
  assertion_citation,
  assertion_remarks
)
SELECT
  gen_random_uuid() AS assertion_id,
  reachID AS assertion_target_id,
  'Event'::COMMON_TARGETS AS assertion_target_type,
  'measuredReachLength' AS assertion_type,
  NULL AS assertion_type_iri,
  NULL AS assertion_type_vocabulary,
  NULL AS assertion_made_date,
  NULL AS assertion_effective_date,
  NULL AS assertion_value,
  measuredReachLength::NUMERIC AS assertion_value_numeric,
  'm' AS assertion_unit,
  NULL AS assertion_unit_iri,
  NULL AS assertion_unit_vocabulary,
  NULL AS assertion_by,
  NULL AS assertion_by_id,
  NULL AS assertion_protocol,
  NULL AS assertion_protocol_id,
  NULL AS assertion_citation,
  NULL AS assertion_remarks
FROM fsh_fieldData
WHERE measuredReachLength <> 'NA';
-- n=12 rows
-- n=12 rows total

-- Add fixedRandomReach from fsh_fieldData to the assertion table.
INSERT INTO "assertion" (
  assertion_id,
  assertion_target_id,
  assertion_target_type,
  assertion_type,
  assertion_type_iri,
  assertion_type_vocabulary,
  assertion_made_date,
  assertion_effective_date,
  assertion_value,
  assertion_value_numeric,
  assertion_unit,
  assertion_unit_iri,
  assertion_unit_vocabulary,
  assertion_by, 
  assertion_by_id,
  assertion_protocol,
  assertion_protocol_id,
  assertion_citation,
  assertion_remarks
)
SELECT
  gen_random_uuid() AS assertion_id,
  reachID AS assertion_target_id,
  'Event'::COMMON_TARGETS AS assertion_target_type,
  'fixedRandomReach' AS assertion_type,
  NULL AS assertion_type_iri,
  NULL AS assertion_type_vocabulary,
  NULL AS assertion_made_date,
  NULL AS assertion_effective_date,
  fixedRandomReach AS assertion_value,
  NULL AS assertion_value_numeric,
  NULL AS assertion_unit,
  NULL AS assertion_unit_iri,
  NULL AS assertion_unit_vocabulary,
  NULL AS assertion_by,
  NULL AS assertion_by_id,
  NULL AS assertion_protocol,
  NULL AS assertion_protocol_id,
  NULL AS assertion_citation,
  NULL AS assertion_remarks
FROM fsh_fieldData
WHERE fixedRandomReach <> 'NA';
-- n=12 rows
-- n=24 rows total

-- Add passNumber from fsh_perPass to the assertion table.
INSERT INTO "assertion" (
  assertion_id,
  assertion_target_id,
  assertion_target_type,
  assertion_type,
  assertion_type_iri,
  assertion_type_vocabulary,
  assertion_made_date,
  assertion_effective_date,
  assertion_value,
  assertion_value_numeric,
  assertion_unit,
  assertion_unit_iri,
  assertion_unit_vocabulary,
  assertion_by, 
  assertion_by_id,
  assertion_protocol,
  assertion_protocol_id,
  assertion_citation,
  assertion_remarks
)
SELECT
  gen_random_uuid() AS assertion_id,
  eventID AS assertion_target_id,
  'Event'::COMMON_TARGETS AS assertion_target_type,
  'passNumber' AS assertion_type,
  NULL AS assertion_type_iri,
  NULL AS assertion_type_vocabulary,
  NULL AS assertion_made_date,
  NULL AS assertion_effective_date,
  NULL AS assertion_value,
  passNumber::NUMERIC AS assertion_value_numeric,
  NULL AS assertion_unit,
  NULL AS assertion_unit_iri,
  NULL AS assertion_unit_vocabulary,
  NULL AS assertion_by,
  NULL AS assertion_by_id,
  NULL AS assertion_protocol,
  NULL AS assertion_protocol_id,
  NULL AS assertion_citation,
  NULL AS assertion_remarks
FROM fsh_perPass
WHERE passNumber <> 'NA';
-- n=24 rows
-- n=48 rows total

-- Add waterTemp from fsh_perPass to the assertion table.
INSERT INTO "assertion" (
  assertion_id,
  assertion_target_id,
  assertion_target_type,
  assertion_type,
  assertion_type_iri,
  assertion_type_vocabulary,
  assertion_made_date,
  assertion_effective_date,
  assertion_value,
  assertion_value_numeric,
  assertion_unit,
  assertion_unit_iri,
  assertion_unit_vocabulary,
  assertion_by, 
  assertion_by_id,
  assertion_protocol,
  assertion_protocol_id,
  assertion_citation,
  assertion_remarks
)
SELECT
  gen_random_uuid() AS assertion_id,
  eventID AS assertion_target_id,
  'Event'::COMMON_TARGETS AS assertion_target_type,
  'waterTemp' AS assertion_type,
  NULL AS assertion_type_iri,
  NULL AS assertion_type_vocabulary,
  NULL AS assertion_made_date,
  NULL AS assertion_effective_date,
  NULL AS assertion_value,
  waterTemp::NUMERIC AS assertion_value_numeric,
  'C' AS assertion_unit,
  NULL AS assertion_unit_iri,
  NULL AS assertion_unit_vocabulary,
  NULL AS assertion_by,
  NULL AS assertion_by_id,
  NULL AS assertion_protocol,
  NULL AS assertion_protocol_id,
  NULL AS assertion_citation,
  NULL AS assertion_remarks
FROM fsh_perPass
WHERE waterTemp <> 'NA';
-- n=24 rows
-- n=72 rows total

-- Add dissolvedOxygen from fsh_perPass to the assertion table.
INSERT INTO "assertion" (
  assertion_id,
  assertion_target_id,
  assertion_target_type,
  assertion_type,
  assertion_type_iri,
  assertion_type_vocabulary,
  assertion_made_date,
  assertion_effective_date,
  assertion_value,
  assertion_value_numeric,
  assertion_unit,
  assertion_unit_iri,
  assertion_unit_vocabulary,
  assertion_by, 
  assertion_by_id,
  assertion_protocol,
  assertion_protocol_id,
  assertion_citation,
  assertion_remarks
)
SELECT
  gen_random_uuid() AS assertion_id,
  eventID AS assertion_target_id,
  'Event'::COMMON_TARGETS AS assertion_target_type,
  'dissolvedOxygen' AS assertion_type,
  NULL AS assertion_type_iri,
  NULL AS assertion_type_vocabulary,
  NULL AS assertion_made_date,
  NULL AS assertion_effective_date,
  NULL AS assertion_value,
  dissolvedOxygen::NUMERIC AS assertion_value_numeric,
  '%' AS assertion_unit,
  NULL AS assertion_unit_iri,
  NULL AS assertion_unit_vocabulary,
  NULL AS assertion_by,
  NULL AS assertion_by_id,
  NULL AS assertion_protocol,
  NULL AS assertion_protocol_id,
  NULL AS assertion_citation,
  NULL AS assertion_remarks
FROM fsh_perPass
WHERE dissolvedOxygen <> 'NA';
-- n=24 rows
-- n=96 rows total

-- Add specificConductance from fsh_perPass to the assertion table.
INSERT INTO "assertion" (
  assertion_id,
  assertion_target_id,
  assertion_target_type,
  assertion_type,
  assertion_type_iri,
  assertion_type_vocabulary,
  assertion_made_date,
  assertion_effective_date,
  assertion_value,
  assertion_value_numeric,
  assertion_unit,
  assertion_unit_iri,
  assertion_unit_vocabulary,
  assertion_by, 
  assertion_by_id,
  assertion_protocol,
  assertion_protocol_id,
  assertion_citation,
  assertion_remarks
)
SELECT
  gen_random_uuid() AS assertion_id,
  eventID AS assertion_target_id,
  'Event'::COMMON_TARGETS AS assertion_target_type,
  'specificConductance' AS assertion_type,
  NULL AS assertion_type_iri,
  NULL AS assertion_type_vocabulary,
  NULL AS assertion_made_date,
  NULL AS assertion_effective_date,
  NULL AS assertion_value,
  specificConductance::NUMERIC AS assertion_value_numeric,
  'cm^-1 Ω^-1' AS assertion_unit,
  NULL AS assertion_unit_iri,
  NULL AS assertion_unit_vocabulary,
  NULL AS assertion_by,
  NULL AS assertion_by_id,
  NULL AS assertion_protocol,
  NULL AS assertion_protocol_id,
  NULL AS assertion_citation,
  NULL AS assertion_remarks
FROM fsh_perPass
WHERE specificConductance <> 'NA';
-- n=24 rows
-- n=120 rows total

-- Add samplerType from fsh_perPass to the assertion table.
INSERT INTO "assertion" (
  assertion_id,
  assertion_target_id,
  assertion_target_type,
  assertion_type,
  assertion_type_iri,
  assertion_type_vocabulary,
  assertion_made_date,
  assertion_effective_date,
  assertion_value,
  assertion_value_numeric,
  assertion_unit,
  assertion_unit_iri,
  assertion_unit_vocabulary,
  assertion_by, 
  assertion_by_id,
  assertion_protocol,
  assertion_protocol_id,
  assertion_citation,
  assertion_remarks
)
SELECT
  gen_random_uuid() AS assertion_id,
  eventID AS assertion_target_id,
  'Event'::COMMON_TARGETS AS assertion_target_type,
  'samplerType' AS assertion_type,
  NULL AS assertion_type_iri,
  NULL AS assertion_type_vocabulary,
  NULL AS assertion_made_date,
  NULL AS assertion_effective_date,
  samplerType AS assertion_value,
  NULL AS assertion_value_numeric,
  NULL AS assertion_unit,
  NULL AS assertion_unit_iri,
  NULL AS assertion_unit_vocabulary,
  NULL AS assertion_by,
  NULL AS assertion_by_id,
  NULL AS assertion_protocol,
  NULL AS assertion_protocol_id,
  NULL AS assertion_citation,
  NULL AS assertion_remarks
FROM fsh_perPass
WHERE samplerType <> 'NA';
-- n=24 rows
-- n=144 rows total

-- Add initialFrequency from fsh_perPass to the assertion table.
INSERT INTO "assertion" (
  assertion_id,
  assertion_target_id,
  assertion_target_type,
  assertion_type,
  assertion_type_iri,
  assertion_type_vocabulary,
  assertion_made_date,
  assertion_effective_date,
  assertion_value,
  assertion_value_numeric,
  assertion_unit,
  assertion_unit_iri,
  assertion_unit_vocabulary,
  assertion_by, 
  assertion_by_id,
  assertion_protocol,
  assertion_protocol_id,
  assertion_citation,
  assertion_remarks
)
SELECT
  gen_random_uuid() AS assertion_id,
  eventID AS assertion_target_id,
  'Event'::COMMON_TARGETS AS assertion_target_type,
  'initialFrequency' AS assertion_type,
  NULL AS assertion_type_iri,
  NULL AS assertion_type_vocabulary,
  NULL AS assertion_made_date,
  NULL AS assertion_effective_date,
  NULL AS assertion_value,
  initialFrequency::NUMERIC AS assertion_value_numeric,
  'Hz' AS assertion_unit,
  NULL AS assertion_unit_iri,
  NULL AS assertion_unit_vocabulary,
  NULL AS assertion_by,
  NULL AS assertion_by_id,
  NULL AS assertion_protocol,
  NULL AS assertion_protocol_id,
  NULL AS assertion_citation,
  NULL AS assertion_remarks
FROM fsh_perPass
WHERE initialFrequency <> 'NA';
-- n=24 rows
-- n=168 rows total

-- Add initialDutyCycle from fsh_perPass to the assertion table.
INSERT INTO "assertion" (
  assertion_id,
  assertion_target_id,
  assertion_target_type,
  assertion_type,
  assertion_type_iri,
  assertion_type_vocabulary,
  assertion_made_date,
  assertion_effective_date,
  assertion_value,
  assertion_value_numeric,
  assertion_unit,
  assertion_unit_iri,
  assertion_unit_vocabulary,
  assertion_by, 
  assertion_by_id,
  assertion_protocol,
  assertion_protocol_id,
  assertion_citation,
  assertion_remarks
)
SELECT
  gen_random_uuid() AS assertion_id,
  eventID AS assertion_target_id,
  'Event'::COMMON_TARGETS AS assertion_target_type,
  'initialDutyCycle' AS assertion_type,
  NULL AS assertion_type_iri,
  NULL AS assertion_type_vocabulary,
  NULL AS assertion_made_date,
  NULL AS assertion_effective_date,
  NULL AS assertion_value,
  initialDutyCycle::NUMERIC AS assertion_value_numeric,
  '%' AS assertion_unit,
  NULL AS assertion_unit_iri,
  NULL AS assertion_unit_vocabulary,
  NULL AS assertion_by,
  NULL AS assertion_by_id,
  NULL AS assertion_protocol,
  NULL AS assertion_protocol_id,
  NULL AS assertion_citation,
  NULL AS assertion_remarks
FROM fsh_perPass
WHERE initialDutyCycle <> 'NA';
-- n=24 rows
-- n=192 rows total

-- Add initialVoltage from fsh_perPass to the assertion table.
INSERT INTO "assertion" (
  assertion_id,
  assertion_target_id,
  assertion_target_type,
  assertion_type,
  assertion_type_iri,
  assertion_type_vocabulary,
  assertion_made_date,
  assertion_effective_date,
  assertion_value,
  assertion_value_numeric,
  assertion_unit,
  assertion_unit_iri,
  assertion_unit_vocabulary,
  assertion_by, 
  assertion_by_id,
  assertion_protocol,
  assertion_protocol_id,
  assertion_citation,
  assertion_remarks
)
SELECT
  gen_random_uuid() AS assertion_id,
  eventID AS assertion_target_id,
  'Event'::COMMON_TARGETS AS assertion_target_type,
  'initialVoltage' AS assertion_type,
  NULL AS assertion_type_iri,
  NULL AS assertion_type_vocabulary,
  NULL AS assertion_made_date,
  NULL AS assertion_effective_date,
  NULL AS assertion_value,
  initialVoltage::NUMERIC AS assertion_value_numeric,
  'V' AS assertion_unit,
  NULL AS assertion_unit_iri,
  NULL AS assertion_unit_vocabulary,
  NULL AS assertion_by,
  NULL AS assertion_by_id,
  NULL AS assertion_protocol,
  NULL AS assertion_protocol_id,
  NULL AS assertion_citation,
  NULL AS assertion_remarks
FROM fsh_perPass
WHERE initialVoltage <> 'NA';
-- n=24 rows
-- n=216 rows total

-- Add finalFrequency from fsh_perPass to the assertion table.
INSERT INTO "assertion" (
  assertion_id,
  assertion_target_id,
  assertion_target_type,
  assertion_type,
  assertion_type_iri,
  assertion_type_vocabulary,
  assertion_made_date,
  assertion_effective_date,
  assertion_value,
  assertion_value_numeric,
  assertion_unit,
  assertion_unit_iri,
  assertion_unit_vocabulary,
  assertion_by, 
  assertion_by_id,
  assertion_protocol,
  assertion_protocol_id,
  assertion_citation,
  assertion_remarks
)
SELECT
  gen_random_uuid() AS assertion_id,
  eventID AS assertion_target_id,
  'Event'::COMMON_TARGETS AS assertion_target_type,
  'finalFrequency' AS assertion_type,
  NULL AS assertion_type_iri,
  NULL AS assertion_type_vocabulary,
  NULL AS assertion_made_date,
  NULL AS assertion_effective_date,
  NULL AS assertion_value,
  finalFrequency::NUMERIC AS assertion_value_numeric,
  'Hz' AS assertion_unit,
  NULL AS assertion_unit_iri,
  NULL AS assertion_unit_vocabulary,
  NULL AS assertion_by,
  NULL AS assertion_by_id,
  NULL AS assertion_protocol,
  NULL AS assertion_protocol_id,
  NULL AS assertion_citation,
  NULL AS assertion_remarks
FROM fsh_perPass
WHERE finalFrequency <> 'NA';
-- n=24 rows
-- n=240 rows total

-- Add finalDutyCycle from fsh_perPass to the assertion table.
INSERT INTO "assertion" (
  assertion_id,
  assertion_target_id,
  assertion_target_type,
  assertion_type,
  assertion_type_iri,
  assertion_type_vocabulary,
  assertion_made_date,
  assertion_effective_date,
  assertion_value,
  assertion_value_numeric,
  assertion_unit,
  assertion_unit_iri,
  assertion_unit_vocabulary,
  assertion_by, 
  assertion_by_id,
  assertion_protocol,
  assertion_protocol_id,
  assertion_citation,
  assertion_remarks
)
SELECT
  gen_random_uuid() AS assertion_id,
  eventID AS assertion_target_id,
  'Event'::COMMON_TARGETS AS assertion_target_type,
  'finalDutyCycle' AS assertion_type,
  NULL AS assertion_type_iri,
  NULL AS assertion_type_vocabulary,
  NULL AS assertion_made_date,
  NULL AS assertion_effective_date,
  NULL AS assertion_value,
  finalDutyCycle::SMALLINT AS assertion_value_numeric,
  '%' AS assertion_unit,
  NULL AS assertion_unit_iri,
  NULL AS assertion_unit_vocabulary,
  NULL AS assertion_by,
  NULL AS assertion_by_id,
  NULL AS assertion_protocol,
  NULL AS assertion_protocol_id,
  NULL AS assertion_citation,
  NULL AS assertion_remarks
FROM fsh_perPass
WHERE finalDutyCycle <> 'NA';
-- n=24 rows
-- n=264 rows total

-- Add finalVoltage from fsh_perPass to the assertion table.
INSERT INTO "assertion" (
  assertion_id,
  assertion_target_id,
  assertion_target_type,
  assertion_type,
  assertion_type_iri,
  assertion_type_vocabulary,
  assertion_made_date,
  assertion_effective_date,
  assertion_value,
  assertion_value_numeric,
  assertion_unit,
  assertion_unit_iri,
  assertion_unit_vocabulary,
  assertion_by, 
  assertion_by_id,
  assertion_protocol,
  assertion_protocol_id,
  assertion_citation,
  assertion_remarks
)
SELECT
  gen_random_uuid() AS assertion_id,
  eventID AS assertion_target_id,
  'Event'::COMMON_TARGETS AS assertion_target_type,
  'finalVoltage' AS assertion_type,
  NULL AS assertion_type_iri,
  NULL AS assertion_type_vocabulary,
  NULL AS assertion_made_date,
  NULL AS assertion_effective_date,
  NULL AS assertion_value,
  finalVoltage::NUMERIC AS assertion_value_numeric,
  'V' AS assertion_unit,
  NULL AS assertion_unit_iri,
  NULL AS assertion_unit_vocabulary,
  NULL AS assertion_by,
  NULL AS assertion_by_id,
  NULL AS assertion_protocol,
  NULL AS assertion_protocol_id,
  NULL AS assertion_citation,
  NULL AS assertion_remarks
FROM fsh_perPass
WHERE finalVoltage <> 'NA';
-- n=24 rows
-- n=288 rows total

-- Add efTime from fsh_perPass to the assertion table.
INSERT INTO "assertion" (
  assertion_id,
  assertion_target_id,
  assertion_target_type,
  assertion_type,
  assertion_type_iri,
  assertion_type_vocabulary,
  assertion_made_date,
  assertion_effective_date,
  assertion_value,
  assertion_value_numeric,
  assertion_unit,
  assertion_unit_iri,
  assertion_unit_vocabulary,
  assertion_by, 
  assertion_by_id,
  assertion_protocol,
  assertion_protocol_id,
  assertion_citation,
  assertion_remarks
)
SELECT
  gen_random_uuid() AS assertion_id,
  eventID AS assertion_target_id,
  'Event'::COMMON_TARGETS AS assertion_target_type,
  'efTime' AS assertion_type,
  NULL AS assertion_type_iri,
  NULL AS assertion_type_vocabulary,
  NULL AS assertion_made_date,
  NULL AS assertion_effective_date,
  NULL AS assertion_value,
  efTime::INTEGER AS assertion_value_numeric,
  NULL AS assertion_unit,
  NULL AS assertion_unit_iri,
  NULL AS assertion_unit_vocabulary,
  NULL AS assertion_by,
  NULL AS assertion_by_id,
  NULL AS assertion_protocol,
  NULL AS assertion_protocol_id,
  NULL AS assertion_citation,
  NULL AS assertion_remarks
FROM fsh_perPass
WHERE efTime <> 'NA';
-- n=24 rows
-- n=312 rows total

-- Add settingsChanged from fsh_perPass to the assertion table.
INSERT INTO "assertion" (
  assertion_id,
  assertion_target_id,
  assertion_target_type,
  assertion_type,
  assertion_type_iri,
  assertion_type_vocabulary,
  assertion_made_date,
  assertion_effective_date,
  assertion_value,
  assertion_value_numeric,
  assertion_unit,
  assertion_unit_iri,
  assertion_unit_vocabulary,
  assertion_by, 
  assertion_by_id,
  assertion_protocol,
  assertion_protocol_id,
  assertion_citation,
  assertion_remarks
)
SELECT
  gen_random_uuid() AS assertion_id,
  eventID AS assertion_target_id,
  'Event'::COMMON_TARGETS AS assertion_target_type,
  'settingsChanged' AS assertion_type,
  NULL AS assertion_type_iri,
  NULL AS assertion_type_vocabulary,
  NULL AS assertion_made_date,
  NULL AS assertion_effective_date,
  NULL AS assertion_value,
  settingsChanged::SMALLINT AS assertion_value_numeric,
  NULL AS assertion_unit,
  NULL AS assertion_unit_iri,
  NULL AS assertion_unit_vocabulary,
  NULL AS assertion_by,
  NULL AS assertion_by_id,
  NULL AS assertion_protocol,
  NULL AS assertion_protocol_id,
  NULL AS assertion_citation,
  NULL AS assertion_remarks
FROM fsh_perPass
WHERE settingsChanged <> 'NA';
-- n=22 rows
-- n=334 rows total

-- Add netIntegrity from fsh_perPass to the assertion table.
INSERT INTO "assertion" (
  assertion_id,
  assertion_target_id,
  assertion_target_type,
  assertion_type,
  assertion_type_iri,
  assertion_type_vocabulary,
  assertion_made_date,
  assertion_effective_date,
  assertion_value,
  assertion_value_numeric,
  assertion_unit,
  assertion_unit_iri,
  assertion_unit_vocabulary,
  assertion_by, 
  assertion_by_id,
  assertion_protocol,
  assertion_protocol_id,
  assertion_citation,
  assertion_remarks
)
SELECT
  gen_random_uuid() AS assertion_id,
  eventID AS assertion_target_id,
  'Event'::COMMON_TARGETS AS assertion_target_type,
  'netIntegrity' AS assertion_type,
  NULL AS assertion_type_iri,
  NULL AS assertion_type_vocabulary,
  NULL AS assertion_made_date,
  NULL AS assertion_effective_date,
  netIntegrity AS assertion_value,
  NULL AS assertion_value_numeric,
  NULL AS assertion_unit,
  NULL AS assertion_unit_iri,
  NULL AS assertion_unit_vocabulary,
  NULL AS assertion_by,
  NULL AS assertion_by_id,
  NULL AS assertion_protocol,
  NULL AS assertion_protocol_id,
  NULL AS assertion_citation,
  NULL AS assertion_remarks
FROM fsh_perPass
WHERE netIntegrity <> 'NA';
-- n=22 rows
-- n=358 rows total

-- Add targetTaxaPresent from fsh_perPass to the assertion table.
INSERT INTO "assertion" (
  assertion_id,
  assertion_target_id,
  assertion_target_type,
  assertion_type,
  assertion_type_iri,
  assertion_type_vocabulary,
  assertion_made_date,
  assertion_effective_date,
  assertion_value,
  assertion_value_numeric,
  assertion_unit,
  assertion_unit_iri,
  assertion_unit_vocabulary,
  assertion_by, 
  assertion_by_id,
  assertion_protocol,
  assertion_protocol_id,
  assertion_citation,
  assertion_remarks
)
SELECT
  gen_random_uuid() AS assertion_id,
  eventID AS assertion_target_id,
  'Event'::COMMON_TARGETS AS assertion_target_type,
  'targetTaxaPresent' AS assertion_type,
  NULL AS assertion_type_iri,
  NULL AS assertion_type_vocabulary,
  NULL AS assertion_made_date,
  NULL AS assertion_effective_date,
  targetTaxaPresent AS assertion_value,
  NULL AS assertion_value_numeric,
  NULL AS assertion_unit,
  NULL AS assertion_unit_iri,
  NULL AS assertion_unit_vocabulary,
  NULL AS assertion_by,
  NULL AS assertion_by_id,
  NULL AS assertion_protocol,
  NULL AS assertion_protocol_id,
  NULL AS assertion_citation,
  NULL AS assertion_remarks
FROM fsh_perPass
WHERE targetTaxaPresent <> 'NA';
-- n=22 rows
-- n=382 rows total

-- Add fishTotalLength from fsh_perFidh to the assertion table.
INSERT INTO "assertion" (
  assertion_id,
  assertion_target_id,
  assertion_target_type,
  assertion_type,
  assertion_type_iri,
  assertion_type_vocabulary,
  assertion_made_date,
  assertion_effective_date,
  assertion_value,
  assertion_value_numeric,
  assertion_unit,
  assertion_unit_iri,
  assertion_unit_vocabulary,
  assertion_by, 
  assertion_by_id,
  assertion_protocol,
  assertion_protocol_id,
  assertion_citation,
  assertion_remarks
)
SELECT
  gen_random_uuid() AS assertion_id,
  eventID AS assertion_target_id,
  'Occurrence'::COMMON_TARGETS AS assertion_target_type,
  'fishTotalLength' AS assertion_type,
  NULL AS assertion_type_iri,
  NULL AS assertion_type_vocabulary,
  NULL AS assertion_made_date,
  NULL AS assertion_effective_date,
  NULL AS assertion_value,
  fishTotalLength::NUMERIC AS assertion_value_numeric,
  'mm' AS assertion_unit,
  NULL AS assertion_unit_iri,
  NULL AS assertion_unit_vocabulary,
  NULL AS assertion_by,
  NULL AS assertion_by_id,
  NULL AS assertion_protocol,
  NULL AS assertion_protocol_id,
  NULL AS assertion_citation,
  NULL AS assertion_remarks
FROM fsh_perFish
WHERE fishTotalLength <> 'NA';
-- n=671 rows
-- n=1053 rows total

-- Add fishWeight from fsh_perFidh to the assertion table.
INSERT INTO "assertion" (
  assertion_id,
  assertion_target_id,
  assertion_target_type,
  assertion_type,
  assertion_type_iri,
  assertion_type_vocabulary,
  assertion_made_date,
  assertion_effective_date,
  assertion_value,
  assertion_value_numeric,
  assertion_unit,
  assertion_unit_iri,
  assertion_unit_vocabulary,
  assertion_by, 
  assertion_by_id,
  assertion_protocol,
  assertion_protocol_id,
  assertion_citation,
  assertion_remarks
)
SELECT
  gen_random_uuid() AS assertion_id,
  eventID AS assertion_target_id,
  'Occurrence'::COMMON_TARGETS AS assertion_target_type,
  'fishWeight' AS assertion_type,
  NULL AS assertion_type_iri,
  NULL AS assertion_type_vocabulary,
  NULL AS assertion_made_date,
  NULL AS assertion_effective_date,
  NULL AS assertion_value,
  fishWeight::NUMERIC AS assertion_value_numeric,
  'g' AS assertion_unit,
  NULL AS assertion_unit_iri,
  NULL AS assertion_unit_vocabulary,
  NULL AS assertion_by,
  NULL AS assertion_by_id,
  NULL AS assertion_protocol,
  NULL AS assertion_protocol_id,
  NULL AS assertion_citation,
  NULL AS assertion_remarks
FROM fsh_perFish
WHERE fishTotalLength <> 'NA';
-- n=671 rows
-- n=1724 rows total

-- Add delt from fsh_perFidh to the assertion table.
INSERT INTO "assertion" (
  assertion_id,
  assertion_target_id,
  assertion_target_type,
  assertion_type,
  assertion_type_iri,
  assertion_type_vocabulary,
  assertion_made_date,
  assertion_effective_date,
  assertion_value,
  assertion_value_numeric,
  assertion_unit,
  assertion_unit_iri,
  assertion_unit_vocabulary,
  assertion_by, 
  assertion_by_id,
  assertion_protocol,
  assertion_protocol_id,
  assertion_citation,
  assertion_remarks
)
SELECT
  gen_random_uuid() AS assertion_id,
  eventID AS assertion_target_id,
  'Occurrence'::COMMON_TARGETS AS assertion_target_type,
  'delt' AS assertion_type,
  NULL AS assertion_type_iri,
  NULL AS assertion_type_vocabulary,
  NULL AS assertion_made_date,
  NULL AS assertion_effective_date,
  'delt' AS assertion_value,
  NULL AS assertion_value_numeric,
  NULL AS assertion_unit,
  NULL AS assertion_unit_iri,
  NULL AS assertion_unit_vocabulary,
  NULL AS assertion_by,
  NULL AS assertion_by_id,
  NULL AS assertion_protocol,
  NULL AS assertion_protocol_id,
  NULL AS assertion_citation,
  NULL AS assertion_remarks
FROM fsh_perFish
WHERE delt <> 'NA';
-- n=3 rows
-- n=1727 rows total

-- Add efMortality from fsh_perFidh to the assertion table.
INSERT INTO "assertion" (
  assertion_id,
  assertion_target_id,
  assertion_target_type,
  assertion_type,
  assertion_type_iri,
  assertion_type_vocabulary,
  assertion_made_date,
  assertion_effective_date,
  assertion_value,
  assertion_value_numeric,
  assertion_unit,
  assertion_unit_iri,
  assertion_unit_vocabulary,
  assertion_by, 
  assertion_by_id,
  assertion_protocol,
  assertion_protocol_id,
  assertion_citation,
  assertion_remarks
)
SELECT
  gen_random_uuid() AS assertion_id,
  eventID AS assertion_target_id,
  'Occurrence'::COMMON_TARGETS AS assertion_target_type,
  'efMortality' AS assertion_type,
  NULL AS assertion_type_iri,
  NULL AS assertion_type_vocabulary,
  NULL AS assertion_made_date,
  NULL AS assertion_effective_date,
  'efMortality' AS assertion_value,
  NULL AS assertion_value_numeric,
  NULL AS assertion_unit,
  NULL AS assertion_unit_iri,
  NULL AS assertion_unit_vocabulary,
  NULL AS assertion_by,
  NULL AS assertion_by_id,
  NULL AS assertion_protocol,
  NULL AS assertion_protocol_id,
  NULL AS assertion_citation,
  NULL AS assertion_remarks
FROM fsh_perFish
WHERE efMortality <> 'NA';
-- n=8 rows
-- n=1735 rows total

-- Add efInjury from fsh_perFidh to the assertion table.
INSERT INTO "assertion" (
  assertion_id,
  assertion_target_id,
  assertion_target_type,
  assertion_type,
  assertion_type_iri,
  assertion_type_vocabulary,
  assertion_made_date,
  assertion_effective_date,
  assertion_value,
  assertion_value_numeric,
  assertion_unit,
  assertion_unit_iri,
  assertion_unit_vocabulary,
  assertion_by, 
  assertion_by_id,
  assertion_protocol,
  assertion_protocol_id,
  assertion_citation,
  assertion_remarks
)
SELECT
  gen_random_uuid() AS assertion_id,
  eventID AS assertion_target_id,
  'Occurrence'::COMMON_TARGETS AS assertion_target_type,
  'efInjury' AS assertion_type,
  NULL AS assertion_type_iri,
  NULL AS assertion_type_vocabulary,
  NULL AS assertion_made_date,
  NULL AS assertion_effective_date,
  'efInjury' AS assertion_value,
  NULL AS assertion_value_numeric,
  NULL AS assertion_unit,
  NULL AS assertion_unit_iri,
  NULL AS assertion_unit_vocabulary,
  NULL AS assertion_by,
  NULL AS assertion_by_id,
  NULL AS assertion_protocol,
  NULL AS assertion_protocol_id,
  NULL AS assertion_citation,
  NULL AS assertion_remarks
FROM fsh_perFish
WHERE efInjury <> 'NA';
-- n=1 rows
-- n=1736 rows total

-- Create the Identifier table
INSERT INTO identifier (
  identifier, 
  identifier_target_id, 
  identifier_target_type, 
  identifier_type
)
SELECT
  specimenNumber AS identifier, 
  uid AS identifier_target_id,
  'Occurrence'::COMMON_TARGETS AS identifier_target_type, 
  'specimenNumber' AS identifier_type
  FROM fsh_perFish;
-- n=672 rows
-- n=672 rows total

-- Create the GeneticSequence table
INSERT INTO genetic_sequence (
  genetic_sequence_id,
  material_gathering_id,
  derived_from_material_entity_id,
  genetic_sequence_type,
  genetic_sequence,
  genetic_sequence_citation,
  genetic_sequence_remarks
)
SELECT
  gen_random_uuid() AS genetic_sequence_id,
  material_gathering_id,
  material_entity_id AS derived_from_material_entity_id,
  target_gene AS genetic_sequence_type,
  DNA_sequence AS genetic_sequence,
  url AS genetic_sequence_citation,
  NULL AS genetic_sequence_remarks
FROM dwcav1_dna_derived_data a
JOIN material b ON a.samp_name=b.material_entity_id
WHERE DNA_sequence IS NOT NULL AND DNA_sequence <> '';
-- n=4 rows
-- n=4 rows total
