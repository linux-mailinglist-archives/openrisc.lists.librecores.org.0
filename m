Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 8DBE44BACAD
	for <lists+openrisc@lfdr.de>; Thu, 17 Feb 2022 23:37:00 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3A19724847;
	Thu, 17 Feb 2022 23:37:00 +0100 (CET)
Received: from out01.mta.xmission.com (out01.mta.xmission.com [166.70.13.231])
 by mail.librecores.org (Postfix) with ESMTPS id 347ED2483C
 for <openrisc@lists.librecores.org>; Thu, 17 Feb 2022 23:36:58 +0100 (CET)
Received: from in02.mta.xmission.com ([166.70.13.52]:48942)
 by out01.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1nKpOJ-001bK3-23; Thu, 17 Feb 2022 15:36:47 -0700
Received: from ip68-227-174-4.om.om.cox.net ([68.227.174.4]:32906
 helo=email.froward.int.ebiederm.org.xmission.com)
 by in02.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1nKpOG-00GKIm-Md; Thu, 17 Feb 2022 15:36:46 -0700
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Arnd Bergmann <arnd@kernel.org>
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-19-arnd@kernel.org>
Date: Thu, 17 Feb 2022 16:36:20 -0600
In-Reply-To: <20220216131332.1489939-19-arnd@kernel.org> (Arnd Bergmann's
 message of "Wed, 16 Feb 2022 14:13:32 +0100")
Message-ID: <8735khi0ij.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1nKpOG-00GKIm-Md; ; ;
 mid=<8735khi0ij.fsf@email.froward.int.ebiederm.org>; ; ;
 hst=in02.mta.xmission.com; ; ; ip=68.227.174.4; ; ; frm=ebiederm@xmission.com;
 ; ; spf=neutral
X-XM-AID: U2FsdGVkX1/V+0C7NWKuSkdwXmdluwhE5ZIu3hq7L5I=
X-SA-Exim-Connect-IP: 68.227.174.4
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa06.xmission.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=8.0 tests=ALL_TRUSTED,BAYES_50,
 DCC_CHECK_NEGATIVE,LotsOfNums_01,T_SCC_BODY_TEXT_LINE,
 T_TM2_M_HEADER_IN_MSG,T_TooManySym_01,XMSubLong autolearn=disabled
 version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
 *      [score: 0.5000] *  0.7 XMSubLong Long Subject
 *  1.2 LotsOfNums_01 BODY: Lots of long strings of numbers
 *  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
 * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
 *      [sa06 1397; Body=1 Fuz1=1 Fuz2=1]
 *  0.0 T_TooManySym_01 4+ unique symbols in subject
 * -0.0 T_SCC_BODY_TEXT_LINE No description available.
X-Spam-DCC: XMission; sa06 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: *;Arnd Bergmann <arnd@kernel.org>
X-Spam-Relay-Country: 
X-Spam-Timing: total 1733 ms - load_scoreonly_sql: 0.07 (0.0%),
 signal_user_changed: 12 (0.7%), b_tie_ro: 10 (0.6%), parse: 1.27
 (0.1%), extract_message_metadata: 18 (1.0%), get_uri_detail_list: 2.3
 (0.1%), tests_pri_-1000: 25 (1.4%), tests_pri_-950: 1.37 (0.1%),
 tests_pri_-900: 1.22 (0.1%), tests_pri_-90: 280 (16.2%), check_bayes:
 278 (16.0%), b_tokenize: 12 (0.7%), b_tok_get_all: 173 (10.0%),
 b_comp_prob: 2.8 (0.2%), b_tok_touch_all: 86 (5.0%), b_finish: 0.97
 (0.1%), tests_pri_0: 1377 (79.4%), check_dkim_signature: 0.66 (0.0%),
 check_dkim_adsp: 2.6 (0.2%), poll_dns_idle: 0.47 (0.0%), tests_pri_10:
 3.3 (0.2%), tests_pri_500: 10 (0.6%), rewrite_mail: 0.00 (0.0%)
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
Subject: Re: [OpenRISC] [PATCH v2 18/18] uaccess: drop maining CONFIG_SET_FS
 users
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
Cc: mark.rutland@arm.com, dalias@libc.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, peterz@infradead.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, guoren@kernel.org, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 will@kernel.org, Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, bcain@codeaurora.org, mpe@ellerman.id.au,
 deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk,
 linux-csky@vger.kernel.org, ardb@kernel.org, mingo@redhat.com,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 arnd@arndb.de, hca@linux.ibm.com, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 viro@zeniv.linux.org.uk, monstr@monstr.eu, tsbogend@alpha.franken.de,
 linux-parisc@vger.kernel.org, nickhu@andestech.com, jcmvbkbc@gmail.com,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org, dinguyen@kernel.org,
 richard@nod.at, akpm@linux-foundation.org,
 Linus Torvalds <torvalds@linux-foundation.org>, davem@davemloft.net,
 green.hu@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

