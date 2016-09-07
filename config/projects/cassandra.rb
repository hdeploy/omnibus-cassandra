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

config_files %w[
  cassandra-env.ps1
  cassandra-env.sh
  cassandra-jaas.config
  cassandra-rackdc.properties
  cassandra-topology.properties
  cassandra.yaml
  commitlog_archiving.properties
  jvm.options
  logback-tools.xml
  logback.xml
  metrics-reporter-config-sample.yaml
  triggers
].map{|f| "#{install_dir}/embedded/apache-cassandra/conf/#{k}"}

# Version manifest file
#dependency "version-manifest"

exclude "**/.git"
exclude "**/bundler/git"
