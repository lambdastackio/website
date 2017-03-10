+++
title       = "Erasure Coding vs Replica"
date        = "2017-02-26T11:27:27-04:00"
tags        = [ "Ceph", "erasure-coding" ]
categories = ["Ceph", "erasure-coding"]
banner = "img/erasure-coding.png"
author = "Chris Jones"
+++

#### Erasure Coding vs Replica

Ceph RadosGW (RGW), Ceph's S3 Object Store, supports both Replica and Erasure Coding. Most all examples of using RGW show replicas because that's the easiest to setup, manage and get your head around. Replicas simply means that a default of 3 means that RGW stores the original plus two more copies spread out within the cluster based on the Crush Map, Ceph's way of calculating where to store objects.

Erasure coding is a form of durability calculations that allows you to maintain the same or better durability as replicas but at a much better density model. Meaning, if I have three full racks of storage using the default replicas and I have set the crush map up to keep each replica on a different rack then I really only have one full rack of actual storage since the other two are used for durability. With an erasure code of `8/3` I will have approximately 1.5 racks of actual storage which is much better. However, erasure coding comes with a cost.

In the scenario of `8/3` previously mentioned, it means that I have 8 data chunks plus 3 parity chunks for a total of 11 chunks. These chunks are then spread out over the cluster using a different crush map rule that basically says 'put each object on a different node and spread them between different racks and nodes as evenly as possible'. This means that you can lose 3 objects before you would lose any data. Which also means it takes at least 8 objects to form the complete object. Different size clusters and different durability factors will dictate what `k/m (data/parity)` value your decide on for you cluster.

Earlier, I mentioned that erasure coding comes at a cost. The cost is taxed on each GET (read) and PUT (write). It takes time to calculate the parity on the PUT and time to assemble the objects on the GET. Since RGW is a guarantee `read-after-write`, the response for a PUT does not come back until the original object's parity is calculated, split and placed on different nodes (depending on crush map rules). The GET assembles the objects back together and then responds.

Based on my tests with my multi-petabyte clusters, I have calculated approximately a little less than 20% on 2MB PUTs as compared with the same object using replicas (mileage will vary based on drive types, CPU, network, etc). The GETs were not as bad. So, if you need every ounce of performance you can get then use replicas. If you want to put as much data into the same raw density then use erasure coding. You can also test different size `k/m` values to gauge the overall impact on your cluster (you will have to wipe the data if you change the `k/m` values).

I have been asked so often about calculating data/parity combinations that I have put together a free erasure coding k/m value calculator in Excel. I have included it in the `chef-bcs` Chef repo at https://github.com/bloomberg/chef-bcs/tree/master/cookbooks/chef-bcs/files/default/utilities. You can download just the spreadsheet and play with the numbers or fork the repo and automatically build Ceph clusters. Enjoy!

<a href="https://github.com/bloomberg/chef-bcs/tree/master/cookbooks/chef-bcs/files/default/utilities"><img src="/img/erasure-coding.png" style="max-width: 100%"></a>
