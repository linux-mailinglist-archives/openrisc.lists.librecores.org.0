Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 845A14825ED
	for <lists+openrisc@lfdr.de>; Fri, 31 Dec 2021 22:55:58 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id F3C5024313;
	Fri, 31 Dec 2021 22:55:57 +0100 (CET)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mail.librecores.org (Postfix) with ESMTPS id 91E8920DEE
 for <openrisc@lists.librecores.org>; Fri, 31 Dec 2021 22:55:55 +0100 (CET)
Received: by mail-pj1-f48.google.com with SMTP id iy13so24336805pjb.5
 for <openrisc@lists.librecores.org>; Fri, 31 Dec 2021 13:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=T1hx50UVDERByCQtA2jPhEceIqEPV53U/9yB8e5/FYk=;
 b=LjsOP7dtkJk8TTLzgH2x733jvWKdpcNmqgEkJGbhcliBN3P4mGcoa4RHGyc7AE+uv0
 1q6IiTtA1Dj+hFT4fbo5YFfHQJP3D3q9epLhg2FMsybdbsOcLxZAwPm0457fBAaRsDqQ
 IL99rj8gfeLcMykifXB/Gt0fb/qQevJBIrut1EB236pdFPwlsYQCiXgvL1uR2c1NkIEI
 s9mlOS/JU5lFDS2xWEDijv28JBOklmN0+7s5aGmoNcQDKeGvOeymMRfNiZGGdhERxmTx
 AwTYJpI5KYZX0tSyGEY8pkdXLvzdxOJEnG3qvPabZ4r2I9OhjOAaaBl0S4GhUjhjIInk
 c95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=T1hx50UVDERByCQtA2jPhEceIqEPV53U/9yB8e5/FYk=;
 b=8NaEdessQdo+aZL8JdsRGdvhgpNOJmPBKIi8hoqc1PdkjzihCoSE5/7y6hJDW5vv/D
 Wix09XhJY48U0vZ5myUApFH0V2A1/MZsVIuwjzH1iGfFiktxfxe1hiyqFhX/NiulYJuD
 BQonKMLr1ib3dKlg/6+ikbcCBD6gf8ImVpYkLZY+ZluZ2M8NQ2GWTb+Jpl2fLmA7ZmOz
 9/UJs9JoOc35zPrJvEy95T/TaZ1JdJdQQbQY0v7im42ZFX68VgEeoNAE90169k62m+FT
 elQf0CVn2duZp3DY5kP6wIhur0+jP0Z+tAQbbh+yoM1W+zEfsLsuhk9fcjRd6JlxvXz8
 iZuA==
X-Gm-Message-State: AOAM533TgRJWI6KQDLRSf/rsfFcao/k4Y6x1+Eoafao9pdVUQ2rduSgA
 zXDennY4zlUzTnk2o6yvpL8=
X-Google-Smtp-Source: ABdhPJz1F4nn7gYkCA3wVb/U0vH3yAlfu9Ov4LEv5tjkAkrde3xqL11hZ+AbHJ3jgiQyphWKkycvHA==
X-Received: by 2002:a17:902:bb97:b0:144:d5cb:969f with SMTP id
 m23-20020a170902bb9700b00144d5cb969fmr36731618pls.36.1640987753994; 
 Fri, 31 Dec 2021 13:55:53 -0800 (PST)
Received: from [10.1.1.24] (222-155-5-102-adsl.sparkbb.co.nz. [222.155.5.102])
 by smtp.gmail.com with ESMTPSA id
 p186sm13526661pfp.128.2021.12.31.13.55.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 31 Dec 2021 13:55:53 -0800 (PST)
