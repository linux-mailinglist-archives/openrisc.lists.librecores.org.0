Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id BD5F31FECB9
	for <lists+openrisc@lfdr.de>; Thu, 18 Jun 2020 09:47:15 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 59BC8202F2;
	Thu, 18 Jun 2020 09:47:13 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by mail.librecores.org (Postfix) with ESMTP id 6B1D920587
 for <openrisc@lists.librecores.org>; Wed, 10 Jun 2020 18:50:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591807832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EMwUauau342Zml1K34QLPe12sp1DuwpV44r+JLoVGLk=;
 b=cvlRshgqN4U2njt6gccCrEuSz9QgeKUPYt646A/XEHMOIjQ/pPZRwCICSOG3nZffvltoZ/
 sFULAuF37NF30SV/HmTyRYgnFCGs35lDZ0Oq29ZREoenXLVzaN8lLcAkDMgJRkBnbGFIe1
 bBBsVxT81owG3p081uIgW68Z6T/Pakc=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-nT4AkuQPNz-TRD9K3UtFGw-1; Wed, 10 Jun 2020 12:50:28 -0400
X-MC-Unique: nT4AkuQPNz-TRD9K3UtFGw-1
Received: by mail-qv1-f71.google.com with SMTP id f18so2282964qvr.22
 for <openrisc@lists.librecores.org>; Wed, 10 Jun 2020 09:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EMwUauau342Zml1K34QLPe12sp1DuwpV44r+JLoVGLk=;
 b=SXoe2+PHvMPiViDHdStWQ3L70v85kNXTonMiOa4S+xwlwOVgh6+Qz2gYKXHmv4oaRJ
 eXX+/bTAipDovzisPAvDmP0eYkjvfWNma3D27lT2b9UI5PPkwqkiWJ+957+TW27XM0f/
 qOkIDA546fcIMYA1PIHkvCUmB6fU0Wyk9PPwsLUmPN6t4GLpmtgSEXYNaaUzfw/AurpO
 s17eFHUsFsR0zd55qIG0YUohyWqlhIaTZfdXykyed5PYBVJvUpFGoQkr4t8Xx1dxUCVS
 JSY0etEoVen9S6UvpGz9mUpC7WTcvw8O4iBuJsbeeiL/HmuvoEJSD/vDV4ZqY40hi+LA
 r5kA==
X-Gm-Message-State: AOAM532T1N7oO0HkpCh1VnWV+b/zMA+qvhujQIYSpXE/RP0uwiXjYmjE
 CkUv+874jI9EMLyiLVbyw7sUGu7o16iFw/2vLKlEZx18Zm+TV+/D5KwTFpfuxe0oMrqmsJ2vJxx
 bqRVU2m9t8IaPHRDxcWIH/m2tAw==
X-Received: by 2002:a37:9cc7:: with SMTP id f190mr3987588qke.236.1591807826927; 
 Wed, 10 Jun 2020 09:50:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyn20TLNz7hD3Ni4blZzJN/2PX0jI8mrO6z2/UHNbD+ObHKXkY/kSbOK73eCMc/XFP0Ereokw==
X-Received: by 2002:a37:9cc7:: with SMTP id f190mr3987535qke.236.1591807826580; 
 Wed, 10 Jun 2020 09:50:26 -0700 (PDT)
Received: from xz-x1 ([2607:9880:19c0:32::2])
 by smtp.gmail.com with ESMTPSA id 207sm149672qki.134.2020.06.10.09.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 09:50:25 -0700 (PDT)
Date: Wed, 10 Jun 2020 12:50:23 -0400
From: Peter Xu <peterx@redhat.com>
To: Gerald Schaefer <gerald.schaefer@de.ibm.com>
Message-ID: <20200610165023.GA67179@xz-x1>
References: <20200610174811.44b94525@thinkpad>
MIME-Version: 1.0
In-Reply-To: <20200610174811.44b94525@thinkpad>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Mailman-Approved-At: Thu, 18 Jun 2020 09:47:10 +0200
Subject: Re: [OpenRISC] Possible duplicate page fault accounting on some
 archs after commit 4064b9827063
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mips@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-hexagon@vger.kernel.org,
 Ley Foon Tan <ley.foon.tan@intel.com>, Andrea Arcangeli <aarcange@redhat.com>,
 linux-xtensa@linux-xtensa.org, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>, Nick Hu <nickhu@andestech.com>,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBKdW4gMTAsIDIwMjAgYXQgMDU6NDg6MTFQTSArMDIwMCwgR2VyYWxkIFNjaGFlZmVy
