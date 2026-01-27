---
  title: An R Markdown document converted from "phd_bef_china/notebook.ipynb"
output: html_document
---
  
# Install and load packages 
  
  {r message=FALSE, warning=FALSE, include=TRUE, paged.print=TRUE}
if (!requireNamespace("remotes", quietly = TRUE)) {
  install.packages("remotes")
}

if (!requireNamespace("corrplot", quietly = TRUE)) {
  install.packages("corrplot")
}

if (!requireNamespace("broom.mixed", quietly = TRUE)) {
  install.packages("broom.mixed")
}

if (!requireNamespace("psych", quietly = TRUE)) {
  install.packages("psych")
}

if (!requireNamespace("factoextra", quietly = TRUE)) {
  install.packages("factoextra")
}

if (!requireNamespace("ggExtra", quietly = TRUE)) {
  install.packages("ggExtra")
}

if (!requireNamespace("janitor", quietly = TRUE)) {
  install.packages("janitor")
}

if (!requireNamespace("lubridate", quietly = TRUE)) {
  install.packages("lubridate")
}

if (!requireNamespace("readr", quietly = TRUE)) {
  install.packages("readr")
}

if (!requireNamespace("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2")
}

if (!requireNamespace("dplyr", quietly = TRUE)) {
  install.packages("dplyr")
}

if (!requireNamespace("viridis", quietly = TRUE)) {
  install.packages("viridis")
}

if (!requireNamespace("ggridges", quietly = TRUE)) {
  install.packages("ggridges")
}

if (!requireNamespace("sjPlot", quietly = TRUE)) {
  install.packages("sjPlot")
}

if (!requireNamespace("see", quietly = TRUE)) {
  install.packages("see")
}

if (!requireNamespace("gtsummary", quietly = TRUE)) {
  install.packages("gtsummary")
}

if (!requireNamespace("lme4", quietly = TRUE)) {
  install.packages("lme4")
}

if (!requireNamespace("performance", quietly = TRUE)) {
  install.packages("performance")
}

if (!requireNamespace("broom", quietly = TRUE)) {
  install.packages("broom")
}

if (!requireNamespace("naniar", quietly = TRUE)) {
  install.packages("naniar")
}

if (!requireNamespace("cluster", quietly = TRUE)) {
  install.packages("cluster")
}

if (!requireNamespace("fastDummies", quietly = TRUE)) {
  install.packages("fastDummies")
}

if (!requireNamespace("clValid", quietly = TRUE)) {
  install.packages("clValid") 
}

if (!requireNamespace("ggbiplot", quietly = TRUE)) {
  install.packages("ggbiplot") 
}

if (!requireNamespace("reshape2", quietly = TRUE)) {
  install.packages("reshape2") 
}

if (!requireNamespace("ggcorrplot", quietly = TRUE)) {
  install.packages("ggcorrplot") 
}

if (!requireNamespace("glmmTMB", quietly = TRUE)) {
  install.packages("glmmTMB") 
}

if (!requireNamespace("ggstatsplot", quietly = TRUE)) {
  install.packages("ggstatsplot") 
}

if (!requireNamespace("mice", quietly = TRUE)) {
  install.packages("mice") 
}

if (!requireNamespace("effects", quietly = TRUE)) {
  install.packages("effects") 
}

if (!requireNamespace("patchwork", quietly = TRUE)) {
  install.packages("patchwork") 
}

if (!requireNamespace("pheatmap", quietly = TRUE)) {
  install.packages("pheatmap") 
}

if (!requireNamespace("plotly", quietly = TRUE)) {
  install.packages("plotly") 
}

if (!requireNamespace("tidyverse", quietly = TRUE)) {
  install.packages("tidyverse") 
}

if (!requireNamespace("readxl", quietly = TRUE)) {
  install.packages("readxl") 
}
if (!requireNamespace("datawizard", quietly = TRUE)) {
  install.packages("datawizard")
}

if (!requireNamespace("fastDummies", quietly = TRUE)) {
  install.packages("fastDummies")
}

if (!requireNamespace("factoextra", quietly = TRUE)) {
  install.packages("factoextra")
}

if (!requireNamespace("wesanderson", quietly = TRUE)) {
  install.packages("wesanderson")
}

if (!requireNamespace("vegan", quietly = TRUE)) {
  install.packages("vegan")
}

if (!requireNamespace("fossil", quietly = TRUE)) {
  install.packages("fossil")
}

library(tidyverse)
library(janitor)
library(readxl)
library(vegan)
library(factoextra)

# List all .xlsx files in the current working directory
xlsx_files <- list.files(
  path = "datas_and_notebooks/2023/september_23", 
  pattern = "\\.xlsx$", 
  full.names = TRUE
) # Store file paths in 'xlsx_files'

# Read all .xlsx files into a named list of data frames
xlsx_data <- lapply(xlsx_files, readxl::read_excel) # Read all Excel files into a list
names(xlsx_data) <- basename(xlsx_files) # Name the list elements with the original filenames

xlsx_data # Display the list of data frames


## Create a new dataset containing information about growth form and family of the species


genus <- c('quercus','dalbergia','rhododendron','ilex','loropetalum','camellia','nyssa','eurya','symplocos','ardisia','buddleja','styrax',NA,'trema','musseanda','lindera','syzygium','adinandra','smilax','lithocarpus','clerodendrum','calicarpa','cinnamomum','castanea','itea','manglietia','actinidia','premna','osmanthus','alniphyllum','crataegus','schoepfia','rhaphiolepis','betula','machilus','castanopsis','photinia','litsea','distylium','euonymus','rosa','vaccinium','fraxinus','liquidambar','unknown','centaurea','pterostyrax','euscaphis','melia','rhus','not-liquidambar','viburnum','fern','albizia','rubus','phyllostachys','broussonetia','aralia','toxicodendron','ailanthus') # Vector of genus names

family <- c('Fagaceae','Fabaceae','Ericaceae','Aquifoliaceae','Hamamelidaceae','Theaceae','Nyssaceae','Pentaphylacaceae','Symplocaceae','Primulaceae','Scrophulariaceae','Styracaceae',NA,'Cannabaceae','Rubiaceae','Lauraceae','Myrtaceae','Pentaphylacaceae','Smilacaceae','Fagaceae','Lamiaceae','Lamiaceae','Lauraceae','Fagaceae','Iteaceae','Magnoliaceae','Actinidiaceae','Lamiaceae','Oleaceae','Styracaceae','Rosaceae','Schoepfiaceae','Rosaceae','Betulaceae','Lauraceae','Fagaceae','Rosaceae','Lauraceae','Hamamelidaceae','Celastraceae','Rosaceae','Ericaceae','Oleaceae','Altingiaceae',NA,'Asteraceae','Styracaceae','Staphyleaceae','Meliaceae','Anacardiaceae',NA,'Adoxaceae','Polypodiopsida','Fabaceae','Rosaceae','Poaceae','Moraceae','Araliaceae','Anacardiaceae','Simaroubaceae') # Vector of family names

growth_form <- c('tree', 'tree', 'shrub/tree', 'shrub/tree', 'shrub', 
                 'shrub/tree', 'tree', 'shrub/tree', 'shrub/tree', 'shrub', 'shrub', 
                 'shrub/tree', 'unknown', 'tree', 'shrub/tree', 'shrub/tree', 
                 'shrub/tree', 'shrub/tree', 'liana/shrub', 'tree', 
                 'shrub/tree/vine', 'shrub/tree', 'tree', 'tree', 'shrub', 'tree', 
                 'liana', 'tree/shrub', 'shrub/tree', 'tree', 'shrub/tree', 
                 'shrub/tree', 'shrub/tree', 'tree/shrub', 'tree/shrub', 'tree', 
                 'shrub/tree', 'tree/shrub', 'shrub/tree', 'shrub/tree/liana', 
                 'shrub/liana', 'shrub/herb', 'tree', 'tree', 'unknown', 'herb', 
                 'tree/shrub', 'tree/shrub', 'tree', 'shrub/tree', 'unknown', 
                 'shrub/tree', 'herb/tree', 'tree/shrub', 'shrub/liana/herb', 
                 'shrub/tree', 'tree', 'herb/shrub/tree', 'shrub/tree/liana', 'tree') # Vector of growth forms

# Erstellen des Data Frames

genus_family_df <- data.frame(genus, family, growth_form, stringsAsFactors = FALSE) |> # Create the data frame
  janitor::clean_names() |> # Clean column names (e.g., lowercase and replace spaces with underscores)
  dplyr::mutate(family = tolower(family), growth_form = case_when(genus == "aralia" ~ "tree", genus == "clerodendrum" ~ "shrub/tree", genus == "rubus" ~ "shrub", genus == "vaccinium" ~ "shrub/tree", genus == "euonymus" ~ "shrub/tree", genus == "toxidodendron" ~ "shrub/tree",  TRUE ~ growth_form)) |> # Convert family to lowercase and manually correct/standardize some growth forms
  mutate(growth_form = str_replace_all(growth_form, "tree/shrub", "shrub/tree"), growth_form = str_replace_all(growth_form, "liana/shrub", "shrub/liana")) # Standardize growth form descriptions by reordering terms
genus_family_df # Display the resulting data frame


## Cleaning process of the datasets


# Clean column names, trim/tolower all character columns, and convert "na" strings to NA
xlsx_data <- lapply( # Apply the function to every data frame in the list 'xlsx_data'
  xlsx_data,
  function(df) {
    df <- clean_names(df) # Clean column names using janitor::clean_names()
    df <- df %>%
      mutate(across(
        where(is.character), # Apply the transformation to all character columns
        ~ {
          x <- str_trim(tolower(.)) # Trim whitespace and convert to lowercase
          x[x == "na"] <- NA_character_ # Convert "na" string values to R's missing value NA
          x
        }
      ))
    df # Return the cleaned data frame
  }
)



# Print column names of each dataset in xlsx_data
for (name in names(xlsx_data)) { # Loop through the names of the data frames in the list
  cat("Columns in", name, ":\n") # Print the name of the current dataset
  print(str(xlsx_data[[name]])) # Print the structure (including column names and types) of the current dataset
  cat("\n")
}


  

# Find common column names across all data frames in xlsx_data
common_colnames <- Reduce(intersect, lapply(xlsx_data, colnames)) # Find the intersection of column names from all data frames
common_colnames # Display the list of common column names