To: Arnd Bergmann <arnd@kernel.org>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-3-schnelle@linux.ibm.com>
 <CAMuHMdXk6VcDryekkMJ3aGFnw4LLWOWMi8M2PwjT81PsOsOBMQ@mail.gmail.com>
 <d406b93a-0f76-d056-3380-65d459d05ea9@gmail.com>
 <CAK8P3a2j-OFUUp+haHoV4PyL-On4EASZ9+59SDqNqmL8Gv_k7Q@mail.gmail.com>
 <1f90f145-219e-1cad-6162-9959d43a27ad@gmail.com>
 <CAK8P3a3NqU-3nUZ9ve=QyPPB5Uep3eK+_hicjjSiP8VuL4FYfA@mail.gmail.com>
 <0211719b-8402-9865-8e5d-5c0a35715816@gmail.com>
 <CAK8P3a2GGGuP0miLRy8w2+8vdSsGRNioBHEZ-ervSBrYbuZ+5w@mail.gmail.com>
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <a635e885-c365-8bdc-bf3c-e74d7d39a786@gmail.com>
Date: Sat, 1 Jan 2022 10:55:27 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2GGGuP0miLRy8w2+8vdSsGRNioBHEZ-ervSBrYbuZ+5w@mail.gmail.com>
Subject: Re: [OpenRISC] [RFC 02/32] Kconfig: introduce HAS_IOPORT option and
 select it as necessary
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
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 linux-pci <linux-pci@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 sparclinux <sparclinux@vger.kernel.org>, Guo Ren <guoren@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>,
 linux-ia64@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Karol Gugala <kgugala@antmicro.com>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Parisc List <linux-parisc@vger.kernel.org>,
 Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Heiko Carstens <hca@linux.ibm.com>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Niklas Schnelle <schnelle@linux.ibm.com>,
 Jeff Dike <jdike@addtoit.com>, John Garry <john.garry@huawei.com>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Brian Cain <bcain@codeaurora.org>, Nick Hu <nickhu@andestech.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 alpha <linux-alpha@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgQXJuZCwKCkFtIDAxLjAxLjIwMjIgdW0gMDU6MDQgc2NocmllYiBBcm5kIEJlcmdtYW5uOgo+
