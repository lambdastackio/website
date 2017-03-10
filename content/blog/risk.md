+++
title       = "CI/CD Risk"
date        = "2017-02-28T01:30:27-04:00"
tags        = [ "cicd", "infrastructure" ]
categories = ["cicd", "infrastructure"]
banner = "img/cicd/risk.jpg"
author = "Chris Jones"
+++

### CI/CD Risk

*Portions of this content are from Randy Bias @ cloudscaling.com under creative commons*

In the DevOps mythos or worldview, continuous delivery (“CD”) is considered one of the holy mantras. Unfortunately, many take CD to an extreme that is unwarranted and not even reflected in how the DevOps originators (e.g. Amazon, Google) operate. This is one of those situations where folks are extrapolating and providing an interpretation of DevOps that isn’t really accurate. The foundational problem is that all code update and delivery problems are treated equally, when they really aren’t equal. The reality of continuous integration (CI) and continuous delivery (CD) or “CI/CD” is that code deployment risk varies by application. Variance in risk means that there must be variance in testing and frequency of code deployments.

One reason this is true, for example, is that the CI/CD story of success requires several key items. First, that code changes are relatively small, reducing risk. Second, that code changes are frequent. Third, that one side effect of small and frequent is that issues can be fixed with a “roll forward” instead of a “roll back.” Meaning that if a mistake is made or a bug introduced, you simply turn the crank one more time and release an update. Or, for those of you who watched John Allspaw’s presentations on Flickr “Dev and Ops” methodologies in the early days of Velocity Conference (DevOps before the term was coined!), the ability to turn off troublesome features (“feature flags”) in real time (as opposed to a roll forward).

But what happens when your code deployment breaks everything and a roll forward is no longer possible? This issue is, unfortunately, glossed over by many. And that’s because much of the original thinking of a rapid CI/CD release pipeline was focused around websites and the application layer. It has largely ignored the infrastructure layer. Infrastructure is more sensitive to a catastrophic change because if the infrastructure fails, everything fails. In effect, the “blast radius” of infrastructure failures is significantly larger than that of application failures.

Lately I’m seeing more and more magical thinking that CI/CD can be applied equally to the infrastructure layer and it simply can’t. Let’s dig in further.

#### Background

In the early days of “DevOps”, before the term was really coined, the hotbed of activity was around small meet ups and the Velocity Conference. I remember at one of the early Velocity Conferences (probably 2008 or 2009) hanging out with many of the early folks in this space. We were fortunate to have some of the Amazon team there who shared in confidence about Amazon.com’s ATLAS system that was used to do “thousands of deployments per day.” These were the first glimpses into the pioneering tool work the web scale folks had done around “DevOps”. As most of you know, DevOps origins were about breaking down the “responsibility barrier” between developer and operators, which simultaneously required a re-think of the tools used to manage and deliver site updates.

Amazon’s ATLAS system put the deploy button in the hands of the developers. Pre-AWS services had been deployed inside of Amazon that allowed for developers to “order up” compute, storage, networking, messaging, and the like. Much of this work is what inspired Amazon Web Services (AWS) and also the tooling work developed around “DevOps” and rapid CI/CD release pipelines.

However, most of this work was done at the application layer and some of it at the platform layer. Very little of a rapid release was performed around the infrastructure layer itself.

Somehow, this work and the general sentiments of the DevOps community have erroneously performed a straight line extrapolation of how these techniques should be applied to the infrastructure layer. I see members of communities push for rapid release cycles of infrastructure code. Usually these folks have little history with running large infrastructure systems.

When we look at large-scale infrastructure, the story (even for the web scale folks) is one of stability and consistency, not constant change. There is simply a different risk profile for infrastructure. For example, AWS is notorious for running forked versions of Xen 3.x after they were deprecated. In fact, AWS rarely, if ever updates the Xen hypervisor due to the inherent risk.

#### Differing Risk Profiles

A web application and infrastructure systems have different risk profiles. If your application has a bug introduced that causes it to fail completely during an arbitrary update, you still have the ability to talk to the infrastructure. That means you can “roll forward” or reload your application onto the infrastructure from scratch in a worst case scenario. All of this is usually fully automated.

