<p align="center">
  <img src="images/069 GRASP Logo tiny_Color.png"/>
</p>

**Welcome to the Geospatial Research, Analysis, and Services Program (GRASP) Place & Health Code Hub!**

GRASP leads the application of geospatial science, data, analysis, technology, and visualization at the intersection of place and health. We strengthen public health science and practice by examining environmental exposures, infectious and chronic disease, and the built environment. GRASP supports the Centers for Disease Control and Prevention (CDC) and the Agency for Toxic Substances and Disease Research in public health emergency readiness, response, and recovery by providing expertise, guidance, and support.

Visit the [GRASP homepage](https://www.atsdr.cdc.gov/place-health/index.html) to learn more about our work.

# Index Open Source Code

**General disclaimer** This repository was created for use by CDC programs to collaborate on public health related projects in support of the CDC mission. GitHub is not hosted by CDC, but is a third-party website used by CDC and its partners to share information and collaborate on software. CDC use of GitHub does not imply endorsement of any service, product, or enterprise.

## Overview

Every community must prepare for and respond to hazardous events, whether natural disasters, disease outbreaks, or environmental exposures. The degree to which a community exhibits certain environmental, health, or social conditions may affect that community's ability to prevent human suffering and financial loss in the event of disaster. These factors can be summarized using place-based indexes.
GRASP develops national indexes to help public health officials, planners, and partners identify and map communities that may need support before, during, and after hazardous events. Each index delivers a single ranking for a defined geographic unit so users can compare areas across a state or across the United States.

This repository contains the code used to calculate GRASP indexes. The purpose of this repository is to document how the indexes are constructed, provide transparency in methods, and allow users to reproduce the results. All data processing steps, indicator calculations, and ranking procedures are implemented in code. Scripts are written in R, Python, and supporting geospatial workflows. By making this code publicly available, we aim to support reproducibility, enable methodological review, and facilitate community-driven improvements to index construction.

## What are the GRASP Indexes?
GRASP indexes are national tools that combine multiple indicators into a single, comparable ranking for each geographic area. Depending on the project, the geographic unit may be a census tract or a ZIP Code Tabulation Area (ZCTA).

Each index ranks areas based on a defined set of indicators. Indicators are grouped into related themes or modules. For each geographic unit, rankings are calculated for individual indicators, for each theme or module, and for the overall index. Percentile ranking values range from 0 to 1, with higher values indicating greater relative burden or vulnerability.

Indexes are population-level tools. They do not determine the likelihood that an individual will experience a specific outcome. Instead, they describe relative conditions across communities.

## How can the indexes be used?

Indexes provide specific, spatially relevant information that can help public health officials and local planners prepare for and respond to hazardous events.
Indexes can be used to:

1. Assess community need during preparedness planning
2. Identify and prioritize areas that may require additional attention
3. Support mapping and spatial analysis
4. Inform allocation of resources and interventions
5. Establish meaningful goals and measure progress toward equity
6. Characterize unique local factors driving vulnerability to inform policy and decision-making

Because not all populations are equally affected by hazards, knowing where conditions are concentrated can help agencies target resources more effectively and coordinate response activities.

## What data are included?

Indexes rely on nationally available datasets. A primary source for many indicators is the U.S. Census Bureau American Community Survey (ACS) 5-year estimates. These data provide demographic, socioeconomic, housing, and language measures at small-area geographic levels. The code in this repository pulls data from public APIs, including the Census API, to ensure reproducibility and access to the most current data releases.
Additional data sources may include:

1. CDC surveillance systems and model-based health estimates
2. Environmental monitoring or modeled data
3. Land cover datasets
4. Federal geospatial products
5. EPA air quality and environmental data
6. NOAA and NASA climate and meteorological data
7. Emergency response and disaster datasets

Indicators are selected based on review of the literature, existing indices, subject matter expertise, data availability nationwide, and statistical evaluation. Data must be available at the geographic level used in the index and must relate to the concept being measured. To be considered for inclusion, indicators must meet defined criteria including accuracy, reliability, analytical soundness, availability at scale, and regular updates to allow for future index iterations.

## How are the indexes calculated?

Although each index focuses on a different topic area, the general approach is similar.

**Indicator Selection:** Indicators are first chosen based on literature review, subject matter expertise, and statistical evaluation. 

**Data Processing:** Once indicators are selected, data are cleaned and harmonized. This process includes calculating percentages or rates from raw estimates, aligning datasets to consistent geographic units, addressing missing values, and excluding areas where estimates are unstable due to small population sizes. 

**Standardization:** Indicator rankings are calculated by ordering values for all geographic areas in the dataset and assigning a percentile rank between 0 and 1. In most cases, 0 represents the lowest observed value and 1 represents the highest. For some indicators measuring protective factors or environmental amenities, the ranking may be inverted so that higher percentile ranks consistently indicate greater vulnerability or burden.

**Thematic Aggregation:** Indicators are grouped into themes or modules. Theme scores are calculated by averaging the percentile-ranked indicators within each theme. Theme scores are then percentile ranked.

**Composite Index Construction:** The overall index score is calculated by averaging theme or module rankings. Themes are typically weighted equally. The overall score is then percentile ranked to produce the final index ranking.

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
