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

# SVI Open Source Code

# Authored by: 
# Phong Le, Public Health Data Scientist, pyv8@cdc.gov

# Reviewers/ Contributors: 
# Phong Le, Public Health Data Scientist, pyv8@cdc.gov
# Sarah Rockhill, Geospatial Epidemiologist, ppk8@cdc.gov
# Isabelle Flinn, System Analyst, uaa4@cdc.gov

# What is CDC/ATSDR Social Vulnerability Index?

# ATSDR’s Geospatial Research, Analysis, & Services Program (GRASP) created the Centers for Disease Control and  Prevention and Agency for Toxic Substances and Disease Registry Social Vulnerability Index (CDC/ATSDR SVI or simply SVI, hereafter) to help public health officials and emergency response planners identify and map the communities that will most likely need support before, during, and after a hazardous event. SVI indicates the relative vulnerability of every U.S. Census tract. Census tracts are subdivisions of counties for  which the Census collects statistical data. SVI ranks the tracts on 16 social factors, including unemployment,  racial and ethnic minority status, and disability, and further groups them into four related themes. Thus, each tract receives a ranking for each Census variable and for each of the four themes as well as an overall ranking. In addition to tract-level rankings, SVI 2010, 2014, 2016, 2018, and 2020 also have corresponding rankings at the county level. Notes below that describe “tract” methods also refer to county methods.

# What is new in the SVI 2020 updates?

# As our understanding of social vulnerability evolves over time, SVI must evolve as well. Beginning with SVI 2020, we made modifications to SVI theme names, individual SVI indicators, and adjunct data. We modified the name of Theme 2 from Household Composition & Disability to Household Characteristics, and we modified the name of Theme 3 from Minority Status & Language to Racial & Ethnic Minority Status. Within Theme 1 Socioeconomic Status, we modified the Below Poverty variable from the 100% federal poverty level to the 150% federal poverty level, considering the federal poverty line thresholds established for several federal health coverage policies.1 Similarly, we included a No Health Insurance variable in Theme 1 Socioeconomic Status as a lack of health insurance coverage is increasingly considered a marker of lower socioeconomic status and a barrier to healthcare access.2 Also, within Theme 1 Socioeconomic Status, we exchanged the Per Capita Income variable for Housing Cost Burden, which are households that spend 30% or more of annual income on housing costs. Recent studies have emphasized the importance of examining housing cost burden as opposed to per capita income as a better indicator of insufficient disposable income among households.3,4 Further, we moved the English Language Proficiency variable from Theme 3 Racial & Ethnic Minority Status to Theme 2 Household Characteristics because the ACS variables are based on language spoken at home and are better suited in the Household Characteristics theme. Additionally, although people in racial and ethnic minority groups are overall more likely to have limited English language proficiency than non-Hispanic whites, most (90.9%) are English language proficient.5 Thus, we moved the English Language Proficiency out of the Minority theme because it may have adversely affected the vulnerability ranking of communities in high minority areas of the country. Lastly, we included new adjunct variables: households without a computer with a broadband Internet subscription, and breakdowns of racial and ethnic minority populations. The coronavirus disease 2019 pandemic has underscored the importance of broadband Internet access as a social determinant of health, justifying the inclusion of data on the lack of broadband Internet access as an adjunct variable.6 While we aggregate all racial and ethnic minority persons in Theme 3 Racial & Ethnic Minority Status, we recognize that SVI users may be interested in its component populations. A thorough literature review and internal validation were conducted to finalize the construction of SVI 2020.

# https://www.atsdr.cdc.gov/placeandhealth/svi/documentation/SVI_documentation_2020.html

# Do I need a Census API key?

# If you plan to run over 500 API requests in a day, you will need to have your own Census API key. A link to generate your own key is below. However, for most users, having you own Census API key is not necessary. 

# https://api.census.gov/data/key_signup.html

# How do I navigate this script?

# Please click on the outline button in the top right of your RStudio editor. There is an outline highlighting every step of the SVI calculation process for your convenience.

# Do these methods create results that mirror the data provided on the CDC SVI portal exactly?

# Any discrepancy between this output and what is provided through the official CDC SVI portal are due to rounding differences. Discrepancies have been determined to be minor and insignificant.

# https://www.atsdr.cdc.gov/placeandhealth/svi/data_documentation_download.html

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