# List all .xlsx files in the current working directory
#xlsx_files <- list.files(pattern = "\\.xlsx$", full.names = TRUE) # Get the full paths of all Excel files in the current directory

# Read all .xlsx files into a named list of data frames
#xlsx_data <- lapply(xlsx_files, read_excel) # Read the files into a list
#names(xlsx_data) <- basename(xlsx_files) # Name the list elements with the filenames

# Clean column names, trim/tolower all character columns, convert "na" strings to NA,
# and replace "," between two digits with "."
xlsx_data <- lapply(
  xlsx_data,
  function(df) {
    df <- clean_names(df) # Clean column names (standardize format)
    df <- df %>%
      mutate(across(
        where(is.character), # Apply transformation to character columns
        ~ {
          x <- str_trim(tolower(.)) # Trim whitespace and convert to lowercase
          x[x == "na"] <- NA_character_ # Convert "na" string to R's NA
          # Replace "," between two digits with "." (for decimal conversion)
          x <- str_replace_all(x, "(?<=\\d),(?=\\d)", ".")
          x
        }
      ))
    df
  }
)



# Display each dataset in xlsx_data (show in notebook, not print)
xlsx_data$sapling_survey_september_2023_2.xlsx # Display data frame 2
xlsx_data$sapling_survey_september_2023_3.xlsx # Display data frame 3
xlsx_data$sapling_survey_september_2023_4.xlsx # Display data frame 4
xlsx_data$sapling_survey_september_2023_5.xlsx # Display data frame 5
#xlsx_data$sapling_survey_september_2023_2.xlsx # (Commented out)



str(xlsx_data) # Display the structure of the list 'xlsx_data' (list of data frames)



# Custom cleaning function for all data frames
xlsx_data <- lapply( # Apply the custom cleaning to all data frames
  xlsx_data,
  function(df) {
    df <- df %>%
      mutate(across(
        where(is.character),
        ~ {
          x <- .
          # Remove all "/"
          x <- str_replace_all(x, "/", "")
          # Replace "absent" (case-insensitive) with NA
          x[tolower(x) == "absent"] <- NA_character_
          # Replace digit followed by "b" (e.g., 0.3b) with just the digit part
          x <- str_replace_all(x, "(\\d+(?:\\.\\d+)?)b", "\\1")
          # Replace "à?à\" with "0.01"
          x <- str_replace_all(x, "à\\?à\\\\", "0.01")
          x <- str_replace_all(x, "à", NA_character_)
          # Replace "?" with "."
          x <- str_replace_all(x, "\\?", ".")
          # Replace " - " (space-dash-space) with "-"
          x <- str_replace_all(x, " - ", "-")
          x
        }
      ))
    df
  }
)

# Special cleaning for percent_damage_fp in sapling_survey_september_2023_5.xlsx
if ("sapling_survey_september_2023_5.xlsx" %in% names(xlsx_data)) { # Check if data frame 5 exists
  df5 <- xlsx_data[["sapling_survey_september_2023_5.xlsx"]] # Extract data frame 5
  if ("percent_damage_fp" %in% names(df5)) { # Check if the specific column exists
    # Replace all "," with "0." in percent_damage_fp
    df5$percent_damage_fp <- str_replace_all(df5$percent_damage_fp, ",", "0.")
    xlsx_data[["sapling_survey_september_2023_5.xlsx"]] <- df5 # Update data frame 5 in the list
  }
}

# Remove columns x11, x14, x17 from sapling_survey_september_2023_5.xlsx
if ("sapling_survey_september_2023_5.xlsx" %in% names(xlsx_data)) { # Check if data frame 5 exists
  df5 <- xlsx_data[["sapling_survey_september_2023_5.xlsx"]] # Extract data frame 5
  cols_to_remove <- c("x11", "x14", "x17") # Define columns to be removed
  df5 <- df5[, !(names(df5) %in% cols_to_remove), drop = FALSE] # Remove the specified columns
  xlsx_data[["sapling_survey_september_2023_5.xlsx"]] <- df5 # Update data frame 5 in the list
}

if ("sapling_survey_september_2023_4.xlsx" %in% names(xlsx_data)) { # Check if data frame 4 exists
  df4 <- xlsx_data[["sapling_survey_september_2023_4.xlsx"]] # Extract data frame 4
  cols_to_remove <- c("x260") # Define column to be removed
  df4 <- df4[, !(names(df4) %in% cols_to_remove), drop = FALSE] # Remove the specified column
  xlsx_data[["sapling_survey_september_2023_4.xlsx"]] <- df5 # **Note:** This line is likely an error in the original code, as it assigns `df5` (data frame 5) instead of `df4` back to the list for data frame 4. Assuming the intent was to update df4: `xlsx_data[["sapling_survey_september_2023_4.xlsx"]] <- df4`
}


## Joining the clean datasets into one


# Assuming xlsx_data is a list of dataframes
# Perform a full join of all dataframes in xlsx_data
df_full_joined <- reduce(xlsx_data, full_join) # Perform a full join iteratively across all data frames in the list

str(df_full_joined) # Display the structure of the resulting joined data frame


  

(df_full_joined_2 <- df_full_joined %>%
    mutate(
      growth_form = case_when( # Assign growth form based on specific 'species' values
        species == "fern" ~ "fern",
        species == "herb" ~ "herb",
        species == "woody recruit" ~ "tree/shrub",
        TRUE ~ NA_character_ # Assign NA for all other cases
      )
    ) %>%
    mutate(across(where(is.character), str_trim)) %>% # Trim leading/trailing whitespace from all character columns
    mutate(
      site = ifelse(startsWith(plot, "b"), "b", site), # Infer 'site' as 'b' if 'plot' starts with 'b'
      number_leaves = ifelse( # Fill missing 'number_leaves' using 'leaves' column if 'leaves' is not missing
        (is.na(number_leaves) | number_leaves == "" | number_leaves == "NA") & 
          !(is.na(leaves) | leaves == "" | leaves == "NA"),
        leaves,
        number_leaves
      ),
      notes = ifelse((species == "look at photo"), "look at photo (3)", notes), # Standardize 'notes' for species 'look at photo'
      species = case_when( # Correct spelling mistakes, standardize names, and fix IDs for 'species' column
        id == "737x" ~ "fern",
        id == "963" ~ "trema cannabina",
        id == "392" ~ "distylium buxifolium",
        species == "444" ~ "clerodendrum cyrtophyllum",
        species == "clerodendrum cyrtophyllum (444)" ~ "clerodendrum cyrtophyllum",
        species == "1171" ~ "lindera reflexa",
        species == "307" ~ "ilex suaveolens",
        id == "1294" ~ "eurya muricata", 
        id == "1294" ~ "eurya muricata", 
        id == "1242" ~ "pterostyrax corymbosus",
        id == "1021" ~ "premna microphylla",
        id == "1217" ~ "camellia fraterna",
        id == "1390" ~ "buddleja lindleyana",
        species == "si" ~ "ilex ficoidea",
        species == "calicarpa sp" ~ "calicarpa sp.",
        species == "camellis sinensis" ~ "camellia sinensis",
        species == "camerllia sinensis" ~ "camellia sinensis", 
        species == "adinandra milletti" ~ "adinandra millettii", 
        species == "castanopsis fargesi" ~ "castanopsis fargesii", 
        species == "cinammomum camphora" ~ "cinnamomum camphora",
        species == "knoopkruid" ~ "centaurea jacea", 
        species == "lithicarpus glaber" ~ "lithocarpus glaber", 
        species == "pterostryax corymbosus" ~ "pterostyrax corymbosus",
        species == "rosa" ~ "rosa sp.",
        species == "rubus cotchotifolius" ~ "rubus corchorifolius",
        species == "schoepia jasminodora" ~ "schoepfia jasminodora",
        species == "smlax china" ~ "smilax china",
        species == "seedling (cfr. litea)" ~ "litea sp.",
        species == "xxx" ~ "unknown sp.",
        species == "fern" ~ "unknown sp.", # Re-classifies 'fern' as 'unknown sp.'
        species == "herb" ~ "unknown sp.", # Re-classifies 'herb' as 'unknown sp.'
        species == "tremna cannabina" ~ "trema cannabina", 
        species == "tremna cnnabina" ~ "trema cannabina", 
        species == "vaccinium bracetatum" ~ "vaccinium bracteatum", 
        species == "woody recruit" ~ "unknown sp.", # Re-classifies 'woody recruit' as 'unknown sp.'
        species ==  "styrax odoratismus" ~ "styrax odoratissimus", 
        species ==  "styrax odoratissmus" ~ "styrax odoratissimus",
        is.na(species) ~ "unknown sp.", # Replace missing species with 'unknown sp.'
        str_detect(str_to_lower(species), "buddleja") ~ "buddleja lindleyana", # Assign specific species if genus is detected
        str_detect(str_to_lower(species), "rhap") ~ "rhaphiolepis indica",
        str_detect(str_to_lower(species), "rhod") ~ "rhododendron simsii",
        str_detect(str_to_lower(species), "lindera ery") ~ "lindera erythrocarpa", 
        TRUE ~ species
      ),
      # Replace only the word "seedling" (case-insensitive) with "sp." in species, not the whole cell
      species = str_replace_all(species, regex("\\bseedling\\b", ignore_case = TRUE), "sp."), # Fix various misspellings of seedling
      species = str_replace_all(species, regex("\\bseediing\\b", ignore_case = TRUE), "sp."),
      species = str_replace_all(species, regex("\\bseedliing\\b", ignore_case = TRUE), "sp."),
      species = str_replace_all(species, regex("\\bseedlind\\b", ignore_case = TRUE), "sp."),
      # Fix: Use if_else to replace "sp." with NA_character_
      species = if_else(species == "sp.", NA_character_, species), # Replace generic "sp." with NA
      species = if_else(species == "look at photo", NA_character_, species), # Replace "look at photo" with NA
      species = str_replace_all(species, regex("fraxnus", ignore_case = TRUE), "fraxinus"), # Fix "fraxnus" misspelling
      # Replace [euonymus maxiflorus] with "euonymus maxiflorus"
      species = str_replace_all(species, fixed("[euonymus maxiflorus]"), "euonymus maxiflorus") # Remove brackets
    ) %>%
    mutate(
      id = case_when( # Adjust 'id' values
        str_to_lower(species) == "loropetalum chinense" & id == "1294" ~ "1294a",
        id == "0.14299999999999999" ~ "143",
        TRUE ~ id
      )
    ) %>%
    select(-leaves) |> # Remove the redundant 'leaves' column
    filter(!is.na(id)) |> # Remove rows where 'id' is missing
    mutate(
      subplot = if_else(is.na(subplot) | subplot == "" | subplot == "NA", individual_id, subplot), # Fill missing 'subplot' with 'individual_id'
      notes = if_else(is.na(notes) | notes == "" | notes == "NA", x18, notes) # Fill missing 'notes' with 'x18'
    ) |>
    select(-individual_id, -x18) |> # Remove the columns used for filling
    group_by(plot) |> # Group by 'plot'
    mutate(
      diversity = if (all(is.na(diversity))) NA_real_ else first(na.omit(diversity)) # Fill missing 'diversity' within a plot group with the first non-missing value
    ) |>
    ungroup() # Ungroup the data frame
)