IHdyb3RlOgo+IEhpLAoKSGksIEdlcmFsZCwKCj4gCj4gU29tZSBhcmNoaXRlY3R1cmVzIGhhdmUg
dGhlaXIgcGFnZSBmYXVsdCBhY2NvdW50aW5nIGNvZGUgaW5zaWRlIHRoZSBmYXVsdAo+IHJldHJ5
IGxvb3AsIGFuZCByZWx5IG9uIG9ubHkgZ29pbmcgdGhyb3VnaCB0aGF0IGNvZGUgb25jZS4gQmVm
b3JlIGNvbW1pdAo+IDQwNjRiOTgyNzA2MyAoIm1tOiBhbGxvdyBWTV9GQVVMVF9SRVRSWSBmb3Ig
bXVsdGlwbGUgdGltZXMiKSwgdGhhdCB3YXMKPiBlbnN1cmVkIGJ5IHRlc3RpbmcgZm9yIGFuZCBj
bGVhcmluZyBGQVVMVF9GTEFHX0FMTE9XX1JFVFJZLgo+IAo+IFRoYXQgY29tbWl0IGhhZCB0byBy
ZW1vdmUgdGhlIGNsZWFyaW5nIG9mIEZBVUxUX0ZMQUdfQUxMT1dfUkVUUlkgZm9yIGFsbAo+IGFy
Y2hpdGVjdHVyZXMsIGFuZCBpbnRyb2R1Y2VkIGEgc3VidGxlIGNoYW5nZSB0byBwYWdlIGZhdWx0
IGFjY291bnRpbmcKPiBsb2dpYyBpbiB0aGUgYWZmZWN0ZWQgYXJjaHMuIEl0IGlzIG5vdyBwb3Nz
aWJsZSB0byBnbyB0aHJvdWdoIHRoZSByZXRyeQo+IGxvb3AgbXVsdGlwbGUgdGltZXMsIGFuZCB0
aGUgYWZmZWN0ZWQgYXJjaHMgd291bGQgdGhlbiBhY2NvdW50IG11bHRpcGxlCj4gcGFnZSBmYXVs
dHMgaW5zdGVhZCBvZiBqdXN0IG9uZS4KPiAKPiBUaGlzIHdhcyBmb3VuZCBieSBjb2luY2lkZW5j
ZSBpbiBzMzkwIGNvZGUsIGFuZCBhIHF1aWNrIGNoZWNrIHNob3dlZCB0aGF0Cj4gdGhlcmUgYXJl
IHF1aXRlIGEgbG90IG9mIG90aGVyIGFyY2hpdGVjdHVyZXMgdGhhdCBzZWVtIHRvIGJlIGFmZmVj
dGVkIGluIGEKPiBzaW1pbGFyIHdheS4gSSdtIHByZXBhcmluZyBhIGZpeCBmb3IgczM5MCwgYnkg
bW92aW5nIHRoZSBhY2NvdW50aW5nIGJlaGluZAo+IHRoZSByZXRyeSBsb29wLCBzaW1pbGFyIHRv
IHg4Ni4gSXQgaXMgbm90IGNvbXBsZXRlbHkgc3RyYWlnaHQtZm9yd2FyZCwgc28KPiBJIGxlYXZl
IHRoZSBmaXggZm9yIG90aGVyIGFyY2hzIHRvIHRoZSByZXNwZWN0aXZlIG1haW50YWluZXJzLgoK
U29ycnkgZm9yIG5vdCBub3RpY2luZyB0aGlzIGJlZm9yZS4gIFRoZSBhY2NvdW50aW5nIHBhcnQg
c2hvdWxkIGRlZmluaXRlbHkgYmUKcHV0IGF0IGxlYXN0IGludG8gYSBjaGVjayBhZ2FpbnN0IGZh
dWx0X2ZsYWdfYWxsb3dfcmV0cnlfZmlyc3QoKSB0byBtaW1pYyB3aGF0CndhcyBkb25lIGJlZm9y
ZS4gIEFuZCBJIGFncmVlIGl0IHdvdWxkIGJlIGV2ZW4gYmV0dGVyIHRvIHB1dCBpdCBhZnRlciB0
aGUgcmV0cnkKbG9naWMsIHNvIGlmIGFueSBvZiB0aGUgcGFnZSBmYXVsdHMgZ2V0cyBhIG1ham9y
IGZhdWx0LCBpdCdsbCBiZSBhY2NvdW50ZWQgYXMgYQptYWpvciBmYXVsdCB3aGljaCBtYWtlcyBt
b3JlIHNlbnNlIHRvIG1lLCBqdXN0IGxpa2Ugd2hhdCB4ODYgaXMgZG9pbmcgbm93IHdpdGg6CgoJ
bWFqb3IgfD0gZmF1bHQgJiBWTV9GQVVMVF9NQUpPUjsKCkknbSBub3Qgc3VyZSB3aGF0J3MgdGhl
IHByZWZlcmVuY2Ugb2YgdGhlIGFyY2ggbWFpbnRhaW5lcnMsIGp1c3QgbGV0IG1lIGtub3cgaWYK
aXQncyBwcmVmZXJyZWQgdG8gdXNlIGEgc2luZ2xlIHNlcmllcyB0byBhZGRyZXNzIHRoaXMgaXNz
dWUgZm9yIGFsbCBhZmZlY3RlZAphcmNocyAob3IgdGhlIGFyY2hzIGJlc2lkZXMgczM5MCksIHRo
ZW4gSSdsbCBkby4KClRoYW5rcyEKCi0tIApQZXRlciBYdQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVND
QGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGlu
Zm8vb3BlbnJpc2MK
