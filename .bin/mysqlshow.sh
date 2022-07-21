#!/bin/bash

sudo mysqldumpslow -s t $(SLOW_LOG) | head -n 20