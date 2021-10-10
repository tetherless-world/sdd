---
title: Tutorial
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
                <a class="nav-link js-scroll-trigger" href="#setup">Setup</a>
            </li>
            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="#configuration">Configuration</a>
            </li>
            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="#dictionary-mapping">Dictionary Mapping</a>
            </li>
            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="#codebook">Codebook</a>
            </li>
            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="#timeline">Timeline</a>
            </li>
            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="#run-script">Run Script</a>
            </li>
            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="#load-graph">Load</a>
            </li>
            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="#query-graph">Query</a>
            </li>
            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="#infer-knowledge">Infer</a>
            </li>
        </ul>
    </div>
</nav>

## Setup (Standalone/Command Line)
Install `sdd2rdf` using `pip`.

`pip install sdd2rdf`

Install `setlr` using `pip`.

`pip install setlr`

Installing the `sdd2rdf` package installs the `sdd2setl` command. It's usage documentation can be viewed by the `--help` argument.

`sdd2setl --help`

Running this command returns the following:
```
usage: sdd2setl [-h] [-o OUTPUT] [-f {csv,excel}] [-d DELIMITER]
                [-s SHEETNAME] [--dataset_uri DATASET_URI]
                semantic_data_dictionary prefix data_file setl_output

positional arguments:
  semantic_data_dictionary
  prefix
  data_file
  setl_output

optional arguments:
  -h, --help            show this help message and exit
  -o OUTPUT, --output OUTPUT
  -f {csv,excel}, --format {csv,excel}
  -d DELIMITER, --delimiter DELIMITER
  -s SHEETNAME, --sheetname SHEETNAME
  --dataset_uri DATASET_URI
```

The standalone `sdd2setl` approach can be tested using the Example Project within the Semantic Data Dictionary repository. Start by cloning the Semantic Data Dictionary repository.

`git clone https://github.com/tetherless-world/SemanticDataDictionary.git`

Navigate into the Semantic Data Dictionary repo directory.

`cd SemanticDataDictionary`

Run the sdd2setl command using the existing example project.

`sdd2setl -o example.trig -f csv -d , ExampleProject/example_sdd.xlsx https://example.com/example/ ExampleProject/input/Data/exampleData.csv example.setl`

Running the above command generates the setl file `example.setl`.

The setl file can be used to generate the knowledge graph fragment by using setlr.

`setlr example.setl`

This generates the rdf file `example.trig`.

## Setup (Whyis SDD Agent)
Install Whyis as detailed <a href="http://tetherless-world.github.io/whyis/install">Here</a>.

Clone the Semantic Data Dictionary repository into the /apps directory.

`cd /apps/ && git clone https://github.com/tetherless-world/SemanticDataDictionary.git`

Change into the Whyis user

`sudo su - whyis`

Move into the whyis directory

`cd /apps/whyis`

Load the SDD ontology into Whyis

`python manage.py load -i /apps/SemanticDataDictionary/sdd-ontology.ttl -f turtle`

Start whyis server in watch mode

`python manage.py runserver -h 0.0.0.0 --watch`

In your browser, navigate to the Dataset upload page. For example, if the VM is directed to IP address 192.168.66.36, go to:
`http://192.168.66.36:5000/about?view=new&uri=http:%2F%2Fwww.w3.org%2Fns%2Fdcat%23Dataset`

Load the data file and the SDD spreadsheet.

Optionally add an image associated with the dataset.

Add a title and description for the dataset.

Add your ORCID.

Once you press submit, the dataset resource page should be loaded.

For the dataset, click Add Attribute, and add a URI space, such as
`http://purl.org/twc/HEALS/kb/`

For the spreadsheet, add type `Semantic Data Dictionary`

For the data file, click Add Attributem and add a delimiterm such as `,`

Link the data file to the spreadsheet by clicking Add Link, and add a conforms to link to connect the data file to the spreadsheet.

The data should now be annoated and loaded into the Whyis graph.

