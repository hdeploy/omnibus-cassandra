name "cassandra"
default_version "3.7"

dependency "server-jre"

license "Apache"

version "3.7" do
  source md5: "39968c48cbb2a333e525f852db59fb48"
end

source url: "http://mirror.cogentco.com/pub/apache/cassandra/#{version}/apache-cassandra-#{version}-bin.tar.gz"



build do
  delete "apache-cassandra-#{version}/lib/sigar-bin/libsigar-amd64-solaris.so"
  sync "apache-cassandra-#{version}", "#{install_dir}/embedded/apache-cassandra"
end

