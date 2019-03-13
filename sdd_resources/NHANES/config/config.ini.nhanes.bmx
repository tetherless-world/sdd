[Prefixes]
# Specify a file with the prefixes for existing ontologies used in your translation
prefixes = NHANES/config/prefixes.csv
# Specify the base uri to be associated with all triples minted by the script
base_uri = nhanes-kb

[Source Files]
dictionary = NHANES/input/DM/BMX_H_Doc-DM.csv
codebook = NHANES/input/CB/BMX_H_Doc-CB.csv
#timeline = NHANES/input/TL/BMX_H_Doc-TL.csv
data_file = NHANES/input/Data/nhanes_bmx_subset.csv
code_mappings = NHANES/config/code_mappings.csv
infosheet = NHANES/config/Infosheet.csv
properties = NHANES/config/Properties.csv

[Output Files]
out_file = NHANES/output/trig/bmx-kg.trig
query_file = NHANES/output/sparql/bmxQuery
swrl_file = NHANES/output/swrl/bmxSWRL