## Setup (sdd2rdf usage via config file [Deprecated])

### Installation - VM

We will begin this tutorial by creating a fresh Ubuntu environment by using Vagrant and virtualbox. This is useful for installation on a production system.

If you wish to install directly onto your machine, you can skip to the next subsection on installing the libraries.

Install VirtualBox.

`sudo apt install VirtualBox`

Install Vagrant.

`sudo apt install vagrant`

Create a working directory for your Virtual Machine and change into that directory.

`mkdir sdd-vm && cd sdd-vm`

Create a Vagrantfile

`touch Vagrantfile`

Add the following content to the Vagrantfile:

```
Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "sdd-vm"
    # VM HARDWARE SPECS

    vb.customize ["modifyvm", :id, "--memory", "6144"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
    vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "80"]
    vb.customize ["modifyvm", :id, "--vram", "256"]
  end

  config.vm.network "private_network", ip: "192.168.56.36"

end
```


Next bring up the VM.

`vagrant up`

SSH into the VM.

`vagrant ssh`

For convenience, you can set up a shared folder that links back to your local sdd-vm folder.

```
touch .bash_aliases && mkdir share
echo "alias mntshare='sudo mount -t vboxsf vagrant share/'" >> .bash_aliases
source .bashrc
mntshare
```


Alternatively, you can install directly onto your system, or setup environments for <a href="http://tetherless-world.github.io/whyis/install">Whyis</a> or <a href="https://github.com/paulopinheiro1234/hadatac/wiki/HADatAc-User-Guide#1-installing-hadatac">HADatAc</a> and continue with the instructions below.


### Installation - Libraries
Install python.

`sudo apt install python`

Install pip.

`sudo apt install python-pip`
    

Install pandas.

`pip install pandas`
    

Install configparser.

`pip install configparser`
    

Install rdflib.

`pip install rdflib`
    

### Seting up directory structure
Clone the Semantic Data Dictionary repository.

`git clone https://github.com/tetherless-world/SemanticDataDictionary.git`
    

For your own project, you do not want to push to the Semantic Data Dictionary repository. Instead, create a workspace for your Semantic Data Dictionary projects and change to that directory.

`mkdir sdd-workspace && cd sdd-workspace/`
    

Create a symbolic link to the sdd2rdf python script. Make sure you use the relative directory here.

`ln -s ../SemanticDataDictionary/sdd2rdf.py .`
    

It is usually helpful to organize your projects and their contents.

Create a directory for your current project and change to that directory.

We title this example project, "ExampleProject," but you can call it whatever you like.

`mkdir ExampleProject && cd ExampleProject`
    

Create directories for your input, output and config files.

`mkdir input output config`
    

It may be useful to create directories for each input and output file types, expecially for projects involving integrating multiple tables.

```
mkdir input/DM  input/Data input/CB input/TL 
mkdir output/trig output/swrl output/sparql
```
    
The input folders will hold our Dictionary Mapping, Data, Codebook and Timeline files.

The output folder will hold the generated TriG RDF, SPARQL query, and SWRL model files. 

Now that we have our directory structure set up, we can start creating the necessary Semantic Data Dictionary artifacts.

