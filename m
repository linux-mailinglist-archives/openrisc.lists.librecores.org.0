Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B94AA355DA6
	for <lists+openrisc@lfdr.de>; Tue,  6 Apr 2021 23:08:38 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 94F5020417;
	Tue,  6 Apr 2021 23:08:37 +0200 (CEST)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mail.librecores.org (Postfix) with ESMTPS id E3F8220E30
 for <openrisc@lists.librecores.org>; Tue,  6 Apr 2021 18:56:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=2543; q=dns/txt; s=iport;
 t=1617728176; x=1618937776;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cZx99TFaCLts0bYspySXDfTAZA7sX1ryp1fo4EAJaBw=;
 b=R4llpUe0760jIGN8ajhuGiyQ7AjZYDFP/5B615OEasNtvWFmppzuIAW3
 VrXjn6ragzVpRW3qx6K7svEY9uYFl6mkjVVBmPY7xNyWJyQ+e3/gxLyR4
 wdkyvt9igNCdF816s3S5UUiZ40gU303G8bibEWdCEFcS/weFez4fK01RN g=;
X-IPAS-Result: =?us-ascii?q?A0AWAgAIkmxgmIMNJK1aHAEBAQEBAQcBARIBAQQEAQFAg?=
 =?us-ascii?q?VKDeAE5lkYDkAwWilqBaAsBAQENAQE0BAEBhFACgXYCJTgTAgMBAQEDAgMBA?=
 =?us-ascii?q?QEBAQUBAQECAQYEFAEBAQEBAQEBaIVdhkUBBTo/EAsSBhUZPA0OBoMEgwirV?=
 =?us-ascii?q?HWBNIEBiB+BRCKBF41NJxyBSUKENT6DeYEGhTgEggRCAS0Qg3GQQo1gnCmDF?=
 =?us-ascii?q?YEmm0cyEKRhLbgRAgQGBQIWgWshgVszGggbFYMlTxkOjjiOUCEDZwIGCgEBA?=
 =?us-ascii?q?wmNRAEB?=
IronPort-HdrOrdr: A9a23:az4voqCHQftEAsTlHekR55DYdL4zR+YMi2QD/UoZc3NoW+afkN
 2jm+le+B/vkTAKWGwhn9foAtjkfVr385lp7Y4NeYqzRQWOghrLEKhO5ZbvqgeLJwTQ7ehYvJ
 0MT4FfD5nKAUF+nYLG5mCDYrId6f2m1IztuuvE1XdqSmhRGsJdxiN0EBySHEEzZCQuP/sEPa
 GR7MZGuDasEE5/Bq+GL0IIUOTZq9rAmIiOW347LiQ64wqDhy7A0tDHOiWfty1zbxp/hZE/7G
 PCjwv1ooKkvv3T8G6760bjq7JLhdDm1txPQPapt/FQADDthgG0Db4RPIG/gA==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.82,201,1613433600"; d="scan'208";a="693085054"
Received: from alln-core-1.cisco.com ([173.36.13.131])
 by alln-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 06 Apr 2021 16:56:13 +0000
Received: from zorba ([10.24.14.212])
 by alln-core-1.cisco.com (8.15.2/8.15.2) with ESMTPS id 136GuAm7015894
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 6 Apr 2021 16:56:12 GMT
Date: Tue, 6 Apr 2021 09:56:10 -0700
From: Daniel Walker <danielwa@cisco.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <20210406165610.GV2469518@zorba>
References: <cover.1617375802.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1617375802.git.christophe.leroy@csgroup.eu>
X-Outbound-SMTP-Client: 10.24.14.212, [10.24.14.212]
X-Outbound-Node: alln-core-1.cisco.com
X-Mailman-Approved-At: Tue, 06 Apr 2021 23:08:34 +0200
Subject: Re: [OpenRISC] [PATCH v4 00/20] Implement GENERIC_CMDLINE
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
Cc: linux-arch@vger.kernel.org, robh@kernel.org, microblaze <monstr@monstr.eu>,
 daniel@gimpelevich.san-francisco.ca.us, arnd@kernel.org,
 linux-sh@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-xtensa@linux-xtensa.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 nios2 <ley.foon.tan@intel.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org,
 devicetree@vger.kernel.org, openrisc@lists.librecores.org,
 linux-hexagon@vger.kernel.org, sparclinux@vger.kernel.org,
 akpm@linux-foundation.org, will@kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gRnJpLCBBcHIgMDIsIDIwMjEgYXQgMDM6MTg6MDFQTSArMDAwMCwgQ2hyaXN0b3BoZSBMZXJv
