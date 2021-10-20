Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 6DB20435154
	for <lists+openrisc@lfdr.de>; Wed, 20 Oct 2021 19:32:43 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id F013124205;
	Wed, 20 Oct 2021 19:32:42 +0200 (CEST)
Received: from out01.mta.xmission.com (out01.mta.xmission.com [166.70.13.231])
 by mail.librecores.org (Postfix) with ESMTPS id 2378323CDC
 for <openrisc@lists.librecores.org>; Wed, 20 Oct 2021 19:32:41 +0200 (CEST)
Received: from in01.mta.xmission.com ([166.70.13.51]:55338)
 by out01.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1mdFS2-00EuET-9k; Wed, 20 Oct 2021 11:32:30 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]:47416
 helo=email.xmission.com)
 by in01.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1mdFS0-009qGU-Te; Wed, 20 Oct 2021 11:32:29 -0600
From: ebiederm@xmission.com (Eric W. Biederman)
To: <linux-kernel@vger.kernel.org>
Date: Wed, 20 Oct 2021 12:32:20 -0500
Message-ID: <87y26nmwkb.fsf@disp2133>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1mdFS0-009qGU-Te; ; ; mid=<87y26nmwkb.fsf@disp2133>; ; ;
 hst=in01.mta.xmission.com; ; ; ip=68.227.160.95; ; ; frm=ebiederm@xmission.com;
 ; ; spf=neutral
X-XM-AID: U2FsdGVkX1+QTFOF+6WLUwS/6b+bA87HzOEzbRhNKPA=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa06.xmission.com
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=8.0 tests=ALL_TRUSTED,BAYES_50,
 DCC_CHECK_NEGATIVE,XMNoVowels autolearn=disabled version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
 *      [score: 0.4995]
 *  1.5 XMNoVowels Alpha-numberic number with no vowels
 * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
 *      [sa06 1397; Body=1 Fuz1=1 Fuz2=1]
X-Spam-DCC: XMission; sa06 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: *;<linux-kernel@vger.kernel.org>
X-Spam-Relay-Country: 
X-Spam-Timing: total 757 ms - load_scoreonly_sql: 0.06 (0.0%),
 signal_user_changed: 12 (1.5%), b_tie_ro: 10 (1.3%), parse: 1.10
 (0.1%), extract_message_metadata: 4.5 (0.6%), get_uri_detail_list: 2.1
 (0.3%), tests_pri_-1000: 7 (1.0%), tests_pri_-950: 1.30 (0.2%),
 tests_pri_-900: 1.11 (0.1%), tests_pri_-90: 238 (31.4%), check_bayes:
 237 (31.2%), b_tokenize: 14 (1.9%), b_tok_get_all: 12 (1.6%),
 b_comp_prob: 2.9 (0.4%), b_tok_touch_all: 203 (26.8%), b_finish: 0.95
 (0.1%), tests_pri_0: 469 (61.9%), check_dkim_signature: 0.62 (0.1%),
 check_dkim_adsp: 2.9 (0.4%), poll_dns_idle: 0.98 (0.1%), tests_pri_10:
 3.3 (0.4%), tests_pri_500: 11 (1.5%), rewrite_mail: 0.00 (0.0%)
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
Subject: [OpenRISC] [PATCH 00/20] exit cleanups
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
Cc: Rich Felker <dalias@libc.org>, linux-xtensa@linux-xtensa.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 H Peter Anvin <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Vincent Chen <deanbo422@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, linux-sh@vger.kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Jonas Bonn <jonas@southpole.se>, Kees Cook <keescook@chromium.org>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Al Viro <viro@ZenIV.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, linuxppc-dev@lists.ozlabs.org,
 Oleg Nesterov <oleg@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Maciej Rozycki <macro@orcam.me.uk>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 David Miller <davem@davemloft.net>, Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