IE9uIFdlZCwgRGVjIDI5LCAyMDIxIGF0IDEwOjQ0IFBNIE1pY2hhZWwgU2NobWl0eiA8c2NobWl0
em1pY0BnbWFpbC5jb20+IHdyb3RlOgo+PiBBbSAzMC4xMi4yMDIxIHVtIDE0OjQ4IHNjaHJpZWIg
QXJuZCBCZXJnbWFubjoKPj4+IE9uIFR1ZSwgRGVjIDI4LCAyMDIxIGF0IDExOjE1IFBNIE1pY2hh
ZWwgU2NobWl0eiA8c2NobWl0em1pY0BnbWFpbC5jb20+IHdyb3RlOgo+Pj4gV2hhdCBzb21lIG90
aGVyIGFyY2hpdGVjdHVyZXMgZG8gaXMgdG8gcmVseSBvbiBpbmIoKS9vdXRiKCkgdG8gaGF2ZSBh
Cj4+PiB6ZXJvLWJhc2VkIG9mZnNldCwgYW5kIHVzZSBhbiBpb19vZmZzZXQgaW4gUENJIGJ1c2Vz
IHRvIGVuc3VyZSB0aGF0IGEKPj4+IGxvdyBwb3J0IG51bWJlciBvbiB0aGUgYnVzIGdldHMgdHJh
bnNsYXRlZCBpbnRvIGEgcG9pbnRlciB2YWx1ZSBmb3IgdGhlCj4+PiB2aXJ0dWFsIG1hcHBpbmcg
aW4gdGhlIGtlcm5lbCwgd2hpY2ggaXMgdGhlbiByZXByZXNlbnRlZCBhcyBhbiB1bnNpZ25lZAo+
Pj4gaW50Lgo+Pgo+PiBNNTR4eCBkb2VzIGp1c3QgdGhhdCBmb3IgQ29sZGZpcmU6Cj4+Cj4+IGFy
Y2gvbTY4ay9pbmNsdWRlL2FzbS9pb19uby5oOgo+PiAjZGVmaW5lIFBDSV9JT19QQSAgICAgICAw
eGY4MDAwMDAwICAgICAgICAgICAgICAvKiBIb3N0IHBoeXNpY2FsIGFkZHJlc3MgKi8KPj4KPj4g
KHVzZWQgdG8gc2V0IFBDSSBCQVIgbWFwcGluZ3MsIHNvIG1hdGNoZXMgeW91ciBkZWZpbml0aW9u
IGFib3ZlKS4KPgo+IEkgdGhpbmsgY29sZGZpcmUgZ2V0cyBpdCByaWdodCBoZXJlLCB1c2luZyBQ
Q0lfSU9CQVNFIHRvIGZpbmQgdGhlIHN0YXJ0IG9mCj4gdGhlIHdpbmRvdyBhbmQgYSB6ZXJvIGlv
X29mZnNldDoKPgo+ICNkZWZpbmUgUENJX0lPQkFTRSAoKHZvaWQgX19pb21lbSAqKSBQQ0lfSU9f
UEEpCgpHb29kIC0gSSBiZWFyIHRoYXQgaW4gbWluZCBpZiBJIGV2ZXIgZ2V0IGFyb3VuZCB0byBy
ZWFjdGl2YXRpbmcgbXkgMDYwIAphY2NlbGVyYXRvciBhbmQgdGhlIFBDSSBib2FyZCBmb3IgdGhh
dC4KCj4+IEFsbCBvdGhlciAoTU1VKSBtNjhrIHVzZXJzIG9mIGluYigpL291dGIoKSBhcHBseSBh
biBpb19vZmZzZXQgaW4gdGhlCj4+IHBsYXRmb3JtIHNwZWNpZmljIGFkZHJlc3MgdHJhbnNsYXRp
b246Cj4+Cj4+IGFyY2gvbTY4ay9pbmNsdWRlL2FzbS9pb19tbS5oOgo+Pgo+PiAjZGVmaW5lIHE0
MF9pc2FfaW9fYmFzZSAgMHhmZjQwMDAwMAo+PiAjZGVmaW5lIGVuZWNfaXNhX3JlYWRfYmFzZSAg
MHhmZmZhMDAwMAo+PiAjZGVmaW5lIGVuZWNfaXNhX3dyaXRlX2Jhc2UgMHhmZmZiMDAwMAo+Pgo+
PiBhcmNoL202OGsvaW5jbHVkZS9hc20vYW1pZ2F5bGUuaDoKPj4KPj4gI2RlZmluZSBHQVlMRV9J
TyAgICAgICAgICAgICAgICAoMHhhMjAwMDArelR3b0Jhc2UpICAgICAvKiAxNmJpdCBhbmQKPj4g
ZXZlbiA4Yml0IHJlZ2lzdGVycyAqLwo+PiAjZGVmaW5lIEdBWUxFX0lPXzhCSVRPREQgICAgICAg
ICgweGEzMDAwMCt6VHdvQmFzZSkgICAgIC8qIG9kZCA4Yml0Cj4+IHJlZ2lzdGVycyAqLwo+Pgo+
PiAoYWxsIGNvbnN0YW50cyB1c2VkIGluIGFkZHJlc3MgdHJhbnNsYXRpb24gaW5saW5lcyB0aGF0
IGFyZSB1c2VkIGJ5IHRoZQo+PiBtNjhrIGluYigpL291dGIoKSBtYWNyb3MgLSB5b3UgY2FuIGNh
bGwgdGhhdCB0aGUgcG9vciBtYW4ncyB2ZXJzaW9uIG9mCj4+IFBDSSBCQVIgbWFwcGluZ3MgLi4u
KS4KPgo+IFRoaXMgc3RpbGwgbG9va3MgbGlrZSB0aGUgc2FtZSB0aGluZyB0byBtZSwgd2hlcmUg
eW91IGhhdmUgaW5iKCkgdGFrZSBhCj4gemVyby1iYXNlZCBwb3J0IG51bWJlciwgbm90IGEgcG9p
bnRlci4gVGhlIGVmZmVjdCBpcyB0aGUgc2FtZSBhcyB0aGUKPiBjb2xkZmlyZSB2ZXJzaW9uLCBp
dCBqdXN0IHVzZXMgYSBjdXN0b20gaW5saW5lIGZ1bmN0aW9uIGluc3RlYWQgb2YgdGhlCj4gdmVy
c2lvbiBmcm9tIGFzbS1nZW5lcmljL2lvLmguCgpSaWdodC4KCj4+IFNvIGFzIGxvbmcgYXMgc3Vw
cG9ydCBmb3IgYW55IG9mIHRoZSBtNjhrIFBDSSBvciBJU0EgYnJpZGdlcyBpcyBzZWxlY3RlZAo+
PiBpbiB0aGUga2VybmVsIGNvbmZpZywgdGhlIGFwcHJvcHJpYXRlIElPIHNwYWNlIG1hcHBpbmcg
aXMgYXBwbGllZC4gSWYgbm8KPj4gc3VwcG9ydCBmb3IgUENJIG9yIElTQSBicmlkZ2VzIGlzIHNl
bGVjdGVkLCB3ZSBhbHJlYWR5IGZhbGwgYmFjayB0byB6ZXJvCj4+IG9mZnNldCBtYXBwaW5nIChi
dXQgYXMgZmFyIGFzIEkgY2FuIHRlbGwsIGl0IHNob3VsZG4ndCBiZSBwb3NzaWJsZSB0bwo+PiBi
dWlsZCBhIGtlcm5lbCB3aXRob3V0IGJyaWRnZSBzdXBwb3J0IGJ1dCBkcml2ZXJzIHRoYXQgcmVx
dWlyZSBpdCkuCj4KPiBSaWdodC4KPgo+Pj4gQXMgdGhpcyBpcyBpbmRpc3Rpbmd1aXNoYWJsZSBm
cm9tIGFyY2hpdGVjdHVyZXMgdGhhdCBqdXN0IGRvbid0IGhhdmUKPj4+IGEgYmFzZSBhZGRyZXNz
IGZvciBJL08gcG9ydHMgKHdlIHVuZm9ydHVuYXRlbHkgcGlja2VkIDAgYXMgdGhlIGRlZmF1bHQK
Pj4+IFBDSV9JT0JBU0UgdmFsdWUpLCBteSBzdWdnZXN0aW9uIHdhcyB0byBzdGFydCBtYXJraW5n
IGFyY2hpdGVjdHVyZXMKPj4+IHRoYXQgbWF5IGhhdmUgdGhpcyBwcm9ibGVtIGFzIHVzaW5nIEhB
U19JT1BPUlQgaW4gb3JkZXIgdG8ga2VlcAo+Pj4gdGhlIGV4aXN0aW5nIGJlaGF2aW9yIHVuY2hh
bmdlZC4gSWYgbTY4ayBkb2VzIG5vdCBzdWZmZXIgZnJvbSB0aGlzLAo+Pj4gbWFraW5nIEhBU19J
T1BPUlQgY29uZGl0aW9uYWwgb24gdGhvc2UgY29uZmlnIG9wdGlvbnMgdGhhdCBhY3R1YWxseQo+
Pj4gbmVlZCBpdCB3b3VsZCBvZiBjb3Vyc2UgYmUgYmVzdC4KPj4KPj4gRm9sbG93aW5nIHlvdXIg
ZGVzY3JpcHRpb24sIEhBU19JT1BPUlQgd291bGQgYmUgcmVxdWlyZWQgZm9yIG5laXRoZXIgb2YK
Pj4gUENJLCBJU0Egb3IgQVRBUklfUk9NX0lTQSA/Pwo+Cj4gRm9yIHRoZXNlIHRocmVlIG9wdGlv
bnMsIHdlIGRlZmluaXRlbHkgbmVlZCBIQVNfSU9QT1JULCB3aGljaCB3b3VsZAo+IGltcGx5IHRo
YXQgc29tZSB2ZXJzaW9uIG9mIGluYigpL291dGIoKSBpcyBwcm92aWRlZC4gVGhlIGRpZmZlcmVu
Y2UgYmV0d2VlbgoKVGhhbmtzIGZvciBjbGFyaWZ5aW5nIHRoYXQgKGFuZCB0byBOaWtsYXMgYXMg
d2VsbCkuIERpZCBzb3VuZCBhIGxpdHRsZSAKY291bnRlci1pbnR1aXRpdmUgdG8gbWUuLi4KCj4g
dXNpbmcgYSBjdXN0b20gUENJX0lPQkFTRSAob3IgYW4gb3Blbi1jb2RlZCBlcXVpdmFsZW50KSBh
bmQgdXNpbmcKPiBhIHplcm8gUENJX0lPQkFTRSBpbiBjb21iaW5hdGlvbiB3aXRoIHJlZ2lzdGVy
aW5nIFBDSSB1c2luZyBhIGN1c3RvbQo+IGlvX29mZnNldCBpcyB3aGV0aGVyIHdlIGNhbiB1c2Ug
ZHJpdmVycyB3aXRoIGhhcmRjb2RlZCBwb3J0IG51bWJlcnMuCj4gVGhlc2Ugc2hvdWxkIGRlcGVu
ZCBvbiBhIGRpZmZlcmVudCBLY29uZmlnIHN5bWJvbCB0byBiZSBpbnRyb2R1Y2VkCj4gKENPTkZJ
R19IQVJEQ09ERURfSU9QT1JUIG9yIHNpbWlsYXIpIG9uY2Ugd2UgaW50cm9kdWNlIHRoZW0sCj4g
YW5kIHlvdSBjb3VsZCBkZWNpZGUgZm9yIG02OGsgd2hldGhlciB0byBhbGxvdyB0aG9zZSBvciBu
b3QsIEkgd291bGQKPiBhc3N1bWUgeW91IGRvIHdhbnQgdGhlbSBpbiBvcmRlciB0byB1c2UgY2Vy
dGFpbiBsZWdhY3kgSVNBIGRyaXZlcnMuCgpUaGF0J3MgZXhhY3RseSB0aGUgcHVycG9zZSAodGhv
dWdoIHdlJ3JlIG92ZXJtdWNoIHB1c2hpbmcgdGhlIGVudmVsb3BlIAp0cnlpbmcgdG8gYWNjb21v
ZGF0ZSBsZWdhY3kgSVNBIGRyaXZlcnMgb24gdG9vIG1hbnkgcGxhdGZvcm1zKS4KCkNoZWVycywK
CglNaWNoYWVsCgoKPiAgICAgICAgQXJuZAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5s
aWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5y
aXNjCg==
