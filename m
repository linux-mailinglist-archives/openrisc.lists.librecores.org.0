Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 0EEF01CD2E1
	for <lists+openrisc@lfdr.de>; Mon, 11 May 2020 09:41:27 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3001220B40;
	Mon, 11 May 2020 09:41:26 +0200 (CEST)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by mail.librecores.org (Postfix) with ESMTPS id DFA7A20937
 for <openrisc@lists.librecores.org>; Sun,  3 May 2020 19:41:41 +0200 (CEST)
Received: by mail-pf1-f193.google.com with SMTP id 18so4395625pfv.8
 for <openrisc@lists.librecores.org>; Sun, 03 May 2020 10:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=E/mr9ZyjU5f7Vr/0eufu9euRQzca2mWViEzdzXjAhKM=;
 b=rAOPFuXgQJ2mpINJ4bZeTHDkrsZEQFsbwUGlrvdK6kp/tJs9EcLfnaWFpQLaMjvlTN
 PpGRnjbVlR/AVFM9AVMPY1HNoRLD+rgpHPyTxpKKlbrj05rCKcKZtY2qpz5bcSW3rVBO
 IocR5gWdH3gQT2RwWqhl/NTjprRC2CBth012R+d19kLQzVIHkQC7ljzq6SUBEAwz0CS8
 BnEP6HirMkFO0ICbg+hSwf+E0KnuOsGeUCXZA18VmuCvpAorlqiIGznMmafOkyr6R+Rc
 Q2PQDp8BGjLWDFmIAM1Oj/Qg5ff8e5fmuTqOOSGH41UE65MVi0GaoynoX/HwzIYTjpMy
 UfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=E/mr9ZyjU5f7Vr/0eufu9euRQzca2mWViEzdzXjAhKM=;
 b=lvnWAmXU3mwxl02+DICwsellB6HO/7oYcjcyNNWbMzZ+SQhiVzni+P579vLg6c+LAJ
 kNmxQEIC0SbPgwYBBRnE3TGmoVXgQ75n+v2kAFL30qhvOh+kSnf+/ZdoJYKw5EUU6m8e
 TXXc0e/dCPmzD+o5pUI2T+dpwXjyNm762kwHh3ROaWH6mMpZfLXeD2mjrvrf+v9GG93K
 JWHlcjjQcVG9SSppCczNZfaoLqhIlobWe/9V43yTx2udlsNH73wdn0o/aZCoP2xMuG/b
 qu+mG2C/z5NsTEfPuBLZH/fWmbCWD+aQxm7bJujJjIvyabDJt7p8QEnIib+2M/EuUecC
 R3nw==
X-Gm-Message-State: AGi0PuaQ8rU7G3IgybBsQ2cUHPJLjkSsjxTyoafGb5pPvQj3Kw07i1LR
 Avd6K9HFiN02TVblJKlOJuM=
X-Google-Smtp-Source: APiQypKe5f9UYzoGgygyTvemhYSAj5fxly1sdtXiMOKzeUqRJYW2ZGXxYUOZH0ANd9Z0qgzTnrAvVw==
X-Received: by 2002:aa7:9093:: with SMTP id i19mr13366500pfa.152.1588527699823; 
 Sun, 03 May 2020 10:41:39 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id q97sm4982611pjb.7.2020.05.03.10.41.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 03 May 2020 10:41:39 -0700 (PDT)
Date: Sun, 3 May 2020 10:41:38 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20200503174138.GA114085@roeck-us.net>
References: <20200429121126.17989-1-rppt@kernel.org>
 <20200429121126.17989-18-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200429121126.17989-18-rppt@kernel.org>
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

