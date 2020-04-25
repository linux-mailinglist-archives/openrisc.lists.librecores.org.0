Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 0FDFD1C05BB
	for <lists+openrisc@lfdr.de>; Thu, 30 Apr 2020 21:09:28 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id CFAFF20926;
	Thu, 30 Apr 2020 21:09:27 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id A37F5202E3
 for <openrisc@lists.librecores.org>; Sat, 25 Apr 2020 18:50:06 +0200 (CEST)
Received: from kernel.org (unknown [77.127.79.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1798F206CD;
 Sat, 25 Apr 2020 16:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587833404;
 bh=0Sl4Z11RVRGJbUzY+39FiW21eIIyUSJn8sRyWLPh1QE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IHfCSB7lAtP8F/QOkzrMVovSds6GmLQXIYGNDyiWwar0dzDHihTkIxxJ4pzqN8dgI
 7dZgKIyfVdwKPgmTvqMYetG92FlxubtA/kMLwHHTJZYJXQvWWxFhfOf1YllMgm6pNJ
 zD7n7cmGOJK81H7mitUpRubrKW286wNtPWLOyYuU=
Date: Sat, 25 Apr 2020 19:49:47 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Message-ID: <20200425164947.GH14260@kernel.org>
References: <20200412194859.12663-1-rppt@kernel.org>
 <20200412194859.12663-16-rppt@kernel.org>
 <9143538a-4aaa-ca1d-9c8f-72ac949cf593@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9143538a-4aaa-ca1d-9c8f-72ac949cf593@redhat.com>
X-Mailman-Approved-At: Thu, 30 Apr 2020 21:09:13 +0200
Subject: Re: [OpenRISC] [PATCH 15/21] mm: memmap_init: iterate over memblock
 regions rather that check each PFN
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
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Guan Xuetao <gxt@pku.edu.cn>, Hoan Tran <Hoan@os.amperecomputing.com>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Brian Cain <bcain@codeaurora.org>, Nick Hu <nickhu@andestech.com>,
 linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gRnJpLCBBcHIgMjQsIDIwMjAgYXQgMDk6MjI6MzJBTSArMDIwMCwgRGF2aWQgSGlsZGVuYnJh
bmQgd3JvdGU6Cj4gT24gMTIuMDQuMjAgMjE6NDgsIE1pa2UgUmFwb3BvcnQgd3JvdGU6Cj4gPiBG
cm9tOiBCYW9xdWFuIEhlIDxiaGVAcmVkaGF0LmNvbT4KPiA+IAo+ID4gV2hlbiBjYWxsZWQgZHVy
aW5nIGJvb3QgdGhlIG1lbW1hcF9pbml0X3pvbmUoKSBmdW5jdGlvbiBjaGVja3MgaWYgZWFjaCBQ
Rk4KPiA+IGlzIHZhbGlkIGFuZCBhY3R1YWxseSBiZWxvbmdzIHRvIHRoZSBub2RlIGJlaW5nIGlu
aXRpYWxpemVkIHVzaW5nCj4gPiBlYXJseV9wZm5fdmFsaWQoKSBhbmQgZWFybHlfcGZuX2luX25p
ZCgpLgo+ID4gCj4gPiBFYWNoIHN1Y2ggY2hlY2sgbWF5IGNvc3QgdXAgdG8gTyhsb2cobikpIHdo
ZXJlIG4gaXMgdGhlIG51bWJlciBvZiBtZW1vcnkKPiA+IGJhbmtzLCBzbyBmb3IgbGFyZ2UgYW1v
dW50IG9mIG1lbW9yeSBvdmVyYWxsIHRpbWUgc3BlbnQgaW4gZWFybHlfcGZuKigpCj4gPiBiZWNv
bWVzIHN1YnN0YW50aWFsLgo+ID4gCj4gPiBTaW5jZSB0aGUgaW5mb3JtYXRpb24gaXMgYW55d2F5
IHByZXNlbnQgaW4gbWVtYmxvY2ssIHdlIGNhbiBpdGVyYXRlIG92ZXIKPiA+IG1lbWJsb2NrIG1l
bW9yeSByZWdpb25zIGluIG1lbW1hcF9pbml0KCkgYW5kIG9ubHkgY2FsbCBtZW1tYXBfaW5pdF96
b25lKCkKPiA+IGZvciBQRk4gcmFuZ2VzIHRoYXQgYXJlIGtub3cgdG8gYmUgdmFsaWQgYW5kIGlu
IHRoZSBhcHByb3ByaWF0ZSBub2RlLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBCYW9xdWFuIEhl
IDxiaGVAcmVkaGF0LmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IE1pa2UgUmFwb3BvcnQgPHJwcHRA
bGludXguaWJtLmNvbT4KPiA+IC0tLQo+ID4gIG1tL3BhZ2VfYWxsb2MuYyB8IDI2ICsrKysrKysr
KysrKysrKystLS0tLS0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyks
IDEwIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvbW0vcGFnZV9hbGxvYy5jIGIv
bW0vcGFnZV9hbGxvYy5jCj4gPiBpbmRleCA3ZjZhMzA4MWVkYjguLmM0M2NlODcwOTQ1NyAxMDA2
NDQKPiA+IC0tLSBhL21tL3BhZ2VfYWxsb2MuYwo+ID4gKysrIGIvbW0vcGFnZV9hbGxvYy5jCj4g
PiBAQCAtNTk5NSwxNCArNTk5NSw2IEBAIHZvaWQgX19tZW1pbml0IG1lbW1hcF9pbml0X3pvbmUo
dW5zaWduZWQgbG9uZyBzaXplLCBpbnQgbmlkLCB1bnNpZ25lZCBsb25nIHpvbmUsCj4gPiAgCQkg
KiBmdW5jdGlvbi4gIFRoZXkgZG8gbm90IGV4aXN0IG9uIGhvdHBsdWdnZWQgbWVtb3J5Lgo+ID4g
IAkJICovCj4gCj4gQWZ0ZXIgdGhpcyBjaGFuZ2UsIHRoZSBjb21tZW50IGFib3ZlIGlzIHN0YWxl
LiB0aGUgImhvbGVzIGluIGJvb3QtdGltZQo+IG1lbV9tYXAiIGFyZSBoYW5kbGVkIGJ5IHRoZSBj
YWxsZXIgbm93IEFGQUlLcy4KClJpZ2h0LCB3aWxsIHVwZGF0ZSBpbiB2Mi4KVGhhbmtzIQoKPiA+
ICAJCWlmIChjb250ZXh0ID09IE1FTU1BUF9FQVJMWSkgewo+ID4gLQkJCWlmICghZWFybHlfcGZu
X3ZhbGlkKHBmbikpIHsKPiA+IC0JCQkJcGZuID0gbmV4dF9wZm4ocGZuKTsKPiA+IC0JCQkJY29u
dGludWU7Cj4gPiAtCQkJfQo+ID4gLQkJCWlmICghZWFybHlfcGZuX2luX25pZChwZm4sIG5pZCkp
IHsKPiA+IC0JCQkJcGZuKys7Cj4gPiAtCQkJCWNvbnRpbnVlOwo+ID4gLQkJCX0KPiA+ICAJCQlp
ZiAob3ZlcmxhcF9tZW1tYXBfaW5pdCh6b25lLCAmcGZuKSkKPiA+ICAJCQkJY29udGludWU7Cj4g
PiAgCQkJaWYgKGRlZmVyX2luaXQobmlkLCBwZm4sIGVuZF9wZm4pKQo+IAo+IAo+IC0tIAo+IFRo
YW5rcywKPiAKPiBEYXZpZCAvIGRoaWxkZW5iCj4gCgotLSAKU2luY2VyZWx5IHlvdXJzLApNaWtl
LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklT
QyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0
cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
