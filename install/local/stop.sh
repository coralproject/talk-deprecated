#!/bin/bash

lsof -i tcp:16180 | awk 'NR>1 {print $2}' | xargs kill
lsof -i tcp:16181 | awk 'NR>1 {print $2}' | xargs kill
lsof -i tcp:16182 | awk 'NR>1 {print $2}' | xargs kill
