Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B6DA420DCDB
	for <lists+openrisc@lfdr.de>; Mon, 29 Jun 2020 22:44:59 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6FF7420D12;
	Mon, 29 Jun 2020 22:44:58 +0200 (CEST)
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
 [209.85.219.65])
 by mail.librecores.org (Postfix) with ESMTPS id 31B5D20C8D
 for <openrisc@lists.librecores.org>; Sat, 27 Jun 2020 05:10:46 +0200 (CEST)
Received: by mail-qv1-f65.google.com with SMTP id el4so1315504qvb.13
 for <openrisc@lists.librecores.org>; Fri, 26 Jun 2020 20:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IWhrpNY7xlqQrJKXws+NUUAMsOukm6peWOP/1HXT+b4=;
 b=MvHmB7CoXy8gFuXApv7yepl4fB6XWMduaQXMKkjexs6EBNoy44PIkasc3jHMBHyJiB
 yxhBEyUIGz1mFKbiIW6Z6EVd1zN/3Om0ihcv2ZANU5T+fKLc38RiOEMGb2NgLL5H2DD8
 OkB0BKIcQ/hDyBhfRFCjDdgXX8QI/AoUglp4db/HlBTqkns/GK0vXrsUHCz9NIsJk+m2
 nZR6Zm85U5R5uVuhs5vdAsSF5PQz1O80d6Jklao8cWiVNAQ2Ra92qBBpXdeW65qnyGC2
 sizqjgIfQkQ+2ORhFs1lzaiFQCzDiaFP4uMUVTuiHqAQXpqsGfwYed6SZTkTzqXki18K
 Lteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IWhrpNY7xlqQrJKXws+NUUAMsOukm6peWOP/1HXT+b4=;
 b=c5RzhyMSFxNgPwu45hv9BClBhoXnxMPYupMRezA434mjrlw8VIUHpvkjANc91MiRFZ
 3wuqGxxmIQ2FSmFfeCbLWkaD4U7ZlhinB5dhPFzN/Wf/IaVfYRTXXFVGFwqas0eRpkIL
 1KC4DKGDTUGjPW6hC/lDevbbb6N3ugPywe59RoQACt9qA72MIxph02HGv3pHZ9LxLG17
 QgsLlDpGiEEYyuWk76ErQTv5Ns+IA/7zkdv6e3beiMBjy5kSWPkH/MZVDMFT5p3SZFl6
 x1fCfbV6esB+/fh1RHUFaR8bbUq9x6Iv3iHTblliEj8caH27ZKz/vPq5x5vCzylTevPQ
 JSSQ==
X-Gm-Message-State: AOAM533TPWsd9b+8ZiJRN1b6FTahaSxxs/zAEdJB5iiJk3CtW+dsovdm
 tITWHTmh/+i4/oAm3Ba1JvP/BxQyDJbY/4UuEBo=
X-Google-Smtp-Source: ABdhPJyp9Jehi5+JPZEhH13jMa9eG8B8riQx365j3HWzuOFxMhgSO2ctkHEAU9vFA2IzNhq1RyqN2yxKJtpbp4PLly4=
X-Received: by 2002:a0c:bda0:: with SMTP id n32mr6333372qvg.164.1593227445009; 
 Fri, 26 Jun 2020 20:10:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200622234326.906346-1-christian.brauner@ubuntu.com>
 <20200622234326.906346-18-christian.brauner@ubuntu.com>
