Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E1C521FECBE
	for <lists+openrisc@lfdr.de>; Thu, 18 Jun 2020 09:47:18 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2373D20B59;
	Thu, 18 Jun 2020 09:47:17 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by mail.librecores.org (Postfix) with ESMTP id 099FE207E4
 for <openrisc@lists.librecores.org>; Mon, 15 Jun 2020 23:34:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592256877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ItwxuioZVdA5XdCXR1QbAewm4+8qdb0KbH1lb+9ehrA=;
 b=hgoyP0QCf00W+IZsIDsy0FILdL4SJmXmsI6sLI20tnJ7vOUM2is0EfC/EHzr2t+rsbxOGy
 n2lYGF9GVah98oAi5/9Fy4JydicAYt6eL5kAeERMCgGFR86tG3x+cd/axQ7iwGGg17x8Uj
 jqtS4aq8QzFLdM6jhyaBFcziN2xzPl8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-ybzsl_KiMeCu7L6YtNMDUw-1; Mon, 15 Jun 2020 17:34:34 -0400
X-MC-Unique: ybzsl_KiMeCu7L6YtNMDUw-1
Received: by mail-qk1-f199.google.com with SMTP id p7so15246413qkf.21
 for <openrisc@lists.librecores.org>; Mon, 15 Jun 2020 14:34:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ItwxuioZVdA5XdCXR1QbAewm4+8qdb0KbH1lb+9ehrA=;
 b=PzP5rY6iuaNiMvbiOf+HcFpS2s7EMitDSuvE+NHFdF0sX34KGpi9rkF9sPTuV0ViCe
 aEXW85f9cn0rFjAKfMLZktw6O4uwym0AuB4eTIAQwUe1Ozdc99mo/kOM8MKE8VRVUDGM
 JyuA/oTjfh92x0lMnxZKicdVofuCWTG+5aY8scGhC4B515ARqaLNbbQPwYw0CWYDdRnS
 jznij63j+TK31vL4AsU/QvEAfMWktoihGgxklkZK9m/faxRsqtQff1NK5qRFf0IVxDWW
 6EspWiYa5E37SK/Np1eLLPSj5+maJVjBjcHtaBOf1yLi/uoDiIf1KsWI+H7xAe+sh1ax
 PSDA==
X-Gm-Message-State: AOAM530Es1A+qqiHzBrV16FLOtkzTNeFkKYEDYunA3AvfHTUKBjoiqyk
 uzTc5aBjm1KoFpPwm0yj2fTpj6GBptlXrtbqi2TZQD3KoeaEHGTT4yP0p3jcE6TH3VOGAbR+dqO
 SAXmDL8wg3KnPylAz3QDHLLTuIg==
X-Received: by 2002:a0c:ed31:: with SMTP id u17mr25540591qvq.117.1592256874174; 
 Mon, 15 Jun 2020 14:34:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0iHGiHde51cucRTUPE7NzfM/1jQRbNlFV4ChXmFExBXup/Ay4TPRKGywEeToUwHIWcL2Psg==
X-Received: by 2002:a0c:ed31:: with SMTP id u17mr25540552qvq.117.1592256873805; 
 Mon, 15 Jun 2020 14:34:33 -0700 (PDT)
Received: from xz-x1 ([2607:9880:19c0:32::2])
 by smtp.gmail.com with ESMTPSA id f30sm12961493qtb.9.2020.06.15.14.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 14:34:33 -0700 (PDT)
Date: Mon, 15 Jun 2020 17:34:31 -0400
From: Peter Xu <peterx@redhat.com>
To: Gerald Schaefer <gerald.schaefer@de.ibm.com>
Message-ID: <20200615213431.GC111927@xz-x1>
References: <20200610174811.44b94525@thinkpad> <20200610165023.GA67179@xz-x1>
MIME-Version: 1.0
In-Reply-To: <20200610165023.GA67179@xz-x1>
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

