#!/bin/bash
export P4ENV=${HOME}/.p4env
export P4ENVD=${HOME}/.p4env.d

p4Type() {
	local SCRATCH=`mktemp`
	type -t p4 > ${SCRATCH}
	local ret=$?
	local P4TYPE=`cat ${SCRATCH}`
	rm -f ${SCRATCH}
	if [ "${ret}" == "0" ]; then
		echo -n "$P4TYPE"
		return 0
	else
		echo "undefined"
		return 1
	fi
}

p4Setup() {
	if [ ! -d "${P4ENVD}" ]; then
		echo "ERROR: p4 config directory '${P4ENVD}' does not exist. You should create it." 1>&2
	fi

	local index=$1
	local SCRATCH=`mktemp`

	p4Type > ${SCRATCH}
	local ret=$?
	local P4TYPE=`cat ${SCRATCH}`

	rm -f ${SCRATCH}

	if [ "${ret}" == "0" ]; then
		#p4 is defined in some kind of way
		echo "Loading default p4 environment" 1>&2
		if [ -a "${P4ENV}" ]; then
			source "${P4ENV}"
		fi

		if [ "${index}x" != "x" ]; then
			if [ -a "${P4ENVD}/${index}" ]; then
				source "${P4ENVD}/${index}"
			else
				echo "ERROR: config index ${index} does not exist in ${P4ENVD}" >&2
			fi
		fi
	else
		#p4 is not defined (is not in path either)
		echo "ERROR: Cannot find p4" 1>&2
	fi
}

p4Setup
