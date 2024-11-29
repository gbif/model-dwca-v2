--
-- We create:
--   Occurrence events for observed species
--   GatheringEvent events for those with material
--   Material for records with the correct basisOfRecord

-- utility to allow multiple scanning and filtering
CREATE VIEW view_event AS
SELECT
  -- excluded in exports but used for filters
  occurrenceID AS _occurrenceID,
  basisOfRecord AS _basisOfRecord,
  farmFingerprint64('MaterialEvent', occurrenceID) AS _materialGatheringID,

  -- columns always included
  coalesce(columns('parentEventID'), null) AS parentEventID,
  coalesce(columns('preferredEventName'), null) AS preferredEventName,
  coalesce(columns('eventType'), null) AS eventType,
  coalesce(columns('eventTypeIRI'), null) AS eventTypeIRI,
  coalesce(columns('eventTypeVocabulary'), null) AS eventTypeVocabulary,
  coalesce(columns('fieldNumber'), null) AS fieldNumber,
  coalesce(columns('recordedBy'), null) AS eventConductedBy,
  coalesce(columns('recordedById'), null) AS eventConductedByID,
  coalesce(columns('eventDate'), null) AS eventDate,
  coalesce(columns('eventTime'), null) AS eventTime,
  coalesce(columns('startDayOfYear'), null) AS startDayOfYear,
  coalesce(columns('endDayOfYear'), null) AS endDayOfYear,
  coalesce(columns('year'), null) AS year,
  coalesce(columns('month'), null) AS month,
  coalesce(columns('day'), null) AS day,
  coalesce(columns('verbatimEventDate'), null) AS verbatimEventDate,
  coalesce(columns('verbatimLocality'), null) AS verbatimLocality,
  coalesce(columns('verbatimElevation'), null) AS verbatimElevation,
  coalesce(columns('verbatimDepth'), null) AS verbatimDepth,
  coalesce(columns('verbatimCoordinates'), null) AS verbatimCoordinates,
  coalesce(columns('verbatimLatitude'), null) AS verbatimLatitude,
  coalesce(columns('verbatimLongitude'), null) AS verbatimLongitude,
  coalesce(columns('verbatimCoordinateSystem'), null) AS verbatimCoordinateSystem,
  coalesce(columns('verbatimSRS'), null) AS verbatimSRS,
  coalesce(columns('georeferenceVerificationStatus'), null) AS georeferenceVerificationStatus,
  coalesce(columns('habitat'), null) AS habitat,
  coalesce(columns('sampleSizeValue'), null) AS sampleSizeValue,
  coalesce(columns('sampleSizeUnit'), null) AS sampleSizeUnit,
  coalesce(columns('eventEffort'), null) AS eventEffort,
  coalesce(columns('fieldNotes'), null) AS fieldNotes,
  coalesce(columns('eventCitation'), null) AS eventCitation,
  coalesce(columns('eventRemarks'), null) AS eventRemarks,
  coalesce(columns('protocolID'), null) AS protocolID,
  coalesce(columns('protocolName'), null) AS protocolName,
  coalesce(columns('protocolDescription'), null) AS protocolDescription,
  coalesce(columns('protocolCitation'), null) AS protocolCitation,
  coalesce(columns('protocolRemarks'), null) AS protocolRemarks,
  coalesce(columns('locationID'), null) AS locationID,
  coalesce(columns('higherGeographyID'), null) AS higherGeographyID,
  coalesce(columns('higherGeography'), null) AS higherGeography,
  coalesce(columns('continent'), null) AS continent,
  coalesce(columns('waterBody'), null) AS waterBody,
  coalesce(columns('islandGroup'), null) AS islandGroup,
  coalesce(columns('island'), null) AS island,
  coalesce(columns('country'), null) AS country,
  coalesce(columns('countryCode'), null) AS countryCode,
  coalesce(columns('stateProvince'), null) AS stateProvince,
  coalesce(columns('county'), null) AS county,
  coalesce(columns('municipality'), null) AS municipality,
  coalesce(columns('locality'), null) AS locality,
  coalesce(columns('minimumElevationInMeters'), null) AS minimumElevationInMeters,
  coalesce(columns('maximumElevationInMeters'), null) AS maximumElevationInMeters,
  coalesce(columns('verticalDatum'), null) AS verticalDatum,
  coalesce(columns('minimumDepthInMeters'), null) AS minimumDepthInMeters,
  coalesce(columns('maximumDepthInMeters'), null) AS maximumDepthInMeters,
  coalesce(columns('minimumDistanceAboveSurfaceInMeters'), null) AS minimumDistanceAboveSurfaceInMeters,
  coalesce(columns('maximumDistanceAboveSurfaceInMeters'), null) AS maximumDistanceAboveSurfaceInMeters,
  coalesce(columns('locationRemarks'), null) AS locationRemarks,
  coalesce(columns('decimalLatitude'), null) AS decimalLatitude,
  coalesce(columns('decimalLongitude'), null) AS decimalLongitude,
  coalesce(columns('geodeticDatum'), null) AS geodeticDatum,
  coalesce(columns('coordinateUncertaintyInMeters'), null) AS coordinateUncertaintyInMeters,
  coalesce(columns('coordinatePrecision'), null) AS coordinatePrecision,
  coalesce(columns('pointRadiusSpatialFit'), null) AS pointRadiusSpatialFit,
  coalesce(columns('footprintWKT'), null) AS footprintWKT,
  coalesce(columns('footprintSRS'), null) AS footprintSRS,
  coalesce(columns('footprintSpatialFit'), null) AS footprintSpatialFit,
  coalesce(columns('georeferencedBy'), null) AS georeferencedBy,
  coalesce(columns('georeferencedByID'), null) AS georeferencedByID,
  coalesce(columns('georeferencedDate'), null) AS georeferencedDate,
  coalesce(columns('georeferenceProtocolID'), null) AS georeferenceProtocolID,
  coalesce(columns('georeferenceProtocol'), null) AS georeferenceProtocol,
  coalesce(columns('georeferenceSources'), null) AS georeferenceSources,
  coalesce(columns('georeferenceRemarks'), null) AS georeferenceRemarks,
  coalesce(columns('preferredSpatialRepresentation'), null) AS preferredSpatialRepresentation
