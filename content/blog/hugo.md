+++
title = "Hugo vs WordPress"
date = "2017-02-01T13:00:20+02:00"
tags = ["msic"]
categories = ["misc"]
banner = "img/hugo.png"
author = "Chris Jones"
+++

### `Hugo` vs `WordPress`

We all know that `WordPress` is a Content Management System (CMS). For years, people have been using WordPress to help them manage their content and for the most part it works - sort of. WordPress is a very old tech code base. It's written in PHP (who uses that anymore?) using Apache/NGINX and it uses MySQL as it SQL backend. None of those are bad on their own (except PHP) but the way that WordPress is organized and Architected makes it very prone to scalability issues and it's an anti-pattern of `Microservices`.

This site was originally a WordPress site and used a different domain name. I even tried Wordpress.com but you're not allowed to upload your own custom templates which seems odd to me. I even tried other blogging sites like `Medium` and `Blogger` but being a developer and architect, I wanted more freedom. Like all good developers, I went back to my original idea. I looked at hosting on BlueHost and others but I began to have a reaction when I had to pay a lot for hosting - no tech is easier to architect and manage than web servers.

So, I had the idea that I would build-out an AWS EC2 environment and use Elastic Load Balancers to front the EC2 instances. I took the generic CloudFormation template and modified it to fit my needs. When executed, it built the EC2 instances, setup the ELB, setup RDS and had my hosting environment setup in no time using my custom WordPress template. BTW, I was using Amazon Linux AMIs. The code base is located <a href="https://github.com/lambdastackio/wordpress">here</a>.

For some reason, I had in my mind that my costs would be almost nothing - my traffic was good but not excessive. My first AWS bill was over __$70__. When I drilled down into the invoice I noticed my instance types were too high, my RDS was too much etc. I changed the types down to micro level on everything I could. This lowered the next bill down to a little more than __$50__. I also had an instance go south on me and I had to manage the site which I did not want to do. I started thinking that I should have just paid a hosting company to deal with the goofy issues associated with WordPress. I was about to move to a hosting company when I ran across <a href="https://gohugo.io/">`Hugo`</a>, a static website generator built in GO.

I installed <a href="https://gohugo.io/">Hugo</a> and played around with it and thought it was super simple to use but it was a static site generator and not a CMS. What if I wanted to use my iPad or iPhone to write posts while traveling? Was that feature worth $50+ a month? The answer was obvious - nope!

It took me a few days to figure out the templates and how to override the parts I wanted to customized. Once I saw how fast and simple it was to customized I began to really enjoy it. After a week or so I actually enjoyed working with it (I never said that about WordPress).

Today this site uses Hugo to generate the site based on `Markdown` and I simply use a custom domain `lambdastack.io` on `Github` and post the code to the `docs` folder. The code for the site can be found <a href="https://github.com/lambdastackio/website">here</a>.

Hugo and Github hosting work very well and everything is version controlled. It's so simple to change and add things. The only odd things I have seen has been `Github` related. If you have a good bit of traffic then push to AWS S3 and use Cloud Front. BTW, I no longer use the WordPress HA platform I built on AWS - **Github is free!**

*Update: We use Github Enterprise at work but it does not allow for custom domains so I had to add a deployment pipeline hooked to github push which then pushes the docs site to all of my HA Web Servers*
