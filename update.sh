#!/bin/bash

python3 $HOME/doc-zoneiot/extract_snippets_from_dictionary.py

. $HOME/doc-zoneiot/create_reference_links.sh $HOME/doc-zoneiot

. $HOME/doc-zoneiot/create_documentation_statistics.sh /home/hylmarj/doc-zoneiot/docs

. $HOME/doc-zoneiot/create_todo_list.sh /home/hylmarj/doc-zoneiot


# cd $HOME/doc-zoneiot; git add .; git commit -m update; git push