df_full_joined_2 <- df_full_joined_2 |>
  mutate(
    type = if_else(is.na(type) & notes == "seedling", notes, type), # Fill missing 'type' with "seedling" if 'notes' is "seedling"
    species = if_else(species == "sp. (cfr. litsea)", "litsea sp.", species) # Standardize species name
  ) |>
  filter(!(species == "ilex suaveolens" & id == "101"), !(id == "105" & number_leaves == ">75"), !(id == "1056" & number_leaves == ">75 (3)"), !(id == "1063" & number_leaves == ">75 (3)"), !(id == "1059" & number_leaves == ">75 (3)"), !(id == "107" & number_leaves == ">75 (5)")) # Filter out (remove) specific rows based on combined species/id/number_leaves conditions
df_full_joined_2 # Display the data frame



# Identify columns to fill (excluding grouping columns)
group_cols <- c("species", "id", "date", "site", "plot", "subplot") # Columns defining a unique observation
fill_cols <- setdiff(names(df_full_joined_2), group_cols) # Columns whose NA values should potentially be filled

# For each group, check if all non-NA values in each column are identical
df_full_joined_2 <- df_full_joined_2 |>
  mutate(number_leaves = str_replace_all(number_leaves, fixed(">"), NA_character_), number_leaves = str_replace_all(number_leaves, fixed("p"), NA_character_), number_leaves = str_replace_all(number_leaves, fixed("."), NA_character_), notes = str_replace_all(notes, fixed("miswritten as 431 in prev census; 5"), NA_character_), height = str_replace_all(height, fixed("dead"), NA_character_), notes = str_replace_all(notes, fixed("previously assigned to iv by accident. 4"), NA_character_)) |> # Convert specific non-numeric strings to NA in relevant columns
  #filter(!notes == "miswritten as 431 in prev census; 5") |> # (Commented out filter)
  group_by(across(all_of(group_cols))) |> # Group by the columns that uniquely identify a record
  mutate(
    across(
      all_of(fill_cols), # Apply the fill logic to all non-grouping columns
      ~ {
        # Remove NAs and get unique values
        uniq_vals <- unique(na.omit(.x))
        # If only one unique non-NA value, fill NAs with it
        if (length(uniq_vals) == 1) {
          replace(.x, is.na(.x), uniq_vals) # Replace NA values with the single unique non-NA value
        } else {
          .x # Otherwise, keep the column as is
        }
      }
    )
  ) |>
  ungroup() |> # Ungroup the data
  distinct() # Remove any remaining duplicate rows

df_full_joined_2 # Display the data frame


## summarise by groups and identify potential duplicates


# Remove specified columns
df_full_joined_2 <- df_full_joined_2 |>
  select(-c(
    number_herbivory_damaged, herb_dam_27, hprop, # Remove herbivory related columns
    number_fungal_pathogen_damaged, fprop, number_necrosis, percent_damage_fp, number_necrose_damage, percent_damage_necrose, percent_damage_herbivory # Remove pathogen/necrosis related columns
  ))

# Define grouping columns
group_cols <- c("date", "plot", "subplot", "id", "species") # Columns that define a unique census record

# Columns to check for similarity (excluding survival and group columns)
check_cols <- setdiff(names(df_full_joined_2), c(group_cols, "survival")) # Columns to check for identical values in duplicate rows

# For each group, if all columns except survival are identical, unite survival with ";"
df_full_joined_2 <- df_full_joined_2 |>
  group_by(across(all_of(group_cols))) |> # Group by the unique census record identifiers
  mutate(
    n_rows = n() # Count rows in each group
  ) |>
  mutate(
    all_equal = all(across(all_of(check_cols), ~ n_distinct(.x) == 1)) # Check if all non-grouping/non-survival columns have only 1 unique value
  ) |>
  mutate(
    survival = ifelse(
      all_equal,
      paste(sort(unique(survival)), collapse = ";"), # If duplicate rows are identical except for survival, collapse unique survival values into a single string
      survival
    )
  ) |>
  filter(if (first(all_equal)) row_number() == 1 else TRUE) |> # Keep only the first row if all_equal is TRUE (removes identical duplicates)
  ungroup() |>
  select(-n_rows, -all_equal) |> # Remove temporary helper columns
  distinct() # Ensure complete duplicates are removed

df_full_joined_2 # Display the final cleaned data frame


  
## Join additional species information and turn columns into right format (e.g. numeric)
  

(df_full_joined_2 <- df_full_joined_2 |> 
    group_by(date, plot, site, subplot, id, species, height, survival, seed_source, type, diversity) |> # Group by key identifier columns to ensure unique records
    distinct() |> # Remove duplicates based on all columns
    slice(1) |> # Keep only the first row within each group (redundant after distinct if not for the next select step)
    select( # Select and rename a specific set of columns
      date, site, plot, subplot, diversity, id, species, 
      -status, seed_source, type, growth_form, survival, height, survival, # Remove 'status', select others
      number_leaves, 
      "number_herb_damaged" = herb_dam_14, # Rename herbivory column
      "number_fungal_damaged" = fp_dam, # Rename fungal pathogen column
      "number_necrotic_damaged" = nec_dam, # Rename necrotic damage column
      -prop, percent_hmin, percent_hmax, percent_fmin, percent_fmax, percent_nmin, percent_nmax, notes # Remove 'prop' and select percentage columns
    ) |> 
    mutate(
      species = ifelse(is.na(species) | species == "", "unknown sp.", species), # Replace missing species with "unknown sp."
      genus = word(species, 1, sep = " "), # Extract genus (first word) from species name
      diversity = as.numeric(diversity), # Convert diversity to numeric
      height = as.numeric(height), # Convert height to numeric
      number_leaves = as.numeric(number_leaves), # Convert number of leaves to numeric
      number_herb_damaged = as.numeric(number_herb_damaged), # Convert herb damage count to numeric
      number_fungal_damaged = as.numeric(number_fungal_damaged), # Convert fungal damage count to numeric
      number_necrotic_damaged = as.numeric(number_necrotic_damaged), # Convert necrotic damage count to numeric
      percent_hmin = as.numeric(percent_hmin), # Convert minimum herbivory percentage to numeric
      percent_hmax = as.numeric(percent_hmax), # Convert maximum herbivory percentage to numeric
      percent_fmin = as.numeric(percent_fmin), # Convert minimum fungal percentage to numeric
      percent_fmax = as.numeric(percent_fmax), # Convert maximum fungal percentage to numeric
      percent_nmin = as.numeric(percent_nmin), # Convert minimum necrotic percentage to numeric
      percent_nmax = as.numeric(percent_nmax) # Convert maximum necrotic percentage to numeric
    ) |> 
    relocate(genus, .after = species) |> # Move the newly created 'genus' column
    distinct() |> # Remove any duplicates that might have been created during grouping/mutating
    ungroup() |> 
    select(-growth_form) |> # Remove the existing, potentially incomplete 'growth_form' column
    full_join(genus_family_df) |> # Join with the 'genus_family_df' created earlier to add family and growth form
    mutate(
      family = ifelse(species == "unknown sp.", "unknown", family), # Assign 'unknown' family/genus/growth_form for "unknown sp."
      genus = ifelse(species == "unknown sp.", "unknown", genus), 
      growth_form = ifelse(species == "unknown sp.", "unknown", growth_form)
    ) |>
    relocate(family, .after = genus) |> # Move 'family' column
    relocate(growth_form, .after = family) |> # Move 'growth_form' column
    ungroup() |> 
    filter(!is.na(growth_form)) |> # Remove rows where 'growth_form' is missing (i.e., failed to join and was not "unknown sp.")
    distinct() # Final check for duplicates
)


## Get a last overview about the data, identify potentially mistakes worth to repair


df_full_joined_2 |> 
  mutate(
    percentage_herb_damage = number_herb_damaged / number_leaves, # Calculate percentage damage for herbivory
    percentage_fungal_damage = number_fungal_damaged / number_leaves, # Calculate percentage damage for fungal pathogen
    percentage_necrotic_damage = number_necrotic_damaged / number_leaves # Calculate percentage damage for necrotic damage
  ) |>
  relocate(notes, .after = last_col()) # Move 'notes' column to the far right for easier review



df_full_joined_2 <- df_full_joined_2 %>%
  mutate(
    seed_source_short = case_when( # Create a short code for 'seed_source'
      str_detect(seed_source, regex("external invader", ignore_case = TRUE)) ~ "EI",
      str_detect(seed_source, regex("planted, but not at this site|not at this site|alternate species pool", ignore_case = TRUE)) ~ "ASP",
      str_detect(seed_source, regex("internal invader", ignore_case = TRUE)) ~ "II",
      str_detect(seed_source, regex("regeneration", ignore_case = TRUE)) ~ "R",
      is.na(seed_source) | str_trim(seed_source) == "" ~ NA_character_,
      TRUE ~ seed_source
    ),
    notes = if_else( # Append original 'seed_source' to 'notes' column if 'notes' is not empty, otherwise use 'seed_source' as the note
      !is.na(notes) & str_trim(notes) != "",
      paste0(notes, "; ", seed_source),
      seed_source
    )
  ) %>%
  relocate(seed_source_short, .after = growth_form) |> # Move the new 'seed_source_short' column
  select(-seed_source) # Remove the long 'seed_source' column
df_full_joined_2 # Display the data frame


## write the final dataset into .csv for further usage


