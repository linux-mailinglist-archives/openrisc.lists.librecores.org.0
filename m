Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 0079C20DCED
	for <lists+openrisc@lfdr.de>; Mon, 29 Jun 2020 22:45:13 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id AF63620D3A;
	Mon, 29 Jun 2020 22:45:12 +0200 (CEST)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by mail.librecores.org (Postfix) with ESMTPS id 2881C20CE4
 for <openrisc@lists.librecores.org>; Mon, 29 Jun 2020 17:42:40 +0200 (CEST)
Received: by mail-ot1-f66.google.com with SMTP id w17so8068682otl.4
 for <openrisc@lists.librecores.org>; Mon, 29 Jun 2020 08:42:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ByBiz3Yf8Ie7OVrqv/Mz9cEMnJyRfxViWcmC4BsTpCo=;
 b=rBnyeul/wE8zgmewK3SncpdvjZdn/5pKR+LpzKmBFLQOV2b5h/nR/peqcRgoZRsHD+
 Jt/UXVv5UCKrSTR/s4XWPK3yaPd7h2RonSY9oMGb93h89kZvZrY7noH0IcCScSB8nsSn
 AxRKM/R/v/w7CycUChY3UNXeIFjJmYCQwmH3xZhUj+BQ+nLOXpKhVTEF/RfU/nq1eNgV
 /l0i0Mx9YBbmcpH76KHP6QPQUI24mqRtQ3O4gHHbUi4kr6Pc6T/BFp0qSd2Xj/tAAVRE
 NGLgVfYTtY5vZDFf0Oy/pXmG+ykGq9B+bVmHrNEMafIKB2L3scTMIHOZv27JmQeXRrL3
 +iKg==
X-Gm-Message-State: AOAM533cHW3RFsUbe6CRYfZxo+NG0DT1q2luA2YFnfRJ+O0tHHesz8F8
 n7ORnl8zABoimoYx4QseMz9Ktu9cojaLykbpYqE=
X-Google-Smtp-Source: ABdhPJzZv9yrcqjQPIqNSuZYxDZ0MHssHdmPppPpB4X3a0jGl41oFltbqUVWyGPYv/nioiv+o7pFkroyCV6uhkj/ZSQ=
X-Received: by 2002:a05:6830:1451:: with SMTP id
 w17mr1241594otp.250.1593445359003; 
 Mon, 29 Jun 2020 08:42:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200627143453.31835-1-rppt@kernel.org>
 <20200627143453.31835-7-rppt@kernel.org>
In-Reply-To: <20200627143453.31835-7-rppt@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jun 2020 17:42:28 +0200
Message-ID: <CAMuHMdWP07XqvgrXjCG+n5FssH3BwdDEWA4fD9TQgvVy93uMhQ@mail.gmail.com>
To: Mike Rapoport <rppt@kernel.org>
X-Mailman-Approved-At: Mon, 29 Jun 2020 22:44:54 +0200
Subject: Re: [OpenRISC] [PATCH 6/8] asm-generic: pgalloc: provide generic
 pgd_free()
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
 Peter Zijlstra <peterz@infradead.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>, linux-csky@vger.kernel.org,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux-Arch <linux-arch@vger.kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Mike Rapoport <rppt@linux.ibm.com>, Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-s390 <linux-s390@vger.kernel.org>,
 linux-um <linux-um@lists.infradead.org>, Steven Rostedt <rostedt@goodmis.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Andy Lutomirski <luto@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Parisc List <linux-parisc@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU2F0LCBKdW4gMjcsIDIwMjAgYXQgNDozNiBQTSBNaWtlIFJhcG9wb3J0IDxycHB0QGtlcm5l
bC5vcmc+IHdyb3RlOgo+IEZyb206IE1pa2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4K
Pgo+IE1vc3QgYXJjaGl0ZWN0dXJlcyBkZWZpbmUgcGdkX2ZyZWUoKSBhcyBhIHdyYXBwZXIgZm9y
IGZyZWVfcGFnZSgpLgo+Cj4gUHJvdmlkZSBhIGdlbmVyaWMgdmVyc2lvbiBpbiBhc20tZ2VuZXJp
Yy9wZ2FsbG9jLmggYW5kIGVuYWJsZSBpdHMgdXNlIGZvcgo+IG1vc3QgYXJjaGl0ZWN0dXJlcy4K
Pgo+IFNpZ25lZC1vZmYtYnk6IE1pa2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4KCkZv
ciB0aGUgbTY4ayBwYXJ0OgpBY2tlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51
eC1tNjhrLm9yZz4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAg
R2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJl
eW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRp
b25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0Cndo
ZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Ig
c29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBM
aW51cyBUb3J2YWxkcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcK
aHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