Note that there is an [Example Project](https://github.com/tetherless-world/SemanticDataDictionary/tree/master/ExampleProject) as well as a [Template Project](https://github.com/tetherless-world/sdd/tree/master/sdd_resources/TemplateProject) from which the initial project files can be copied over.

For example, from the project directory, you can copy over the config files from the example project in the SemanticDataDictionary repository.

`cp ../../SemanticDataDictionary/ExampleProject/config/* config/`

## Configuration
    
### config.ini
You may notice 4 comma separated value (csv) files in this folder, as well as a config.ini file.

The config.ini file is the configuration file used by the sdd2rdf script. As the extention suggests, it is written in INI format.

Note that file locations written in this config file can be absolute paths or URLs, as well as relative paths from the location that the sdd2rdf.py symbolic link exists.

The config.ini file has three sections.

The "Prefixes" section contains a reference to the prefixes.csv file as well as the base URI you wish to use for the resources in the knowledge graph.
Here we can specify a file with the prefixes for existing ontologies to be used in the translation.
The base URI is used to specify the base uri to be associated with the triples generated by the script.

```
[Prefixes]
prefixes = ExampleProject/config/prefixes.csv
base_uri = example-kb
```

The "Source Files" section contains references to the to the Semantic Data Dictionary files, the data file and the properties customization file.

```
[Source Files]
dictionary = ExampleProject/input/DM/exampleDM.csv
codebook = ExampleProject/input/CB/exampleCB.csv
timeline = Synthea/input/TL/exampleTL.csv
data_file = Synthea/input/Data/exampleData.csv
code_mappings = ExampleProject/config/code_mappings.csv
infosheet = ExampleProject/config/Infosheet.csv
properties = ExampleProject/config/Properties.csv
```
    
As described in the next <a href="#infosheet">section</a>, the Infosheet also contains references to the locations of the Dictionary Mapping, Codebook, Timeline and Code Mapping tables.

These reference config values are duplicated since if an Infosheet is not included with the Semantic Data Dictionary, sdd2rdf can still be run using the other files.

If these locations are specified in the Infosheet, the values in the infosheet will take precedence over the values in the configuration file.

The "Output Files" section contains references to the locations to write the TriG, SWRL, and SPARQL output files.

```
[Output Files]
out_file = ExampleProject/output/trig/example-kg.trig
query_file = ExampleProject/output/sparql/exampleQuery
swrl_file = ExampleProject/output/swrl/exampleSWRL
```
    
### Infosheet
While the config file mentioned above handles the configuration for the sdd2rdf script, the configuration of the Semantic Data Dictionary itself is included in the Infosheet.

The Infosheet contains references to the Dictionary Mapping, Code Mapping, Timeline, and Codebook table locations.

| Attribute| Value |
|---|---|
| Dictionary Mapping | http://... |
| Codebook | http://... | 
| Code Mapping | http://... | 
| Timeline | http://... | 
| Imports | http://... |

Absolute, relative or web resource locations can be specified for the locations for the Semantic Data Dictionary tables.

From this perspective, the Semantic Data Dictionary can be seen as a collection of tables used to perform semantic mapping functions. 
The Semantic Data Dictionary itself then represents a class of datasets that adhere to a specific semantic structure, rather that a description of an individual dataset.

<!--<p>With this in mind, the Infosheet can also be used to specify metadata about the Semantic Data Dictionary. The properties supported are based on the <a href="https://www.w3.org/TR/hcls-dataset/">HCLS</a> standards and the <a href="https://www.w3.org/TR/dwbp/">Data on the Web</a> best practices, but rather than being applied specifically to data, we think in the context of describing dataset collections and producing knowledge graph fragments.
-->

In order to review which properties are included and see example entries for these properties, and for more information about the Infosheet, see the Infosheet <a href="documentation#infosheet">documentation</a>.
    
### Code Mappings

The Code Mappings table is used to assign shorthand codes to commonly used classes from ontologies.

Once these codes are assigned in the Code Mappings table, rather than specifying the ontology classes, instead the codes can be used in the Dictionary Mapping, Codebook or Timeline tables.

In order to learn more and see an example Code Mappings set, see the Code Mappings <a href="documentation#code-mappings">documentation</a>.
    
### Prefixes
The prefixes.csv file is used to specify the namespace URIs for the prefixes used throughout the annotated SDD tables, and should also include the base URI specified in the configuration file.

In order to learn more, see the Prefixes <a href="documentation#prefixes">documentation</a>.
    
### Properties

In order for this approach to be ontology agnostic, we allow the user to customize the properties used throughout the mapping process.

In order to learn more, see the Property customization <a href="documentation#property-customization">documentation</a>.

## Dictionary Mapping

When creating the SDD artifacts, it is useful to have documents describing the dataset(s) that will be annotated.

For example, for the CHEAR project, the Principal Investigator of each study provides a proposal document that includes a description of the study, a standard data dictionary and a standard codebook. 

When available, we use this form of a standard data dictionary, which provides human-readable column labels and descriptions, as well as the column names as they appear in the data, as a starting point for our Dictionary Mapping table creation.

If there is no standard data dictionary available, the DM should begin with the column headers from the dataset.

Column labels and descriptions can be transferred from existing data descriptions where available, or inferred where necessary.

An example of a Dictionary Mapping table used for annotating the Demographics table in the National Health and Nutrition Examination Survey (NHANES) is included below.

| Column | Label | Comment | Definition | Attribute | attributeOf | Unit | Time | Entity | Role | Relation | inRelationTo | wasDerivedFrom | wasGeneratedBy | Template |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| SEQN | Respondent sequence number | Respondent sequence number. |  | sio:Identifier | ??participant |  |  |  |  |  |  |  |  |  |
| RIAGENDR | Gender | Gender of the participant. |  | sio:BiologicalSex | ??participant |  |  |  |  |  |  |  |  |  |
| RIDAGEYR | Age in years at screening  | Age in years of the participant at the time of screening. Individuals 80 and over are topcoded at 80 years of age. |  | sio:Age | ??participant | uo:0000036 | ??screening |  |  |  |  |  |  |  |
| RIDAGEMN | Age in months at screening - 0 to 24 mos | Age in months of the participant at the time of screening. Reported for persons aged 24 months or younger at the time of exam (or screening if not examined). |  | sio:Age | ??participant | uo:0000035 | ??screening |  |  |  |  |  |  |  |
| RIDRETH1 | Race/Hispanic origin | Recode of reported race and Hispanic origin information |  | sio:Race | ??participant |  |  |  |  |  |  |  |  |  |
| RIDEXAGM | Age in months at exam - 0 to 19 years | Age in months of the participant at the time of examination. Reported for persons aged 19 years or younger at the time of examination. |  | sio:Age | ??participant | uo:0000035 | ??exam |  |  |  |  |  |  |  |
| DMDBORN4 | Country of birth | In what country {were you/was SP} born? |  |  |  |  | ??birth | sio:Country |  | sio:isLocationOf | ??participant |  |  |  |
| DMDCITZN | Citizenship status | {Are you/Is SP} a citizen of the United States? [Information about citizenship is being collected by the U.S. Public Health Service to perform health related research. Providing this information is voluntary and is collected under the authority of the Public Health Service Act. There will be no effect on pending immigration or citizenship petitions.] |  | sio:StatusDescriptor | ??participant |  |  |  |  |  |  |  |  |  |
| DMDYRSUS | Length of time in US | Length of time the participant has been in the US. |  | sio:TimeInterval | ??participant |  |  |  |  |  |  |  |  |  |
| DMDEDUC3 | Education level - Children/Youth 6-19 | What is the highest grade or level of school {you have/SP has} completed or the highest degree {you have/s/he has} received? |  | chear:EducationLevel | ??participant |  |  |  |  |  |  |  |  |  |
| DMDEDUC2 | Education level - Adults 20+ | What is the highest grade or level of school {you have/SP has} completed or the highest degree {you have/s/he has} received? |  | chear:EducationLevel | ??participant |  |  |  |  |  |  |  |  |  |
| DMDMARTL | Marital status | Marital status |  | chear:MaritalStatus | ??participant |  |  |  |  |  |  |  |  |  |
| RIDEXPRG | Pregnancy status at exam | Pregnancy status for females between 20 and 44 years of age at the time of MEC exam. |  | sio:StatusDescriptor | ??pregnancy |  | ??exam |  |  |  | ??participant |  |  |  |
| SIALANG | Language of SP Interview | Language of the Sample Person Interview Instrument |  | chear:Language | ??instrument |  | ??interview |  |  |  | ??participant |  |  |  |
| DMDHRGND | HH ref person's gender | HH reference person's gender |  | sio:BiologicalSex | ??HHRef |  |  |  |  |  |  |  |  |  |
| DMDHRAGE | HH ref person's age in years | HH reference person's age in years |  | sio:Age | ??HHRef | uo:0000036 |  |  |  |  |  |  |  |  |
| DMDHRBR4 | HH ref person's country of birth | HH reference person's country of birth |  |  |  |  | ??birth | sio:Country |  | sio:isLocationOf | ??HHRef |  |  |  |
| DMDHREDU | HH ref person's education level | HH reference person's education level |  | chear:EducationLevel | ??HHRef |  |  |  |  |  |  |  |  |  |
| DMDHRMAR | HH ref person's marital status | HH reference person's marital status |  | chear:MaritalStatus | ??HHRef |  |  |  |  |  |  |  |  |  |
| WTINT2YR | Full sample 2 year interview weight | Full sample 2 year interview weight. |  | chear:Weight | ??participant |  | ??interview |  |  |  |  |  |  |  |
| WTMEC2YR | Full sample 2 year MEC exam weight | Full sample 2 year MEC exam weight. |  | chear:Weight | ??participant |  | ??exam |  |  |  |  |  |  |  |
| INDHHIN2 | Annual household income | Total household income (reported as a range value in dollars) |  | chear:Income | ??household |  |  |  |  |  |  |  |  |  |
| ??participant | Participant |  | Someone who takes part in an activity. [def-source: NCI] |  |  |  |  | ncit:C29867, sio:Human | sio:SubjectRole |  |  |  |  |  |
| ??screening | Screening |  | The time period during which a screening process is used to determine the inclusion of a subject in a study. [def-source: CHEAR] |  |  |  |  | chear:Screening |  |  |  |  |  |  |
| ??exam | Examination |  | A formal or careful inspection of an object or subject. [def-source: NCI] |  |  |  |  | ncit:C131902 |  |  |  |  |  |  |
| ??birth | Birth |  | Birthing is the process by which a biological organism is brought into existence. [def-source: SIO] |  |  |  |  | sio:Birthing |  |  |  |  |  |  |
| ??pregnancy | Pregnancy |  | The time during which one or more offspring develops inside a woman. [def-source: CHEAR] |  |  |  |  | chear:Pregnancy |  |  |  |  |  |  |
| ??interview | Interview |  | "A conversation with an individual regarding his or her background and other personal and professional details,  opinions on specific subjects posed by the interviewer,  etc. [def-source: NCI]" |  |  |  |  | ncit:C16751 |  |  |  |  |  |  |
| ??instrument | Instrumentation |  | "Any object, or item of electrical or electronic equipment,  which is designed to carry out a specific function or set of functions. [def-source: NCI]" |  |  |  |  | ncit:C16742 |  |  |  |  |  |  |
| ??household | Household |  | "A household consists of one or more people who live in the same dwelling and also share meals or living accommodation |  and may consist of a single family or some other grouping of people. A single dwelling will be considered to contain multiple households if either meals or living space are not shared. The household is the basic unit of analysis in many social |  microeconomic and government models, and is important to the fields of economics and inheritance. [def-source: CHEAR]" |  |  |  |  | chear:Household |  |  | ??participant |  |  |  |
| ??HHRef | Household reference person |  | "Head of Household is a filing status for individual United States taxpayers. To use the Head of Household filing status, a taxpayer must: (1) Be unmarried or considered unmarried at the end of the year (2) Have paid more than half the cost of keeping up a home for the tax year (either one's own home or the home of a qualifying parent) (3) Usually have a qualifying person who lived with the head in the home for more than half of the tax year unless the qualifying person is a dependent parent. [def-source: CHEAR]" |  |  |  |  | chear:HeadOfHousehold |  |  | ??household |  |  | |

A key step in the Dictionary Mapping creation process is identifying whether each entry refers to an attribute or to an entity.

In general, columns in a data file describe observed characteristics of some entity, and should be assigned a corresponding class in the Attribute column. This however is not always the case, so it should be considered whether the class at hand refers to an object or an attribute by exploring the hierarchy of the relevant term at hand.

The entity that has the characteristic encoded as an Attribute is populated in the attributeOf column. If the entity is implicit – that is, there is no column in the dataset representing the entity – an implicit entry should be made for this entity, and typed with an appropriate class in the Entity column. 

Examples of implicit entries are shown in the table above.
These entries start with "??" to indicate that the entry is implicit.

The method of determining which class should be assigned to an attribute or entity may differ by project. For biomedical studies, an ontology browser such as <a href="https://bioportal.bioontology.org/">BioPortal</a> or <a href="http://www.ontobee.org/">Ontobee</a> may be used to find appropriate terms and relevant ontologies.

It is worth noting that some biomedical ontologies and terms may not be included in these search portals, in which case the ontologies themselves may need be examined and/or expanded.

Other important metadata recorded in the Dictionary Mappings sheet includes units of measurement and the format of the data value, which can be described in the Units and Format columns, respectively. 

Additionally, provenance information can be included for each Dictionary Mapping entry, including inRelationTo, which connects the a property of entry to another attribute or entity; wasDerivedFrom, which is used to reference pre-existing entities that that are relevant in the construction of the entry; and wasGeneratedBy, which describes the activity used in the production of the entry. 

Furthermore, if the entry has an associated time, the Time column can be filled out accordingly. Customized time intervals can be specified in the Timeline sheet, further described in the <a href="documentation#timeline">documentation</a> as well as <a href="tutorial#timeline">below</a>. 

In the CHEAR study, for example, the data tracks child development in terms of observations taken at specific times relative to the birth or conception of the child.  

For the purpose of this tutorial, we consider the simple Dictionary Mapping table that is included in the example project, shown below.

|Column|Label|Comment|Definition|Attribute|attributeOf|Unit|Format|Time|Entity|Role|Relation|inRelationTo|wasDerivedFrom|wasGeneratedBy|Template|
|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|
|id|Identifier|ID for subject|Identifier for the human subject|sio:Identifier|??subject||||||||||id-{id}|
|wt2|Weight 1|Weight in kg at first visit|Weight of the subject in kilograms at the first visit|chear:Weight|??subject|kg||??visit1|||||||weight-{id}|
|wt2|Weight 2|Weight in kg at second visit|Weight of the subject in kilograms at the second visit|chear:Weight|??subject|kg||??visit2|||||||weight-{id}|
|age|Age|Age in years|Age of the subject in years|sio:Age|??subject|yr|||||||||age-{id}|
|sex|Sex|Gender of the subject|The biological sex of the subject|sio:BiologicalSex|??subject||||||||||sex-{id}|
|race|Race|Race category|The categorical race of the subject|chear:Race|??subject||||||||||race-{id}|
|edu|Education level|Subject’s education level|The categorial education level of the subject|chear:EducationLevel|??subject||||||||||edu-{id}|
|smoke|Smoking Status|Smoking status|Whether or not the subject admitted to smoking|chear:SmokingStatus|??subject||||||||||smoke-{id}|
|??subject|Subject|Subject implicit entity|A subject is encoded as a human with a subject role||||||sio:Human|sio:SubjectRole|||||subject-{id}|

In this mapping we assign in the Attribute column of each explicit entry.

These attributes are assigned to be an attribute of an implicit subject.

The implicit subject is encoded as mapped to an Entity with ontology class sio:Human, that has the Role of a sio:SubjectRole. Note that if we included a reference to a study, we can include an implicit reference to this study in the inRelationTo column.

For more information, see the Dictionary Mapping <a href="documentation#dictionary-mapping">documentation</a>.


Finally, in this example we use templating to specify the form of the URL we want to generate for each entry.
 
For more information, see the Templating <a href="documentation#templating">documentation</a>

## Codebook
In the same way that the use of pre-existing documents can aide in the initial construction of the Dictionary Mapping table, the same can be said for the Codebook table. 
For example, the standard codebook is included in the collection of initial documents for CHEAR, the creation of a semantic codebook from this point is simply the addition of concepts in the Class or Resource column. 

When there is no standard codebook to start from, manual creation of a semantic codebook involves the process of identifying which columns have encoded values, finding all such possible values, and assigning appropriate classes to those codes. 

We recommend that the class assigned to each code for a given column be a subclass of the attribute or entity assigned to that column. 

Examples of data that may require expansion in a codebook include a column corresponding to level of education, where possible values come from a certain enumerated set. 

For example, if a column called "edu" is assigned as an attribute chear:EducationLevel and the data value for that column is numerically coded, classes should be assigned in the Codebook to the code values for "edu." 

A recommendation, though not a requirement, is the the classes used in the Codebook should have rdfs:subClassOf relationships to the attribute assigned. For example, for the attribute chear:EducationLevel, we assign classes in the Codebook such as chear:UnknownEducationLevel or chear:CollegeGraduate.

A Codebook for the example project is shown below.

|Column|Code|Class|Label|
|--|--|--|--|
|sex|1|sio:Male|Male|
|sex|2|sio:Female|Female|
|race|1|chear:White|White|
|race|2|chear:AfricanAmerican|African American|
|race|3|chear:Asian|Asian|
|race|4|chear:American_Indian_or_Alaska_Native|American Indian or Alaska Native|
|race|5|chear:UnknownRace|Unknown Race|
|edu|1|chear:HighSchoolOrLess|High School Degree or Less|
|edu|2|chear:SomeCollegeorTechnicalSchool|Technical College or Some College|
|edu|3|chear:HigherEducation|Higher Education than High School|
|edu|4|chear:CollegeGraduate|College Graduate|
|edu|5|chear:UnknownEducationLevel|Unknown Education Level|
|smoke|0|chear:NonSmoker|non smoker|
|smoke|1|chear:Smoker|smoker|

In order to learn more, see the Codebook <a href="documentation#codebook">documentation</a>.

## Timeline
The Timeline table can be used to annotate the corresponding class and unit related to a given entry, as well start and end times of an event.

In our example we consider the weight of the subject during two separate visits. These visits are encoded in the Timeline, as shown below.
    
|Name|Label|Type|Start|End|Unit|inRelationTo|
|--|--|--|--|--|--|--|
|??visit1|Visit 1|chear:Visit|1|2|sio:Week||
|??visit2|Visit 2|chear:Visit|3|4|sio:Week||

For more information, see the Timeline <a href="documentation#timeline">documentation</a>.

## Run Script
Once all the Semantic Data Dictionary artifacts are ready, the sdd2rdf script can be run using python and providing an input argument corresponding to the relative or absolute location of the config file.

`python sdd2rdf ExampleProject/config/config.ini.example`

Note that the current implementation uses RDFLib, but is not connected to a logger.

Due to this, the message `No handlers could be found for logger "rdflib.term"` appears when running the code. This message can be ignored.
    
## Load Graph
In order to work with the resulting graph, it needs to be loaded into a triplestore.

One such triplestore that can be used is called Blazegraph.

A Java jar file to run blazegraph can be found [online](https://www.blazegraph.com/download/) .

To start blazegraph, you can use the following command.

`java -server -Xmx4g -jar blazegraph.jar`

Once blazegraph starts, you can visit the front end of the triplestore at the URI specified, usually corresponding to `http://localhost:9999/blazegraph/`.

Using this UI, we can navigate to the Update tab, browse for the location of the generated output TriG file, and load the RDF into blazegraph.

## Query Graph
The sdd2rdf interpreter also outputs a starting point query. The query is designed to show the original data values, but can be updates to explore linked resources in the graph as well.

```
prefix owl: <http://www.w3.org/2002/07/owl#> 
prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
prefix prov: <http://www.w3.org/ns/prov#> 
prefix example-kb: <http://example.com/kb/example#> 
prefix stato: <http://purl.obolibrary.org/obo/STATO_> 
prefix uo: <http://purl.obolibrary.org/obo/UO_> 
prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
prefix chear: <http://hadatac.org/ont/chear#> 
prefix xsd: <http://www.w3.org/2001/XMLSchema#> 
prefix np: <http://www.nanopub.org/nschema#> 
prefix obo: <http://purl.obolibrary.org/obo/> 
prefix sio: <http://semanticscience.org/resource/> 

SELECT DISTINCT ?id ?wt1 ?wt2 ?age ?sex ?race ?edu ?smoke WHERE {
  ?id_E <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> sio:Identifier  ;
    <sio:isAttributeOf>    ?subject_V  ;
    <http://semanticscience.org/resource/hasValue> ?id .

  ?wt1_E <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> chear:Weight  ;
    <sio:isAttributeOf>    ?subject_V  ;
    <sio:hasUnit>    obo:UO_0000009 ;
    <sio:existsAt>     ?visit1_V  ;
    <http://semanticscience.org/resource/hasValue> ?wt1 .

  ?wt2_E <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> chear:Weight  ;
    <sio:isAttributeOf>    ?subject_V  ;
    <sio:hasUnit>    obo:UO_0000009 ;
    <sio:existsAt>     ?visit2_V  ;
    <http://semanticscience.org/resource/hasValue> ?wt2 .

  ?age_E <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> sio:Age  ;
    <sio:isAttributeOf>    ?subject_V  ;
    <sio:hasUnit>    obo:UO_0000036 ;
    <http://semanticscience.org/resource/hasValue> ?age .

  ?sex_E <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> sio:BiologicalSex  ;
    <sio:isAttributeOf>    ?subject_V  ;
    <http://semanticscience.org/resource/hasValue> ?sex .

  ?race_E <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> chear:Race  ;
    <sio:isAttributeOf>    ?subject_V  ;
    <http://semanticscience.org/resource/hasValue> ?race .

  ?edu_E <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> chear:EducationLevel  ;
    <sio:isAttributeOf>    ?subject_V  ;
    <http://semanticscience.org/resource/hasValue> ?edu .

  ?smoke_E <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> chear:SmokingStatus  ;
    <sio:isAttributeOf>    ?subject_V  ;
    <http://semanticscience.org/resource/hasValue> ?smoke .


  ?subject_V <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> sio:Human  ;
    <sio:hasRole>    [ <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> sio:SubjectRole ].

}

LIMIT 10
```
## Infer Knowledge
We also generate an SWRL antecendent that can be used for inference activities.

An example SWRL antecedent is shown below.

```
sio:Identifier(?id_E) ^ sio:isAttributeOf(?id_E , ?subject_V) ^ 
chear:Weight(?wt1_E) ^ sio:isAttributeOf(?wt1_E , ?subject_V) ^ sio:hasUnit(?wt1_E , obo:UO_0000009) ^ sio:existsAt(?wt1_E , ?visit1_V ) ^ 
chear:Weight(?wt2_E) ^ sio:isAttributeOf(?wt2_E , ?subject_V) ^ sio:hasUnit(?wt2_E , obo:UO_0000009) ^ sio:existsAt(?wt2_E , ?visit2_V ) ^ 
sio:Age(?age_E) ^ sio:isAttributeOf(?age_E , ?subject_V) ^ sio:hasUnit(?age_E , obo:UO_0000036) ^ 
sio:BiologicalSex(?sex_E) ^ sio:isAttributeOf(?sex_E , ?subject_V) ^ 
chear:Race(?race_E) ^ sio:isAttributeOf(?race_E , ?subject_V) ^ 
chear:EducationLevel(?edu_E) ^ sio:isAttributeOf(?edu_E , ?subject_V) ^ 
chear:SmokingStatus(?smoke_E) ^ sio:isAttributeOf(?smoke_E , ?subject_V) ^ 
sio:Human(?subject_V) 
```
