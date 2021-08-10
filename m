Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C6E373E8501
	for <lists+openrisc@lfdr.de>; Tue, 10 Aug 2021 23:14:06 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 54A0323B3E;
	Tue, 10 Aug 2021 23:14:06 +0200 (CEST)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mail.librecores.org (Postfix) with ESMTPS id 3996220695
 for <openrisc@lists.librecores.org>; Tue, 10 Aug 2021 23:14:04 +0200 (CEST)
Received: by mail-pl1-f173.google.com with SMTP id d17so23050597plr.12
 for <openrisc@lists.librecores.org>; Tue, 10 Aug 2021 14:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1u6RP4tYgkicNkbD7E5xzCbsRTVgsebfr8s8lIzCzCg=;
 b=tXMBWTeaimS/JlofeHyuK9xWY754mFg1gybzHvOIYqz6LMRt6a+uDYUIdCgNtb2B3w
 v653MzDIfmHWIUVWeJXr0L/SaqrKJBfmPVXHuNLCUEsGS81+0oiTlPoYUIIDvMg4/q7C
 tALSiM0UMtKaJzvPk+64hCE6HVl/zcWSnogXi2SW8SltPhtjoZ2kd0MOU0rn662O7qBA
 Kst1Bw54ldFQJOP1MQxexb/npfe/vDm/hFRpQitnlDQJnE9gXIIXhOOdOStfA6JBkXNO
 8O83T8E3E5i7hGC5N8vKC8MlEhvpWy1ZEscYVwytjMH8r7vQIqTN2RB+jSqcc6DrEUGQ
 KITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1u6RP4tYgkicNkbD7E5xzCbsRTVgsebfr8s8lIzCzCg=;
 b=cjqV4fM47eP1Mq/nU06n7TQcNyjobbhY6P2GEizEcmt9HPcc4QqqJ1Jc902yMCaWKF
 YabrkOLS69Yus9O0WJTS8aQAdy9TIYIr9RVs/hYHJzNpU/3PnEj0NY5IzwVWQL1pSrxX
 H6wIZFwT+Flp5Il2xuTlaI2eYxmeZ00Z1ON16PORUS+WnlRraSYpC1gbfBB4oZNSPH4X
 mSqfbLhtLgY8sxEqjjYWc9VVLBMKzbaWuV5Bi0C2unCHsfqiNvt7yS4WIBsojGWxM9H4
 d6CF2UkWyhNsduxe2pbh8VmowSkG1Fij5DZAUSJXtR0yNZkj6Gs/kOfFjyoCJmHEUO/F
 p++Q==
X-Gm-Message-State: AOAM533gkLTdOf4Aa0QP2g39s+aD9CQpCwNFW/dKjRkoWBLHq8erqiKy
 p4Yt3SvFmbj1GTuv14xlso0=
X-Google-Smtp-Source: ABdhPJyEAUdOQDi/vaOTpEJ37a8gTJO4968lxzqOP812SYSlpKAlOFNrR+hUtBQgrQ9Kmq3r3jp44w==
X-Received: by 2002:a17:90b:3802:: with SMTP id
 mq2mr17824574pjb.19.1628630042687; 
 Tue, 10 Aug 2021 14:14:02 -0700 (PDT)
Received: from localhost (g195.61-45-49.ppp.wakwak.ne.jp. [61.45.49.195])
 by smtp.gmail.com with ESMTPSA id l14sm25978852pfd.58.2021.08.10.14.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 14:14:01 -0700 (PDT)
Date: Wed, 11 Aug 2021 06:13:59 +0900
From: Stafford Horne <shorne@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <YRLsF2J9KHb9F1BV@antec>
References: <20210805030035.2994973-1-shorne@gmail.com>
 <20210809013128.GA3698029@roeck-us.net>
 <0a3de28d-17d5-ec22-0ffb-97f5ca11c127@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0a3de28d-17d5-ec22-0ffb-97f5ca11c127@infradead.org>
