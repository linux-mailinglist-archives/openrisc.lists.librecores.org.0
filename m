Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 4CB3211AA1D
	for <lists+openrisc@lfdr.de>; Wed, 11 Dec 2019 12:44:21 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E80BD207E6;
	Wed, 11 Dec 2019 12:44:20 +0100 (CET)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by mail.librecores.org (Postfix) with ESMTPS id 799A9207E0
 for <openrisc@lists.librecores.org>; Wed, 11 Dec 2019 12:44:19 +0100 (CET)
Received: by mail-pf1-f194.google.com with SMTP id d199so1682637pfd.11
 for <openrisc@lists.librecores.org>; Wed, 11 Dec 2019 03:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=L1TAvc8RGNsqH0JuLLqvj15JWLYrV9mvuAuSwcX7FcU=;
 b=W8goNZ0+qqMfovD7B6sFL47mksq/ByeP4gqvPKxTpMKwXp/ZCQfjWRmLwPNrRRj2jB
 DjsfKv8HidQgeG0Lu6g1cW1gNJ8vmPEinpMCYcTHHYhJXvwTVy1iEAwVtFBS4t3E0UAX
 ixau267jx16ERkj8Taff2S4LojIEvhB4NtTuf78kk+Op+LXqFFrSHkbrScHnUQxGmQPT
 UwDSC2oHck3UISILqJMsSncIRETILJ/q3mM/l12TeK3t/kHamxclpC/svv4DTNCxd7OZ
 TjJhK7Xa6A7sI3i7v+BC6f80wC1NQxbTq5bG7GTFbzERzqzE0r2fy3LwEdtDRXFbOYt4
 nacg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=L1TAvc8RGNsqH0JuLLqvj15JWLYrV9mvuAuSwcX7FcU=;
 b=bJKviGi/HS8LmDGtsENoqy7ZvhWXgd7V10ORkJJ5wWJ7ncLddimXq89kkDLXPECAIZ
 ++AAMLEQnulAGkBmpaQeaDWXuZxb8IXNhFUzAjY9Q6RX31KDyHLaVnOmPoKh2UqU1e+p
 jAlLMuNL+p0yBFHkdDmzogJH/1LDpfx4flc1rDNtTdjrXXNUhcxdJhOxn8KLN8nT9i5b
 7CBzf9H0Sk9L8KF5deuPNq5RSFgB7pxVJCdHm5UFEggteSI3i7vniPkVpm+2+0lX5cK6
 aA1JqOPB/4N+SSA9ou4ESUa6W+bQ4vr3XUUBufcJ4frOmeRlJrUVZneGDena315XLfTI
 wfiQ==
X-Gm-Message-State: APjAAAVS1Uo1aCTFiFAwZDibipX2ANwcMS13oQAtj47PMnCwMK9h2OhH
 h4ucYfAePcy5M4d/2UBGmOE=
X-Google-Smtp-Source: APXvYqxke79h8rG9NK3chIXjR6NgGj5EmTYgOTUCu8sApdSg0OErPSpS/lOLPtSO8M0hkes9f60crw==
X-Received: by 2002:aa7:9313:: with SMTP id 19mr3143366pfj.160.1576064657853; 
 Wed, 11 Dec 2019 03:44:17 -0800 (PST)
Received: from localhost (g143.222-224-150.ppp.wakwak.ne.jp. [222.224.150.143])
 by smtp.gmail.com with ESMTPSA id o23sm2790897pgj.90.2019.12.11.03.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2019 03:44:17 -0800 (PST)
Date: Wed, 11 Dec 2019 20:44:15 +0900
From: Stafford Horne <shorne@gmail.com>
To: GNU Binutils <binutils@sourceware.org>
Message-ID: <20191211114415.GR24874@lianli.shorne-pla.net>
References: <20191210214906.21465-1-shorne@gmail.com>
 <20191210214906.21465-3-shorne@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191210214906.21465-3-shorne@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [OpenRISC] [PATCH 2/2] or1k: Regnerate opcode files after
 removing 64-bit support
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
Cc: Openrisc <openrisc@lists.librecores.org>, dalias@libc.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Tm90ZSBzdWJqZWN0IHdpbGwgYmUgdXBkYXRlZCB0byBzcGVsbCBSZWdlbmVyYXRlIGNvcnJlY3Rs
eS4KCi1TdGFmZm9yZAoKT24gV2VkLCBEZWMgMTEsIDIwMTkgYXQgMDY6NDk6MDZBTSArMDkwMCwg
U3RhZmZvcmQgSG9ybmUgd3JvdGU6Cj4gb3Bjb2Rlcy9DaGFuZ2VMb2c6Cj4gCj4geXl5eS1tbS1k
ZCAgU3RhZmZvcmQgSG9ybmUgIDxzaG9ybmVAZ21haWwuY29tPgo+IAo+IAkqIG9yMWstYXNtLmM6
IFJlZ2VuZXJhdGUuCj4gCSogb3Ixay1kZXNjLmM6IFJlZ2VuZXJhdGUuCj4gCSogb3Ixay1kZXNj
Lmg6IFJlZ2VuZXJhdGUuCj4gCSogb3Ixay1kaXMuYzogUmVnZW5lcmF0ZS4KPiAJKiBvcjFrLWli
bGQuYzogUmVnZW5lcmF0ZS4KPiAJKiBvcjFrLW9wYy5jOiBSZWdlbmVyYXRlLgo+IAkqIG9yMWst
b3BjLmg6IFJlZ2VuZXJhdGUuCj4gCSogb3Ixay1vcGluc3QuYzogUmVnZW5lcmF0ZS4KPiAtLS0K
PiAgb3Bjb2Rlcy9vcjFrLWFzbS5jICAgIHwgICAgOSAtCj4gIG9wY29kZXMvb3Ixay1kZXNjLmMg
ICB8IDE4MTEgKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgb3Bj
b2Rlcy9vcjFrLWRlc2MuaCAgIHwgIDMzMiArKysrLS0tLQo+ICBvcGNvZGVzL29yMWstZGlzLmMg
ICAgfCAgICA5IC0KPiAgb3Bjb2Rlcy9vcjFrLWlibGQuYyAgIHwgICA2MCArLQo+ICBvcGNvZGVz
L29yMWstb3BjLmMgICAgfCAgMTUyIC0tLS0KPiAgb3Bjb2Rlcy9vcjFrLW9wYy5oICAgIHwgICAy
OCArLQo+ICBvcGNvZGVzL29yMWstb3BpbnN0LmMgfCAgNDI4ICsrKysrLS0tLS0KPiAgOCBmaWxl
cyBjaGFuZ2VkLCAxMTgyIGluc2VydGlvbnMoKyksIDE2NDcgZGVsZXRpb25zKC0pCj4gCiAKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFp
bGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGli
cmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
