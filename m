Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C03961C05B4
	for <lists+openrisc@lfdr.de>; Thu, 30 Apr 2020 21:09:21 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 64EC320B26;
	Thu, 30 Apr 2020 21:09:17 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by mail.librecores.org (Postfix) with ESMTP id 99736202AE
 for <openrisc@lists.librecores.org>; Tue, 21 Apr 2020 11:45:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587462344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7YlUzjQkLo0H5BYCcvwstFbEoHwY4ih6fNxbEHyBvX0=;
 b=atP9ejV6+7ImGI2CQjkNd+hjE4h9niqedtb9W+X951SScJgC4xa2WDwSHc/fUeQWEPfGI9
 F89Vl1Ff1sbbdf/ONqEzATdrWg6Sprq0L1wzB5NGepR8o9ESUWzJUy6D61jNYwVfMTaLsm
 6eANUeh8XmySQJ6IDIzF3navxM0OrDQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-NpLGHwzBPpWwI4QPRhx8dw-1; Tue, 21 Apr 2020 05:45:41 -0400
X-MC-Unique: NpLGHwzBPpWwI4QPRhx8dw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E26281005509;
 Tue, 21 Apr 2020 09:45:35 +0000 (UTC)
Received: from localhost (ovpn-12-34.pek2.redhat.com [10.72.12.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C3A51001938;
 Tue, 21 Apr 2020 09:45:33 +0000 (UTC)
Date: Tue, 21 Apr 2020 17:45:30 +0800
From: Baoquan He <bhe@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20200421094530.GB29658@MiWiFi-R3L-srv>
References: <20200412194859.12663-1-rppt@kernel.org>
 <20200412194859.12663-4-rppt@kernel.org>
 <20200421042316.GQ4247@MiWiFi-R3L-srv>
 <20200421090908.GC14260@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200421090908.GC14260@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mailman-Approved-At: Thu, 30 Apr 2020 21:09:13 +0200
Subject: Re: [OpenRISC] [PATCH 03/21] mm: remove
 CONFIG_HAVE_MEMBLOCK_NODE_MAP option
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
 linux-riscv@lists.infradead.org, Greg Ungerer <gerg@linux-m68k.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-c6x-dev@linux-c6x.org,
 Brian Cain <bcain@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-sh@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Mike Rapoport <rppt@linux.ibm.com>, linux-arm-kernel@lists.infradead.org,
 Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>,
 linux-mips@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp,
 linux-xtensa@linux-xtensa.org, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 Tony Luck <tony.luck@intel.com>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Hoan Tran <Hoan@os.amperecomputing.com>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Nick Hu <nickhu@andestech.com>,
 linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gMDQvMjEvMjAgYXQgMTI6MDlwbSwgTWlrZSBSYXBvcG9ydCB3cm90ZToKPiA+ID4gZGlmZiAt
LWdpdCBhL21tL21lbW9yeV9ob3RwbHVnLmMgYi9tbS9tZW1vcnlfaG90cGx1Zy5jCj4gPiA+IGlu
ZGV4IGZjMGFhZDBiYzFmNS4uZTY3ZGM1MDE1NzZhIDEwMDY0NAo+ID4gPiAtLS0gYS9tbS9tZW1v
cnlfaG90cGx1Zy5jCj4gPiA+ICsrKyBiL21tL21lbW9yeV9ob3RwbHVnLmMKPiA+ID4gQEAgLTEz
NzIsMTEgKzEzNzIsNyBAQCBjaGVja19wYWdlc19pc29sYXRlZF9jYih1bnNpZ25lZCBsb25nIHN0
YXJ0X3BmbiwgdW5zaWduZWQgbG9uZyBucl9wYWdlcywKPiA+ID4gIAo+ID4gPiAgc3RhdGljIGlu
dCBfX2luaXQgY21kbGluZV9wYXJzZV9tb3ZhYmxlX25vZGUoY2hhciAqcCkKPiA+ID4gIHsKPiA+
ID4gLSNpZmRlZiBDT05GSUdfSEFWRV9NRU1CTE9DS19OT0RFX01BUAo+ID4gPiAgCW1vdmFibGVf
bm9kZV9lbmFibGVkID0gdHJ1ZTsKPiA+ID4gLSNlbHNlCj4gPiA+IC0JcHJfd2FybigibW92YWJs
ZV9ub2RlIHBhcmFtZXRlciBkZXBlbmRzIG9uIENPTkZJR19IQVZFX01FTUJMT0NLX05PREVfTUFQ
IHRvIHdvcmsgcHJvcGVybHlcbiIpOwo+ID4gPiAtI2VuZGlmCj4gPiAKPiA+IFdvbmRlcmluZyBp
ZiB0aGlzIGNoYW5nZSB3aWxsIGltcGFjdCBhbnl0aGluZy4gQmVmb3JlLCB0aG9zZSBBUkNIZXMg
d2l0aAo+ID4gQ09ORklHX0hBVkVfTUVNQkxPQ0tfTk9ERV9NQVAgc3VwcG9ydCBtb3ZhYmxlX25v
ZGUuIFdpdGggdGhpcyBwYXRjaAo+ID4gYXBwbGllZCwgdGhvc2UgQVJDSGVzIHdoaWNoIGRvbid0
IHN1cHBvcnQgQ09ORklHX0hBVkVfTUVNQkxPQ0tfTk9ERV9NQVAKPiA+IGNhbiBhbHNvIGhhdmUg
J21vdmFibGVfbm9kZScgc3BlY2lmaWVkIGluIGtlcm5lbCBjbWRsaW5lLgo+ID4gCj4gPiA+ICAJ
cmV0dXJuIDA7Cj4gPiA+ICB9Cj4gPiA+ICBlYXJseV9wYXJhbSgibW92YWJsZV9ub2RlIiwgY21k
bGluZV9wYXJzZV9tb3ZhYmxlX25vZGUpOwo+ID4gPiBkaWZmIC0tZ2l0IGEvbW0vcGFnZV9hbGxv
Yy5jIGIvbW0vcGFnZV9hbGxvYy5jCj4gPiA+IGluZGV4IDFhYzc3NWJmYzljZi4uNDUzMGU5Y2Zk
OWY3IDEwMDY0NAo+ID4gPiAtLS0gYS9tbS9wYWdlX2FsbG9jLmMKPiA+ID4gKysrIGIvbW0vcGFn
ZV9hbGxvYy5jCj4gPiA+IEBAIC0zMzUsNyArMzM1LDYgQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcg
bnJfa2VybmVsX3BhZ2VzIF9faW5pdGRhdGE7Cj4gPiA+ICBzdGF0aWMgdW5zaWduZWQgbG9uZyBu
cl9hbGxfcGFnZXMgX19pbml0ZGF0YTsKPiA+ID4gIHN0YXRpYyB1bnNpZ25lZCBsb25nIGRtYV9y
ZXNlcnZlIF9faW5pdGRhdGE7Cj4gPiA+ICAKPiA+ID4gLSNpZmRlZiBDT05GSUdfSEFWRV9NRU1C
TE9DS19OT0RFX01BUAo+ID4gPiAgc3RhdGljIHVuc2lnbmVkIGxvbmcgYXJjaF96b25lX2xvd2Vz
dF9wb3NzaWJsZV9wZm5bTUFYX05SX1pPTkVTXSBfX2luaXRkYXRhOwo+ID4gPiAgc3RhdGljIHVu
c2lnbmVkIGxvbmcgYXJjaF96b25lX2hpZ2hlc3RfcG9zc2libGVfcGZuW01BWF9OUl9aT05FU10g
X19pbml0ZGF0YTsKPiA+ID4gIHN0YXRpYyB1bnNpZ25lZCBsb25nIHJlcXVpcmVkX2tlcm5lbGNv
cmUgX19pbml0ZGF0YTsKPiA+IAo+ID4gRG9lcyBpdCBtZWFuIHRob3NlIEFSQ0hlcyB3aGljaCBk
b24ndCBzdXBwb3J0Cj4gPiBDT05GSUdfSEFWRV9NRU1CTE9DS19OT0RFX01BUCBiZWZvcmUsIHdp
bGwgaGF2ZSAna2VybmVsY29yZT0nIGFuZAo+ID4gJ21vdmFibGVjb3JlPScgbm93LCBhbmQgd2ls
bCBoYXZlIE1PVkFCTEUgem9uZT8KPiAKPiBJIGhlc2l0YXRlZCBhIGxvdCBhYm91dCB3aGV0aGVy
IHRvIGhpZGUgdGhlIGtlcm5lbGNvcmUvbW92YWJsZWNvcmUgYW5kCj4gcmVsYXRlZCBjb2RlIGJl
aGluZCBhbiAjaWZkZWYuCj4gSW4gdGhlIGVuZCBJJ3ZlIGRlY2lkZWQgdG8ga2VlcCB0aGUgY29k
ZSBjb21waWxlZCB1bmNvbmRpdGlvbmFsbHkgYXMgaXQKPiBpcyBhbnl3YXkgX19pbml0IGFuZCBu
byBzYW5lIHBlcnNvbiB3b3VsZCBwYXNzICJrZXJuZWxjb3JlPSIgdG8gdGhlCj4ga2VybmVsIG9u
IGEgVU1BIHN5c3RlbS4KCkkgc2VlLiBUaGVuIG1heWJlIGNhbiBkbyBzb21ldGhpbmcgaWYgc29t
ZW9uZSBjb21wbGFpbnMgYWJvdXQgaXQKaW4gdGhlIGZ1dHVyZSwgZS5nIHdhcm4gb3V0IHdpdGgg
YSBtZXNzYWdlIGluCmNtZGxpbmVfcGFyc2VfbW92YWJsZV9ub2RlKCksIGNtZGxpbmVfcGFyc2Vf
a2VybmVsY29yZSgpLgoKPiAKPiA+ID4gQEAgLTM0OCw3ICszNDcsNiBAQCBzdGF0aWMgYm9vbCBt
aXJyb3JlZF9rZXJuZWxjb3JlIF9fbWVtaW5pdGRhdGE7Cj4gPiA+ICAvKiBtb3ZhYmxlX3pvbmUg
aXMgdGhlICJyZWFsIiB6b25lIHBhZ2VzIGluIFpPTkVfTU9WQUJMRSBhcmUgdGFrZW4gZnJvbSAq
Lwo+ID4gPiAgaW50IG1vdmFibGVfem9uZTsKPiA+ID4gIEVYUE9SVF9TWU1CT0wobW92YWJsZV96
b25lKTsKPiA+ID4gLSNlbmRpZiAvKiBDT05GSUdfSEFWRV9NRU1CTE9DS19OT0RFX01BUCAqLwo+
ID4gPiAgCj4gPiA+ICAjaWYgTUFYX05VTU5PREVTID4gMQo+ID4gPiAgdW5zaWduZWQgaW50IG5y
X25vZGVfaWRzIF9fcmVhZF9tb3N0bHkgPSBNQVhfTlVNTk9ERVM7Cj4gPiA+IEBAIC0xNDk5LDgg
KzE0OTcsNyBAQCB2b2lkIF9fZnJlZV9wYWdlc19jb3JlKHN0cnVjdCBwYWdlICpwYWdlLCB1bnNp
Z25lZCBpbnQgb3JkZXIpCj4gPiA+ICAJX19mcmVlX3BhZ2VzKHBhZ2UsIG9yZGVyKTsKPiA+ID4g
IH0KPiA+ID4gIAo+ID4gPiAtI2lmIGRlZmluZWQoQ09ORklHX0hBVkVfQVJDSF9FQVJMWV9QRk5f
VE9fTklEKSB8fCBcCj4gPiA+IC0JZGVmaW5lZChDT05GSUdfSEFWRV9NRU1CTE9DS19OT0RFX01B
UCkKPiA+ID4gKyNpZmRlZiBDT05GSUdfTkVFRF9NVUxUSVBMRV9OT0RFUwo+ID4gPiAgCj4gPiA+
ICBzdGF0aWMgc3RydWN0IG1taW5pdF9wZm5uaWRfY2FjaGUgZWFybHlfcGZubmlkX2NhY2hlIF9f
bWVtaW5pdGRhdGE7Cj4gPiA+ICAKPiA+ID4gQEAgLTE1NDIsNyArMTUzOSw3IEBAIGludCBfX21l
bWluaXQgZWFybHlfcGZuX3RvX25pZCh1bnNpZ25lZCBsb25nIHBmbikKPiA+ID4gIAo+ID4gPiAg
CXJldHVybiBuaWQ7Cj4gPiA+ICB9Cj4gPiA+IC0jZW5kaWYKPiA+ID4gKyNlbmRpZiAvKiBDT05G
SUdfTkVFRF9NVUxUSVBMRV9OT0RFUyAqLwo+ID4gPiAgCj4gPiA+ICAjaWZkZWYgQ09ORklHX05P
REVTX1NQQU5fT1RIRVJfTk9ERVMKPiA+ID4gIC8qIE9ubHkgc2FmZSB0byB1c2UgZWFybHkgaW4g
Ym9vdCB3aGVuIGluaXRpYWxpc2F0aW9uIGlzIHNpbmdsZS10aHJlYWRlZCAqLwo+ID4gPiBAQCAt
NTkyNCw3ICs1OTIxLDYgQEAgdm9pZCBfX3JlZiBidWlsZF9hbGxfem9uZWxpc3RzKHBnX2RhdGFf
dCAqcGdkYXQpCj4gPiA+ICBzdGF0aWMgYm9vbCBfX21lbWluaXQKPiA+ID4gIG92ZXJsYXBfbWVt
bWFwX2luaXQodW5zaWduZWQgbG9uZyB6b25lLCB1bnNpZ25lZCBsb25nICpwZm4pCj4gPiA+ICB7
Cj4gPiA+IC0jaWZkZWYgQ09ORklHX0hBVkVfTUVNQkxPQ0tfTk9ERV9NQVAKPiA+ID4gIAlzdGF0
aWMgc3RydWN0IG1lbWJsb2NrX3JlZ2lvbiAqcjsKPiA+ID4gIAo+ID4gPiAgCWlmIChtaXJyb3Jl
ZF9rZXJuZWxjb3JlICYmIHpvbmUgPT0gWk9ORV9NT1ZBQkxFKSB7Cj4gPiA+IEBAIC01OTQwLDcg
KzU5MzYsNiBAQCBvdmVybGFwX21lbW1hcF9pbml0KHVuc2lnbmVkIGxvbmcgem9uZSwgdW5zaWdu
ZWQgbG9uZyAqcGZuKQo+ID4gPiAgCQkJcmV0dXJuIHRydWU7Cj4gPiA+ICAJCX0KPiA+ID4gIAl9
Cj4gPiA+IC0jZW5kaWYKPiA+ID4gIAlyZXR1cm4gZmFsc2U7Cj4gPiA+ICB9Cj4gPiA+ICAKPiA+
ID4gQEAgLTY1NzMsOCArNjU2OCw3IEBAIHN0YXRpYyB1bnNpZ25lZCBsb25nIF9faW5pdCB6b25l
X2Fic2VudF9wYWdlc19pbl9ub2RlKGludCBuaWQsCj4gPiA+ICAJcmV0dXJuIG5yX2Fic2VudDsK
PiA+ID4gIH0KPiA+ID4gIAo+ID4gPiAtI2Vsc2UgLyogQ09ORklHX0hBVkVfTUVNQkxPQ0tfTk9E
RV9NQVAgKi8KPiA+ID4gLXN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBfX2luaXQgem9uZV9z
cGFubmVkX3BhZ2VzX2luX25vZGUoaW50IG5pZCwKPiA+ID4gK3N0YXRpYyBpbmxpbmUgdW5zaWdu
ZWQgbG9uZyBfX2luaXQgY29tcGF0X3pvbmVfc3Bhbm5lZF9wYWdlc19pbl9ub2RlKGludCBuaWQs
Cj4gPiAKPiA+IElzIGl0IGNvbXBhY3Qgem9uZSB3aGljaCBoYXMgY29udGludW91cyBtZW1vcnkg
cmVnaW9uLCBhbmQgdGhlCj4gPiBjb21wYXQgaGVyZSBpcyB0eXBvPyBPciBpdCdzIGNvbXBhdGli
bGUgem9uZT8gVGhlIG5hbWUgc2VlbXMgYSBsaXR0bGUKPiA+IGNvbmZ1c2luZywgb3IgSSBtaXNz
IHNvbWV0aGluZy4KPiAKPiBJdCdzICdjb21wYXQnIGZyb20gJ2NvbXBhdGliaWxpdHknLiBUaGlz
IGlzIGtpbmRhICJ0aGUgb2xkIHdheSIgYW5kIHRoZQo+IHZlcnNpb24gdGhhdCB3YXMgZGVmaW5l
ZCB3aGVuIENPTkZJR19IQVZFX01FTUJMT0NLX05PREVfTUFQPXkgaXMgdGhlCj4gIm5ldyB3YXki
LCBzbyBJIHBpY2tlZCAnY29tcGF0JyBmb3IgYmFja3dhcmRzIGNvbXBhdGliaWxpdHkuIAo+IEFu
eXdheSwgaXQgd2lsbCBnbyBhd2F5IGxhdGVyIGluIHBhY3RoIDE5LiAKCkdvdCBpdCwgdGhhbmtz
IGZvciB0ZWxsaW5nLgoKPiAKPiA+ID4gIAkJCQkJdW5zaWduZWQgbG9uZyB6b25lX3R5cGUsCj4g
PiA+ICAJCQkJCXVuc2lnbmVkIGxvbmcgbm9kZV9zdGFydF9wZm4sCj4gPiA+ICAJCQkJCXVuc2ln
bmVkIGxvbmcgbm9kZV9lbmRfcGZuLAo+ID4gPiBAQCAtNjU5Myw3ICs2NTg3LDcgQEAgc3RhdGlj
IGlubGluZSB1bnNpZ25lZCBsb25nIF9faW5pdCB6b25lX3NwYW5uZWRfcGFnZXNfaW5fbm9kZShp
bnQgbmlkLAo+ID4gPiAgCXJldHVybiB6b25lc19zaXplW3pvbmVfdHlwZV07Cj4gPiA+ICB9Cj4g
PiA+ICAKPiA+ID4gLXN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBfX2luaXQgem9uZV9hYnNl
bnRfcGFnZXNfaW5fbm9kZShpbnQgbmlkLAo+ID4gPiArc3RhdGljIGlubGluZSB1bnNpZ25lZCBs
b25nIF9faW5pdCBjb21wYXRfem9uZV9hYnNlbnRfcGFnZXNfaW5fbm9kZShpbnQgbmlkLAo+ID4g
PiAgCQkJCQkJdW5zaWduZWQgbG9uZyB6b25lX3R5cGUsCj4gPiA+ICAJCQkJCQl1bnNpZ25lZCBs
b25nIG5vZGVfc3RhcnRfcGZuLAo+ID4gPiAgCQkJCQkJdW5zaWduZWQgbG9uZyBub2RlX2VuZF9w
Zm4sCj4gPiA+IEBAIC02NjA1LDEzICs2NTk5LDEyIEBAIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQg
bG9uZyBfX2luaXQgem9uZV9hYnNlbnRfcGFnZXNfaW5fbm9kZShpbnQgbmlkLAo+ID4gPiAgCXJl
dHVybiB6aG9sZXNfc2l6ZVt6b25lX3R5cGVdOwo+ID4gPiAgfQo+ID4gPiAgCj4gPiA+IC0jZW5k
aWYgLyogQ09ORklHX0hBVkVfTUVNQkxPQ0tfTk9ERV9NQVAgKi8KPiA+ID4gLQo+ID4gPiAgc3Rh
dGljIHZvaWQgX19pbml0IGNhbGN1bGF0ZV9ub2RlX3RvdGFscGFnZXMoc3RydWN0IHBnbGlzdF9k
YXRhICpwZ2RhdCwKPiA+ID4gIAkJCQkJCXVuc2lnbmVkIGxvbmcgbm9kZV9zdGFydF9wZm4sCj4g
PiA+ICAJCQkJCQl1bnNpZ25lZCBsb25nIG5vZGVfZW5kX3BmbiwKPiA+ID4gIAkJCQkJCXVuc2ln
bmVkIGxvbmcgKnpvbmVzX3NpemUsCj4gPiA+IC0JCQkJCQl1bnNpZ25lZCBsb25nICp6aG9sZXNf
c2l6ZSkKPiA+ID4gKwkJCQkJCXVuc2lnbmVkIGxvbmcgKnpob2xlc19zaXplLAo+ID4gPiArCQkJ
CQkJYm9vbCBjb21wYXQpCj4gPiA+ICB7Cj4gPiA+ICAJdW5zaWduZWQgbG9uZyByZWFsdG90YWxw
YWdlcyA9IDAsIHRvdGFscGFnZXMgPSAwOwo+ID4gPiAgCWVudW0gem9uZV90eXBlIGk7Cj4gPiA+
IEBAIC02NjE5LDE3ICs2NjEyLDM4IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBjYWxjdWxhdGVfbm9k
ZV90b3RhbHBhZ2VzKHN0cnVjdCBwZ2xpc3RfZGF0YSAqcGdkYXQsCj4gPiA+ICAJZm9yIChpID0g
MDsgaSA8IE1BWF9OUl9aT05FUzsgaSsrKSB7Cj4gPiA+ICAJCXN0cnVjdCB6b25lICp6b25lID0g
cGdkYXQtPm5vZGVfem9uZXMgKyBpOwo+ID4gPiAgCQl1bnNpZ25lZCBsb25nIHpvbmVfc3RhcnRf
cGZuLCB6b25lX2VuZF9wZm47Cj4gPiA+ICsJCXVuc2lnbmVkIGxvbmcgc3Bhbm5lZCwgYWJzZW50
Owo+ID4gPiAgCQl1bnNpZ25lZCBsb25nIHNpemUsIHJlYWxfc2l6ZTsKPiA+ID4gIAo+ID4gPiAt
CQlzaXplID0gem9uZV9zcGFubmVkX3BhZ2VzX2luX25vZGUocGdkYXQtPm5vZGVfaWQsIGksCj4g
PiA+IC0JCQkJCQkgIG5vZGVfc3RhcnRfcGZuLAo+ID4gPiAtCQkJCQkJICBub2RlX2VuZF9wZm4s
Cj4gPiA+IC0JCQkJCQkgICZ6b25lX3N0YXJ0X3BmbiwKPiA+ID4gLQkJCQkJCSAgJnpvbmVfZW5k
X3BmbiwKPiA+ID4gLQkJCQkJCSAgem9uZXNfc2l6ZSk7Cj4gPiA+IC0JCXJlYWxfc2l6ZSA9IHNp
emUgLSB6b25lX2Fic2VudF9wYWdlc19pbl9ub2RlKHBnZGF0LT5ub2RlX2lkLCBpLAo+ID4gPiAt
CQkJCQkJICBub2RlX3N0YXJ0X3Bmbiwgbm9kZV9lbmRfcGZuLAo+ID4gPiAtCQkJCQkJICB6aG9s
ZXNfc2l6ZSk7Cj4gPiA+ICsJCWlmIChjb21wYXQpIHsKPiA+ID4gKwkJCXNwYW5uZWQgPSBjb21w
YXRfem9uZV9zcGFubmVkX3BhZ2VzX2luX25vZGUoCj4gPiA+ICsJCQkJCQlwZ2RhdC0+bm9kZV9p
ZCwgaSwKPiA+ID4gKwkJCQkJCW5vZGVfc3RhcnRfcGZuLAo+ID4gPiArCQkJCQkJbm9kZV9lbmRf
cGZuLAo+ID4gPiArCQkJCQkJJnpvbmVfc3RhcnRfcGZuLAo+ID4gPiArCQkJCQkJJnpvbmVfZW5k
X3BmbiwKPiA+ID4gKwkJCQkJCXpvbmVzX3NpemUpOwo+ID4gPiArCQkJYWJzZW50ID0gY29tcGF0
X3pvbmVfYWJzZW50X3BhZ2VzX2luX25vZGUoCj4gPiA+ICsJCQkJCQlwZ2RhdC0+bm9kZV9pZCwg
aSwKPiA+ID4gKwkJCQkJCW5vZGVfc3RhcnRfcGZuLAo+ID4gPiArCQkJCQkJbm9kZV9lbmRfcGZu
LAo+ID4gPiArCQkJCQkJemhvbGVzX3NpemUpOwo+ID4gPiArCQl9IGVsc2Ugewo+ID4gPiArCQkJ
c3Bhbm5lZCA9IHpvbmVfc3Bhbm5lZF9wYWdlc19pbl9ub2RlKHBnZGF0LT5ub2RlX2lkLCBpLAo+
ID4gPiArCQkJCQkJbm9kZV9zdGFydF9wZm4sCj4gPiA+ICsJCQkJCQlub2RlX2VuZF9wZm4sCj4g
PiA+ICsJCQkJCQkmem9uZV9zdGFydF9wZm4sCj4gPiA+ICsJCQkJCQkmem9uZV9lbmRfcGZuLAo+
ID4gPiArCQkJCQkJem9uZXNfc2l6ZSk7Cj4gPiA+ICsJCQlhYnNlbnQgPSB6b25lX2Fic2VudF9w
YWdlc19pbl9ub2RlKHBnZGF0LT5ub2RlX2lkLCBpLAo+ID4gPiArCQkJCQkJbm9kZV9zdGFydF9w
Zm4sCj4gPiA+ICsJCQkJCQlub2RlX2VuZF9wZm4sCj4gPiA+ICsJCQkJCQl6aG9sZXNfc2l6ZSk7
Cj4gPiA+ICsJCX0KPiA+ID4gKwo+ID4gPiArCQlzaXplID0gc3Bhbm5lZDsKPiA+ID4gKwkJcmVh
bF9zaXplID0gc2l6ZSAtIGFic2VudDsKPiA+ID4gKwo+ID4gPiAgCQlpZiAoc2l6ZSkKPiA+ID4g
IAkJCXpvbmUtPnpvbmVfc3RhcnRfcGZuID0gem9uZV9zdGFydF9wZm47Cj4gPiA+ICAJCWVsc2UK
PiA+ID4gQEAgLTY5MjksMTAgKzY5NDMsOCBAQCBzdGF0aWMgdm9pZCBfX3JlZiBhbGxvY19ub2Rl
X21lbV9tYXAoc3RydWN0IHBnbGlzdF9kYXRhICpwZ2RhdCkKPiA+ID4gIAkgKi8KPiA+ID4gIAlp
ZiAocGdkYXQgPT0gTk9ERV9EQVRBKDApKSB7Cj4gPiA+ICAJCW1lbV9tYXAgPSBOT0RFX0RBVEEo
MCktPm5vZGVfbWVtX21hcDsKPiA+ID4gLSNpZiBkZWZpbmVkKENPTkZJR19IQVZFX01FTUJMT0NL
X05PREVfTUFQKSB8fCBkZWZpbmVkKENPTkZJR19GTEFUTUVNKQo+ID4gPiAgCQlpZiAocGFnZV90
b19wZm4obWVtX21hcCkgIT0gcGdkYXQtPm5vZGVfc3RhcnRfcGZuKQo+ID4gPiAgCQkJbWVtX21h
cCAtPSBvZmZzZXQ7Cj4gPiA+IC0jZW5kaWYgLyogQ09ORklHX0hBVkVfTUVNQkxPQ0tfTk9ERV9N
QVAgKi8KPiA+ID4gIAl9Cj4gPiA+ICAjZW5kaWYKPiA+ID4gIH0KPiA+ID4gQEAgLTY5NDksOSAr
Njk2MSwxMCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgcGdkYXRfc2V0X2RlZmVycmVkX3JhbmdlKHBn
X2RhdGFfdCAqcGdkYXQpCj4gPiA+ICBzdGF0aWMgaW5saW5lIHZvaWQgcGdkYXRfc2V0X2RlZmVy
cmVkX3JhbmdlKHBnX2RhdGFfdCAqcGdkYXQpIHt9Cj4gPiA+ICAjZW5kaWYKPiA+ID4gIAo+ID4g
PiAtdm9pZCBfX2luaXQgZnJlZV9hcmVhX2luaXRfbm9kZShpbnQgbmlkLCB1bnNpZ25lZCBsb25n
ICp6b25lc19zaXplLAo+ID4gPiAtCQkJCSAgIHVuc2lnbmVkIGxvbmcgbm9kZV9zdGFydF9wZm4s
Cj4gPiA+IC0JCQkJICAgdW5zaWduZWQgbG9uZyAqemhvbGVzX3NpemUpCj4gPiA+ICtzdGF0aWMg
dm9pZCBfX2luaXQgX19mcmVlX2FyZWFfaW5pdF9ub2RlKGludCBuaWQsIHVuc2lnbmVkIGxvbmcg
KnpvbmVzX3NpemUsCj4gPiA+ICsJCQkJCSB1bnNpZ25lZCBsb25nIG5vZGVfc3RhcnRfcGZuLAo+
ID4gPiArCQkJCQkgdW5zaWduZWQgbG9uZyAqemhvbGVzX3NpemUsCj4gPiA+ICsJCQkJCSBib29s
IGNvbXBhdCkKPiA+ID4gIHsKPiA+ID4gIAlwZ19kYXRhX3QgKnBnZGF0ID0gTk9ERV9EQVRBKG5p
ZCk7Cj4gPiA+ICAJdW5zaWduZWQgbG9uZyBzdGFydF9wZm4gPSAwOwo+ID4gPiBAQCAtNjk2Mywx
NiArNjk3NiwxNiBAQCB2b2lkIF9faW5pdCBmcmVlX2FyZWFfaW5pdF9ub2RlKGludCBuaWQsIHVu
c2lnbmVkIGxvbmcgKnpvbmVzX3NpemUsCj4gPiA+ICAJcGdkYXQtPm5vZGVfaWQgPSBuaWQ7Cj4g
PiA+ICAJcGdkYXQtPm5vZGVfc3RhcnRfcGZuID0gbm9kZV9zdGFydF9wZm47Cj4gPiA+ICAJcGdk
YXQtPnBlcl9jcHVfbm9kZXN0YXRzID0gTlVMTDsKPiA+ID4gLSNpZmRlZiBDT05GSUdfSEFWRV9N
RU1CTE9DS19OT0RFX01BUAo+ID4gPiAtCWdldF9wZm5fcmFuZ2VfZm9yX25pZChuaWQsICZzdGFy
dF9wZm4sICZlbmRfcGZuKTsKPiA+ID4gLQlwcl9pbmZvKCJJbml0bWVtIHNldHVwIG5vZGUgJWQg
W21lbSAlIzAxOEx4LSUjMDE4THhdXG4iLCBuaWQsCj4gPiA+IC0JCSh1NjQpc3RhcnRfcGZuIDw8
IFBBR0VfU0hJRlQsCj4gPiA+IC0JCWVuZF9wZm4gPyAoKHU2NCllbmRfcGZuIDw8IFBBR0VfU0hJ
RlQpIC0gMSA6IDApOwo+ID4gPiAtI2Vsc2UKPiA+ID4gLQlzdGFydF9wZm4gPSBub2RlX3N0YXJ0
X3BmbjsKPiA+ID4gLSNlbmRpZgo+ID4gPiArCWlmICghY29tcGF0KSB7Cj4gPiA+ICsJCWdldF9w
Zm5fcmFuZ2VfZm9yX25pZChuaWQsICZzdGFydF9wZm4sICZlbmRfcGZuKTsKPiA+ID4gKwkJcHJf
aW5mbygiSW5pdG1lbSBzZXR1cCBub2RlICVkIFttZW0gJSMwMThMeC0lIzAxOEx4XVxuIiwgbmlk
LAo+ID4gPiArCQkJKHU2NClzdGFydF9wZm4gPDwgUEFHRV9TSElGVCwKPiA+ID4gKwkJCWVuZF9w
Zm4gPyAoKHU2NCllbmRfcGZuIDw8IFBBR0VfU0hJRlQpIC0gMSA6IDApOwo+ID4gPiArCX0gZWxz
ZSB7Cj4gPiA+ICsJCXN0YXJ0X3BmbiA9IG5vZGVfc3RhcnRfcGZuOwo+ID4gPiArCX0KPiA+ID4g
IAljYWxjdWxhdGVfbm9kZV90b3RhbHBhZ2VzKHBnZGF0LCBzdGFydF9wZm4sIGVuZF9wZm4sCj4g
PiA+IC0JCQkJICB6b25lc19zaXplLCB6aG9sZXNfc2l6ZSk7Cj4gPiA+ICsJCQkJICB6b25lc19z
aXplLCB6aG9sZXNfc2l6ZSwgY29tcGF0KTsKPiA+ID4gIAo+ID4gPiAgCWFsbG9jX25vZGVfbWVt
X21hcChwZ2RhdCk7Cj4gPiA+ICAJcGdkYXRfc2V0X2RlZmVycmVkX3JhbmdlKHBnZGF0KTsKPiA+
ID4gQEAgLTY5ODAsNiArNjk5MywxNCBAQCB2b2lkIF9faW5pdCBmcmVlX2FyZWFfaW5pdF9ub2Rl
KGludCBuaWQsIHVuc2lnbmVkIGxvbmcgKnpvbmVzX3NpemUsCj4gPiA+ICAJZnJlZV9hcmVhX2lu
aXRfY29yZShwZ2RhdCk7Cj4gPiA+ICB9Cj4gPiA+ICAKPiA+ID4gK3ZvaWQgX19pbml0IGZyZWVf
YXJlYV9pbml0X25vZGUoaW50IG5pZCwgdW5zaWduZWQgbG9uZyAqem9uZXNfc2l6ZSwKPiA+ID4g
KwkJCQl1bnNpZ25lZCBsb25nIG5vZGVfc3RhcnRfcGZuLAo+ID4gPiArCQkJCXVuc2lnbmVkIGxv
bmcgKnpob2xlc19zaXplKQo+ID4gPiArewo+ID4gPiArCV9fZnJlZV9hcmVhX2luaXRfbm9kZShu
aWQsIHpvbmVzX3NpemUsIG5vZGVfc3RhcnRfcGZuLCB6aG9sZXNfc2l6ZSwKPiA+ID4gKwkJCSAg
ICAgIHRydWUpOwo+ID4gPiArfQo+ID4gPiArCj4gPiA+ICAjaWYgIWRlZmluZWQoQ09ORklHX0ZM
QVRfTk9ERV9NRU1fTUFQKQo+ID4gPiAgLyoKPiA+ID4gICAqIEluaXRpYWxpemUgYWxsIHZhbGlk
IHN0cnVjdCBwYWdlcyBpbiB0aGUgcmFuZ2UgW3NwZm4sIGVwZm4pIGFuZCBtYXJrIHRoZW0KPiA+
ID4gQEAgLTcwNjMsOCArNzA4NCw2IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBfX2luaXQgaW5pdF91
bmF2YWlsYWJsZV9tZW0odm9pZCkKPiA+ID4gIH0KPiA+ID4gICNlbmRpZiAvKiAhQ09ORklHX0ZM
QVRfTk9ERV9NRU1fTUFQICovCj4gPiA+ICAKPiA+ID4gLSNpZmRlZiBDT05GSUdfSEFWRV9NRU1C
TE9DS19OT0RFX01BUAo+ID4gPiAtCj4gPiA+ICAjaWYgTUFYX05VTU5PREVTID4gMQo+ID4gPiAg
LyoKPiA+ID4gICAqIEZpZ3VyZSBvdXQgdGhlIG51bWJlciBvZiBwb3NzaWJsZSBub2RlIGlkcy4K
PiA+ID4gQEAgLTc0OTMsOCArNzUxMiw4IEBAIHZvaWQgX19pbml0IGZyZWVfYXJlYV9pbml0X25v
ZGVzKHVuc2lnbmVkIGxvbmcgKm1heF96b25lX3BmbikKPiA+ID4gIAlpbml0X3VuYXZhaWxhYmxl
X21lbSgpOwo+ID4gPiAgCWZvcl9lYWNoX29ubGluZV9ub2RlKG5pZCkgewo+ID4gPiAgCQlwZ19k
YXRhX3QgKnBnZGF0ID0gTk9ERV9EQVRBKG5pZCk7Cj4gPiA+IC0JCWZyZWVfYXJlYV9pbml0X25v
ZGUobmlkLCBOVUxMLAo+ID4gPiAtCQkJCWZpbmRfbWluX3Bmbl9mb3Jfbm9kZShuaWQpLCBOVUxM
KTsKPiA+ID4gKwkJX19mcmVlX2FyZWFfaW5pdF9ub2RlKG5pZCwgTlVMTCwKPiA+ID4gKwkJCQkg
ICAgICBmaW5kX21pbl9wZm5fZm9yX25vZGUobmlkKSwgTlVMTCwgZmFsc2UpOwo+ID4gPiAgCj4g
PiA+ICAJCS8qIEFueSBtZW1vcnkgb24gdGhhdCBub2RlICovCj4gPiA+ICAJCWlmIChwZ2RhdC0+
bm9kZV9wcmVzZW50X3BhZ2VzKQo+ID4gPiBAQCAtNzU1OSw4ICs3NTc4LDYgQEAgc3RhdGljIGlu
dCBfX2luaXQgY21kbGluZV9wYXJzZV9tb3ZhYmxlY29yZShjaGFyICpwKQo+ID4gPiAgZWFybHlf
cGFyYW0oImtlcm5lbGNvcmUiLCBjbWRsaW5lX3BhcnNlX2tlcm5lbGNvcmUpOwo+ID4gPiAgZWFy
bHlfcGFyYW0oIm1vdmFibGVjb3JlIiwgY21kbGluZV9wYXJzZV9tb3ZhYmxlY29yZSk7Cj4gPiA+
ICAKPiA+ID4gLSNlbmRpZiAvKiBDT05GSUdfSEFWRV9NRU1CTE9DS19OT0RFX01BUCAqLwo+ID4g
PiAtCj4gPiA+ICB2b2lkIGFkanVzdF9tYW5hZ2VkX3BhZ2VfY291bnQoc3RydWN0IHBhZ2UgKnBh
Z2UsIGxvbmcgY291bnQpCj4gPiA+ICB7Cj4gPiA+ICAJYXRvbWljX2xvbmdfYWRkKGNvdW50LCAm
cGFnZV96b25lKHBhZ2UpLT5tYW5hZ2VkX3BhZ2VzKTsKPiA+ID4gLS0gCj4gPiA+IDIuMjUuMQo+
ID4gPiAKPiA+IAo+IAo+IC0tIAo+IFNpbmNlcmVseSB5b3VycywKPiBNaWtlLgo+IAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGlu
ZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVj
b3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
