Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id EC9E120DCD8
	for <lists+openrisc@lfdr.de>; Mon, 29 Jun 2020 22:44:56 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3A8A020CBC;
	Mon, 29 Jun 2020 22:44:56 +0200 (CEST)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by mail.librecores.org (Postfix) with ESMTPS id 090CA20409
 for <openrisc@lists.librecores.org>; Thu, 25 Jun 2020 23:17:55 +0200 (CEST)
Received: by mail-pg1-f194.google.com with SMTP id z5so3918361pgb.6
 for <openrisc@lists.librecores.org>; Thu, 25 Jun 2020 14:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=CYdo0/N2hPQ38RsTOzG1HX78I9n3NR49FO824e6zLtQ=;
 b=FDoOD71AUBcdqMd1QpOGzqSOfHIfeqUX9WRT2uVYBig3mcL8Etxvpb8vKA19DXCEHk
 hGGyn1qQff5t9NyGd0lso3F1GiQRnyM9Thb1X3Q9nK5u7AM24Qpc5yMKBaX3ULrGDdmI
 aW3HUYFlAs8muNXQr2XbluBC6XcTXX0ykUXQ1EzqTydZoE90RxOfVwphYK6gTw5MJDP9
 mgw88O7NpAvmCyIxt25IifP2Bt29eyhNzOX/15SZvv0sU/nuxlLY/V8fYEtI3N0b3pKT
 gp2NuMwvUxbTosGypDo6A5687Z6EsY8/j4IN6ojCLjAHh/Y+rVlTIkural2QcqlX4Tvf
 Rmrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CYdo0/N2hPQ38RsTOzG1HX78I9n3NR49FO824e6zLtQ=;
 b=e4RMHaMK3qKhX8oDjwDx/sHo1QxQIUY33JdQIxNv8Xk2pXl60zTJHEhlwh0/K0kg5u
 weHfe/iYvaYXd67ILQTOjq5E/TDOn3Aqv6/0oc4TxrgQrtA9aQQLP5HM8PF/QaHPMbCx
 9pQNr+QXB1cDUQutHCljqkxl1sU/LzSdoTO++bbfKdxceEj/oe0daqAW3YNGWzYCgUal
 spCC1uYKNhX01rAyzLHlAD7KskEOUGiIQM+ovEVhkKFDFHVMKLIcfMZroRoKsEd3XEnx
 7h/8DVUbLj3cD27koLb+OjT/GNOa9T+ViN/0umxkF7Wum5outxhF0B6RGMRJv+5zzjyM
 rQQg==
X-Gm-Message-State: AOAM530jVhSVIY0h92EE4VB01W/gRusjmphH5zxt8cxmd8MaPOPYWHk3
 4khPejO5xBnCx3KKyAoz9f0=
X-Google-Smtp-Source: ABdhPJzJyZJ3I3aIXnZZyRAyJOt5+B79P9o0RtXQJRVeujxKDOJjiVciYAKydYrmNHnRZVpci1OEig==
X-Received: by 2002:a62:8c12:: with SMTP id m18mr36470728pfd.111.1593119872858; 
 Thu, 25 Jun 2020 14:17:52 -0700 (PDT)
Received: from localhost (g2.222-224-226.ppp.wakwak.ne.jp. [222.224.226.2])
 by smtp.gmail.com with ESMTPSA id l2sm9885953pjl.34.2020.06.25.14.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 14:17:52 -0700 (PDT)
Date: Fri, 26 Jun 2020 06:17:49 +0900
From: Stafford Horne <shorne@gmail.com>
To: Christian Brauner <christian.brauner@ubuntu.com>
Message-ID: <20200625211749.GH1401039@lianli.shorne-pla.net>
References: <20200622234326.906346-1-christian.brauner@ubuntu.com>
 <20200622234326.906346-18-christian.brauner@ubuntu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200622234326.906346-18-christian.brauner@ubuntu.com>
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
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org,
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
 linuxppc-dev@lists.ozlabs.org, Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
 linux-m68k@lists.linux-m68k.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Tony Luck <tony.luck@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Nick Hu <nickhu@andestech.com>, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Richard Weinberger <richard@nod.at>,
 Paul Mackerras <paulus@samba.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBKdW4gMjMsIDIwMjAgYXQgMDE6NDM6MjZBTSArMDIwMCwgQ2hyaXN0aWFuIEJyYXVu
