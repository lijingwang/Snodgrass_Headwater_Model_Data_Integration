# The Role of Snow and Subsurface Heterogeneity in a Mountainous Headwater Catchment in Colorado: A Model-Data Integration Approach

This repository contains the data and modeling code associated with the manuscript titled **"The Role of Snow and Subsurface Heterogeneity in a Mountainous Headwater Catchment in Colorado: A Model-Data Integration Approach"**, submitted to *Water Resources Research*.

## Corresponding Author

**Lijing Wang**  
Department of Earth Sciences, University of Connecticut  
Email: lijing.wang@uconn.edu  

Earth and Environmental Sciences Area, Lawrence Berkeley National Laboratory  
Email: lijingwang@lbl.gov  

## Repository Structure

- `/observations/`:  
  Contains all observational datasets, including:
  - Snow depths: `/observations/snow_DTP/`
  - Headwater stream discharge: `/observations/stream_discharge/`
  - Groundwater levels: `/observations/groundwater_levels/`
  - Snow density from SNOTEL Butte Station: `/observations/SNOTEL_Butte_308/`  
  Location metadata for all observation sites is also included in this directory.

- `/src/`:  
  Contains Python scripts and Jupyter notebooks for Monte Carlo simulations using ATS.  
  - The file `/src/simulations.ipynb` sets up simulation directories in `/simulations/` and `/posterior_simulations/` and runs ATS models for all Monte Carlo samples. 
  - This workflow builds on code from the [ALTEMIS ensemble-sim repository](https://github.com/ALTEMIS-DOE/ensemble-sim).

- `/simulations/`:  
  Includes:
  - ATS XML template: `/simulations/xml_transient.tpl`
  - Shared input files: `/simulations/shared_files/`
  - Prior distributions specified in: `/simulations/param_mapping.yml`  
  This folder supports prior simulations; model outputs are not stored here.

- `/posterior_simulations/`:  
  Mirrors the structure of `/simulations/`, supporting posterior simulations. Model outputs are not stored in this directory.

## License

This repository is shared under the MIT License, allowing use, modification, and distribution with appropriate attribution to the original authors.

---

## Acknowledgments

This work was supported as part of the Watershed Function Science Focus Area funded by the U.S. Department of Energy, Office of Science, Office of Biological and Environmental Research under Contract No. DE-AC02-05CH11231.

**Note:** This is a temporary repository. Final data and model files will be archived on [ESS-DIVE](https://ess-dive.lbl.gov/).

For questions, please contact [lijing.wang@uconn.edu](mailto:lijing.wang@uconn.edu).