In-Reply-To: <20200622234326.906346-18-christian.brauner@ubuntu.com>
From: Greentime Hu <green.hu@gmail.com>
Date: Sat, 27 Jun 2020 11:10:05 +0800
Message-ID: <CAEbi=3fbt_3DBEMhWUKY04KNxR=Xv0zesFGrJJDnx5D-8KUaaw@mail.gmail.com>
To: Christian Brauner <christian.brauner@ubuntu.com>
X-Mailman-Approved-At: Mon, 29 Jun 2020 22:44:54 +0200
Subject: Re: [OpenRISC] [PATCH 17/17] arch: rename copy_thread_tls() back to
 copy_thread()
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
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-sh@vger.kernel.org,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux <sparclinux@vger.kernel.org>,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, linux-s390 <linux-s390@vger.kernel.org>,
 linux-ia64@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Brian Cain <bcain@codeaurora.org>, linux-xtensa@linux-xtensa.org,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 linux-parisc@vger.kernel.org, Mark Salter <msalter@redhat.com>,
 linux-csky@vger.kernel.org, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp,
 Fenghua Yu <fenghua.yu@intel.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Kees Cook <keescook@chromium.org>, Jeff Dike <jdike@addtoit.com>,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
 linux-m68k@lists.linux-m68k.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Al Viro <viro@zeniv.linux.org.uk>,
 Paul Walmsley <paul.walmsley@sifive.com>, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Nick Hu <nickhu@andestech.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 openrisc@lists.librecores.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Weinberger <richard@nod.at>, Paul Mackerras <paulus@samba.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Q2hyaXN0aWFuIEJyYXVuZXIgPGNocmlzdGlhbi5icmF1bmVyQHVidW50dS5jb20+IOaWvCAyMDIw