FROM file('target/dwca1/occurrence.txt', TabSeparatedWithNames);

-- create events for the occurrences
SELECT
  'Occurrence' AS eventClass,
  _occurrenceID as eventID,
  * EXCEPT (_occurrenceID, _basisOfRecord, _materialGatheringID)
FROM view_event
INTO OUTFILE 'target/dwca2/event.txt' TRUNCATE FORMAT TabSeparatedWithNames;

-- append events for the gatherings creating a new ID
SELECT
  'GatheringEvent' AS eventClass,
  _materialGatheringID AS eventID,
   * EXCEPT (_occurrenceID, _basisOfRecord, _materialGatheringID)
FROM view_event
WHERE lower(replaceAll(_basisOfRecord, '_', '')) IN ('preservedspecimen', 'materialsample')
INTO OUTFILE 'target/dwca2/event.txt' APPEND FORMAT TabSeparatedWithNames;

--
-- Occurrence events
--
SELECT
  occurrenceID AS occurrenceID,
  coalesce(columns('organismQuantity'), null) AS organismQuantity,
  coalesce(columns('organismQuantityType'), null) AS organismQuantityType,
  coalesce(columns('organismQuantityTypeIRI'), null) AS organismQuantityTypeIRI,
  coalesce(columns('organismQuantityTypeVocabulary'), null) AS organismQuantityTypeVocabulary,
  coalesce(columns('sex'), null) AS sex,
  coalesce(columns('lifeStage'), null) AS lifeStage,
  coalesce(columns('reproductiveCondition'), null) AS reproductiveCondition,
  coalesce(columns('caste'), null) AS caste,
  coalesce(columns('behavior'), null) AS behavior,
  coalesce(columns('vitality'), null) AS vitality,
  coalesce(columns('establishmentMeans'), null) AS establishmentMeans,
  coalesce(columns('degreeOfEstablishment'), null) AS degreeOfEstablishment,
  coalesce(columns('pathway'), null) AS pathway,
  coalesce(columns('occurrenceStatus'), null) AS occurrenceStatus,
  coalesce(columns('occurrenceRemarks'), null) AS occurrenceRemarks,
  coalesce(columns('organismID'), null) AS organismID,
  coalesce(columns('organismScope'), null) AS organismScope,
  coalesce(columns('organismScopeIRI'), null) AS organismScopeIRI,
  coalesce(columns('organismScopeVocabulary'), null) AS organismScopeVocabulary,
  coalesce(columns('organismName'), null) AS organismName,
  coalesce(columns('organismRemarks'), null) AS organismRemarks
FROM file('target/dwca1/occurrence.txt', TabSeparatedWithNames)
INTO OUTFILE 'target/dwca2/occurrence.txt' TRUNCATE FORMAT TabSeparatedWithNames;

