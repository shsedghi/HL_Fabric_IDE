# Hyperledger Fabric Application Development with an IDE
## Background
This set of tools and document provides a simpler and 21st century way of developing a blockchain application. This is a continuation of a work that was managed in HL fabric 0.5 and 0.6 with Eclipse and Jetbrain Intellegi. Within this huge gap Jetbain dropped the support of GOLang development in Community edition of Intelligi and introduced a product called Gland which looks expensive to deploy for many open source developers. Unfortunately Eclipse support for GOClipse has not improved since, which originally triggered the use of a Jetbrain Product. During this gap Microsoft was able to fill the gap in GO development in Visual Studio Code, however GO V10.x lacks debugging capabilities (missing required debugging artifacts) which breaks go debugging in VSCode. 

With the introduction of JavaScript Chaincode, VSCode plays a more important role as a full stack development tool for HL fabric. The focus of this documnet is to build:

1. An enviornmonet for chaincode development. This Environment was derived from Basic Network of Hyperledger Fabric 1.1, and added DEV mode. The Fabric 1.1 DEV mode does not support CouchDB.
2. Focus on Javascript which has no debugging limitation, while using Eclipse for GO development, old fashioned way.


## Setting up the environment

### In a nutshell

* All Docker images of HL fabric is loaded
* The credentials of Chanicode Docker is moved to Mac
* The sample Chincodes (Sacc for GO and Chaincode02 for Javascript) are deployed through the CLI docker instance

### Steps
#### Installation ####

* Install [pre-requsites](https://hyperledger-fabric.readthedocs.io/en/release-1.1/prereqs.html) on your Mac. Note that GoLang 1.9 breaks with Fabric 1.1 due to docker go libraries which are compiled with  goLang 10.x.

* You need [Git](https://git-scm.com/download/mac) on Mac, if you do not have it.

* Install [Visual Studio Code](https://code.visualstudio.com/), if you do not have it.


#### Configuration ####
* clone git repository
```
git clone https://github.com/shsedghi/HL_Fabric_IDE
cd HL_Fabric_IDE
```
* The follwing steps build s the environment. if your network is slow, the channel creation may fail, you need to redo this step.
```
./start_dev.sh
```
* After succesful start you can stop the environment with
```
 ./stop_dev_sh
```
* You can delete the whole environment with (wtach out if you have other HL images)
```
 ./teardown_dev.sh
```
* After successful start up:
```
 docker ps
```
![](images/Docker_PS.png)

* In this stage we copy goPath and local MSP from Chaincode Docker into Mac. You need to setup  enevironemnt varaibles to point to both. 

```
docker cp chaincode:/opt/gopath ~/gopath
docker cp chaincode:/etc/hyperledger/msp /etc/hyperledger/msp
```

* Modify your .bash_profile and include the following environment varaibles. You need to logout and log back in for the chages take effect.
```
GOPATH=~/goPath
CORE_PEER_LOCALMSPID=DEFAULT
CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp
export  GOPATH CORE_PEER_LOCALMSPID CORE_PEER_MSPCONFIGPATH
```

* Build the required libraries for Java script chaincode02 by:
```
cd $GOPATH/src/chaincode/chaincode_example02//node/
npm install
```
* Open VSCode 
* Open ~/goPath
* Browse to src/chaincode/chaincode_example02//node/

![](images/VSCode.png =250x250)

* Double click on chaincode_example02.js to open 
* From File &rightarrow; Debug &rightarrow; Open Configuration and modify or replace it as this [Config File](lunch_js.json) 











