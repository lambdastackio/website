+++
title = "Building Large Ceph Clusters"
date = "2016-10-01T13:00:20+02:00"
tags = ["Ceph", "S3", "Block Storage", "Chef"]
categories = ["ceph", "chef"]
banner = "img/cluster.png"
author = "Chris Jones"
+++

Ceph is a very complex distributed storage system that provides an Object Store, Block Storage Devices and Distributed File System. It has a built-in installation program called Ceph-Deploy but it's design is for very simple and small installations. There are two official automated installation and maintenance systems for Ceph, Ceph-Ansible and Ceph-Chef. As the name implies, Ceph-Ansible is built for the Ansible while Ceph-Chef is built for Chef. I will focus on Ceph-Chef for the Chef environment.

Ceph-Chef is managed in the Ceph github repo and it's a Chef cookbook that allows for a lot flexibility. Since Ceph-Chef is a cookbook it relies on a larger Chef repo project that you would create and customized for your environment. A great example Chef project that uses Ceph-Chef can be found at Bloomberg's github repo called Chef-BCS. Chef-BCS is what powers the large Ceph installations at Bloomberg.

The recommend way to get started using both Ceph-Chef and Chef-BCS is to clone Chef-BCS on github.com. Once you have forked it then clone it to your local environment (i.e., an OSX or Linux based environment - have not tested Windows based environment). To just kick the tires so to speak, make sure VirtualBox and Vagrant are installed.

Once the dependencies are installed; inside the root of the cloned project you can find a `build_dev.sh` script (if not present then simply change to the /<your cloned root>/bootstrap/vms/vagrant directory and enter ./CEPH_UP.sh). It will simply launch the default VirtualBox install of Ceph which consists of four VMs (1 - Bootstrap VM and 3 - Ceph VMs). The script also changes the directory to /<your cloned root>/bootstrap/vms/vagrant. Inside that directory you can see Ceph running on each Ceph VM with 'vagrant ssh ceph-vm1' (change vm1 to vm2 or vm3 to see each Ceph VM).

Now that you have a default Ceph Object Store VM cluster running locally, you can change ceph.conf settings and restart the processes to inspect the changes before building your real cluster. There will be more how-to articles coming soon.
