Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 0EC241CD2E2
	for <lists+openrisc@lfdr.de>; Mon, 11 May 2020 09:41:28 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 94B4D20B4B;
	Mon, 11 May 2020 09:41:26 +0200 (CEST)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by mail.librecores.org (Postfix) with ESMTPS id 909E22088B
 for <openrisc@lists.librecores.org>; Sun,  3 May 2020 20:43:04 +0200 (CEST)
Received: by mail-pl1-f196.google.com with SMTP id v2so5896672plp.9
 for <openrisc@lists.librecores.org>; Sun, 03 May 2020 11:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=wvVr5SRWd1uM2iASOWr26/V96EQuni36LaEArjGu2yc=;
 b=tHOaBm8EnptFt30keOnpprn8KhxKNzh6R0uPpyb1/rQuektkLELMWaypzeGcgTIVgR
 3UFfvYWgiSmpZIhlFEQKqcyjKBxg1/t8/Y2FUk1xkUzRlVrfCGGvoEU11LVkySVMmyw+
 ek2h6QxLoNqNQKleOx6DiipBVGyOAGrtp6ZywnFwrPRZjfybS8wRFPnhztpi6OcGeJY2
 Mkmm5rfuXuxkHuwSdMuxQQ2FgTzlOjtkfOXkgQCsQIcNy4lzW0PJuB4I6iZREr3IhRcZ
 PUk2AVK6p55JTc4UcjBV5jf88EeIcXzGksAaHrFL4PFooS/sx52k9C7zwPTzsAmmBZiN
 k9Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=wvVr5SRWd1uM2iASOWr26/V96EQuni36LaEArjGu2yc=;
 b=bc7LItVSQlkW7AdGhozpSc0FDissfmijgkgIB4GZ4S9gsS8MeA3SdHHFJgInYNTBOK
 73p5kDhxB1rVQ11GtcC4Pj6uLLJve+v5N+rfJyxY5AGMGAU6QRt07iOFpNJp/C8GSIuw
 Jm80DROyYKguU8YIM6P1nhZv1R1zGQkUHFCtSRwYSwdP6cRIq3Crj+njZCKVzgmyIhDg
 rM3NIrEqeozO85EfqomL9l61jkg2WoJsxw0WRfw4My7jkF7BIYZo9kKcv+KR7SmMVzwe
 qABGCitsXsi9K/1zsvOPm5mp/7ZMWCDRUWbktK4ujqQFKOTTWrSgbCV/acfS6/R34ofY
 Bt/Q==
X-Gm-Message-State: AGi0PuYR9XGx2p2flPvk5tPQA3g/9JLiSC5C9pGZieDvXELRETMIDcdv
 SL33toeKs8Ruwh/HrfaXjXg=
X-Google-Smtp-Source: APiQypLgkse+/uISWA8vmmT+25UVnwu7GijQSoPFykENXegkn7VLCF7eLD/Cy4r98zb82iwUanJgAA==
X-Received: by 2002:a17:902:ed4a:: with SMTP id
 y10mr14093460plb.227.1588531382473; 
 Sun, 03 May 2020 11:43:02 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id x18sm7016715pfi.22.2020.05.03.11.43.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 03 May 2020 11:43:01 -0700 (PDT)
Date: Sun, 3 May 2020 11:43:00 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20200503184300.GA154219@roeck-us.net>
References: <20200429121126.17989-1-rppt@kernel.org>
 <20200429121126.17989-18-rppt@kernel.org>
 <20200503174138.GA114085@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200503174138.GA114085@roeck-us.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Mon, 11 May 2020 09:41:24 +0200
Subject: Re: [OpenRISC] [PATCH v2 17/20] mm: free_area_init: allow defining
 max_zone_pfn in descending order
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, x86@kernel.org,
 Michal Hocko <mhocko@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 Ley Foon Tan <ley.foon.tan@intel.com>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Greg Ungerer <gerg@linux-m68k.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Baoquan He <bhe@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-hexagon@vger.kernel.org,
 Helge Deller <deller@gmx.de>, linux-sh@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>, Hoan Tran <Hoan@os.amperecomputing.com>,
 Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp,
 linux-xtensa@linux-xtensa.org, Nick Hu <nickhu@andestech.com>,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linux-mips@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 linux-m68k@lists.linux-m68k.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Qian Cai <cai@lca.pw>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-parisc@vger.kernel.org,
 linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 Brian Cain <bcain@codeaurora.org>, linux-kernel@vger.kernel.org,
 openrisc@lists.librecores.org, Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU3VuLCBNYXkgMDMsIDIwMjAgYXQgMTA6NDE6MzhBTSAtMDcwMCwgR3VlbnRlciBSb2VjayB3
