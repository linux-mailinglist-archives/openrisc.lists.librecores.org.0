Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 85F2C42482A
	for <lists+openrisc@lfdr.de>; Wed,  6 Oct 2021 22:44:06 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3322120DEE;
	Wed,  6 Oct 2021 22:44:06 +0200 (CEST)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mail.librecores.org (Postfix) with ESMTPS id BAEE920162
 for <openrisc@lists.librecores.org>; Wed,  6 Oct 2021 22:44:04 +0200 (CEST)
Received: by mail-pj1-f54.google.com with SMTP id
 d13-20020a17090ad3cd00b0019e746f7bd4so5354024pjw.0
 for <openrisc@lists.librecores.org>; Wed, 06 Oct 2021 13:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uukXjZUQ/w+EOWxXqSK1+sdvRdmpSRZkmYypGawzIsM=;
 b=QT+moIpptwRsvjJhH6SoVjzQTZZ76DE7Nw9kqS29J/CEKIqSBkKNAPsy0jT6+cMT5r
 0B+0+QxpzmLLa3r7jEXnwxbIQgJkwMi/us4S+81A070jhHgCr7uQ+fbqDmEae7tJyZrW
 KXcNV8SnxYIgrHqlro0WODjOtXLW8X88ZHdiubGxyQ6s4VSefvMST/UT52GjNmBirP7J
 vPJrn4/h0HeMwFA9oFdn+ECv8WDQE4jLb4GwOzBBu4isPwb9sn2ye3J8U1vaLKqwIt6z
 g4sBC+3kK0eokeo5x1JO49TmdiQsp14FxekFKZ6n9Z+Jk+BJ4arhTM0CkIcl8c56mqWF
 a5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uukXjZUQ/w+EOWxXqSK1+sdvRdmpSRZkmYypGawzIsM=;
 b=OZUN9B2n0Vn/nBeAlgajJ/UJo6n7p9UvcyDF247XlQdzTc3eTeJiNyIf5flc5s8yi5
 5yDL8/tKAsvaKaioGIEXGGddukBvTe79ajpg2NDbWoVjGsR2rNswzySAvYcMq07U4C7Z
 Emg0Ai9pNGa6Fwd1uOQDbbRRX0jp41C4+xQ5RP12q4HkkIFoV/28Tu+TlaOrxqevaRAm
 I7z5AvV6StcVcsAMitPdcxRKNq7X96JUfYuVOPRqTtFx1Rim4LC/qj9CUP65cjv8p9FH
 B1qYDAKYm6KS9/P6hoVJdME4N3VdtcZr6o0X+hwvsAlm7xPmsLpz3TEYwnx042eBRh2t
 2Rig==
X-Gm-Message-State: AOAM530IaNx3QlmAeOiqrN+1MD5dAtPkjD9l9Mg7Zjg4umn3q/bWDG2s
 09TZG5u5yF9GExcb3ZzVSz4=
X-Google-Smtp-Source: ABdhPJxbN+u6234S13N4970pWpeBYhU6hjO3nALy/nZjNDvGJdvqZ+ABgTpyG64/0LL2Z6QM8DUU9w==
X-Received: by 2002:a17:902:bb81:b0:12d:a7ec:3d85 with SMTP id
 m1-20020a170902bb8100b0012da7ec3d85mr328965pls.17.1633553043180; 
 Wed, 06 Oct 2021 13:44:03 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id q8sm5806904pja.52.2021.10.06.13.44.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 13:44:02 -0700 (PDT)
Date: Thu, 7 Oct 2021 05:44:00 +0900
From: Stafford Horne <shorne@gmail.com>
To: Rob Herring <robh@kernel.org>
Message-ID: <YV4KkAC2p9D4yCnH@antec>
References: <20211006164332.1981454-1-robh@kernel.org>
 <20211006164332.1981454-7-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211006164332.1981454-7-robh@kernel.org>
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
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, bcm-kernel-feedback-list@broadcom.com,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Ray Jui <rjui@broadcom.com>, openrisc@lists.librecores.org,
 Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Scott Branden <sbranden@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Frank Rowand <frowand.list@gmail.com>, James Morse <james.morse@arm.com>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBPY3QgMDYsIDIwMjEgYXQgMTE6NDM6MjZBTSAtMDUwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gUmVwbGFjZSBvcGVuIGNvZGVkIHBhcnNpbmcgb2YgQ1BVIG5vZGVzJyAncmVnJyBwcm9w
