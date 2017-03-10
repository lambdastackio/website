+++
title = "Load Balancers"
date = "2016-10-15T13:00:20+02:00"
tags = ["performance"]
categories = ["misc", "networking", "performance"]
banner = "img/load-balancer.png"
author = "Chris Jones"
+++

### Load Balancers - HAProxy vs Other

Load Balancers are very import tools for scalability, depending on the protocol. For HTTP(S), load balancers are a must unless you're good with having only one web server exposed. Recently, I was asked to do performance tests of our HAProxy servers that front our Ceph RGW (S3) nodes and do the same for a very popular hardware load balancer.

*The name of the hardware load balancer vendors will not be released to protect the innocent - ME :)*

Confession - Many years ago I believed that hardware load balancers must be faster than software load balancers because in theory they are tuned to specific hardware and that hardware **must** be specially design for the given task. That's almost embarrassing when I say it out loud because that in no way is accurate!

I wrote the Chef Cookbook called `Ceph-Chef` that I also manage at the <a href="https://github.com/ceph/ceph-chef">Ceph repo</a>. I also created the Chef-BCS project at https://github.com/bloomberg/chef-bcs that uses the Ceph-Chef cookbook to install and manage Ceph as a very large Object Store. At the time, I did not have dedicated hardware load balancers at my disposal so I had to build out `HAProxy` with `KeepAliveD` using `Bird` for BGP to advertise the IPs the network spines. I ran the HAProxy nodes in an Active-Passive mode using bonded 10Gb NICs (what I had available to me).

*This configuration is available in the Chef-BCS project and I ran it for a long time in a very large Object Store cluster.*

After tuning HAProxy and the vendor supported hardware load balancers (vendor tuned those), I began testing 2MB PUTs and random byte-range request GETs. I launched <a href="https://github.com/lambdastackio/s3lsio">`s3lsio` benchmarking</a> from many VMs along with running from actual bare-metal servers. I needed to generate enough sustained traffic to fill the two bonded 10Gb pipes of the HAProxy load balancer (the hardware load balancer had 4X more potential throughput).

I was surprised to see how much the vendor needed to tune the hardware load balancers to even get close to the performance of the HAProxy load balancers. I'm not able to share specifics but there were only a few tests where the hardware load balancers met or slightly out performed HAProxy. Almost all tests showed HAProxy out performing.

In summary, I know that I could have gotten even more performance out of HAProxy had I taken the time to tune it more and tuned the hardware it ran on. In future projects I may do just that.
