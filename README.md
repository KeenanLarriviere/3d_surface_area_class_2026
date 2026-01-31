# 3d_surface_area_class_2026
This project focuses on measuring the surface area of limpet shells using 3D scan data. Raw scans are processed into 
3D mesh models, which are then analyzed computationally to extract surface area measurements for downstream 
ecological and morphological analyses.

The workflow is designed to be reproducible and modular, separating raw data, processed models, analysis scripts, and 
outputs.

---

## Project Structure

3d_surface_area_class_2026/
├── raw_scans/
├── processed_stl_models/
├── scripts/
├── output/
└── README.md

### Directory Descriptions

- **`raw_scans/`**  
  Contains the original 3D scan data of limpet shells.  
  These files are treated as read-only and should not be modified directly.

- **`processed_stl_models/`**  
  Contains cleaned and processed 3D mesh models generated from the raw scans.  
  All models are saved in `.stl` format and are used as the input for surface area calculations.

- **`scripts/`**  
  Contains scripts used to process STL files and extract surface area measurements.  
  This may include mesh cleaning, validation, and surface area computation workflows.

- **`output/`**  
  Contains derived data products, primarily surface area measurements for each limpet shell.  

---

## Workflow Overview

1. **Scan acquisition**  
   Limpet shells are scanned and stored in `raw_scans/`.

2. **Model processing**  
   Raw scans are converted into cleaned, watertight 3D mesh models (`.stl`) and stored in `processed_stl_models/`.

3. **Surface area extraction**  
   Scripts in `scripts/` are used to calculate surface area from the STL models.

4. **Data output**  
   Surface area results are saved to `output/` for analysis and visualization.

---

## Notes

- This repository does not contain raw or processed data by default unless explicitly added.
- Empty directories are tracked using placeholder files to preserve project structure.
- Scripts should be documented internally with comments describing assumptions and units.

