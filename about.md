---
title: About
layout: main
---
<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
    <a class="navbar-brand js-scroll-trigger" href="#page-top">
        <span class="d-block d-lg-none"></span>
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="{{'' | absolute_url}}">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="#">Top of Page</a>
            </li>
            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="#getting-started">Getting Started</a>
            </li>
            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="#running-the-script">Running the script</a>
            </li>
            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="#querying-and-testing">Querying and Testing</a>
            </li>
            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="#applications">Applications</a>
            </li>
            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="#in-use">In Use</a>
            </li>
            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="#built-with">Built With</a>
            </li>
            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="#contributing">Contributing</a>
            </li>
            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="#code-of-conduct">Code of Conduct</a>
            </li>
            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="#versioning">Versioning</a>
            </li>
            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="#license">License</a>
            </li>
            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="#authors">Authors</a>
            </li>
            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="#acknowledgments">Acknowledgments</a>
            </li>
        </ul>
    </div>
</nav>

Semantic Data Dictionary project description goes here

## Getting Started

These instructions will let get you started on creating your own Semantic Data Dictionaries.

### Prerequisites

There are several required prerequisites to using the sdd2rdf.py script detailed [here]().

## Built With
* [Python](https://www.python.org/) - The programming language used
* [pandas](https://pandas.pydata.org/) - File reading, parsing, and writing
* [configparser](https://pypi.org/project/configparser/) - Configuration handling
* [rdflib](https://github.com/RDFLib/rdflib) - Semantics

### Tutorial

A step by step series of instructions and examples for installing the required libraries, creating an appropriate directory structure can be found [here](tutorial.html).

## Running the script

The sdd2rdf.py script can be run using python by specifying a configuration file associated with a project.

```
python sdd2rdf.py ExampleProject/config/config.ini.example
```

## Querying and Testing


## Applications

### Software applications that can be used to interpret Semantic Data Dictionaries

* [hadatac](https://github.com/paulopinheiro1234/hadatac)
* [sdd2rdf](https://github.com/tetherless-world/SemanticDataDictionary)
* [setlr](https://github.com/tetherless-world/setlr)
* [whyis](https://github.com/tetherless-world/whyis)

Additional notes about how to use Semantic Data Dictionaries on a live system can be found [here](tutorial.html).

## In Use

* NIH CHEAR through Mount Sinai School of Medicine
* Gates project through RPI CASE
* CBIS Experiment through RPI CASE
* United Nations' ELM through Yale's CEA
* Big Data Ceara through UNIFOR
* RPI TWC encoding of NHANES 
* Brazil's Global Burden of Disease through UFMG 
* RPI HEALS encoding of SEER and CIVIC for Breast Cancer Staging 
* RPI HEALS encoding of Medical Information Mart for Intensive Care (MIMIC) III 
* RPI HEALS encoding of Synthea Synthetic Data 
* RPI HEALS encoding of USDA Food Data

## Contributing

When contributing to this repository, please first discuss the change you wish to make via issue,
email, or any other method with the owners of this repository before making a change. 

Please note we have a code of conduct, please follow it in all your interactions with the project.

### Pull Request Process

1. Ensure any install or build dependencies are removed before the end of the layer when doing a 
   build.
2. Update the README.md with details of changes to the interface, this includes new environment 
   variables, exposed ports, useful file locations and container parameters.
3. Increase the version numbers in any examples files and the README.md to the new version that this
   Pull Request would represent. 
4. You may merge the Pull Request in once you have the sign-off of two other developers, or if you 
   do not have permission to do that, you may request the second reviewer to merge it for you.

## Code of Conduct

### Our Pledge

In the interest of fostering an open and welcoming environment, we as
contributors and maintainers pledge to making participation in our project and
our community a harassment-free experience for everyone, regardless of age, body
size, disability, ethnicity, gender identity and expression, level of experience,
nationality, personal appearance, race, religion, or sexual identity and
orientation.

### Our Standards

Examples of behavior that contributes to creating a positive environment
include:

* Using welcoming and inclusive language
* Being respectful of differing viewpoints and experiences
* Gracefully accepting constructive criticism
* Focusing on what is best for the community
* Showing empathy towards other community members

Examples of unacceptable behavior by participants include:

* The use of sexualized language or imagery and unwelcome sexual attention or
advances
* Trolling, insulting/derogatory comments, and personal or political attacks
* Public or private harassment
* Publishing others' private information, such as a physical or electronic
  address, without explicit permission
* Other conduct which could reasonably be considered inappropriate in a
  professional setting

### Our Responsibilities

Project maintainers are responsible for clarifying the standards of acceptable
behavior and are expected to take appropriate and fair corrective action in
response to any instances of unacceptable behavior.

Project maintainers have the right and responsibility to remove, edit, or
reject comments, commits, code, wiki edits, issues, and other contributions
that are not aligned to this Code of Conduct, or to ban temporarily or
permanently any contributor for other behaviors that they deem inappropriate,
threatening, offensive, or harmful.

### Scope

This Code of Conduct applies both within project spaces and in public spaces
when an individual is representing the project or its community. Examples of
representing a project or community include using an official project e-mail
address, posting via an official social media account, or acting as an appointed
representative at an online or offline event. Representation of a project may be
further defined and clarified by project maintainers.

### Enforcement

Instances of abusive, harassing, or otherwise unacceptable behavior may be
reported by contacting the project team at [tetherless@cs.rpi.edu]. All
complaints will be reviewed and investigated and will result in a response that
is deemed necessary and appropriate to the circumstances. The project team is
obligated to maintain confidentiality with regard to the reporter of an incident.
Further details of specific enforcement policies may be posted separately.

Project maintainers who do not follow or enforce the Code of Conduct in good
faith may face temporary or permanent repercussions as determined by other
members of the project's leadership.

### Attribution

This Code of Conduct is adapted from the [Contributor Covenant][homepage], version 1.4,
available at [http://contributor-covenant.org/version/1/4][version]

[homepage]: http://contributor-covenant.org
[version]: http://contributor-covenant.org/version/1/4/

This adapted version was retrieved from [PurpleBooth](https://gist.github.com/PurpleBooth/b24679402957c63ec426)
## Versioning

We use [...]() for versioning. For the versions available, see the [sdd2rdf](https://github.com/tetherless-world/SemanticDataDictionary). 

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Authors

* **Sabbir M. Rashid** - *Graduate Student* - Rensselaer Polytechnic Institute, Troy, NY, 12180, USA
* **James P. McCusker** - *PhD* - Rensselaer Polytechnic Institute, Troy, NY, 12180, USA
* **Paulo Pinheiro** - *PhD* - Rensselaer Polytechnic Institute, Troy, NY, 12180, USA
* **Marcello P. Bax** - *PhD* - Universidade Federal de Minas Gerais, Belo Horizonte - MG, 31270-901, BR
* **Henrique O. Santos** - *PhD* - Rensselaer Polytechnic Institute, Troy, NY, 12180, USA
* **Jeanette A. Stingone** - *PhD* - Columbia University Irving Medical Center, New York, NY, 10032, USA
* **Deborah L. McGuinness** - *PhD* - Rensselaer Polytechnic Institute, Troy, NY, 12180, USA


See also the list of contributors who participated in this project below.

## Acknowledgments

This work is supported by 
* The National Institute of Environmental Health Sciences (NIEHS) Award 0255-0236-4609 / 1U2CES026555-01
* IBM Research AI through the AI Horizons Network
* The Gates Foundation through the Healthy Birth, Growth, and Development knowledge integration (HBGDki) project
* The CAPES Foundation Senior Internship Program Award 88881.120772 / 2016-01

We acknowledge the members of the Tetherless World Constellation (TWC) as well as the members of the Institute for Data Exploration and Applications (IDEA) at Rensellaer Polytechnic Institute (RPI) for their contributions, including 
* John Erickson
* Kristin Bennett
* Jason Liang
* Yue (Robin) Liu
* Katherine Chastain
* Rebecca Cowan
* Oshani Seneviratne