SGksCgpPbiBXZWQsIEFwciAyOSwgMjAyMCBhdCAwMzoxMToyM1BNICswMzAwLCBNaWtlIFJhcG9w
b3J0IHdyb3RlOgo+IEZyb206IE1pa2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4KPiAK
PiBTb21lIGFyY2hpdGVjdHVyZXMgKGUuZy4gQVJDKSBoYXZlIHRoZSBaT05FX0hJR0hNRU0gem9u
ZSBiZWxvdyB0aGUKPiBaT05FX05PUk1BTC4gQWxsb3dpbmcgZnJlZV9hcmVhX2luaXQoKSBwYXJz
ZSBtYXhfem9uZV9wZm4gYXJyYXkgZXZlbiBpdCBpcwo+IHNvcnRlZCBpbiBkZXNjZW5kaW5nIG9y
ZGVyIGFsbG93cyB1c2luZyBmcmVlX2FyZWFfaW5pdCgpIG9uIHN1Y2gKPiBhcmNoaXRlY3R1cmVz
Lgo+IAo+IEFkZCB0b3AgLT4gZG93biB0cmF2ZXJzYWwgb2YgbWF4X3pvbmVfcGZuIGFycmF5IGlu
IGZyZWVfYXJlYV9pbml0KCkgYW5kIHVzZQo+IHRoZSBsYXR0ZXIgaW4gQVJDIG5vZGUvem9uZSBp
bml0aWFsaXphdGlvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxp
bnV4LmlibS5jb20+CgpUaGlzIHBhdGNoIGNhdXNlcyBteSBtaWNyb2JsYXplZWwgcWVtdSBib290
IHRlc3QgaW4gbGludXgtbmV4dCB0byBmYWlsLgpSZXZlcnRpbmcgaXQgZml4ZXMgdGhlIHByb2Js
ZW0uCgpxZW11IGNvbW1hbmQgbGluZToKCnFlbXUtc3lzdGVtLW1pY3JvYmxhemVlbCAtTSBwZXRh
bG9naXgtbWw2MDUgLW0gMjU2IFwKCS1rZXJuZWwgYXJjaC9taWNyb2JsYXplL2Jvb3QvbGludXgu
YmluIC1uby1yZWJvb3QgXAoJLWluaXRyZCByb290ZnMuY3BpbyBcCgktYXBwZW5kICdwYW5pYz0t
MSBzbHViX2RlYnVnPUZaUFVBIHJkaW5pdD0vc2Jpbi9pbml0IGNvbnNvbGU9dHR5UzAsMTE1MjAw
JyBcCgktbW9uaXRvciBub25lIC1zZXJpYWwgc3RkaW8gLW5vZ3JhcGhpYwoKaW5pdHJkOgoJaHR0
cHM6Ly9naXRodWIuY29tL2dyb2Vjay9saW51eC1idWlsZC10ZXN0L2Jsb2IvbWFzdGVyL3Jvb3Rm
cy9taWNyb2JsYXplZWwvcm9vdGZzLmNwaW8uZ3oKY29uZmlndXJhdGlvbjoKCWh0dHBzOi8vZ2l0
aHViLmNvbS9ncm9lY2svbGludXgtYnVpbGQtdGVzdC9ibG9iL21hc3Rlci9yb290ZnMvbWljcm9i
bGF6ZWVsL3FlbXVfbWljcm9ibGF6ZWVsX21sNjA1X2RlZmNvbmZpZwoKQmlzZWN0IGxvZyBpcyBi
ZWxvdy4KCkd1ZW50ZXIKCi0tLQojIGJhZDogW2ZiOWQ2NzBmNTdlM2Y2NDc4NjAyMzI4YmJiZjcx
MTM4YmUwNmNhNGZdIEFkZCBsaW51eC1uZXh0IHNwZWNpZmljIGZpbGVzIGZvciAyMDIwMDUwMQoj
IGdvb2Q6IFs2YThiNTVlZDQwNTZlYTU1NTllYmU0ZjZhNGIyNDdmNjI3ODcwZDRjXSBMaW51eCA1
LjctcmMzCmdpdCBiaXNlY3Qgc3RhcnQgJ0hFQUQnICd2NS43LXJjMycKIyBnb29kOiBbMDY4Yjgw
YjY4YTY3MGYwYjE3Mjg4YzhhM2QxZWU3NTFmMzUxNjJhYl0gTWVyZ2UgcmVtb3RlLXRyYWNraW5n
IGJyYW5jaCAnZHJtL2RybS1uZXh0JwpnaXQgYmlzZWN0IGdvb2QgMDY4YjgwYjY4YTY3MGYwYjE3
Mjg4YzhhM2QxZWU3NTFmMzUxNjJhYgojIGdvb2Q6IFs0NmM3MGZjNmEzYWMzNWNkNzJkZGFkMjQ4
ZGNiZTRlZWU3MTZkMmE1XSBNZXJnZSByZW1vdGUtdHJhY2tpbmcgYnJhbmNoICdkcml2ZXJzLXg4
Ni9mb3ItbmV4dCcKZ2l0IGJpc2VjdCBnb29kIDQ2YzcwZmM2YTNhYzM1Y2Q3MmRkYWQyNDhkY2Jl
NGVlZTcxNmQyYTUKIyBnb29kOiBbZjM5YzRhZDQ3OWEyZjAwNWY5NzJhMmI5NDFiNDBlZmE2Yjlj
OTM0OV0gTWVyZ2UgcmVtb3RlLXRyYWNraW5nIGJyYW5jaCAncnBtc2cvZm9yLW5leHQnCmdpdCBi
aXNlY3QgZ29vZCBmMzljNGFkNDc5YTJmMDA1Zjk3MmEyYjk0MWI0MGVmYTZiOWM5MzQ5CiMgYmFk
OiBbMTY1ZDNlZTAxNjJmZTI4ZWZjMmM4MTgwMTc2NjMzZTMzNTE1ZGYxNV0gaXBjLWNvbnZlcnQt
aXBjc19pZHItdG8teGFycmF5LXVwZGF0ZQpnaXQgYmlzZWN0IGJhZCAxNjVkM2VlMDE2MmZlMjhl
ZmMyYzgxODAxNzY2MzNlMzM1MTVkZjE1CiMgZ29vZDogWzAwMWYxZDIxMWVkMmVkMGYwMDU4Mzhk
YzQzOTA5OTM5MzBiYmJkNjldIG1tOiByZW1vdmUgZWFybHlfcGZuX2luX25pZCgpIGFuZCBDT05G
SUdfTk9ERVNfU1BBTl9PVEhFUl9OT0RFUwpnaXQgYmlzZWN0IGdvb2QgMDAxZjFkMjExZWQyZWQw
ZjAwNTgzOGRjNDM5MDk5MzkzMGJiYmQ2OQojIGJhZDogW2FhYWQ3NDAxYmQzMmYxMGMxZDU5MWRk
ODg2YjNhOWI5NTk1YzZkNzddIG1tL3Ztc2FuOiBmaXggc29tZSB0eXBvcyBpbiBjb21tZW50Cmdp
dCBiaXNlY3QgYmFkIGFhYWQ3NDAxYmQzMmYxMGMxZDU5MWRkODg2YjNhOWI5NTk1YzZkNzcKIyBi
YWQ6IFswOWY5ZDBhYjFmYmVkODU2MjNiMjgzOTk1YWE3YTdkNzhkYWExNjExXSBraHVnZXBhZ2Vk
OiBhbGxvdyB0byBjb2xsYXBzZSBQVEUtbWFwcGVkIGNvbXBvdW5kIHBhZ2VzCmdpdCBiaXNlY3Qg
YmFkIDA5ZjlkMGFiMWZiZWQ4NTYyM2IyODM5OTVhYTdhN2Q3OGRhYTE2MTEKIyBiYWQ6IFtjOTQy
ZmM4YTNlNTA4ODQwN2JjMzJkOTRmNTU0YmFiMjA1MTc1ZjhhXSBtbS92bXN0YXQuYzogZG8gbm90
IHNob3cgbG93bWVtIHJlc2VydmUgcHJvdGVjdGlvbiBpbmZvcm1hdGlvbiBvZiBlbXB0eSB6b25l
CmdpdCBiaXNlY3QgYmFkIGM5NDJmYzhhM2U1MDg4NDA3YmMzMmQ5NGY1NTRiYWIyMDUxNzVmOGEK
IyBiYWQ6IFtiMjkzNThkMjY5YWNlMzgyNmQ4NTIxYmVhODQyZmMyOTg0Y2ZjMTFiXSBtbS9wYWdl
X2FsbG9jLmM6IHJlbmFtZSBmcmVlX3BhZ2VzX2NoZWNrKCkgdG8gY2hlY2tfZnJlZV9wYWdlKCkK
Z2l0IGJpc2VjdCBiYWQgYjI5MzU4ZDI2OWFjZTM4MjZkODUyMWJlYTg0MmZjMjk4NGNmYzExYgoj
IGJhZDogW2JlMGZiNTkxYTFmMWRmMjBhMDBjOGYwMjNmOWNhNDg5MWYxNzdiMGRdIG1tOiBzaW1w
bGlmeSBmaW5kX21pbl9wZm5fd2l0aF9hY3RpdmVfcmVnaW9ucygpCmdpdCBiaXNlY3QgYmFkIGJl
MGZiNTkxYTFmMWRmMjBhMDBjOGYwMjNmOWNhNDg5MWYxNzdiMGQKIyBiYWQ6IFtjMTc0MjJhMDA4
ZDM2ZGNmM2U5ZjUxNDY5NzU4YzU3NjI3MTZjYjBhXSBtbTogcmVuYW1lIGZyZWVfYXJlYV9pbml0
X25vZGUoKSB0byBmcmVlX2FyZWFfaW5pdF9tZW1vcnlsZXNzX25vZGUoKQpnaXQgYmlzZWN0IGJh
ZCBjMTc0MjJhMDA4ZDM2ZGNmM2U5ZjUxNDY5NzU4YzU3NjI3MTZjYjBhCiMgYmFkOiBbNTFhMmY2
NDRmZDAyMGQ1ZjA5MDA0NDgyNWMzODg0NDRkMTEwMjlkNV0gbW06IGZyZWVfYXJlYV9pbml0OiBh
bGxvdyBkZWZpbmluZyBtYXhfem9uZV9wZm4gaW4gZGVzY2VuZGluZyBvcmRlcgpnaXQgYmlzZWN0
IGJhZCA1MWEyZjY0NGZkMDIwZDVmMDkwMDQ0ODI1YzM4ODQ0NGQxMTAyOWQ1CiMgZmlyc3QgYmFk
IGNvbW1pdDogWzUxYTJmNjQ0ZmQwMjBkNWYwOTAwNDQ4MjVjMzg4NDQ0ZDExMDI5ZDVdIG1tOiBm
cmVlX2FyZWFfaW5pdDogYWxsb3cgZGVmaW5pbmcgbWF4X3pvbmVfcGZuIGluIGRlc2NlbmRpbmcg
b3JkZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3Bl
blJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8v
bGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
