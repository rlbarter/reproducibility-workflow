# Reproducbility workflow

Every project should consist of a single well structured directory with meaningful subdirectories. Every project should be its own git repository that is hosted on GitHub.

Data cleaning and analyses should be carefully documented in a Jupyter Notebook or R markdown file and should be created with reproducibility in mind. Everyone on the team (and future you) should be able to re-create what you have performed.

The overall purpose is to have an organized project structure in place so that the project is easily approachable to many different individuals.

> Someone unfamiliar with your project should be able to look at your computer files and understand in detail what you did and why - Bill Noble

An example of a reproducible project that follows this workflow lives in the `project_example/` folder.

## Project Structure

The project will typically consist of the following subdirectories:

### Data

Original raw data files data should be backed up on something like Google Drive, Dropbox or Box. The raw data itself should never be touched manually. Instead, you should have scripts or notebooks that load the raw data into an R or Python environment for in-environment data manipulation (this will not modify the raw data files themselves).

Any data that is produced by code should be saved in the `data/processed_data/` subdirectory.

### Documents

This is a good place to keep meeting notes, data dictionaries, and any other associated materials.


### Code

There are three types of code documents:

1. **Function scripts** (.R, .py): scripts that contain reusable functions that will be called in the action scripts below (and possibly in the exploration notebooks). By convention, function scripts are given the name `xx_funs_yy.R`, where `xx` is a number and `yy` describes what the functions are for (e.g. `01_funs_clean_data.R`).

1. **Action scripts** (.R, .py): scripts that perform activities such as a detailed data cleaning pipeline, or running many models. Often these scripts will load in data, do something to it (e.g. clean it or fit a model to it) and will then save a new object (such as a cleaned dataset or model results). By convention, action scripts are given the name `xx_do_yy.R`, where `xx` is a number and `yy` describes what action is undertaken by running the script (e.g. `01_do_clean_data.R`).

1. **Exploration notebooks** (.Rmd, .ipynb): R Markdown or Jupyter notebook files that are used to produce figures and explanatory files that contain figures and explanations of data cleaning steps and results of analyses. These are the files that an external viewer would find useful to understand your data and analysis.

Scripts that are run sequentially are numbered accordingly. An example of a project structure is shown below. Note that in the example below the functions folder is nested as a subdirectory of the scripts folder which contains the actionable scripts. This makes sense when the functions are only called in the actionable scripts (but not in the exploration notebooks).


```
project
│   README.md
└───data/
│       └───raw_data/
│           │   data_orig.csv
│       └───processed_data/
│           │   data_clean.csv
│       └───results/
│           │   model_results.csv
└───documents/
│       meeting_notes.md
│       data_dictionary.md
└───code/
│       └───exploration/
│           │   01_data_exploration.Rmd
│           │   02_model_results.Rmd
│       └───scripts/
│           │   01_do_clean_data.R
│           │   02_do_model_data.R
│           └───functions/
│               │   01_funs_clean_data.R
│               │   02_funs_model_data.R

```

## Syntax and conventions

All filenames are always lowercase and use underscores to separate words.

Code should follow an appropriate style guide:

- R: [Tidyverse Style Guide](https://style.tidyverse.org/) (based on the R Google Style Guide)
- Python: [Google Style Guide](https://google.github.io/styleguide/pyguide.html) or [PEP 8 Style Guide](https://www.python.org/dev/peps/pep-0008/)


## Resources

- I wrote a much more detailed blog post on my workflow a few years ago that can be found here: http://www.rebeccabarter.com/blog/2017-08-16-data-science-workflow/. My workflow has changed a bit since then, but the underlying ideas are all more or less the same.

- William Noble's article on organizing computational biology projects: https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1000424

- Marwick, Boettiger and Mullen's article on packaging data analytical work reproducibly: https://ro.uow.edu.au/cgi/viewcontent.cgi?article=6445&context=smhpapers

## Acknowledgements

Thanks very much to Ciera Martinez for sharing her [project workflow](https://github.com/DiscoveryDNA/team_neural_network/blob/master/data_managment.md).

I'd also like to acknowledge the *Meta Research and Best Practices* working group (formerly the *Reproducility working group*) at the Berkeley Institute for Data Science (BIDS) for insightful discussions that have helped me form my own workflow over the years.
