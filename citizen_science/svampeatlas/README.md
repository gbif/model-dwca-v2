## DwC-A to DwC-A2 conversion for Svampeatlas

Prerequisites: `python` 

### Install clickhouse

```
curl https://clickhouse.com/ | sh
```

### Download and inflate the DwC-A1 version

```
rm -fr target && mkdir -p target
curl -Lo target/dwca1.zip http://svampe.databasen.org/dwc/dwcarchive.zip
unzip target/dwca1.zip -d target
mv target/dwcarchive target/dwca1
```

### Create a DwC-A2 version

This will use `clickhouse-local` as a transformation engine with SQL scripts per entity.
The use of `farmFingerprint64` as the identifier hashing scheme is an arbitrary choice 
(i.e. someone should explore hashing properly and offer a recommendation).

Add headers
```
python3 metaToHeader.py target/dwca1/meta.xml target/dwca1
cat target/dwca1/occurrence.txt >> target/dwca1/occurrenceHeader.txt && mv -f target/dwca1/occurrenceHeader.txt target/dwca1/occurrence.txt
cat target/dwca1/images.txt >> target/dwca1/imagesHeader.txt && mv -f target/dwca1/imagesHeader.txt target/dwca1/images.txt
cat target/dwca1/sequences.txt >> target/dwca1/sequencesHeader.txt && mv -f target/dwca1/sequencesHeader.txt target/dwca1/sequences.txt
```

Run the conversions
```
mkdir -p target/dwca2
./clickhouse local --queries-file process.sql 
```