write.csv(df_full_joined_2, file = "datas_and_notebooks/2023/september_23/final_data_september.csv") # Write the final cleaned data frame to a CSV file


-----------------

  

# Data cleaning and creation of new datasets for May 2023

veg_survey <- read_excel("datas_and_notebooks/2023/may_23/Sapling Survey May 2023.xlsx") |> # Read the Excel file into 'veg_survey'
  mutate(across(where(is.character), ~str_trim(.) |> tolower())) |> # Trim whitespace and convert all character columns to lowercase
  clean_names() # Clean column names (standardize format)

sapling_survey <- read_excel("datas_and_notebooks/2023/may_23/Sapling Survey May 2023.xlsx") |> # Read the same Excel file into 'sapling_survey'
  mutate(across(where(is.character), ~str_trim(.) |> tolower())) |> # Trim whitespace and convert all character columns to lowercase
  clean_names() # Clean column names (standardize format)

str(veg_survey) # Display the structure of 'veg_survey'
str(sapling_survey) # Display the structure of 'sapling_survey'



sapling_survey <- sapling_survey |>
  rename("notes" = x21) |> # Rename generic column 'x21' to 'notes'
  mutate(across(where(is.character), ~na_if(., "na"))) # Replace all occurrences of the string "na" (now lowercase) with R's NA in character columns
sapling_survey # Display the data frame


## reading in final dataset from september for joining


final_data_september <- read.csv("datas_and_notebooks/2023/september_23/final_data_september.csv", stringsAsFactors = FALSE) # Read the final cleaned September data set
str(final_data_september) # Display the structure of the September data


## Identify missing or ungiven species names and correct spelling mistakes


sapling_survey <- sapling_survey |> 
  mutate(
    species = case_when( # Use case_when to correct/standardize species names based on 'id' or existing 'species' value
      id == "737x" ~ "fern",
      id == "963" ~ "trema cannabina",
      id == "392" ~ "distylium buxifolium",
      species == "444" ~ "clerodendrum cyrtophyllum",
      species == "clerodendrum cyrtophyllum (444)" ~ "clerodendrum cyrtophyllum",
      species == "1171" ~ "lindera reflexa",
      species == "307" ~ "ilex suaveolens",
      species == "1294" ~ "eurya muricata", 
      id == "1294" ~ "eurya muricata", 
      id == "1242" ~ "pterostyrax corymbosus",
      id == "1021" ~ "premna microphylla",
      id == "1217" ~ "camellia fraterna",
      id == "1390" ~ "buddleja lindleyana", 
      species == "?" ~ "unknown sp.", 
      TRUE ~ species # Keep the original value if no condition is met
    ),
    species = str_remove_all(species, "\\[|\\]") # Remove brackets from species names
  ) |>
  mutate(across(everything(), ~str_replace_all(., "/", ""))) |> # Remove all forward slashes from all columns
  filter(!is.na(species)) # Remove rows where species is NA

sapling_survey # Display the data frame



sapling_survey <- sapling_survey |>
  mutate(
    # First, set growth_form to "herb" if species is "herb"
    growth_form = case_when( # Define initial growth_form based on species/notes
      str_to_lower(species) == "herb" ~ "herb",
      str_to_lower(species) == "unknown sp." & !is.na(notes) & str_to_lower(notes) == "woody recruit" ~ "shrub/tree",
      TRUE ~ NA_character_
    ),
    # Then, set species to "unknown sp." if it was "herb"
    species = case_when( # Standardize 'herb' to 'unknown sp.'
      str_to_lower(species) == "herb" ~ "unknown sp.",
      TRUE ~ species
    ),
    # Then, set type for quercus seedling and seedling
    type = case_when( # Define 'type' for seedlings
      str_to_lower(species) == "quercus seedling" ~ "seedling",
      str_to_lower(species) == "seedling" ~ "seedling",
      TRUE ~ NA_character_
    )
  ) |> 
  # Standardize species names
  mutate( # Correct spelling mistakes in species names
    species = case_when(
      str_to_lower(species) == "alniphylum fortunei" ~ "alniphyllum fortunei",
      str_to_lower(species) == "calicarpa dischotoma" ~ "calicarpa dichotoma",
      str_to_lower(species) == "camellia janopica" ~ "camellia japonica",
      str_to_lower(species) == "clerodendrum cyrtophullym" ~ "clerodendrum cyrtophyllum",
      str_to_lower(species) == "itea" ~ "itea sp.",
      str_to_lower(species) == "lindera erythocarpa" ~ "lindera erythrocarpa",
      str_to_lower(species) == "lindera refelxa" ~ "lindera reflexa",
      str_to_lower(species) == "liquidamabar formosana" ~ "liquidambar formosana",
      str_to_lower(species) == "ltea omeiensis" ~ "itea omeiensis",
      str_to_lower(species) == "mussaendra esquirolii" ~ "mussaenda esquirolii",
      str_to_lower(species) == "musseandra esquirolii" ~ "mussaenda esquirolii",
      str_to_lower(species) == "musseanda esquirolii" ~ "mussaenda esquirolii",
      str_to_lower(species) == "musseandra equifolia" ~ "mussaenda equifolia",
      str_to_lower(species) == "pterostryax corymbusus" ~ "pterostyrax corymbosus",
      str_to_lower(species) == "phyllanthus glauca" ~ "phyllostachys glauca",
      str_to_lower(species) == "camellia chinensis" ~ "camellia sinensis",
      str_to_lower(species) == "quercues serrata" ~ "quercus serrata",
      str_to_lower(species) == "rhapiolepis indica" ~ "rhaphiolepis indica",
      str_to_lower(species) == "rhaphioides indica" ~ "rhaphiolepis indica",
      str_to_lower(species) == "rhalpioides indica" ~ "rhaphiolepis indica",
      str_to_lower(species) == "rhaipoides indica" ~ "rhaphiolepis indica",
      str_to_lower(species) == "rhododenron simsii" ~ "rhododendron simsii",
      str_to_lower(species) == "rosa" ~ "rosa sp.",
      str_to_lower(species) == "schoepfja jasminodora" ~ "schoepfia jasminodora",
      str_to_lower(species) == "sp 37*" ~ "alniphyllum fortunei",
      str_to_lower(species) == "styrax odoratismus" ~ "styrax odoratissimus",
      str_to_lower(species) == "cfr. styrax odoratissimus" ~ "styrax odoratissimus", 
      str_to_lower(species) == "vaccinium bracetatum" ~ "vaccinium bracteatum",
      str_to_lower(species) == "viburnum sempiverens" ~ "viburnum sempervirens",
      str_to_lower(species) == "araisia crenata" ~ "ardisia crenata",
      str_to_lower(species) == "calicarpa sp" ~ "calicarpa sp.",
      str_to_lower(species) == "calicarpa sp," ~ "calicarpa sp.",
      str_to_lower(species) == "quercus seedling" ~ "quercus sp.",
      str_to_lower(species) == "seedling" ~ "unknown sp.",
      str_to_lower(species) == "woody recruit" ~ "unknown sp.",
      str_to_lower(species) == "machilus grijsi" ~ "machilus grijesi",
      str_to_lower(species) == "pterostyrax corymbusus" ~ "pterostyrax corymbosus",
      TRUE ~ species
    )
  )



sapling_survey <- sapling_survey |>
  mutate(genus = word(species, 1)) |> # Extract genus (first word)
  left_join(final_data_september |> select(genus, family, growth_form) |> distinct(), by = "genus") |> # Join to pull family and growth form from September data using 'genus'
  distinct() |>
  mutate(
    growth_form = ifelse(is.na(growth_form.x) | growth_form.x == "", growth_form.y, growth_form.x) # Coalesce the two 'growth_form' columns
  ) |>
  select(-growth_form.x, -growth_form.y) # Remove the original 'growth_form' columns from the join

sapling_survey # Display the data frame


## Bring columns into same format as september data and join with september values


# Rename columns in sapling_survey to match the format and names of final_data_september
sapling_survey <- sapling_survey |> # Rename May columns to match September final data names
  rename(
    number_leaves = leaves,
    number_herb_damaged = herb_dam,
    percent_hmin = hmin,
    percent_hmax = hmax,
    number_fungal_damaged = fpdam,
    percent_fmin = fmin,
    percent_fmax = fmax,
    number_necrotic_damaged = nec_dam,
    percent_nmin = nmin,
    percent_nmax = nmax
  )

# Convert columns to appropriate types
sapling_survey <- sapling_survey |> # Convert relevant columns to their intended type (Date/Numeric)
  mutate(
    date = as.Date(date),
    month = lubridate::month(date),
    height = as.numeric(height),
    number_leaves = as.numeric(number_leaves),
    number_herb_damaged = as.numeric(number_herb_damaged),
    hprop = as.numeric(hprop),
    percent_hmin = as.numeric(percent_hmin),
    percent_hmax = as.numeric(percent_hmax),
    number_fungal_damaged = as.numeric(number_fungal_damaged),
    fprop = as.numeric(fprop),
    percent_fmin = as.numeric(percent_fmin),
    percent_fmax = as.numeric(percent_fmax),
    number_necrotic_damaged = as.numeric(number_necrotic_damaged),
    nprop = as.numeric(nprop),
    percent_nmin = as.numeric(percent_nmin),
    percent_nmax = as.numeric(percent_nmax)
  )

# Reorder columns to match final_data_september and remove hprop, fprop, nprop
sapling_survey <- sapling_survey |> 
  left_join(final_data_september |> select(plot, subplot, site, diversity)|> distinct()) |> # Join with September data to retrieve site and diversity values (which might be missing in May)
  select( # Select and reorder columns to match the September final data structure
    date, month, plot, subplot, site, diversity, id, species, genus, family, growth_form, survival, height,
    number_leaves, number_herb_damaged, percent_hmin, percent_hmax,
    number_fungal_damaged, percent_fmin, percent_fmax,
    number_necrotic_damaged, percent_nmin, percent_nmax, notes, type # Removed hprop, fprop, nprop implicitly by not selecting them
  )


  

str(sapling_survey) # Display the structure of the May sapling data frame
str(final_data_september) # Display the structure of the final September data frame



# Get unique species from both dataframes
species_sapling <- sapling_survey |> distinct(species) |> mutate(source = "sapling_survey") # Get unique species and label source
species_final <- final_data_september |> distinct(species) |> mutate(source = "final_data_september") # Get unique species and label source

