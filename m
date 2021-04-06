Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 17382355FBF
	for <lists+openrisc@lfdr.de>; Wed,  7 Apr 2021 01:52:16 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 96DEC21300;
	Wed,  7 Apr 2021 01:52:15 +0200 (CEST)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mail.librecores.org (Postfix) with ESMTPS id C1A6C20EC6
 for <openrisc@lists.librecores.org>; Wed,  7 Apr 2021 01:52:12 +0200 (CEST)
Received: by mail-pj1-f50.google.com with SMTP id
 il9-20020a17090b1649b0290114bcb0d6c2so319066pjb.0
 for <openrisc@lists.librecores.org>; Tue, 06 Apr 2021 16:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=r0Ha/Gv3pAkjmgqqsKcPiH9tlZnqWzms79uqmOiSHMs=;
 b=DoH08R29BGwmuj6eSbyG3BUk0CMYUOgrE7l1ib0WohqefmBPVt3sY22jJOdDf2ba3M
 OraAYZNzGMrAjzLBt/oLKxSGP5xVkpQwVYlEyQ+FCAxk1AucZMSXaKaX4yes8IpuX9bx
 k/PK2mwZ7S6C7V1Otv/hHIYsXqEQzWVrSgtZ7Smoc3vdWQK5bfkyy5fWevoxUBoneWfM
 UlLNvmrFvT/LKV17m0n35Iq2WXwO1WQ94cKquKeKdq4Eo0jQbOkxVxjhAnmnUDMrZ/jw
 sjVzOf22KCT3mTqKrrakDQ7hCLtkS68PqKVrr3avChCGt1YUrsIst96sJ5oXc8I6D0zL
 +AxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=r0Ha/Gv3pAkjmgqqsKcPiH9tlZnqWzms79uqmOiSHMs=;
 b=AeOQv8MTOQLPrHDRp0pxKJEfCOAE83OnXh36IpZsbiYYpCbhMv7+VwjdUxY6LPJmlD
 TDOviu2xHd5l/7yzensO9D9tq2PVThGLaO/vm6h737zMtdf4P54E2iUGGQfEpUg0LEuk
 q1lOAOTjOfUk19/12mza4Rrs1P7nvcsM7rIhzEMqv1piZttMFI0O13ucw60l0F/LjTMv
 VDMtJPsMp9TgFDHr6uxw4howcoKbKYxDSr0wLA5cqbGYBKcCIy9LjSlwt/pcxhkGmfsp
 czyuWBGCNJKAv+q1i+WZoTC37h5IDMOkzQb/IkIZcI6lr/KBkvkVaWYw+/k5/BFYRGaw
 DSuQ==
X-Gm-Message-State: AOAM531ZA9ucv/xgGQIv+8UcLYYNVlxCVNW+sZc9952+wVpJ2IIcpn15
 kJcNaISbqeFsC8oOz6L8QzQ=
X-Google-Smtp-Source: ABdhPJxtumeckyy0f77HdPuOn8G6N6f+xOhLUrB9QPIL+nP1d3kOEbilw2AHpr0vnTb2lu4tnB14Mw==
X-Received: by 2002:a17:90a:6385:: with SMTP id
 f5mr590598pjj.212.1617753131320; 
 Tue, 06 Apr 2021 16:52:11 -0700 (PDT)
Received: from localhost (g139.124-45-193.ppp.wakwak.ne.jp. [124.45.193.139])
 by smtp.gmail.com with ESMTPSA id
 k21sm19587938pfi.28.2021.04.06.16.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 16:52:10 -0700 (PDT)
Date: Wed, 7 Apr 2021 08:52:08 +0900
From: Stafford Horne <shorne@gmail.com>
To: Boqun Feng <boqun.feng@gmail.com>
Message-ID: <20210406235208.GG3288043@lianli.shorne-pla.net>
References: <1617201040-83905-1-git-send-email-guoren@kernel.org>
 <1617201040-83905-2-git-send-email-guoren@kernel.org>
 <YGyRrBjomDCPOBUd@boqun-archlinux>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YGyRrBjomDCPOBUd@boqun-archlinux>
Subject: Re: [OpenRISC] [PATCH v6 1/9] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
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
Cc: linux-arch@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Guo Ren <guoren@linux.alibaba.com>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, Anup Patel <anup@brainfault.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, openrisc@lists.librecores.org, guoren@kernel.org,
 sparclinux@vger.kernel.org, Waiman Long <longman@redhat.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBBcHIgMDcsIDIwMjEgYXQgMTI6NTE6NTZBTSArMDgwMCwgQm9xdW4gRmVuZyB3cm90
