Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 69895267C94
	for <lists+openrisc@lfdr.de>; Sat, 12 Sep 2020 23:22:14 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 03AC620BD3;
	Sat, 12 Sep 2020 23:22:13 +0200 (CEST)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by mail.librecores.org (Postfix) with ESMTPS id 08D5320101
 for <openrisc@lists.librecores.org>; Sat, 12 Sep 2020 10:40:46 +0200 (CEST)
Received: by mail-pl1-f196.google.com with SMTP id u9so2033975plk.4
 for <openrisc@lists.librecores.org>; Sat, 12 Sep 2020 01:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xtZpYqJi2Eh1iCduCHOJ+h77NknG0j+OKsQgYvK291Q=;
 b=aw7itSEeTJJzT2wS1waWn3QoWAFE2Rnm8cV2CO7tT69YDo7gEiKozK1mGeNQob02Ii
 c/lpmqphdvUbCf6NJO96JhB87t1IdfH17rWXMQbMN9nuNsyBtkvi2vD4peBSDiJfKnNn
 LhiHbyxb+UGBPCoCWciHsyiWAnhYi7pqC2YF0JUgaq+6TsH9iPOah3d/sk4dLvlkhuyO
 U+s8IyGWITEWrBw3DqZsEDzawfC3D6W9Cm8SolrMGzfSElybJO+ZSb8vKMtkGPXw4NcQ
 BRKvsvXKGx9LG5iOfH9sHiIBEqBk+dyKw6MaYDh8A1vr/+LnfiLGZsGagf/fahfxFd2i
 ugzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xtZpYqJi2Eh1iCduCHOJ+h77NknG0j+OKsQgYvK291Q=;
 b=kSbW1JZfninxgFNmYyK0jPuoAO6VcYszWBZRjUd7pIQJjYr+8FetOV141UwDnjHGgi
 a6C3BiUfmlaHVJNuGEiB2epqNkitIw2m5bJ055uJOcH7+K0C2w56MIDpxuYE7pF2/x2b
 YXPk2Sgl/iWZFGsLzxK29irQckLU5p9q/4e9YaGyYW7xCjmQtRUAyL/SQfs6xb52ClSc
 8oltVxB0BAs2XHq34D9aQp08gHzrY54jZWi4Gu4FcEPYR6DQklC3UI9Fskae/5OxQ7QD
 5+TNyGZf05xm0Nr5XkuOQkIj0c+rZbH6KxPb78NNEDyV2n3l1WSeleoUDixdqMvnBIPD
 Ckkw==
X-Gm-Message-State: AOAM531NbWLOorEfbxP2QIr+pbXkFZGxec/T89knF7DENx47wDR636xY
 PXDxXi/x1zkmatiXf6KNlPo=
X-Google-Smtp-Source: ABdhPJzZcn+s/PFPMGentFcESDpGVRZhUChlRUiTJzIXjPkcJ269s9m/RC3BlMACaK3CVlK8JhLktQ==
X-Received: by 2002:a17:90b:4acf:: with SMTP id
 mh15mr5478887pjb.204.1599900044119; 
 Sat, 12 Sep 2020 01:40:44 -0700 (PDT)
Received: from localhost (g168.115-65-169.ppp.wakwak.ne.jp. [115.65.169.168])
 by smtp.gmail.com with ESMTPSA id
 i126sm646895pfc.48.2020.09.12.01.40.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Sep 2020 01:40:43 -0700 (PDT)
Date: Sat, 12 Sep 2020 17:40:41 +0900
From: Stafford Horne <shorne@gmail.com>
To: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Message-ID: <20200912084041.GQ3562056@lianli.shorne-pla.net>
References: <20200910233940.2132107-1-shorne@gmail.com>
 <20200910233940.2132107-4-shorne@gmail.com>
 <20200911205526.65llro2gnh7zlsu4@ltop.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200911205526.65llro2gnh7zlsu4@ltop.local>
X-Mailman-Approved-At: Sat, 12 Sep 2020 23:22:07 +0200
Subject: Re: [OpenRISC] [PATCH v3 3/3] openrisc: Fix issue with get_user for
 64-bit values
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
Cc: Jonas Bonn <jonas@southpole.se>, Albert Ou <aou@eecs.berkeley.edu>,
 LKML <linux-kernel@vger.kernel.org>, openrisc@lists.librecores.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gRnJpLCBTZXAgMTEsIDIwMjAgYXQgMTA6NTU6MjZQTSArMDIwMCwgTHVjIFZhbiBPb3N0ZW5y