# Combine into one dataset
species_combined <- bind_rows(species_sapling, species_final) # Vertically combine the two species lists

# Create a summary table showing presence in each dataset
species_wide <- species_combined |>
  mutate(present = TRUE) |> # Create a presence indicator column
  tidyr::pivot_wider( # Pivot the data to wide format
    names_from = source, # Use source names as new column names
    values_from = present, # Fill with the presence indicator
    values_fill = FALSE # Fill missing values (not present) with FALSE
  )

species_wide # Display the resulting comparison table



sapling_survey # Display the May sapling data frame



# Load the required package for fill()
surveys <- final_data_september |> # Start with the September data
  mutate(
    species = case_when( # Correct a species spelling error
      str_to_lower(species) == "musseanda esquirolii" ~ "mussaenda esquirolii",
      TRUE ~ species
    ),
    date = as.Date(date), # Ensure 'date' is a Date object
    month = month(date), # Extract the month
    year = year(date) # Extract the year
  ) |> 
  select(-X) |> # Remove a redundant index column
  distinct() |> # Remove duplicates
  full_join(sapling_survey) |> # Perform a full join with the May data
  group_by(plot) |> # Group by plot
  fill(site, diversity, .direction = "down") |> # Fill missing 'site' and 'diversity' values downwards within each plot
  ungroup() # Remove grouping



surveys <- surveys |>
  mutate(
    subplot = if_else(subplot == "aw14" & id == "1726", "aw14-i", subplot), # Manually correct a specific subplot ID
    percent_herb = number_herb_damaged / number_leaves, # Calculate percentage of herbivory damage
    percent_necrose = number_necrotic_damaged / number_leaves, # Calculate percentage of necrotic damage
    percent_fungal = number_fungal_damaged / number_leaves # Calculate percentage of fungal damage
  ) |>
  relocate(notes, .after = last_col()) # Move the 'notes' column to the end
write.csv(surveys, file = "datas_and_notebooks/final_datas/final_surveys.csv") # Write the combined and cleaned sapling data to a CSV file
surveys # Display the final combined sapling data


# Vegetation survey


veg_2023 <- read_excel("datas_and_notebooks/2023/may_23/Vegetation survey 2023.xlsx") |> # Read the 2023 vegetation survey data
  clean_names() |> # Clean column names
  mutate(across(where(is.character), ~ str_trim(str_to_lower(.)))) # Clean character columns

str(veg_2023) # Display the structure of the 2023 data
veg_2023 # Display the 2023 data



veg_2024 <- read_excel("datas_and_notebooks/2024/Vegetation survey spring 2024 (1 subplot missing).xlsx") |> # Read the 2024 vegetation survey data
  clean_names() |> # Clean column names
  mutate(
    across(
      everything(),
      ~ {
        x_chr <- as.character(.) # Convert column to character
        x_chr <- str_replace_all(x_chr, fixed("80 (w)"), "80") # Clean specific string errors
        x_chr <- str_replace_all(x_chr, fixed("0.55000000000000004"), "0.55") # Clean floating point errors
        x_chr <- str_replace_all(x_chr, fixed("7.0000000000000007e-2"), "0.07") # Clean scientific notation/floating point errors
        x_chr <- str_replace_all(x_chr, fixed("0.56999999999999995"), "0.5699") # Clean floating point errors
        x_chr <- str_replace_all(x_chr, fixed(","), ".") # Replace comma decimals with dot decimals
        if (is.character(.)) {
          x_chr <- str_trim(str_to_lower(x_chr)) # Trim and convert to lowercase for character columns
          x_chr[grepl("^na$", x_chr)] <- NA_character_ # Convert "na" string to NA
        }
        suppressWarnings(type.convert(x_chr, as.is = TRUE)) # Attempt to convert back to best data type (e.g., numeric)
      }
    )
  )

veg_2024 <- veg_2024 |> 
  select(-c(16, 17), -c(19:ncol(veg_2024))) |> # Select a specific subset of columns to keep
  mutate(
    max_herb_layer_height = as.numeric(if_else( # Manually handle a specific string in 'max_herb_layer_height'
      max_herb_layer_height == "80 (w)", 
      "80", 
      max_herb_layer_height
    ))
  )

veg_2024_num <- veg_2024 |>
  mutate(across(
    .cols = setdiff(seq_along(veg_2024), c(1:3, 16)), # Select all columns except date, plot, subplot, and notes
    .fns = as.numeric # Convert selected columns to numeric
  ))

# Rename columns to match veg_2023
veg_2024_num <- veg_2024_num |> # Rename 2024 columns to match 2023 column names
  rename(
    herb_max = max_herb_layer_height,
    herbaceous = herb,
    woody = woody_plants,
    open = open_ground,
    leaflitter = leaf_litter,
    leaflitter_depth = leaf_litter_dept,
    deadwood = deadwppd
  )

# Add missing columns (saplings, seedlings) as NA if not present
if (!"saplings" %in% names(veg_2024_num)) {
  veg_2024_num$saplings <- NA_real_ # Add 'saplings' column if missing
}
if (!"seedlings" %in% names(veg_2024_num)) {
  veg_2024_num$seedlings <- NA_real_ # Add 'seedlings' column if missing
}

# Reorder columns to match veg_2023
veg_2024_num <- veg_2024_num |> # Select and reorder columns to match the 2023 data structure
  select(
    date, plot, subplot, tot_veg, herb_max, grass, fern, herbaceous, woody, 
    rock, deadwood, leaflitter, moss, notes # Missing columns (e.g., seedlings, saplings, open, etc.) will be handled later or are not present in 2023 data
  )

# Convert date to POSIXct to match veg_2023
veg_2024_num <- veg_2024_num |>
  mutate(date = as.POSIXct(date)) # Convert date column to POSIXct format

str(veg_2024_num) # Display the structure of the cleaned 2024 data
veg_2024_num # Display the cleaned 2024 data



lapply(veg_2024, unique) # Display the unique values for every column in the initial 2024 data (for inspection)



(veg_surveys <- veg_2023 |> # Start with the 2023 vegetation data
    full_join( # Full join with the cleaned 2024 vegetation data
      veg_2024_num |> 
        mutate(
          date = str_replace_all(date, "2023", "2024"), # Manually adjust the year in the date string (for display/consistency)
          date = as.Date(date) # Convert to Date object
        )
    ) |> 
    distinct() |> # Remove duplicates
    filter( # Filter out (remove) specific rows identified as mistakes
      !(subplot == "ao22-iii" & grass == 0.001),
      !(subplot == "aq21-iii" & grass == 0.01),
      !(subplot == "aq9-i" & tot_veg == 0.4)
    ) |> 
    mutate(year = year(date)) |> # Extract the year
    distinct()) # Final check for duplicates

write.csv(veg_surveys, "datas_and_notebooks/final_datas/final_veg_surveys.csv") # Write the combined and cleaned vegetation data to a CSV file



veg_surveys |>
  group_by(date, plot, subplot) |> # Group by date, plot, and subplot
  summarise(n = n(), .groups = "drop") |> # Count the number of rows (n) in each unique group
  filter(n > 1) # Filter to show only groups (census records) that have more than one row (i.e., duplicates)


  
  # Final Join with may/sept surveys
  

(final_joined <- surveys |> 
    mutate(
      year = year(date), # Extract the year from the date
      subplot = ifelse(plot == "bq27" & subplot == "bo27-iv", "bq27-iv", subplot), # Manually correct a subplot name mistake
      subplot = ifelse(plot == "aj21" & subplot == "ai21-ii", "aj21-ii", subplot), # Manually correct another subplot name mistake
      subplot = str_replace_all(subplot, " ", "") # Remove spaces from subplot names
    ) |> 
    filter(!(subplot == "bt19-iiiv" & id == "1282")) |> # Filter out a specific row identified as an error/duplicate
    left_join( # Join the sapling/plant data with the plot/vegetation data
      veg_surveys |> 
        mutate(year = year(date)) |> # Ensure 'year' is present in vegetation data for joining
        select(-c(date, notes)) |> # Remove 'date' and 'notes' from veg data to avoid conflicts/redundancy
        distinct() # Remove any duplicates in the vegetation data
    )
)
write.csv(final_joined, file = "datas_and_notebooks/final_datas/final_joined.csv") # Write the final combined dataset to a CSV file


final_joined <- read.csv('datas_and_notebooks/final_datas/final_joined.csv') |> 
  select(-X) |> 
  mutate(
    season = case_when(
      month %in% c(6, 7) ~ "summer",
      month %in% c(9, 10) ~ "autumn",
      TRUE ~ NA_character_
    )
  ) |> 
  group_by(plot, subplot, id, species) |> 
  tidyr::fill(seed_source_short, .direction = "downup") |> 
  ungroup() |> 
  mutate(
    across(
      where(is.numeric),
      ~ ifelse((survival == "d" | survival == "a") & is.na(.), 0, .)
    ),
    type = ifelse(is.na(type) & !is.na(height) & height != 0, "sapling", type)
  ) |> 
  mutate(
    across(
      where(is.numeric),
      ~ ifelse(height == 0 & is.na(.), 0, .)
    )
  )

final_joined



# Define grouping columns
group_cols <- c(
  "site", "plot", "subplot", "diversity", "id", "species", "genus", "family", "growth_form", "seed_source_short"
)

# Columns for which to take the first value (not percent change)
first_cols <- c("tot_veg", "herb_max", "grass", "fern", "herbaceous", "woody", "rock", "deadwood", "leaflitter", "moss", "saplings", "seedlings")

# Columns for which to calculate percent change (between autumn and summer)
percent_cols <- c(
  "height", "number_leaves", "number_herb_damaged", "number_fungal_damaged", "number_necrotic_damaged",
  "percent_herb", "percent_necrose", "percent_fungal"
)

# Filter to only summer and autumn
filtered <- final_joined |>
  filter(season %in% c("summer", "autumn"))

# Pivot to wide format for percent change calculation
wide <- filtered |>
  select(all_of(group_cols), season, all_of(percent_cols), all_of(first_cols)) |>
  pivot_wider(
    names_from = season,
    values_from = all_of(percent_cols),
    names_sep = "_"
  )

