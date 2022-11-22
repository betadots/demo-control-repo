#!/bin/bash
CODEDIR='/etc/puppetlabs/code'
CODESTAGEDIR='/etc/puppetlabs/code-staging'
if [ -x /usr/bin/git ]; then
  if [ -d $CODESTAGEDIR ]; then
    ENVGITDIR="${CODESTAGEDIR}/environments/$1/.git"
  else
    ENVGITDIR="${CODEDIR}/environments/$1/.git"
  fi
  /usr/bin/git --git-dir $ENVGITDIR log --pretty=format:"%h - %an, %ad : %s" -1
else
  echo "no git - environment $1"
fi
exit 0