ZXIgd3JvdGU6Cgo+IGRpZmYgLS1naXQgYS9hcmNoL29wZW5yaXNjL2tlcm5lbC9wcm9jZXNzLmMg
Yi9hcmNoL29wZW5yaXNjL2tlcm5lbC9wcm9jZXNzLmMKPiBpbmRleCBkNzAxMGU3MjQ1MGMuLjE5
MDQ1YTNlZmI4YSAxMDA2NDQKPiAtLS0gYS9hcmNoL29wZW5yaXNjL2tlcm5lbC9wcm9jZXNzLmMK
PiArKysgYi9hcmNoL29wZW5yaXNjL2tlcm5lbC9wcm9jZXNzLmMKPiBAQCAtMTE2LDcgKzExNiw3
IEBAIHZvaWQgcmVsZWFzZV90aHJlYWQoc3RydWN0IHRhc2tfc3RydWN0ICpkZWFkX3Rhc2spCj4g
IGV4dGVybiBhc21saW5rYWdlIHZvaWQgcmV0X2Zyb21fZm9yayh2b2lkKTsKPiAgCj4gIC8qCj4g
LSAqIGNvcHlfdGhyZWFkX3Rscwo+ICsgKiBjb3B5X3RocmVhZAo+ICAgKiBAY2xvbmVfZmxhZ3M6
IGZsYWdzCj4gICAqIEB1c3A6IHVzZXIgc3RhY2sgcG9pbnRlciBvciBmbiBmb3Iga2VybmVsIHRo
cmVhZAo+ICAgKiBAYXJnOiBhcmcgdG8gZm4gZm9yIGtlcm5lbCB0aHJlYWQ7IGFsd2F5cyBOVUxM
IGZvciB1c2Vyc3BhY2UgdGhyZWFkCj4gQEAgLTE0Nyw3ICsxNDcsNyBAQCBleHRlcm4gYXNtbGlu
a2FnZSB2b2lkIHJldF9mcm9tX2Zvcmsodm9pZCk7Cj4gICAqLwo+ICAKPiAgaW50Cj4gLWNvcHlf
dGhyZWFkX3Rscyh1bnNpZ25lZCBsb25nIGNsb25lX2ZsYWdzLCB1bnNpZ25lZCBsb25nIHVzcCwK
PiArY29weV90aHJlYWQodW5zaWduZWQgbG9uZyBjbG9uZV9mbGFncywgdW5zaWduZWQgbG9uZyB1
c3AsCj4gIAkJdW5zaWduZWQgbG9uZyBhcmcsIHN0cnVjdCB0YXNrX3N0cnVjdCAqcCwgdW5zaWdu
ZWQgbG9uZyB0bHMpCj4gIHsKCkZvciB0aGUgT3BlblJJU0MgYml0LgoKQWNrZWQtYnk6IFN0YWZm
b3JkIEhvcm5lIDxzaG9ybmVAZ21haWwuY29tPgoKQWxzbywgSSB3b3VsZCBhZ3JlZSB3aXRoIHdo
YXQgS2VlcyBtZW50aW9uZWQgYWJvdXQgYWxpZ25pbmcgdGhlIHBhcmFtZXRlcnMuClN1cmUgdGhh
dCB3b3VsZCBiZSBtb3JlIHdvcmsgYnV0IGl0IHdvdWxkIGJlIGFwcHJlY2lhdGVkLgoKLVN0YWZm
b3JkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5S
SVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xp
c3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
