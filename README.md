# Reproducbility workflow

Every project should consist of a single well structured directory with meaningful subdirectories. Every project should be its own git repository that is hosted on GitHub.

Data cleaning and analyses should be carefully documented in a Jupyter Notebook or R markdown file and should be created with reproducibility in mind. Everyone on the team (and future you) should be able to re-create what you have performed.

The overall purpose is to have an organized project structure in place so that the project is easily approachable to many different individuals.

> Someone unfamiliar with your project should be able to look at your computer files and understand in detail what you did and why - Bill Noble


## The data

Original raw data files data should be backed up on something like Google Drive, Dropbox or Box. The raw data itself should never be touched manually. Instead, you should have scripts or notebooks that load the raw data into an R or Python environment for in-environment data manipulation (this will not modify the raw data files themselves).

## Project Structure

There are three types of code documents:

1. **Function scripts** (.R, .py): scripts that contain reusable functions that will be called in action scripts (and possibly exploration notebooks)

1. **Action scripts** (.R, .py): scripts that perform activities such as a detailed data cleaning pipeline, or running many models.

1. **Exploration notebooks** (.Rmd, .ipynb)

Scripts that are run sequentially are numbered accordingly

### Naming Conventions

- **file and directory names**
    + lowercase and underscores for filenames
-  **code**
    +  follow program style guide
        *  Python: [Google Style Guide](https://google.github.io/styleguide/pyguide.html)
        *  R:

**Example Project Structure**

```
project_title/
	├── documents/
	|   ├── meeting_notes.md
	|   └── data_dictionary.md
	├── code/
  |   ├── exploration/
  |     ├── 01_eda.Rmd
  |     └── 02_model_results.Rmd
	|   └── scripts/
  |     ├── 01_do_clean_data.R
  |     ├── 02_do_model.R
  |     └── functions/
  |       ├── 01_funs_clean.R
  |       └── 02_funs_model.R
	├── data/
	│   ├── raw_data/
  |     ├──
	|     └──
	│   └── processed_data/
	|     ├──
	|     └──
	└── README.md
```


## Resources

- I wrote a much more detailed blog post on my workflow a few years ago that can be found here: http://www.rebeccabarter.com/blog/2017-08-16-data-science-workflow/. My workflow has changed a bit since then, but the underlying ideas are all more or less the same.

-

## Acknowledgements

Thanks very much to Ciera Martinez for sharing her [project workflow](https://github.com/DiscoveryDNA/team_neural_network/blob/master/data_managment.md).
