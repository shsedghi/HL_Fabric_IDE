# Hyperledger Fabric Application Development with an IDE
## Background
This set of tools and document provides a simpler and 21st century way of developing a blockchain application. This is a continuation of a work that was managed in HL fabric 0.5 and 0.6 with Eclipse and Jetbrain Intellegi. Within this huge gap Jetbain dropped the support of GOLang development in Community edition of Intelligi and introduced a product called Gland which looks expensive to deploy for many open source developers. Unfortunately Eclipse support for GOClipse has not improved since, which originally triggered the use of a Jetbrain Product. During this gap Microsoft was able to fill the gap in GO development in Visual Studio Code, however GO V10.x lacks debugging capabilities (missing required debugging artifacts) which breaks go debugging in VSCode. 

With the introduction of JavaScript Chaincode, VSCode plays a more important role as a full stack development tool for HL fabric. The focus of this documnet is to build:

1. An enviornmonet for chaincode development. This Environment was derived 
2. Focus on Javascript which has no debugging limitation, while using Eclipse for GO development, old fashioned way.


## Setting up the environment

### In a nutshell

* All Docker images of HL fabric is loaded
* The credentials of Chanicode Docker is moved to Mac
* The sample Chincodes (Sacc for GO and Chaincode02 for Javascript) are deployed through the CLI docker instance

### Steps

#### Configuration ####

You need Git on Mac, I assume you have it

* git clone https://github.com/shsedghi/HL_Fabric_IDE
* cd HL_Fabric_IDE

The follwing steps build s the environment. if your network is slow, the channel creation may fail, you need to redo this step.
> * ./start_dev.sh

After succesful start you can stop the environment with

> * ./stop_dev_sh

You can delete the whole environment with (wtach out if you have other HL images)

> *  ./teardown_dev.sh

> * docker ps

[1]: figures/Docker_PS.png 