On the other hand, a failure of the core infrastructure, like storage or networking, could cause a catastrophic failure that would preclude reloading the system trivially. Yes, you could wipe the bare metal and reset if you have access to the metal, but you are talking about a significant amount of time to reset. Or, say for example, that you were using a software virtualization technique such as software-defined-networking (SDN) or software-defined-storage (SDS) for networking and storage. What happens if you bring your SDN system down hard and can no longer reach the control plane? Or if you introduce a software bug to your SDS that actively damages your datasets causing you to have to reload from backups or resynchronize from a secondary system - as in the case of distributed storage systems like Ceph.

Infrastructure simply has a different risk profile and requires you to be more careful, to do more active up front testing, and to be more certain about code updates.

#### Cloud Dependency Model

The following diagram highlights these differences.

<img src="/img/cicd/cloud-dependency-model.jpeg" style="max-width: 100%">

You have probably seen the traditional cloud pyramid at some point. When considering differences in risk it is best to understand dependency. All applications and services depend on infrastructure at some layer, whereas infrastructure (compute, storage, and network) have no dependency whatsoever on the apps that run on top of them. Catastrophic failures at lower levels will impact apps running above, usually many apps.

It’s also important to understand that part of what the web-scale cloud computing pioneers like Google and Amazon taught us is that infrastructure should be relatively homogeneous (“homologous”). Google can manage 10,000 physical servers with a single admin because they only have a handful of configurations. This persists across all cloud infrastructure. Typically the cost per unit, the variability of the configurations, and the cost to operate are all low.

Applications and services however are more costly to operate, the cost to develop them is higher as by definition they are bespoke, being written from scratch to drive critical business functions, and variability between different kinds of applications is high.

In other words, apps are only dependent on other apps, are closer to customers, are bespoke and highly heterogeneous, requiring regular rapid releases and roll-forward methodologies.

So when we think about these things we need to realize that because platforms and apps are dependent on infrastructure a high rate of change creates more risk. We do want to be able to update infrastructure faster than in the past, but hourly, daily, and even weekly changes introduce the possibility of catastrophic failures. More vetting is inherently required.

#### The Need for Speed

I get it. You want to go fast. Really fast. That means you want to update your infrastructure layer features more frequently. Frankly, you should be able to. This is a new age and the need for speed is an imperative for us all. If you are a carrier, telco, or cable operator you feel the need, in particular, to get rapid updates to your network infrastructure. You’re right, you shouldn’t have to wait to update your network once a year or once every two years. But asking to update your network every hour, every day, or every week is a recipe for significant downtime.

There is a sweet spot. Quarterly updates for major feature changes and monthly updates for security fixes will increase your overall velocity, while keeping risk to a tolerable minimum. Any faster and you’ll be bleeding customers.

#### A Busted Myth

It is sad to see the story of the rapid DevOps CI/CD pipeline extrapolated unnecessarily to the infrastructure layer. Companies, pundits, and DevOps leaders are possibly creating a climate that leads to greater downtime by taking this approach. It is not proven in production anywhere. Large scale infrastructure businesses with high uptime like Google and Amazon simply aren’t doing this and for good reason: the risk profile for infrastructure is different than the applications that run on top of that infrastructure.

They do however develop CI pipelines and secondary non-production systems that take regular infrastructure code updates so that they can do extensive testing before rolling out infrastructure code updates. It’s not uncommon for large infrastructure code updates to be tested for many months before being rolled out. The risk is simply too high that if something goes wrong there will be significant down time or data loss.

Calibrate your DevOps thinking to bring risk to the equation. CI/CD without risk assessment is foolhardy.

*You can see Randy's complete post at http://cloudscaling.com/blog/. Randy talks about how testing is done for Open Contrail in that post.*

*All content licensed under the <a href="https://creativecommons.org/licenses/by-sa/3.0/us/">Creative Commons Attribution-Share Alike 3.0 United States</a> License (CC BY-SA 3.0 US).*
