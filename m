Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B5F8F4249E9
	for <lists+openrisc@lfdr.de>; Thu,  7 Oct 2021 00:37:46 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 37DA123F47;
	Thu,  7 Oct 2021 00:37:46 +0200 (CEST)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mail.librecores.org (Postfix) with ESMTPS id 6B000211D5
 for <openrisc@lists.librecores.org>; Thu,  7 Oct 2021 00:37:44 +0200 (CEST)
Received: by mail-pl1-f170.google.com with SMTP id b22so2662938pls.1
 for <openrisc@lists.librecores.org>; Wed, 06 Oct 2021 15:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=u2ABEJkCd1WJjIKZz+HrMsC2GEgILkJNEDXWHfmz6WM=;
 b=FIrtOed5QowKUvESH0rG0wvV+3jKddQCuuIuBfhHRTk8T8VmPDFwv1/sTJAAFMgoXe
 HXkN7YWXjhF/zrR2F/U+/MkjdMr28Eiiif61PM8lgdzeGlwKVNoy3cZO3oVwxlf1y4Qq
 ML0Zxd6olLxMEd7tbUGjRpK/R7cb1ynklKOEnOsKGuHS+AR9eM3gQhrSgwrpbIXxDltH
 O/Ru0l0Mwm5WP0mW7srNV2jrlVjnmHbcXmHAwvScFtyDBwPixATxWKZZPvwE9Leemq7b
 /FuyLrO0jdPkAaWnvyISUJPK4unL1H92dmReVh6yyqBPX6EVv7yFmcldM3IfxchdNGsR
 dHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=u2ABEJkCd1WJjIKZz+HrMsC2GEgILkJNEDXWHfmz6WM=;
 b=zz6hxZCcx+Ee1NqwnbhNne0/54UqN59Yobsnwt+SroIsdLtTNP0PZrAkG1XujPjt64
 iEag/7yyW9d1GTmjqUBX5TH6Oy8YRiBDu/FdTbbyR8FuS25zWL84j7DY2sn+FU9aMpJp
 jwE/PC9UW3LriBKV5IDUq4qTEdob/nnIscS9vPqk5LXgQubpE6EBOYMUJCdBeGZyueY+
 oxC9NDu0ZWsOsYQX7BbsfWtITb6IEJcPd71ffDFRz47QwlrSFs3ErRmX3HYReQUuCpLd
 ovqFU+aEw5g/hKrS3jXhXXjUiwZu6H61wgzWwrO1FmDpqqAQyuON2KGzNGFU4GSpbj2Q
 1IrA==
X-Gm-Message-State: AOAM533qGn2y9ff14SQYiJPwLxWBL/bK3Or+xPqOKl8IG8qtCB38ZAUP
 pNqzSsjZcchWxOnYWz/U+8Q=
X-Google-Smtp-Source: ABdhPJz4BaWTMOr4ZP31Nn4C5AszSnkpRS3L0Y1gfKAehJA2FRUXByCD1kztbcVi2shP0MV6GW1oQQ==
X-Received: by 2002:a17:90b:1804:: with SMTP id
 lw4mr830200pjb.174.1633559862671; 
 Wed, 06 Oct 2021 15:37:42 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id c18sm20848814pge.69.2021.10.06.15.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 15:37:41 -0700 (PDT)
Date: Thu, 7 Oct 2021 07:37:39 +0900
From: Stafford Horne <shorne@gmail.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Message-ID: <YV4lM/YJ4V4EAlZb@antec>
References: <20211006164332.1981454-1-robh@kernel.org>
 <20211006164332.1981454-7-robh@kernel.org> <YV4KkAC2p9D4yCnH@antec>
 <20211006212728.GM10333@gate.crashing.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211006212728.GM10333@gate.crashing.org>
