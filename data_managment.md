# Data Management

This is an overview of data management strategies for this project.  The overall purpose is to have an organized data system in place so that the project is easily approachable to many different individuals.

Each project is unique and thus requires unique project management, therefore this is a living document which evolves with the project. 

## Project Structure

- Scripts that are run sequentially are numbered accordingly

### Naming Conventions

- **file and directory names**
    + lowercase and underscores for filenames
-  **code**
    +  follow program style guide
        *  Python: [Google Style Guide](https://google.github.io/styleguide/pyguide.html)

**Example Project Structure**

```
project_title/
	├── notes/
	|   ├── binding_site_notes.md
	|   └── neural_network_notes.md
	├── code/
	|   ├── 1_cleaning.py
	|   ├── 2_analyze.py
	|   └── 3_visualize.py
	├── data/
	│   ├── input/
	|     └── all_sites_raw_13Feb2018.py
	│   └── output/
	|     ├── thresholds_bcd_17Feb2018.py
	|     └── thresholds_kru_17Feb2018.py
	└── README.md
```

## Scientific Notebooks and organization of our code directory

We are doing scientific experiments therefore we need to be keeping track of our work in a scientific notebook.  Each notebook needs to have a clearly identifiable reason for existing.

-  Each experiment we are testing should be a seperate Jupyter notebook in the `/code` directory. If you are testing similar parameters for the same variable it is okay to leave in one notebook.  For example, if you are testing how accuracy changes when trying 1,5 and 10 layers, it is okay to use one notebook. Think about what makes most sense.
-  Each notebook should include the date (year-month-day) and a brief title that makes sense.
	ex: `2018-07-10_layer_numbers.ipynb`.  Use the same title for similar experiments. If you are doing a step by step code, please include numbers to verify ex: `2018-07-10_layer_numbers_1.ipynb` and `2018-07-10_layer_numbers_2.ipynb`
- Each notebook should have Specific sections that need to be included in every notebook.
	- **Date**:
	- **Author(s)**:
	- **Purpose**: Ex: In order to test the accuracy when adding layers, we will run this experiment. 
	- **Background**: Anything you need to know to understand the reasoning and rerun the experiment.
		-  Is this experiment based off the results of another notebook? Clearly state which previous notebook.
		-  What data is being used? 
		-  Which subset of data?
	- **Experiment**: This is where you put the code with comments. 
	- **Results**: This is where you can summarize the results. Spend time to make visualization if it makes explaining the results easier.
	- **Conclusions**: 
		-  What conclusions can you make from these results? 
		-  Did you find something that works and we should keep using? 
		-  Did you find out that does not work and we should stop using
		-  **What are the next experiments to try?**

## Code

-   organize source code in logical units or building blocks
-   be liberal on comments
-   separate source code from editing stuff, especially for large project -- partly overlapping with previous item and reporting
-   Document everything, with e.g. or consistent self-annotation in the source file 
-   [R] Custom functions can be put in a dedicated file 
-   write tests that verify your expectations of your code
   
## Metadata

- READMEs
    -   Update README.md with vital information about repo or directory
    -   What are the files? Where did they come from? How were they created? 
    -   What major conclusions were found? What needs to be done?
    -   Keeping the READMEs up-to-date
    -   When changing something in a directory, you should add a line at the README

## Data 

- All output data is kept in data/output and tagged with date of creation.
- Raw data is kept raw.  
- Do not manually edit data.
- If data is under 100MB keep in project repository 
- Keep data over 100MB in [Google Drive Discovery / DNA_shared_data](https://drive.google.com/drive/folders/1kAh9NPg0gin4KIYvdz2Czi1LCQ2Js06X)

## Version Control

Version control is handled by git and the project repository is kept on Github. If there is any type of idea for code improvement make a issue.

## To make changes to the project 

-  fork repository, so you have your own copy
-  make changes
-  create pull request
-  have someone else review and accept the pull request