--
-- Material Gathering events
--
SELECT _materialGatheringID AS materialGatheringID
FROM view_event
WHERE lower(replaceAll(_basisOfRecord, '_', '')) IN ('preservedspecimen', 'materialsample')
INTO OUTFILE 'target/dwca2/materialGathering.txt' TRUNCATE FORMAT TabSeparatedWithNames;

--
-- Create material noting this dataset has non-standard use of catalogNumbers.
--
SELECT
  otherCatalogNumbers AS materialEntityID,
  coalesce(columns('materialEntityType'), null) AS materialEntityType,
  coalesce(columns('materialEntityTypeIRI'), null) AS materialEntityTypeIRI,
  coalesce(columns('materialEntityTypeVocabulary'), null) AS materialEntityTypeVocabulary,
  coalesce(columns('institutionCode'), null) AS institutionCode,
  coalesce(columns('institutionID'), null) AS institutionID,
  coalesce(columns('ownerInstitutionCode'), null) AS ownerInstitutionCode,
  coalesce(columns('ownerInstitutionID'), null) AS ownerInstitutionID,
  coalesce(columns('collectionCode'), null) AS collectionCode,
  coalesce(columns('collectionID'), null) AS collectionID,
  coalesce(columns('catalogNumber'), null) AS catalogNumber,
  coalesce(columns('otherCatalogNumbers'), null) AS otherCatalogNumbers,
  coalesce(columns('recordNumber'), null) AS recordNumber,
  coalesce(columns('preparations'), null) AS preparations,
  coalesce(columns('disposition'), null) AS disposition,
  coalesce(columns('verbatimLabel'), null) AS verbatimLabel,
  coalesce(columns('associatedSequences'), null) AS associatedSequences,
  coalesce(columns('materialCitation'), null) AS materialCitation,
  coalesce(columns('materialEntityRemarks'), null) AS materialEntityRemarks,
  farmFingerprint64('MaterialEvent', occurrenceID) AS materialGatheringID,
  occurrenceID AS evidenceForOccurrenceID,
  coalesce(columns('derivationEventID'), null) AS derivationEventID,
  coalesce(columns('derivedFromMaterialEntityID'), null) AS derivedFromMaterialEntityID,
  coalesce(columns('derivationType'), null) AS derivationType,
  coalesce(columns('derivationTypeIRI'), null) AS derivationTypeIRI,
  coalesce(columns('derivationTypeVocabulary'), null) AS derivationTypeVocabulary,
  coalesce(columns('partOfMaterialEntityID'), null) AS partOfMaterialEntityID
FROM file('target/dwca1/occurrence.txt', TabSeparatedWithNames)
WHERE lower(replaceAll(basisOfRecord, '_', '')) IN ('preservedspecimen', 'materialsample')
INTO OUTFILE 'target/dwca2/material.txt' TRUNCATE FORMAT TabSeparatedWithNames;

--
-- Create media attached to the occurrences given this is occurrence core.
--
SELECT
  coalesce(columns('identifier'), null) AS mediaID,
  toString(id) AS mediaTargetID,
  'Occurrence' AS mediaTargetType,
  coalesce(columns('type'), null) AS mediaType,
  coalesce(columns('mediaTypeIRI'), null) AS mediaTypeIRI,
  coalesce(columns('mediaTypeVocabulary'), null) AS mediaTypeVocabulary,
  coalesce(columns('identifier'), null) AS accessURI,
  coalesce(columns('WebStatement'), null) AS WebStatement,
  coalesce(columns('format'), null) AS format,
  coalesce(columns('rights'), null) AS rights,
  coalesce(columns('rightsHolder'), null) AS Owner,
  coalesce(columns('source'), null) AS source,
  coalesce(columns('creator'), null) AS creator,
  coalesce(columns('creatorID'), null) AS creatorID,
  coalesce(columns('CreateDate'), null) AS CreateDate,
  coalesce(columns('modified'), null) AS modified,
  coalesce(columns('mediaLanguage'), null) AS mediaLanguage,
  coalesce(columns('mediaSubjectCategory'), null) AS mediaSubjectCategory,
  coalesce(columns('mediaSubjectCategoryIRI'), null) AS mediaSubjectCategoryIRI,
  coalesce(columns('mediaSubjectCategoryVocabulary'), null) AS mediaSubjectCategoryVocabulary,
  coalesce(columns('mediaDescription'), null) AS mediaDescription
FROM file('target/dwca1/images.txt', TabSeparatedWithNames)
INTO OUTFILE 'target/dwca2/media.txt' TRUNCATE FORMAT TabSeparatedWithNames;
