# BEF China Analysis Repository

This repository hosts the data and analysis scripts for the BEF China project. 

**Note:** It is highly recommended to clone this repository rather than downloading static files. The dataset and analysis code are frequently updated; cloning ensures you remain synchronized with the latest changes and have access to the most recent data adjustments.

## 🚀 Getting Started

### Cloning the Repository

To set up the project locally, follow these steps:

1.  Open your Terminal (or Command Prompt).
2.  Navigate to the directory where you want to store the project:
    ```bash
    cd /path/to/your/directory
    ```
3.  Clone the repository using one of the methods below:

    **HTTPS:**
    ```bash
    git clone [https://github.com/ag23wuji/bef_china.git](https://github.com/ag23wuji/bef_china.git)
    ```

    **SSH:**
    ```bash
    git@github.com:ag23wuji/bef_china.git
    ```

## 📂 Repository Structure

All processed and finalized datasets are located in the following directory:

`phd_bef_china/datas_and_notebooks/final_datas`

### Primary Dataset
The master dataset for analysis is named **`all_data_joined.csv`**.

## 📖 Data Dictionary

The dataset comprises **4,833 observations** across **45 variables**. It includes botanical field surveys, taxonomic details, plot environmental characteristics, plant growth metrics, and leaf damage assessments.

| Variable Name | Data Type | Description |
| :--- | :--- | :--- |
| **Identifiers & Time** | | |
| `date` | Character | Date of data collection (Format: YYYY-MM-DD). |
| `year` | Integer | Year of observation extracted from the date. |
| `month` | Integer | Month of observation. |
| `site` | Character | Broad location identifier (e.g., "a"). |
| `plot` | Character | Unique identifier for the specific study plot (e.g., "ac32"). |
| `subplot` | Character | Identifier for the sub-unit within the main plot. |
| `id` | Character | Unique identifier for the individual plant specimen. |
| **Taxonomy** | | |
| `species` | Character | Full scientific name of the plant (*Genus species*). |
| `genus` | Character | Genus name of the plant. |
| `family` | Character | Family taxonomic classification. |
| `growth_form` | Character | The habit or growth form of the plant (e.g., "shrub/tree"). |
| `seed_source_short` | Character | Code indicating the origin/source of the seed (e.g., "EI"). |
| **Plot Environmental Data** | | |
| `diversity` | Integer | Metric/index value representing diversity within the plot. |
| `tot_veg` | Numeric | Proportion (0–1) of total vegetation cover in the plot. |
| `herb_max` | Integer | Maximum height of the herbaceous layer (cm). |
| `grass` | Numeric | Proportion (0–1) of grass cover in the plot. |
| `fern` | Numeric | Proportion (0–1) of fern cover in the plot. |
| `herbaceous` | Numeric | Proportion (0–1) of herbaceous plant cover. |
| `woody` | Numeric | Proportion (0–1) of woody plant cover. |
| `open_ground` | Numeric | Proportion (0–1) of bare ground/soil. |
| `rock` | Numeric | Proportion (0–1) of rock cover. |
| `leaflitter` | Numeric | Proportion (0–1) of leaf litter cover. |
| `leaflitter_dept` | Numeric | Depth of leaf litter (cm). |
| `deadwood` | Numeric | Proportion (0–1) of dead wood cover. |
| `moss` | Numeric | Proportion (0–1) of moss cover. |
| **Plant Measurements** | | |
| `survival` | Character | Survival status code (e.g., "a", "1"). |
| `height` | Numeric | Height of the individual plant (cm). |
| `number_leaves` | Numeric | Total count of leaves on the individual plant. |
| `saplings` | Integer | Count of saplings present. |
| `seedlings` | Integer | Count of seedlings present. |
| **Damage Assessment** | | |
| `number_herb_damaged` | Integer | Count of leaves showing signs of herbivory. |
| `percent_herb` | Numeric | Overall percentage of herbivory on the plant. |
| `percent_hmin` | Numeric | Minimum estimated percentage of herbivory per leaf. |
| `percent_hmax` | Numeric | Maximum estimated percentage of herbivory per leaf. |
| `number_fungal_damaged` | Numeric | Count of leaves showing fungal infection. |
| `percent_fungal` | Numeric | Overall percentage of fungal damage on the plant. |
| `percent_fmin` | Numeric | Minimum estimated percentage of fungal damage per leaf. |
| `percent_fmax` | Numeric | Maximum estimated percentage of fungal damage per leaf. |
| `number_necrotic_damaged`| Integer | Count of leaves showing necrosis. |
| `percent_necrose` | Numeric | Overall percentage of necrosis on the plant. |
| `percent_nmin` | Numeric | Minimum estimated percentage of necrosis. |
| `percent_nmax` | Numeric | Maximum estimated percentage of necrosis. |
| **Metadata & Notes** | | |
| `notes` | Character | Field notes regarding the plot or environment. |
| `notes2` | Character | Additional observations or comments. |
| `type` | Character | Experimental type or category. |

## 📧 Contact & Support

If you are new to GitHub collaboration or encounter any issues with the data, please feel free to reach out.

**Email:** [godbersengodber@gmail.com](mailto:godbersengodber@gmail.com)