ZToKPiBIaSwKPiAKPiBPbiBXZWQsIE1hciAzMSwgMjAyMSBhdCAwMjozMDozMlBNICswMDAwLCBn
dW9yZW5Aa2VybmVsLm9yZyB3cm90ZToKPiA+IEZyb206IEd1byBSZW4gPGd1b3JlbkBsaW51eC5h
bGliYWJhLmNvbT4KPiA+IAo+ID4gU29tZSBhcmNoaXRlY3R1cmVzIGRvbid0IGhhdmUgc3ViLXdv
cmQgc3dhcCBhdG9taWMgaW5zdHJ1Y3Rpb24sCj4gPiB0aGV5IG9ubHkgaGF2ZSB0aGUgZnVsbCB3
b3JkJ3Mgb25lLgo+ID4gCj4gPiBUaGUgc3ViLXdvcmQgc3dhcCBvbmx5IGltcHJvdmUgdGhlIHBl
cmZvcm1hbmNlIHdoZW46Cj4gPiBOUl9DUFVTIDwgMTZLCj4gPiAgKiAgMC0gNzogbG9ja2VkIGJ5
dGUKPiA+ICAqICAgICA4OiBwZW5kaW5nCj4gPiAgKiAgOS0xNTogbm90IHVzZWQKPiA+ICAqIDE2
LTE3OiB0YWlsIGluZGV4Cj4gPiAgKiAxOC0zMTogdGFpbCBjcHUgKCsxKQo+ID4gCj4gPiBUaGUg
OS0xNSBiaXRzIGFyZSB3YXN0ZWQgdG8gdXNlIHhjaGcxNiBpbiB4Y2hnX3RhaWwuCj4gPiAKPiA+
IFBsZWFzZSBsZXQgYXJjaGl0ZWN0dXJlIHNlbGVjdCB4Y2hnMTYveGNoZzMyIHRvIGltcGxlbWVu
dAo+ID4geGNoZ190YWlsLgo+ID4gCj4gCj4gSWYgdGhlIGFyY2hpdGVjdHVyZSBkb2Vzbid0IGhh
dmUgc3ViLXdvcmQgc3dhcCBhdG9taWMsIHdvbid0IGl0IGdlbmVyYXRlCj4gdGhlIHNhbWUvc2lt
aWxhciBjb2RlIG5vIG1hdHRlciB3aGljaCB2ZXJzaW9uIHhjaGdfdGFpbCgpIGlzIHVzZWQ/IFRo
YXQKPiBpcyBldmVuIENPTkZJR19BUkNIX1VTRV9RVUVVRURfU1BJTkxPQ0tTX1hDSEczMj15LCB4
Y2hnX3RhaWwoKSBhY3RzCj4gc2ltaWxhciB0byBhbiB4Y2hnMTYoKSBpbXBsZW1lbnRlZCBieSBj
bXB4Y2hnKCksIHdoaWNoIG1lYW5zIHdlIHN0aWxsCj4gZG9uJ3QgaGF2ZSBmb3J3YXJkIHByb2dy
ZXNzIGd1YXJhbnRlZS4gU28gdGhpcyBjb25maWd1cmF0aW9uIGRvZXNuJ3QKPiBzb2x2ZSB0aGUg
cHJvYmxlbS4KPiAKPiBJIHRoaW5rIGl0J3MgT0sgdG8gaW50cm9kdWNlIHRoaXMgY29uZmlnIGFu
ZCBkb24ndCBwcm92aWRlIHhjaGcxNigpIGZvcgo+IHJpc2Mtdi4gQnV0IEkgZG9uJ3Qgc2VlIHRo
ZSBwb2ludCBvZiBjb252ZXJ0aW5nIG90aGVyIGFyY2hpdGVjdHVyZXMgdG8KPiB1c2UgaXQuCgpI
ZWxsbywKCkZvciBPcGVuUklTQyBJIGRpZCBhY2sgdGhlIHBhdGNoIHRvIGNvbnZlcnQgdG8KQ09O
RklHX0FSQ0hfVVNFX1FVRVVFRF9TUElOTE9DS1NfWENIRzMyPXkuICBCdXQgSSB0aGluayB5b3Ug
YXJlIHJpZ2h0LCB0aGUKZ2VuZXJpYyBjb2RlIGluIHhjaGdfdGFpbCBhbmQgdGhlIHhjaGcxNiBl
bXVsYXRpb24gY29kZSBpbiBwcm9kdWNlZCBieSBPcGVuUklTQwp1c2luZyB4Y2hnMzIgd291bGQg
cHJvZHVjZSB2ZXJ5IHNpbWlsYXIgY29kZS4gIEkgaGF2ZSBub3QgY29tcGFyZWQgaW5zdHJ1Y3Rp
b25zLApidXQgaXQgZG9lcyBzZWVtIGxpa2UgZHVwbGljYXRlIGZ1bmN0aW9uYWxpdHkuCgpXaHkg
ZG9lc24ndCBSSVNDLVYgYWRkIHRoZSB4Y2hnMTYgZW11bGF0aW9uIGNvZGUgc2ltaWxhciB0byBP
cGVuUklTQz8gIEZvcgpPcGVuUklTQyB3ZSBhZGRlZCB4Y2hnMTYgYW5kIHhjaGc4IGVtdWxhdGlv
biBjb2RlIHRvIGVuYWJsZSBxc3BpbmxvY2tzLiAgU28Kb25lIHRob3VnaHQgaXMgd2l0aCBDT05G
SUdfQVJDSF9VU0VfUVVFVUVEX1NQSU5MT0NLU19YQ0hHMzI9eSwgY2FuIHdlIHJlbW92ZSBvdXIK
eGNoZzE2L3hjaGc4IGVtdWxhdGlvbiBjb2RlPwoKLVN0YWZmb3JkCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVu
UklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xp
c3RpbmZvL29wZW5yaXNjCg==
