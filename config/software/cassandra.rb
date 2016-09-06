name "cassandra"
default_version "3.7"

dependency "server-jre"

license "Apache"
skip_transitive_dependency_licensing true

version "3.7" do
  source md5: "39968c48cbb2a333e525f852db59fb48"
end

source url: "http://mirror.cogentco.com/pub/apache/cassandra/#{version}/apache-cassandra-#{version}-bin.tar.gz"



build do
  delete "apache-cassandra-#{version}/lib/sigar-bin/libsigar-amd64-solaris.so"

  # Change a couple config files
  patch source: "cassandra.yaml.patch"
  patch source: "cassandra-env.sh.patch"

  # Cleanup javadoc, we don't need that here and it take over 100MB!
  delete "apache-cassandra-#{version}/javadoc"

  # General copy of all the decompressed tarball
  sync "apache-cassandra-#{version}", "#{install_dir}/embedded/apache-cassandra"

  # Copy this file directly from the patch directory
  # But it's actually a full file - it was just annoying to handle with the patch method...
  copy File.join(Omnibus.possible_paths_for('config/patches').first, "cassandra/cassandra.init.debian"), "#{install_dir}/embedded/apache-cassandra/tools/bin"

  # have /opt/cassandra/bin/cqlsh
  mkdir "#{install_dir}/bin"
end

