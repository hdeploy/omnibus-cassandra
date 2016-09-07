name "cassandra"
default_version "3.7"

dependency "server-jre"
dependency "python" # For cqlsh. It needs python 2.7 ...

license "Apache"
skip_transitive_dependency_licensing true

version "3.7" do
  source md5: "39968c48cbb2a333e525f852db59fb48"
end

source url: "http://mirror.cogentco.com/pub/apache/cassandra/#{version}/apache-cassandra-#{version}-bin.tar.gz"

# Add some config files
%w[
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
].each do |f|
  project.config_file "#{install_dir}/embedded/apache-cassandra/conf/#{f}"
end

build do
  delete "apache-cassandra-#{version}/lib/sigar-bin/libsigar-amd64-solaris.so"

  # Change a couple config files
  patch source: "cassandra.yaml.patch"
  patch source: "cassandra-env.sh.patch"

  # Cleanup javadoc, we don't need that here and it take over 100MB!
  delete "apache-cassandra-#{version}/javadoc"

  # General copy of all the decompressed tarball
  sync "apache-cassandra-#{version}", "#{install_dir}/embedded/apache-cassandra"

  # Init files ...
  erb source: "cassandra.init.debian.erb", dest: "#{install_dir}/embedded/apache-cassandra/tools/bin/cassandra.init.debian"
  erb source: "cassandra.init.rhel.erb", dest: "#{install_dir}/embedded/apache-cassandra/tools/bin/cassandra.init.rhel"
  erb source: "cqlsh.erb", dest: "#{install_dir}/embedded/apache-cassandra/bin/cqlsh", vars: { install_dir: install_dir }

 "#{install_dir}/embedded/apache-cassandra/tools/bin"

end

