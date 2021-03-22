Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E9B1F345BAB
	for <lists+openrisc@lfdr.de>; Tue, 23 Mar 2021 11:08:27 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 79680204A1;
	Tue, 23 Mar 2021 11:08:27 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by mail.librecores.org (Postfix) with ESMTPS id A9C1320D49
 for <openrisc@lists.librecores.org>; Mon, 22 Mar 2021 14:35:42 +0100 (CET)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1616420142; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bNwpWnU/mOEb8vDk9U6PPMjzkSSiO3GF6Uf0hvYy86c=;
 b=T/88LUerDCEZ5aLb09F83ICr41UqeH2rh4J7zrGpXp20VeYsZHJpi/YuD6UnXQW4pyzMJd
 jBAgDV46TT0Kz09FM1vI9JNZIIaETu438nFrfjiK/6ELDm8IlG80pWXjuPGHfOvQ9qSqDa
 nwk9Za/1Mcrl0+PJNnBW15dSnFPW4Rw=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2DFE4AD79;
 Mon, 22 Mar 2021 13:35:42 +0000 (UTC)
Date: Mon, 22 Mar 2021 14:35:41 +0100
From: Michal Hocko <mhocko@suse.com>
To: David Hildenbrand <david@redhat.com>
Message-ID: <YFidLVQs+/zw4aIF@dhcp22.suse.cz>
References: <20210319143452.25948-1-david@redhat.com>
 <20210319143452.25948-2-david@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210319143452.25948-2-david@redhat.com>
X-Mailman-Approved-At: Tue, 23 Mar 2021 11:08:25 +0100
Subject: Re: [OpenRISC] [PATCH RFC 1/3] drivers/char: remove /dev/kmem for
 good
X-BeenThere: openrisc@lists.librecores.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Discussion around the OpenRISC processor
 <openrisc.lists.librecores.org>
List-Unsubscribe: <https://lists.librecores.org/options/openrisc>,
 <mailto:openrisc-request@lists.librecores.org?subject=unsubscribe>
List-Archive: <http://lists.librecores.org/pipermail/openrisc/>
List-Post: <mailto:openrisc@lists.librecores.org>
List-Help: <mailto:openrisc-request@lists.librecores.org?subject=help>
List-Subscribe: <https://lists.librecores.org/listinfo/openrisc>,
 <mailto:openrisc-request@lists.librecores.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, Hillf Danton <hdanton@sina.com>,
 Rich Felker <dalias@libc.org>, linux-doc@vger.kernel.org,
 Viresh Kumar <viresh.kumar@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "Pavel Machek \(CIP\)" <pavel@denx.de>, linux-mm@kvack.org,
 Oleksiy Avramchenko <oleksiy.avramchenko@sonymobile.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 Linux API <linux-api@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jonas Bonn <jonas@southpole.se>,
 Rob Herring <robh@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Brian Cain <bcain@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>,
 Xiaoming Ni <nixiaoming@huawei.com>,
 Gregory Clement <gregory.clement@bootlin.com>, linux-sh@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>,
 Corentin Labbe <clabbe@baylibre.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 Robert Richter <rric@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Steven Rostedt <rostedt@goodmis.org>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 huang ying <huang.ying.caritas@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Kairui Song <kasong@redhat.com>,
 William Cohen <wcohen@redhat.com>, Chris Zankel <chris@zankel.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Max Filippov <jcmvbkbc@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Theodore Dubois <tblodt@icloud.com>, Minchan Kim <minchan@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 "Alexander A. Klimov" <grandmaster@al2klimov.de>,
 Sudeep Holla <sudeep.holla@arm.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gRnJpIDE5LTAzLTIxIDE1OjM0OjUwLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPiBFeHBs
