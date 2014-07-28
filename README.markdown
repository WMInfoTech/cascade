####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with cascade](#setup)
    * [What cascade affects](#what-cascade-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with cascade](#beginning-with-cascade)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

##Overview

Manages config file for Hannon Hills Cascade
##Module Description

If applicable, this section should have a brief description of the technology the module integrates with and what that integration enables. This section should answer the questions: "What does this module *do*?" and "Why would I use it?"

If your module has a range of functionality (installation, configuration, management, etc.) this is the time to mention it.

##Setup

###What cascade affects

* A list of files, packages, services, or operations that the module will alter, impact, or execute on the system it's installed on.
* This is a great place to stick any warnings.
* Can be in list or paragraph form. 

###Setup Requirements **OPTIONAL**

Requires Tomcat be installed.

###Beginning with cascade

The very basic steps needed for a user to get the module up and running. 

If your most recent release breaks compatibility or requires particular steps for upgrading, you may wish to include an additional section here: Upgrading (For an example, see http://forge.puppetlabs.com/puppetlabs/firewall).

##Usage

Put the classes, types, and resources for customizing, configuring, and doing the fancy stuff with your module here. 

##Reference

All files in the files area are copied to tomcat's conf directory
The only file actively managed is the context.xml, which contains these
parameters.

=== Parameters

cascade_user = user than owns the files installed, defaults to tomcat7 on ubuntu, tomcat on rhel
cascade_group = group that owns the files installed, ditto above defaults
db_user - userid to connect to MySQL db with - no default
db_password - password used to connect to MySQL with - no default
db_url - url to find MySQL with - no default
db_maxactive - defined in context.xml, deault = 50
db_maxidle - context.xml, default = 10
db_maxwait - context.xml, default = 3000
db_removeabandoned - context.xml, default = true
db_logabandoned - context.xml, default = true
db_validationquery - context.xml, default = SELECT 11
db_testonborrow - context.xml, default = true
tomcat_confdir - location of tomcat confiiguration dir, ubuntu=/etc/tomcat7, rhel = /etc/tomcat


##Limitations

Should work on Ubuntu and RHEL base distributions

##Development

Fork it, submit pull request with spec tests.