5bm0NuaciDIz5pelIOmAseS6jCDkuIrljYg3OjU45a+r6YGT77yaCj4KPiBOb3cgdGhhdCBIQVZF
X0NPUFlfVEhSRUFEX1RMUyBoYXMgYmVlbiByZW1vdmVkLCByZW5hbWUgY29weV90aHJlYWRfdGxz
KCkKPiBiYWNrIHNpbXBseSBjb3B5X3RocmVhZCgpLiBJdCdzIGEgc2ltcGxlciBuYW1lLCBhbmQg
ZG9lc24ndCBpbXBseSB0aGF0IG9ubHkKPiB0bHMgaXMgY29waWVkIGhlcmUuIFRoaXMgZmluaXNo
ZXMgYW4gb3V0c3RhbmRpbmcgY2h1bmsgb2YgaW50ZXJuYWwgcHJvY2Vzcwo+IGNyZWF0aW9uIHdv
cmsgc2luY2Ugd2UndmUgYWRkZWQgY2xvbmUzKCkuCj4KPiBDYzogUmljaGFyZCBIZW5kZXJzb24g
PHJ0aEB0d2lkZGxlLm5ldD4KPiBDYzogSXZhbiBLb2tzaGF5c2t5IDxpbmtAanVyYXNzaWMucGFy
ay5tc3UucnU+Cj4gQ2M6IE1hdHQgVHVybmVyIDxtYXR0c3Q4OEBnbWFpbC5jb20+Cj4gQ2M6IFZp
bmVldCBHdXB0YSA8dmd1cHRhQHN5bm9wc3lzLmNvbT4KPiBDYzogUnVzc2VsbCBLaW5nIDxsaW51
eEBhcm1saW51eC5vcmcudWs+Cj4gQ2M6IENhdGFsaW4gTWFyaW5hcyA8Y2F0YWxpbi5tYXJpbmFz
QGFybS5jb20+Cj4gQ2M6IFdpbGwgRGVhY29uIDx3aWxsQGtlcm5lbC5vcmc+Cj4gQ2M6IE1hcmsg
U2FsdGVyIDxtc2FsdGVyQHJlZGhhdC5jb20+Cj4gQ2M6IEF1cmVsaWVuIEphY3F1aW90IDxqYWNx
dWlvdC5hdXJlbGllbkBnbWFpbC5jb20+Cj4gQ2M6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3Jn
Pgo+IENjOiBZb3NoaW5vcmkgU2F0byA8eXNhdG9AdXNlcnMuc291cmNlZm9yZ2UuanA+Cj4gQ2M6
IEJyaWFuIENhaW4gPGJjYWluQGNvZGVhdXJvcmEub3JnPgo+IENjOiBUb255IEx1Y2sgPHRvbnku
bHVja0BpbnRlbC5jb20+Cj4gQ2M6IEZlbmdodWEgWXUgPGZlbmdodWEueXVAaW50ZWwuY29tPgo+
IENjOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPgo+IENjOiBNaWNo
YWwgU2ltZWsgPG1vbnN0ckBtb25zdHIuZXU+Cj4gQ2M6IFRob21hcyBCb2dlbmRvZXJmZXIgPHRz
Ym9nZW5kQGFscGhhLmZyYW5rZW4uZGU+Cj4gQ2M6IE5pY2sgSHUgPG5pY2todUBhbmRlc3RlY2gu
Y29tPgo+IENjOiBHcmVlbnRpbWUgSHUgPGdyZWVuLmh1QGdtYWlsLmNvbT4KPiBDYzogVmluY2Vu
dCBDaGVuIDxkZWFuYm80MjJAZ21haWwuY29tPgo+IENjOiBMZXkgRm9vbiBUYW4gPGxleS5mb29u
LnRhbkBpbnRlbC5jb20+Cj4gQ2M6IEpvbmFzIEJvbm4gPGpvbmFzQHNvdXRocG9sZS5zZT4KPiBD
YzogU3RlZmFuIEtyaXN0aWFuc3NvbiA8c3RlZmFuLmtyaXN0aWFuc3NvbkBzYXVuYWxhaHRpLmZp
Pgo+IENjOiBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4KPiBDYzogIkphbWVzIEUu
Si4gQm90dG9tbGV5IiA8SmFtZXMuQm90dG9tbGV5QEhhbnNlblBhcnRuZXJzaGlwLmNvbT4KPiBD
YzogSGVsZ2UgRGVsbGVyIDxkZWxsZXJAZ214LmRlPgo+IENjOiBNaWNoYWVsIEVsbGVybWFuIDxt
cGVAZWxsZXJtYW4uaWQuYXU+Cj4gQ2M6IEJlbmphbWluIEhlcnJlbnNjaG1pZHQgPGJlbmhAa2Vy
bmVsLmNyYXNoaW5nLm9yZz4KPiBDYzogUGF1bCBNYWNrZXJyYXMgPHBhdWx1c0BzYW1iYS5vcmc+
Cj4gQ2M6IFBhdWwgV2FsbXNsZXkgPHBhdWwud2FsbXNsZXlAc2lmaXZlLmNvbT4KPiBDYzogUGFs
bWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4KPiBDYzogQWxiZXJ0IE91IDxhb3VAZWVj
cy5iZXJrZWxleS5lZHU+Cj4gQ2M6IENocmlzdGlhbiBCb3JudHJhZWdlciA8Ym9ybnRyYWVnZXJA
ZGUuaWJtLmNvbT4KPiBDYzogUmljaCBGZWxrZXIgPGRhbGlhc0BsaWJjLm9yZz4KPiBDYzogIkRh
dmlkIFMuIE1pbGxlciIgPGRhdmVtQGRhdmVtbG9mdC5uZXQ+Cj4gQ2M6IEplZmYgRGlrZSA8amRp
a2VAYWRkdG9pdC5jb20+Cj4gQ2M6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+
Cj4gQ2M6IEFudG9uIEl2YW5vdiA8YW50b24uaXZhbm92QGNhbWJyaWRnZWdyZXlzLmNvbT4KPiBD
YzogR3VhbiBYdWV0YW8gPGd4dEBwa3UuZWR1LmNuPgo+IENjOiBUaG9tYXMgR2xlaXhuZXIgPHRn
bHhAbGludXRyb25peC5kZT4KPiBDYzogSW5nbyBNb2xuYXIgPG1pbmdvQHJlZGhhdC5jb20+Cj4g
Q2M6IHg4NkBrZXJuZWwub3JnCj4gQ2M6ICJILiBQZXRlciBBbnZpbiIgPGhwYUB6eXRvci5jb20+
Cj4gQ2M6IENocmlzIFphbmtlbCA8Y2hyaXNAemFua2VsLm5ldD4KPiBDYzogTWF4IEZpbGlwcG92
IDxqY212YmtiY0BnbWFpbC5jb20+Cj4gQ2M6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0u
b3JnPgo+IENjOiAiUGV0ZXIgWmlqbHN0cmEgKEludGVsKSIgPHBldGVyekBpbmZyYWRlYWQub3Jn
Pgo+IENjOiAiTWF0dGhldyBXaWxjb3ggKE9yYWNsZSkiIDx3aWxseUBpbmZyYWRlYWQub3JnPgo+
IENjOiBBbCBWaXJvIDx2aXJvQHplbml2LmxpbnV4Lm9yZy51az4KPiBDYzogbGludXgtYWxwaGFA
dmdlci5rZXJuZWwub3JnCj4gQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKPiBDYzog
bGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IENjOiBsaW51eC1hcm0ta2VybmVs
QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBDYzogbGludXgtYzZ4LWRldkBsaW51eC1jNngub3JnCj4g
Q2M6IGxpbnV4LWNza3lAdmdlci5rZXJuZWwub3JnCj4gQ2M6IHVjbGludXgtaDgtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UuanAKPiBDYzogbGludXgtaGV4YWdvbkB2Z2VyLmtlcm5lbC5vcmcKPiBD
YzogbGludXgtaWE2NEB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGludXgtbTY4a0BsaXN0cy5saW51
eC1tNjhrLm9yZwo+IENjOiBsaW51eC1taXBzQHZnZXIua2VybmVsLm9yZwo+IENjOiBvcGVucmlz
Y0BsaXN0cy5saWJyZWNvcmVzLm9yZwo+IENjOiBsaW51eC1wYXJpc2NAdmdlci5rZXJuZWwub3Jn
Cj4gQ2M6IGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnCj4gQ2M6IGxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKPiBDYzogbGludXgtczM5MEB2Z2VyLmtlcm5lbC5vcmcKPiBDYzog
bGludXgtc2hAdmdlci5rZXJuZWwub3JnCj4gQ2M6IHNwYXJjbGludXhAdmdlci5rZXJuZWwub3Jn
Cj4gQ2M6IGxpbnV4LXVtQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBDYzogbGludXgteHRlbnNhQGxp
bnV4LXh0ZW5zYS5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gQnJhdW5lciA8Y2hyaXN0
aWFuLmJyYXVuZXJAdWJ1bnR1LmNvbT4KPiAtLS0KPiAgYXJjaC9hbHBoYS9rZXJuZWwvcHJvY2Vz
cy5jICAgICAgfCAyICstCj4gIGFyY2gvYXJjL2tlcm5lbC9wcm9jZXNzLmMgICAgICAgIHwgMiAr
LQo+ICBhcmNoL2FybS9rZXJuZWwvcHJvY2Vzcy5jICAgICAgICB8IDIgKy0KPiAgYXJjaC9hcm02
NC9rZXJuZWwvcHJvY2Vzcy5jICAgICAgfCAyICstCj4gIGFyY2gvYzZ4L2tlcm5lbC9wcm9jZXNz
LmMgICAgICAgIHwgMiArLQo+ICBhcmNoL2Nza3kva2VybmVsL3Byb2Nlc3MuYyAgICAgICB8IDIg
Ky0KPiAgYXJjaC9oODMwMC9rZXJuZWwvcHJvY2Vzcy5jICAgICAgfCAyICstCj4gIGFyY2gvaGV4
YWdvbi9rZXJuZWwvcHJvY2Vzcy5jICAgIHwgMiArLQo+ICBhcmNoL2lhNjQva2VybmVsL3Byb2Nl
c3MuYyAgICAgICB8IDQgKystLQo+ICBhcmNoL202OGsva2VybmVsL3Byb2Nlc3MuYyAgICAgICB8
IDIgKy0KPiAgYXJjaC9taWNyb2JsYXplL2tlcm5lbC9wcm9jZXNzLmMgfCAyICstCj4gIGFyY2gv
bWlwcy9rZXJuZWwvcHJvY2Vzcy5jICAgICAgIHwgMiArLQo+ICBhcmNoL25kczMyL2tlcm5lbC9w
cm9jZXNzLmMgICAgICB8IDIgKy0KPiAgYXJjaC9uaW9zMi9rZXJuZWwvcHJvY2Vzcy5jICAgICAg
fCAyICstCj4gIGFyY2gvb3BlbnJpc2Mva2VybmVsL3Byb2Nlc3MuYyAgIHwgNCArKy0tCj4gIGFy
Y2gvcGFyaXNjL2tlcm5lbC9wcm9jZXNzLmMgICAgIHwgMiArLQo+ICBhcmNoL3Bvd2VycGMva2Vy
bmVsL3Byb2Nlc3MuYyAgICB8IDIgKy0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jICAg
ICAgfCAyICstCj4gIGFyY2gvczM5MC9rZXJuZWwvcHJvY2Vzcy5jICAgICAgIHwgMiArLQo+ICBh
cmNoL3NoL2tlcm5lbC9wcm9jZXNzXzMyLmMgICAgICB8IDIgKy0KPiAgYXJjaC9zcGFyYy9rZXJu
ZWwvcHJvY2Vzcy5jICAgICAgfCA2ICsrKy0tLQo+ICBhcmNoL3NwYXJjL2tlcm5lbC9wcm9jZXNz
XzMyLmMgICB8IDIgKy0KPiAgYXJjaC9zcGFyYy9rZXJuZWwvcHJvY2Vzc182NC5jICAgfCAyICst
Cj4gIGFyY2gvdW0va2VybmVsL3Byb2Nlc3MuYyAgICAgICAgIHwgMiArLQo+ICBhcmNoL3VuaWNv
cmUzMi9rZXJuZWwvcHJvY2Vzcy5jICB8IDIgKy0KPiAgYXJjaC94ODYva2VybmVsL3Byb2Nlc3Mu
YyAgICAgICAgfCAyICstCj4gIGFyY2gveDg2L2tlcm5lbC91bndpbmRfZnJhbWUuYyAgIHwgMiAr
LQo+ICBhcmNoL3h0ZW5zYS9rZXJuZWwvcHJvY2Vzcy5jICAgICB8IDIgKy0KPiAgaW5jbHVkZS9s
aW51eC9zY2hlZC90YXNrLmggICAgICAgfCAyICstCj4gIGtlcm5lbC9mb3JrLmMgICAgICAgICAg
ICAgICAgICAgIHwgMiArLQo+ICAzMCBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspLCAz
NCBkZWxldGlvbnMoLSkKPgo+IFsuLi5dCj4gZGlmZiAtLWdpdCBhL2FyY2gvbmRzMzIva2VybmVs
L3Byb2Nlc3MuYyBiL2FyY2gvbmRzMzIva2VybmVsL3Byb2Nlc3MuYwo+IGluZGV4IDdkYmIxYmY2
NDE2NS4uMTAyMGUyYzZkY2Q4IDEwMDY0NAo+IC0tLSBhL2FyY2gvbmRzMzIva2VybmVsL3Byb2Nl
c3MuYwo+ICsrKyBiL2FyY2gvbmRzMzIva2VybmVsL3Byb2Nlc3MuYwo+IEBAIC0xNDksNyArMTQ5
LDcgQEAgdm9pZCBmbHVzaF90aHJlYWQodm9pZCkKPiAgREVGSU5FX1BFUl9DUFUoc3RydWN0IHRh
c2tfc3RydWN0ICosIF9fZW50cnlfdGFzayk7Cj4KPiAgYXNtbGlua2FnZSB2b2lkIHJldF9mcm9t
X2Zvcmsodm9pZCkgX19hc21fXygicmV0X2Zyb21fZm9yayIpOwo+IC1pbnQgY29weV90aHJlYWRf
dGxzKHVuc2lnbmVkIGxvbmcgY2xvbmVfZmxhZ3MsIHVuc2lnbmVkIGxvbmcgc3RhY2tfc3RhcnQs
Cj4gK2ludCBjb3B5X3RocmVhZCh1bnNpZ25lZCBsb25nIGNsb25lX2ZsYWdzLCB1bnNpZ25lZCBs
b25nIHN0YWNrX3N0YXJ0LAo+ICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBzdGtf
c3osIHN0cnVjdCB0YXNrX3N0cnVjdCAqcCwKPiAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVk
IGxvbmcgdGxzKQo+ICB7CgpIaSBDaHJpc3RpYW4sIFRoYW5rIHlvdS4KQWNrZWQtYnk6IEdyZWVu
dGltZSBIdSA8Z3JlZW4uaHVAZ21haWwuY29tPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMu
bGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVu
cmlzYwo=