b3JpbmcgL2Rldi9rbWVtIGFuZCAvZGV2L21lbSBpbiB0aGUgY29udGV4dCBvZiBtZW1vcnkgaG90
KHVuKXBsdWcgYW5kCj4gbWVtb3J5IGJhbGxvb25pbmcsIEkgc3RhcnRlZCBxdWVzdGlvbmluZyB0
aGUgZXhpc3RhbmNlIG9mIC9kZXYva21lbS4KPiAKPiBDb21wYXJpbmcgaXQgd2l0aCB0aGUgL3By
b2Mva2NvcmUgaW1wbGVtZW50YXRpb24sIGl0IGRvZXMgbm90IHNlZW0gdG8gYmUKPiBhYmxlIHRv
IGRlYWwgd2l0aCB0aGluZ3MgbGlrZQo+IGEpIFBhZ2VzIHVubWFwcGVkIGZyb20gdGhlIGRpcmVj
dCBtYXBwaW5nIChlLmcuLCB0byBiZSB1c2VkIGJ5IHNlY3JldG1lbSkKPiAgIC0+IGtlcm5fYWRk
cl92YWxpZCgpLiB2aXJ0X2FkZHJfdmFsaWQoKSBpcyBub3Qgc3VmZmljaWVudC4KPiBiKSBTcGVj
aWFsIGNhc2VzIGxpa2UgZ2FydCBhcGVydHVyZSBtZW1vcnkgdGhhdCBpcyBub3QgdG8gYmUgdG91
Y2hlZAo+ICAgLT4gbWVtX3Bmbl9pc19yYW0oKQo+IFVubGVzcyBJIGFtIG1pc3Npbmcgc29tZXRo
aW5nLCBpdCdzIGF0IGxlYXN0IGJyb2tlbiBpbiBzb21lIGNhc2VzIGFuZCBtaWdodAo+IGZhdWx0
L2NyYXNoIHRoZSBtYWNoaW5lLgo+IAo+IExvb2tzIGxpa2UgaXRzIGV4aXN0YW5jZSBoYXMgYmVl
biBxdWVzdGlvbmVkIGJlZm9yZSBpbiAyMDA1IGFuZCAyMDEwCj4gWzFdLCBhZnRlciB+MTEgYWRk
aXRpb25hbCB5ZWFycywgaXQgbWlnaHQgbWFrZSBzZW5zZSB0byByZXZpdmUgdGhlCj4gZGlzY3Vz
c2lvbi4KPiAKPiBDT05GSUdfREVWS01FTSBpcyBvbmx5IGVuYWJsZWQgaW4gYSBzaW5nbGUgZGVm
Y29uZmlnIChvbiBwdXJwb3NlIG9yIGJ5Cj4gbWlzdGFrZT8pLiBBbGwgZGlzdHJpYnV0aW9ucyBJ
IGxvb2tlZCBhdCBkaXNhYmxlIGl0Lgo+IAo+IDEpIC9kZXYva21lbSB3YXMgcG9wdWxhciBmb3Ig
cm9vdGtpdHMgWzJdIGJlZm9yZSBpdCBnb3QgZGlzYWJsZWQKPiAgICBiYXNpY2FsbHkgZXZlcnl3
aGVyZS4gVWJ1bnR1IGRvY3VtZW50cyBbM10gIlRoZXJlIGlzIG5vIG1vZGVybiB1c2VyIG9mCj4g
ICAgL2Rldi9rbWVtIGFueSBtb3JlIGJleW9uZCBhdHRhY2tlcnMgdXNpbmcgaXQgdG8gbG9hZCBr
ZXJuZWwgcm9vdGtpdHMuIi4KPiAgICBSSEVMIGRvY3VtZW50cyBpbiBhIEJaIFs1XSAiaXQgc2Vy
dmVkIG5vIHByYWN0aWNhbCBwdXJwb3NlIG90aGVyIHRoYW4gdG8KPiAgICBzZXJ2ZSBhcyBhIHBv
dGVudGlhbCBzZWN1cml0eSBwcm9ibGVtIG9yIHRvIGVuYWJsZSBiaW5hcnkgbW9kdWxlIGRyaXZl
cnMKPiAgICB0byBhY2Nlc3Mgc3RydWN0dXJlcy9mdW5jdGlvbnMgdGhleSBzaG91bGRuJ3QgYmUg
dG91Y2hpbmciCj4gCj4gMikgL3Byb2Mva2NvcmUgaXMgYSBkZWNlbnQgaW50ZXJmYWNlIHRvIGhh
dmUgYSBjb250cm9sbGVkIHdheSB0byByZWFkCj4gICAga2VybmVsIG1lbW9yeSBmb3IgZGVidWdn
aW5nIHB1cG9zZXMuICh3aWxsIG5lZWQgc29tZSBleHRlbnNpb25zIHRvCj4gICAgZGVhbCB3aXRo
IG1lbW9yeSBvZmZsaW5pbmcvdW5wbHVnLCBtZW1vcnkgYmFsbG9vbmluZywgYW5kIHBvaXNvbmVk
Cj4gICAgcGFnZXMsIHRob3VnaCkKPiAKPiAzKSBJdCBtaWdodCBiZSB1c2VmdWwgZm9yIGNvcm5l
ciBjYXNlIGRlYnVnZ2luZyBbMV0uIEtEQi9LR0RCIG1pZ2h0IGJlIGEKPiAgICBiZXR0ZXIgZml0
LCBlc3BlY2lhbGx5LCB0byB3cml0ZSByYW5kb20gbWVtb3J5OyBoYXJkZXIgdG8gc2hvb3QKPiAg
ICB5b3Vyc2VsZiBpbnRvIHRoZSBmb290Lgo+IAo+IDQpICJLZXJuZWwgTWVtb3J5IEVkaXRvciIg
aGFzbid0IHNlZW4gYW55IHVwZGF0ZXMgc2luY2UgMjAwMCBhbmQgc2VlbXMKPiAgICB0byBiZSBp
bmNvbXBhdGlibGUgd2l0aCA2NGJpdCBbMV0uIEZvciBlZHVjYXRpb25hbCBwdXJwb3NlcywKPiAg
ICAvcHJvYy9rY29yZSBtaWdodCBiZSB1c2VkIHRvIG1vbml0b3IgdmFsdWUgdXBkYXRlcyAtLSBv
ciBvbGRlcgo+ICAgIGtlcm5lbHMgY2FuIGJlIHVzZWQuCj4gCj4gNSkgSXQncyBicm9rZW4gb24g
YXJtNjQsIGFuZCB0aGVyZWZvcmUsIGNvbXBsZXRlbHkgZGlzYWJsZWQgdGhlcmUuCj4gCj4gTG9v
a3MgbGlrZSBpdCdzIGVzc2VudGlhbGx5IHVudXNlZCBhbmQgaGFzIGJlZW4gcmVwbGFjZWQgYnkg
YmV0dGVyCj4gc3VpdGVkIGludGVyZmFjZXMgZm9yIGluZGl2aWR1YWwgdGFza3MgKC9wcm9jL2tj
b3JlLCBLREIvS0dEQikuIExldCdzCj4ganVzdCByZW1vdmUgaXQuCj4gCj4gWzFdIGh0dHBzOi8v
bHduLm5ldC9BcnRpY2xlcy8xNDc5MDEvCj4gWzJdIGh0dHBzOi8vd3d3LmxpbnV4am91cm5hbC5j
b20vYXJ0aWNsZS8xMDUwNQo+IFszXSBodHRwczovL3dpa2kudWJ1bnR1LmNvbS9TZWN1cml0eS9G
ZWF0dXJlcyNBLjJGZGV2LjJGa21lbV9kaXNhYmxlZAo+IFs0XSBodHRwczovL3NvdXJjZWZvcmdl
Lm5ldC9wcm9qZWN0cy9rbWUvCj4gWzVdIGh0dHBzOi8vYnVnemlsbGEucmVkaGF0LmNvbS9zaG93
X2J1Zy5jZ2k/aWQ9MTU0Nzk2Cj4gCj4gQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91
bmRhdGlvbi5vcmc+Cj4gQ2M6IEhpbGxmIERhbnRvbiA8aGRhbnRvbkBzaW5hLmNvbT4KPiBDYzog
TWljaGFsIEhvY2tvIDxtaG9ja29Ac3VzZS5jb20+Cj4gQ2M6IE1hdHRoZXcgV2lsY294IDx3aWxs
eUBpbmZyYWRlYWQub3JnPgo+IENjOiBPbGVrc2l5IEF2cmFtY2hlbmtvIDxvbGVrc2l5LmF2cmFt
Y2hlbmtvQHNvbnltb2JpbGUuY29tPgo+IENjOiBTdGV2ZW4gUm9zdGVkdCA8cm9zdGVkdEBnb29k
bWlzLm9yZz4KPiBDYzogTWluY2hhbiBLaW0gPG1pbmNoYW5Aa2VybmVsLm9yZz4KPiBDYzogaHVh
bmcgeWluZyA8aHVhbmcueWluZy5jYXJpdGFzQGdtYWlsLmNvbT4KPiBDYzogSm9uYXRoYW4gQ29y
YmV0IDxjb3JiZXRAbHduLm5ldD4KPiBDYzogUnVzc2VsbCBLaW5nIDxsaW51eEBhcm1saW51eC5v
cmcudWs+Cj4gQ2M6IExpdml1IER1ZGF1IDxsaXZpdS5kdWRhdUBhcm0uY29tPgo+IENjOiBTdWRl
ZXAgSG9sbGEgPHN1ZGVlcC5ob2xsYUBhcm0uY29tPgo+IENjOiBMb3JlbnpvIFBpZXJhbGlzaSA8
bG9yZW56by5waWVyYWxpc2lAYXJtLmNvbT4KPiBDYzogQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5u
LmNoPgo+IENjOiBHcmVnb3J5IENsZW1lbnQgPGdyZWdvcnkuY2xlbWVudEBib290bGluLmNvbT4K
PiBDYzogU2ViYXN0aWFuIEhlc3NlbGJhcnRoIDxzZWJhc3RpYW4uaGVzc2VsYmFydGhAZ21haWwu
Y29tPgo+IENjOiBZb3NoaW5vcmkgU2F0byA8eXNhdG9AdXNlcnMuc291cmNlZm9yZ2UuanA+Cj4g
Q2M6IEJyaWFuIENhaW4gPGJjYWluQGNvZGVhdXJvcmEub3JnPgo+IENjOiBHZWVydCBVeXR0ZXJo
b2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPgo+IENjOiBKb25hcyBCb25uIDxqb25hc0Bzb3V0
aHBvbGUuc2U+Cj4gQ2M6IFN0ZWZhbiBLcmlzdGlhbnNzb24gPHN0ZWZhbi5rcmlzdGlhbnNzb25A
c2F1bmFsYWh0aS5maT4KPiBDYzogU3RhZmZvcmQgSG9ybmUgPHNob3JuZUBnbWFpbC5jb20+Cj4g
Q2M6IFJpY2ggRmVsa2VyIDxkYWxpYXNAbGliYy5vcmc+Cj4gQ2M6ICJEYXZpZCBTLiBNaWxsZXIi
IDxkYXZlbUBkYXZlbWxvZnQubmV0Pgo+IENjOiBDaHJpcyBaYW5rZWwgPGNocmlzQHphbmtlbC5u
ZXQ+Cj4gQ2M6IE1heCBGaWxpcHBvdiA8amNtdmJrYmNAZ21haWwuY29tPgo+IENjOiBBcm5kIEJl
cmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IENjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBs
aW51eGZvdW5kYXRpb24ub3JnPgo+IENjOiBBbGV4YW5kZXIgVmlybyA8dmlyb0B6ZW5pdi5saW51
eC5vcmcudWs+Cj4gQ2M6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gQ2M6ICJQYXZl
bCBNYWNoZWsgKENJUCkiIDxwYXZlbEBkZW54LmRlPgo+IENjOiBUaGVvZG9yZSBEdWJvaXMgPHRi
bG9kdEBpY2xvdWQuY29tPgo+IENjOiAiQWxleGFuZGVyIEEuIEtsaW1vdiIgPGdyYW5kbWFzdGVy
QGFsMmtsaW1vdi5kZT4KPiBDYzogUGF2ZWwgTWFjaGVrIDxwYXZlbEB1Y3cuY3o+Cj4gQ2M6IFNh
bSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiBDYzogQWxleGFuZHJlIEJlbGxvbmkgPGFs
ZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tPgo+IENjOiBBbmRyZXkgWmhpemhpa2luIDxhbmRy
ZXkuemhpemhpa2luQGxlaWNhLWdlb3N5c3RlbXMuY29tPgo+IENjOiBSYW5keSBEdW5sYXAgPHJk
dW5sYXBAaW5mcmFkZWFkLm9yZz4KPiBDYzogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJu
ZWwub3JnPgo+IENjOiBWaXJlc2ggS3VtYXIgPHZpcmVzaC5rdW1hckBsaW5hcm8ub3JnPgo+IENj
OiAiRXJpYyBXLiBCaWVkZXJtYW4iIDxlYmllZGVybUB4bWlzc2lvbi5jb20+Cj4gQ2M6IFRob21h
cyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgo+IENjOiBYaWFvbWluZyBOaSA8bml4aWFv
bWluZ0BodWF3ZWkuY29tPgo+IENjOiBSb2JlcnQgUmljaHRlciA8cnJpY0BrZXJuZWwub3JnPgo+
IENjOiBXaWxsaWFtIENvaGVuIDx3Y29oZW5AcmVkaGF0LmNvbT4KPiBDYzogQ29yZW50aW4gTGFi
YmUgPGNsYWJiZUBiYXlsaWJyZS5jb20+Cj4gQ2M6IEthaXJ1aSBTb25nIDxrYXNvbmdAcmVkaGF0
LmNvbT4KPiBDYzogTGludXMgVG9ydmFsZHMgPHRvcnZhbGRzQGxpbnV4LWZvdW5kYXRpb24ub3Jn
Pgo+IENjOiBsaW51eC1kb2NAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGxpbnV4LWtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmcKPiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4g
Q2M6IHVjbGludXgtaDgtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UuanAKPiBDYzogbGludXgtaGV4
YWdvbkB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGludXgtbTY4a0BsaXN0cy5saW51eC1tNjhrLm9y
Zwo+IENjOiBvcGVucmlzY0BsaXN0cy5saWJyZWNvcmVzLm9yZwo+IENjOiBsaW51eC1zaEB2Z2Vy
Lmtlcm5lbC5vcmcKPiBDYzogc3BhcmNsaW51eEB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGludXgt
eHRlbnNhQGxpbnV4LXh0ZW5zYS5vcmcKPiBDYzogbGludXgtZnNkZXZlbEB2Z2VyLmtlcm5lbC5v
cmcKPiBDYzogTGludXggQVBJIDxsaW51eC1hcGlAdmdlci5rZXJuZWwub3JnPgo+IFNpZ25lZC1v
ZmYtYnk6IERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQuY29tPgoKQWNrZWQtYnk6IE1p
Y2hhbCBIb2NrbyA8bWhvY2tvQHN1c2UuY29tPgotLSAKTWljaGFsIEhvY2tvClNVU0UgTGFicwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBt
YWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5s
aWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
