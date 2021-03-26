Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id AC03734B0E4
	for <lists+openrisc@lfdr.de>; Fri, 26 Mar 2021 21:52:23 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 725F6212E9;
	Fri, 26 Mar 2021 21:52:23 +0100 (CET)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 05E15212A3
 for <openrisc@lists.librecores.org>; Fri, 26 Mar 2021 16:47:21 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E5F49619FF
 for <openrisc@lists.librecores.org>; Fri, 26 Mar 2021 15:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616773639;
 bh=FOq/AGTP4gWQcAqm6gE3CbPMoPZd/s7+r0gDFMG3q6U=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=AcCDpzU7tp9iwdGG8gDfzEHT/oRIXsIga7wXxu53WqUJhT2ul2T9YDS65RNqPU2n3
 Xvn+RFssUybeWEZgEY2lh1i4UxjZPbwmKsgliPvp0IToMiB2a/WA5KR9z10HdDinOv
 UYM5sw/0IvqfBsKxROncwVaSX/vsAHxPYgALR1dSYHioveObkwXiHIvFx1Yj/tNdZJ
 KMRbv1ObJxkt+zXV5bOiWGyn/1VwvDn/9VCA4p517RmAt9EEHqYSMNig8Oj+y1Zu4e
 B4aIe1rurjyjKfoN2EcYkT1/pA82eHFw94cAgT8CIulbihfa0tOaUKwaviLlzc9Bb9
 p9VnLj0VX7D0A==
Received: by mail-ed1-f46.google.com with SMTP id l18so6824787edc.9
 for <openrisc@lists.librecores.org>; Fri, 26 Mar 2021 08:47:18 -0700 (PDT)
X-Gm-Message-State: AOAM531NCsZfc0293eb4ozmpfREE1XZSq9wumQwEhN0mqqu6lZCMNVdX
 BTS2c4DN91eR6rMXul8ZSErVcFlTf7seWRB7eg==
X-Google-Smtp-Source: ABdhPJyGMjMWznP/BbCajkt9nas+eMG/Qmwgar26pPUJYE7aEhO5sSz0Y/IOGFJNx4RiD0k/WjxUTeg0KAhhn6cQx0c=
X-Received: by 2002:a05:6402:c88:: with SMTP id
 cm8mr15784199edb.62.1616773637523; 
 Fri, 26 Mar 2021 08:47:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
 <7362e4f6a5f5b79e6ad3fd3cec3183a4a283f7fc.1616765870.git.christophe.leroy@csgroup.eu>
In-Reply-To: <7362e4f6a5f5b79e6ad3fd3cec3183a4a283f7fc.1616765870.git.christophe.leroy@csgroup.eu>
From: Rob Herring <robh@kernel.org>
Date: Fri, 26 Mar 2021 09:47:04 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+LF-s5K4Jwd5jCHrU8271L5WCiGb0tR7aTUa8ddHF1YQ@mail.gmail.com>
Message-ID: <CAL_Jsq+LF-s5K4Jwd5jCHrU8271L5WCiGb0tR7aTUa8ddHF1YQ@mail.gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailman-Approved-At: Fri, 26 Mar 2021 21:51:56 +0100
Subject: Re: [OpenRISC] [PATCH v3 05/17] arm: Convert to GENERIC_CMDLINE
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
Cc: "open list:GENERIC INCLUDE/ASM HEADER FILES" <linux-arch@vger.kernel.org>,
 devicetree@vger.kernel.org, microblaze <monstr@monstr.eu>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 linux-xtensa@linux-xtensa.org, SH-Linux <linux-sh@vger.kernel.org>,
 Will Deacon <will@kernel.org>, X86 ML <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 nios2 <ley.foon.tan@intel.com>, "open list:MIPS" <linux-mips@vger.kernel.org>,
 Openrisc <openrisc@lists.librecores.org>, linux-hexagon@vger.kernel.org,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Daniel Walker <danielwa@cisco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gRnJpLCBNYXIgMjYsIDIwMjEgYXQgNzo0NCBBTSBDaHJpc3RvcGhlIExlcm95CjxjaHJpc3Rv
cGhlLmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOgo+Cj4gVGhpcyBjb252ZXJ0cyB0aGUgYXJjaGl0
ZWN0dXJlIHRvIEdFTkVSSUNfQ01ETElORS4KPgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUg
TGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4KPiAtLS0KPiAgYXJjaC9hcm0vS2Nv
bmZpZyAgICAgICAgICAgICAgfCAzOCArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQo+ICBhcmNoL2FybS9rZXJuZWwvYXRhZ3NfcGFyc2UuYyB8IDE1ICsrKysrLS0tLS0tLS0tCj4g
IDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA0NyBkZWxldGlvbnMoLSkKPgo+IGRp
ZmYgLS1naXQgYS9hcmNoL2FybS9LY29uZmlnIGIvYXJjaC9hcm0vS2NvbmZpZwo+IGluZGV4IDVk
YTk2ZjVkZjQ4Zi4uNjdiYzc1ZjJkYTgxIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtL0tjb25maWcK
PiArKysgYi9hcmNoL2FybS9LY29uZmlnCj4gQEAgLTUwLDYgKzUwLDcgQEAgY29uZmlnIEFSTQo+
ICAgICAgICAgc2VsZWN0IEdFTkVSSUNfQVJDSF9UT1BPTE9HWSBpZiBBUk1fQ1BVX1RPUE9MT0dZ
Cj4gICAgICAgICBzZWxlY3QgR0VORVJJQ19BVE9NSUM2NCBpZiBDUFVfVjdNIHx8IENQVV9WNiB8
fCAhQ1BVXzMydjZLIHx8ICFBRUFCSQo+ICAgICAgICAgc2VsZWN0IEdFTkVSSUNfQ0xPQ0tFVkVO
VFNfQlJPQURDQVNUIGlmIFNNUAo+ICsgICAgICAgc2VsZWN0IEdFTkVSSUNfQ01ETElORSBpZiBB
VEFHUwoKRG9uJ3Qgd2UgbmVlZCB0aGlzIGVuYWJsZWQgZm9yICFBVEFHUyAoaS5lLiBEVCBib290
KT8KCkNhbiB3ZSBhbHdheXMgZW5hYmxlIEdFTkVSSUNfQ01ETElORSBmb3IgT0ZfRUFSTFlfRkxB
VFRSRUU/CgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0
dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
