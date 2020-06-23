Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 1EF5A204C19
	for <lists+openrisc@lfdr.de>; Tue, 23 Jun 2020 10:19:11 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id AB1C82014C;
	Tue, 23 Jun 2020 10:19:09 +0200 (CEST)
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by mail.librecores.org (Postfix) with ESMTPS id E9CD820C75
 for <openrisc@lists.librecores.org>; Tue, 23 Jun 2020 02:46:59 +0200 (CEST)
Received: by mail-pj1-f67.google.com with SMTP id jz3so732867pjb.0
 for <openrisc@lists.librecores.org>; Mon, 22 Jun 2020 17:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zu4OU7IGZiTsvIaDwmyLbj4I9ozbACkG/Mn2gAIRkbg=;
 b=eD2zNURLgHPqg/d00zOemVc/uWc9XFUrQc9T/r0CfHnQ37J5w12dtxWOt/XLxUaoPr
 oPBZAAlU/s8JvF08Eg5Uwe6Yf/qJtxl/cKLc4YjjZ2omXW0o0Dck4uICr1tn5iEyOb+s
 XrFSioDSrXqS4AKWpDQOm1ZEp45q7IQaD6sek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zu4OU7IGZiTsvIaDwmyLbj4I9ozbACkG/Mn2gAIRkbg=;
 b=Ue5ZjvXmaQznILMA+8nVE7tj7TSjQ/TUqdtasOfEA11LumksRcJdrfyv6iuaFASD+E
 htCa3FatYCsyAdMej20cKMu+ruV9WmQXMew4HjFVAI2JBj2ob1J6G4uNgqbuvi7/Yxf0
 ME4IjvwvfjVXZwx93qXSu7qBOnsNe02DQzt44z7pbdNhz854JWrQO+9jI+0sPH4sAT9+
 NEYtZldTBK5VXyxpbNWhrpRtDKUkmwhM0XL5mTtTNn9xvSZWEZcRBWiCyVJ0S+mnOWMY
 Ak8OHw4fqBEOpeyuNAZsMZ0AfRUhGHc3PMkNCjv+M0vjKCsTRVetXkLijYatypGlg1Ra
 +Lgg==
X-Gm-Message-State: AOAM531dKPpvbyZtfC+CG8DZQTaeNZKkWiO7YuI1UcOTeqnXnbplZGSc
 KXZddAGbtUpSaMsEravc+WpbjA==
X-Google-Smtp-Source: ABdhPJwLqwCQ0Rost0KalBZ/gdRO16zHbQi9rscaK3Ne64vv0f4wO0Oby1WybaoTmJuLYB1GYOmDPw==
X-Received: by 2002:a17:90a:ee82:: with SMTP id
 i2mr21052514pjz.29.1592873218628; 
 Mon, 22 Jun 2020 17:46:58 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id ii17sm383343pjb.56.2020.06.22.17.46.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 17:46:57 -0700 (PDT)
Date: Mon, 22 Jun 2020 17:46:56 -0700
From: Kees Cook <keescook@chromium.org>
To: Christian Brauner <christian.brauner@ubuntu.com>
Message-ID: <202006221745.5999CF5@keescook>
References: <20200622234326.906346-1-christian.brauner@ubuntu.com>
 <20200622234326.906346-18-christian.brauner@ubuntu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200622234326.906346-18-christian.brauner@ubuntu.com>
X-Mailman-Approved-At: Tue, 23 Jun 2020 10:19:04 +0200
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
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Brian Cain <bcain@codeaurora.org>, linux-xtensa@linux-xtensa.org,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 linux-parisc@vger.kernel.org, Mark Salter <msalter@redhat.com>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 uclinux-h8-devel@lists.sourceforge.jp, Fenghua Yu <fenghua.yu@intel.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-csky@vger.kernel.org,
 Jeff Dike <jdike@addtoit.com>, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
 linux-m68k@lists.linux-m68k.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Nick Hu <nickhu@andestech.com>,
 Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org,
 openrisc@lists.librecores.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Weinberger <richard@nod.at>, Paul Mackerras <paulus@samba.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBKdW4gMjMsIDIwMjAgYXQgMDE6NDM6MjZBTSArMDIwMCwgQ2hyaXN0aWFuIEJyYXVu
ZXIgd3JvdGU6Cj4gTm93IHRoYXQgSEFWRV9DT1BZX1RIUkVBRF9UTFMgaGFzIGJlZW4gcmVtb3Zl
ZCwgcmVuYW1lIGNvcHlfdGhyZWFkX3RscygpCj4gYmFjayBzaW1wbHkgY29weV90aHJlYWQoKS4g
SXQncyBhIHNpbXBsZXIgbmFtZSwgYW5kIGRvZXNuJ3QgaW1wbHkgdGhhdCBvbmx5Cj4gdGxzIGlz
IGNvcGllZCBoZXJlLiBUaGlzIGZpbmlzaGVzIGFuIG91dHN0YW5kaW5nIGNodW5rIG9mIGludGVy
bmFsIHByb2Nlc3MKPiBjcmVhdGlvbiB3b3JrIHNpbmNlIHdlJ3ZlIGFkZGVkIGNsb25lMygpLgo+
IFsuLi5dCj4gLWNvcHlfdGhyZWFkX3Rscyh1bnNpZ25lZCBsb25nIGNsb25lX2ZsYWdzLCB1bnNp
Z25lZCBsb25nIHVzZXJfc3RhY2tfYmFzZSwKPiArY29weV90aHJlYWQodW5zaWduZWQgbG9uZyBj
bG9uZV9mbGFncywgdW5zaWduZWQgbG9uZyB1c2VyX3N0YWNrX2Jhc2UsCj4gIAkJICAgIHVuc2ln
bmVkIGxvbmcgdXNlcl9zdGFja19zaXplLCBzdHJ1Y3QgdGFza19zdHJ1Y3QgKnAsCj4gIAkJICAg
IHVuc2lnbmVkIGxvbmcgdGxzKQoKTWF5YmUgY2xlYW4gdXAgdGhlIGFyZyBpbmRlbnRhdGlvbiB0
b28/IEknbSBub3Qgc3VyZSBob3cgc3Ryb25nbHkgcGVvcGxlCmZlZWwgYWJvdXQgdGhhdCwgYnV0
IEkgdGhpbmsgaXQnZCBiZSBuaWNlLgoKRWl0aGVyIHdheToKClJldmlld2VkLWJ5OiBLZWVzIENv
b2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4KCi0tIApLZWVzIENvb2sKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9w
ZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcv
bGlzdGluZm8vb3BlbnJpc2MK
