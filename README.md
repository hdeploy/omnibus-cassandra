# omnibus-cassandra
Omnibus packaging of Apache Cassandra, JRE and configuration

## Short version of below text

This is just a packaging of Apache Cassandra and the JRE. It allows to run Cassandra without any effort.
Just download it http://www.hdeploy.org/download/ , run ```rpm -Uvh``` or ```dpkg -i``` on the package, and it's ready to go.

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

# What if... ?

## I don't wanna use this package, I want to use my own Cassandra!
Just do so. You tell your HDeploy or other to just use that. This package is just there for convenience - but since it's a totally standard you can use whatever as long as it's Apache Cassandra

## I wanna use another version than 3.7!
Well, at least for HDeploy, it's compatible with 2.2 (maybe even 2.1 - gotta check)

## I wanna use my own JDK
I'd say, just go for OS packages, it will be simpler. This packaging is for convenience, it doesn't really do much all

## I wanna use this for a cluster
- Choose an odd number of servers. Such as 3 or 5. 3 is usually good
- Do proper firewalling: either private networking - or if you're public good iptables/other rules. All servers must communicate with each other on ports
- Set replication to the number of servers you got
- Change the listen address / interface in cassandra.yaml (/opt/cassandra/conf/cassandra.yaml)
- Add seeds, all the IP addresses / names of the servers in the cluster in cassandra.yaml


Will write up more on this a bit later

For now this is really to get started with a Cassandra server on localhost that takes zero work.