QXJuZCBCZXJnbWFubiA8YXJuZEBrZXJuZWwub3JnPiB3cml0ZXM6Cgo+IEZyb206IEFybmQgQmVy
Z21hbm4gPGFybmRAYXJuZGIuZGU+Cj4KPiBUaGVyZSBhcmUgbm8gcmVtYWluaW5nIGNhbGxlcnMg
b2Ygc2V0X2ZzKCksIHNvIENPTkZJR19TRVRfRlMKPiBjYW4gYmUgcmVtb3ZlZCBnbG9iYWxseSwg
YWxvbmcgd2l0aCB0aGUgdGhyZWFkX2luZm8gZmllbGQgYW5kCj4gYW55IHJlZmVyZW5jZXMgdG8g
aXQuCj4KPiBUaGlzIHR1cm5zIGFjY2Vzc19vaygpIGludG8gYSBjaGVhcGVyIGNoZWNrIGFnYWlu
c3QgVEFTS19TSVpFX01BWC4KPgo+IFdpdGggQ09ORklHX1NFVF9GUyBnb25lLCBzbyBkcm9wIGFs
bCByZW1haW5pbmcgcmVmZXJlbmNlcyB0bwo+IHNldF9mcygpL2dldF9mcygpLCBtbV9zZWdtZW50
X3QgYW5kIHVhY2Nlc3Nfa2VybmVsKCkuCgpGb3IgdGhlIGJpdHMgSSBoYXZlIGxvb2tlZCBhdCBy
ZWNlbnRseSwgYW5kIHRoaW5rIEkgdW5kZXJzdGFuZC4KCkFja2VkLWJ5OiAiRXJpYyBXLiBCaWVk
ZXJtYW4iIDxlYmllZGVybUB4bWlzc2lvbi5jb20+Cgo+Cj4gU2lnbmVkLW9mZi1ieTogQXJuZCBC
ZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiAtLS0KPiAgZnMvZXhlYy5jICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgNiAtLQo+ICBrZXJuZWwvZXhpdC5jICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8IDE0IC0tLS0tCj4gIGtlcm5lbC9rdGhyZWFkLmMgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDUgLS0KPgo+IGRpZmYgLS1naXQgYS9mcy9leGVjLmMgYi9mcy9leGVj
LmMKPiBpbmRleCA3OWYyYzk0ODMzMDIuLmJjNjhhMGMwODlhYyAxMDA2NDQKPiAtLS0gYS9mcy9l
eGVjLmMKPiArKysgYi9mcy9leGVjLmMKPiBAQCAtMTMwMywxMiArMTMwMyw2IEBAIGludCBiZWdp
bl9uZXdfZXhlYyhzdHJ1Y3QgbGludXhfYmlucHJtICogYnBybSkKPiAgCWlmIChyZXR2YWwpCj4g
IAkJZ290byBvdXRfdW5sb2NrOwo+ICAKPiAtCS8qCj4gLQkgKiBFbnN1cmUgdGhhdCB0aGUgdWFj
Y2VzcyByb3V0aW5lcyBjYW4gYWN0dWFsbHkgb3BlcmF0ZSBvbiB1c2Vyc3BhY2UKPiAtCSAqIHBv
aW50ZXJzOgo+IC0JICovCj4gLQlmb3JjZV91YWNjZXNzX2JlZ2luKCk7Cj4gLQo+ICAJaWYgKG1l
LT5mbGFncyAmIFBGX0tUSFJFQUQpCj4gIAkJZnJlZV9rdGhyZWFkX3N0cnVjdChtZSk7Cj4gIAlt
ZS0+ZmxhZ3MgJj0gfihQRl9SQU5ET01JWkUgfCBQRl9GT1JLTk9FWEVDIHwgUEZfS1RIUkVBRCB8
Cj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9leGl0LmMgYi9rZXJuZWwvZXhpdC5jCj4gaW5kZXggYjAw
YTI1YmI0YWI5Li4wODg0YTc1YmMyZjggMTAwNjQ0Cj4gLS0tIGEva2VybmVsL2V4aXQuYwo+ICsr
KyBiL2tlcm5lbC9leGl0LmMKPiBAQCAtNzM3LDIwICs3MzcsNiBAQCB2b2lkIF9fbm9yZXR1cm4g
ZG9fZXhpdChsb25nIGNvZGUpCj4gIAo+ICAJV0FSTl9PTihibGtfbmVlZHNfZmx1c2hfcGx1Zyh0
c2spKTsKPiAgCj4gLQkvKgo+IC0JICogSWYgZG9fZGVhZCBpcyBjYWxsZWQgYmVjYXVzZSB0aGlz
IHByb2Nlc3NlcyBvb3BzZWQsIGl0J3MgcG9zc2libGUKPiAtCSAqIHRoYXQgZ2V0X2ZzKCkgd2Fz
IGxlZnQgYXMgS0VSTkVMX0RTLCBzbyByZXNldCBpdCB0byBVU0VSX0RTIGJlZm9yZQo+IC0JICog
Y29udGludWluZy4gQW1vbmdzdCBvdGhlciBwb3NzaWJsZSByZWFzb25zLCB0aGlzIGlzIHRvIHBy
ZXZlbnQKPiAtCSAqIG1tX3JlbGVhc2UoKS0+Y2xlYXJfY2hpbGRfdGlkKCkgZnJvbSB3cml0aW5n
IHRvIGEgdXNlci1jb250cm9sbGVkCj4gLQkgKiBrZXJuZWwgYWRkcmVzcy4KPiAtCSAqCj4gLQkg
KiBPbiB1cHRvZGF0ZSBhcmNoaXRlY3R1cmVzIGZvcmNlX3VhY2Nlc3NfYmVnaW4gaXMgYSBub29w
LiAgT24KPiAtCSAqIGFyY2hpdGVjdHVyZXMgdGhhdCBzdGlsbCBoYXZlIHNldF9mcy9nZXRfZnMg
aW4gYWRkaXRpb24gdG8gaGFuZGxpbmcKPiAtCSAqIG9vcHNlcyBoYW5kbGVzIGtlcm5lbCB0aHJl
YWRzIHRoYXQgcnVuIGFzIHNldF9mcyhLRVJORUxfRFMpIGJ5Cj4gLQkgKiBkZWZhdWx0Lgo+IC0J
ICovCj4gLQlmb3JjZV91YWNjZXNzX2JlZ2luKCk7Cj4gLQo+ICAJa2Nvdl90YXNrX2V4aXQodHNr
KTsKPiAgCj4gIAljb3JlZHVtcF90YXNrX2V4aXQodHNrKTsKPiBkaWZmIC0tZ2l0IGEva2VybmVs
L2t0aHJlYWQuYyBiL2tlcm5lbC9rdGhyZWFkLmMKPiBpbmRleCAzOGM2ZGQ4MjJkYTguLjE2YzIy
NzVkNGI1MCAxMDA2NDQKPiAtLS0gYS9rZXJuZWwva3RocmVhZC5jCj4gKysrIGIva2VybmVsL2t0
aHJlYWQuYwo+IEBAIC01NSw3ICs1NSw2IEBAIHN0cnVjdCBrdGhyZWFkIHsKPiAgCWludCByZXN1
bHQ7Cj4gIAlpbnQgKCp0aHJlYWRmbikodm9pZCAqKTsKPiAgCXZvaWQgKmRhdGE7Cj4gLQltbV9z
ZWdtZW50X3Qgb2xkZnM7Cj4gIAlzdHJ1Y3QgY29tcGxldGlvbiBwYXJrZWQ7Cj4gIAlzdHJ1Y3Qg
Y29tcGxldGlvbiBleGl0ZWQ7Cj4gICNpZmRlZiBDT05GSUdfQkxLX0NHUk9VUAo+IEBAIC0xNDQx
LDggKzE0NDAsNiBAQCB2b2lkIGt0aHJlYWRfdXNlX21tKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQo+
ICAJCW1tZHJvcChhY3RpdmVfbW0pOwo+ICAJZWxzZQo+ICAJCXNtcF9tYigpOwo+IC0KPiAtCXRv
X2t0aHJlYWQodHNrKS0+b2xkZnMgPSBmb3JjZV91YWNjZXNzX2JlZ2luKCk7Cj4gIH0KPiAgRVhQ
T1JUX1NZTUJPTF9HUEwoa3RocmVhZF91c2VfbW0pOwo+ICAKPiBAQCAtMTQ1Nyw4ICsxNDU0LDYg
QEAgdm9pZCBrdGhyZWFkX3VudXNlX21tKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQo+ICAJV0FSTl9P
Tl9PTkNFKCEodHNrLT5mbGFncyAmIFBGX0tUSFJFQUQpKTsKPiAgCVdBUk5fT05fT05DRSghdHNr
LT5tbSk7Cj4gIAo+IC0JZm9yY2VfdWFjY2Vzc19lbmQodG9fa3RocmVhZCh0c2spLT5vbGRmcyk7
Cj4gLQo+ICAJdGFza19sb2NrKHRzayk7Cj4gIAkvKgo+ICAJICogV2hlbiBhIGt0aHJlYWQgc3Rv
cHMgb3BlcmF0aW5nIG9uIGFuIGFkZHJlc3Mgc3BhY2UsIHRoZSBsb29wCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApP
cGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3Jn
L2xpc3RpbmZvL29wZW5yaXNjCg==
