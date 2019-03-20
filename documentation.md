---
title: Documentation
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
                <a class="nav-link js-scroll-trigger" href="#infosheet">Infosheet</a>
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
                <a class="nav-link js-scroll-trigger" href="#code-mappings">Code Mappings</a>
            </li>
            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="#configuration">Configuration</a>
            </li>
            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="#prefixes">Prefixes</a>
            </li>
            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="#property-customization">Property Customization</a>
            </li>
            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="#templating">Templating</a>
            </li>
        </ul>
    </div>
</nav>
## Welcome to the Semantic Data Dictionary wiki!
This wiki contains documentation on the Semantic Data Dictionary (SDD). 
This approach provides a way to annotate data such that entities in a dataset and their relationships can be accurately represented by encoding mappings to a background set of ontologies.

![SDD Workflow](https://github.com/tetherless-world/SemanticDataDictionary/blob/master/SDDWorkflow.png)

The Semantic Data Dictionary is a specification formalizing how to assign a semantic representation of data by annotating dataset variables and their values using concepts from best practice vocabularies and ontologies. 
It is a collection of individual documents that each play a role in creating a concise and consistent knowledge representation, including the Dictionary Mapping, Codebook, Timeline, and Code Mapping specifications, and the Infosheet, which is used to link these Semantic Data Dictionary elements together. 

We implement the SDD as a collection of tabular data sheets which can be written in Excel or Comma Separated Value (CSV) files. 
In order to organize the collection of sheets in the SDD, we use the Infosheet, which contains information about the Semantic Data Dictionary data model being described, as well as the location of the other SDD tables.

## Infosheet
The Infosheet is used to organize the SDD tables, and contains information about the Semantic Data Dictionary, such as the name, identifier, or link to the documentation, in addition to the location of the other SDD tables. 



| Infosheet Row | Related Property | Description | Example |
|------------ | ------------- | ------------- | ------------- |
| Code Mapping |  | Reference to Code Mapping table location | http://... |
| Codebook |  | Reference to Codebook table location | http://... |
| Dictionary Mapping |  |  Reference to Dictionary Mapping table location | http://... |
| Imports | _owl:imports_ |  Ontologies that the SDD references | http://semanticscience.org/ontology/sio-subset-labels.owl |
| Timeline|  |  Reference to Timeline table location | http://... |

<!--
### Infosheet Specification
The structure of the infosheet has been updated to support Distribution Level Dataset Descriptions from the [HCLS Standards](https://www.w3.org/TR/hcls-dataset/) and the [Data on the Web best practices](https://www.w3.org/TR/dwbp/). Rather than describing the datasets themselves, we use the properties described in these specifications to annotate the Semantic Data Dictionary collection instance itself.

The Infosheet Specification is shown below.

| Infosheet Row | Related Property | Description | Example |
|------------ | ------------- | ------------- | ------------- |
| Alternative Title | _dct:alternative_ | Alternative title for KG fragment | Cheese Study 1.1 |
| Code Mapping |  | Reference to Code Mapping table location | http://... |
| Codebook |  | Reference to Codebook table location | http://... |
| Comment | _rdfs:comment_ | Comment about the SDD | "This is the first updated version of the initially submitted cheese dataset."|
| Contributors | _dct:contributor_ | Contributors to the SDD |	
| Creators | _dct:creator_ | Creators of the SDD |
| Date Created | _dct:created_ |  Date the SDD was created | 2018-09-18 |
| Date of Issue | _dct:issued_ | Date the SDD was issued |	2018-10-14 |
| Description | _dct:description_ | Description of the KG fragment | "This dataset describes the properties of cheese. Most of them included are very tasty, though some are quite smelly." |
| Dictionary Mapping |  |  Reference to Dictionary Mapping table location | http://... |
| Documentation | _dcat:landingPage_ | Location of documentation | http://cheese.study/doc.html |
| File Format	 | _dct:format_ | Specification of file format | trig |
| Identifier | _sio:hasIdentifier_ | Unique Identifier for the SDD | http://cheese.study/1.1/cheese-sdd |
| Imports | _owl:imports_ |  Ontologies that the SDD references | http://semanticscience.org/ontology/sio-subset-labels.owl |
| Keywords | _dct:keyword_ | Keywords to be associated with the KG fragment | "cheese,swiss,provolone,american cheese,cheddar" | 
| Language | _dct:language_ | Language of text in the SDD | en |
| Licence | _dct:licence_ | Licence URL | MIT Licence |
| Link | _dct:page_ | Link to webpage about the SDD | http://cheese.study/cheese.html | |
| Previous Version | _pav:previousVersion_ | Previous version URL | http://cheese.study/1.0/ |
| Publisher  | _dct:publisher_ | Publisher of the SDD | Tetherless World Constellation |
| Rights | _dct:rights_ | Rights agreement | Rights Reserved |
| Standards | _dct:conformsTo_ | Standards that the SDD conforms to | https://www.iso.org/iso-22000-food-safety-management.html | 
| Source | _dct:source_ | Source of the Data used to generate the KG fragment | http://... |
| Timeline |  | Reference to Timeline table location | http://... |
| Title | _dct:title_ | Title of KG fragment | A Study on Cheese | 
| Type | _rdf:type_ | Type of dataset | http://purl.org/dc/dcmitype/Collection |
| Version | _owl:versionInfo_ | Current version URL | http://cheese.study/1.1/ |
| Version Of | _dct:isVersionOf_ | Resource URL for which the generated KG fragment is a version of | http://cheese.study/ |

### Example Generated Dataset Metadata

The generated dataset metadata RDF from this example is shown below:
A header for the nanopub is created.
<pre>
@prefix cheese-kb: &lt;http://idea.rpi.edu/kb/cheese#>.
cheese-kb:head-dataset_metadata { 
    cheese-kb:nanoPub-dataset_metadata    rdf:type    np:Nanopublication ;
        np:hasAssertion    cheese-kb:assertion-dataset_metadata ;
        np:hasProvenance    cheese-kb:provenance-dataset_metadata ;
        np:hasPublicationInfo    cheese-kb:pubInfo-dataset_metadata .
}
</pre>
An assertion graph is created.
<pre>
cheese-kb:assertion-dataset_metadata {
    cheese-kb:dataset    rdf:type    &lt;http://purl.org/dc/dcmitype/Collection&gt; ;
        &lt;http://purl.org/dc/terms/title&gt;    "A Study on Cheese"^^xsd:string ;
        &lt;http://purl.org/dc/terms/alternative&gt;    "Cheese Study 1.1"^^xsd:string ;
        &lt;http://www.w3.org/2000/01/rdf-schema#comment&gt;    "This is the first updated version of the initially submitted cheese dataset."^^xsd:string ;
        &lt;http://purl.org/dc/terms/description&gt;    "This dataset describes the properties of cheese. Most of them included are very tasty, though some are quite smelly."^^xsd:string ;
        &lt;http://xmlns.com/foaf/0.1/page&gt;    &lt;http://cs.rpi.edu/~rashis2/&gt; ;
        &lt;http://semanticscience.org/resource/hasIdentifier>    
            [ rdf:type    &lt;http://semanticscience.org/resource/Identifier&gt; ; 
            &lt;http://semanticscience.org/resource/hasValue&gt;    "cheese-2018-1.1"^^xsd:string ] ;
        &lt;http://www.w3.org/ns/dcat#keyword&gt;    "cheese","swiss"^^xsd:string,"provolone"^^xsd:string,"american cheese"^^xsd:string,"cheddar"^^xsd:string ;
        &lt;http://purl.org/dc/terms/license&gt;    "MIT Licence"^^xsd:string ;
        &lt;http://purl.org/dc/terms/rights&gt;    "Rights Reserved"^^xsd:string ;
        &lt;http://purl.org/dc/terms/language&gt;    "English"^^xsd:string ;
        &lt;http://purl.org/dc/terms/conformsTo&gt;    &lt;https://www.iso.org/iso-22000-food-safety-management.html&gt; ;
        &lt;http://purl.org/dc/terms/format&gt;    "csv"^^xsd:string .
}
</pre>
A provenance graph is created.
<pre>
cheese-kb:provenance-dataset_metadata {
    cheese-kb:assertion-dataset_metadata    &lt;http://www.w3.org/ns/prov#generatedAtTime&gt;    "2018-09-18T18:46:28Z"^^xsd:dateTime .
    cheese-kb:dataset    &lt;http://www.w3.org/ns/prov#generatedAtTime&gt;    "2018-09-18T18:46:28Z"^^xsd:dateTime  ;
        &lt;http://purl.org/dc/terms/created&gt;    "2018-09-18"^^xsd:date ;
        &lt;http://purl.org/dc/terms/creator&gt;    "Sabbir Rashid"^^xsd:string ;
        &lt;http://purl.org/dc/terms/contributor&gt;    "Sabbir's friends"^^xsd:string ;
        &lt;http://purl.org/dc/terms/publisher&gt;    "Sabbir's Publisher"^^xsd:string ;
        &lt;http://purl.org/dc/terms/issued&gt;    "2018-09-18"^^xsd:date ;
        &lt;http://www.w3.org/2002/07/owl/versionInfo&gt;    "1.1"^^xsd:string ;
        &lt;http://purl.org/pav/version&gt;    "1.1"^^xsd:string ;
        &lt;http://purl.org/pav/previousVersion&gt;    "1.0"^^xsd:string ;
        &lt;http://purl.org/dc/terms/isVersionOf&gt;    "Cheese Study 1.0"^^xsd:string .
}
</pre>
A publication information graph is created.
<pre>
cheese-kb:pubInfo-dataset_metadata {
    cheese-kb:nanoPub-dataset_metadata    &lt;http://www.w3.org/ns/prov#generatedAtTime&gt;    "2018-09-18T18:46:28Z"^^xsd:dateTime .
}
</pre>
-->
## Dictionary Mapping

The bulk of the annotation is done using the Dictionary Mapping (DM) table, which is used to annotate the columns of a given dataset. 
The DM table contains entries describing concepts explicit in the original dataset, as well as implicit entries. 
The explicit entries contain mappings to the underlying attribute that is described by a particular dataset column, as well as provenance information such as how that variable was generated or derived.
Implicit entries are used to describe entities that are implicit within the dataset, such as the entity being measured, or the time at which a measurement was taken. 
These entities are readily recognized by human data users even though there is no column in the dataset that refers to them directly, but we must make them explicit for machines.
These implicit entities can then be described with type, role, relation, and other information in the same manner as the explicit columns in the dataset.
The SDD DM Specification is shown below.

| DM Column | Related Property | Description |
|------------ | -------------| -------------|
| Attribute | _rdf:type_ | Class of attribute entry |
| attributeOf | _sio:isAttributeOf_ | Entity having the attribute |
| Column |  | Entry column header in dataset |
| Comment | _rdfs:comment_ | Comment for the entry |
| Definition | _skos:definition_ | Entry text definition|
| Entity | _rdf:type_ | Class of entity entry |
| Format | | Specifies the structure of the Unit value|
| inRelationTo | _sio:inRelationTo_ | Entity that the role is linked to |
| Label | _rdfs:label_ | Label for the entry |
| Property |  | Custom datatype property specification |
| Relation | | Custom relation that replaces inRelationTo |
| Role | _sio:hasRole_ | Type of the role of the entry |
| Time | _sio:existsAt_ | Time point of measurement |
| Unit | _sio:hasUnit_ | Unit of Measure for entry |
| wasDerivedFrom | _prov:wasDerivedFrom_ | Entity from which the entry was derived |
| wasGeneratedBy | _prov:wasGeneratedBy_ | Activity from which the entry was produced |


Explicit and implicit entries are stored in the DM Column of the Dictionary Mapping table called "Column".
Annotation properties including comments, labels, or definitions can be provided to describe an explicit or virtual entry in further detail.
If an entry describes a characteristic, the Attribute column should be populated with an appropriate class, and when appropriate the attributeOf column should be used to reference the entity to which the attribute belongs.
If an entry describes an object, an applicable class should be included in the Entity column.
In general, for each row in the Dictionary Mapping, either the Entity or Attribute column should be populated with an appropriate class.

The units of a given variable and the format of the data in the cell can be specified in the Unit and Format columns, respectively.
Events or time intervals associated with an entry should be referenced in the Time column.
A reference to objects or attributes an entry is related to should be included in the inRelationTo column.
If an entry refers to a role, that can be specified in the Role column.
Customized relationships can also be included by using the Relation column.

Provenance information pertaining to how the variable was derived or generated can be included in the wasDerivedFrom and wasGeneratedBy columns, respectively.
An example Dictionary Mapping from the CHEAR project is provided below.

| Column | Attribute | attributeOf |  Entity | Unit | Time | Role | inRelationTo | wasDerivedFrom | 
| ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | 
| id | sio:Identifier | ??child | | | |  | ??study | |
| race | sio:Race | ??mother |  | | | | | |
| age | sio:Age | ??mother | | sio:Year |  ??visit1 | | | |
| edu | chear:EducationLevel | ??mother | |  | ??visit2 | | | |
| insur | chear:InsuranceType | ??mother | | |  ??visit3 | | | |
| urineam_3 | sio:Quality | ??sample3 | | |  ??visit3 | | | |
| t1bmi | chear:BMI | ??mother | | kg/m2 | ??visit1 | | |  t1weight, ??height|
| t1weight | chear:Weight | ??mother | | kg | ??visit1 | | | |
| smoke | chear:SmokingStatus | ??mother | | | ??pregnancy | | | |
| birthwt | chear:Weight | ??child | | g | ??birth | | | |
| ??height | sio:Height | ??mother | | | | | |
| ??mother | | | sio:Human | | | chear:Mother |   ??child ||
| ??child | | | sio:Human | | | chear:Child |   ??mother ||
| ??birth | | | sio:Birthing | | |  |  ??child | |
| ??pregnancy | | | chear:PregnancyPeriod | | |    | ??birth | |
| ??conception | | | chear:Conception | | |  |  ??child | |
| ??sample3 | | | U | | | | | ??mother|

## Codebook

The Codebook table contains possible values of coded variables and their associated labels.

| Codebook Column | Related Property | Description |
|------------ | -------------| -------------|
| Class | _rdf:type_ | Class the Code refers to |
| Code | _sio:hasValue_ | Value of the dataset entry|
| Column |  | Entry column header in dataset |
| Comment | _rdfs:comment_ | Comment for the codebook entry |
| Definition | _skos:definition_ | Definition for the codebook entry |
| Label | _rdfs:label_ | Label for the codebook entry |
| Resource | _rdf:type_ | Resource URI the Code refers to |

For variables with discrete values, when appropriate, we augment each possible value with mappings to corresponding concepts, as shown in the table below.

| Column | Code | Label    | Class  |
|------------ |------------ | -------------| -------------|
| race | 0  | white                           | chear:White                        |
| race | 1  | black                           | chear:BlackOrAfricanAmerican       |
| race | 2  | other                           | chear:OtherRace                    |
| edu  | 0  | high school degree or less      | chear:HighSchoolOrLess             |
| edu  | 1  | technical college or some college | chear:SomeCollege |
| edu  | 2  | college graduate                | chear:CollegeGraduate              |
| edu  | 3  | above			       | chear:AdvancedDegree              |
| smoke | 0  | no smoking in pregnancy         | chear:NonSmoker                    |
| smoke | 1  | some smoking in pregnancy       | chear:Smoker                      |
| insur | 0  | private/hmo/self-pay            | chear:NoPublicInsurance            |
| insur | 1  | public | chear:PublicInsurance | 

## Timeline 

Customized time intervals can be specified in the Timeline sheet, which can be used to annotate the corresponding class and unit related to a given entry, as well start and end times of an event, and a connection to concepts that the entry may be related to. 
In the CHEAR study, for example, the data tracks child development in terms of observations taken at specific times relative to the birth or conception of the child.
Comparing measurements across subjects for a particular time such as "the second trimester of pregnancy" requires we have a concept to describe this time interval, even though it will not necessarily fall during the same calendar week for any two subjects.

The Timeline Specification is shown below.

| Timeline Column | Related Property | Description|
|------------ | -------------| -------------|
| End | _sio:hasEndTime_ | End time associated with the timeline entry |
| inRelationTo | _sio:inRelationTo_ | What the timeline entry is in relation to |
| Label | _rdfs:label_ | Label for the timeline entry |
| Name | | Reference to the virtual timeline entry |
| Start | _sio:hasStartTime_ | Start time associated with the timeline entry |
| Type | _rdf:type_ | Class of the timeline entry |
| Unit | _sio:hasUnit_ | Unit of time |

An example Timeline table is shown below.

| Name | Label | Type | Start | End | Unit | inRelationTo |
|------------ | -------------|------------ |------------ |------------ | -------------| -------------|
| ??visit1 | Visit 1 | chear:Visit | 4.71| 19.1 | sio:Week | ??conception |
| ??visit2 | Visit 2 | chear:Visit | 14.9 | 32.1 | sio:Week| ??conception | 
| ??visit3 | Visit 3 | chear:Visit | 22.9| 38.3 | sio:Week | ??conception |


## Code Mappings
The Code Mappings table contains mappings of abbreviated terms or units to their corresponding ontology concepts.

This aids the annotator in allowing the use of shorthand notations instead of having to repeated search for the URI of the ontology class.
An example set of code mappings is shown below.

| code | uri | label | 
| ---- | ---- | ---- |
| Pb | chebi:25016 | Lead |
| S | uberon:0001977 | Serum |
| cm | obo:UO\_0000015 | centimeter |
| kg | obo:UO\_0000009 | kilogram |
| kg/m2 | obo:UO\_0000086 | kilogram per square meter |
| mgL | obo:UO\_0000273 | milligrams per liter | 

The set of code mappings used in the CHEAR project are useful for a variety of domains, and can be found on [GitHub](https://github.com/tetherless-world/chear-ontology/blob/master/code_mappings.csv).

## Configuration
The config.ini file is the configuration file used by the sdd2rdf script.
Note that file locations written in this config file can be absolute paths or URLs, as well as relative paths from the location that the sdd2rdf.py script exists.
An example configuration file is shown below.
<pre>
<b>[Prefixes]</b>
# Specify a file with the prefixes for existing ontologies used in your translation
<b>prefixes = Cheese/config/prefixes.txt</b>
# Specify the base uri to be associated with all triples minted by the script
<b>base_uri = cheese-kb</b>

<b>[Source Files]</b>
# Specify the location of the Dictionary Mapping file
<b>dictionary = Cheese/input/DM/cheeseDM.csv</b>
# Specify the location of the Codebook file
<b>codebook = Cheese/input/CB/cheeseCB.csv</b>
# Specify the location of the Timeline file
<b>timeline = Cheese/input/TL/cheeseTL.csv</b>
# Specify the location of the Code Mapping file
<b>code_mappings = Cheese/config/code_mappings.csv</b>
# Specify the location of the Data file
<b>data_file = Cheese/input/Data/cheese.csv</b>
# Specify the location of the Properties customization file
<b>properties = Cheese/config/cheeseProperties.csv</b>
# Specify the location of the Infosheet file
<b>infosheet = Cheese/config/cheeseInfosheet.csv</b>

<b>[Output Files]</b>
# Specify the location where the output RDF will be written to
<b>out_file = Cheese/output/trig/cheese-kg.trig</b>
# Specify the location where the output SPARQL query will be written to
<b>query_file = Cheese/output/sparql/cheeseQ</b>
# Specify the location where the output SWRL model will be written to
<b>swrl_file = Cheese/output/swrl/cheeseSWRL</b>
</pre>

## Prefixes
The prefixes.csv file is used to specify the namespace URIs for the prefixes used throughout the annotated SDD tables. An example prefix file is shown below.

| prefix | url | 
|------------ | -------------| 
|np|http://www.nanopub.org/nschema#|
|owl|http://www.w3.org/2002/07/owl#|
|rdf|http://www.w3.org/1999/02/22-rdf-syntax-ns#|
|rdfs|http://www.w3.org/2000/01/rdf-schema#|
|prov|http://www.w3.org/ns/prov#|
|xsd|http://www.w3.org/2001/XMLSchema#|
|uo|http://purl.obolibrary.org/obo/UO_|
|sio|http://semanticscience.org/resource/|
|stato|http://purl.obolibrary.org/obo/STATO_|
|example-kb|http://example.com/kb/example#|

Note that the prefix that you include in the configuration file as the base URI should also be included in the prefixes file.
## Property Customization
### Customization of properties used in generating KG

The Semantic Data Dictionary approach creates a link representation of the class or collection of datasets it describes.

The default model that sdd2rdf creates is based on the Semanticscience Integrated Ontology ([SIO](https://bioportal.bioontology.org/ontologies/SIO)), which can be used to describe a wide variety of objects using a fixed set of terms.

The default model that we adopt further incorporates annotation properties from [RDFS](https://www.w3.org/TR/rdf-schema/) and [SKOS](https://www.w3.org/TR/2008/WD-skos-reference-20080829/skos.html), and provenance predicates from [PROV-O](https://www.w3.org/TR/prov-o/).

The default set of properties are shown below.

| Column | Property | 
|------------ | -------------| 
| Attribute    | _rdf:type_ | 
| attributeOf | _sio:isAttributeOf_ | 
| Comment | _rdfs:comment_ | 
| Definition | _skos:definition_ |
| Entity | _rdf:type_ |
| inRelationTo | _sio:inRelationTo_ | 
| Label | _rdfs:label_ | 
| Role | _sio:hasRole_ | 
| Time | _sio:existsAt_ | 
| Unit | _sio:hasUnit_ | 
| Value | _sio:hasValue_ | 
| wasDerivedFrom | _prov:wasDerivedFrom_ | 
| wasGeneratedBy | _prov:wasGeneratedBy_ | 

By specifying the associated properties with certain columns of the Dictionary Mapping Table, the properties used in generating the knowledge graph can be customized.

This means that it is possible to use an alternate knowledge representation model, and thus makes this approach ontology agnostic.

Nevertheless, we urge the user to practice caution (for example, don't replace an object property with a datatype property) when customizing the properties used to ensure that the resulting graph is semantically consistent. 

## Templating
Templating in the Dictionary Mapping (DM) table adopts the scheme used by RML and [R2RML](https://www.w3.org/TR/r2rml/#from-template).

Essentially, in the Template column of the DM, it is possible to specify the format for the generated URI by specifying a template string and encompassing valid column name(s) within curly brackets: string-{col_name}. 

The value in the curly brackets resolves to the value for that column in the current row.

