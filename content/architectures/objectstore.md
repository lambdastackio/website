+++
title = "Ceph Object Store for Development"
date = "2017-01-01T13:00:20+02:00"
tags = ["Ceph", "S3", "architectures"]
categories = ["ceph", "architectures"]
banner = "img/ObjectStoreRefArch.svg"
author = "Hans Chris Jones"
+++

<a href="http://ceph.com">Ceph.com</a> talks about several Reference Architectures. The default Reference Architecture defined in <a href="https://github.com/bloomberg/chef-bcs">Chef-BCS</a> shows how to build out a Ceph Object Store similar to the one we built at Bloomberg. The default Vagrant/VirtualBox version represents the following:

> 3 RGW (Radosgw - S3) Nodes

> 3 Ceph Mon Nodes

> 3 Ceph OSD Nodes

> 2 HAProxy Nodes (can use Bootstrap as a failover)

> 1 Bootstrap Node

The bootstrap node is used as a centralize launchpad so to speak where the Chef Server, Cobbler, ISO Linux Images, etc are installed and maintained. The bootstrap node is built first and it drives the building of all of the other nodes in the Ceph cluster. The bootstrap can also be used for other things as well if needed.

<a href="/img/ObjectStoreRefArch.svg"><img src="/img/ObjectStoreRefArch.svg" height="50%" width="50%"></a>
