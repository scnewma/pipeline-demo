#!/bin/bash

fly -n -t docker sp -p pipeline-demo -c pipeline.yml -l params.yml