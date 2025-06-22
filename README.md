# Boltz YAML Generator

This repository contains a small script for producing YAML configuration files used by the [Boltz-2](https://github.com/plasmapolis/boltz-2) pipeline.  It combines protein sequences with ligand structures so that each YAML file describes one protein--ligand pair.

## Usage

1. Place FASTA formatted protein sequences in the `sequences/` directory.
2. Place ligand SMILES strings in text files under `ligands/`.
3. Run the generator:

```bash
bash yaml_generator.sh
```

The resulting YAML files will appear in the `yamls/` directory.

An example fragment of a generated file looks like:

```yaml
version: 1  # Optional, defaults to 1
sequences:
  - protein:
      msa: /MSA/hM3R.a3m
      id: A
      sequence: MTLHNNSTTSPLFPNISSSWIHSPSDAGLPPG...
  - ligand:
      id: B
      smiles: 'CC(=O)OCC[N+](C)(C)C'
properties:
  - affinity:
      binder: B
```

Each entry specifies the MSA path, the protein sequence, the ligand SMILES string, and additional properties required by Boltz-2.
