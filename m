Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id EFADF1D1FFA
	for <lists+openrisc@lfdr.de>; Wed, 13 May 2020 22:17:38 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8CE4320B5E;
	Wed, 13 May 2020 22:17:35 +0200 (CEST)
Received: from mail-oo1-f68.google.com (mail-oo1-f68.google.com
 [209.85.161.68])
 by mail.librecores.org (Postfix) with ESMTPS id A09452074A
 for <openrisc@lists.librecores.org>; Mon, 11 May 2020 17:24:45 +0200 (CEST)
Received: by mail-oo1-f68.google.com with SMTP id z6so1107258ooz.3
 for <openrisc@lists.librecores.org>; Mon, 11 May 2020 08:24:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cFOqYFe+JnxanB4tWXMEfN+/EOvlslN0N0IK+ztKBU4=;
 b=Y54Nk9pqnM1lEwvpX+O8o2Fu35l/JsfAJvb5us0gYvMeJoQLcLbNbbFWZzrghEr5ex
 y5T5n+oLXnsvV/jI/ky2i2YQ1Z8veoEFACAzHJ5AaVhx4uPJ3EjgeZFB0ZFs3QXz7OBu
 mhrk5X09DBXNTdVD5AXbNP8Otx1GtcoZRr8ly0lFuj8TPeAOB40baz/9SisCF3Q6Lc/K
 YX22EyCZJszldW9RN5SBWA5B7f/pByrddoQM5nO7V580wrSs/pvJMHm105eN12uPSKvm
 qNSOnrY8HaeqHquX87pcIYPvcoNYPFxb0WQvLoC+0thASxx5mBGYaDwJBgY/z3NSQ/Xr
 PsbQ==
X-Gm-Message-State: AGi0PuaPY+xV9uldqa1OCLO/k8ztCp5p/fRLKVriQnfv1urAlzsFqVfJ
 giHVXYiidbDWk7CJt7m3tLvy8Vff4elwRrqI/Is=
X-Google-Smtp-Source: APiQypJasCN4yl8lWM1FRmzaz39ukL/iWbljLpcbY1TKIvOnIUfi1IKvTWCvzobh4HXgocJWo6GBkm5ORmsQ5s6pFSU=
X-Received: by 2002:a4a:d204:: with SMTP id c4mr2380562oos.1.1589210682093;
 Mon, 11 May 2020 08:24:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200510075510.987823-1-hch@lst.de>
 <20200510075510.987823-32-hch@lst.de>
 <CAMuHMdU_OxNoKfO=i903kx0mgk0-i2h4u2ase3m9_dn6oFh_5g@mail.gmail.com>
 <20200511151120.GA28634@lst.de>
In-Reply-To: <20200511151120.GA28634@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 May 2020 17:24:30 +0200
Message-ID: <CAMuHMdW1S91i3x0unNcJnypHse7ifynGb4dZcVhJaemR3GH1Pg@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Approved-At: Wed, 13 May 2020 22:17:32 +0200
Subject: Re: [OpenRISC] [PATCH 31/31] module: move the set_fs hack for
 flush_icache_range to m68k
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>, Roman Zippel <zippel@linux-m68k.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-c6x-dev@linux-c6x.org,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Jessica Yu <jeyu@kernel.org>,
 linux-um <linux-um@lists.infradead.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgQ2hyaXN0b3BoLAoKT24gTW9uLCBNYXkgMTEsIDIwMjAgYXQgNToxMSBQTSBDaHJpc3RvcGgg
SGVsbHdpZyA8aGNoQGxzdC5kZT4gd3JvdGU6Cj4gT24gTW9uLCBNYXkgMTEsIDIwMjAgYXQgMDk6
NDA6MzlBTSArMDIwMCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+ID4gT24gU3VuLCBNYXkg
MTAsIDIwMjAgYXQgOTo1NyBBTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4gd3JvdGU6
Cj4gPiA+Cj4gPiA+IGZsdXNoX2ljYWNoZV9yYW5nZSBnZW5lcmFsbHkgb3BlcmF0ZXMgb24ga2Vy
bmVsIGFkZHJlc3NlcywgYnV0IGZvciBzb21lCj4gPiA+IHJlYXNvbiBtNjhrIG5lZWRlZCBhIHNl
dF9mcyBvdmVycmlkZS4gIE1vdmUgdGhhdCBpbnRvIHRoZSBtNjhrIGNvZGUKPiA+ID4gaW5zdGVk
IG9mIGtlZXBpbmcgaXQgaW4gdGhlIG1vZHVsZSBsb2FkZXIuCj4gPiA+Cj4gPiA+IFNpZ25lZC1v
ZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+ID4KPiA+IFJldmlld2VkLWJ5
OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPgo+ID4gQWNrZWQtYnk6
IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+Cj4KPiBCdHcsIGRvIHlv
dSBrbm93IHdoYXQgcGFydCBvZiBmbHVzaF9pY2FjaGVfcmFuZ2UgcmVsaWVkIG9uIHNldF9mcz8K
PiBEbyBhbnkgb2YgdGhlIG02OGsgbWFpbnRhaW5lcnMgaGF2ZSBhbiBpZGVhIGhvdyB0byBoYW5k
bGUgdGhhdCBpbgo+IGEgbmljZXIgd2F5IHdoZW4gd2UgY2FuIHNwbGl0IHRoZSBpbXBsZW1lbnRh
dGlvbnM/CgphcmNoL202OGsvbW0vY2FjaGUuYzp2aXJ0X3RvX3BoeXNfc2xvdygpCgpBbGwgaW5z
dHJ1Y3Rpb25zIHRoYXQgbG9vayB1cCBhZGRyZXNzZXMgaW4gdGhlIHBhZ2UgdGFibGVzIGxvb2sg
YXQgdGhlCnNvdXJjZS9kZXN0aW5hdGlvbiBmdW5jdGlvbiBjb2RlcyAoU0ZDL0RGQykgdG8ga25v
dyBpZiB0aGV5IGhhdmUgdG8gdXNlCnRoZSBzdXBlcnZpc29yIG9yIHVzZXIgcGFnZSB0YWJsZXMu
ClNvIHRoZSBhY3R1YWwgaW1wbGVtZW50YXRpb24gaXMgdGhlIHNhbWU6IHNldF9mcygpIG1lcmVs
eSBjb25maWd1cmVzClNGQy9ERkMsIHRvIHNlbGVjdCB0aGUgYWRkcmVzcyBzcGFjZSB0byB1c2Uu
CgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAK
R2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAt
LSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRl
Y2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxr
aW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBs
aWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFs
ZHMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJ
U0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlz
dHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
