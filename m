Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 0D8E74367A6
	for <lists+openrisc@lfdr.de>; Thu, 21 Oct 2021 18:25:27 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 891F724194;
	Thu, 21 Oct 2021 18:25:26 +0200 (CEST)
Received: from out03.mta.xmission.com (out03.mta.xmission.com [166.70.13.233])
 by mail.librecores.org (Postfix) with ESMTPS id B967420BDE
 for <openrisc@lists.librecores.org>; Thu, 21 Oct 2021 18:25:24 +0200 (CEST)
Received: from in02.mta.xmission.com ([166.70.13.52]:49386)
 by out03.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1mdasZ-005agR-VI; Thu, 21 Oct 2021 10:25:20 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]:55044
 helo=email.xmission.com)
 by in02.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1mdasW-004580-Ld; Thu, 21 Oct 2021 10:25:19 -0600
From: ebiederm@xmission.com (Eric W. Biederman)
To: Kees Cook <keescook@chromium.org>
References: <87y26nmwkb.fsf@disp2133>
 <20211020174406.17889-2-ebiederm@xmission.com>
 <202110210858.41719190D2@keescook>
Date: Thu, 21 Oct 2021 11:25:08 -0500
In-Reply-To: <202110210858.41719190D2@keescook> (Kees Cook's message of "Thu, 
 21 Oct 2021 09:02:04 -0700")
Message-ID: <87cznycpln.fsf@disp2133>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1mdasW-004580-Ld; ; ; mid=<87cznycpln.fsf@disp2133>; ; ;
 hst=in02.mta.xmission.com; ; ; ip=68.227.160.95; ; ; frm=ebiederm@xmission.com;
 ; ; spf=neutral
X-XM-AID: U2FsdGVkX1+8ac5GaciGlAstn3lEEUZ+dUI+mMUpD0U=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa07.xmission.com
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=8.0 tests=ALL_TRUSTED,BAYES_50,
 DCC_CHECK_NEGATIVE,T_TM2_M_HEADER_IN_MSG,T_TooManySym_01,XMNoVowels,
 XMSubLong autolearn=disabled version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
 *      [score: 0.4918] *  0.7 XMSubLong Long Subject
 *  1.5 XMNoVowels Alpha-numberic number with no vowels
 *  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
 * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
 *      [sa07 1397; Body=1 Fuz1=1 Fuz2=1]
 *  0.0 T_TooManySym_01 4+ unique symbols in subject
X-Spam-DCC: XMission; sa07 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: **;Kees Cook <keescook@chromium.org>
X-Spam-Relay-Country: 
X-Spam-Timing: total 2655 ms - load_scoreonly_sql: 0.06 (0.0%),
 signal_user_changed: 11 (0.4%), b_tie_ro: 10 (0.4%), parse: 1.30
 (0.0%), extract_message_metadata: 11 (0.4%), get_uri_detail_list: 1.09
 (0.0%), tests_pri_-1000: 15 (0.6%), tests_pri_-950: 1.30 (0.0%),
 tests_pri_-900: 1.09 (0.0%), tests_pri_-90: 1221 (46.0%), check_bayes:
 1219 (45.9%), b_tokenize: 7 (0.3%), b_tok_get_all: 8 (0.3%),
 b_comp_prob: 2.4 (0.1%), b_tok_touch_all: 1197 (45.1%), b_finish: 1.20
 (0.0%), tests_pri_0: 1376 (51.8%), check_dkim_signature: 1.12 (0.0%),
 check_dkim_adsp: 7 (0.2%), poll_dns_idle: 2.7 (0.1%), tests_pri_10:
 3.2 (0.1%), tests_pri_500: 10 (0.4%), rewrite_mail: 0.00 (0.0%)
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
Subject: Re: [OpenRISC] [PATCH 02/20] exit: Remove calls of do_exit after
 noreturn versions of die
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
 Oleg Nesterov <oleg@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-sh@vger.kernel.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 Jonas Bonn <jonas@southpole.se>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, openrisc@lists.librecores.org,
 Al Viro <viro@zeniv.linux.org.uk>, Chris Zankel <chris@zankel.net>,
 Nick Hu <nickhu@andestech.com>, linux-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

S2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+IHdyaXRlczoKCj4gT24gV2VkLCBPY3Qg
MjAsIDIwMjEgYXQgMTI6NDM6NDhQTSAtMDUwMCwgRXJpYyBXLiBCaWVkZXJtYW4gd3JvdGU6Cj4+
IE9uIG5kczMyLCBvcGVucmlzYywgczM5MCwgc2gsIGFuZCB4dGVuc2EgdGhlIGZ1bmN0aW9uIGRp
ZSBuZXZlcgo+PiByZXR1cm5zLiAgTWFyayBkaWUgX19ub3JldHVybiBzbyB0aGF0IG5vIG9uZSBl
eHBlY3RzIGRpZSB0byByZXR1cm4uCj4+IFJlbW92ZSB0aGUgZG9fZXhpdCBjYWxscyBhZnRlciBk
aWUgYXMgdGhleSB3aWxsIG5ldmVyIGJlIHJlYWNoZWQuCj4KPiBNYXliZSBub3RlIHRoYXQgdGhl
ICJidXN0X3NwaW5sb2NrcyIgY2FsbHMgYXJlIGFsc28gcmVkdW5kYW50LCBzaW5jZQo+IHRoZXkn
cmUgaW4gZGllKCkuIEkgbm90ZSB0aGF0IGlzIGEgIm1pc21hdGNoIiBiZXR3ZWVuIHRoZSBkb19r
aWxsKCkKPiBpbiBkaWUoKSAoU0lHU0VHVikgYW5kIGFmdGVyIGRpZSgpIChTSUdLSUxMKS4gVGhp
cyBwYXRjaCBtYWtlcyBubwo+IGJlaGF2aW9yYWwgY2hhbmdlICh0aGUgZmlyc3QgY2FsbGVyIHdv
dWxkICJ3aW4iKSwgYnV0IEkgdGhvdWdodCBJJ2Qgbm90ZQo+IGl0IGluIGNhc2Ugc29tZSBhcmNo
aXRlY3R1cmUgd291bGQgcHJlZmVyIGEgZGlmZmVyZW50IHNpZ25hbC4KCklmIHNvbWVvbmUgaGFz
IHNvbWUgc3Ryb25nIHByZWZlcmVuY2VzIGluIHRoZSBtYXR0ZXIgb2Ygd2hpY2ggc2lnbmFsIGEK
d2FpdCBvbiBhIHByb2Nlc3NlcyB0aGF0IGhhcyBvb3BzZWQgc2hvdWxkIHJldHVybiBwbGVhc2Ug
bGV0IG1lIGtub3cuCgpNeSBuZXh0IHN0ZXAgaW4gY2xlYW5pbmcgdXAgdGhlIHVzZXMgb2YgZG9f
ZXhpdCBsb29rcyBsaWtlIGl0IGlzIGdvaW5nCnRvIGJlIGdldHRpbmcgYWxsIG9mIHRoZSBhcmNo
aXRlY3R1cmVzIHRvIHVzZSB0aGUgc2FtZSBzaWduYWwgZm9yIG9vcHNlcwooYWthIGRpZSksIGFu
ZCB0aGVuIGludHJvZHVjaW5nIGEgaGVscGVyIChjYWxsZWQgc29tZXRoaW5nIGxpa2UKIm1ha2Vf
dGFza19kZWFkIiBvciAib29wc190YXNrX2V4aXQiICkgdGhhdCB3aWxsIHJlcGxhY2UgZG9fZXhp
dCBvbiB0aGUKb29wcyBwYXRoIGFuZCBub3QgdGFrZSBhIHNpZ25hbCBudW1iZXIgYXQgYWxsLgoK
VGhhdCBoZWxwZXIgSSBjYW4gdGhlbiByZW1vdmUgdGhlIHB0cmFjZSBicmVhayBwb2ludCBmcm9t
IGFuZCBwb3NzaWJseQpzb21lIG9mIHRoZSBjb3JlZHVtcCBsb2dpYyBhcyB3ZWxsLiAgVWx0aW1h
dGVseSBpdCB3aWxsIGJlIHNvbWV0aGluZwp3ZSBjYW4gb3B0aW1pemUgZm9yIHRoZSBjYXNlIHdo
ZW4gd2Uga25vdyB0aGVyZSBpcyBhIGtlcm5lbCBidWcgYW5kIHdlCmp1c3Qgd2FudCB0aGUgdGFz
ayB0byBleGl0IHNvIHRoZSByZXN0IG9mIHRoZSBzeXN0ZW0gY2FuIGxpbXAgYWxvbmcKYXMgYmVz
dCBhcyBpdCBjYW4uCgpFcmljCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVz
Lm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
