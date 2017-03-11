+++
title = "AWS S3 vs On-Premises"
date = "2017-03-09T20:00:00+02:00"
tags = ["storage", "s3", "aws", "ceph"]
categories = ["storage", "s3", "aws", "ceph"]
banner = "img/aws-s3-worksheet.png"
author = "Chris Jones"
+++

## AWS S3 vs On-Premises

When you own Enterprise Storage or are asked to build enterprise class storage you find yourself more frequently having to cost justify against outside Cloud Storage vendors like AWS S3, GCE or Azure. So, how will you do that since you have to make capital expenditures vs OpEx that these providers discuss so much?

When you break down the pricing of AWS S3 and others you find that the actual storage cost is not too bad (depending on amount of stored data). What you don't realize is the network transfer rate is where they get you. I have heard stories of small firms having bet pools going just to see who is closer at guessing a given days AWS cost. The same can be said for enterprises but the stakes are much higher!

#### Sidebar

I like AWS, Azure and Google. They serve a good purpose of helping you get started on projects at a low entry cost and the "pay-as-you-go" model is very compelling. This model changes over time for some enterprises especially when it comes to storage. I just recently had a Senior level "Amazonian" (that's what they call themselves) say "AWS is the world largest startup and that's how we operate." That sounds kinda cool but when I pressed him on enterprise like questions, his story fell flat. AWS seems to believe everything should run in a public cloud but that's just not wise (in a general sense - some enterprises can't allow their data outside their datacenters for many reasons).  Azure actually understands this and has "on-premises" versions of some of their offerings. They seem to have more of an understanding of the enterprise than the others.

Again, I like AWS. I wrote the Rust AWS-SDK-RUST SDK and other S3 tools. I'm simply making honest comparisons of cloud providers for enterprises. I have also used Google on past contracts and they are very good but I don't have an enterprise reference to compare against.

*Also, don't get confused by AWS' "manage your on-premises via AWS." It's only their console that you can plug some data into and not a true on-premises solution.*

#### How to cost justify

Back from my sidebar. How do we cost justify on-premises S3 and compare it to AWS S3? The first thing is **DO NOT** use a tradition enterprise storage vendor - you gain nothing. You need a solid open source solution using COTS (Common Off The Shelf) hardware such as Ceph on any hardware platform that meets your budget and minimum requirements to run a good S3 Object Store.

Cost Example (deep storage): (NB: These are conservative costs. You will need to plug in your costs. This also assumes you use all of the storage and most of data is machine generated as in Big Data. Also, no operating labor cost is factored in since that is so variable [see summary].)

>Single datacenter. Data is very durable with Erasure Coding.

>5 Racks ($300K each) - $1,500,000 (assumes your own datacenters with power/cooling - cost factors in ~10 spare storage nodes and additional 10TB HDD for replacements). Also these figures are high so your real figures should be a good bit less depending on your hardware vendor and even lower if you don't have to use outside vendors and contractors.

>Includes racks, high-density storage, network spines, 20Gbs NICs, TORs, software load-balancers (HAProxy), install labor, spares, etc

>Ceph S3, Erasure Coding 8/3 (11 shards - <a href="http://lambdastack.io/blog/2017/02/26/erasure-coding/">see other article on EC calculations</a>) - tuned for larger objects

>10TB HDD x 204 (drives per rack) x 5 (racks) = 10.2PB raw storage / 1.375 (EC factor - see EC article) = 7,418TB (7.4PB) usable. Using EC instead of replica for better storage utilization. ~3% write overhead and ~1.2% read overhead for EC as compared to replicas. The big penalty will come on a rebuild of an object if required due to data failure etc.

>$1,500,000 (total cost) / 7,418TB (usable) = $202.21 per TB (internally price this one-time, annually or however you like. This example will be one-time (1 year) divided into monthly)

>Operational costs (power/cooling/space density) are standardize (PUE). A normal rack uses less than ~5kW on average and I will use $.10 kW/h cost (change to your areas average): 8,760 (annual hours) * $.10 * 5 = $4,104.06 * 5 (racks) = $20,520.30 (annual) / 7,418TB (usable) = $2.77TB for OpEx (annual)

>**$202.21 + $2.77 = $204.98TB (first year). $2.77TB annual after first year plus operational labor**

>NB: If you use commercial hardware load-balancers then your cost will increase. These do not usually gain you performance over HAProxy in this scenario. However, you can always add them and repurpose the HAProxy nodes included above.

>Network traffic - ~20Gbs (.0025TBps) sustained (give or take) split with 70/30 read/write (change based on your assumptions but these values are used for standard benchmarking). Since a high-speed network is part of a normal enterprise (large), there are no additional costs for network usage in this scenario beyond purchasing additional spines which are factored into the cost. (Internal only)

AWS S3 (published pricing):

>Store 7,418TB to be equal with above

>Replication with datacenter (standard). Replication to other regions will cost more.

>Transfer In <a href="https://aws.amazon.com/snowmobile/">(Would take a "snowmobile" - Big semi-tractor and trailer rigs)</a>. This scenario doesn't even cover that cost but it's expensive and takes a long time.

>Transfer Out - 70TB monthly (this is only a fraction [2.33TB] per day of the on-premises example above) - Transfer out applies to everything including EC2, Direct Connect etc.

>Direct Connect - Would need 2 LAG 10Gbs circuits plus additional equipment to sustain internal rate above. The cost is not reported here and much higher (setup, monthly and long-term contract)!

>**$176,110.98 (monthly) * 12 = $2,113,331.76 (annual) / 7,418TB = $284.89TB (annual) PLUS costs not reported!!**

<img src="/img/aws-s3-worksheet.png" style="max-width: 100%">
**AWS online worksheet - https://calculator.s3.amazonaws.com/index.html**

<img src="/img/aws-s3-detail.png" style="max-width: 100%">
**AWS detail**

#### Summary

If you are a startup and only using a small amount of storage then you can easily cost justify using a public cloud provider. However, if you are an enterprise and own datacenters then it's far better from a cost stand point to build your own S3 on-premises and maintain control (even with added operational labor costs). The above scenario takes into consideration only one datacenter for the on-premises so the cost look very good for it even starting in the first year. However, if you factor in a second datacenter, just double the cost to keep it easy, then you see that year one (only) is better (from a cash outlay) for AWS S3 (w/o high transfer rate and Direct Connect costs).

Second datacenter factored in for on-premises:

>$3,000,000 for 2 datacenters with ~10 spare servers and drives per datacenter.

>$204.98TB x 2 = $409.96TB (annual) or $409.96TB / 3 (3 years) = $136.65TB annually over 3 year period.

>Factor in replication costs of AWS S3 to other regions if comparing with multiple datacenters of on-premises.

---
GCE (Update):

>Taken from Google Cloud Platform calculator website showing difference in GCE and AWS for 10PB single region (single site). Notice how high both are with AWS being the highest.
<img src="/img/gce.png" style="max-width: 100%">

---

Using the above cost figures, the AWS S3 cost will remain annual while the on-premises' cost go down annually due to many factors but mainly due to shelf life of 3-5yrs of equipment. Of course, there will be the annual OpEx costs mentioned plus drive and server replacement costs (some were already factored into the initial cost). The on-premises version also does not include operational labor costs (important). However, the labor cost would most likely only get you closer on year one using the single datacenter scenario.

The point is, there are many ways to approach the cost points. If you have a lot of data and it continues to grow at an exponential rate and you continue to find more ways to process (analyze) the data then your transfer out of storage rates will increase (same transfer costs apply to EC2 and Direct Connect) and thus your real cost of AWS S3. This can also be applied to AWS Glacier as well.

Again, AWS S3 is great but it is more expensive than you think when you have a lot of data and need access to it frequently. But if you're a small shop or just want someone else to manage things for you, it's a good option. Just don't assume it's cheaper because it's not especially when you get into PB range which is now becoming a norm.

---

*Tested S3 from EC2 large in us-east-1 (same) region using JMeter and used same EC2 JMeter tests against Ceph in DMZ (owned datacenter - not close to region) and Ceph won in performance in most tests. Was not testing for performances between the two but was testing to establish a base line. Results were very surprising! Take away - do a lot of tests because results can be counter intuitive.*
