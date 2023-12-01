#!/bin/sh

SCRIPTS_DIR=$(dirname "$0")/noarch

# load 'scripting' run-time support utility functions
. "${SCRIPTS_DIR}/scripting_utils"
script_log_init $(basename "$0" ".sh")

# load 'package' run-time support utility functions
. "${SCRIPTS_DIR}/package_utils"
environment_init $(basename "$0" ".sh")

if sh "$SCRIPTS_DIR/pre_install.sh" "$@" ; then
	sh "$SCRIPTS_DIR/package_install.sh" "scanner-meta"
	sh "$SCRIPTS_DIR/post_install.sh" "$@"
fi
