#!/bin/bash

fly -t docker sp -n -p pipeline-demo -c pipeline.yml -l params.yml