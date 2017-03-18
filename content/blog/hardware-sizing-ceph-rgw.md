+++
title = "Hardware Sizing - Ceph Radosgw (RGW)"
date = "2017-03-18T01:00:00+02:00"
tags = ["storage", "ceph", "hardware"]
categories = ["storage", "ceph", "hardware"]
banner = "img/ceph-github.png"
author = "Chris Jones"
+++

## Hardware Sizing - Ceph Radosgw (RGW)

I'm often asked, "what's the best hardware to use for Ceph?" The answer is simple - it depends. With Ceph there are many moving parts such as:

>Ceph Monitor Nodes

>Ceph RGW Nodes

>Ceph Mgr Nodes

>Ceph OSD Nodes

>Ceph MDS Nodes

In addition to those nodes you may also have software or hardware load-balancers in front of your RGW nodes. This discussion is centered around RGW nodes only. Other articles will detail out the specifics for the other nodes.

RGW nodes are known as a client to RADOS, core of Ceph itself. Since it's a client it means it's not required unless you want an S3 or Swift Object Store interface. By default Ceph is setup to use a "private" and "public" network interface to communicate between itself. The OSD nodes utilize both interfaces with the OSD-to-OSD communication being done over the "private" network interface and "client" interfacing being done over the "public" interface. This means that all "clients" (like RGW) only use the "public" interface and not the "private" interface.

>You have the option on OSD nodes to use separate network interfaces for "public" and "private" or a single larger aggregate network interface where you run both types of traffic over a single interface. Your option.

After running RGW nodes on small and large clusters in both dedicated (storage only) and Hyper-Converged with OpenStack and Ceph on the same nodes, I have seen that RGW itself (on a per instance basis) is more of a limitation than the hardware. For example, I had one configuration with 256GB RAM with two 10Gbps NICs bonded in mode 4 (aggregate) and running multiple RGW instances answering on different ports. After tracking the throughput of the network bond (bonds are not my preferred way but that's what I had) and increasing Civetweb threads along with RGW thread pools and rados handles, I found that my bottle neck was RGW and not the hardware. Using CollectD metrics I found that the CPUs (24) ran mostly around 94% idle, memory percent used was not high and network traffic would top at around 6-8Gbps sustained (full duplex). I would also see thread counts as high 32K per instance. For the record, no logging on RGW and I started with a single RGW instance and ended up with four instances on different ports.

I'm still testing different configurations but when it comes to sizing RGW nodes, the following is a good guideline:

>1U size

>1 10Gb NIC (minimum) for small-medium traffic and cluster size - Jumbo frames

>1 20Gb NIC (minimum) for larger cluster size and higher traffic - Jumbo frames

>64-128GB RAM will be more than enough for most clusters

>Dual OS small SSDs in RAID 1 

In the configuration that I mentioned earlier, you can even run extra Ceph Monitor processes on those same nodes and still have plenty of idle capacity.

### Summary

Ceph RGW itself is the real bottle neck on throughput and not the hardware you choose. There is a sweet spot of finding the right mix of civetweb threads, RGW thread pool and other settings which require a lot of trial and error with your hardware and network configuration. You can run multiple instances of RGW using different ports (just have to have a section in the ceph.conf for each instance name along with the corresponding keyring - take a look at https://github.com/bloomberg/chef-bcs for how to setup and run large clusters) but you need a good load-balancer in front of them (HAProxy or commercial).
