Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 5045A424BC0
	for <lists+openrisc@lfdr.de>; Thu,  7 Oct 2021 04:25:14 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id DA0FB24106;
	Thu,  7 Oct 2021 04:25:13 +0200 (CEST)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mail.librecores.org (Postfix) with ESMTPS id 2946021011
 for <openrisc@lists.librecores.org>; Thu,  7 Oct 2021 04:25:11 +0200 (CEST)
Received: by mail-pf1-f170.google.com with SMTP id c29so4031368pfp.2
 for <openrisc@lists.librecores.org>; Wed, 06 Oct 2021 19:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6Fbp2oLqg5VLyJhPP2UoprEyUpjt3vE+k1k8NDwLMpk=;
 b=fVpVXChAwZh74Yak5ikdgyaoheURY4K/ccbznO6zTnIB1AbJR+bIgOAW5/cSxWFoOZ
 cY0eBdVYRQP1/jK52zezVr0uzpqaKqL4UT7RQvBZyhmKIcoiByFnE72l/T/lAzTh60PX
 2ZZ2YfXaMMnXi99HoWBLG5uUJUaMAp+mwPmSs0A9L0wSZq5MBqIGrLe/fQpBMPOxvPnK
 4rfWTUo7RKXBeIwus/mUrNTfwOqbla5PIcLbJRJuwd6IvqLGvZcPe9NmM60QdmCBRqmR
 sMF0mjWUQFOWNx2GTwfCL5Ktgovulw8+KnJ+87QvW6vVfTE6IVfRZKsoah2Gd8VJ0NWK
 +Eww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6Fbp2oLqg5VLyJhPP2UoprEyUpjt3vE+k1k8NDwLMpk=;
 b=zrLBIdK90x3YRUX+QYH5fbV/W/ikVMSBqm9vi9rkYQwnLpy6lawnxVu34cjfqLjUYl
 jzN6QHeEZOI7fI9EAjaMMyHM6n7e6iihiyRlcFtD3lhC7/JiER/eKtCXst6/JixKDjK4
 Wgd1Q52L8IuoQvSFiimhhkzN0EevCvWUIal76fysmbCP194TxAEw3JHGGh78TA5r99nt
 IItIuAl6DJdUaiowqYJbsK7rwtz5QLRcDXQVULDh4peJY9043x7Z0W7stL7/95NXUYY6
 jVb6G+hfkWuu2x2PDEJ5GzlcRm2Cm9UL9PweE3VfP5A0/zsKoCJraanHuikBoA8te4ZV
 hnOg==
X-Gm-Message-State: AOAM530ci/dOdVXwbW+2+Q2z59gNRvxPDmX8fLRstEGWKnAmBz8LQGLY
 HMcJiuYwduXj12VIJxCrEBM=
X-Google-Smtp-Source: ABdhPJys1HdOqewyun+C+iToAvx9hnErbBSMfwtBGQraooU+JJaijDbgzG5Y0UhUonum+9KpDmz8JA==
X-Received: by 2002:a63:ed4a:: with SMTP id m10mr1303051pgk.448.1633573509317; 
 Wed, 06 Oct 2021 19:25:09 -0700 (PDT)
Received: from [10.230.29.137] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id g23sm22285369pfu.71.2021.10.06.19.24.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 19:25:08 -0700 (PDT)
Message-ID: <1a15bbef-cf3d-33c6-b6c1-3dd607d71d1d@gmail.com>
Date: Wed, 6 Oct 2021 19:24:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>,
 James Morse <james.morse@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20211006164332.1981454-1-robh@kernel.org>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20211006164332.1981454-1-robh@kernel.org>
Subject: Re: [OpenRISC] [PATCH 00/12] DT: CPU h/w id parsing clean-ups and
 cacheinfo id support
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Scott Branden <sbranden@broadcom.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-sh@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, openrisc@lists.librecores.org,
 Ingo Molnar <mingo@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Borislav Petkov <bp@alien8.de>, bcm-kernel-feedback-list@broadcom.com,
 Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

CgpPbiAxMC82LzIwMjEgOTo0MyBBTSwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gVGhlIGZpcnN0IDEw
IHBhdGNoZXMgYWRkIGEgbmV3IGZ1bmN0aW9uLCBvZl9nZXRfY3B1X2h3aWQoKSwgd2hpY2ggcGFy
c2VzCj4gQ1BVIERUIG5vZGUgJ3JlZycgcHJvcGVydHksIGFuZCB0aGVuIHVzZSBpdCB0byByZXBs
YWNlIGFsbCB0aGUgb3Blbgo+IGNvZGVkIHZlcnNpb25zIG9mIHBhcnNpbmcgQ1BVIG5vZGUgJ3Jl
ZycgcHJvcGVydGllcy4KPiAKPiBUaGUgbGFzdCAyIHBhdGNoZXMgYWRkIHN1cHBvcnQgZm9yIHBv
cHVsYXRpbmcgdGhlIGNhY2hlaW5mbyAnaWQnIG9uIERUCj4gcGxhdGZvcm1zLiBUaGUgbWluaW11
bSBhc3NvY2lhdGVkIENQVSBod2lkIGlzIHVzZWQgZm9yIHRoZSBpZC4gVGhlIGlkIGlzCj4gb3B0
aW9uYWwsIGJ1dCBuZWNlc3NhcnkgZm9yIHJlc2N0cmwgd2hpY2ggaXMgYmVpbmcgYWRhcHRlZCBm
b3IgQXJtIE1QQU0uCj4gCj4gVGVzdGVkIG9uIGFybTY0LiBDb21waWxlIHRlc3RlZCBvbiBhcm0s
IHg4NiBhbmQgcG93ZXJwYy4KCk9uIEFSTSBhbmQgQVJNNjQ6CgpUZXN0ZWQtYnk6IEZsb3JpYW4g
RmFpbmVsbGkgPGYuZmFpbmVsbGlAZ21haWwuY29tPgoKbHNjcHUgLUMgY29udGludWVzIHRvIHdv
cmsgb24gQVJNNjQgYXMgYmVmb3JlIHdpdGggY2FjaGUgcHJvcGVydGllcyAKcHJvdmlkZWQgaW4g
dGhlIEZEVC4KLS0gCkZsb3JpYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29y
ZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