# Fix: Unlist columns if they are lists (from pivot_wider with missing values)
# Updated: If a list element has length > 1, take the first value and warn
for (col in c(paste0(percent_cols, "_summer"), paste0(percent_cols, "_autumn"))) {
  if (col %in% names(wide) && is.list(wide[[col]])) {
    wide[[col]] <- map_dbl(wide[[col]], function(.x) {
      if (length(.x) == 0) {
        NA_real_
      } else if (length(.x) == 1) {
        as.numeric(.x)
      } else {
        warning(sprintf("Column '%s' has a list element of length > 1; taking the first value.", col))
        as.numeric(.x[1])
      }
    })
  }
}

# Calculate percent change: (autumn - summer) / summer * 100
for (col in percent_cols) {
  summer_col <- paste0(col, "_summer")
  autumn_col <- paste0(col, "_autumn")
  change_col <- paste0("percent_change_", col)
  wide[[change_col]] <- case_when(
    is.na(wide[[summer_col]]) & is.na(wide[[autumn_col]]) ~ NA_real_,
    is.na(wide[[summer_col]]) ~ NA_real_,
    wide[[summer_col]] == 0 & !is.na(wide[[autumn_col]]) ~ NA_real_, # avoid division by zero
    TRUE ~ (wide[[autumn_col]] - wide[[summer_col]]) / wide[[summer_col]] * 100
  )
}

# Add first_cols (take from summer, or autumn if summer is NA)
for (col in first_cols) {
  summer_col <- paste0(col, "_summer")
  autumn_col <- paste0(col, "_autumn")
  if (summer_col %in% names(wide) && autumn_col %in% names(wide)) {
    # Unlist if needed
    if (is.list(wide[[summer_col]])) {
      wide[[summer_col]] <- map_dbl(wide[[summer_col]], function(.x) {
        if (length(.x) == 0) {
          NA_real_
        } else if (length(.x) == 1) {
          as.numeric(.x)
        } else {
          warning(sprintf("Column '%s' has a list element of length > 1; taking the first value.", summer_col))
          as.numeric(.x[1])
        }
      })
    }
    if (is.list(wide[[autumn_col]])) {
      wide[[autumn_col]] <- map_dbl(wide[[autumn_col]], function(.x) {
        if (length(.x) == 0) {
          NA_real_
        } else if (length(.x) == 1) {
          as.numeric(.x)
        } else {
          warning(sprintf("Column '%s' has a list element of length > 1; taking the first value.", autumn_col))
          as.numeric(.x[1])
        }
      })
    }
    wide[[col]] <- coalesce(wide[[summer_col]], wide[[autumn_col]])
  }
}

# Select final columns
percent_change_df <- wide |>
  select(
    all_of(group_cols),
    starts_with("percent_change_"),
    all_of(first_cols)
  )

percent_change_df 


# Define grouping columns
group_cols <- c(
  "site", "plot", "subplot", "diversity", "id", "species", "genus", "family", "growth_form"
)

# Columns for which to calculate deltas
delta_cols <- c(
  "height", "number_leaves", "number_herb_damaged", "number_fungal_damaged", 
  "number_necrotic_damaged", "percent_herb", "percent_necrose", "percent_fungal"
)

# Columns for which to take the first value (not percent change)
first_cols <- c(
  "tot_veg", "herb_max", "grass", "fern", "herbaceous", "woody", "rock", 
  "deadwood", "leaflitter", "moss", "saplings", "seedlings"
)

# Calculate deltas and first values
delta_df <- final_joined |>
  filter(season %in% c("summer", "autumn")) |>
  group_by(across(all_of(group_cols))) |>
  arrange(season, .by_group = TRUE) |>
  summarise(
    across(
      all_of(delta_cols),
      ~ if(length(.) == 2) .[season == "autumn"] - .[season == "summer"] else NA_real_,
      .names = "delta_{.col}"),
    across(
      all_of(first_cols),
      ~ first(.)))

delta_df
# Optionally, join the delta columns back to the original data
# final_joined_with_deltas <- left_join(final_joined, delta_df, by = group_cols)



change_rates_joined <- percent_change_df |> 
  full_join(delta_df) #|> 
# select(-c(1:10)) |> 
#filter(!is.na(percent_change_height)) |> 
#print(n = 20)
write.csv(change_rates_joined, file = "datas_and_notebooks/final_datas/change_rates_joined.csv")



change_rates_joined <- read.csv("datas_and_notebooks/final_datas/change_rates_joined.csv") |> # Read the data frame containing change rates
  select(-X) |> # Remove the automatically generated index column 'X'
  mutate(seed_source_short = ifelse(is.na(seed_source_short), "not clear", seed_source_short)) # Replace missing 'seed_source_short' values with "not clear"
change_rates_joined # Display the data frame



# Prepare data: keep only necessary columns
biodiv_data <- change_rates_joined %>% # Start with the main data frame
  select(site, plot, subplot, species, genus, family, id) %>% # Select columns relevant for biodiversity calculation
  na.omit() # Remove rows with any missing values

# Create a species abundance matrix per subplot
species_abund <- biodiv_data %>%
  group_by(site, plot, subplot, species) %>% # Group by location and species
  summarise(abundance = n(), .groups = "drop") %>% # Count the number of individuals (abundance) for each species in each subplot
  tidyr::pivot_wider(names_from = species, values_from = abundance, values_fill = 0) # Convert to wide format (species as columns, abundance as values)

# Calculate biodiversity metrics per subplot
biodiv_metrics <- species_abund %>%
  rowwise() %>% # Operate row-by-row (per subplot)
  mutate(
    # Species richness (S)
    species_richness = sum(c_across(-c(site, plot, subplot)) > 0), # Count the number of species with abundance > 0
    # Shannon diversity (H')
    shannon_diversity = diversity(c_across(-c(site, plot, subplot)), index = "shannon"), # Calculate Shannon diversity index
    # Chao1 estimator
    chao1 = fossil::chao1(as.integer(unlist(c_across(-c(site, plot, subplot))))), # Calculate Chao1 richness estimator
    # Fisher's alpha
    fishers_alpha = fisher.alpha(as.integer(unlist(c_across(-c(site, plot, subplot))))) # Calculate Fisher's alpha diversity index
  ) %>%
  ungroup() %>%
  select(site, plot, subplot, species_richness, shannon_diversity, chao1, fishers_alpha) # Select the calculated biodiversity metrics

# Calculate genus and family richness per subplot
genus_richness <- biodiv_data %>%
  group_by(site, plot, subplot) %>%
  summarise(genus_richness = n_distinct(genus), .groups = "drop") # Count unique genera per subplot

family_richness <- biodiv_data %>%
  group_by(site, plot, subplot) %>%
  summarise(family_richness = n_distinct(family), .groups = "drop") # Count unique families per subplot

# Join all metrics together
biodiv_metrics_all <- biodiv_metrics %>%
  left_join(genus_richness, by = c("site", "plot", "subplot")) %>% # Join with genus richness
  left_join(family_richness, by = c("site", "plot", "subplot")) # Join with family richness

# Add biodiversity metrics to the original dataset
change_rates_joined <- change_rates_joined %>%
  left_join(biodiv_metrics_all, by = c("site", "plot", "subplot")) # Join the new metrics back to the main data frame

# View the resulting dataframe
change_rates_joined |> 
  distinct()# Display the updated data frame



change_rates_pca <- change_rates_joined |> 
  select(-c(plot, subplot, id, starts_with("percent_"), species, growth_form, seed_source_short, genus_richness, family_richness)) |> # Select columns relevant for PCA (excluding identifiers and highly correlated/redundant columns)
  mutate(diversity = as.factor(diversity)) |> # Convert the 'diversity' column to a factor
  mutate_if(is.numeric, ~datawizard::standardise(.)) |> # Standardize (Z-score) all numeric columns
  fastDummies::dummy_cols( # Convert selected factor columns into dummy (binary) variables
    select_columns = c("site", "genus", "family", "diversity", "growth_form", "seed_source_short"), 
    remove_first_dummy = TRUE, # Remove the first dummy variable for each factor group to avoid multicollinearity
    remove_selected_columns = TRUE # Remove the original factor columns
  ) 
change_rates_pca # Display the data frame prepared for PCA



pca <- change_rates_pca |> # Start with the prepared data
  na.omit() |> # Remove rows with any remaining NA values (required for prcomp)
  prcomp() # Perform Principal Component Analysis (PCA)
summary(pca) # Summarize the PCA results (e.g., proportion of variance explained by each PC)



biplot(pca) # Generate a biplot showing both variable loadings (arrows) and individual scores (points) for PC1 and PC2



str(change_rates_joined) # Display the structure of the original data frame (before PCA prep)
change_rates_joined # Display the data frame



change_rates_pca <- change_rates_joined |> 
  select(-c(plot, subplot, id, starts_with("percent_"), species, growth_form, seed_source_short)) |> # Select columns again for preparing the grouping variable
  mutate(diversity = as.factor(diversity)) |> # Convert 'diversity' to a factor
  na.omit() # Remove NAs to match the rows used in the PCA calculation (only needed for the biplot's grouping variable)
# Perform PCA (The PCA object 'pca' is assumed to be the one calculated previously)
# Create the biplot with adjusted parameters for better visibility
biplot_pc12_appendix <- ggbiplot::ggbiplot( # Generate the biplot using ggbiplot
  pca, 
  choices = c(1, 2), # Select PC1 and PC2
  # groups = factor(change_rates_pca$diversity[complete.cases(change_rates_pca)]),  # (Commented out: grouping variable)
  ellipse = FALSE, # Disable concentration ellipses
  varname.size = 8, # Set size of variable names
  varname.fontface = "bold", # Bold variable names
  varname.abbrev = TRUE, # Do not abbreviate variable names
  arrow.size = 0.5, # Set arrow size
  arrow.label.size = 20, # Set arrow label size
  ellipse.prob = 0.5, # Set ellipse confidence level (irrelevant since ellipse=FALSE)
  ellipse.alpha = 0.2, # Set ellipse transparency (irrelevant since ellipse=FALSE)
  var.scale = 0.5, # Scale the arrow lengths
  var.factor = 1, # Arrow length factor
  varname.adjust = 1 # Adjust position of variable names
) + 
  #ggplot2::geom_point(aes(color = change_rates_pca$diversity[complete.cases(change_rates_pca)])) +  # (Commented out: adding points colored by diversity)
  # theme_ipsum() +  # (Commented out: theme)
  ggplot2::theme_minimal() + # Apply minimal theme
  ggplot2::labs( # Set plot labels
    title = "Biplot of PC1 and PC2 colored by downtime", 
    subtitle = "Association between downtime and machine data" 
  ) + 
  ggplot2::theme( # Customize plot text elements
    plot.title = ggplot2::element_text(size = 16), 
    plot.subtitle = ggplot2::element_text(size = 12), 
    legend.title = ggplot2::element_text(size = 10), 
    axis.title = ggplot2::element_text(size = 10), 
    axis.text = ggplot2::element_text(size = 8), 
    axis.title.x = ggplot2::element_text(size = 10), 
    axis.title.y = ggplot2::element_text(size = 10) 
  )# + 
