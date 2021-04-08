Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B3975358E1A
	for <lists+openrisc@lfdr.de>; Thu,  8 Apr 2021 22:08:16 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 0E34221319;
	Thu,  8 Apr 2021 22:08:16 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id CE7A1210A8
 for <openrisc@lists.librecores.org>; Thu,  8 Apr 2021 22:08:14 +0200 (CEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D87FE61107
 for <openrisc@lists.librecores.org>; Thu,  8 Apr 2021 20:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617912493;
 bh=lJBvFSudiDrxZs+SnGh4YtxaarzP38H043H9PsxfbKw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tBubWWY3+neAkzvUwVEoCp09FqswXCDaRx0c5tqpOKjvcYtVCmFe8JHZ54TSymAUN
 LcUpHK9kiXHWgsLiDmBkRkBjUyBdxgg10Kg/vhYMlvwhM6Td33Bu/fEAPoZH7Rwzg3
 y/02Yh1kIkod5A/25l6gmVy/uGkdg25wTAzvSArNYFnlkxuDzKdqut3U9ckR8RDs9P
 vDjyKsx0P5LjQjJsrua6oISbMFMHmtnTHx3DuSW049FdIe7WaniCJJy7rcIwUJrymm
 s/dYmx64TzuZ1Bdy4C5SW9baPR3AZmbYAPa+qWcEfy3HARHgLptgEEwfQza7x3mWiq
 CQZwA4HwhhFsA==
Received: by mail-ed1-f54.google.com with SMTP id g17so3141599edm.6
 for <openrisc@lists.librecores.org>; Thu, 08 Apr 2021 13:08:12 -0700 (PDT)
X-Gm-Message-State: AOAM532qlBsMZj6yyrH/64J2bsMPf44eCWZx/ExymoLZHgwbFpyeip6A
 vQDIUDmMn3+Kb5RMv0QPELxyOkRaRu01PuHj7A==
X-Google-Smtp-Source: ABdhPJyQM3sGNyB4lBHJyB/vMz0AuBm9hT4GnsJ9rwYhPZ4h1PIVlO3IzyI5ADQSr6ra6UOvePCEFavpVtRgMZ1GG6I=
X-Received: by 2002:a05:6402:212:: with SMTP id
 t18mr13947421edv.165.1617912491462; 
 Thu, 08 Apr 2021 13:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <34d20d1dbb88f26d418b33985557b0475374a1a5.1617556785.git.christophe.leroy@csgroup.eu>
In-Reply-To: <34d20d1dbb88f26d418b33985557b0475374a1a5.1617556785.git.christophe.leroy@csgroup.eu>
From: Rob Herring <robh@kernel.org>
Date: Thu, 8 Apr 2021 15:08:00 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ=UNfptbNHR5XAS9BQRv3C5+YonW9rwypA5gGt2N7bGQ@mail.gmail.com>
Message-ID: <CAL_JsqJ=UNfptbNHR5XAS9BQRv3C5+YonW9rwypA5gGt2N7bGQ@mail.gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [OpenRISC] [RFC PATCH v6 1/1] cmdline: Add capability to both
 append and prepend at the same time
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
 Arnd Bergmann <arnd@kernel.org>, microblaze <monstr@monstr.eu>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 devicetree@vger.kernel.org, SH-Linux <linux-sh@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-xtensa@linux-xtensa.org,
 X86 ML <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 nios2 <ley.foon.tan@intel.com>, "open list:MIPS" <linux-mips@vger.kernel.org>,
 linux-mm <linux-mm@kvack.org>, Openrisc <openrisc@lists.librecores.org>,
 linux-hexagon@vger.kernel.org, sparclinux <sparclinux@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Daniel Walker <danielwa@cisco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU3VuLCBBcHIgNCwgMjAyMSBhdCAxMjoyMCBQTSBDaHJpc3RvcGhlIExlcm95CjxjaHJpc3Rv
cGhlLmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOgo+Cj4gT25lIHVzZXIgaGFzIGV4cHJlc3NlZCB0
aGUgbmVlZCB0byBib3RoIGFwcGVuZCBhbmQgcHJlcGVuZCBzb21lCj4gYnVpbHQtaW4gcGFyYW1l
dGVycyB0byB0aGUgY29tbWFuZCBsaW5lIHByb3ZpZGVkIGJ5IHRoZSBib290bG9hZGVyLgo+Cj4g
QWxsdGhvdWdoIGl0IGlzIGEgY29ybmVyIGNhc2UsIGl0IGlzIGVhc3kgdG8gaW1wbGVtZW50IHNv
IGxldCdzIGRvIGl0Lgo+Cj4gV2hlbiB0aGUgdXNlciBjaG9vc2VzIHRvIHByZXBlbmQgdGhlIGJv
b3Rsb2FkZXIgcHJvdmlkZWQgY29tbWFuZCBsaW5lCj4gd2l0aCB0aGUgYnVpbHQtaW4gY29tbWFu
ZCBsaW5lLCBoZSBpcyBvZmZlcmVkIHRoZSBwb3NzaWJpbGl0eSB0byBlbnRlcgo+IGFuIGFkZGl0
aW9ubmFsIGJ1aWx0LWluIGNvbW1hbmQgbGluZSB0byBiZSBhcHBlbmRlZCBhZnRlciB0aGUKPiBi
b290bG9hZGVyIHByb3ZpZGVkIGNvbW1hbmQgbGluZS4KPgo+IEl0IGlzIGEgY29tcGxlbWVudGFy
eSBmZWF0dXJlIHdoaWNoIGhhcyBubyBpbXBhY3Qgb24gdGhlIGFscmVhZHkKPiBleGlzdGluZyBv
bmVzIGFuZC9vciB0aGUgZXhpc3RpbmcgZGVmY29uZmlnLgo+Cj4gU3VnZ2VzdGVkLWJ5OiBEYW5p
ZWwgV2Fsa2VyIDxkYW5pZWx3YUBjaXNjby5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3Bo
ZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pgo+IC0tLQo+IFNlbmRpbmcgdGhp
cyBvdXQgYXMgYW4gUkZDLCBhcHBsaWVzIG9uIHRvcCBvZiB0aGUgc2VyaWVzCj4gKCJJbXBsZW1l
bnQgR0VORVJJQ19DTURMSU5FIikuIEkgd2lsbCBhZGQgaXQgdG8gdGhlIHNlcmllcyBuZXh0IHNw
aW4KPiB1bmxlc3Mgc29tZW9uZSBpcyBhZ2FpbnN0IGl0LgoKV2VsbCwgaXQgd29ya3MsIGJ1dCB5
b3UgYXJlIHdvcmtpbmcgYXJvdW5kIHRoZSBleGlzdGluZyBrY29uZmlnIGFuZAp0aGUgcmVzdWx0
IGlzIG5vdCBncmVhdC4gWW91J2QgbmV2ZXIgZGVzaWduIGl0IHRoaXMgd2F5LgoKUm9iCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxp
bmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJl
Y29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
