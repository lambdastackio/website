+++
title = "Rust AWS S3 SDK"
date = "2016-09-20T15:00:00+02:00"
tags = ["Ceph", "S3", "aws"]
categories = ["ceph", "s3"]
banner = "img/rust.svg"
author = "Chris Jones"
+++

The aws-sdk-rust library is officially released which allows both V2 and V4 API signatures. This is import for those that wish to use the SDK to access storage products that implement the S3 Interface such as Ceph's Rados Gateway (RGW). Ceph Hammer release only uses V2 while the Jewel and higher releases support V4.

Enterprise level proxy support has also been added. So, if http_proxy, https_proxy and no_proxy environment variables are in use, aws-sdk-rust will use them to access the S3 resource.

Aws-sdk-rust can be found on crates.io and https://github.com/lambdastackio/aws-sdk-rust.

Keep track of the crate. The library is under heavy development.