# scale_color_ipsum() +  # (Commented out: color scale)
#scale_fill_ipsum() 


# Set plot dimensions
biplot_pc12_appendix # Display the customized biplot



# Ensure 'diversity' is a factor and matches the PCA individuals
active_individuals <- rownames(pca$x) # Get the row names (individuals) that were used in the PCA
change_rates_pca <- change_rates_joined |> # Start with the main data
  select(-c(plot, subplot, id, starts_with("percent_"), species, growth_form, seed_source_short)) |> # Select columns to match the PCA preparation steps (before dummification)
  mutate(diversity = as.factor(diversity)) # Ensure diversity is a factor

# Subset to active individuals and ensure row order matches PCA
filtered_machine_data <- change_rates_pca[rownames(change_rates_pca) %in% active_individuals, ] # Filter the original data to only include rows present in the PCA
filtered_machine_data <- filtered_machine_data[match(active_individuals, rownames(filtered_machine_data)), ] # Reorder the data rows to match the PCA output order

# Check that habillage is a factor and has the correct length
stopifnot(length(filtered_machine_data$diversity) == length(active_individuals)) # Check row count consistency
stopifnot(is.factor(filtered_machine_data$diversity)) # Check that 'diversity' is a factor

# Create the biplot with correct habillage
biplot1 <- fviz_pca_biplot( # Generate the biplot using the factoextra package (fviz_pca_biplot)
  pca,
  col.var = "contrib", # Color variables by their contribution to the principal components
  label = "var", # Label the variables
 # color = filtered_machine_data$diversity # Color the individuals by the 'diversity' factor
)
biplot1 # Display the biplot



  

# Summarize the group labels for the biplot
#group.labels <- biplot1$data |> 
 # summarise(xvar = mean(x), # Calculate the mean x-coordinate for each group
   #         yvar = mean(y), # Calculate the mean y-coordinate for each group
    #        .by = Groups) # Group by the 'Groups' column
#mutate(Groups = ifelse(Groups == "0", "No Machine Failure", "Machine Failure"))  # (Commented out: renaming groups)

# Create a second biplot without individual points
biplot2 <- fviz_pca_biplot(pca, col.var = "contrib", label = "var", invisible = "ind") # Create the second biplot, showing only variables

# Add group labels to the second biplot
biplot2 +#+ geom_label(aes(x = xvar, y = yvar, label = Groups), data = group.labels, repel = T) + # Add labels at the mean position of each group
  #theme_ipsum() + # (Commented out: theme application)
  scale_color_viridis_c() # Apply Viridis color scale to variable contributions



# Corrected code block
fviz_eig(pca, addlabels = TRUE, hjust = -0.3, # Visualize the eigenvalues (scree plot)
         barfill = "white", barcolor = "darkblue") + # Set bar fill and color
  # ylim(7, 15) + # (Commented out: setting y-axis limits)
  theme_minimal() + # Apply minimal theme
  geom_label(aes(x = 3.5, y = 20, label = "Elbow Point"), color = "red", size = 5, hjust = 0.5) + # Add a label for the elbow point
  geom_segment(aes(x = 3.5, y = 20, xend = 3, yend = 9.2), color = "red", linetype = "dashed") # Add a dashed line pointing to the elbow point



filtered_machine_data # Display the data frame subsetted and filtered to match the PCA individuals


change_rates_joined |> 
  filter(site == "a") # Filter the data to include only rows where 'site' is "a"



change_rates_pca <- change_rates_joined |> 
  select(-c(plot, subplot, id, starts_with("delta_"), # Select columns for PCA, removing identifiers, 'delta_' columns, and highly specific/redundant percent change columns
            species, growth_form, seed_source_short, genus_richness, family_richness, percent_change_number_necrotic_damaged, percent_change_percent_necrose, percent_change_percent_fungal, percent_change_number_fungal_damaged, percent_change_number_herb_damaged, percent_change_number_herb_damaged, percent_change_percent_herb)) |> 
  na.omit() # Remove all rows with NA values
str(change_rates_pca) # Display the structure of the prepared data frame



change_rates_pca <- change_rates_joined |> 
  select(-c(plot, subplot, id, starts_with("delta_"), # Select columns for PCA, removing identifiers, 'delta_' columns, and specific damage/diversity metrics
            species, growth_form, genus, percent_change_number_necrotic_damaged, percent_change_percent_necrose, percent_change_percent_fungal, percent_change_number_fungal_damaged, percent_change_number_herb_damaged, percent_change_number_herb_damaged, family, diversity, tot_veg, herb_max))|> 
  #mutate(diversity = as.factor(diversity)) |>  # (Commented out: converting diversity to factor)
  mutate_if(is.numeric, ~datawizard::standardise(.)) |> # Standardize all numeric columns
  fastDummies::dummy_cols( # Convert selected categorical columns into dummy variables
    select_columns = c("site", "growth_form", "seed_source_short"),
    remove_first_dummy = TRUE, 
    remove_selected_columns = TRUE
  ) 
colnames(change_rates_pca) # Display the column names of the PCA-ready data frame



change_rates_pca <- change_rates_joined |> 
  select(-c(plot, subplot, id, starts_with("delta_"), # Select columns for PCA, removing many redundant/non-percentage change metrics
            species, growth_form, genus, percent_change_number_necrotic_damaged, percent_change_percent_necrose, percent_change_percent_fungal, percent_change_number_fungal_damaged, percent_change_number_herb_damaged, percent_change_number_herb_damaged, family, diversity, tot_veg, herb_max, genus_richness, family_richness)) |> 
  mutate_if(is.numeric, ~datawizard::standardise(.)) |> # Standardize all numeric columns
  fastDummies::dummy_cols( # Convert selected categorical columns into dummy variables
    select_columns = c("site", "growth_form", "seed_source_short"),
    remove_first_dummy = TRUE, 
    remove_selected_columns = TRUE
  ) |> 
  rename( # Rename columns for better interpretability in PCA results
    "external invader" = seed_source_short_EI,
    "internal invader" = seed_source_short_II,
    "origin unclear" = `seed_source_short_not clear`,
    "regeneration" = seed_source_short_R,
    "species richness" = species_richness, 
    "shannon diversity" = shannon_diversity, 
    "fishers α" = fishers_alpha,
    "Δ height" = percent_change_height,
    "Δ leaves" = percent_change_number_leaves,
    "Δ herb damage" = percent_change_percent_herb
  )
colnames(change_rates_pca) # Display the column names of the final PCA-ready data frame



pca <- change_rates_pca |> 
  na.omit() |> # Remove NAs
  prcomp() # Perform PCA
summary(pca) # Summarize PCA results

change_rates_pca <- change_rates_joined |> 
  select(-c(plot, subplot, id, starts_with("delta_"), # Prepare data for grouping variable, excluding many change metrics
            species, growth_form, genus, percent_change_number_necrotic_damaged, percent_change_percent_necrose, percent_change_percent_fungal, percent_change_number_fungal_damaged, percent_change_number_herb_damaged, percent_change_number_herb_damaged, family, tot_veg, herb_max))|> 
  mutate(diversity = as.factor(diversity)) |> # Convert 'diversity' to factor
  #select_if(is.numeric) |> # (Commented out: selecting only numeric)
  na.omit() # Remove NAs
# Perform PCA (PCA object 'pca' is already calculated)
# Create the biplot with adjusted parameters for better visibility

# Ensure 'diversity' is a factor and matches the PCA individuals
active_individuals <- rownames(pca$x) # Get individuals used in PCA
change_rates_pca <- change_rates_joined |> 
  select(-c(plot, subplot, id, starts_with("delta_"), # Select columns to reconstruct grouping data
            species, growth_form, seed_source_short, genus, family, percent_change_number_necrotic_damaged, percent_change_percent_necrose, percent_change_percent_fungal, percent_change_number_fungal_damaged, percent_change_number_herb_damaged, percent_change_number_herb_damaged, percent_change_percent_herb, tot_veg, herb_max))|> 
  mutate(diversity = as.factor(diversity)) # Convert diversity to factor

# Subset to active individuals and ensure row order matches PCA
filtered_machine_data <- change_rates_pca[rownames(change_rates_pca) %in% active_individuals, ] # Filter to PCA individuals
filtered_machine_data <- filtered_machine_data[match(active_individuals, rownames(filtered_machine_data)), ] # Reorder to match PCA output

# Check that habillage is a factor and has the correct length
stopifnot(length(filtered_machine_data$diversity) == length(active_individuals)) # Check length consistency
stopifnot(is.factor(filtered_machine_data$diversity)) # Check factor type

# Create the biplot with correct habillage
biplot1 <- fviz_pca_biplot( # Generate biplot using factoextra
  pca,
  col.var = "contrib", # Color variables by contribution
  label = "var", # Label variables
 # habillage = filtered_machine_data$diversity, # Group individuals by 'diversity'
  repel = T # Use ggrepel for labels
)
biplot1 # Display the biplot

group.labels <- biplot1$data |> # Summarize group labels again
  summarise(xvar = mean(x), # Calculate mean x-coordinate
            yvar = mean(y), # Calculate mean y-coordinate
            .by = Groups) # Group by the 'Groups' column
#mutate(Groups = ifelse(Groups == "0", "No Machine Failure", "Machine Failure")) # (Commented out: renaming groups)

# Create a second biplot without individual points
biplot2 <- fviz_pca_biplot(pca, col.var = "contrib", 
                           label = "var", repel = TRUE, title = "Biplot grouped by plot status", palette = "rickandmorty", invisible = "ind") # Generate biplot without individuals

(bp_to_save <- biplot2 + # Save biplot with ggrepel labels
   
    # ggrepel::geom_label_repel(aes(x = xvar, y = yvar, label = Groups), data = group.labels) + # Add group labels using ggrepel
    #theme_ipsum() +
    scale_color_gradientn(colours = wesanderson::wes_palette("Zissou1", 100, type = "continuous"), trans = "sqrt")) # Apply Wes Anderson color palette

