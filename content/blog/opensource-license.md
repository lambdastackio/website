+++
title = "Which open source software license should I use?"
date = "2017-02-23T06:00:00+02:00"
tags = ["opensource", "license"]
categories = ["opensource", "license"]
banner = "img/oss-license.png"
author = "Chris Jones"
+++

*NB: This article is from Opensource.com. I also use Apache 2 for my projects.*

I’ve recently been involved in several discussions that are variations on, "Which open source or free software license should I choose for my project?" Here is my way of looking at the large and growing collection of licenses in the wild. First, let's make sure we all understand that I Am Not A Lawyer. This is not legal advice. Depending upon your needs and your comfort with risk around your software, you'll want to confirm your legal choices with counsel in your jurisdiction.

The first and obvious consideration is whether or not the license is approved as an open source license by the Open Source Initiative (OSI). The OSI created the Open Source Definition in the late 1990s as a set of attributes that a software license must support to be considered "open source." Anyone can take a license to the OSI for debate and discussion and if approved as meeting the OSD, then the license is added to the canonical list.

While this seems an obvious place to start, I was recently surprised to discover a license called the "Clear BSD License." It attempts to clarify explicitly that patents are not being discussed in the license. It is not on the OSI list (while the New BSD and Simplified BSD licenses are) and is therefore not worth considering. Inventing new licenses as small derivatives of existing licenses is not helpful and creates costly legal busy work. There exists a broad collection of OSI-approved licenses today. These licenses cover millions of lines of software involved in billions of dollars in procurement. One would be hard pressed to describe a serious set of circumstances that isn’t already covered by an OSI-approved license.

There are several big levers available when considering an open source license:

* How much license reciprocity is required with respect to the software, modifications, and any derivatives someone develops?

* What is said about patent licensing and litigation?

* What legal jurisdiction covers the license?

The reciprocity issue is all about <a href="http://www.gnu.org/copyleft/">"copyleft"</a> and whether or not using the software source code attaches the license to the modifications and derivatives, and whether the source code to those modifications and derivatives needs to be published.

On one end of the spectrum are licenses that have no copyleft requirements. These licenses essentially allow anyone to use the software in anyway without requiring much more than maintaining copyrights. Licenses that fall into this set include the New and Simplified BSD licenses, the MIT license, and the Apache 2.0 and Microsoft Permissive licenses.

There are a set of licenses that maintain a sense of copyleft around the software itself but support the use of the software in larger works of software which may contain software that is licensed differently (e.g. closed and proprietary). These licenses include the Eclipse Public License, the newer Mozilla Public License 2.0, and the Microsoft Reciprocal License.

On the other end of the copyleft spectrum are strong copyleft licenses. <a href="http://www.gnu.org/philosophy/free-sw.html">Software freedom</a> is defined by the Free Software Foundation in terms of the freedoms a user of software must have. Strong copyleft supports software freedom. Many developers support software freedom, and demonstrate this support using one of the family of GPL licenses (GPL2.0, GPL3.0, and the Affero GPL3.0) as a way to ensure the strongest copyleft and strongest license attachment when the software in question is used in building and distributing other software.

Software patents weren’t really an issue when software was beginning to be widely shared on the early Internet and so weren’t mentioned in the early licenses. By the late 1990s, software patents were on the rise and corporate legal teams were becoming more involved in the writing of open source licenses as they became more involved with open source software and developing the open source foundations around evolving projects. The Apache 2.0 License, Mozilla Public License 2.0, Eclipse Public License, the newer GPL licenses, and both Microsoft licenses reflect this shift in language. Each license explicitly talks about patent licenses. Each license has language that covers patent litigation to varying degrees.

I mention legal jurisdiction in the big levers category because some licenses explicitly mention it and this can be a real show stopper for some people. For that reason alone I treat it as a Big Lever. (The Mozilla Public License 2.0 specifically tries to deal with jurisdiction as one of changes from the original MPL, as that was often a criticism of the earlier license.)

Other considerations in license choice include:

* Are there project specific affinities?

* History of the license and foundation/corporate/commercial involvement?

The "language" projects (Perl, PHP, Python) each have their own licenses (Artistic License 2.0, PHP License 3.0, and Python License 2.0 respectively). If you are working on a project that closely ties to a specific open source programming language community then you should obviously consider that community’s license as the question of mixing modules and dependencies will be simplified with respect to open source licenses.

