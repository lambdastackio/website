+++
title = "S3LSIO - S3 Utility"
date = "2016-10-05T15:00:00+02:00"
tags = ["Ceph", "S3", "aws"]
categories = ["ceph", "s3"]
banner = "img/s3-large.png"
author = "Chris Jones"
+++

The initial release of s3lsio has been released for both MacOSX and Linux (RHEL/Fedora/CentOS). Ubuntu will be released soon. In theory Windows should work but OpenSSL can cause initial setup of the Rust build environment for s3lsio.

There are constant enhancements being made on a weekly basis. S3lsio is a command line tool that can work within a script, called from an app or ran stand alone to easily manipulate your AWS S3 and Ceph Rados Gateway (S3) environments. In addition to plain output you can specify JSON, pretty-json, serialize or quiet mode (only return codes are output) . Pretty-json is the default.

Credentials:

AWS supports a credentials file in the home directory of a given user such as:
~/.aws/credentials

This file is a standard INI file format. So, if you don't want to enter your credentials via the command line then you can place them in the aws credentials file.

API Signatures:

By default AWS uses API Signature V4 however, Ceph (Hammer and below) uses V2 but Ceph (Jewel and higher) supports V4. S3lsio supports both. The default signature is V4 for S3lsio. You can change that by passing in -s V2 or setting 'signature=V2' in the config file.

Proxies:

S3lsio supports proxies in 3 ways: 1. Pass in -p <whatever your proxy url:port>, 2. Add to config file, 3. Set http_proxy, https_proxy and no_proxy environment variables. By default proxies are not used.

Example to create an S3 bucket:

./s3lsio bucket create mynewbucket

You can download and more instructions here: http://www.lambdastack.io/s3lsio
