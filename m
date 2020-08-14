Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id BE18A244F48
	for <lists+openrisc@lfdr.de>; Fri, 14 Aug 2020 22:48:07 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 4CEC520E69;
	Fri, 14 Aug 2020 22:48:07 +0200 (CEST)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by mail.librecores.org (Postfix) with ESMTPS id 8CA2920E46
 for <openrisc@lists.librecores.org>; Fri, 14 Aug 2020 22:48:04 +0200 (CEST)
Received: by mail-pl1-f196.google.com with SMTP id f10so4701125plj.8
 for <openrisc@lists.librecores.org>; Fri, 14 Aug 2020 13:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=244FLypaM2NGxDoPpAzfSJH2dcpfhRfVt7B8PZPpN74=;
 b=EdAUceeP6gRUYKxDODNpLLFRfYeVOfk9v1P9+lVBcPIxT5mh/aq7k+d5908y5Z4sub
 dP2K0x/VMTRTLiMM/f9LENa4xaVvHz+RL07I8UIvLTpfc3mgk4zA+DZO5FD5xWSSeMkP
 G3bv7pHrQ5jLgRebMtbPxrKGSb9+oUY18DIz6EvECWCyFJpzUOT0J3DHvKDxOy6L4VGp
 H+wsqxYaH339xB94oUViMQ0X5eLuyNptg9MavVApc5QT9HKBTwmfJxeNqxlYjoEsMgyG
 NijouYW8gH5fA5Ns5VP5ORmX/iTtwS3xVMGhVrIybSh7QtGkFi4mVLPZHk/+8fAaNoGD
 kMow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=244FLypaM2NGxDoPpAzfSJH2dcpfhRfVt7B8PZPpN74=;
 b=sx8b9gK0kPXpmp7D5UaPqhU31X1mGvfpl6Dc2khEJMkb4aehyb+dykqlxjeri2ma7o
 hilFbOZPpevqJdQCV0hjvzBanB7UU+hpuhgEGPYNfLFuXCYqWaG+O/4uDog9sfwVPDjp
 pSsTyLitMrctgHViwjj6TvoRuB9RlKrXy1NtAI4jO30cjnt/qxOOnrDIeFSgyRu8HRu6
 00XcgjfvH3HOpgODmT8gopl2ouvWbvgJZMsGQfVSmlECHI9sKnFt9M/aqFUkJackxt7z
 aCTcyqPzfL5kuCK684qf+EAqpr4DXrhae2vGxOkcMsvr28VDSY1NSV8lIP4A+jizgM8Z
 QrUw==
X-Gm-Message-State: AOAM532fBPEXi7/R891gztQ64HA8f3YmaS2wyT1H4k1awAMBwPcf6gy4
 E8pajJhcV/Oybvb6RtYhj30=
X-Google-Smtp-Source: ABdhPJzQxQrtT+XVWqyzF3rDOzH4vwvHsCkPG5c2B4gJ2aiJ3l66nUnnSpzjDmpp5uH7Pz1cBOJdaA==
X-Received: by 2002:a17:90b:11d1:: with SMTP id
 gv17mr3507737pjb.167.1597438082257; 
 Fri, 14 Aug 2020 13:48:02 -0700 (PDT)
Received: from localhost (g223.115-65-55.ppp.wakwak.ne.jp. [115.65.55.223])
 by smtp.gmail.com with ESMTPSA id 132sm8973214pgg.83.2020.08.14.13.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2020 13:48:01 -0700 (PDT)
