Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D73202E2934
	for <lists+openrisc@lfdr.de>; Fri, 25 Dec 2020 00:15:32 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2266720FDF;
	Fri, 25 Dec 2020 00:15:32 +0100 (CET)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by mail.librecores.org (Postfix) with ESMTPS id 4407520E7B
 for <openrisc@lists.librecores.org>; Tue, 22 Dec 2020 19:55:00 +0100 (CET)
Received: by mail-oi1-f170.google.com with SMTP id d203so15810547oia.0
 for <openrisc@lists.librecores.org>; Tue, 22 Dec 2020 10:55:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=la43jOzGT8cpDZH0lHbZ8yczIDIlNNAQ1oOndJF72r4=;
 b=Km7bhfvsoRYr7+h+837IpVA5950358VdZmC2frAtuetL46voxSxFRNYQGzNRUooyH3
 DqJl0FUq68HsxOzBHvXDFIcI0nrp1bjaxBF4Rc1aCH6nLAwP4UWdU2RrLmWKF3spwsuT
 4y8KJk8enNZz3GD/UttcA+nczLG3zoqAjBKx3MqSOmdg/ExgZSscK58VjXx2pLQnlKnL
 +hhZcUa/UbojhvThycsI6Ger1mxcC7PgG6EVCq9yUpQ8l3iASSuR1qun8i4zMxv0XHd8
 HE7n0DK8RO+RsND09VOF/nhWcvJXNwPC1W3ve/fP0AMgFnhbn/t3aezrveKoq+pR60vN
 o/+g==
X-Gm-Message-State: AOAM533iTuynzmrXfTYcSGKWxvLEeVCpWvnioWqXv/eclANE/4mvUUti
 hl6NlnBHWqtZ62lKr/xdcxEjY00HD6iLMJDTcRc=
X-Google-Smtp-Source: ABdhPJy5EVY7T6HE7RxxJ9AoKr5usE9gCbUG5HZ1gWiHgPXdK9RZjFwARYSd7qSwoUdfSw0ANGyqV1mRCh80XLruDv8=
X-Received: by 2002:aca:3cc5:: with SMTP id j188mr14009921oia.54.1608663299046; 
 Tue, 22 Dec 2020 10:54:59 -0800 (PST)
MIME-Version: 1.0
References: <20201222184510.19415-1-info@metux.net>
In-Reply-To: <20201222184510.19415-1-info@metux.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Dec 2020 19:54:48 +0100
Message-ID: <CAMuHMdVze3oaWmzvzn8ROjpP6h6Tsv2SFLiV7T1Cnej36X445g@mail.gmail.com>
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
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

SGkgRW5yaWNvLAoKT24gVHVlLCBEZWMgMjIsIDIwMjAgYXQgNzo0NiBQTSBFbnJpY28gV2VpZ2Vs
dCwgbWV0dXggSVQgY29uc3VsdAo8aW5mb0BtZXR1eC5uZXQ+IHdyb3RlOgo+IE1vdmUgdGhlIHBt
X3Bvd2VyX29mZiBjYWxsYmFjayBpbnRvIG9uZSBnbG9iYWwgcGxhY2UgYW5kIGFsc28gYWRkIGFu
Cj4gZnVuY3Rpb24gZm9yIGNvbmRpdGlvbmFsbHkgY2FsbGluZyBpdCAod2hlbiBub3QgTlVMTCks
IGluIG9yZGVyIHRvIHJlbW92ZQo+IGNvZGUgZHVwbGljYXRpb24gaW4gYWxsIGluZGl2aWR1YWwg
YXJjaHMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBFbnJpY28gV2VpZ2VsdCwgbWV0dXggSVQgY29uc3Vs
dCA8aW5mb0BtZXR1eC5uZXQ+CgpUaGFua3MgZm9yIHlvdXIgcGF0Y2ghCgo+IC0tLSBhL2FyY2gv
YWxwaGEva2VybmVsL3Byb2Nlc3MuYwo+ICsrKyBiL2FyY2gvYWxwaGEva2VybmVsL3Byb2Nlc3Mu
Ywo+IEBAIC00MywxMiArNDMsNiBAQAo+ICAjaW5jbHVkZSAicHJvdG8uaCIKPiAgI2luY2x1ZGUg
InBjaV9pbXBsLmgiCj4KPiAtLyoKPiAtICogUG93ZXIgb2ZmIGZ1bmN0aW9uLCBpZiBhbnkKPiAt
ICovCj4gLXZvaWQgKCpwbV9wb3dlcl9vZmYpKHZvaWQpID0gbWFjaGluZV9wb3dlcl9vZmY7CgpB
c3NpZ25tZW50cyBsaWtlIHRoZXNlIGFyZSBsb3N0IGluIHRoZSBjb252ZXJzaW9uLgoKPiAtRVhQ
T1JUX1NZTUJPTChwbV9wb3dlcl9vZmYpOwoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAg
ICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxv
dHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNv
bmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEg
aGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJw
cm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5s
aWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5y
aXNjCg==
