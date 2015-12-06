#!/bin/bash
# ==============================================================================
# Contact       : https://github.com/harkx
# Purpose       :
# Name          :
# Revision      : v0.1
# ==============================================================================
# Change history:
#  2015.12.06 : 0.1 - initial script
# ==============================================================================
# Usage:
#  sh ./bashtemplate.sh
# ==============================================================================
## RESOURCES: http://redsymbol.net/articles/unofficial-bash-strict-mode/
# -e = any failing command will cause the script to stop
# -u = treats unset variables as an error (in case an unset variable is used
set -euo pipefail # Short for: set -e, set -u and set -o pipefail
IFS=$'\n\t'       # Internal Field Separator

# VARIABLES
VERSION=0.1
this_path=$(readlink -f $0)        ## Path of this file
myname=`basename ${this_path}`     ## this script.

# Functions
#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  __help
#   DESCRIPTION:  Help!
#-------------------------------------------------------------------------------
function help {
  echo "
  usage: $myname [options]
  -h           optional  Print this help message
  -q           optional  Suppress log messages on screen, just log them."
}

#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  __detect_color_support
#   DESCRIPTION:  Try to detect color support.
#-------------------------------------------------------------------------------
_COLORS=${BS_COLORS:-$(tput colors 2>/dev/null || echo 0)}
__detect_color_support() {
    if [ $? -eq 0 ] && [ "$_COLORS" -gt 2 ]; then
        RC="\033[1;31m"
        GC="\033[1;32m"
        BC="\033[1;34m"
        YC="\033[1;33m"
        EC="\033[0m"
    else
        RC=""
        GC=""
        BC=""
        YC=""
        EC=""
    fi
}
__detect_color_support

#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  echoerr
#   DESCRIPTION:  Echo errors to stderr.
#-------------------------------------------------------------------------------
echoerror() {
    printf "${RC} * ERROR${EC}: %s\n" "$@" 1>&2;
}

#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  echoinfo
#   DESCRIPTION:  Echo information to stdout.
#-------------------------------------------------------------------------------
echoinfo() {
    printf "${GC} *  INFO${EC}: %s\n" "$@";
}

#---  NO ARGS  -----------------------------------------------------------------
#          NAME:  no args
#   DESCRIPTION:  If no arguments are supplied show the usage info
#-------------------------------------------------------------------------------
if [ $# == 0 ] ; then
  # Show usage info
  help
  exit 1;
fi

#---  MAIN  --------------------------------------------------------------------
#          NAME:  echoinfo
#   DESCRIPTION:  Echo information to stdout.
#-------------------------------------------------------------------------------
function main {
  help
  # Some argument parsing needs to be done..
}

# Execute the main code block
main "$@"
