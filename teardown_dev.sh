#!/bin/bash
#
# Copyright IBM Corp All Rights Reserved
#
# SPDX-License-Identifier: Apache-2.0
#
# Exit on first error, print all commands.
set -e

# Shut down the Docker containers for the system tests.
docker-compose -f docker-compose-couch_devmode.yml kill && docker-compose -f docker-compose-couch_devmode.yml down

# remove the local state
rm -f ~/.hfc-key-store/*

# remove chaincode docker images
docker rmi $(docker images |grep 'hyperledger/')

# Your system is now clean