ZXJ0eSB3aXRoCj4gb2ZfZ2V0X2NwdV9od2lkKCkuCj4gCj4gQ2M6IEpvbmFzIEJvbm4gPGpvbmFz
QHNvdXRocG9sZS5zZT4KPiBDYzogU3RlZmFuIEtyaXN0aWFuc3NvbiA8c3RlZmFuLmtyaXN0aWFu
c3NvbkBzYXVuYWxhaHRpLmZpPgo+IENjOiBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNv
bT4KPiBDYzogb3BlbnJpc2NAbGlzdHMubGlicmVjb3Jlcy5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBS
b2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+IC0tLQo+ICBhcmNoL29wZW5yaXNjL2tlcm5l
bC9zbXAuYyB8IDYgKy0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNSBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9rZXJuZWwvc21wLmMg
Yi9hcmNoL29wZW5yaXNjL2tlcm5lbC9zbXAuYwo+IGluZGV4IDQxNWUyMDk3MzJhMy4uN2Q1YTRm
MzAzYTVhIDEwMDY0NAo+IC0tLSBhL2FyY2gvb3BlbnJpc2Mva2VybmVsL3NtcC5jCj4gKysrIGIv
YXJjaC9vcGVucmlzYy9rZXJuZWwvc21wLmMKPiBAQCAtNjUsMTEgKzY1LDcgQEAgdm9pZCBfX2lu
aXQgc21wX2luaXRfY3B1cyh2b2lkKQo+ICAJdTMyIGNwdV9pZDsKPiAgCj4gIAlmb3JfZWFjaF9v
Zl9jcHVfbm9kZShjcHUpIHsKPiAtCQlpZiAob2ZfcHJvcGVydHlfcmVhZF91MzIoY3B1LCAicmVn
IiwgJmNwdV9pZCkpIHsKPiAtCQkJcHJfd2FybigiJXMgbWlzc2luZyByZWcgcHJvcGVydHkiLCBj
cHUtPmZ1bGxfbmFtZSk7Cj4gLQkJCWNvbnRpbnVlOwo+IC0JCX0KPiAtCj4gKwkJY3B1X2lkID0g
b2ZfZ2V0X2NwdV9od2lkKGNwdSk7CgpZb3UgaGF2ZSBkZWZpbmVkIG9mX2dldF9jcHVfaHdpZCB0
byByZXR1cm4gdTY0LCB3aWxsIHRoaXMgY3JlYXRlIGNvbXBpbGVyCndhcm5pbmdzIHdoZW4gc2lu
Y2Ugd2UgYXJlIHN0b3JpbmcgYSB1NjQgaW50byBhIHUzMj8KCkl0IHNlZW1zIG9ubHkgaWYgd2Ug
bWFrZSB3aXRoIFc9My4KCkkgdGhvdWdodCB3ZSB1c3VhbGx5IHdhcm5lZCBvbiB0aGlzLiAgT2gg
d2VsbCwgZm9yIHRoZSBvcGVucmlzYyBiaXRzLgoKQWNrZWQtYnk6IFN0YWZmb3JkIEhvcm5lIDxz
aG9ybmVAZ21haWwuY29tPgoKPiAgCQlpZiAoY3B1X2lkIDwgTlJfQ1BVUykKPiAgCQkJc2V0X2Nw
dV9wb3NzaWJsZShjcHVfaWQsIHRydWUpOwo+ICAJfQo+IC0tIAo+IDIuMzAuMgo+IApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5n
IGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNv
cmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