Subject: Re: [OpenRISC] [PATCH 06/12] openrisc: Use of_get_cpu_hwid()
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
Cc: Rich Felker <dalias@libc.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, x86@kernel.org,
 Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Jonas Bonn <jonas@southpole.se>, Rob Herring <robh@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-sh@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 bcm-kernel-feedback-list@broadcom.com, James Morse <james.morse@arm.com>,
 devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Ray Jui <rjui@broadcom.com>, openrisc@lists.librecores.org,
 Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Scott Branden <sbranden@broadcom.com>, Yoshinori Sato <ysato@users.osdn.me>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgU2VnaGVyLAoKT24gV2VkLCBPY3QgMDYsIDIwMjEgYXQgMDQ6Mjc6MjhQTSAtMDUwMCwgU2Vn
aGVyIEJvZXNzZW5rb29sIHdyb3RlOgo+IE9uIFRodSwgT2N0IDA3LCAyMDIxIGF0IDA1OjQ0OjAw
QU0gKzA5MDAsIFN0YWZmb3JkIEhvcm5lIHdyb3RlOgo+ID4gWW91IGhhdmUgZGVmaW5lZCBvZl9n
ZXRfY3B1X2h3aWQgdG8gcmV0dXJuIHU2NCwgd2lsbCB0aGlzIGNyZWF0ZSBjb21waWxlcgo+ID4g
d2FybmluZ3Mgd2hlbiBzaW5jZSB3ZSBhcmUgc3RvcmluZyBhIHU2NCBpbnRvIGEgdTMyPwo+ID4g
Cj4gPiBJdCBzZWVtcyBvbmx5IGlmIHdlIG1ha2Ugd2l0aCBXPTMuCj4gCj4gWWVzLiAgVGhpcyBp
cyBkb25lIGJ5IC1XY29udmVyc2lvbiwgIldhcm4gZm9yIGltcGxpY2l0IGNvbnZlcnNpb25zIHRo
YXQKPiBtYXkgYWx0ZXIgYSB2YWx1ZS4iCgpZZWFoLCB0aGF0IGlzIHdoYXQgSSBmb3VuZCBvdXQg
d2hlbiBJIGxvb2tlZCBpbnRvIGl0LgoKPiA+IEkgdGhvdWdodCB3ZSB1c3VhbGx5IHdhcm5lZCBv
biB0aGlzLgo+IAo+IFRoaXMgd2FybmluZyBpcyBub3QgaW4gLVdhbGwgb3IgLVdleHRyYSBlaXRo
ZXIsIGl0IHN1ZmZlcnMgdG9vIG11Y2ggZnJvbQo+IGZhbHNlIHBvc2l0aXZlcy4gIEl0IGlzIHZl
cnkgbmF0dXJhbCB0byBqdXN0IGlnbm9yZSB0aGUgaGlnaCBiaXRzIG9mCj4gbW9kdWxvIHR5cGVz
ICh3aGljaCBpcyB3aGF0ICJ1bnNpZ25lZCIgdHlwZXMgKmFyZSopLiAgT3IgdGhlIGJpdHMgdGhh
dAo+ICJmYWxsIG9mZiIgb24gYSBjb252ZXJzaW9uLiAgVGhlIEMgc3RhbmRhcmQgbWFrZXMgdGhp
cyByZXF1aXJlZAo+IGJlaGF2aW91ciwgaXQgaXMgdXNlZnVsLCBhbmQgaXQgaXMgdGhlIG9ubHkg
Y29udmVuaWVudCB3YXkgb2YgZ2V0dGluZwo+IHRoaXMhCgpUaGFua3MgZm9yIHRoZSBiYWNrZ3Jv
dW5kLCBJdCBkb2VzIG1ha2Ugc2Vuc2UuIEkgZ3Vlc3MgSSB3YXMgY29uZnVzZWQgd2l0aCBqYXZh
CndoaWNoIHJlcXVpcmVzIGNhc3Rpbmcgd2hlbiB5b3Ugc3RvcmUgdG8gYSBzbWFsbGVyIHNpemUu
ICBJLmUuCgogICAgVGVzdC5qYXZhOjU6IGVycm9yOiBpbmNvbXBhdGlibGUgdHlwZXM6IHBvc3Np
YmxlIGxvc3N5IGNvbnZlcnNpb24gZnJvbSBpbnQgdG8gc2hvcnQKCXMgPSBpOwoKLVN0YWZmb3Jk
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVND
IG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3Rz
LmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
