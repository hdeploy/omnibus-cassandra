#
# Copyright 2016 Patrick Viet
#
# All Rights Reserved.
#

name "cassandra"
maintainer "patrick.viet@gmail.com"
homepage "http://github.com/hdeploy/omnibus-cassandra/"

# Defaults to C:/cassandra on Windows
# and /opt/cassandra on all other platforms
install_dir "#{default_root}/#{name}"

build_version "3.7"
build_iteration 1

# Creates required build directories
#dependency "preparation"

# cassandra dependencies/components
dependency "cassandra"
dependency "server-jre"

# Version manifest file
#dependency "version-manifest"

exclude "**/.git"
exclude "**/bundler/git"
