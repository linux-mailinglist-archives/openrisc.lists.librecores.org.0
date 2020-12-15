Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id DDF492E292F
	for <lists+openrisc@lfdr.de>; Fri, 25 Dec 2020 00:15:30 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 56FC320AB4;
	Fri, 25 Dec 2020 00:15:29 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by mail.librecores.org (Postfix) with ESMTPS id 9CAD9200E4
 for <openrisc@lists.librecores.org>; Tue, 15 Dec 2020 22:52:00 +0100 (CET)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5D4C3AD87;
 Tue, 15 Dec 2020 21:52:00 +0000 (UTC)
Date: Tue, 15 Dec 2020 22:51:57 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Message-ID: <20201215215157.GJ6564@kitsune.suse.cz>
References: <20201215190315.8681-1-alex_y_xu.ref@yahoo.ca>
 <20201215190315.8681-1-alex_y_xu@yahoo.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201215190315.8681-1-alex_y_xu@yahoo.ca>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Mailman-Approved-At: Fri, 25 Dec 2020 00:15:22 +0100
Subject: Re: [OpenRISC] [RFC PATCH] treewide: remove bzip2 compression
 support
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
Cc: linux-s390@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-kbuild@vger.kernel.org,
 torvalds@linux-foundation.org, linux-xtensa@linux-xtensa.org,
 linux-sh@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGVsbG8sCgpPbiBUdWUsIERlYyAxNSwgMjAyMCBhdCAwMjowMzoxNVBNIC0wNTAwLCBBbGV4IFh1
IChIZWxsbzcxKSB3cm90ZToKPiBiemlwMiBpcyBlaXRoZXIgc2xvd2VyIG9yIGxhcmdlciB0aGFu
IGV2ZXJ5IG90aGVyIHN1cHBvcnRlZCBhbGdvcml0aG0sCj4gYWNjb3JkaW5nIHRvIGJlbmNobWFy
a3MgYXQgWzBdLiBJdCBpcyBmYXIgc2xvd2VyIHRvIGRlY29tcHJlc3MgdGhhbiBhbnkKPiBvdGhl
ciBhbGdvcml0aG0sIGFuZCBzdGlsbCBsYXJnZXIgdGhhbiBsem1hLCB4eiwgYW5kIHpzdGQuCj4g
Cj4gWzBdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMTU4ODc5MTg4Mi4wOGcxMzc4ZzY3
Lm5vbmVAbG9jYWxob3N0LwoKU291bmRzIGNvb2wuIEkgd29uZGVyIGhvdyBtYW55IHBlb3BsZSB3
aWxsIGNvbXBsYWluIHRoYXQgdGhlaXIKZGlzdHJpYnV0aW9uIG1pZ3JhdGVkIHRvIGJ6aXAyIGJ1
dCBnb3Qgc3R1Y2sgdGhlcmUgYW5kIG5vdyBuZXcga2VybmVscwp3b24ndCB3b3JrIG9uIHRoZXJl
IHdpdGggc29tZSBvZGQgdG9vbCBvciBhbm90aGVyIDpwCgo+IEBAIC0yMTIsMTEgKzIwOSw2IEBA
IGNob2ljZQo+ICAJICBDb21wcmVzc2lvbiBzcGVlZCBpcyBvbmx5IHJlbGV2YW50IHdoZW4gYnVp
bGRpbmcgYSBrZXJuZWwuCj4gIAkgIERlY29tcHJlc3Npb24gc3BlZWQgaXMgcmVsZXZhbnQgYXQg
ZWFjaCBib290Lgo+ICAKPiAtCSAgSWYgeW91IGhhdmUgYW55IHByb2JsZW1zIHdpdGggYnppcDIg
b3IgbHptYSBjb21wcmVzc2VkCj4gLQkgIGtlcm5lbHMsIG1haWwgbWUgKEFsYWluIEtuYWZmKSA8
YWxhaW5Aa25hZmYubHU+LiAoQW4gb2xkZXIKPiAtCSAgdmVyc2lvbiBvZiB0aGlzIGZ1bmN0aW9u
YWxpdHkgKGJ6aXAyIG9ubHkpLCBmb3IgMi40LCB3YXMKPiAtCSAgc3VwcGxpZWQgYnkgQ2hyaXN0
aWFuIEx1ZHdpZykKPiAtClNob3VsZG4ndCB0aGUgTFpNQSBwYXJ0IGJlIHByZXNlcnZlZCBoZXJl
PwoKVGhhbmtzCgpNaWNoYWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMu
b3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
