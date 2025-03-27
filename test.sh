#!/bin/bash

python --version

pip install -U conan

conan install --build=missing --output-folder=_dist .