Subject: Re: [OpenRISC] [PATCH] openrisc: Fix compiler warnings in setup
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
Cc: Jonas Bonn <jonas@southpole.se>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 kernel test robot <lkp@intel.com>, LKML <linux-kernel@vger.kernel.org>,
 Openrisc <openrisc@lists.librecores.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU3VuLCBBdWcgMDgsIDIwMjEgYXQgMDc6Mjg6MzhQTSAtMDcwMCwgUmFuZHkgRHVubGFwIHdy
b3RlOgo+IE9uIDgvOC8yMSA2OjMxIFBNLCBHdWVudGVyIFJvZWNrIHdyb3RlOgo+ID4gT24gVGh1
LCBBdWcgMDUsIDIwMjEgYXQgMTI6MDA6MzNQTSArMDkwMCwgU3RhZmZvcmQgSG9ybmUgd3JvdGU6
Cj4gPiA+IFRoaXMgd2FzIHBvaW50ZWQgb3V0IHdpdGggdGhlIHJlY2VudCBuYW1lIGNoYW5nZSBv
ZiBvcjMyX2Vhcmx5X3NldHVwIHRvCj4gPiA+IG9yMWtfZWFybHlfc2V0dXAuICBJbnZlc3RpZ2F0
aW5nIHRoZSBmaWxlIEkgZm91bmQgYSBmZXcgb3RoZXIgd2FybmluZ3MKPiA+ID4gc28gY2xlYW5p
bmcgdGhlbSB1cCBoZXJlLgo+ID4gPiAKPiA+ID4gICAgICBhcmNoL29wZW5yaXNjL2tlcm5lbC9z
ZXR1cC5jOjIyMDoxMzogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciAnb3Ixa19l
YXJseV9zZXR1cCcgWy1XbWlzc2luZy1wcm90b3R5cGVzXQo+ID4gPiAgICAgICAgMjIwIHwgdm9p
ZCBfX2luaXQgb3Ixa19lYXJseV9zZXR1cCh2b2lkICpmZHQpCj4gPiA+IAkgIHwgICAgICAgICAg
ICAgXn5+fn5+fn5+fn5+fn5+fgo+ID4gPiAKPiA+ID4gRml4IHRoaXMgdGhlIG1pc3Npbmcgb3Ix
a19lYXJseV9zZXR1cCBwcm90b3R5cGUgd2FybmluZyBieSBhZGRpbmcgYW4KPiA+ID4gYXNtL3Nl
dHVwLmggZmlsZSB0byBkZWZpbmUgdGhlIHByb3RvdHlwZS4KPiA+ID4gCj4gPiA+ICAgICAgYXJj
aC9vcGVucmlzYy9rZXJuZWwvc2V0dXAuYzoyNDY6MTM6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHBy
b3RvdHlwZSBmb3IgJ2RldGVjdF91bml0X2NvbmZpZycgWy1XbWlzc2luZy1wcm90b3R5cGVzXQo+
ID4gPiAgICAgICAgMjQ2IHwgdm9pZCBfX2luaXQgZGV0ZWN0X3VuaXRfY29uZmlnKHVuc2lnbmVk
IGxvbmcgdXByLCB1bnNpZ25lZCBsb25nIG1hc2ssCj4gPiA+IAkgIHwgICAgICAgICAgICAgXn5+
fn5+fn5+fn5+fn5+fn5+Cj4gPiA+IAo+ID4gPiBUaGUgZnVuY3Rpb24gZGV0ZWN0X3VuaXRfY29u
ZmlnIGlzIG5vdCB1c2VkLCBqdXN0IHJlbW92ZSBpdC4KPiA+ID4gCj4gPiA+ICAgICAgYXJjaC9v
cGVucmlzYy9rZXJuZWwvc2V0dXAuYzoyMjE6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBv
ciBtZW1iZXIgJ2ZkdCcgbm90IGRlc2NyaWJlZCBpbiAnb3Ixa19lYXJseV9zZXR1cCcKPiA+ID4g
Cj4gPiA+IEFkZCBAZmR0IGRvY3MgdG8gdGhlIGZ1bmN0aW9uIGNvbW1lbnQgdG8gc3VwcHJlc3Mg
dGhpcyB3YXJuaW5nLgo+ID4gPiAKPiA+ID4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90
IDxsa3BAaW50ZWwuY29tPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBTdGFmZm9yZCBIb3JuZSA8c2hv
cm5lQGdtYWlsLmNvbT4KPiA+IAo+ID4gUHV6emxlZC4gVGhpcyBwYXRjaCBnaXZlcyBtZToKPiAK
PiBTdGFmZm9yZCBwb3N0ZWQgYSB2MiBlYXJsaWVyIHRvZGF5Ogo+IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xrbWwvMjAyMTA4MDgxMzU0MzcuMzY0MDU0OS0xLXNob3JuZUBnbWFpbC5jb20vCgpZ
ZXMsIHRoYW5rcyBmb3IgcG9pbnRpbmcgdGhpcyBvdXQuICBJIGZvdW5kIHdoeSBJIG1pc3NlZCB0
aGlzIGluIHYxLCAgYmFzaWNhbGx5CkkgZmFpbGVkIHRvIG1pc3MgdGhpcyB1c2luZyBteSBsb2Nh
bCBidWlsZCBhbmQgbXkgQ0kgc2VydmljZSBvbiB0cmF2aXMgc2VlbXMgdG8KaGF2ZSBiZWVuIHN0
b3BwZWQuICBJIGhhdmUgc3dpdGNoZWQgdG8gdXNlIGdpdGh1YiBhY3Rpb25zIGZvciBDSS4KCkZv
ciBteSBsb2NhbCBidWlsZCBJIHdpbGwgbmVlZCB0byB3YXRjaCBtb3JlIGNhcmVmdWxseS4KCi1T
dGFmZm9yZAoKPiA+IEJ1aWxkaW5nIG9wZW5yaXNjOm9yMWtzaW1fZGVmY29uZmlnIC4uLiBmYWls
ZWQKPiA+IC0tLS0tLS0tLS0tLQo+ID4gRXJyb3IgbG9nOgo+ID4gSW4gZmlsZSBpbmNsdWRlZCBm
cm9tIC4vYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS9wYWdlLmg6MzUsCj4gPiAgICAgICAgICAg
ICAgICAgICBmcm9tIC4vaW5jbHVkZS9saW51eC9nZW5lcmljLXJhZGl4LXRyZWUuaDozOSwKPiA+
ICAgICAgICAgICAgICAgICAgIGZyb20gbGliL2dlbmVyaWMtcmFkaXgtdHJlZS5jOjM6Cj4gPiAu
L2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vc2V0dXAuaDoxMToxMzogZXJyb3I6Cj4gPiAJCWV4
cGVjdGVkICc9JywgJywnLCAnOycsICdhc20nIG9yICdfX2F0dHJpYnV0ZV9fJyBiZWZvcmUgJ29y
MWtfZWFybHlfc2V0dXAnCj4gPiAgICAgMTEgfCB2b2lkIF9faW5pdCBvcjFrX2Vhcmx5X3NldHVw
KHZvaWQgKmZkdCk7Cj4gPiAgICAgICAgfCAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+Cj4g
PiBtYWtlWzFdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6MjcyOiBsaWIvZ2VuZXJpYy1y
YWRpeC10cmVlLm9dIEVycm9yIDEKPiA+IAo+ID4gQmlzZWN0IGxvZyBhdHRhY2hlZCBmb3IgY29t
cGxldGVuZXNzLgo+IAo+IFRoYXQgbmVlZHMgI2luY2x1ZGUgPGxpbnV4L2luaXQuaD4KPiAKPiAt
LSAKPiB+UmFuZHkKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3Jn
Cmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