eWNrIHdyb3RlOgo+IE9uIEZyaSwgU2VwIDExLCAyMDIwIGF0IDA4OjM5OjQwQU0gKzA5MDAsIFN0
YWZmb3JkIEhvcm5lIHdyb3RlOgo+ID4gQSBidWlsZCBmYWlsdXJlIHdhcyByYWlzZWQgYnkga2J1
aWxkIHdpdGggdGhlIGZvbGxvd2luZyBlcnJvci4KPiA+IAo+ID4gICAgIGRyaXZlcnMvYW5kcm9p
ZC9iaW5kZXIuYzogQXNzZW1ibGVyIG1lc3NhZ2VzOgo+ID4gICAgIGRyaXZlcnMvYW5kcm9pZC9i
aW5kZXIuYzozODYxOiBFcnJvcjogdW5yZWNvZ25pemVkIGtleXdvcmQvcmVnaXN0ZXIgbmFtZSBg
bC5sd3ogP2FwLDQocjI0KScKPiA+ICAgICBkcml2ZXJzL2FuZHJvaWQvYmluZGVyLmM6Mzg2Njog
RXJyb3I6IHVucmVjb2duaXplZCBrZXl3b3JkL3JlZ2lzdGVyIG5hbWUgYGwuYWRkaSA/YXAscjAs
MCcKPiA+IAo+ID4gVGhlIGlzc3VlIGlzIHdpdGggNjQtYml0IGdldF91c2VyKCkgY2FsbHMgb24g
b3BlbnJpc2MuICBJIHRyYWNlZCB0aGlzIHRvCj4gPiBhIHByb2JsZW0gd2hlcmUgaW4gdGhlIGlu
dGVybmFsbHkgaW4gdGhlIGdldF91c2VyIG1hY3JvcyB0aGVyZSBpcyBhIGNhc3QKPiA+IHRvIGxv
bmcgX19ndV92YWwgdGhpcyBjYXVzZXMgR0NDIHRvIHRoaW5rIHRoZSBnZXRfdXNlciBjYWxsIGlz
IDMyLWJpdC4KPiA+IFRoaXMgYmluZGVyIGNvZGUgaXMgcmVhbGx5IGxvbmcgYW5kIEdDQyBhbGxv
Y2F0ZXMgcmVnaXN0ZXIgcjMwLCB3aGljaAo+ID4gdHJpZ2dlcnMgdGhlIGlzc3VlLiBUaGUgNjQt
Yml0IGdldF91c2VyIGFzbSB0cmllcyB0byBnZXQgdGhlIDY0LWJpdCBwYWlyCj4gPiByZWdpc3Rl
ciwgd2hpY2ggZm9yIHIzMCBvdmVyZmxvd3MgdGhlIGdlbmVyYWwgcmVnaXN0ZXIgbmFtZXMgYW5k
IHJldHVybnMKPiA+IHRoZSBkdW1teSByZWdpc3RlciA/YXAuCj4gPiAKPiA+IFRoZSBmaXggaGVy
ZSBpcyB0byBtb3ZlIHRoZSB0ZW1wb3JhcnkgdmFyaWFibGVzIGludG8gdGhlIGFzbSBtYWNyb3Mu
ICBXZQo+ID4gdXNlIGEgMzItYml0IF9fZ3VfdG1wIGZvciAzMi1iaXQgYW5kIHNtYWxsZXIgbWFj
cm8gYW5kIGEgNjQtYml0IHRtcCBpbgo+ID4gdGhlIDY0LWJpdCBtYWNyby4gIFRoZSBjYXN0IGlu
IHRoZSA2NC1iaXQgbWFjcm8gaGFzIGEgdHJpY2sgb2YgY2FzdGluZwo+ID4gdGhyb3VnaCBfX3R5
cGVvZl9fKCh4KS0oeCkpIHdoaWNoIGF2b2lkcyB0aGUgYmVsb3cgd2FybmluZy4gIFRoaXMgd2Fz
Cj4gPiBiYXJyb3dlZCBmcm9tIHJpc2N2Lgo+ID4gCj4gPiAgICAgYXJjaC9vcGVucmlzYy9pbmNs
dWRlL2FzbS91YWNjZXNzLmg6MjQwOjg6IHdhcm5pbmc6IGNhc3QgdG8gcG9pbnRlciBmcm9tIGlu
dGVnZXIgb2YgZGlmZmVyZW50IHNpemUKPiA+IAo+ID4gSSB0ZXN0ZWQgdGhpcyBpcyBhIHNtYWxs
IHVuaXQgdGVzdCB0byBjaGVjayByZWFkaW5nIGJldHdlZW4gNjQtYml0IGFuZAo+ID4gMzItYml0
IHBvaW50ZXJzIHRvIDY0LWJpdCBhbmQgMzItYml0IHZhbHVlcyBpbiBhbGwgY29tYmluYXRpb25z
LiAgQWxzbyBJCj4gPiByYW4gbWFrZSBDPTEgdG8gY29uZmlybSBubyBuZXcgc3BhcnNlIHdhcm5p
bmdzIGNhbWUgdXAuICBJdCBhbGwgbG9va3MKPiA+IGNsZWFuIHRvIG1lLgo+IAo+IEl0IGxvb2tz
IGNvcnJlY3QgdG8gbWUgdG9vIG5vdyBhdCBDICYgYXNzZW1ibHkgbGV2ZWwuCj4gRmVlbCBmcmVl
IHRvIGFkZCBteToKPiBSZXZpZXdlZC1ieTogTHVjIFZhbiBPb3N0ZW5yeWNrIDxsdWMudmFub29z
dGVucnlja0BnbWFpbC5jb20+CgpUaGFua3MgYSBsb3QuCgotU3RhZmZvcmQKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0
Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5v
cmcvbGlzdGluZm8vb3BlbnJpc2MK
