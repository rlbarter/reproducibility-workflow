# Surgical-Site-Infections

This repository contains the code for the Surgical Site Infections (SSI) project in collaboration with UC Davis.

The data is located in the box folder and should be downloaded directly and saved as a `data` folder at the base level of the directory.

The code that lives here will also be added to the box folder, but this is more for the benefit of those who don't use git.

## Contents:


### documents/

The most useful files in the `documents/` directory are

- `documents/meeting_notes/Agenda_SSI_7.26.2018.docx` which provides a summary of the project prepared by Prabhu and Parul at our first meeting

- `documents/meeting_notes/CITRIS meeting notes.gdoc`, which is a running summary of our bi-weekly meetings.

- `documents/meeting_notes/analytic_summary.gdoc` contains a summary of the analytic process that is captured by the code.

There is a **data dictionary** for the `denominators` (surgical encounters) file that can be found at

- `documents/CDC and NHSN materials/Denominator Data Dictionary SSI Project_8.29.docx`


### code/

The `code/` directory contains an RStudio project and two subdirectories, `exploration/` which contains R Markdown exploratory analyses, and `scripts/` which contains all the code for actually cleaning, combining, and generating the data. **All paths are relative to the `code/` base** (where the `.Rproj` file lives).

In the `scripts/` subdirectory, functions live in the `functions/` subdirectory and all have the naming convention `xx_funs_yy.R`. Action scripts which call the functions all have the naming convention `xx_run_yy.R`.

Each `.R` script has a summary at the top of what it does. The scripts are numbered in the order in which they would typically be run.

### data/

Note that the data needs to be downloaded from the Box folder and saved as a top-level folder called `data`. The subdirectories that contain **raw data** are as follows:

- `data/SSI cases 2014-17/` contains an excel file that indicates which patients had an SSI (surgical site infection) event.

- `data/Surgical encounters/` contains the lab data, medication data, diagnosis data, problem list data, denominators data and vitals data, separated by year. Note that the **denominators** dataset is the one that contains information on the patient and surgery for each surgical encounter. This dataset is typically loaded into R as an object called `surgical_encoutners`.

- `data/additional data/` contains raw data that was obtained after the initial data dump. This data was typically obtained when we realized that additional information would be useful.

Finally, any data that is produced using code is contained in `data/processed_data/`



### misc/

This directory contains any temporary analyses done usually to answer a question someone asked of the data, but that is not actually necessary for the analysis but is worth saving.
