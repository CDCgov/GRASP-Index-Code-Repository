<p align="center">
  <img src="images/069 GRASP Logo tiny_Color.png"/>
</p>

**Welcome to the Geospatial Research, Analysis, and Services Program (GRASP) Place & Health Code Hub!**

GRASP leads the application of geospatial science, data, analysis, technology, and visualization at the intersection of place and health. We strengthen public health science and practice by examining environmental exposures, infectious and chronic disease, and the built environment. GRASP supports the Centers for Disease Control and Prevention (CDC) and the Agency for Toxic Substances and Disease Research in public health emergency readiness, response, and recovery by providing expertise, guidance, and support.

Visit the [GRASP homepage](https://www.atsdr.cdc.gov/place-health/index.html) to learn more about our work.

# Index Open Source Code

**General disclaimer** This repository was created for use by CDC programs to collaborate on public health related projects in support of the CDC mission. GitHub is not hosted by CDC, but is a third-party website used by CDC and its partners to share information and collaborate on software. CDC use of GitHub does not imply endorsement of any service, product, or enterprise.

## Overview
The Geospatial Research, Analysis, and Services Program (GRASP) develops and maintains national, place-based indexes that characterize community conditions related to environmental exposures, health outcomes, and social and built environment factors. These indexes are designed to support public health preparedness, planning, and response by identifying geographic areas where populations may be more likely to experience adverse outcomes during hazardous events.

This repository provides the open source code used to calculate GRASP-developed indexes. It is intended to promote transparency, reproducibility, and collaboration across the public health, academic, and data science communities. The codebase includes implementations in R, Python, and supporting geospatial workflows where applicable.

All indexes follow a consistent methodological framework:

1. Selection of theoretically and empirically grounded indicators
2. Standardization of indicators across geographic units
3. Construction of thematic modules
4. Aggregation into composite index scores
5. Percentile ranking to support relative comparison across areas
6. The repository includes the scripts and documentation necessary to reproduce index calculations from publicly available data sources.

## Purpose

GRASP indexes are population-level tools designed to identify communities that may require additional support before, during, or after hazardous events. They inform preparedness planning and resource allocation by translating complex data into comparable geographic measures. These indexes also support spatial analysis of vulnerability, exposure, and health burden, enabling users to examine patterns across regions and populations. Together, they facilitate data-driven decision making at federal, state, and local levels.

These indexes do not predict individual-level outcomes. Instead, they provide standardized, geographically comparable measures that describe relative conditions across census-defined areas. The primary geographic unit for most indexes is the U.S. Census Bureau’s geography (e.g., census tracts or ZIP Code Tabulation Areas). Index values are relative within a defined comparison set, such as a state or the United States as a whole. This repository is designed to make index construction fully transparent. All transformation steps, statistical procedures, and ranking methods are explicitly coded and documented.

## Data Sources

Index calculations rely primarily on nationally available, publicly accessible datasets. Core sources commonly include:

1. U.S. Census Bureau American Community Survey (ACS) 5-year estimates: Provides socioeconomic, demographic, housing, and language variables.
2. CDC surveillance systems and model-based small area estimates: Used for health condition prevalence and related indicators.
3. Environmental datasets: Including modeled meteorological data, air quality metrics, and land cover characteristics.
4. Federal geospatial products: Such as the National Land Cover Database and related raster-based land surface measures.

Indicators are selected based on data quality, national coverage, reproducibility, conceptual relevance, and routine update cycles. Where necessary, geographic crosswalks are applied to align datasets to a consistent spatial unit.

## Methodology

Although each index has unique features, the calculation process follows a shared structure.

Indicator Selection:

Indicators are chosen based on literature review, subject matter expertise, and statistical evaluation. Inclusion criteria typically require that data be available nationwide at a consistent geographic level, conceptually linked to vulnerability or burden, and reproducible over time.

Data Processing:

Once indicators are selected, data are cleaned and harmonized. This process includes calculating percentages or rates from raw estimates, aligning datasets to consistent geographic units, addressing missing values, and excluding areas where estimates are unstable due to small population sizes. When data originate at differing spatial scales, geographic crosswalks are applied to ensure consistency.

Standardization:

Indicators are then standardized to allow comparison across geographic areas. In most cases, this is accomplished by calculating percentile ranks across all units in the comparison set. Percentile ranking transforms indicators to a common scale ranging from 0 to 1, where higher values indicate greater relative burden or vulnerability. In specific cases, alternative approaches such as threshold-based flagging may be used to address methodological considerations.

Thematic Aggregation:

Standardized indicators are grouped into conceptual modules representing domains such as socioeconomic conditions, health-related characteristics, environmental exposures, or built environment features. Within each module, indicator percentile ranks are averaged to generate a module score. The module score is then percentile ranked to ensure consistent scaling across domains.

Indicator percentile ranks are averaged:

The overall index score is constructed by averaging module rankings. Modules are typically weighted equally unless methodological justification supports an alternative approach. 

Composite Index Construction:

The resulting composite score is again percentile ranked to produce a final index ranking suitable for mapping and comparative analysis.

## Standard Notices 

### Public Domain Standard Notice
This repository constitutes a work of the United States government and is not
subject to domestic copyright protection under 17 USC § 105. This repository is in
the public domain within the United States, and copyright and related rights in
the work worldwide are waived through the [CC0 1.0 Universal public domain dedication](https://creativecommons.org/publicdomain/zero/1.0/).
All contributions to this repository will be released under the CC0 dedication. By
submitting a pull request, you are agreeing to comply with this waiver of
copyright interest.

### License Standard Notice
The repository utilizes code licensed under the terms of the Apache Software
License and therefore is licensed under ASL v2 or later.

The source code in this repository is free: you can redistribute it and/or modify it under
the terms of the Apache Software License version 2, or (at your option) any
later version.

This source code in this repository is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY and without the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE. See the Apache Software License for more details.

You should have received a copy of the Apache Software License along with this
program. If not, see http://www.apache.org/licenses/LICENSE-2.0.html.

The source code forked from other open source projects will inherit its license.

### Privacy Standard Notice
This repository contains only non-sensitive, publicly available data and
information. All material and community participation is covered by the
[Disclaimer](DISCLAIMER.md)
and [Code of Conduct](code-of-conduct.md).
For more information about CDC's privacy policy, please visit [http://www.cdc.gov/other/privacy.html](https://www.cdc.gov/other/privacy.html).

### Contributing Standard Notice
Anyone is encouraged to contribute to the repository by [forking](https://help.github.com/articles/fork-a-repo)
and submitting a pull request. (If you are new to GitHub, you might start with a
[basic tutorial](https://help.github.com/articles/set-up-git).) By contributing
to this project, you grant a world-wide, royalty-free, perpetual, irrevocable,
non-exclusive, transferable license to all users under the terms of the
[Apache Software License v2](http://www.apache.org/licenses/LICENSE-2.0.html) or
later.

All comments, messages, pull requests, and other submissions received through
CDC including this GitHub page may be subject to applicable federal law, including but not limited to the Federal Records Act, and may be archived. Learn more at [http://www.cdc.gov/other/privacy.html](http://www.cdc.gov/other/privacy.html).

### Records Management Standard Notice
This repository is not a source of government records, but is a copy to increase
collaboration and collaborative potential. All government records will be
published through the [CDC web site](http://www.cdc.gov).