As software IP law has evolved and the Internet has become an enormous space for people to collaborate on software development, commercial organizations became involved. We have seen the creation of open source software foundations with specific licenses associated with them. Corporate legal teams have become involved in authoring open source licenses, and the language and structure of these licenses (e.g. terminology and definitions) reflect this involvement. Lawyers without a lot of experience in open source licenses may feel more comfortable reviewing these newer licenses.

So to recap, presuming that your primary motivation is to co-develop and collaborate on an open source project, in my way of looking at open source licenses your choices break down roughly as follows. (I'm keeping the discussion here to widely used licenses and/or licenses where large commercial organizations with conservative counsel or neutral non-profit open source foundations had a hand in their creation.)

If you want to allow anyone to do anything at any time with the software, use the MIT or new (3-clause) BSD license, i.e. no copyleft and no discussion of patents. Both of these licenses came from the academic world, and both from a period of time where software patents were not a focus.

If you want to allow anyone to do anything with the software (so no copyleft), but feel something needs to be said about patents and license termination in the face of litigation, and/or you want a license that corporate counsel is more comfortable reading then look at either the Apache 2.0 license or possibly the Microsoft Permissive License. These licenses were written to continue to encourage a completely open sharing environment but were written with a more corporate view (note the structure and language), and both begin to cover patents with varying (and subtly different) degrees of patent retaliation built into them.

If you feel others should be able to build [possibly product] around your software, but want to ensure changes to the core software project itself remain open source (i.e. the changes must be published), you likely want to look to either the Eclipse Public License, the newer Mozilla Public License 2.0, or the Microsoft Reciprocal License. These are modern licenses developed from commercial/corporate perspectives supporting "weak" copyleft. [N.B. The EPL does name NY State as the jurisdiction.] Pay attention to patent statements in each.

If you are a firm supporter of software freedom or want to ensure that if your software source is used anywhere that the resulting derivatives are maximally published as open source ensuring software freedom, then you should look to GPL2.0 or GPL3.0 depending upon your needs.

There are a couple of interesting side ideas I’ve come across in the open source licensing space as different projects wrestled with how best to create the "right" licensing for their software.

* Many companies are concerned about their patent portfolios when creating open source projects. Google took an interesting approach to the problem when they released the WebM project. They chose the New BSD license and then created a very specific "Additional IP Rights Grant" to cover the patent language they needed.

* It is the nature of IP law that the owner of the property can license it as many ways to as many people as they choose. This is why the Microsoft EULA for a personal copy of the Windows operating system is different from an Enterprise License Agreement and how MySQL AB developed a line of business around closed software licensing as well as their GPL-licensed project. In the early days (up through PHP3), the software from the PHP project was similarly "dual" licensed under both the GPL2.0 and an earlier PHP license to allow the software to be included in as many places as possible because the GPL was not directly compatible with the PHP license of the time.

I have deliberately not tried to create a table or decision tree for license choice here. I believe there are sufficient edges and nuances to license choice that it can never be properly "automated" with the licenses we have today that reflect their rich background of needs and history. There is always one more legal question of "what about the situation when...?" Such questions will likely involve legal counsel and may be very jurisdiction sensitive.

Likewise, open source software licenses don’t simply reflect a set of legal choices. In the early stage of an open source project when the author or authors are first publishing the software, the choice of license reflects as much of the social contract that is being made for the project as any legal requirements. It is the first governance document of the early possible community that comes into play long before formal governance, mission statements, and codes of conduct may be created around growing community.

Full text of all the licenses can be found on the Open Source Initiative at: http://opensource.org/licenses/alphabetical

Excellent information on how to consider various software licenses in combination with the GPL can be found here: http://www.gnu.org/licenses/license-list.html#SoftwareLicenses

If you need to get a lawyer up to speed, consider pointing them to: http://www.ifosslr.org/ifosslr

Originally posted on the Outercurve Foundation Blog. Reposted with permission.

*This blog was originally published by Stephen R. Walli at https://opensource.com/law/13/1/which-open-source-software-license-should-i-use*

*All content licensed under the <a href="https://creativecommons.org/licenses/by-sa/3.0/us/">Creative Commons Attribution-Share Alike 3.0 United States</a> License (CC BY-SA 3.0 US).*
