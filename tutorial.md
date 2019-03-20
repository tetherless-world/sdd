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
                <a class="nav-link js-scroll-trigger" href="#config">Configuration</a>
            </li>
            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="#dm">Dictionary Mapping</a>
            </li>
            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="#cb">Codebook</a>
            </li>
            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="#timeline">Timeline</a>
            </li>
            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="#run">Run Script</a>
            </li>
            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="#load">Load</a>
            </li>
            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="#query">Query</a>
            </li>
            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="#infer">Infer</a>
            </li>
        </ul>
    </div>
</nav>
This is the Tutorial page.

##Setup
###Installation - VM

We will begin this tutorial by creating a fresh Ubuntu environment by using Vagrant and virtualbox. This is useful for installation on a production system.

If you wish to install directly onto your machine, you can skip to the next subsection on installing the libraries.

Install VirtualBox.
<code>sudo apt install VirtualBox<br/> </code>

    <p>Install Vagrant.<br/>
    <code>sudo apt install vagrant<br/> </code>
    </p>

    <p>Create a working directory for your Virtual Machine and change into that directory.<br/>
    <code>mkdir sdd-vm && cd sdd-vm<br/> </code>
    </p>

    <p>Create a Vagrantfile.<br/>
    <code>touch Vagrantfile<br/> </code>
    </p>

    <p>Add the following content to the Vagrantfile:<br/>
    <code class="codeblock">
Vagrant.configure(2) do |config|<br/>
&nbsp;&nbsp;config.vm.box = "ubuntu/xenial64"<br/>
<br/>
&nbsp;&nbsp;config.vm.provider "virtualbox" do |vb|<br/>
&nbsp;&nbsp;&nbsp;&nbsp;vb.name = "sdd-vm"<br/>
&nbsp;&nbsp;&nbsp;&nbsp;# VM HARDWARE SPECS<br/>
<br/>
&nbsp;&nbsp;&nbsp;&nbsp;vb.customize ["modifyvm", :id, "--memory", "6144"]<br/>
&nbsp;&nbsp;&nbsp;&nbsp;vb.customize ["modifyvm", :id, "--cpus", "2"]<br/>
&nbsp;&nbsp;&nbsp;&nbsp;vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]<br/>
&nbsp;&nbsp;&nbsp;&nbsp;vb.customize ["modifyvm", :id, "--cpuexecutioncap", "80"]<br/>
&nbsp;&nbsp;&nbsp;&nbsp;vb.customize ["modifyvm", :id, "--vram", "256"]       <br/>
&nbsp;&nbsp;end<br/>
<br/>
&nbsp;&nbsp;config.vm.network "private_network", ip: "192.168.56.36"<br/>
<br/>
end<br/>
</code>
    </p>

    <p>Next bring up the VM.<br/>
    <code>vagrant up<br/> </code>
    </p>

    <p>SSH into the VM.<br/>
    <code>vagrant ssh<br/> </code>
    </p>

    <p>For convenience, you can set up a shared folder that links back to your local sdd-vm folder.<br/>
    <code>touch .bash_aliases && mkdir share <br/> 
    echo "alias mntshare='sudo mount -t vboxsf vagrant share/'" >> .bash_aliases<br/>
    source .bashrc<br/> 
    mntshare<br/> 
    </code>
    </p>

    <p>Alternatively, you can install directly onto your system, or setup environments for <a href="http://tetherless-world.github.io/whyis/install">Whyis</a> or <a href="https://github.com/paulopinheiro1234/hadatac/wiki/HADatAc-User-Guide#1-installing-hadatac">HADatAc</a> and continue with the instructions below.
    </p>

    <h3>Installation - Libraries </h3>
    <p>Install python.<br/>
    <code>sudo apt install python<br/> </code>
    </p>

    <p>Install pip.<br/>
    <code>sudo apt install python-pip<br/> </code>
    </p>

    <p>Install pandas.<br/>
    <code>pip install pandas<br/> </code>
    </p>

    <p>Install configparser.<br/>
    <code>pip install configparser<br/> </code>
    </p>

    <p>Install rdflib.<br/>
    <code>pip install rdflib<br/> </code>
    </p>

    <h3>Seting up directory structure</h3>
    <p>Clone the Semantic Data Dictionary repository.<br/>
    <code>git clone https://github.com/tetherless-world/SemanticDataDictionary.git<br/> </code>
    </p>

    <p>For your own project, you do not want to push to the Semantic Data Dictionary repository. Instead, create a workspace for your Semantic Data Dictionary projects and change to that directory.<br/>
    <code>mkdir sdd-workspace && cd sdd-workspace/<br/> </code>
    </p>

    <p>Create a symbolic link to the sdd2rdf python script. Make sure you use the relative directory here.<br/>
    <code>ln -s ../SemanticDataDictionary/sdd2rdf.py .<br/> </code>
    </p>

    <p>It is usually helpful to organize your projects and their contents.</p>
    <p>Create a directory for your current project and change to that directory.</p>
    <p>We title this example project, "ExampleProject," but you can call it whatever you like.</p>
    <code>mkdir ExampleProject && cd ExampleProject<br/> </code>
    </p>

    <p>Create directories for your input, output and config files.<br/>
    <code>mkdir input output config<br/>
    </code>
    </p>

    <p>It may be useful to create directories for each input and output file types, expecially for projects involving integrating multiple tables.<br/>
    <code>mkdir input/DM  input/Data input/CB input/TL <br/>
    mkdir output/trig output/swrl output/sparql<br/>
    </code>
    </p>
    <p>The input folders will hold our Dictionary Mapping, Data, Codebook and Timeline files.</p>
    <p>The output folder will hold the generated TriG RDF, SPARQL query, and SWRL model files. </p>
    <p>Now that we have our directory structure set up, we can start creating the necessary Semantic Data Dictionary artifacts.
    </p>
  </div>
