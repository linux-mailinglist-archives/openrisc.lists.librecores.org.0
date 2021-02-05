Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A0913310CA0
	for <lists+openrisc@lfdr.de>; Fri,  5 Feb 2021 15:43:25 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 35A9120F7C;
	Fri,  5 Feb 2021 15:43:25 +0100 (CET)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mail.librecores.org (Postfix) with ESMTPS id B6947203A0
 for <openrisc@lists.librecores.org>; Fri,  5 Feb 2021 15:43:22 +0100 (CET)
Received: by mail-pl1-f180.google.com with SMTP id y10so3659225plk.7
 for <openrisc@lists.librecores.org>; Fri, 05 Feb 2021 06:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KW2YxiWoUuY8qaPcgZBtVIfE9G2SZ880I/V6+RY2NjM=;
 b=N12CL2qYs6a2FVeLxgBeR7Lp6MiE/N/1gLXkEYnhRuu3M9cI27p9vE7lykcsRajlC6
 6f4FgBPO/JkI9yH9elY1krGGqcHBGI/Fbkgmhx9LPNDseJHpRGdbwobkatdN1lCFDEmh
 GTwKZvr3KVeb8r6H0/ex4pFx9ly444yQ+hQXfJeQdG8Rim+UI4YKIEiCjWyqmpCpsRyE
 146uy6CySZ7TbOzgd/YiVDEFgYMV9FExjiAM0xokhhVn0LlGYvsAWegwEKf/M11M90O7
 QjtKPsrdqZMgQTOqWdJKfCZJq4krA6mBMoQEYnRmsw6H7ngZEt/tcqcukTaBpjriEwRq
 xDXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KW2YxiWoUuY8qaPcgZBtVIfE9G2SZ880I/V6+RY2NjM=;
 b=iz07IKInnO6Q4QY8vxBnWX8qcTTOTO+mBZWkILcuqBJfkTxUA0NiUOARCO8J4NRFl7
 +UyOdrCweFbfKtUk72/FXyESueSFeBBGy58DW6tOomBQtyQ3XozYa3CM6pRxXgEOVEuO
 4HcAYGb96bAFP0sfBq4nzPIzYssIF4L6im0KlLWV9XqP8iX5vwEEp+rt7SIe3l1eKDAQ
 gD7x7p5zHP0L2sm/Wif+Il0G2ERHpGq6lgM5a6f1y4yEYZqmr8HzS8luCD7LEQ/5iALc
 ZzMyvrwVhW20IXFyesLIXglbSXJ8+tgIgCwuqXVdmHo8dC2B3vQUTYWTXuLiTGkZeeGF
 NPXw==
X-Gm-Message-State: AOAM532ME538zEP1yha6nb4PDszhBF5S7NeOHOlC6G+MIw8i48INrlAJ
 eFAbXbuZv/1HuL0i8Z0/6eI=
X-Google-Smtp-Source: ABdhPJwxnLX0P2jLQp2TSikWJzseQNTQ/Sl3m2VTSjQp4jJO0x9Nl9kpAg+2awirDD+ZiHXJCIQ08Q==
X-Received: by 2002:a17:90b:4c8c:: with SMTP id
 my12mr4290989pjb.29.1612536200978; 
 Fri, 05 Feb 2021 06:43:20 -0800 (PST)
Received: from localhost (g186.222-224-165.ppp.wakwak.ne.jp. [222.224.165.186])
 by smtp.gmail.com with ESMTPSA id g22sm9582305pfu.200.2021.02.05.06.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 06:43:20 -0800 (PST)
Date: Fri, 5 Feb 2021 23:43:17 +0900
From: Stafford Horne <shorne@gmail.com>
To: Jan Henrik Weinstock <jan.weinstock@rwth-aachen.de>
Message-ID: <20210205144317.GK2002709@lianli.shorne-pla.net>
References: <0b26eda7-229d-3dc9-f2ae-19b9212fb0ea@rwth-aachen.de>
 <20210129221643.GZ2002709@lianli.shorne-pla.net>
 <2a018afc-d797-3a91-ffab-e55ae3b0a795@rwth-aachen.de>
 <20210130230310.GC2002709@lianli.shorne-pla.net>
 <d9f4aafc-4d65-38b0-dde0-5e155836aee1@rwth-aachen.de>
 <20210131212752.GG2002709@lianli.shorne-pla.net>
 <6dbc27f8-5261-59c5-acba-70f6c6a74ba1@rwth-aachen.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6dbc27f8-5261-59c5-acba-70f6c6a74ba1@rwth-aachen.de>
Subject: Re: [OpenRISC] [PATCH v2] openrisc: use device tree to determine
 present cpus
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
Cc: jonas@southpole.se, openrisc@lists.librecores.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBGZWIgMDEsIDIwMjEgYXQgMTI6NDk6MzFQTSArMDEwMCwgSmFuIEhlbnJpayBXZWlu
c3RvY2sgd3JvdGU6Cj4gVXNlIHRoZSBkZXZpY2UgdHJlZSB0byBkZXRlcm1pbmUgdGhlIHByZXNl
bnQgY3B1cyBpbnN0ZWFkIG9mIGFzc3VtaW5nIGFsbAo+IENPTkZJR19OUkNQVVMgYXJlIGFjdHVh
bGx5IHByZXNlbnQgaW4gdGhlIHN5c3RlbS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gSGVucmlr
IFdlaW5zdG9jayA8amFuLndlaW5zdG9ja0Byd3RoLWFhY2hlbi5kZT4KCkhpIEphbiwKCkkgY2Fu
bm90IGFwcGx5IHRoaXMgcGF0Y2gsIGl0IHNlZW1zIHlvdSBzb21laG93IHNlbnQgaXQgc2lnbmVk
IGFzIGEgbXVsdGlwYXJ0Cm1lc3NhZ2UgdmlhIFRodW5kZXJiaXJkLgoKVGhpcyBjYXVzZXMgZXJy
b3JzIHdoZW4gdHJ5aW5nIHRvIGFwcGx5LCBldmVuIGFmdGVyIEkgdHJpZWQgdG8gbWFudWFsbHkg
Zml4IHRoZQpwYXRjaCBtYWlsOgoKICAgIEFwcGx5aW5nOiBvcGVucmlzYzogdXNlIGRldmljZSB0
cmVlIHRvIGRldGVybWluZSBwcmVzZW50IGNwdXMKICAgIGVycm9yOiBzaGExIGluZm9ybWF0aW9u
IGlzIGxhY2tpbmcgb3IgdXNlbGVzcyAoYXJjaC9vcGVucmlzYy9rZXJuZWwvc21wLmMpLgogICAg
ZXJyb3I6IGNvdWxkIG5vdCBidWlsZCBmYWtlIGFuY2VzdG9yCiAgICBQYXRjaCBmYWlsZWQgYXQg
MDAwMSBvcGVucmlzYzogdXNlIGRldmljZSB0cmVlIHRvIGRldGVybWluZSBwcmVzZW50IGNwdXMK
CkNhbiB5b3Ugc2VuZCB0aGlzIHVzaW5nICdnaXQgc2VuZC1lbWFpbD8nCgpJZiBub3QgSSBjYW4g
Z2V0IGl0IGFwcGxpZWQgd2l0aCBzb21lIHdvcmssIG90aGVyd2lzZSB5b3UgY2FuIHBvaW50IG1l
IHRvIGEgZ2l0CnJlcG8gd2hpY2ggSSBjYW4gcHVsbCBpdCBmcm9tLgoKLVN0YWZmb3JkCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxp
bmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJl
Y29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
