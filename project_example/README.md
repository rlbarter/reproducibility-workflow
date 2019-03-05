# Organs project

This repository contains the code and data for the global organ donation project.

The original data can be downloaded from the [World Health Organization (WHO) Global Observatory on Donation and Transplantation (GODT)](http://www.transplant-observatory.org/export-database/), but is also contained in the `data/raw_data` subdirectory.


## Contents:


### documents/

This subdirectory contains our meeting notes (meeting_notes.md) and the data dictionary

### code/

The `code/` directory contains an RStudio project and two subdirectories, `exploration/` which contains R Markdown exploratory analyses, and `scripts/` which contains all the code for actually cleaning, combining, and generating the data. **All paths in the scripts are relative to the `code/` base** (where the `.Rproj` file lives).

In the `scripts/` subdirectory, functions live in the `functions/` subdirectory and all have the naming convention `xx_funs_yy.R`. Action scripts which call the functions all have the naming convention `xx_run_yy.R`.

Each `.R` script has a summary at the top of what it does. The scripts are numbered in the order in which they would typically be run.

### data/

The original data is stored in the `data/raw_data/` subdirectory.

Any data that is produced using code is contained in `data/processed_data/`.

Modeling results are saved in the `data/results/` subdirectory