</section>
<section class="resume-section p-3 p-lg-5 d-flex d-column" id="config">
 <div class="my-auto">
  <h2>Configuration</h2>
    <p>Rather than creating all the config files from scratch, you can copy over the config files from the example project in the SemanticDataDictionary repository.<br/>
    <code>cp ../../SemanticDataDictionary/ExampleProject/config/* config/<br/> </code>
    </p>

    <h3>config.ini</h3>
    <p>You may notice 4 comma separated value (csv) files in this folder, as well as a config.ini file.</p>
    <p>The config.ini file is the configuration file used by the sdd2rdf script. As the extention suggests, it is written in INI format.</p>
    <p>Note that file locations written in this config file can be absolute paths or URLs, as well as relative paths from the location that the sdd2rdf.py symbolic link exists.</p>
    <p>The config.ini file has three sections.</p>
    <p>The "Prefixes" section contains a reference to the prefixes.csv file as well as the base URI you wish to use for the resources in the knowledge graph.
    <code>[Prefixes]<br/>
# Specify a file with the prefixes for existing ontologies used in your translation<br/>
prefixes = ExampleProject/config/prefixes.csv<br/>
# Specify the base uri to be associated with all triples minted by the script<br/>
base_uri = example-kb<br/> </code>
    </p>
    
    <p>
    The "Source Files" section contains references to the to the Semantic Data Dictionary files, the data file and the properties customization file.<br/>
    <code>[Source Files]
dictionary = ExampleProject/input/DM/exampleDM.csv<br/>
codebook = ExampleProject/input/CB/exampleCB.csv<br/>
timeline = Synthea/input/TL/exampleTL.csv<br/>
data_file = Synthea/input/Data/exampleData.csv<br/>
code_mappings = ExampleProject/config/code_mappings.csv<br/>
infosheet = ExampleProject/config/Infosheet.csv<br/>
properties = ExampleProject/config/Properties.csv<br/>
</code>
    </p>
    <p>As described in the next <a href="#infosheet">section</a>, the Infosheet also contains references to the locations of the Dictionary Mapping, Codebook, Timeline and Code Mapping tables.</p>
    <p>These reference config values are duplicated since if an Infosheet is not included with the Semantic Data Dictionary, sdd2rdf can still be run using the other files.</p>
    <p>If these locations are specified in the Infosheet, the values in the infosheet will take precedence over the values in the configuration file.</p>
    
    <p>
    The "Output Files" section contains references to the locations to write the TriG, SWRL, and SPARQL output files.<br/>
    <code>[Output Files]
out_file = ExampleProject/output/trig/example-kg.trig<br/>
query_file = ExampleProject/output/sparql/exampleQuery<br/>
swrl_file = ExampleProject/output/swrl/exampleSWRL<br/>
</code>
    </p>
    <h3>Infosheet</h3>
    <p>While the config file mentioned above handles the configuration for the sdd2rdf script, the configuration of the Semantic Data Dictionary itself is included in the Infosheet.</p>

    <p>The Infosheet contains references to the Dictionary Mapping, Code Mapping, Timeline, and Codebook table locations.<br/>
    </p>
    <table>
      <tr>
        <th>Attribute</th>
        <th>Value</th> 
      </tr>
      <tr>
        <td>Dictionary Mapping</td>
        <td>http://...</td> 
      </tr>
      <tr>
        <td>Codebook</td>
        <td>http://...</td> 
      </tr>
      <tr>
        <td>Code Mapping</td>
        <td>http://...</td> 
      </tr>
      <tr>
        <td>Timeline</td>
        <td>http://...</td> 
      </tr>
      <tr>
        <td>Imports</td>
        <td>http://...</td> 
      </tr>
    </table>
    <p>Absolute, relative or web resource locations can be specified for the locations for the Semantic Data Dictionary tables.</p>

    <p>From this perspective, the Semantic Data Dictionary can be seen as a collection of tables used to perform semantic mapping functions.</p> 
    <p>The Semantic Data Dictionary itself then represents a class of datasets that adhere to a specific semantic structure, rather that a description of an individual dataset.</p>
    <!--<p>With this in mind, the Infosheet can also be used to specify metadata about the Semantic Data Dictionary. The properties supported are based on the <a href="https://www.w3.org/TR/hcls-dataset/">HCLS</a> standards and the <a href="https://www.w3.org/TR/dwbp/">Data on the Web</a> best practices, but rather than being applied specifically to data, we think in the context of describing dataset collections and producing knowledge graph fragments.<br/>
    </p>-->

    <p>In order to review which properties are included and see example entries for these properties, and for more information about the Infosheet, see the Infosheet <a href="documentation#infosheet">documentation</a>.<br/>
    </p>
    <h3>Code Mappings</h3>
    <p><br/></p>
    <p>In order to learn more, see the Code Mapping <a href="documentation#code-mappings">documentation</a>.<br/>
    </p>
    <h3>Prefixes</h3>
    <p><br/></p>
    <p>In order to learn more, see the Prefixes <a href="documentation#prefixes">documentation</a>.<br/>
    </p>
    <h3>Properties</h3>
    <p><br/></p>
    <p>In order to learn more, see the Property customization <a href="documentation#property-customization">documentation</a>.<br/>
    </p>
  </div>

<section class="resume-section p-3 p-lg-5 d-flex d-column" id="dm">
  <div class="my-auto">
    <h2>Dictionary Mapping</h2>
    <p>When creating the SDD artifacts, it is useful to have documents describing the dataset(s) that will be annotated.</p>
    <p>For example, for the CHEAR project, the Principal Investigator of each study provides a proposal document that includes a description of the study, a standard data dictionary and a standard codebook. </p>
    <p>We use this standard data dictionary, which provides human-readable column labels and descriptions, as well as the column names as they appear in the data, as a starting point for our Dictionary Mapping table creation.</p>
    <p>If there is no standard data dictionary available, the DM should begin with the column headers from the dataset.</p>
    <p>Column labels and descriptions can be transferred from existing data descriptions where available, or inferred where necessary.</p>

<table>
<tr><th>Column</th><th>Label</th><th>Comment</th><th>Attribute</th><th>attributeOf</th><th>Unit</th><th>Time</th><th>Entity</th><th>Role</th><th>Relation</th><th>inRelationTo</th></tr>
<tr><td>SEQN</td><td>Respondent sequence number</td><td>Respondent sequence number.</td><td>sio:Identifier</td><td>??participant</td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
<tr><td>RIAGENDR</td><td>Gender</td><td>Gender of the participant.</td><td>sio:BiologicalSex</td><td>??participant</td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
<tr><td>RIDAGEYR</td><td>Age in years at screening </td><td>Age in years of the participant at the time of screening. Individuals 80 and over are topcoded at 80 years of age.</td><td>sio:Age</td><td>??participant</td><td>uo:0000036</td><td>??screening</td><td></td><td></td><td></td><td></td></tr>
<tr><td>RIDAGEMN</td><td>Age in months at screening - 0 to 24 mos</td><td>Age in months of the participant at the time of screening. Reported for persons aged 24 months or younger at the time of exam (or screening if not examined).</td><td>sio:Age</td><td>??participant</td><td>uo:0000035</td><td>??screening</td><td></td><td></td><td></td><td></td></tr>
<tr><td>RIDRETH1</td><td>Race/Hispanic origin</td><td>Recode of reported race and Hispanic origin information</td><td>sio:Race</td><td>??participant</td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
<tr><td>RIDEXAGM</td><td>Age in months at exam - 0 to 19 years</td><td>Age in months of the participant at the time of examination. Reported for persons aged 19 years or younger at the time of examination.</td><td>sio:Age</td><td>??participant</td><td>uo:0000035</td><td>??exam</td><td></td><td></td><td></td><td></td></tr>
<tr><td>DMDBORN4</td><td>Country of birth</td><td>In what country {were you/was SP} born?</td><td></td><td></td><td></td><td>??birth</td><td>sio:Country</td><td></td><td>sio:isLocationOf</td><td>??participant</td></tr>
<tr><td>DMDCITZN</td><td>Citizenship status</td><td>{Are you/Is SP} a citizen of the United States? [Information about citizenship is being collected by the U.S. Public Health Service to perform health related research. Providing this information is voluntary and is collected under the authority of the Public Health Service Act. There will be no effect on pending immigration or citizenship petitions.]</td><td>sio:StatusDescriptor</td><td>??participant</td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
<tr><td>DMDYRSUS</td><td>Length of time in US</td><td>Length of time the participant has been in the US.</td><td>sio:TimeInterval</td><td>??participant</td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
<tr><td>DMDEDUC3</td><td>Education level - Children/Youth 6-19</td><td>What is the highest grade or level of school {you have/SP has} completed or the highest degree {you have/s/he has} received?</td><td>chear:EducationLevel</td><td>??participant</td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
<tr><td>DMDEDUC2</td><td>Education level - Adults 20+</td><td>What is the highest grade or level of school {you have/SP has} completed or the highest degree {you have/s/he has} received?</td><td>chear:EducationLevel</td><td>??participant</td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
<tr><td>DMDMARTL</td><td>Marital status</td><td>Marital status</td><td>chear:MaritalStatus</td><td>??participant</td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
<tr><td>RIDEXPRG</td><td>Pregnancy status at exam</td><td>Pregnancy status for females between 20 and 44 years of age at the time of MEC exam.</td><td>sio:StatusDescriptor</td><td>??pregnancy</td><td></td><td>??exam</td><td></td><td></td><td></td><td>??participant</td></tr>
<tr><td>SIALANG</td><td>Language of SP Interview</td><td>Language of the Sample Person Interview Instrument</td><td>chear:Language</td><td>??instrument</td><td></td><td>??interview</td><td></td><td></td><td></td><td>??participant</td></tr>
<tr><td>DMDHRGND</td><td>HH ref person's gender</td><td>HH reference person's gender</td><td>sio:BiologicalSex</td><td>??HHRef</td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
<tr><td>DMDHRAGE</td><td>HH ref person's age in years</td><td>HH reference person's age in years</td><td>sio:Age</td><td>??HHRef</td><td>uo:0000036</td><td></td><td></td><td></td><td></td><td></td></tr>
<tr><td>DMDHRBR4</td><td>HH ref person's country of birth</td><td>HH reference person's country of birth</td><td></td><td></td><td></td><td>??birth</td><td>sio:Country</td><td></td><td>sio:isLocationOf</td><td>??HHRef</td></tr>
<tr><td>DMDHREDU</td><td>HH ref person's education level</td><td>HH reference person's education level</td><td>chear:EducationLevel</td><td>??HHRef</td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
<tr><td>DMDHRMAR</td><td>HH ref person's marital status</td><td>HH reference person's marital status</td><td>chear:MaritalStatus</td><td>??HHRef</td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
<tr><td>WTINT2YR</td><td>Full sample 2 year interview weight</td><td>Full sample 2 year interview weight.</td><td>chear:Weight</td><td>??participant</td><td></td><td>??interview</td><td></td><td></td><td></td><td></td></tr>
<tr><td>WTMEC2YR</td><td>Full sample 2 year MEC exam weight</td><td>Full sample 2 year MEC exam weight.</td><td>chear:Weight</td><td>??participant</td><td></td><td>??exam</td><td></td><td></td><td></td><td></td></tr>
<tr><td>INDHHIN2</td><td>Annual household income</td><td>Total household income (reported as a range value in dollars)</td><td>chear:Income</td><td>??household</td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
<tr><td>??participant</td><td>Participant</td><td></td><td></td><td></td><td></td><td></td><td>ncit:C29867, sio:Human</td><td>sio:SubjectRole</td><td></td><td></td></tr>
<tr><td>??screening</td><td>Screening</td><td></td><td></td><td></td><td></td><td></td><td>chear:Screening</td><td></td><td></td><td></td></tr>
<tr><td>??exam</td><td>Examination</td><td></td><td></td><td></td><td></td><td></td><td>ncit:C131902</td><td></td><td></td><td></td></tr>
<tr><td>??birth</td><td>Birth</td><td></td><td></td><td></td><td></td><td></td><td>sio:Birthing</td><td></td><td></td><td></td></tr>
<tr><td>??pregnancy</td><td>Pregnancy</td><td></td><td></td><td></td><td></td><td></td><td>chear:Pregnancy</td><td></td><td></td><td></td></tr></tr>
<tr><td>??interview</td><td>Interview</td><td></td><td></td><td></td><td></td><td></td><td>ncit:C16751</td><td></td><td></td><td></td></tr>
<tr><td>??instrument</td><td>Instrumentation</td><td></td><td></td><td></td><td></td><td></td><td>ncit:C16742</td><td></td><td></td><td></td></tr>
<tr><td>??household</td><td>Household</td><td></td><td></td><td></td><td></td><td></td><td>chear:Household</td><td></td><td></td><td>??participant</td></tr>
<tr><td>??HHRef</td><td>Household reference person</td><td></td><td></td><td></td><td></td><td></td><td>chear:HeadOfHousehold</td><td></td><td></td><td>??household</td></table>

    <p>A key step in the Dictionary Mapping creation process is identifying whether each entry refers to an attribute or to an entity.</p>
    <p>In general, columns in a data file describe observed characteristics of some entity, and should be assigned a corresponding
class in the Attribute column. </p>
    <p>The entity that has that characteristic is populated in the attributeOf column. If the entity is implicit – that is, there is no column in the dataset representing the entity – a virtual entry should be made for this entity, and typed with an appropriate class in the Entity column. </p>
    <p>The method of determining which class should be assigned to an attribute or entity may differ by project. For biomedical studies, an ontology browser such as <a href="https://bioportal.bioontology.org/">BioPortal</a> or <a href="http://www.ontobee.org/">Ontobee</a> may be used to find appropriate terms and relevant ontologies.</p>
    <p>It is worth noting that some biomedical ontologies and terms may not be included in these search portals, in which case the ontologies themselves may need be examined and/or expanded.</p>

    <p>Other important metadata recorded in the Dictionary Mappings sheet includes units of measurement and the format of the data value, which can be described in the Units and Format columns, respectively. <br/>
    <p>Additionally, provenance information can be included for each Dictionary Mapping entry, including inRelationTo, which connects the a property of entry to another attribute or entity; wasDerivedFrom, which is used to reference pre-existing entities that that are relevant in the construction of the entry; and wasGeneratedBy, which describes the activity used in the production of the entry. </p>
    <p>Furthermore, if the entry has an associated time, the Time column can be filled out accordingly. Customized time intervals can be specified in the Timeline sheet, further described in the <a href="documentation#timeline">documentation</a> as well as <a href="tutorial#timeline">below</a>.</p> 
    <p>In the CHEAR study, for example, the data tracks child development in terms of observations taken at specific times relative to the birth or conception of the child.  </p>

    <p>For more information, see the Dictionary Mapping <a href="documentation#dictionary-mapping">documentation</a>.<br/>
    </p>
  </div>
</section>

<section class="resume-section p-3 p-lg-5 d-flex d-column" id="cb">
  <div class="my-auto">
    <h2>Codebook</h2>
    <p>As a standard codebook is included in the collection of initial documents for CHEAR, the creation of a semantic codebook from this point is simply the addition of concepts in the Class column. </p>

    <p>When there is no standard codebook to start from, manual creation of a semantic codebook involves the process of identifying which columns have encoded values, finding all such possible values, and assigning appropriate classes to those codes. </p>

    <p>We recommend that the class assigned to each code for a given column be a subclass of the attribute or entity assigned to that column. </p>

    <p>Examples of data that may require expansion in a codebook include a column like "level of education", where possible values come from a certain enumerated set. For example, if a column called "education" is assigned as an attribute chear:EducationLevel, the classes assigned to the code values for "education" should have rdfs:subClassOf relationships to chear:EducationLevel, such as chear:NoFormalEducation or chear:CollegeGraduate.</p>


    <p>In order to learn more, see the Codebook <a href="documentation#codebook">documentation</a>.<br/>
    </p>
  </div>
</section>

<section class="resume-section p-3 p-lg-5 d-flex d-column" id="timeline">
  <div class="my-auto">
    <h2>Timeline</h2>
    <p>The Timeline table can be used to annotate the corresponding class and unit related to a given entry, as well start and end times of an event. <br/>
    </p>

    <p>For more information, see the Timeline <a href="documentation#timeline">documentation</a>.<br/>
    </p>
  </div>
</section>

<section class="resume-section p-3 p-lg-5 d-flex d-column" id="run">
  <div class="my-auto">
    <h2>Run Script</h2>
    <p>Once all the Semantic Data Dictionary artifacts are ready, the sdd2rdf script can be run using python and providing an input argument corresponding to the relative or absolute location of the config file.<br/>
    <code>python sdd2rdf ExampleProject/config/config.ini.example<br/> </code>
    </p>

  </div>
</section>

<section class="resume-section p-3 p-lg-5 d-flex d-column" id="load">
  <div class="my-auto">
    <h2>Load Graph</h2>
    <p><br/>
    <code><br/> </code>
    </p>

    <p><br/>
    <code><br/> </code>
    </p>

    <p><br/>
    <code><br/> </code>
    </p>

    <p><br/>
    <code><br/> </code>
    </p>

    <p><br/>
    <code><br/> </code>
    </p>
  </div>
</section>

<section class="resume-section p-3 p-lg-5 d-flex d-column" id="query">
  <div class="my-auto">
    <h2>Query Graph</h2>
    <p><br/>
    <code><br/> </code>
    </p>

    <p><br/>
    <code><br/> </code>
    </p>

    <p><br/>
    <code><br/> </code>
    </p>

    <p><br/>
    <code><br/> </code>
    </p>

    <p><br/>
    <code><br/> </code>
    </p>
  </div>
</section>

<section class="resume-section p-3 p-lg-5 d-flex d-column" id="infer">
  <div class="my-auto">
    <h2>Infer Knowledge</h2>
    <p><br/>
    <code><br/> </code>
    </p>

    <p><br/>
    <code><br/> </code>
    </p>

    <p><br/>
    <code><br/> </code>
    </p>

    <p><br/>
    <code><br/> </code>
    </p>

    <p><br/>
    <code><br/> </code>
    </p>
  </div>
</section>
