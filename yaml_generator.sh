#!/bin/bash

# Directories
SEQ_DIR="sequences"
LIG_DIR="ligands"
OUT_DIR="yamls"

mkdir -p "$OUT_DIR"

# Loop over all sequence files
for seqfile in "$SEQ_DIR"/*.fasta; do
    seqname=$(basename "$seqfile" .fasta)
    sequence=$(awk 'NR>1{print}' "$seqfile" | tr -d '\n')
    msa_file="/MSA/${seqname}.a3m"

    # Loop over all ligand files
    for ligfile in "$LIG_DIR"/*.txt; do
        ligname=$(basename "$ligfile" .txt)
        smiles=$(head -n 1 "$ligfile" | tr -d '\n')
        yaml_file="${OUT_DIR}/${seqname}_${ligname}.yaml"

        # Write YAML
        cat > "$yaml_file" <<EOF
msa: $msa_file
sequence: "$sequence"
smiles: "$smiles"
EOF
    done
done