cm90ZToKPiBIaSwKPiAKPiBPbiBXZWQsIEFwciAyOSwgMjAyMCBhdCAwMzoxMToyM1BNICswMzAw
LCBNaWtlIFJhcG9wb3J0IHdyb3RlOgo+ID4gRnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51
eC5pYm0uY29tPgo+ID4gCj4gPiBTb21lIGFyY2hpdGVjdHVyZXMgKGUuZy4gQVJDKSBoYXZlIHRo
ZSBaT05FX0hJR0hNRU0gem9uZSBiZWxvdyB0aGUKPiA+IFpPTkVfTk9STUFMLiBBbGxvd2luZyBm
cmVlX2FyZWFfaW5pdCgpIHBhcnNlIG1heF96b25lX3BmbiBhcnJheSBldmVuIGl0IGlzCj4gPiBz
b3J0ZWQgaW4gZGVzY2VuZGluZyBvcmRlciBhbGxvd3MgdXNpbmcgZnJlZV9hcmVhX2luaXQoKSBv
biBzdWNoCj4gPiBhcmNoaXRlY3R1cmVzLgo+ID4gCj4gPiBBZGQgdG9wIC0+IGRvd24gdHJhdmVy
c2FsIG9mIG1heF96b25lX3BmbiBhcnJheSBpbiBmcmVlX2FyZWFfaW5pdCgpIGFuZCB1c2UKPiA+
IHRoZSBsYXR0ZXIgaW4gQVJDIG5vZGUvem9uZSBpbml0aWFsaXphdGlvbi4KPiA+IAo+ID4gU2ln
bmVkLW9mZi1ieTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgo+IAo+IFRoaXMg
cGF0Y2ggY2F1c2VzIG15IG1pY3JvYmxhemVlbCBxZW11IGJvb3QgdGVzdCBpbiBsaW51eC1uZXh0
IHRvIGZhaWwuCj4gUmV2ZXJ0aW5nIGl0IGZpeGVzIHRoZSBwcm9ibGVtLgo+IApUaGUgc2FtZSBw
cm9ibGVtIGlzIHNlZW4gd2l0aCBzMzkwIGVtdWxhdGlvbnMuCgpHdWVudGVyCgo+IHFlbXUgY29t
bWFuZCBsaW5lOgo+IAo+IHFlbXUtc3lzdGVtLW1pY3JvYmxhemVlbCAtTSBwZXRhbG9naXgtbWw2
MDUgLW0gMjU2IFwKPiAJLWtlcm5lbCBhcmNoL21pY3JvYmxhemUvYm9vdC9saW51eC5iaW4gLW5v
LXJlYm9vdCBcCj4gCS1pbml0cmQgcm9vdGZzLmNwaW8gXAo+IAktYXBwZW5kICdwYW5pYz0tMSBz
bHViX2RlYnVnPUZaUFVBIHJkaW5pdD0vc2Jpbi9pbml0IGNvbnNvbGU9dHR5UzAsMTE1MjAwJyBc
Cj4gCS1tb25pdG9yIG5vbmUgLXNlcmlhbCBzdGRpbyAtbm9ncmFwaGljCj4gCj4gaW5pdHJkOgo+
IAlodHRwczovL2dpdGh1Yi5jb20vZ3JvZWNrL2xpbnV4LWJ1aWxkLXRlc3QvYmxvYi9tYXN0ZXIv
cm9vdGZzL21pY3JvYmxhemVlbC9yb290ZnMuY3Bpby5nego+IGNvbmZpZ3VyYXRpb246Cj4gCWh0
dHBzOi8vZ2l0aHViLmNvbS9ncm9lY2svbGludXgtYnVpbGQtdGVzdC9ibG9iL21hc3Rlci9yb290
ZnMvbWljcm9ibGF6ZWVsL3FlbXVfbWljcm9ibGF6ZWVsX21sNjA1X2RlZmNvbmZpZwo+IAo+IEJp
c2VjdCBsb2cgaXMgYmVsb3cuCj4gCj4gR3VlbnRlcgo+IAo+IC0tLQo+ICMgYmFkOiBbZmI5ZDY3
MGY1N2UzZjY0Nzg2MDIzMjhiYmJmNzExMzhiZTA2Y2E0Zl0gQWRkIGxpbnV4LW5leHQgc3BlY2lm
aWMgZmlsZXMgZm9yIDIwMjAwNTAxCj4gIyBnb29kOiBbNmE4YjU1ZWQ0MDU2ZWE1NTU5ZWJlNGY2
YTRiMjQ3ZjYyNzg3MGQ0Y10gTGludXggNS43LXJjMwo+IGdpdCBiaXNlY3Qgc3RhcnQgJ0hFQUQn
ICd2NS43LXJjMycKPiAjIGdvb2Q6IFswNjhiODBiNjhhNjcwZjBiMTcyODhjOGEzZDFlZTc1MWYz
NTE2MmFiXSBNZXJnZSByZW1vdGUtdHJhY2tpbmcgYnJhbmNoICdkcm0vZHJtLW5leHQnCj4gZ2l0
IGJpc2VjdCBnb29kIDA2OGI4MGI2OGE2NzBmMGIxNzI4OGM4YTNkMWVlNzUxZjM1MTYyYWIKPiAj
IGdvb2Q6IFs0NmM3MGZjNmEzYWMzNWNkNzJkZGFkMjQ4ZGNiZTRlZWU3MTZkMmE1XSBNZXJnZSBy
ZW1vdGUtdHJhY2tpbmcgYnJhbmNoICdkcml2ZXJzLXg4Ni9mb3ItbmV4dCcKPiBnaXQgYmlzZWN0
IGdvb2QgNDZjNzBmYzZhM2FjMzVjZDcyZGRhZDI0OGRjYmU0ZWVlNzE2ZDJhNQo+ICMgZ29vZDog
W2YzOWM0YWQ0NzlhMmYwMDVmOTcyYTJiOTQxYjQwZWZhNmI5YzkzNDldIE1lcmdlIHJlbW90ZS10
cmFja2luZyBicmFuY2ggJ3JwbXNnL2Zvci1uZXh0Jwo+IGdpdCBiaXNlY3QgZ29vZCBmMzljNGFk
NDc5YTJmMDA1Zjk3MmEyYjk0MWI0MGVmYTZiOWM5MzQ5Cj4gIyBiYWQ6IFsxNjVkM2VlMDE2MmZl
MjhlZmMyYzgxODAxNzY2MzNlMzM1MTVkZjE1XSBpcGMtY29udmVydC1pcGNzX2lkci10by14YXJy
YXktdXBkYXRlCj4gZ2l0IGJpc2VjdCBiYWQgMTY1ZDNlZTAxNjJmZTI4ZWZjMmM4MTgwMTc2NjMz
ZTMzNTE1ZGYxNQo+ICMgZ29vZDogWzAwMWYxZDIxMWVkMmVkMGYwMDU4MzhkYzQzOTA5OTM5MzBi
YmJkNjldIG1tOiByZW1vdmUgZWFybHlfcGZuX2luX25pZCgpIGFuZCBDT05GSUdfTk9ERVNfU1BB
Tl9PVEhFUl9OT0RFUwo+IGdpdCBiaXNlY3QgZ29vZCAwMDFmMWQyMTFlZDJlZDBmMDA1ODM4ZGM0
MzkwOTkzOTMwYmJiZDY5Cj4gIyBiYWQ6IFthYWFkNzQwMWJkMzJmMTBjMWQ1OTFkZDg4NmIzYTli
OTU5NWM2ZDc3XSBtbS92bXNhbjogZml4IHNvbWUgdHlwb3MgaW4gY29tbWVudAo+IGdpdCBiaXNl
Y3QgYmFkIGFhYWQ3NDAxYmQzMmYxMGMxZDU5MWRkODg2YjNhOWI5NTk1YzZkNzcKPiAjIGJhZDog
WzA5ZjlkMGFiMWZiZWQ4NTYyM2IyODM5OTVhYTdhN2Q3OGRhYTE2MTFdIGtodWdlcGFnZWQ6IGFs
bG93IHRvIGNvbGxhcHNlIFBURS1tYXBwZWQgY29tcG91bmQgcGFnZXMKPiBnaXQgYmlzZWN0IGJh
ZCAwOWY5ZDBhYjFmYmVkODU2MjNiMjgzOTk1YWE3YTdkNzhkYWExNjExCj4gIyBiYWQ6IFtjOTQy
ZmM4YTNlNTA4ODQwN2JjMzJkOTRmNTU0YmFiMjA1MTc1ZjhhXSBtbS92bXN0YXQuYzogZG8gbm90
IHNob3cgbG93bWVtIHJlc2VydmUgcHJvdGVjdGlvbiBpbmZvcm1hdGlvbiBvZiBlbXB0eSB6b25l
Cj4gZ2l0IGJpc2VjdCBiYWQgYzk0MmZjOGEzZTUwODg0MDdiYzMyZDk0ZjU1NGJhYjIwNTE3NWY4
YQo+ICMgYmFkOiBbYjI5MzU4ZDI2OWFjZTM4MjZkODUyMWJlYTg0MmZjMjk4NGNmYzExYl0gbW0v
cGFnZV9hbGxvYy5jOiByZW5hbWUgZnJlZV9wYWdlc19jaGVjaygpIHRvIGNoZWNrX2ZyZWVfcGFn
ZSgpCj4gZ2l0IGJpc2VjdCBiYWQgYjI5MzU4ZDI2OWFjZTM4MjZkODUyMWJlYTg0MmZjMjk4NGNm
YzExYgo+ICMgYmFkOiBbYmUwZmI1OTFhMWYxZGYyMGEwMGM4ZjAyM2Y5Y2E0ODkxZjE3N2IwZF0g
bW06IHNpbXBsaWZ5IGZpbmRfbWluX3Bmbl93aXRoX2FjdGl2ZV9yZWdpb25zKCkKPiBnaXQgYmlz
ZWN0IGJhZCBiZTBmYjU5MWExZjFkZjIwYTAwYzhmMDIzZjljYTQ4OTFmMTc3YjBkCj4gIyBiYWQ6
IFtjMTc0MjJhMDA4ZDM2ZGNmM2U5ZjUxNDY5NzU4YzU3NjI3MTZjYjBhXSBtbTogcmVuYW1lIGZy
ZWVfYXJlYV9pbml0X25vZGUoKSB0byBmcmVlX2FyZWFfaW5pdF9tZW1vcnlsZXNzX25vZGUoKQo+
IGdpdCBiaXNlY3QgYmFkIGMxNzQyMmEwMDhkMzZkY2YzZTlmNTE0Njk3NThjNTc2MjcxNmNiMGEK
PiAjIGJhZDogWzUxYTJmNjQ0ZmQwMjBkNWYwOTAwNDQ4MjVjMzg4NDQ0ZDExMDI5ZDVdIG1tOiBm
cmVlX2FyZWFfaW5pdDogYWxsb3cgZGVmaW5pbmcgbWF4X3pvbmVfcGZuIGluIGRlc2NlbmRpbmcg
b3JkZXIKPiBnaXQgYmlzZWN0IGJhZCA1MWEyZjY0NGZkMDIwZDVmMDkwMDQ0ODI1YzM4ODQ0NGQx
MTAyOWQ1Cj4gIyBmaXJzdCBiYWQgY29tbWl0OiBbNTFhMmY2NDRmZDAyMGQ1ZjA5MDA0NDgyNWMz
ODg0NDRkMTEwMjlkNV0gbW06IGZyZWVfYXJlYV9pbml0OiBhbGxvdyBkZWZpbmluZyBtYXhfem9u
ZV9wZm4gaW4gZGVzY2VuZGluZyBvcmRlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGli
cmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlz
Ywo=
