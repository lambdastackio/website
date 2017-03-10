+++
title = "SLA - Availability or Durability"
date = "2017-02-27T01:00:00+02:00"
tags = ["web", "S3", "api", "sla"]
categories = ["web", "s3", "sla"]
banner = "img/sla.jpg"
author = "Chris Jones"
+++

### SLA - Availability or Durability

I seem to be getting more questions lately like, "how many 9s is your object store?" or "how do you calculate 9s?". The questions need to be narrowed down since those are very broad. For example, when dealing with storage like an object store, there are two types of "9s". One for durability and one for availability. If you look at AWS S3, they put on their primary site 11 9s of durability which is very good. Deeper into site or FAQ you also find where they claim 4 9s of availability. Why such a difference and what does it mean?

#### SLA

The SLA (Service Level Agreement) is a promise/contract from the issuer to the customer that guarantees "X level" of service. You need to really dig into the SLA to make sure that you fully understand the SLA's definition of time. For example, without hesitation when you see a guarantee that says 11 9s or 4 9s you immediately think that everything will be available almost 100% of the time. This is usually not the case.

First, make sure you understand that when you see 11 9s it usually means something like durability and not availability (but it could). A smaller number of 9s is usually reflective of availability. The reason for this can be many; networking, system failure, power and even the nature of certain protocols.

The SLA itself may also define its availability time as 6 days a week instead of 7 or 20 hours a day instead of 24 which would mean the number of 9s would be higher and still allow for good bit of downtime.

#### Calculations

Availability:

> 4 nines –> (365×24) – .9999(365×24) = 8760 – 8759.124 = 0.876 hours = 52 minutes and 30 secs

OR - 20 hours per day for 6 days a week

> 4 nines –> (365-52)x20 – .9999((365-52)x20) = 6260 – 6259.374 = 37 minutes and 30 secs

In both examples there are 4 9s but the second one the SLA defines its time differently.

Bonus:

> 3 nines –> (365×24) – .999(365×24) = 8760 - 8751.24 = 8.76 hours = 8 hours and 45 minutes

*NB: Google Cloud Platform and Azure also have the same level of availability as AWS S3 - 99.99%*

#### Durability

When you see something like 11 9s of durability, it's usually calculated using a probability theory based on many factors such as replicas, distribution of objects in a cluster, multi-site replication, type of media etc. In AWS S3 they claim 11 9s and state the following in their <a href="https://aws.amazon.com/s3/faqs/#How_durable_is_Amazon_S3">FAQ</a>:

> Q: How durable is Amazon S3?

> Amazon S3 Standard and Standard - IA are designed to provide 99.999999999% durability of objects over a given year. This durability level corresponds to an average annual expected loss of 0.000000001% of objects. For example, if you store 10,000 objects with Amazon S3, you can on average expect to incur a loss of a single object once every 10,000,000 years. In addition, Amazon S3 is designed to sustain the concurrent loss of data in two facilities.

> As with any environments, the best practice is to have a backup and to put in place safeguards against malicious or accidental users errors. For S3 data, that best practice includes secure access permissions, Cross-Region Replication, versioning and a functioning, regularly tested backup.

I often hear some of my data science buddies get a little testy when I say, "durability determination is more of an art than science." What I mean by this is yes we use historical data and probability but we sometimes throw in a little juju <i class="fa fa-smile-o" aria-hidden="true"></i>. Read the durability claims in the SLA carefully.

#### Summary

Double check the SLA! In some SLAs I have seen where they never mention 9s but instead mention throughput as defined in any given 15 minute period. This of course is very vague and allows the SLA issuer to claim almost anything. This is common for internal teams in the Enterprise. Again, double check and get the issuer to explain it detail before agreeing to it.

*You can also simply cheat and look at: https://en.wikipedia.org/wiki/High_availability#Percentage_calculation*
