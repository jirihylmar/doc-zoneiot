#!/bin/bash

. $HOME/doc-zoneiot/create_reference_links.sh $HOME/doc-zoneiot

python3 $HOME/doc-zoneiot/extract_snippets_from_dictionary.py

cd $HOME/doc-zoneiot; git add .; git commit -m update; git push
