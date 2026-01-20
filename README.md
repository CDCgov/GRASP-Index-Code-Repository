<p align="center">
  <img src="images/069 GRASP Logo tiny_Color.png"/>
</p>

**Welcome to the Geospatial Research, Analysis, and Services Program (GRASP) Place & Health Code Hub!**

GRASP leads the application of geospatial science, data, analysis, technology, and visualization at the intersection of place and health. We strengthen public health science and practice by examining environmental exposures, infectious and chronic disease, and the built environment. GRASP supports the Centers for Disease Control and Prevention (CDC) and the Agency for Toxic Substances and Disease Research in public health emergency readiness, response, and recovery by providing expertise, guidance, and support.

Visit the [GRASP homepage](https://www.atsdr.cdc.gov/place-health/index.html) to learn more about our work.

## Overview

CDC/ATSDR SVI 2022 Open Source R Code

Authored by:
Phong Le, Public Health Data Scientist

Reviewers/ Contributors:
Phong Le, Public Health Data Scientist
Sarah Rockhill, Geospatial Epidemiologist, srockhill@cdc.gov

Frank Curriero, Geospatial Consultant, fcurriero@cdc.gov

Ryan Davis, Geospatial Consultant
Elizabeth Pembleton, epembleton@cdc.gov

CDC/ATSDR Social Vulnerability Index
Please refer to the link below to learn more about SVI.
https://www.atsdr.cdc.gov/placehealth/php/svi/index.html

Changes in SVI over time
The CDC/ATSDR SVI has changed four times over the years as can be seen in the timeline linked below:
https://www.atsdr.cdc.gov/placehealth/php/svi/index.html#cdc_generic_section_4changesovertime

SVI Methodology
Please refer to the SVI documentation linked below which is stratified by year.
https://www.atsdr.cdc.gov/placehealth/php/svi/svidatadocumentationdownload.html

Census API Key
If you plan to run over 500 API requests in a day, you will need to have your own Census API key.
A link to generate your own key is below.
However, for most users, having your own Census API key is not necessary.
https://api.census.gov/data/key_signup.html

SVI R Code Output Differences
County level results are exactly the same as official CDC outputs.
Tract level results are minimally different (within 0.0002) due to the different tracts recognized
in the SVI calculation and the Census API.

SVI Calculation Steps

E Variables: Obtain estimates of the CDC/ATSDR SVI variables from the Census Bureau.

EP Variables: Obtain or derive percentages for the 16 CDC SVI variables.

EPL Variables: Rank the EP variables to get percentile rankings (or the CDC/ATSDR SVI rankings) for each of the 16 variables.

SPL Variables: Sum the EPL variables by theme.

RPL Variables: Rank the themespecific SPL variable.

Overall SPL Variable (SPL_THEMES): Sum the SPL variables from all four themes.

Overall RPL Variable (RPL_THEMES): Rank SPL_THEMES. This is the overall summary ranking variable.

How to run the code

Install required packages:
install.packages(c("tidyverse", "tidycensus", "purrr"))

Set your Census API key (optional):
tidycensus::census_api_key("YOUR_KEY_HERE", install = TRUE)
Then restart R (Session > Restart R).

Choose settings in the "User settings" section below and run the script.

Missing value convention
The official SVI outputs use -999 to indicate a value is unavailable or not possible to compute.
In this script, -999 values are treated as missing for ranking.

## Citation

CDC/ATSDR Social Vulnerability Index (SVI) 2022 Calculation Code (R). U.S. Department of Health and Human Services, Agency for Toxic Substances and Disease Registry; 2025.
Available from: https://www.atsdr.cdc.gov/place-health/php/svi/svi-data-documentation-download.html

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
