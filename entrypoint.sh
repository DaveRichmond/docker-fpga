#!/bin/bash

# maybe there's a better way to ensure the list of environment files is
# sorted, but for now this works
for env in $(ls /docker | grep '.env$' | sort)
do
	echo Including ${env}
	. ${env}

done

if [[ $# == 0 ]]
then
	echo "No command specified, spawning a shell"
	/bin/bash
else
	$@
fi
