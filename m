Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (unknown [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 623C11C05DE
	for <lists+openrisc@lfdr.de>; Thu, 30 Apr 2020 21:10:10 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1FC2620B1B;
	Thu, 30 Apr 2020 21:09:50 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 6DD90206DB
 for <openrisc@lists.librecores.org>; Wed, 29 Apr 2020 18:29:55 +0200 (CEST)
Received: from kernel.org (unknown [87.70.161.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4622D2073E;
 Wed, 29 Apr 2020 16:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588177793;
 bh=0WLAW3RaOJqIeviw62D+1sbYIwOWpLfyLvSFzBZ/1RI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bX4UmI7YY7MbsM77fB95EYPVrNNMyR/EBLX8BbChEAsts+ChnIZnmlY0s5J3v1ES0
 21Fy8E5o4VRlcz1gU4A9jUkztNYslFtzPSQ8j0i0q67mtFD7Z5RqJBXEJMqoU2jMSR
 FjIyjtx7U4phJ9zZIH0PgtWqCfz1Qfs4hHO4D1HM=
Date: Wed, 29 Apr 2020 19:29:17 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Message-ID: <20200429162917.GL14260@kernel.org>
References: <20200429121126.17989-1-rppt@kernel.org>
 <20200429121126.17989-17-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200429121126.17989-17-rppt@kernel.org>
X-Mailman-Approved-At: Thu, 30 Apr 2020 21:09:13 +0200
Subject: [OpenRISC] [PATCH v2.5 16/20] mm: remove early_pfn_in_nid() and
 CONFIG_NODES_SPAN_OTHER_NODES
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, Mike Rapoport <rppt@linux.ibm.com>,
 Greg Ungerer <gerg@linux-m68k.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-c6x-dev@linux-c6x.org, Baoquan He <bhe@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-arm-kernel@lists.infradead.org, Mark Salter <msalter@redhat.com>,
 Matt Turner <mattst88@gmail.com>, linux-mips@vger.kernel.org,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, Tony Luck <tony.luck@intel.com>,
 Qian Cai <cai@lca.pw>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Hoan Tran <Hoan@os.amperecomputing.com>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Brian Cain <bcain@codeaurora.org>, Nick Hu <nickhu@andestech.com>,
 linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 Richard Weinberger <richard@nod.at>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBBcHIgMjksIDIwMjAgYXQgMDM6MTE6MjJQTSArMDMwMCwgTWlrZSBSYXBvcG9ydCB3
cm90ZToKPiBGcm9tOiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gCj4gVGhl
IGNvbW1pdCBmNDdhYzA4OGM0MDYgKCJtbTogbWVtbWFwX2luaXQ6IGl0ZXJhdGUgb3ZlciBtZW1i
bG9jayByZWdpb25zCj4gcmF0aGVyIHRoYXQgY2hlY2sgZWFjaCBQRk4iKSBtYWRlIGVhcmx5X3Bm
bl9pbl9uaWQoKSBvYnNvbGV0ZSBhbmQgc2luY2UKPiBDT05GSUdfTk9ERVNfU1BBTl9PVEhFUl9O
T0RFUyBpcyBvbmx5IHVzZWQgdG8gcGljayBhIHN0dWIgb3IgYSByZWFsCj4gaW1wbGVtZW50YXRp
b24gb2YgZWFybHlfcGZuX2luX25pZCgpIGl0IGlzIGFsc28gbm90IG5lZWRlZCBhbnltb3JlLgo+
IAo+IFJlbW92ZSBib3RoIGVhcmx5X3Bmbl9pbl9uaWQoKSBhbmQgdGhlIENPTkZJR19OT0RFU19T
UEFOX09USEVSX05PREVTLgo+IAo+IENvLWRldmVsb3BlZC1ieTogSG9hbiBUcmFuIDxIb2FuQG9z
LmFtcGVyZWNvbXB1dGluZy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSG9hbiBUcmFuIDxIb2FuQG9z
LmFtcGVyZWNvbXB1dGluZy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTWlrZSBSYXBvcG9ydCA8cnBw
dEBsaW51eC5pYm0uY29tPgo+IC0tLQoKSGVyZSdzIHRoZSB2ZXJzaW9uIHdpdGggdGhlIHVwZGF0
ZWQgY2hhbmdlbG9nOgoKRnJvbSA3NDE1ZDFhOWI3MDAwYzZlZWNkOWY2Mzc3MDU5MmU0ZDRhOGQy
NDYzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBNaWtlIFJhcG9wb3J0IDxycHB0QGxp
bnV4LmlibS5jb20+CkRhdGU6IFNhdCwgMTEgQXByIDIwMjAgMTE6MjY6NDkgKzAzMDAKU3ViamVj
dDogW1BBVENIIHYyLjVdIG1tOiByZW1vdmUgZWFybHlfcGZuX2luX25pZCgpIGFuZCBDT05GSUdf
Tk9ERVNfU1BBTl9PVEhFUl9OT0RFUwoKVGhlIG1lbW1hcF9pbml0KCkgZnVuY3Rpb24gd2FzIG1h
ZGUgdG8gaXRlcmF0ZSBvdmVyIG1lbWJsb2NrIHJlZ2lvbnMgYW5kIGFzCnRoZSByZXN1bHQgdGhl
IGVhcmx5X3Bmbl9pbl9uaWQoKSBmdW5jdGlvbiBiZWNhbWUgb2Jzb2xldGUuClNpbmNlIENPTkZJ
R19OT0RFU19TUEFOX09USEVSX05PREVTIGlzIG9ubHkgdXNlZCB0byBwaWNrIGEgc3R1YiBvciBh
IHJlYWwKaW1wbGVtZW50YXRpb24gb2YgZWFybHlfcGZuX2luX25pZCgpLCBpdCBpcyBhbHNvIG5v
dCBuZWVkZWQgYW55bW9yZS4KClJlbW92ZSBib3RoIGVhcmx5X3Bmbl9pbl9uaWQoKSBhbmQgdGhl
IENPTkZJR19OT0RFU19TUEFOX09USEVSX05PREVTLgoKQ28tZGV2ZWxvcGVkLWJ5OiBIb2FuIFRy
YW4gPEhvYW5Ab3MuYW1wZXJlY29tcHV0aW5nLmNvbT4KU2lnbmVkLW9mZi1ieTogSG9hbiBUcmFu
IDxIb2FuQG9zLmFtcGVyZWNvbXB1dGluZy5jb20+ClNpZ25lZC1vZmYtYnk6IE1pa2UgUmFwb3Bv
cnQgPHJwcHRAbGludXguaWJtLmNvbT4KLS0tCiBhcmNoL3Bvd2VycGMvS2NvbmZpZyB8ICA5IC0t
LS0tLS0tLQogYXJjaC9zcGFyYy9LY29uZmlnICAgfCAgOSAtLS0tLS0tLS0KIGFyY2gveDg2L0tj
b25maWcgICAgIHwgIDkgLS0tLS0tLS0tCiBtbS9wYWdlX2FsbG9jLmMgICAgICB8IDIwIC0tLS0t
LS0tLS0tLS0tLS0tLS0tCiA0IGZpbGVzIGNoYW5nZWQsIDQ3IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2FyY2gvcG93ZXJwYy9LY29uZmlnIGIvYXJjaC9wb3dlcnBjL0tjb25maWcKaW5kZXgg
NWY4NmIyMmI3ZDJjLi43NGYzMTZkZWVhZTEgMTAwNjQ0Ci0tLSBhL2FyY2gvcG93ZXJwYy9LY29u
ZmlnCisrKyBiL2FyY2gvcG93ZXJwYy9LY29uZmlnCkBAIC02ODUsMTUgKzY4NSw2IEBAIGNvbmZp
ZyBBUkNIX01FTU9SWV9QUk9CRQogCWRlZl9ib29sIHkKIAlkZXBlbmRzIG9uIE1FTU9SWV9IT1RQ
TFVHCiAKLSMgU29tZSBOVU1BIG5vZGVzIGhhdmUgbWVtb3J5IHJhbmdlcyB0aGF0IHNwYW4KLSMg
b3RoZXIgbm9kZXMuICBFdmVuIHRob3VnaCBhIHBmbiBpcyB2YWxpZCBhbmQKLSMgYmV0d2VlbiBh
IG5vZGUncyBzdGFydCBhbmQgZW5kIHBmbnMsIGl0IG1heSBub3QKLSMgcmVzaWRlIG9uIHRoYXQg
bm9kZS4gIFNlZSBtZW1tYXBfaW5pdF96b25lKCkKLSMgZm9yIGRldGFpbHMuCi1jb25maWcgTk9E
RVNfU1BBTl9PVEhFUl9OT0RFUwotCWRlZl9ib29sIHkKLQlkZXBlbmRzIG9uIE5FRURfTVVMVElQ
TEVfTk9ERVMKLQogY29uZmlnIFNUREJJTlVUSUxTCiAJYm9vbCAiVXNpbmcgc3RhbmRhcmQgYmlu
dXRpbHMgc2V0dGluZ3MiCiAJZGVwZW5kcyBvbiA0NHgKZGlmZiAtLWdpdCBhL2FyY2gvc3BhcmMv
S2NvbmZpZyBiL2FyY2gvc3BhcmMvS2NvbmZpZwppbmRleCA3OTUyMDZiN2I1NTIuLjBlNGYzODkx
YjkwNCAxMDA2NDQKLS0tIGEvYXJjaC9zcGFyYy9LY29uZmlnCisrKyBiL2FyY2gvc3BhcmMvS2Nv
bmZpZwpAQCAtMjg2LDE1ICsyODYsNiBAQCBjb25maWcgTk9ERVNfU0hJRlQKIAkgIFNwZWNpZnkg
dGhlIG1heGltdW0gbnVtYmVyIG9mIE5VTUEgTm9kZXMgYXZhaWxhYmxlIG9uIHRoZSB0YXJnZXQK
IAkgIHN5c3RlbS4gIEluY3JlYXNlcyBtZW1vcnkgcmVzZXJ2ZWQgdG8gYWNjb21tb2RhdGUgdmFy
aW91cyB0YWJsZXMuCiAKLSMgU29tZSBOVU1BIG5vZGVzIGhhdmUgbWVtb3J5IHJhbmdlcyB0aGF0
IHNwYW4KLSMgb3RoZXIgbm9kZXMuICBFdmVuIHRob3VnaCBhIHBmbiBpcyB2YWxpZCBhbmQKLSMg
YmV0d2VlbiBhIG5vZGUncyBzdGFydCBhbmQgZW5kIHBmbnMsIGl0IG1heSBub3QKLSMgcmVzaWRl
IG9uIHRoYXQgbm9kZS4gIFNlZSBtZW1tYXBfaW5pdF96b25lKCkKLSMgZm9yIGRldGFpbHMuCi1j
b25maWcgTk9ERVNfU1BBTl9PVEhFUl9OT0RFUwotCWRlZl9ib29sIHkKLQlkZXBlbmRzIG9uIE5F
RURfTVVMVElQTEVfTk9ERVMKLQogY29uZmlnIEFSQ0hfU1BBUlNFTUVNX0VOQUJMRQogCWRlZl9i
b29sIHkgaWYgU1BBUkM2NAogCXNlbGVjdCBTUEFSU0VNRU1fVk1FTU1BUF9FTkFCTEUKZGlmZiAt
LWdpdCBhL2FyY2gveDg2L0tjb25maWcgYi9hcmNoL3g4Ni9LY29uZmlnCmluZGV4IGY4YmYyMThh
MTY5Yy4uMWVjMmE1ZTJmZWY2IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9LY29uZmlnCisrKyBiL2Fy
Y2gveDg2L0tjb25maWcKQEAgLTE1ODEsMTUgKzE1ODEsNiBAQCBjb25maWcgWDg2XzY0X0FDUElf
TlVNQQogCS0tLWhlbHAtLS0KIAkgIEVuYWJsZSBBQ1BJIFNSQVQgYmFzZWQgbm9kZSB0b3BvbG9n
eSBkZXRlY3Rpb24uCiAKLSMgU29tZSBOVU1BIG5vZGVzIGhhdmUgbWVtb3J5IHJhbmdlcyB0aGF0
IHNwYW4KLSMgb3RoZXIgbm9kZXMuICBFdmVuIHRob3VnaCBhIHBmbiBpcyB2YWxpZCBhbmQKLSMg
YmV0d2VlbiBhIG5vZGUncyBzdGFydCBhbmQgZW5kIHBmbnMsIGl0IG1heSBub3QKLSMgcmVzaWRl
IG9uIHRoYXQgbm9kZS4gIFNlZSBtZW1tYXBfaW5pdF96b25lKCkKLSMgZm9yIGRldGFpbHMuCi1j
b25maWcgTk9ERVNfU1BBTl9PVEhFUl9OT0RFUwotCWRlZl9ib29sIHkKLQlkZXBlbmRzIG9uIFg4
Nl82NF9BQ1BJX05VTUEKLQogY29uZmlnIE5VTUFfRU1VCiAJYm9vbCAiTlVNQSBlbXVsYXRpb24i
CiAJZGVwZW5kcyBvbiBOVU1BCmRpZmYgLS1naXQgYS9tbS9wYWdlX2FsbG9jLmMgYi9tbS9wYWdl
X2FsbG9jLmMKaW5kZXggOGQxMTJkZWZhZWFkLi5kMzVjYTA5OTZhMDkgMTAwNjQ0Ci0tLSBhL21t
L3BhZ2VfYWxsb2MuYworKysgYi9tbS9wYWdlX2FsbG9jLmMKQEAgLTE1NDEsMjYgKzE1NDEsNiBA
QCBpbnQgX19tZW1pbml0IGVhcmx5X3Bmbl90b19uaWQodW5zaWduZWQgbG9uZyBwZm4pCiB9CiAj
ZW5kaWYgLyogQ09ORklHX05FRURfTVVMVElQTEVfTk9ERVMgKi8KIAotI2lmZGVmIENPTkZJR19O
T0RFU19TUEFOX09USEVSX05PREVTCi0vKiBPbmx5IHNhZmUgdG8gdXNlIGVhcmx5IGluIGJvb3Qg
d2hlbiBpbml0aWFsaXNhdGlvbiBpcyBzaW5nbGUtdGhyZWFkZWQgKi8KLXN0YXRpYyBpbmxpbmUg
Ym9vbCBfX21lbWluaXQgZWFybHlfcGZuX2luX25pZCh1bnNpZ25lZCBsb25nIHBmbiwgaW50IG5v
ZGUpCi17Ci0JaW50IG5pZDsKLQotCW5pZCA9IF9fZWFybHlfcGZuX3RvX25pZChwZm4sICZlYXJs
eV9wZm5uaWRfY2FjaGUpOwotCWlmIChuaWQgPj0gMCAmJiBuaWQgIT0gbm9kZSkKLQkJcmV0dXJu
IGZhbHNlOwotCXJldHVybiB0cnVlOwotfQotCi0jZWxzZQotc3RhdGljIGlubGluZSBib29sIF9f
bWVtaW5pdCBlYXJseV9wZm5faW5fbmlkKHVuc2lnbmVkIGxvbmcgcGZuLCBpbnQgbm9kZSkKLXsK
LQlyZXR1cm4gdHJ1ZTsKLX0KLSNlbmRpZgotCi0KIHZvaWQgX19pbml0IG1lbWJsb2NrX2ZyZWVf
cGFnZXMoc3RydWN0IHBhZ2UgKnBhZ2UsIHVuc2lnbmVkIGxvbmcgcGZuLAogCQkJCQkJCXVuc2ln
bmVkIGludCBvcmRlcikKIHsKLS0gCjIuMjYuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3Rz
LmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3Bl
bnJpc2MK
