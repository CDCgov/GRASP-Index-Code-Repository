<p align="center">
  <img src="images/069 GRASP Logo tiny_Color.png"/>
</p>

**Welcome to the Geospatial Research, Analysis, and Services Program (GRASP) Place & Health Code Hub!**

GRASP leads the application of geospatial science, data, analysis, technology, and visualization at the intersection of place and health. We strengthen public health science and practice by examining environmental exposures, infectious and chronic disease, and the built environment. GRASP supports the Centers for Disease Control and Prevention (CDC) and the Agency for Toxic Substances and Disease Research in public health emergency readiness, response, and recovery by providing expertise, guidance, and support.

Visit the [GRASP homepage](https://www.atsdr.cdc.gov/place-health/index.html) to learn more about our work.

---

| Section           | Required | Editable |
| :---------------- | :------: | :---: |
| Title             |   True   | Yes   |
| General disclaimer|   True   | No    |
| Metadata tags     |   True   | Yes   |
| Overview          |   True   | Yes   |
| Installation      |  False   | Yes   |
| Usage             |  False   | Yes   |
| Contributing      |  False   | Yes   |
| How to cite       |  False   | Yes   |
| Standard Notices  |  True    | No    |

*Note: GitHub will automatically generate a table of contents in rendered markdown files based on section headings. You can view the table of contents for a README file by clicking the menu icon at the top left of the rendered page.*

# CDC/ATSDR SVI 2022 ----

# Authored by: 
# Phong Le, Public Health Data Scientist, ple@cdc.gov

# Reviewers/ Contributors: 
# Phong Le, Public Health Data Scientist, pyv8@cdc.gov
# Sarah Rockhill, Geospatial Epidemiologist, ppk8@cdc.gov
# Frank Curriero, Geospatial Consultant, fgc0@cdc.gov

## CDC/ATSDR Social Vulnerability Index ----
# Social vulnerability refers to the demographic and socioeconomic factors (such as poverty, lack of access to transportation, and crowded 
# housing) that adversely affect communities that encounter hazards and other community-level stressors. These stressors can include natural 
# or human-caused disasters (such as tornadoes or chemical spills) or disease outbreaks (such as COVID-19). For more info, access the link below.
# https://www.atsdr.cdc.gov/place-health/php/svi/index.html

## Changes in SVI over time ----
# The CDC/ATSDR SVI has changed four times over the years as can be seen in the timeline linked below:
# https://www.atsdr.cdc.gov/place-health/php/svi/index.html#cdc_generic_section_4-changes-over-time

## SVI Methodology ----
# Please refer to the SVI documentation linked below which is stratified by year. 
# https://www.atsdr.cdc.gov/place-health/php/svi/svi-data-documentation-download.html

## Census API Key ----
# If you plan to run over 500 API requests in a day, you will need to have your own Census API key. 
# A link to generate your own key is below. 
# However, for most users, having your own Census API key is not necessary. 
# https://api.census.gov/data/key_signup.html

## SVI R Code Output Differences ----
# County level results are exactly the same as official CDC outputs. 
# Tract level results are minimally different (within 0.0002) due to the different tracts recognized 
# in the SVI calculation and the Census API. 

## SVI Calculation Steps ----
# 1. E Variables: Obtain estimates of the CDC/ATSDR SVI variables from the Census Bureau. 
# 2. EP Variables: Obtain or derive percentages for the 16 CDC SVI variables. 
# 3. EPL Variables: Rank the EP variables to get percentile rankings (or the CDC/ATSDR SVI rankings) for each of the 16 variables.
# 4. SPL Variables: Sum the EPL variables by theme. 
# 5. RPL Variables: Rank the theme-specific SPL variable. 
# 6. Overall SPL Variable (SPL_THEMES): Sum the SPL variables from all four themes. 
# 7. Overall RPL Variable (RPL_THEMES): Rank SPL_THEMES. This is the overall summary ranking variable. 

## How to run the code ----
# 1) Install required packages:
#    install.packages(c("tidyverse", "tidycensus", "purrr"))
# 2) Set your Census API key (optional):
#    tidycensus::census_api_key("YOUR_KEY_HERE", install = TRUE)
#    Then restart R (Session > Restart R).
# 3) Choose settings in the "User settings" section below and run the script.

# Missing value convention ----
# The official SVI outputs use -999 to indicate a value is unavailable or not possible to compute.
# In this script, -999 values are treated as missing for ranking.

**Organization:** Name of CDC division, center, or office responsible for the code repo (e.g., ATSDR | GRASP).<br>
**Contact Email:** Email for metadata or repository inquiries. Only use public email address (e.g,. do not include your CDC username). <br>
**Status:** Project development status (e.g., Maintained, Deprecated).<br>
**Keywords:** Comma-separated list of technologies, domains, or topics (e.g., geoprocessing, cholera, prediction). 

**General disclaimer** This repository was created for use by CDC programs to collaborate on public health related projects in support of the [CDC mission](https://www.cdc.gov/about/cdc/#cdc_about_cio_mission-our-mission).  GitHub is not hosted by CDC, but is a third-party website used by CDC and its partners to share information and collaborate on software. CDC use of GitHub does not imply endorsement of any service, product, or enterprise. 

## Overview

*Describe the purpose of your project. Add additional sections as necessary to help collaborators and potential collaborators understand and use your project. Provide users a contact email or website to send requests for assistance.* 

## Documentation

*Use this section to display documentation for your project and/or links to supporting documentation (e.g., data dictionary, user guides, published articles) if hosted on another website. If your project has extensive documentation that is not currently available on the web, consider adding it to a [project wiki](https://docs.github.com/en/communities/documenting-your-project-with-wikis/about-wikis).* 

## Installation

*This section can be used to explain how end users can install and set up the project locally, if applicable. Describe required prerequisites or dependencies the user must in order for the project to work properly. Provide tailored instructions for Windows, MacOS, and Linux systems if necessary.* 

## Usage

*Provide brief examples of how to use the project. If you have built vignettes for your project, consider providing links to that content in this section. To include fenced code blocks, wrap your code with three backticks (```) as in the example below.* 

```
devtools::install_github("username/package")
```

## Contributing

*Allowing public contributions to your project is core component of open source projects. Use this section to describe rules for contribution. If you allow contributions, you must including contributing guidelines and a code of conduct. Example text is provided below. Edit as needed.* 

We welcome and appreciate contributions. Please review our [contributing guidelines](CONTRIBUTING.md) for details on how to contribute to this project. 

By participating in this project, you agree to adhere the [Technology Transformation Service (TTS) code of conduct](https://handbook.tts.gsa.gov/about-us/code-of-conduct/) 
and to follow the [U.S. Department of Health and Human Services Rules of Behavior for Use of Information & IT Resources](https://security.cms.gov/policy-guidance/hhs-policy-rules-behavior-use-information-it-resources).

To report a bug or request a new feature, open a new issue.

## Citation

*Provide a citation for your project.* 

## See Also 

* [Thanks and Acknowledgements](thanks.md)
* [Disclaimer](DISCLAIMER.md)
* Explore additional GRASP projects:
    * [Project name](https://www.github repo url)

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