Date: Sat, 15 Aug 2020 05:47:59 +0900
From: Stafford Horne <shorne@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20200814204759.GT80756@lianli.shorne-pla.net>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [OpenRISC] [GIT PULL] OpenRISC updates for v5.9
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
Cc: Openrisc <openrisc@lists.librecores.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgTGludXMsCgpQbGVhc2UgY29uc2lkZXIgZm9yIHB1bGw6CgpUaGUgZm9sbG93aW5nIGNoYW5n
ZXMgc2luY2UgY29tbWl0IGJjZjg3Njg3MGI5NTU5MmI1MjUxOWVkNGFhZmNmOWQ5NTk5OWJjOWM6
CgogIExpbnV4IDUuOCAoMjAyMC0wOC0wMiAxNDoyMTo0NSAtMDcwMCkKCmFyZSBhdmFpbGFibGUg
aW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6Ly9naXRodWIuY29tL29wZW5yaXNjL2xp
bnV4LmdpdCB0YWdzL2Zvci1saW51cwoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDU1
YjI2NjJlYzY2NWNjOGI1OTI4MDlhMDExZmU4MDdiMDUzNzBhYjg6CgogIG9wZW5yaXNjOiB1YWNj
ZXNzOiBBZGQgdXNlciBhZGRyZXNzIHNwYWNlIGNoZWNrIHRvIGFjY2Vzc19vayAoMjAyMC0wOC0w
OSAwNzo1NzoyMSArMDkwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KT3BlblJJU0MgdXBkYXRlcyBmb3IgNS45CgpBIGZl
dyBwYXRjaGVzIGFsbCBvdmVyIHRoZSBwbGFjZSBkdXJpbmcgdGhpcyBjeWNsZSwgbW9zdGx5IGJ1
ZyBhbmQKc3BhcnNlIHdhcm5pbmcgZml4ZXMgZm9yIE9wZW5SSVNDLCBidXQgYSBmZXcgZW5oYW5j
ZW1lbnRzIHRvby4gIE5vdGUsCnRoZXJlIGFyZSAyIG5vbiBPcGVuUklTQyBzcGVjaWZpYyBmaXh1
cHMuCgpOb24gT3BlblJJU0MgZml4ZXM6CgogLSBJbiBpbml0IHdlIG5lZWQgdG8gYWxpZ24gdGhl
IGluaXRfdGFzayBjb3JyZWN0bHkgdG8gZml4IGFuIGlzc3VlIHdpdGgKICAgTVVURVhfRkxBR1Ms
IHJldmlld2VkIGJ5IFBldGVyIFouICBObyBvbmUgcGlja2VkIHRoaXMgdXAgc28gSSBrZXB0IGl0
CiAgIG9uIG15IHRyZWUuCiAtIEluIGFzbS1nZW5lcmljL2lvLmggSSBmaXhlZCB1cCBzb21lIHNw
YXJzZSB3YXJuaW5ncywgT0snZCBieSBBcm5kLgogICBBcm5kIGFza2VkIHRvIG1lcmdlIGl0IHZp
YSBteSB0cmVlLgoKT3BlblJJU0MgZml4ZXM6CgogLSBNYW55IGZpeGVzIGZvciBPcGVuUklTQyBz
cHJhc2Ugd2FybmluZ3MuCiAtIEFkZCBzdXBwb3J0IE9wZW5SSVNDIFNNUCB0bGIgZmx1c2hpbmcg
cmF0aGVyIHRoYW4gYWx3YXlzIGZsdXNoaW5nIHRoZQogICBlbnRpcmUgVExCIG9uIGV2ZXJ5IENQ
VS4KIC0gRml4IGJ1ZyB3aGVuIGR1bXBpbmcgc3RhY2sgdmlhIC9wcm9jL3h4eC9zdGFjayBvZiB1
c2VyIHRocmVhZHMuCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCkx1YyBWYW4gT29zdGVucnljayAoMSk6CiAgICAgIG9wZW5y
aXNjOiBmaXggX191c2VyIGluIHJhd19jb3B5X3RvX3VzZXIoKSdzIHByb3RvdHlwZQoKU3RhZmZv
cmQgSG9ybmUgKDExKToKICAgICAgaW5pdDogQWxpZ24gaW5pdF90YXNrIHRvIGF2b2lkIGNvbmZs
aWN0IHdpdGggTVVURVhfRkxBR1MKICAgICAgb3BlbnJpc2M6IEFkZCBzdXBwb3J0IGZvciBleHRl
cm5hbCBpbml0cmQgaW1hZ2VzCiAgICAgIG9wZW5yaXNjOiBGaXggb29wcyBjYXVzZWQgd2hlbiBk
dW1waW5nIHN0YWNrCiAgICAgIG9wZW5yaXNjOiBJbXBsZW1lbnQgcHJvcGVyIFNNUCB0bGIgZmx1
c2hpbmcKICAgICAgYXNtLWdlbmVyaWMvaW8uaDogRml4IHNwYXJzZSB3YXJuaW5ncyBvbiBiaWct
ZW5kaWFuIGFyY2hpdGVjdHVyZXMKICAgICAgb3BlbnJpc2M6IGlvOiBGaXh1cCBkZWZpbmVzIGFu
ZCBtb3ZlIGluY2x1ZGUgdG8gdGhlIGVuZAogICAgICBvcGVucmlzYzogdWFjY2VzczogRml4IHNw
YXJzZSBhZGRyZXNzIHNwYWNlIHdhcm5pbmdzCiAgICAgIG9wZW5yaXNjOiB1YWNjZXNzOiBVc2Ug
c3RhdGljIGlubGluZSBmdW5jdGlvbiBpbiBhY2Nlc3Nfb2sKICAgICAgb3BlbnJpc2M6IHVhY2Nl
c3M6IFJlbW92ZSB1bnVzZWQgbWFjcm8gX19hZGRyX29rCiAgICAgIG9wZW5yaXNjOiBzaWduYWw6
IEZpeCBzcGFyc2UgYWRkcmVzcyBzcGFjZSB3YXJuaW5ncwogICAgICBvcGVucmlzYzogdWFjY2Vz
czogQWRkIHVzZXIgYWRkcmVzcyBzcGFjZSBjaGVjayB0byBhY2Nlc3Nfb2sKCiBhcmNoL29wZW5y
aXNjL2luY2x1ZGUvYXNtL2lvLmggICAgICB8ICA5ICsrKy0KIGFyY2gvb3BlbnJpc2MvaW5jbHVk
ZS9hc20vdWFjY2Vzcy5oIHwgMjMgKysrKystLS0tLQogYXJjaC9vcGVucmlzYy9rZXJuZWwvc2V0
dXAuYyAgICAgICAgfCAgOCArKy0tCiBhcmNoL29wZW5yaXNjL2tlcm5lbC9zaWduYWwuYyAgICAg
ICB8IDE0ICsrKy0tLQogYXJjaC9vcGVucmlzYy9rZXJuZWwvc21wLmMgICAgICAgICAgfCA4NSAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tCiBhcmNoL29wZW5yaXNjL2tlcm5l
bC9zdGFja3RyYWNlLmMgICB8IDE4ICsrKysrKystCiBhcmNoL29wZW5yaXNjL2tlcm5lbC92bWxp
bnV4Lmxkcy5TICB8IDEyIC0tLS0tLQogYXJjaC9vcGVucmlzYy9tbS90bGIuYyAgICAgICAgICAg
ICAgfCAxNyArKysrKy0tLQogaW5jbHVkZS9hc20tZ2VuZXJpYy9pby5oICAgICAgICAgICAgfCAx
NiArKystLS0tCiBpbml0L2luaXRfdGFzay5jICAgICAgICAgICAgICAgICAgICB8ICAxICsKIDEw
IGZpbGVzIGNoYW5nZWQsIDE0NSBpbnNlcnRpb25zKCspLCA1OCBkZWxldGlvbnMoLSkKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGlu
ZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVj
b3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
