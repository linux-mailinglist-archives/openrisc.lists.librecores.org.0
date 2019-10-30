Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 74691EAEBB
	for <lists+openrisc@lfdr.de>; Thu, 31 Oct 2019 12:21:31 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5670F2078C;
	Thu, 31 Oct 2019 12:21:31 +0100 (CET)
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by mail.librecores.org (Postfix) with ESMTPS id 3A434206A4
 for <openrisc@lists.librecores.org>; Wed, 30 Oct 2019 09:51:52 +0100 (CET)
Received: by mail-oi1-f194.google.com with SMTP id s71so1266367oih.11
 for <openrisc@lists.librecores.org>; Wed, 30 Oct 2019 01:51:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mziza5J/MoDupcgI0RkmxCcsKm60Et3F2KLUw+t1RqQ=;
 b=TdJ+N2GSoE98vML16lnZb14dAhkIM9ZoXutSIb9w9PxM1DHPlanwv1PXpkWVOLOqNa
 7kFsgK7/dbh0sgqrlH+egOMf1KuzoRgrbEk8JzCzqzQeOaYpL1y1+ED++BVUaY52sOgv
 5AJ6kQGN7uDWOoBu3qk019QHQ7NkZbHjePuMPMG7veFBQGVSYjuZMJj+k4CfSy3c6rS5
 9NIAzp4fFVDEOrv+njoHuPQFw9/NpK+WakOTgeqS3dzUHnRSd9Gak+etB4d/xbxLUy3e
 7pePTy7zWytfucKoJPOjufqgn2khB8yecQgnJGEImZaQ0dVYroFI0kO1AD9/Q+yfx+c4
 ghFw==
X-Gm-Message-State: APjAAAXIgrlfYRJ2EUv5YxGnJ1XHMIgzfs5hS1bKM5LHJrjn8NSMqoXb
 uGHrK/9P1dniZtfDcNFJavdVPCzlP3m1qlg2VY0=
X-Google-Smtp-Source: APXvYqywm9C+CpnmelJ6SWQKVIah4mda9qPmB6OrDMq707nGOy+7YzCdX2/qccGqz5HinY9G/c8lSRqxbZE+WID7kSw=
X-Received: by 2002:aca:4ac5:: with SMTP id x188mr4822487oia.148.1572425510897; 
 Wed, 30 Oct 2019 01:51:50 -0700 (PDT)
MIME-Version: 1.0
References: <20191029064834.23438-1-hch@lst.de>
 <20191029064834.23438-14-hch@lst.de>
In-Reply-To: <20191029064834.23438-14-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Oct 2019 09:51:39 +0100
Message-ID: <CAMuHMdWGiHhSv=xCqnsUXok7wYG7Wr1EQh+yuPOZBxPCskUFVw@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Approved-At: Thu, 31 Oct 2019 12:21:18 +0100
Subject: Re: [OpenRISC] [PATCH 13/21] m68k: rename __iounmap and mark it
 static
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
 Linux-sh list <linux-sh@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@kernel.org>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Linux-Arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Greentime Hu <green.hu@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>, Guan Xuetao <gxt@pku.edu.cn>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>, Parisc List <linux-parisc@vger.kernel.org>,
 linux-mips@vger.kernel.org, alpha <linux-alpha@vger.kernel.org>,
 nios2-dev@lists.rocketboards.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBPY3QgMjksIDIwMTkgYXQgNzo1NiBBTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxz
dC5kZT4gd3JvdGU6Cj4gbTY4ayB1c2VzIF9faW91bm1hcCBhcyB0aGUgbmFtZSBmb3IgYW4gaW50
ZXJuYWwgaGVscGVyIHRoYXQgaXMgb25seQo+IHVzZWQgZm9yIHNvbWUgQ1BVIHR5cGVzLiAgTWFy
ayBpdCBzdGF0aWMsIGdpdmUgaXQgYSBiZXR0ZXIgbmFtZQo+IGFuZCBtb3ZlIGl0IGFyb3VuZCBh
IGJpdCB0byBhdm9pZCBhIGZvcndhcmQgZGVjbGFyYXRpb24uCj4KPiBTaWduZWQtb2ZmLWJ5OiBD
aHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KClRoYW5rcyBmb3IgdGhlIHVwZGF0ZSEKClJl
dmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPgpBY2tl
ZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4KCkdye29ldGpl
LGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0
ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxp
bnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBl
b3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91
cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4K
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5n
IGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNv
cmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