# Add group labels to the second biplot (using geom_label with repel=TRUE)
(bp_to_save2 <- biplot2 + #geom_label(aes(x = xvar, y = yvar, label = Groups), data = group.labels, repel = TRUE) + # Add group labels using geom_label with repel
    #theme_ipsum() + 
    scale_color_viridis_c()) # Apply Viridis color scale



ggsave("datas_and_notebooks/plots/pca.jpg", bp_to_save2, width = 12, height = 9) # Save the final biplot ('bp_to_save2') as a JPEG file



change_rates_joined |> 
  select(-c(plot, subplot, id, starts_with("delta_"), # Display a subset of the data (similar to PCA prep, but without standardization/dummification)
            species, growth_form, genus, percent_change_number_necrotic_damaged, percent_change_percent_necrose, percent_change_percent_fungal, percent_change_number_fungal_damaged, percent_change_number_herb_damaged, percent_change_number_herb_damaged, percent_change_percent_herb, family))|> 
  mutate(diversity = as.factor(diversity)) |> # Convert diversity to factor
  na.omit() # Remove NAs



change_rates_joined # Display the main data frame (change_rates_joined)



  
  # Calculate species richness/ genus richness/ family richness
  
  # Dataset description
  

# Define variable names and their meanings
variables <- c( # List of all variables in the final dataset
  "site", "plot", "subplot", "diversity", "id", "species", "genus", "family", "growth_form", "seed_source_short",
  "percent_change_height", "percent_change_number_leaves", "percent_change_number_herb_damaged", "percent_change_number_fungal_damaged", "percent_change_number_necrotic_damaged",
  "percent_change_percent_herb", "percent_change_percent_necrose", "percent_change_percent_fungal",
  "tot_veg", "herb_max", "grass", "fern", "herbaceous", "woody", "rock", "deadwood", "leaflitter", "moss", "saplings", "seedlings",
  "delta_height", "delta_number_leaves", "delta_number_herb_damaged", "delta_number_fungal_damaged", "delta_number_necrotic_damaged",
  "delta_percent_herb", "delta_percent_necrose", "delta_percent_fungal",
  "species_richness", "shannon_diversity", "chao1", "fishers_alpha", "genus_richness", "family_richness"
)

meanings <- c( # Corresponding list of meanings for each variable
  "Site identifier",
  "Plot identifier",
  "Subplot identifier",
  "Diversity level",
  "Unique plant ID",
  "Species name",
  "Genus name",
  "Family name",
  "Growth form",
  "Seed source (short code)",
  "Percent change in height",
  "Percent change in number of leaves",
  "Percent change in number of herbivore-damaged leaves",
  "Percent change in number of fungal-damaged leaves",
  "Percent change in number of necrotic-damaged leaves",
  "Percent change in percent herbivory",
  "Percent change in percent necrosis",
  "Percent change in percent fungal damage",
  "Total vegetation cover",
  "Maximum herb cover",
  "Grass cover",
  "Fern cover",
  "Herbaceous cover",
  "Woody cover",
  "Rock cover",
  "Deadwood cover",
  "Leaf litter cover",
  "Moss cover",
  "Number of saplings",
  "Number of seedlings",
  "Change in height",
  "Change in number of leaves",
  "Change in number of herbivore-damaged leaves",
  "Change in number of fungal-damaged leaves",
  "Change in number of necrotic-damaged leaves",
  "Change in percent herbivory",
  "Change in percent necrosis",
  "Change in percent fungal damage",
  "Species richness",
  "Shannon diversity index",
  "Chao1 richness estimator",
  "Fisher's alpha diversity",
  "Genus richness",
  "Family richness"
)

# Variables available for 2024
vars_2024 <- c("tot_veg", "herb_max", "grass", "leaflitter", "fern", "woody", "rock", "deadwood", "moss", "saplings", "seedlings", "herbaceous") # List of variables measured in 2024

# Create availability columns
available_2023 <- rep("x", length(variables)) # All variables are available from the 2023 survey (sapling/growth metrics)
available_2024 <- ifelse(variables %in% vars_2024, "x", "") # Mark variables available from the 2024 veg survey

# Calculate percent NA for each variable in change_rates_joined
percent_na <- sapply(variables, function(var) { # Loop through all variables
  if (var %in% names(change_rates_joined)) {
    round(mean(is.na(change_rates_joined[[var]])) * 100, 1) # Calculate and round the percentage of NA values
  } else {
    NA # Return NA if the variable is not in the dataframe
  }
})

# Create the summary table
dataset_overview <- tibble( # Create the final summary table
  Variable = variables,
  Meaning = meanings,
  `% NA` = percent_na,
  `2023` = available_2023,
  `2024` = available_2024
)

dataset_overview # Display the dataset overview table



glimpse(change_rates_joined) # Display a compact summary of the data frame structure


# Zeitplan



# Define the schedule data with a new 'Type' column
zeitplan <- tibble::tribble( # Create the schedule data frame
  ~Task, ~Start, ~End, 
  "Introduction to data and BEF China project, presentation of expose; clarify questions", "2025-10-01", "2025-11-14",
  "Digitalizing scans of 2024; increasing and improving data quality", "2025-11-15", "2025-12-03",
  "Data analysis and literature review; manuscript structure", "2025-12-04", "2026-01-01",
  "Development of manuscript for peer review", "2026-01-02", "2026-01-15",
  "Publication process", "2026-01-15", "2026-03-31"
) %>%
  mutate(
    Start = as.Date(Start), # Convert start date to Date object
    End = as.Date(End), # Convert end date to Date object
    Task = factor(Task, levels = rev(Task)), # Convert Task to a factor, reversing the order for plotting
    Type = case_when( # Assign a 'Type' based on the task order
      row_number() == 1 ~ "finished",
      row_number() == 2 ~ "hybrid",
      row_number() %in% c(3, 4) ~ "home office",
      row_number() == 5 ~ "hybrid"
    ),
    Type = factor(Type, levels = c("finished", "hybrid", "home office")) # Convert Type to a factor with defined levels
  )

# Define colors for each type
type_colors <- c( # Define custom colors
  "finished" = "#4daf4a",        # green
  "hybrid" = "#377eb8",         # blue
  "home office" = "#ff7f00"     # orange
)

# Plot the Zeitplan as a Gantt chart with color
ggplot(zeitplan, aes(y = Task, color = Type)) + # Initialize ggplot
  geom_segment(aes(x = Start, xend = End, yend = Task), size = 8) + # Draw the Gantt bars
  scale_x_date(date_breaks = "1 month", date_labels = "%b %Y") + # Format x-axis with monthly breaks
  #scale_color_manual(values = type_colors, name = "Arbeitsform") + # (Commented out: applying custom colors)
  labs( # Set plot labels
    title = "PhD Zeitplan",
    x = "Zeitraum",
    y = "Aufgabe"
  ) +
  theme_minimal(base_size = 14) + # Apply minimal theme
  theme( # Customize theme elements
    axis.text.y = element_text(size = 12),
    axis.text.x = element_text(angle = 45, hjust = 1),
    legend.position = "top"
  )



options(repr.plot.width = 15, repr.plot.height = 6) # Set plot output dimensions

# Define the schedule data with a new 'Type' column
zeitplan <- tibble::tribble( # Recreate the schedule data
  ~Task, ~Start, ~End, 
  "BEF China & data introduction; expose; clarify questions", "2025-10-01", "2025-11-14",
  "Digitalizing scans of 2024; increasing and improving data quality", "2025-11-15", "2025-12-03",
  "Data analysis and literature review; manuscript structure", "2025-12-04", "2026-01-01",
  "Development of manuscript for peer review", "2026-01-02", "2026-01-15",
  "Publication process", "2026-01-15", "2026-03-31"
) %>%
  mutate(
    Start = as.Date(Start), # Convert start date to Date object
    End = as.Date(End), # Convert end date to Date object
    Task = factor(Task, levels = rev(Task)), # Convert Task to a factor (reversed order)
    Type = case_when( # Assign a 'Type' based on the task order
      row_number() == 1 ~ "finished",
      row_number() == 2 ~ "hybrid",
      row_number() %in% c(3, 4) ~ "home office",
      row_number() == 5 ~ "hybrid"
    ),
    Type = factor(Type, levels = c("finished", "hybrid", "home office")) # Convert Type to a factor with defined levels
  )

# Define colors for each type
type_colors <- c( # Define custom colors
  "finished" = "#4daf4a",        # green
  "hybrid" = "#377eb8",         # blue
  "home office" = "#ff7f00"     # orange
)

# Plot the Zeitplan as a Gantt chart with color and task labels above bars
(tplot <- ggplot(zeitplan, aes(y = Task, color = Type)) + # Initialize ggplot
    geom_segment(aes(x = Start, xend = End, yend = Task), size = 8) + # Draw the Gantt bars
    geom_text( # Add task labels above the bars
      aes(
        x = Start + (End - Start) / 2, # Place label in the middle of the segment
        label = Task
      ),
      color = "black",
      size = 3,
      vjust = -4,
      hjust = 0.5,
      fontface = "bold"
    ) +
    scale_x_date(date_breaks = "1 week", date_labels = "%d %b %Y") + # Format x-axis with weekly breaks
    #scale_color_manual(values = type_colors, name = "Arbeitsform") + # (Commented out: applying custom colors)
    labs( # Set plot labels
      title = "PhD Timeline (first paper)",
      x = "Date",
      y = NULL
    ) +
    theme_minimal(base_size = 14) + # Apply minimal theme
    theme( # Customize theme elements (remove y-axis text/title)
      axis.text.y = element_blank(),
      axis.title.y = element_blank(),
      axis.text.x = element_text(angle = 45, hjust = 1),
      legend.position = "top"
    ) + 
    scale_color_viridis_d()) # Apply a discrete Viridis color scale

ggsave("datas_and_notebooks/plots/tplot.jpg", plot = tplot, width = 15, height = 6) # Save the plot to a JPEG file



length(unique(change_rates_joined$plot)) # Count the number of unique plots
length(unique(change_rates_joined$subplot)) # Count the number of unique subplots
unique(change_rates_joined$diversity) # Display the unique values in the 'diversity' column



