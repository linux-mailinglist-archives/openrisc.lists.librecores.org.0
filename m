Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 751702E2935
	for <lists+openrisc@lfdr.de>; Fri, 25 Dec 2020 00:15:33 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9F2B42106E;
	Fri, 25 Dec 2020 00:15:32 +0100 (CET)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by mail.librecores.org (Postfix) with ESMTPS id 6D31820F8F
 for <openrisc@lists.librecores.org>; Tue, 22 Dec 2020 21:18:03 +0100 (CET)
Received: from [192.168.1.155] ([95.118.68.26]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N5FtF-1jtguL3EaD-0118EC; Tue, 22 Dec 2020 21:14:24 +0100
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 "Enrico Weigelt, metux IT consult" <info@metux.net>
References: <20201222184510.19415-1-info@metux.net>
 <CAMuHMdVze3oaWmzvzn8ROjpP6h6Tsv2SFLiV7T1Cnej36X445g@mail.gmail.com>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <2f1d53e9-0dbb-78ef-22d5-ab230438ddf0@metux.net>
Date: Tue, 22 Dec 2020 21:14:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVze3oaWmzvzn8ROjpP6h6Tsv2SFLiV7T1Cnej36X445g@mail.gmail.com>
Content-Language: tl
X-Provags-ID: V03:K1:UpSPX5SjSxB2JTjoTNk4sWDtA2g9Ks1Ix8dKZhB/ESwn1jWfyhx
 EoQG8feaYKyQLnGwygV2naaePTeCvGl6q4M5FCoVvWDzd5IDw7I4++spAXF1Cn7hlWYDZ9i
 kl7Eptzr5sffhmk6uqoQvQuMaJH6WbEHZSp8VbRZESTCM8tqF2liTqVeSG60D5ct0JeRFXM
 C/vRJPf10ZNRyihx6OQ7A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4rmsxPbYFfk=:r6XlGr1qgoUDdOPZvl+EZB
 Tvvn/+E+IBfJxp8NYxN6kmODEYBvHcxpBa91h8yz4H6rftNQGPPvhJG9K3iz7sa8U3axvH9gb
 k8MQxF8AkxpsOIqgXUvRf2/UkUWU0UyTVaNY4yxFyPXaJ5HZGvdBlHztqC0ROOQbfPfvuc9EL
 FxgUfcgonSSkeeYMjRiTB3zJbeFMtXOTHkBa2rvNba1MQtk+fNt8bwxkcg/16D1kNX6CaQa6R
 /HjaLu8M8eiwjXWLzppTMleqwd3hE1HiIRNtfJF9qFLMDQKH5ELRRUKQxUmk7wwJOm6jAqUoz
 DxOEn9gjBP8Krn67rCBumevzsK7LiZ8dtcUh+n3F3XTZoxMWvkNcvhbeCfAuF95ukrIWyQBXn
 H8gIR89lqyF1p5Egw7NhgnSoXyIbQAraihthZryjzaPuyq4jPkP8GrsbXJIV3
X-Mailman-Approved-At: Fri, 25 Dec 2020 00:15:22 +0100
Subject: Re: [OpenRISC] [PATCH] arch: consolidate pm_power_off callback
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
Cc: Rich Felker <dalias@libc.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 linux-csky@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jonas Bonn <jonas@southpole.se>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-c6x-dev@linux-c6x.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 Helge Deller <deller@gmx.de>, the arch/x86 maintainers <x86@kernel.org>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Linux PM list <linux-pm@vger.kernel.org>, Mark Salter <msalter@redhat.com>,
 Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Borislav Petkov <bp@alien8.de>,
 Christian Brauner <christian@brauner.io>, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gMjIuMTIuMjAgMTk6NTQsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToKCkhpLAoKPiBPbiBU
dWUsIERlYyAyMiwgMjAyMCBhdCA3OjQ2IFBNIEVucmljbyBXZWlnZWx0LCBtZXR1eCBJVCBjb25z
dWx0Cj4gPGluZm9AbWV0dXgubmV0PiB3cm90ZToKPj4gTW92ZSB0aGUgcG1fcG93ZXJfb2ZmIGNh
bGxiYWNrIGludG8gb25lIGdsb2JhbCBwbGFjZSBhbmQgYWxzbyBhZGQgYW4KPj4gZnVuY3Rpb24g
Zm9yIGNvbmRpdGlvbmFsbHkgY2FsbGluZyBpdCAod2hlbiBub3QgTlVMTCksIGluIG9yZGVyIHRv
IHJlbW92ZQo+PiBjb2RlIGR1cGxpY2F0aW9uIGluIGFsbCBpbmRpdmlkdWFsIGFyY2hzLgo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBFbnJpY28gV2VpZ2VsdCwgbWV0dXggSVQgY29uc3VsdCA8aW5mb0Bt
ZXR1eC5uZXQ+Cj4gCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQo+IAo+PiAtLS0gYS9hcmNoL2Fs
cGhhL2tlcm5lbC9wcm9jZXNzLmMKPj4gKysrIGIvYXJjaC9hbHBoYS9rZXJuZWwvcHJvY2Vzcy5j
Cj4+IEBAIC00MywxMiArNDMsNiBAQAo+PiAgI2luY2x1ZGUgInByb3RvLmgiCj4+ICAjaW5jbHVk
ZSAicGNpX2ltcGwuaCIKPj4KPj4gLS8qCj4+IC0gKiBQb3dlciBvZmYgZnVuY3Rpb24sIGlmIGFu
eQo+PiAtICovCj4+IC12b2lkICgqcG1fcG93ZXJfb2ZmKSh2b2lkKSA9IG1hY2hpbmVfcG93ZXJf
b2ZmOwo+IAo+IEFzc2lnbm1lbnRzIGxpa2UgdGhlc2UgYXJlIGxvc3QgaW4gdGhlIGNvbnZlcnNp
b24uCgpZZXMsIGJ1dCB0aGlzIGRvZXNuJ3Qgc2VlbSB0byBiZSBldmVyIGNhbGxlZCBhbnl3YXlz
LiAoaW4gYXJjaC9hbHBoYSkKQW5kLCBCVFcsIGxldHRpbmcgaXQgcG9pbnQgdG8gbWFjaGluZV9w
b3dlcl9vZmYoKSBkb2Vzbid0IG1ha2UgbXVjaApzZW5zZSwgc2luY2UgaXQncyB0aGUgYXJjaCdz
IG1hY2hpbmVfcG93ZXJfb2ZmKCkgZnVuY3Rpb24sIHdobydyZQpjYWxsaW5nIHBtX3Bvd2VyX29m
ZigpLgoKQWN0dWFsbHksIHdlIGNvdWxkIHJlbW92ZSBwbV9wb3dlcl9vZmYgY29tcGxldGVseSBm
cm9tIGhlcmUsIGFzc3VtaW5nCm5vYm9keSB3b3VsZCAqYnVpbGQqIGFueSBkcml2ZXJzIHRoYXQg
cmVnaXN0ZXIgdGhlbXNlbHZlcyBpbnRvCnBtX3Bvd2VyX29mZi4KCklmIHlvdSBmZWVsIGJldHRl
ciB3aXRoIGl0LCBJIGNvdWxkIHBvc3QgYSBwYXRjaCB0aGF0IGp1c3QgcmVtb3ZlcwpwbV9wb3dl
cl9vZmYgZnJvbSBhcmNoL2FscGhhLgoKCi0tbXR4CgotLSAKLS0tCkhpbndlaXM6IHVudmVyc2No
bMO8c3NlbHRlIEUtTWFpbHMga8O2bm5lbiBsZWljaHQgYWJnZWjDtnJ0IHVuZCBtYW5pcHVsaWVy
dAp3ZXJkZW4gISBGw7xyIGVpbmUgdmVydHJhdWxpY2hlIEtvbW11bmlrYXRpb24gc2VuZGVuIFNp
ZSBiaXR0ZSBpaHJlbgpHUEcvUEdQLVNjaGzDvHNzZWwgenUuCi0tLQpFbnJpY28gV2VpZ2VsdCwg
bWV0dXggSVQgY29uc3VsdApGcmVlIHNvZnR3YXJlIGFuZCBMaW51eCBlbWJlZGRlZCBlbmdpbmVl
cmluZwppbmZvQG1ldHV4Lm5ldCAtLSArNDktMTUxLTI3NTY1Mjg3Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVu
UklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xp
c3RpbmZvL29wZW5yaXNjCg==
