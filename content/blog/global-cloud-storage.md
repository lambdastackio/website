+++
title = "Global Cloud Storage"
date = "2017-03-01T01:00:00+02:00"
tags = ["s3", "storage", "azure", "gce"]
categories = ["s3", "storage", "azure", "gce"]
banner = "img/global_cloud_storage.svg"
author = "Chris Jones"
+++

## Global Cloud Storage

Everything fails! No matter how great the architecture, things can fail due to many factors including human, power, fiber cuts, etc. We even have failures in our own datacenters. The point is you need to plan on failure as part of your architecture.

Yesterday, AWS S3 us-east-1 had an issue which caused rippling affects across the Internet including AWS' on status page that depends on S3. All cloud providers have failed and will fail again - it's just a fact. The question is what are you going to do about it?

It doesn't matter if you're a startup or large enterprise, you need to have multiple cloud storage providers. Netflix learned this lesson a long time ago. AWS S3 is the defacto standard for Cloud Storage APIs. Most cloud providers support the S3 interface so if your app uses the S3 API for interfacing with your object storage then you should be able to implement a multi-cloud solution.

> NB: There are multiple ways to do this and the drawing is **only** one way

#### Determine who supports S3

You will need to determine which providers support the S3 API. A number of other cloud providers do. I would recommend using AWS S3 as the Primary Object Store when using a public cloud. It's the original and most battle tested - not to mention every tool support the S3 API.

#### Mirror bucket names

Bucket names for AWS S3 are a global resource. Meaning, if you want to have a bucket called `mybucket` and someone else has already taken the name then you're out of luck. Thats why most people for website objects will do something like `www.mydomain.com` as a bucket name because it unlikely that someone is using that bucket name.

#### Replicate objects to all providers

You will want to replicate your S3 objects to other providers whenever you push to AWS S3. You can do this in your code if your app does it or use a 3rd party tool to do it. `S3lsio`, a very fast tool that I created and will soon do just that. Google has a cli tool called `gsutil` which allows you to rsync your S3 to GCE (rsync is a replication tool in the Linux world). I would suspect Azure has something similar.

#### (Option 1) Global DNS

If you're able to cleanly mirror your bucket and objects and your provider supports the S3 API interface then you can create a custom domain and have it managed by a DNS provider that can support failovers. There are several that can do it. This drawing supports this option.

<img src="/img/global_cloud_storage.svg" style="max-width: 100%">

#### (Option 2) Customer Request Router

This one requires a little more experience. This requires a small microservice app that returns the correct URL based a policy via an HTTP 302 redirect which cause the browser (assuming browser) to try the new URL your request router just returned. The new URL can even be rewritten to support the format of the secondary cloud storage provider if needed.

#### (Option 3) Global Load Balancing via CDN

CDNs (Content Delivery Network) were created to solve these types of scenarios. However, CDNs can be costly so you need to be aware of that. Even AWS Cloud Front can be used in this case (mostly like not impacted by a storage issue on S3)

#### Other Options

Yes, there are still other ways to solve this. You need to think about your use cases and design around them. However, make sure to do your own due diligence! Vendor marketing materials are 100% buzzword compliant and they may not help any.

#### Test failover

Now that you have architected the best way for your use cases, it's time to test. Everything must be tested and re-tested. The simplest way to test is to verify that you can access each provider endpoint for the same object. Next, login to your S3 console and temporarily disable your bucket and then try your test app or test website. Do the same thing for the other cloud providers until only one is `live` (keep the other provider buckets disabled for the test). Do not do this on a production system until fully baked.
