Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B7C65436319
	for <lists+openrisc@lfdr.de>; Thu, 21 Oct 2021 15:34:33 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 70B4D240E2;
	Thu, 21 Oct 2021 15:34:33 +0200 (CEST)
Received: from out03.mta.xmission.com (out03.mta.xmission.com [166.70.13.233])
 by mail.librecores.org (Postfix) with ESMTPS id EBB4C213A6
 for <openrisc@lists.librecores.org>; Thu, 21 Oct 2021 15:34:30 +0200 (CEST)
Received: from in02.mta.xmission.com ([166.70.13.52]:40512)
 by out03.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1mdYD5-005DQ9-NZ; Thu, 21 Oct 2021 07:34:19 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]:46380
 helo=email.xmission.com)
 by in02.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1mdYD4-003epC-7e; Thu, 21 Oct 2021 07:34:19 -0600
From: ebiederm@xmission.com (Eric W. Biederman)
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <87y26nmwkb.fsf@disp2133> <877de7jrev.fsf@disp2133>
 <CAMuHMdURxrdjsXq7+q-AWTwxVUdmddOj2vvNHv6M=WtsU5nRvg@mail.gmail.com>
Date: Thu, 21 Oct 2021 08:33:51 -0500
In-Reply-To: <CAMuHMdURxrdjsXq7+q-AWTwxVUdmddOj2vvNHv6M=WtsU5nRvg@mail.gmail.com>
 (Geert Uytterhoeven's message of "Thu, 21 Oct 2021 10:09:46 +0200")
Message-ID: <87tuhaijsw.fsf@disp2133>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1mdYD4-003epC-7e; ; ; mid=<87tuhaijsw.fsf@disp2133>; ; ;
 hst=in02.mta.xmission.com; ; ; ip=68.227.160.95; ; ; frm=ebiederm@xmission.com;
 ; ; spf=neutral
X-XM-AID: U2FsdGVkX1+Mpe2HbWR2YDGhZ3vVJNTbKaHiNpeOXoM=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa05.xmission.com
X-Spam-Level: ***
X-Spam-Status: No, score=3.5 required=8.0 tests=ALL_TRUSTED,BAYES_50,
 DCC_CHECK_NEGATIVE,TR_Symld_Words,T_TM2_M_HEADER_IN_MSG,
 T_TooManySym_01,T_TooManySym_02,T_TooManySym_03,XMNoVowels,XMSubLong
 autolearn=disabled version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
 *      [score: 0.4995]
 *  1.5 XMNoVowels Alpha-numberic number with no vowels
 *  0.7 XMSubLong Long Subject
 *  1.5 TR_Symld_Words too many words that have symbols inside
 *  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
 * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
 *      [sa05 1397; Body=1 Fuz1=1 Fuz2=1]
 *  0.0 T_TooManySym_02 5+ unique symbols in subject
 *  0.0 T_TooManySym_01 4+ unique symbols in subject
 *  0.0 T_TooManySym_03 6+ unique symbols in subject
X-Spam-DCC: XMission; sa05 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ***;Geert Uytterhoeven <geert@linux-m68k.org>
X-Spam-Relay-Country: 
X-Spam-Timing: total 897 ms - load_scoreonly_sql: 0.07 (0.0%),
 signal_user_changed: 12 (1.4%), b_tie_ro: 10 (1.2%), parse: 1.14
 (0.1%), extract_message_metadata: 14 (1.6%), get_uri_detail_list: 1.00
 (0.1%), tests_pri_-1000: 27 (3.0%), tests_pri_-950: 1.31 (0.1%),
 tests_pri_-900: 1.10 (0.1%), tests_pri_-90: 286 (31.9%), check_bayes:
 285 (31.7%), b_tokenize: 12 (1.3%), b_tok_get_all: 8 (0.9%),
 b_comp_prob: 2.2 (0.3%), b_tok_touch_all: 260 (28.9%), b_finish: 0.94
 (0.1%), tests_pri_0: 537 (59.9%), check_dkim_signature: 0.61 (0.1%),
 check_dkim_adsp: 3.0 (0.3%), poll_dns_idle: 1.00 (0.1%), tests_pri_10:
 3.2 (0.4%), tests_pri_500: 10 (1.2%), rewrite_mail: 0.00 (0.0%)
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
Subject: Re: [OpenRISC] [PATCH 21/20] signal: Replace force_sigsegv(SIGSEGV)
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
Cc: Rich Felker <dalias@libc.org>, Linux-sh list <linux-sh@vger.kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Greentime Hu <green.hu@gmail.com>, H Peter Anvin <hpa@zytor.com>,
 sparclinux <sparclinux@vger.kernel.org>, Vincent Chen <deanbo422@gmail.com>,
 Linux-Arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Kees Cook <keescook@chromium.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Openrisc <openrisc@lists.librecores.org>,
 Borislav Petkov <bp@alien8.de>, Al Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Chris Zankel <chris@zankel.net>,
 Jonas Bonn <jonas@southpole.se>, Nick Hu <nickhu@andestech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 David Miller <davem@davemloft.net>, Maciej Rozycki <macro@orcam.me.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

R2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4gd3JpdGVzOgoKPiBIaSBF
cmljLAo+Cj4gUGF0Y2ggMjEvMjA/CgpJbiByZXZpZXdpbmcgYW5vdGhlciBwYXJ0IG9mIHRoZSBw
YXRjaHNldCBMaW51cyBhc2tlZCBpZiBmb3JjZV9zaWdzZWd2CmNvdWxkIGdvIGF3YXkuICBJdCBj
YW4ndCBjb21wbGV0ZWx5IGJ1dCBJIGNhbiBnZXQgdGhpcyBmYXIuCgpHaXZlbiB0aGF0IGl0IGlz
IGp1c3QgYSBjbGVhbnVwIGl0IG1ha2VzIG1vc3Qgc2Vuc2UgdG8gbWUgYXMgYW4KYWRkaXRpb25h
bCBwYXRjaCBvbiB0b3Agb2Ygd2hhdCBpcyBhbHJlYWR5IGhlcmUuCgoKPiBPbiBXZWQsIE9jdCAy
MCwgMjAyMSBhdCAxMTo1MiBQTSBFcmljIFcuIEJpZWRlcm1hbgo+IDxlYmllZGVybUB4bWlzc2lv
bi5jb20+IHdyb3RlOgo+PiBOb3cgdGhhdCBmb3JjZV9mYXRhbF9zaWcgZXhpc3RzIGl0IGlzIHVu
bmVjZXNzYXJ5IGFuZCBhIGJpdCBjb25mdXNpbmcKPj4gdG8gdXNlIGZvcmNlX3NpZ3NlZ3YgaW4g
Y2FzZXMgd2hlcmUgdGhlIHNpbXBsZXIgZm9yY2VfZmF0YWxfc2lnIGlzCj4+IHdhbnRlZC4gIFNv
IGNoYW5nZSBldmVyeSBpbnN0YW5jZSB3ZSBjYW4gdG8gbWFrZSB0aGUgY29kZSBjbGVhcmVyLgo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiAiRXJpYyBXLiBCaWVkZXJtYW4iIDxlYmllZGVybUB4bWlzc2lv
bi5jb20+Cj4KPj4gIGFyY2gvbTY4ay9rZXJuZWwvdHJhcHMuYyAgICAgICAgfCAyICstCj4KPiBB
Y2tlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4KClRoYW5r
IHlvdS4KCkVyaWMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0
dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
