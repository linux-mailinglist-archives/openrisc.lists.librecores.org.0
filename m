Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2E114435590
	for <lists+openrisc@lfdr.de>; Wed, 20 Oct 2021 23:52:16 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id CE2B82420B;
	Wed, 20 Oct 2021 23:52:15 +0200 (CEST)
Received: from out01.mta.xmission.com (out01.mta.xmission.com [166.70.13.231])
 by mail.librecores.org (Postfix) with ESMTPS id 8D64320DE0
 for <openrisc@lists.librecores.org>; Wed, 20 Oct 2021 23:52:14 +0200 (CEST)
Received: from in02.mta.xmission.com ([166.70.13.52]:40000)
 by out01.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1mdJVD-00FiWe-CQ; Wed, 20 Oct 2021 15:52:03 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]:59328
 helo=email.xmission.com)
 by in02.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1mdJVA-002PXD-JP; Wed, 20 Oct 2021 15:52:02 -0600
From: ebiederm@xmission.com (Eric W. Biederman)
To: <linux-kernel@vger.kernel.org>
References: <87y26nmwkb.fsf@disp2133>
Date: Wed, 20 Oct 2021 16:51:52 -0500
In-Reply-To: <87y26nmwkb.fsf@disp2133> (Eric W. Biederman's message of "Wed,
 20 Oct 2021 12:32:20 -0500")
Message-ID: <877de7jrev.fsf@disp2133>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1mdJVA-002PXD-JP; ; ; mid=<877de7jrev.fsf@disp2133>; ; ;
 hst=in02.mta.xmission.com; ; ; ip=68.227.160.95; ; ; frm=ebiederm@xmission.com;
 ; ; spf=neutral
X-XM-AID: U2FsdGVkX18ePEKUK1liVK4VGBQcsP6jPz9QJs+YQsA=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa07.xmission.com
X-Spam-Level: ***
X-Spam-Status: No, score=3.9 required=8.0 tests=ALL_TRUSTED,BAYES_50,
 DCC_CHECK_NEGATIVE,FVGT_m_MULTI_ODD,TR_Symld_Words,T_TooManySym_01,
 T_TooManySym_02,T_TooManySym_03,XMNoVowels,XMSubLong
 autolearn=disabled version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
 *      [score: 0.5000] *  0.7 XMSubLong Long Subject
 *  1.5 XMNoVowels Alpha-numberic number with no vowels
 *  1.5 TR_Symld_Words too many words that have symbols inside
 * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
 *      [sa07 1397; Body=1 Fuz1=1 Fuz2=1]
 *  0.0 T_TooManySym_01 4+ unique symbols in subject
 *  0.0 T_TooManySym_03 6+ unique symbols in subject
 *  0.0 T_TooManySym_02 5+ unique symbols in subject
 *  0.4 FVGT_m_MULTI_ODD Contains multiple odd letter combinations
X-Spam-DCC: XMission; sa07 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ***;<linux-kernel@vger.kernel.org>
X-Spam-Relay-Country: 
X-Spam-Timing: total 1553 ms - load_scoreonly_sql: 0.05 (0.0%),
 signal_user_changed: 11 (0.7%), b_tie_ro: 10 (0.6%), parse: 1.12
 (0.1%), extract_message_metadata: 13 (0.8%), get_uri_detail_list: 2.4
 (0.2%), tests_pri_-1000: 17 (1.1%), tests_pri_-950: 1.59 (0.1%),
 tests_pri_-900: 1.24 (0.1%), tests_pri_-90: 85 (5.5%), check_bayes: 83
 (5.4%), b_tokenize: 16 (1.1%), b_tok_get_all: 10 (0.7%), b_comp_prob:
 3.1 (0.2%), b_tok_touch_all: 49 (3.2%), b_finish: 0.85 (0.1%),
 tests_pri_0: 1408 (90.7%), check_dkim_signature: 0.63 (0.0%),
 check_dkim_adsp: 2.3 (0.2%), poll_dns_idle: 0.55 (0.0%), tests_pri_10:
 3.1 (0.2%), tests_pri_500: 9 (0.6%), rewrite_mail: 0.00 (0.0%)
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
Subject: [OpenRISC] [PATCH 21/20] signal: Replace force_sigsegv(SIGSEGV)
 with force_fatal_sig(SIGSEGV)
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

Ck5vdyB0aGF0IGZvcmNlX2ZhdGFsX3NpZyBleGlzdHMgaXQgaXMgdW5uZWNlc3NhcnkgYW5kIGEg
Yml0IGNvbmZ1c2luZwp0byB1c2UgZm9yY2Vfc2lnc2VndiBpbiBjYXNlcyB3aGVyZSB0aGUgc2lt
cGxlciBmb3JjZV9mYXRhbF9zaWcgaXMKd2FudGVkLiAgU28gY2hhbmdlIGV2ZXJ5IGluc3RhbmNl
IHdlIGNhbiB0byBtYWtlIHRoZSBjb2RlIGNsZWFyZXIuCgpTaWduZWQtb2ZmLWJ5OiAiRXJpYyBX
LiBCaWVkZXJtYW4iIDxlYmllZGVybUB4bWlzc2lvbi5jb20+Ci0tLQogYXJjaC9hcmMva2VybmVs
L3Byb2Nlc3MuYyAgICAgICB8IDIgKy0KIGFyY2gvbTY4ay9rZXJuZWwvdHJhcHMuYyAgICAgICAg
fCAyICstCiBhcmNoL3Bvd2VycGMva2VybmVsL3NpZ25hbF8zMi5jIHwgMiArLQogYXJjaC9wb3dl
cnBjL2tlcm5lbC9zaWduYWxfNjQuYyB8IDQgKystLQogYXJjaC9zMzkwL2tlcm5lbC90cmFwcy5j
ICAgICAgICB8IDIgKy0KIGFyY2gvdW0va2VybmVsL3RyYXAuYyAgICAgICAgICAgfCAyICstCiBh
cmNoL3g4Ni9rZXJuZWwvdm04Nl8zMi5jICAgICAgIHwgMiArLQogZnMvZXhlYy5jICAgICAgICAg
ICAgICAgICAgICAgICB8IDIgKy0KIDggZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA5
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJjL2tlcm5lbC9wcm9jZXNzLmMgYi9h
cmNoL2FyYy9rZXJuZWwvcHJvY2Vzcy5jCmluZGV4IDM3OTM4NzZmNDJkOS4uOGU5MDA1MmY2ZjA1
IDEwMDY0NAotLS0gYS9hcmNoL2FyYy9rZXJuZWwvcHJvY2Vzcy5jCisrKyBiL2FyY2gvYXJjL2tl
cm5lbC9wcm9jZXNzLmMKQEAgLTI5NCw3ICsyOTQsNyBAQCBpbnQgZWxmX2NoZWNrX2FyY2goY29u
c3Qgc3RydWN0IGVsZjMyX2hkciAqeCkKIAllZmxhZ3MgPSB4LT5lX2ZsYWdzOwogCWlmICgoZWZs
YWdzICYgRUZfQVJDX09TQUJJX01TSykgIT0gRUZfQVJDX09TQUJJX0NVUlJFTlQpIHsKIAkJcHJf
ZXJyKCJBQkkgbWlzbWF0Y2ggLSB5b3UgbmVlZCBuZXdlciB0b29sY2hhaW5cbiIpOwotCQlmb3Jj
ZV9zaWdzZWd2KFNJR1NFR1YpOworCQlmb3JjZV9mYXRhbF9zaWcoU0lHU0VHVik7CiAJCXJldHVy
biAwOwogCX0KIApkaWZmIC0tZ2l0IGEvYXJjaC9tNjhrL2tlcm5lbC90cmFwcy5jIGIvYXJjaC9t
NjhrL2tlcm5lbC90cmFwcy5jCmluZGV4IDViMTlmY2RjZDY5ZS4uNzQwNDVkMTY0ZGRiIDEwMDY0
NAotLS0gYS9hcmNoL202OGsva2VybmVsL3RyYXBzLmMKKysrIGIvYXJjaC9tNjhrL2tlcm5lbC90
cmFwcy5jCkBAIC0xMTUwLDcgKzExNTAsNyBAQCBhc21saW5rYWdlIHZvaWQgc2V0X2VzcDAodW5z
aWduZWQgbG9uZyBzc3ApCiAgKi8KIGFzbWxpbmthZ2Ugdm9pZCBmcHNwMDQwX2RpZSh2b2lkKQog
ewotCWZvcmNlX3NpZ3NlZ3YoU0lHU0VHVik7CisJZm9yY2VfZmF0YWxfc2lnKFNJR1NFR1YpOwog
fQogCiAjaWZkZWYgQ09ORklHX002OEtGUFVfRU1VCmRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMv
a2VybmVsL3NpZ25hbF8zMi5jIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9zaWduYWxfMzIuYwppbmRl
eCA2NjZmM2RhNDEyMzIuLjkzM2FiOTU4MDVhNiAxMDA2NDQKLS0tIGEvYXJjaC9wb3dlcnBjL2tl
cm5lbC9zaWduYWxfMzIuYworKysgYi9hcmNoL3Bvd2VycGMva2VybmVsL3NpZ25hbF8zMi5jCkBA
IC0xMDYzLDcgKzEwNjMsNyBAQCBTWVNDQUxMX0RFRklORTMoc3dhcGNvbnRleHQsIHN0cnVjdCB1
Y29udGV4dCBfX3VzZXIgKiwgb2xkX2N0eCwKIAkgKiBXZSBraWxsIHRoZSB0YXNrIHdpdGggYSBT
SUdTRUdWIGluIHRoaXMgc2l0dWF0aW9uLgogCSAqLwogCWlmIChkb19zZXRjb250ZXh0KG5ld19j
dHgsIHJlZ3MsIDApKSB7Ci0JCWZvcmNlX3NpZ3NlZ3YoU0lHU0VHVik7CisJCWZvcmNlX2ZhdGFs
X3NpZyhTSUdTRUdWKTsKIAkJcmV0dXJuIC1FRkFVTFQ7CiAJfQogCmRpZmYgLS1naXQgYS9hcmNo
L3Bvd2VycGMva2VybmVsL3NpZ25hbF82NC5jIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9zaWduYWxf
NjQuYwppbmRleCBkOGRlNjIyYzllNGEuLjhlYWQ5YjNmNDdjNiAxMDA2NDQKLS0tIGEvYXJjaC9w
b3dlcnBjL2tlcm5lbC9zaWduYWxfNjQuYworKysgYi9hcmNoL3Bvd2VycGMva2VybmVsL3NpZ25h
bF82NC5jCkBAIC03MDQsNyArNzA0LDcgQEAgU1lTQ0FMTF9ERUZJTkUzKHN3YXBjb250ZXh0LCBz
dHJ1Y3QgdWNvbnRleHQgX191c2VyICosIG9sZF9jdHgsCiAJICovCiAKIAlpZiAoX19nZXRfdXNl
cl9zaWdzZXQoJnNldCwgJm5ld19jdHgtPnVjX3NpZ21hc2spKSB7Ci0JCWZvcmNlX3NpZ3NlZ3Yo
U0lHU0VHVik7CisJCWZvcmNlX2ZhdGFsX3NpZyhTSUdTRUdWKTsKIAkJcmV0dXJuIC1FRkFVTFQ7
CiAJfQogCXNldF9jdXJyZW50X2Jsb2NrZWQoJnNldCk7CkBAIC03MTMsNyArNzEzLDcgQEAgU1lT
Q0FMTF9ERUZJTkUzKHN3YXBjb250ZXh0LCBzdHJ1Y3QgdWNvbnRleHQgX191c2VyICosIG9sZF9j
dHgsCiAJCXJldHVybiAtRUZBVUxUOwogCWlmIChfX3Vuc2FmZV9yZXN0b3JlX3NpZ2NvbnRleHQo
Y3VycmVudCwgTlVMTCwgMCwgJm5ld19jdHgtPnVjX21jb250ZXh0KSkgewogCQl1c2VyX3JlYWRf
YWNjZXNzX2VuZCgpOwotCQlmb3JjZV9zaWdzZWd2KFNJR1NFR1YpOworCQlmb3JjZV9mYXRhbF9z
aWcoU0lHU0VHVik7CiAJCXJldHVybiAtRUZBVUxUOwogCX0KIAl1c2VyX3JlYWRfYWNjZXNzX2Vu
ZCgpOwpkaWZmIC0tZ2l0IGEvYXJjaC9zMzkwL2tlcm5lbC90cmFwcy5jIGIvYXJjaC9zMzkwL2tl
cm5lbC90cmFwcy5jCmluZGV4IDUxNzI5ZWEyY2Y4ZS4uMDFhN2M2OGRjZmI2IDEwMDY0NAotLS0g
YS9hcmNoL3MzOTAva2VybmVsL3RyYXBzLmMKKysrIGIvYXJjaC9zMzkwL2tlcm5lbC90cmFwcy5j
CkBAIC04NCw3ICs4NCw3IEBAIHN0YXRpYyB2b2lkIGRlZmF1bHRfdHJhcF9oYW5kbGVyKHN0cnVj
dCBwdF9yZWdzICpyZWdzKQogewogCWlmICh1c2VyX21vZGUocmVncykpIHsKIAkJcmVwb3J0X3Vz
ZXJfZmF1bHQocmVncywgU0lHU0VHViwgMCk7Ci0JCWZvcmNlX3NpZ3NlZ3YoU0lHU0VHVik7CisJ
CWZvcmNlX2ZhdGFsX3NpZyhTSUdTRUdWKTsKIAl9IGVsc2UKIAkJZGllKHJlZ3MsICJVbmtub3du
IHByb2dyYW0gZXhjZXB0aW9uIik7CiB9CmRpZmYgLS1naXQgYS9hcmNoL3VtL2tlcm5lbC90cmFw
LmMgYi9hcmNoL3VtL2tlcm5lbC90cmFwLmMKaW5kZXggMzE5OGM0NzY3Mzg3Li5jMzJlZmIwOWRi
MjEgMTAwNjQ0Ci0tLSBhL2FyY2gvdW0va2VybmVsL3RyYXAuYworKysgYi9hcmNoL3VtL2tlcm5l
bC90cmFwLmMKQEAgLTE1OCw3ICsxNTgsNyBAQCBzdGF0aWMgdm9pZCBiYWRfc2VndihzdHJ1Y3Qg
ZmF1bHRpbmZvIGZpLCB1bnNpZ25lZCBsb25nIGlwKQogCiB2b2lkIGZhdGFsX3NpZ3NlZ3Yodm9p
ZCkKIHsKLQlmb3JjZV9zaWdzZWd2KFNJR1NFR1YpOworCWZvcmNlX2ZhdGFsX3NpZyhTSUdTRUdW
KTsKIAlkb19zaWduYWwoJmN1cnJlbnQtPnRocmVhZC5yZWdzKTsKIAkvKgogCSAqIFRoaXMgaXMg
dG8gdGVsbCBnY2MgdGhhdCB3ZSdyZSBub3QgcmV0dXJuaW5nIC0gZG9fc2lnbmFsCmRpZmYgLS1n
aXQgYS9hcmNoL3g4Ni9rZXJuZWwvdm04Nl8zMi5jIGIvYXJjaC94ODYva2VybmVsL3ZtODZfMzIu
YwppbmRleCAwNDBmZDAxYmU4YjMuLjdmZjBmNjIyYWJkNCAxMDA2NDQKLS0tIGEvYXJjaC94ODYv
a2VybmVsL3ZtODZfMzIuYworKysgYi9hcmNoL3g4Ni9rZXJuZWwvdm04Nl8zMi5jCkBAIC0xNTks
NyArMTU5LDcgQEAgdm9pZCBzYXZlX3Y4Nl9zdGF0ZShzdHJ1Y3Qga2VybmVsX3ZtODZfcmVncyAq
cmVncywgaW50IHJldHZhbCkKIAl1c2VyX2FjY2Vzc19lbmQoKTsKIEVmYXVsdDoKIAlwcl9hbGVy
dCgiY291bGQgbm90IGFjY2VzcyB1c2Vyc3BhY2Ugdm04NiBpbmZvXG4iKTsKLQlmb3JjZV9zaWdz
ZWd2KFNJR1NFR1YpOworCWZvcmNlX2ZhdGFsX3NpZyhTSUdTRUdWKTsKIH0KIAogc3RhdGljIGlu
dCBkb192bTg2X2lycV9oYW5kbGluZyhpbnQgc3ViZnVuY3Rpb24sIGludCBpcnFudW1iZXIpOwpk
aWZmIC0tZ2l0IGEvZnMvZXhlYy5jIGIvZnMvZXhlYy5jCmluZGV4IGEwOThjMTMzZDhkNy4uYWM3
YjUxYjUxZjM4IDEwMDY0NAotLS0gYS9mcy9leGVjLmMKKysrIGIvZnMvZXhlYy5jCkBAIC0xODUy
LDcgKzE4NTIsNyBAQCBzdGF0aWMgaW50IGJwcm1fZXhlY3ZlKHN0cnVjdCBsaW51eF9iaW5wcm0g
KmJwcm0sCiAJICogU0lHU0VHVi4KIAkgKi8KIAlpZiAoYnBybS0+cG9pbnRfb2Zfbm9fcmV0dXJu
ICYmICFmYXRhbF9zaWduYWxfcGVuZGluZyhjdXJyZW50KSkKLQkJZm9yY2Vfc2lnc2VndihTSUdT
RUdWKTsKKwkJZm9yY2VfZmF0YWxfc2lnKFNJR1NFR1YpOwogCiBvdXRfdW5tYXJrOgogCWN1cnJl
bnQtPmZzLT5pbl9leGVjID0gMDsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxp
c3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8v
b3BlbnJpc2MK
