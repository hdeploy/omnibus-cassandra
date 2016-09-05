# omnibus-cassandra
Omnibus packaging of Apache Cassandra, JRE and configuration

# Why this packaging?

As of Sept 5 2016, HDeploy (and other projects I made such as Dynfirewall) require Apache Cassandra to run.

Apache Cassandra requires a bit of work to set up on your own, such as:
- Some kind of Java runtime, which you must download / add repos / add to path / etc
- Set up Cassandra itself, via OS packaging, external sources, or other
- Set the memory to a bit lower than normal because HDeploy requires very little data so it would be a was
- Maybe add a user (cassandra or other) to run this service
- Make the whole thing start up

While this is not a huge thing, it's still a bit of work. If I want people to try this, I must make it as easy as possible.
With this installer, all you need to do is download the package and type ```rpm -Uvh <filename.rpm>``` or ```dpkg -i filename.deb``` and you're good to go.

If this packaging wasn't there, it would be yet another hurdle to set this thing up. Not cool!

# What is this packaging?

It's a bundle a few pieces of software and config, which will be installed in /opt/omnicass

List:
- Apache Cassandra 3.7
- Oracle Java runtime 1.8u74
- A user omnicass (for 'omnibus cassandra') to run the daemon
- A default configuration for Cassandra
- A few symlinks, such as /usr/bin/java and /usr/bin/cqlsh if they don't already exist.

# How to use?

- Download .rpm or .deb file on [[http://www.hdeploy.org/download]] for the 'omnibus cassandra' package
- Depending on if you are on Debian/Ubuntu or Redhat/Centos/RPM app, run ```dpkg -i <omnibus-cassandra-blabla>.deb``` OR ```rpm -Uvh <omnibus-cassandra-blabla>.rpm```
- OPTIONAL: if you're running real production, do some real tuning of cassandra.yaml and cassandra-env.sh etc.

