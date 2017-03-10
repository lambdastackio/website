+++
title = "Hyper-Converged Infrastructure (HCI) - Truth"
date = "2017-03-05T01:00:00+02:00"
tags = ["storage", "vm"]
categories = ["storage", "vm"]
banner = "img/hci.png"
author = "Chris Jones"
+++

## Hyper-Converged Infrastructure (HCI) - Truth

I happened to just stumble upon a few marketing oriented whitepapers from VMWare today (odd use of my time). All three were centered around Hyper-Converged Infrastructure (HCI). At Bloomberg, we run VMWare and OpenStack clusters. Our OpenStack clusters are currently fully Hyper-Converged. I have even given talks on them http://lambdastack.io/videos/openstack-austin/. If you look at the video and the presentation you will see why we no longer believe in this model for us.

We have many clusters and some are very large. Our compute and storage run on the same nodes in these clusters. We even went to a "POD" like system (three PODs per rack) to help us scale as seen in the presentation. When we first started out over four years ago, Hyper-Converged was not the buzzword it is today and it made sense at the time. However, today, it's a different story.

VMWare is seemingly pushing HCI as the greatest thing since sliced bread. They have even produced a whitepaper on how to better your career by embracing it. We have found that HCI only works for small clusters will a limited work load. Scaling an HCI is very complicated and costly. The storage portion is the part that really needs the most scale so scaling compute to fit the scale needs of storage can be a waste of resources.

If you charge your internal customers for compute resources and storage resources then an HCI can cause their cost to be very high even with oversubscription of compute. Last year we began the process of breaking out compute from storage so that we could scale them independently of each other.

After we began to split out our storage, we were able to pass along a dramatic drop in per TB charge to our internal customers which was not possible before. Storage and compute resource needs are different. We suspected we would see a drop in issues due to the reduced pressure on resources which we did. However, we were surprised at how much more healthy our nodes became due to this.

Vendors like to create buzzwords but I often wonder if they really actually eat their own dog food so to speak and operate things at massive scale or if everything is simply based on theory. I suspect the latter. In our experience, Hyper-Converged can work good enough at a small scale but it does not do well at scale. Vendors that are pushing it are just trying to survive in a changing world. Make sure it's right for you before investing.
