Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2A4A5441113
	for <lists+openrisc@lfdr.de>; Sun, 31 Oct 2021 22:47:04 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id CE2202421F;
	Sun, 31 Oct 2021 22:47:03 +0100 (CET)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mail.librecores.org (Postfix) with ESMTPS id 03DCB20F8F
 for <openrisc@lists.librecores.org>; Sun, 31 Oct 2021 22:47:03 +0100 (CET)
Received: by mail-pl1-f175.google.com with SMTP id r5so10361228pls.1
 for <openrisc@lists.librecores.org>; Sun, 31 Oct 2021 14:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=18WyyFAQUGbruLYK9ajldS+Kw06V6U9A1WE8DkWWPec=;
 b=DUTcfD8/4oehtWafT7DsVh/V2mbno06Jmztg+YRiZKuLWrKIseafs5sGZrNaUNJjM2
 sfbupBU+BDbmnC+RGYH9o3JZ5SiRhhxusoEP/IL2LRRv1W1NAQe6D7WJoH66ikI2f4zR
 A/wwYkWBV11Rmp7ajgiYs7RfMWb72Zh7nT7wDqNHZyzO4lJScAAAyzttlgtY6jRLE2Zx
 qa26vmYxb505s7ypbMMYYiA7Zks05YrPGA+VktjLGIFPwKpsY+Hd5DTxMew1HR/PlH6Q
 gYNGEmef8fA1VW7MTNXlZVTAaI1HeteGc8c+3lkLNhgcPvdyPv43N4wtM0P0Lc2CZK3y
 rRaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=18WyyFAQUGbruLYK9ajldS+Kw06V6U9A1WE8DkWWPec=;
 b=y101jyqASrYwmwF4Ro7TQo84jhQJLs6+jloGpFmRdLg/viOadxA0cQqxat/GW5VMCu
 SglhKewyZResQh+YpS/ZUU4x4HCNFGsncyDSHicEzUw1lwiNZXyJUxFLP8b5LHdiIkSq
 IVaj8plc2OLqT1TeYzttTBS6yry9xIfzhrqauqAZF0YdniWp46SRnEChvFA2YB2D9e/5
 BB7BePKzjVBWnwBTlEzGcYYK95OXpDNBQCBk6zcJuThEW1j6fr+tQUOA2hPpIjd2kY8v
 ZEBqoj09chXCqTrgGQG7WmNhAxZrydJLWWEg06AJGm9pNnZLQZiyS9No4EwmplQy4N/b
 fWDQ==
X-Gm-Message-State: AOAM533+nGDAq9hOKs57YGF6CZjcMYlFqP4VZ3USgeMg12BXca/iKQRt
 KeqUt6PTL6NH8YAyoRd7Br0=
X-Google-Smtp-Source: ABdhPJxiSc7cUum1ChRRjbUUjtWG5QeulYy9g49BdawSEH22VdsilhkCv0NrcNmnOa1ZztH9zHtefQ==
X-Received: by 2002:a17:90a:be10:: with SMTP id
 a16mr23379196pjs.133.1635716821355; 
 Sun, 31 Oct 2021 14:47:01 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id h4sm16080871pjm.14.2021.10.31.14.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Oct 2021 14:47:00 -0700 (PDT)
