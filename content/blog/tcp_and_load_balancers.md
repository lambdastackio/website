+++
title = "TCP and Load Balancers"
date = "2017-01-20T11:54:20+02:00"
tags = ["TCP", "Networking", "Load Balancers", "S3"]
categories = ["networking", "load balancers", "s3"]
banner = "img/load-balancer.png"
author = "Chris Jones"
+++

#### Why do I get a `TCP RST` return when I try to PUT or GET S3 objects?

I have a colleague that has made the following statement:

    "The data is sacred but, the requests are not!"

This holds very true when dealing with HTTP calls such as S3 GETs and PUTs.

Recently, we noticed that a client was doing a massive amounts of PUTs and then issuing corresponding GETs on the same S3 objects. In our case, our S3 is from Ceph's RGW S3 and we have a number of load balancers in front of all of the RGW servers. The client had "rolled" their own S3 Python SDK instead of using AWS' official Python SDK. In doing so, they had not factored in best practices of exponential backoffs (retries).

When running similar tests against the RGW cluster directly (no load balancers), we were never able to replicate which pointed to the network or the load balancers or both. We had tested this on both commercial and open source load balancers.

TCP RST return values are usually associated with some sort of "man-in-the-middle" process such as load balancers, proxies or traffic sniffers. In our case, load balancers. By default, we disabled `no linger` features which in theory would imply that the load balancers were not holding on to connections from the clients. We also had very low timeouts set as default.

After spending days testing and letting our tests run for 24 hour periods we found that on the open source version if you specify `no linger` explicitly the issue goes away or dramatically reduces to just noise. For the commercial load balancers we upped the timeouts to 40s which addressed the issue.

In our case, the client did not want to enable retries in their code due to their own reasons. However, for those clients that had used best practices of exponential backoffs, they never saw an issue to begin with. By combining reasonable timeouts and lingering on your load balancers along with educating clients to code in retries, managing your S3 on-premise cluster becomes a lot easier.  
