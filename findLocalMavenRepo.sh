#!/bin/bash
findLocalMavenRepo() {
  GIT_ROOT="/home/jdallman/git/"
  ACTUALDIRFULL=`pwd`
  mavenRepoDirectoryName='.repository'
  withoutGitRoot=$(echo "$ACTUALDIRFULL" | sed "s|$GIT_ROOT||g")
  b="/"

  withoutDirectory=$(echo $withoutGitRoot | grep -o "$b.*")
  workspaceDirectory=$(echo "$ACTUALDIRFULL" | sed "s|$withoutDirectory||g")
  mavenRepo="$workspaceDirectory/$mavenRepoDirectoryName"
  if [ ! -e "$mavenRepo" ]; then
    echo "Create local maven repo: $mavenRepo"
    mkdir $mavenRepo
  fi

  echo "$mavenRepo"
}