Date: Mon, 1 Nov 2021 06:46:58 +0900
From: Stafford Horne <shorne@gmail.com>
To: Jan Henrik Weinstock <jan.weinstock@rwth-aachen.de>
Message-ID: <YX8O0ix3MyOGQnqq@antec>
References: <e35018e8-a15b-550d-cc3e-6b6d045f1b52@rwth-aachen.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e35018e8-a15b-550d-cc3e-6b6d045f1b52@rwth-aachen.de>
Subject: Re: [OpenRISC] OpenRISC SMP kernels broken after 5.8?
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
Cc: openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBPY3QgMjYsIDIwMjEgYXQgMTA6NDM6NDVQTSArMDIwMCwgSmFuIEhlbnJpayBXZWlu
c3RvY2sgd3JvdGU6Cj4gSGkgYWxsLAo+IAo+IEkgcmVjZW50bHkgdHJpZWQgdG8gdXBkYXRlIHRo
ZSBrZXJuZWwgbXkgc2ltdWxhdG9yWzFdIGlzIHJ1bm5pbmcgdG8gNS4xMCwKPiBidXQgSSBub3Rp
Y2VkIHRoZSBuZXdlciBrZXJuZWxzICg+NS44KSBhbGwgcGFuaWMgaW4gZmx1c2hfdGxiX3BhZ2Vb
Ml0sCj4gYmVjYXVzZSBpdCBpcyBjYWxsZWQgd2l0aCB2bWEgPT0gTlVMTCBmcm9tIGZsdXNoX3Rs
Yl9rZXJuZWxfcmFuZ2VbM10uCj4gTG9va2luZyBhdCB0aGUgY29kZSwgSSBkbyBub3Qgc2VlIGhv
dyB0aGlzIGNvdWxkIHdvcmsgZm9yIGFueSBTTVAga2VybmVsCj4gKGhvd2V2ZXIsIGZvciBub24t
U01QLCB3ZSBjYWxsIGxvY2FsX3RsYl9mbHVzaF9wYWdlWzRdLCB3aGVyZSB3ZSBkbyBub3QgdXNl
Cj4gdm1hLCBzbyBJIGd1ZXNzIGl0cyBmaW5lIHRoZXJlKS4gQW55IGlkZWFzPwoKSGkgSmFuLAoK
KHNvcnJ5IGZvciBsYXRlIHJlcGx5LCBJIG5lZWQgdG8gZml4IG15IGZpbHRlcnMpCgpBcmUgeW91
IHJ1bm5pbmcgb24gYSBTTVAgbWFjaGluZSBvciBhcmUgeW91IHJ1bm5pbmcgU01QIGtlcm5lbCBv
biBhIHNpbmdsZSBDUFUKd2l0aCBubyBvbXBpYyBkZXZpY2U/CgpJIGhhdmVuJ3QgaGFkIGlzc3Vl
cyB3aGVuIHJ1bm5pbmcgdGhlIFNNUCBrZXJuZWxzIG9uIHNpbmdsZSBDUFUgZGV2aWNlcywKaG93
ZXZlciwgSSBjYW4ndCByZWNhbGwgaG93IHJlY2VudCB0aGF0IGlzLgoKSSBkaWQgbWFrZSBhIHBh
dGNoIHRvIHRoaXMgYXJvdW5kIDUuMTAsIHNvIEkgYW0gcHJldHR5IHVzZXIgaXQgd2FzIHdvcmtp
bmcgYXQKdGhpcyBwb2ludC4gIFRoZSByZWFzb24gYWRkZWQgdGhpcyBwYXRjaCB3YXMgYmVjYXVz
ZSBJIG5vdGljZWQgc2ltdWxhdG9ycyB3ZXJlCnNwZW5kaW5nIGEgbG90IG9mIHRpbWUsIH45MCUr
LCBpbiBUTEIgZmx1c2hlcyBJIGZpZ3VyZWQgdGhhdCByZWR1Y2luZyB0aGUgd29yawpkb25lIGZv
ciBUTEIgZmx1c2hlcyB3b3VsZCBpbXByb3ZlIHBlcmZvcm1hbmNlLCBhbmQgaXQgZGlkLgoKVGhl
IHBhdGNoOgoKIC0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvdG9ydmFsZHMvbGludXguZ2l0L2NvbW1pdC8/aD1jMjhiMjc0MTZkYTkKCkJ1dCBpdCBsb29r
cyBsaWtlIHRoaXMgaXMgd2hhdCBpbnRyb2R1Y2VkIHRoZSBpc3N1ZS4gIFNvbWVob3cgdGhpcyBz
bGlwcGVkCnRocm91Z2guICBJIHRoaW5rIGEgcGF0Y2ggbGlrZSB0aGUgZm9sbG93aW5nIHdvdWxk
IGhlbHAgZm9yIG5vdywgSSBjYW5ub3QgZWFzaWx5CnRlc3Qgbm93IGR1ZSB0byBteSBlbnZpcm9u
bWVudCBiZWluZyBvY2N1cGllZCBieSBzb21lIGxvbmcgcnVubmluZyB0ZXN0cy4gIEFueQpzdWdn
ZXN0aW9ucz8KCkJhc2ljYWxseSB0aGUgaWRlYSBpcywgd2Ugb25seSBuZWVkIHRoZSBWTUEgdG8g
ZmlndXJlIG91dCB3aGljaCBDUFUncyB0byBmbHVzaAp0aGUgcmFuZ2Ugb24uICBXaGVuIHdlIHBh
c3MgaW4gTlVMTCBpdCBtZWFucyBpdHMgYSBrZXJuZWwgZmx1c2ggYW5kIHdlIHNob3VsZApmbHVz
aCBvbiBhbGwgQ1BVJ3MuICBUaGVyZSBtYXkgYmUgc29tZXRoaW5nIG1vcmUgZWZmaWNpZW50ICht
YXliZSB1c2luZwppbml0X21tKSwgYnV0IHRoaXMgaXMgYWxsIEkgY2FuIHRoaW5rIG9mIHRoYXQg
aXMgc2FmZS4KCi1TdGFmZm9yZAoKZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJpc2Mva2VybmVsL3Nt
cC5jIGIvYXJjaC9vcGVucmlzYy9rZXJuZWwvc21wLmMKaW5kZXggNDE1ZTIwOTczMmEzLi5jZjUw
NzliZDhmNDMgMTAwNjQ0Ci0tLSBhL2FyY2gvb3BlbnJpc2Mva2VybmVsL3NtcC5jCisrKyBiL2Fy
Y2gvb3BlbnJpc2Mva2VybmVsL3NtcC5jCkBAIC0zMjAsNyArMzIwLDkgQEAgdm9pZCBmbHVzaF90
bGJfcGFnZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgdW5zaWduZWQKbG9uZyB1YWRkcikK
IHZvaWQgZmx1c2hfdGxiX3JhbmdlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLAogICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25nIGVuZCkKIHsK
LSAgICAgICBzbXBfZmx1c2hfdGxiX3JhbmdlKG1tX2NwdW1hc2sodm1hLT52bV9tbSksIHN0YXJ0
LCBlbmQpOworICAgICAgIHN0cnVjdCBjcHVtYXNrICpjbWFzayA9ICh2bWEgPT0gTlVMTCkgPyBj
cHVfb25saW5lX21hc2sKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIDogbW1fY3B1bWFzayh2bWEtPnZtX21tKTsKKyAgICAgICBzbXBfZmx1c2hfdGxiX3Jhbmdl
KGNtYXNrLCBzdGFydCwgZW5kKTsKIH0KIAogLyogSW5zdHJ1Y3Rpb24gY2FjaGUgaW52YWxpZGF0
ZSAtIHBlcmZvcm1lZCBvbiBlYWNoIGNwdSAqLwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3Rz
LmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3Bl
bnJpc2MK