CldoaWxlIGxvb2tpbmcgYXQgc29tZSBpc3N1ZXMgcmVsYXRlZCB0byB0aGUgZXhpdCBwYXRoIGlu
IHRoZSBrZXJuZWwgSQpmb3VuZCBzZXZlcmFsIGluc3RhbmNlcyB3aGVyZSB0aGUgY29kZSBpcyBu
b3QgdXNpbmcgdGhlIGV4aXN0aW5nCmFic3RyYWN0aW9ucyBwcm9wZXJseS4KClRoaXMgc2V0IG9m
IGNoYW5nZXMgaW50cm9kdWNlcyBmb3JjZV9mYXRhbF9zaWcgYSB3YXkgb2Ygc2VuZGluZwphIHNp
Z25hbCBhbmQgbm90IGFsbG93aW5nIGl0IHRvIGJlIGNhdWdodCwgYW5kIGNvcnJlY3RzIHRoZQpt
aXN1c2Ugb2YgdGhlIGV4aXN0aW5nIGFic3RyYWN0aW9ucyB0aGF0IEkgZm91bmQuCgpBIGxvdCBv
ZiB0aGUgbWlzdXNlIG9mIHRoZSBleGlzdGluZyBhYnN0cmFjdGlvbnMgYXJlIHNpbGx5IHRoaW5n
cyBzdWNoCmFzIGRvaW5nIHNvbWV0aGluZyBhZnRlciBjYWxsaW5nIGEgbm8gcmV0dXJuIGZ1bmN0
aW9uLCByb2xsaW5nIEJVRyBieQpoYW5kLCBkb2luZyBtb3JlIHdvcmsgdGhhbiBuZWNlc3Nhcnkg
dG8gdGVybWluYXRlIGEga2VybmVsIHRocmVhZCwgb3IKY2FsbGluZyBkb19leGl0KFNJR0tJTEwp
IGluc3RlYWQgb2YgY2FsbGluZyBmb3JjZV9zaWcoU0lHS0lMTCkuCgpJdCBpcyBteSBwbGFuIGFm
dGVyIHNlbmRpbmcgYWxsIG9mIHRoZXNlIGNoYW5nZXMgb3V0IGZvciByZXZpZXcgdG8gcGxhY2UK
dGhlbSBpbiBhIHRvcGljIGJyYW5jaCBmb3Igc2VuZGluZyBMaW51cy4gIEVzcGVjaWFsbHkgZm9y
IHRoZSBjaGFuZ2VzCnRoYXQgZGVwZW5kIHVwb24gdGhlIG5ldyBoZWxwZXIgZm9yY2VfZmF0YWxf
c2lnIHRoaXMgaXMgaW1wb3J0YW50LgoKRXJpYyBXLiBCaWVkZXJtYW4gKDIwKToKICAgICAgZXhp
dC9kb3VibGVmYXVsdDogUmVtb3ZlIGFwcGFyZW50bHkgYm9ndXMgY29tbWVudCBhYm91dCByZXdp
bmRfc3RhY2tfZG9fZXhpdAogICAgICBleGl0OiBSZW1vdmUgY2FsbHMgb2YgZG9fZXhpdCBhZnRl
ciBub3JldHVybiB2ZXJzaW9ucyBvZiBkaWUKICAgICAgcmVib290OiBSZW1vdmUgdGhlIHVucmVh
Y2hhYmxlIHBhbmljIGFmdGVyIGRvX2V4aXQgaW4gcmVib290KDIpCiAgICAgIHNpZ25hbC9zcGFy
YzMyOiBSZW1vdmUgdW5yZWFjaGFibGUgZG9fZXhpdCBpbiBkb19zcGFyY19mYXVsdAogICAgICBz
aWduYWwvbWlwczogVXBkYXRlIChfc2F2ZXxfcmVzdG9yZSlfZnBfY29udGV4dCB0byBmYWlsIHdp
dGggLUVGQVVMVAogICAgICBzaWduYWwvc2g6IFVzZSBmb3JjZV9zaWcoU0lHS0lMTCkgaW5zdGVh
ZCBvZiBkb19ncm91cF9leGl0KFNJR0tJTEwpCiAgICAgIHNpZ25hbC9wb3dlcnBjOiBPbiBzd2Fw
Y29udGV4dCBmYWlsdXJlIGZvcmNlIFNJR1NFR1YKICAgICAgc2lnbmFsL3NwYXJjOiBJbiBzZXR1
cF90c2JfcGFyYW1zIGNvbnZlcnQgb3BlbiBjb2RlZCBCVUcgaW50byBCVUcKICAgICAgc2lnbmFs
L3ZtODZfMzI6IFJlcGxhY2Ugb3BlbiBjb2RlZCBCVUdfT04gd2l0aCBhbiBhY3R1YWwgQlVHX09O
CiAgICAgIHNpZ25hbC92bTg2XzMyOiBQcm9wZXJseSBzZW5kIFNJR1NFR1Ygd2hlbiB0aGUgdm04
NiBzdGF0ZSBjYW5ub3QgYmUgc2F2ZWQuCiAgICAgIHNpZ25hbC9zMzkwOiBVc2UgZm9yY2Vfc2ln
c2VndiBpbiBkZWZhdWx0X3RyYXBfaGFuZGxlcgogICAgICBleGl0L2t0aHJlYWQ6IEhhdmUga2Vy
bmVsIHRocmVhZHMgcmV0dXJuIGluc3RlYWQgb2YgY2FsbGluZyBkb19leGl0CiAgICAgIHNpZ25h
bDogSW1wbGVtZW50IGZvcmNlX2ZhdGFsX3NpZwogICAgICBleGl0L3N5c2NhbGxfdXNlcl9kaXNw
YXRjaDogU2VuZCBvcmRpbmFyeSBzaWduYWxzIG9uIGZhaWx1cmUKICAgICAgc2lnbmFsL3NwYXJj
MzI6IEV4aXQgd2l0aCBhIGZhdGFsIHNpZ25hbCB3aGVuIHRyeV90b19jbGVhcl93aW5kb3dfYnVm
ZmVyIGZhaWxzCiAgICAgIHNpZ25hbC9zcGFyYzMyOiBJbiBzZXR1cF9ydF9mcmFtZSBhbmQgc2V0
dXBfZnJhbSB1c2UgZm9yY2VfZmF0YWxfc2lnCiAgICAgIHNpZ25hbC94ODY6IEluIGVtdWxhdGVf
dnN5c2NhbGwgZm9yY2UgYSBzaWduYWwgaW5zdGVhZCBvZiBjYWxsaW5nIGRvX2V4aXQKICAgICAg
ZXhpdC9ydGw4NzIzYnM6IFJlcGxhY2UgdGhlIG1hY3JvIHRocmVhZF9leGl0IHdpdGggYSBzaW1w
bGUgcmV0dXJuIDAKICAgICAgZXhpdC9ydGw4NzEyOiBSZXBsYWNlIHRoZSBtYWNybyB0aHJlYWRf
ZXhpdCB3aXRoIGEgc2ltcGxlIHJldHVybiAwCiAgICAgIGV4aXQvcjgxODhldTogUmVwbGFjZSB0
aGUgbWFjcm8gdGhyZWFkX2V4aXQgd2l0aCBhIHNpbXBsZSByZXR1cm4gMAoKIGFyY2gvbWlwcy9r
ZXJuZWwvcjIzMDBfZnB1LlMgICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKystLQogYXJjaC9t
aXBzL2tlcm5lbC9zeXNjYWxsLmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAgOSAtLS0tLS0t
LQogYXJjaC9uZHMzMi9rZXJuZWwvdHJhcHMuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
MiArLQogYXJjaC9uZHMzMi9tbS9mYXVsdC5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgNiArLS0tLQogYXJjaC9vcGVucmlzYy9rZXJuZWwvdHJhcHMuYyAgICAgICAgICAgICAgICAg
ICAgICAgfCAgMiArLQogYXJjaC9vcGVucmlzYy9tbS9mYXVsdC5jICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgNCArLS0tCiBhcmNoL3Bvd2VycGMva2VybmVsL3NpZ25hbF8zMi5jICAgICAg
ICAgICAgICAgICAgICB8ICA2ICsrKy0tCiBhcmNoL3Bvd2VycGMva2VybmVsL3NpZ25hbF82NC5j
ICAgICAgICAgICAgICAgICAgICB8ICA5ICsrKysrLS0tCiBhcmNoL3MzOTAvaW5jbHVkZS9hc20v
a2RlYnVnLmggICAgICAgICAgICAgICAgICAgICB8ICAyICstCiBhcmNoL3MzOTAva2VybmVsL2R1
bXBzdGFjay5jICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCiBhcmNoL3MzOTAva2VybmVs
L3RyYXBzLmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCiBhcmNoL3MzOTAvbW0v
ZmF1bHQuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyIC0tCiBhcmNoL3NoL2tl
cm5lbC9jcHUvZnB1LmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEwICsrKysrLS0tLQog
YXJjaC9zaC9rZXJuZWwvdHJhcHMuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiAr
LQogYXJjaC9zaC9tbS9mYXVsdC5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
MiAtLQogYXJjaC9zcGFyYy9rZXJuZWwvc2lnbmFsXzMyLmMgICAgICAgICAgICAgICAgICAgICAg
fCAgNCArKy0tCiBhcmNoL3NwYXJjL2tlcm5lbC93aW5kb3dzLmMgICAgICAgICAgICAgICAgICAg
ICAgICB8ICA2ICsrKy0tCiBhcmNoL3NwYXJjL21tL2ZhdWx0XzMyLmMgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAxIC0KIGFyY2gvc3BhcmMvbW0vdHNiLmMgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDIgKy0KIGFyY2gveDg2L2VudHJ5L3ZzeXNjYWxsL3ZzeXNjYWxsXzY0
LmMgICAgICAgICAgICAgIHwgIDMgKystCiBhcmNoL3g4Ni9rZXJuZWwvZG91YmxlZmF1bHRfMzIu
YyAgICAgICAgICAgICAgICAgICB8ICAzIC0tLQogYXJjaC94ODYva2VybmVsL3NpZ25hbC5jICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgNiArKysrLQogYXJjaC94ODYva2VybmVsL3ZtODZf
MzIuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgOCArKystLS0tCiBhcmNoL3h0ZW5zYS9r
ZXJuZWwvdHJhcHMuYyAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCiBhcmNoL3h0ZW5z
YS9tbS9mYXVsdC5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAzICstLQogZHJpdmVy
cy9maXJtd2FyZS9zdHJhdGl4MTAtc3ZjLmMgICAgICAgICAgICAgICAgICAgfCAgNCArKy0tCiBk
cml2ZXJzL3NvYy90aS93a3VwX20zX2lwYy5jICAgICAgICAgICAgICAgICAgICAgICB8ICAyICst
CiBkcml2ZXJzL3N0YWdpbmcvcjgxODhldS9jb3JlL3J0d19jbWQuYyAgICAgICAgICAgICB8ICAy
ICstCiBkcml2ZXJzL3N0YWdpbmcvcjgxODhldS9jb3JlL3J0d19tcC5jICAgICAgICAgICAgICB8
ICAyICstCiBkcml2ZXJzL3N0YWdpbmcvcjgxODhldS9pbmNsdWRlL29zZGVwX3NlcnZpY2UuaCAg
ICB8ICAyIC0tCiBkcml2ZXJzL3N0YWdpbmcvcnRsODcxMi9vc2RlcF9zZXJ2aWNlLmggICAgICAg
ICAgICB8ICAxIC0KIGRyaXZlcnMvc3RhZ2luZy9ydGw4NzEyL3J0bDg3MTJfY21kLmMgICAgICAg
ICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvc3RhZ2luZy9ydGw4NzIzYnMvY29yZS9ydHdfY21kLmMg
ICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvc3RhZ2luZy9ydGw4NzIzYnMvY29yZS9ydHdfeG1p
dC5jICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvc3RhZ2luZy9ydGw4NzIzYnMvaGFsL3J0bDg3
MjNic194bWl0LmMgICAgIHwgIDIgKy0KIC4uLi9ydGw4NzIzYnMvaW5jbHVkZS9vc2RlcF9zZXJ2
aWNlX2xpbnV4LmggICAgICAgIHwgIDIgLS0KIGZzL29jZnMyL2pvdXJuYWwuYyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDUgKy0tLS0KIGluY2x1ZGUvbGludXgvc2NoZWQvc2ln
bmFsLmggICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwoga2VybmVsL2VudHJ5L3N5c2NhbGxf
dXNlcl9kaXNwYXRjaC5jICAgICAgICAgICAgICAgfCAxMiArKysrKystLS0tCiBrZXJuZWwva3Ro
cmVhZC5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCiBrZXJuZWwv
cmVib290LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxIC0KIGtlcm5l
bC9zaWduYWwuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMjYgKysrKysr
KysrKysrKystLS0tLS0tLQogbmV0L2JhdG1hbi1hZHYvdHBfbWV0ZXIuYyAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgMiArLQogNDMgZmlsZXMgY2hhbmdlZCwgODMgaW5zZXJ0aW9ucygrKSwg
OTEgZGVsZXRpb25zKC0pCgpFcmljCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNv
cmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
