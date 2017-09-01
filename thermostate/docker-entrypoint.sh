#!/bin/bash
# Copyright (c) Jupyter Development Team.
# Copyright (c) Bryan W. Weber
# Distributed under the terms of the Modified BSD License.

set -e

echo $NOTEBOOK_DIR
echo $USER

# If the run command is the default, do some initialization first
if [ ! -d "$NOTEBOOK_DIR/Tutorials" ]; then
    mkdir -p $NOTEBOOK_DIR/Tutorials
    tar -xzf /tmp/Tutorials.tar.gz -C $NOTEBOOK_DIR/Tutorials
fi

# Run the command provided
exec "$@"