eSB3cm90ZToKPiBUaGUgcHVycG9zZSBvZiB0aGlzIHNlcmllcyBpcyB0byBpbXByb3ZlIGFuZCBl
bmhhbmNlIHRoZQo+IGhhbmRsaW5nIG9mIGtlcm5lbCBib290IGFyZ3VtZW50cy4KPiAKPiBDdXJy
ZW50IHNpdHVhdGlvbiBpcyB0aGF0IG1vc3QgaWYgbm90IGFsbCBhcmNoaXRlY3R1cmVzIGFyZSB1
c2luZwo+IHNpbWlsYXIgb3B0aW9ucyB0byBkbyBzb21lIG1hbnVwdWxhdGlvbiBvbiBjb21tYW5k
IGxpbmUgYXJndW1lbnRzOgo+IC0gUHJlcGVuZCBidWlsdC1pbiBhcmd1bWVudHMgaW4gZnJvbnQg
b2YgYm9vdGxvYWRlciBwcm92aWRlZCBhcmd1bWVudHMKPiAtIEFwcGVuZCBidWlsdC1pbiBhcmd1
bWVudHMgYWZ0ZXIgYm9vdGxvYWRlciBwcm92aWRlZCBhcmd1bWVudHMKPiAtIFJlcGxhY2UgYm9v
dGxvYWRlciBwcm92aWRlZCBhcmd1bWVudHMgYnkgYnVpbHQtaW4gYXJndW1lbnRzCj4gLSBVc2Ug
YnVpbHQtaW4gYXJndW1lbnRzIHdoZW4gbm9uZSBpcyBwcm92aWRlZCBieSBib290bG9hZGVyLgo+
IAo+IE9uIHNvbWUgYXJjaGl0ZWN0dXJlcywgYWxsIHRoZSBvcHRpb25zIGFyZSBwb3NzaWJsZS4g
T24gb3RoZXIgb25lcywKPiBvbmx5IGEgc3Vic2V0IGFyZSBhdmFpbGFibGUuCj4gCj4gVGhlIHB1
cnBvc2Ugb2YgdGhpcyBzZXJpZXMgaXMgdG8gcmVmYWN0b3IgYW5kIGVuaGFuY2UgdGhlCj4gaGFu
ZGxpbmcgb2Yga2VybmVsIGJvb3QgYXJndW1lbnRzIHNvIHRoYXQgZXZlcnkgYXJjaGl0ZWN0dXJl
IGNhbgo+IGJlbmVmaXQgZnJvbSBhbGwgcG9zc2liaWxpdGllcy4KPiAKPiBJdCBpcyBmaXJzdCBm
b2N1c3NlZCBvbiBwb3dlcnBjIGJ1dCBhbHNvIGV4dGVuZHMgdGhlIGNhcGFiaWxpdHkKPiBmb3Ig
b3RoZXIgYXJjaGVzLgo+IAo+IFRoZSB3b3JrIGhhcyBiZWVuIGZvY3Vzc2VkIG9uIG1pbmltaXNp
bmcgdGhlIGNodXJuIGluIGFyY2hpdGVjdHVyZXMKPiBieSBrZWVwaW5nIHRoZSBtb3N0IGNvbW1v
bmx5IHVzZWQgbmFtaW5ncy4KPiAKPiBNYWluIGNoYW5nZXMgaW4gVjQ6Cj4gLSBJbmNsdWRlZCBw
YXRjaCBmcm9tIERhbmllbCB0byByZXBsYWNlIHBvd2VycGMncyBzdHJjcHkoKSBieSBzdHJsY3B5
KCkKPiAtIFVzaW5nIHN0cmxjcHkoKSBpbnN0ZWFkIG9mIHplcm9pbmcgZmlyc3QgY2hhciArIHN0
cmxjYXQoKSAoaWRlYSB0YWtlbiBmcm0gRGFuaWVsJ3Mgc2VyaWVzKQo+IC0gUmV3b3JrZWQgdGhl
IGNvbnZlcnRpb24gb2YgRUZJIHdoaWNoIHdhcyB3cm9uZyBpbiBWMwo+IC0gQWRkZWQgInRvbyBs
b25nIiBjb21tYW5kIGxpbmUgaGFuZGxpbmcKPiAtIENoYW5nZWQgY21kbGluZSBtYWNybyBpbnRv
IGEgZnVuY3Rpb24KPiAtIERvbmUgYSBmZXcgZml4ZXMgaW4gYXJjaCAoTklPUzIsIFNILCBBUk0p
Cj4gLSBUYWtlbiBjb21tZW50cyBpbnRvIGFjY291bnQgKHNlZSBpbmRpdmlkdWFsIHJlc3BvbnNl
cyBmb3IgZGV0YWlscykKPiAtIFRlc3RlZCBvbiBwb3dlcnBjLCBidWlsZCB0ZXN0ZWQgb24gQVJN
NjQsIFg4Nl82NC4KPiAKCldoeSBzdWJtaXQgeW91ciBjaGFuZ2VzID8gTXkgY2hhbmdlcyBoYXZl
IGJlZW4gYXJvdW5kIGZvciBhbG1vc3QgMTAgeWVhcnMsIGFuZAphcmUgbW9yZSB3aWRlbHkgdXNl
ZC4gWW91ciBjaGFuZ2VzIGFyZSB2ZXJ5IG5ldyBhbmQgdW5zdGFibGUsIGJ1dCBkb24ndCByZWFs
bHkKc29sdmUgdGhlIG5lZWRzIG9mIHBlb3BsZSB1c2luZyBteSBzZXJpZXMuCgpJJ3ZlIHRyaWVk
IHRvIHdvcmsgd2l0aCB5b3UgYW5kIEkgdGFrZSBjb21tZW50cyBmcm9tIHlvdSwgYnV0IHlldCB5
b3UgaW5zaXN0IHRvCnN1Ym1pdCB5b3VyIG93biBzZXJpZXMuCgpJIHdvdWxkIHN1Z2dlc3QgdGhp
cyBpc24ndCBnb2luZyB0byBnbyBhbnlwbGFjZSB1bmxlc3Mgd2Ugd29yayB0b2dldGhlci4KCkkg
Y2FuJ3QgcmVhbGx5IHN1cHBvcnQgeW91ciBjaGFuZ2VzIGJlY2F1c2UsIGhvbmVzdGx5LCB5b3Vy
IGNoYW5nZXMgYXJlIHJlYWxseQp1Z2x5IGFuZCB0aGV5IGp1c3QgbG9vayBtb3JlIGFuZCBtb3Jl
IGxpa2UgbXkgY2hhbmdlcyB3aXRoIGV2ZXJ5IHBhc3NpbmcKaXRlcmF0aW9uIC4uIEFzIHRoZSBt
YXR1cml0eSBvZiB5b3VyIGNoYW5nZXMgY29udGludWUgdGhleSB3aWxsIGp1c3QgYmVjb21lIG15
CmNoYW5nZSBzZXQuCgpJJ3ZlIGJlZW4gdGhydSBldmVyeSBpdGVyYXRpb24gb2YgdGhlc2UgY2hh
bmdlcywgYW5kIEkgc2VlIHRob3NlIGF0dGVtcHRzIGluCnlvdXIgY2hhbmdlcy4gRXZlcnl0aGlu
ZyBkaWZmZXJlbnQgaW4geW91ciBjaGFuZ2VzIEkndmUgdHJpZWQsIGFuZCBmb3VuZCBub3QgdG8K
YmUgdXNlZnVsLCB0aGVuIGl0IGZhbGxzIGF3YXkgaW4gbGF0ZXIgaXRlcmF0aW9ucy4KCldoZW4g
eW91IGdpdmUgbWUgY29tbWVudHMgb24gc29tZXRoaW5nIHdoaWNoIEkgaGF2ZW4ndCB0cmllZCBJ
IHR5cGljYWxseQppbmNvcnBvcmF0ZSBpdC4KCkRhbmllbApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NA
bGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5m
by9vcGVucmlzYwo=
