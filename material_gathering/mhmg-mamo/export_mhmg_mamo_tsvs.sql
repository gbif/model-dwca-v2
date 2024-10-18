-- Export the output table to TSV files
\COPY agent TO './output_data/agent.tsv' WITH (FORMAT TEXT, DELIMITER E'\t', NULL '', HEADER);
\COPY "assertion" TO './output_data/assertion.tsv' WITH (FORMAT TEXT, DELIMITER E'\t', NULL '', HEADER);
\COPY citation TO './output_data/citation.tsv' WITH (FORMAT TEXT, DELIMITER E'\t', NULL '', HEADER);
\COPY collection TO './output_data/collection.tsv' WITH (FORMAT TEXT, DELIMITER E'\t', NULL '', HEADER);
\COPY event TO './output_data/event.tsv' WITH (FORMAT TEXT, DELIMITER E'\t', NULL '', HEADER);
\COPY genetic_sequence TO './output_data/genetic_sequence.tsv' WITH (FORMAT TEXT, DELIMITER E'\t', NULL '', HEADER);
\COPY identification TO './output_data/identification.tsv' WITH (FORMAT TEXT, DELIMITER E'\t', NULL '', HEADER);
\COPY identifier TO './output_data/identifier.tsv' WITH (FORMAT TEXT, DELIMITER E'\t', NULL '', HEADER);
\COPY material TO './output_data/material.tsv' WITH (FORMAT TEXT, DELIMITER E'\t', NULL '', HEADER);
\COPY media TO './output_data/media.tsv' WITH (FORMAT TEXT, DELIMITER E'\t', NULL '', HEADER);
\COPY occurrence TO './output_data/occurrence.tsv' WITH (FORMAT TEXT, DELIMITER E'\t', NULL '', HEADER);
