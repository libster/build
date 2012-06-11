#!/bin/bash

host_type=$1
noop=$2

function exec_cmd() {
  cmd=$1

  if [ ! -z "${DEBUG}" ]
  then
    echo "debug:exec_cmd ${cmd}"
  fi

  ${cmd}
}

function exec_cmd_as_root() {
  cmd=$1

  if [ $EUID -ne 0 ]
  then
    cmd="/usr/bin/sudo ${cmd}"
  fi

  exec_cmd "${cmd}"
}

puppet_dir="$(dirname $0)/puppet"
module_dir="${puppet_dir}/modules"
host_type_puppet_manifest="${puppet_dir}/${host_type}.pp"

if [ -f "${host_type_puppet_manifest}" ]
then
  #exec_cmd_as_root "/usr/bin/puppet apply --verbose ${noop} --debug --modulepath \"${module_dir}\" ${host_type_puppet_manifest}"
  exec_cmd_as_root "/usr/bin/puppet apply ${noop} --debug --modulepath \"${module_dir}\" ${host_type_puppet_manifest}"

else
  echo "No manifest found for ${host_type} (${host_type_puppet_manifest})"
fi