T24gV2VkLCBKdW4gMTAsIDIwMjAgYXQgMTI6NTA6MjNQTSAtMDQwMCwgUGV0ZXIgWHUgd3JvdGU6
Cj4gT24gV2VkLCBKdW4gMTAsIDIwMjAgYXQgMDU6NDg6MTFQTSArMDIwMCwgR2VyYWxkIFNjaGFl
ZmVyIHdyb3RlOgo+ID4gSGksCj4gCj4gSGksIEdlcmFsZCwKPiAKPiA+IAo+ID4gU29tZSBhcmNo
aXRlY3R1cmVzIGhhdmUgdGhlaXIgcGFnZSBmYXVsdCBhY2NvdW50aW5nIGNvZGUgaW5zaWRlIHRo
ZSBmYXVsdAo+ID4gcmV0cnkgbG9vcCwgYW5kIHJlbHkgb24gb25seSBnb2luZyB0aHJvdWdoIHRo
YXQgY29kZSBvbmNlLiBCZWZvcmUgY29tbWl0Cj4gPiA0MDY0Yjk4MjcwNjMgKCJtbTogYWxsb3cg
Vk1fRkFVTFRfUkVUUlkgZm9yIG11bHRpcGxlIHRpbWVzIiksIHRoYXQgd2FzCj4gPiBlbnN1cmVk
IGJ5IHRlc3RpbmcgZm9yIGFuZCBjbGVhcmluZyBGQVVMVF9GTEFHX0FMTE9XX1JFVFJZLgo+ID4g
Cj4gPiBUaGF0IGNvbW1pdCBoYWQgdG8gcmVtb3ZlIHRoZSBjbGVhcmluZyBvZiBGQVVMVF9GTEFH
X0FMTE9XX1JFVFJZIGZvciBhbGwKPiA+IGFyY2hpdGVjdHVyZXMsIGFuZCBpbnRyb2R1Y2VkIGEg
c3VidGxlIGNoYW5nZSB0byBwYWdlIGZhdWx0IGFjY291bnRpbmcKPiA+IGxvZ2ljIGluIHRoZSBh
ZmZlY3RlZCBhcmNocy4gSXQgaXMgbm93IHBvc3NpYmxlIHRvIGdvIHRocm91Z2ggdGhlIHJldHJ5
Cj4gPiBsb29wIG11bHRpcGxlIHRpbWVzLCBhbmQgdGhlIGFmZmVjdGVkIGFyY2hzIHdvdWxkIHRo
ZW4gYWNjb3VudCBtdWx0aXBsZQo+ID4gcGFnZSBmYXVsdHMgaW5zdGVhZCBvZiBqdXN0IG9uZS4K
PiA+IAo+ID4gVGhpcyB3YXMgZm91bmQgYnkgY29pbmNpZGVuY2UgaW4gczM5MCBjb2RlLCBhbmQg
YSBxdWljayBjaGVjayBzaG93ZWQgdGhhdAo+ID4gdGhlcmUgYXJlIHF1aXRlIGEgbG90IG9mIG90
aGVyIGFyY2hpdGVjdHVyZXMgdGhhdCBzZWVtIHRvIGJlIGFmZmVjdGVkIGluIGEKPiA+IHNpbWls
YXIgd2F5LiBJJ20gcHJlcGFyaW5nIGEgZml4IGZvciBzMzkwLCBieSBtb3ZpbmcgdGhlIGFjY291
bnRpbmcgYmVoaW5kCj4gPiB0aGUgcmV0cnkgbG9vcCwgc2ltaWxhciB0byB4ODYuIEl0IGlzIG5v
dCBjb21wbGV0ZWx5IHN0cmFpZ2h0LWZvcndhcmQsIHNvCj4gPiBJIGxlYXZlIHRoZSBmaXggZm9y
IG90aGVyIGFyY2hzIHRvIHRoZSByZXNwZWN0aXZlIG1haW50YWluZXJzLgo+IAo+IFNvcnJ5IGZv
ciBub3Qgbm90aWNpbmcgdGhpcyBiZWZvcmUuICBUaGUgYWNjb3VudGluZyBwYXJ0IHNob3VsZCBk
ZWZpbml0ZWx5IGJlCj4gcHV0IGF0IGxlYXN0IGludG8gYSBjaGVjayBhZ2FpbnN0IGZhdWx0X2Zs
YWdfYWxsb3dfcmV0cnlfZmlyc3QoKSB0byBtaW1pYyB3aGF0Cj4gd2FzIGRvbmUgYmVmb3JlLiAg
QW5kIEkgYWdyZWUgaXQgd291bGQgYmUgZXZlbiBiZXR0ZXIgdG8gcHV0IGl0IGFmdGVyIHRoZSBy
ZXRyeQo+IGxvZ2ljLCBzbyBpZiBhbnkgb2YgdGhlIHBhZ2UgZmF1bHRzIGdldHMgYSBtYWpvciBm
YXVsdCwgaXQnbGwgYmUgYWNjb3VudGVkIGFzIGEKPiBtYWpvciBmYXVsdCB3aGljaCBtYWtlcyBt
b3JlIHNlbnNlIHRvIG1lLCBqdXN0IGxpa2Ugd2hhdCB4ODYgaXMgZG9pbmcgbm93IHdpdGg6Cj4g
Cj4gCW1ham9yIHw9IGZhdWx0ICYgVk1fRkFVTFRfTUFKT1I7Cj4gCj4gSSdtIG5vdCBzdXJlIHdo
YXQncyB0aGUgcHJlZmVyZW5jZSBvZiB0aGUgYXJjaCBtYWludGFpbmVycywganVzdCBsZXQgbWUg
a25vdyBpZgo+IGl0J3MgcHJlZmVycmVkIHRvIHVzZSBhIHNpbmdsZSBzZXJpZXMgdG8gYWRkcmVz
cyB0aGlzIGlzc3VlIGZvciBhbGwgYWZmZWN0ZWQKPiBhcmNocyAob3IgdGhlIGFyY2hzIGJlc2lk
ZXMgczM5MCksIHRoZW4gSSdsbCBkby4KClRvIG1ha2Ugc3VyZSB0aGlzIHdvbid0IGZhbGwgdGhy
b3VnaCB0aGUgY3JhY2tzLi4uIEknbGwgZ2l2ZSBpdCBhIHNob3Qgd2l0aCBhCnNpbmdsZSBzZXJp
ZXMgdG8gYWRkcmVzcyB0aGlzIGlzc3VlIGZvciBhbGwgYXJjaHMuICBBbHRob3VnaCBpdCBtaWdo
dCBub3QgYmUKZWFzeSB0byBkbyBhY2NvdW50aW5nIGRpcmVjdGx5IGluIGhhbmRsZV9tbV9mYXVs
dCgpLCBpdCBtaWdodCBiZSBzdGlsbCBhIGNoYW5jZQp0byBpbnRyb2R1Y2UgYSBoZWxwZXIgc28g
dGhlIGFjY291bnRpbmcgY2FuIGJlIGRvbmUgaW4gZ2VuZXJhbCBjb2RlLgoKVGhhbmtzLAoKLS0g
ClBldGVyIFh1CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0
cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
