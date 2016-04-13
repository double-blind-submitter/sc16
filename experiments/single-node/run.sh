#!/bin/bash
if [ "$#" -ne 1 ] ; then
  echo "No .yml file provided, executing 'gassyfs-variability.yml'"
  echo "To run other experiment, provide other .yml files"
  varsfile='gassyfs-variability.yml'
else
  varsfile=$1
fi
testname=`basename $varsfile .yml`
echo "" > ansible.log && ansible-playbook -b -i inventory -e "testname=${testname}" -e "@${varsfile}" playbook.yml
