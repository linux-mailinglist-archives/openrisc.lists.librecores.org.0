Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 85C26500032
	for <lists+openrisc@lfdr.de>; Wed, 13 Apr 2022 22:48:21 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3762B211D5;
	Wed, 13 Apr 2022 22:48:21 +0200 (CEST)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by mail.librecores.org (Postfix) with ESMTPS id 8F1B221376
 for <openrisc@lists.librecores.org>; Wed, 13 Apr 2022 22:48:18 +0200 (CEST)
Received: by mail-io1-f51.google.com with SMTP id 9so3282916iou.5
 for <openrisc@lists.librecores.org>; Wed, 13 Apr 2022 13:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Hd1YZSgXpg6X/9p6UiYoZww0vIP75IIXaXf9dPKdspo=;
 b=GFFGZmizl6zaTXYGdzuXFJ8Gc6VBR6VD7WKqibwHSJB2p6W0IwVzPaUpl3PdDNMX+2
 xpeSzahaWwo2n9XcYmCf2LNNAWBa3M1tjGYktmwT0yQBMtcFVBYMvncmwUuQiEkYegwc
 2BzkH7M9ZwrOsXp9Gyv4FvDt2ogFI8PwM9umMvhZ2Vyue2bMpmuFGveQyzFYWJeIjEim
 iC2CSEUFPSJefQKW7Np8ZdulibFZK8F+HTNmuYz1f44U0UPGBA1ub4BJOtbql8uN+gc5
 a504TTAGv4TJ2Jd5f2GDusA0OsFhZy+craGEBcjOE6V1Pg+mmsRo+ubpC4k2Ogg7kD6S
 TE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Hd1YZSgXpg6X/9p6UiYoZww0vIP75IIXaXf9dPKdspo=;
 b=NXYHtBjyBNf8KAJTztX8+K2HTm2rutzQ1rYbDod5+rqlwUVuo7xO5WxMTAMqCzcGip
 IFIRD1T/Gop4sD52Nse78ERCm7JjiItWe3H6xflxLHA3JEugNyxnR3SdAmVQpLIJw1Ch
 ijg8bdaqtg+kdonN8mxKOhExx2gA8RldNYhtj6VP3BSBSV6eCxcuAtVGstsyp5GwZSP/
 Y08zSdmcsTy59ZVLf1IXxdoMRJCiKNzjXiv/Om5U5YFyAab0ZT1Yrsx0nZDW2smkMU9b
 xsxXU5lkFh8tRaf9lEFQ1ssv78nuaV94k/vMCtmO789vgXtnG7gNhvr/0KJDE0MD0umt
 +eFA==
X-Gm-Message-State: AOAM531EmzoLFtDbBxMRappZ1QcspQYheOVhYU0TvgoRvJSBQFE6i5X/
 8CIjZCp2qqVkhCbc6N9IMYc1VpbrSAbFuT09YYs=
X-Google-Smtp-Source: ABdhPJwNbXbMMSxkJnO2Z2w8ScfKPUjIEdoe2PtQdLkbDN3uVaW2cqmCjW3eMyel/wJyfA84r0wTJbLPhNKHwBgqGY0=
X-Received: by 2002:a05:6638:e8d:b0:326:684e:ab4c with SMTP id
 p13-20020a0566380e8d00b00326684eab4cmr2679718jas.186.1649882897182; Wed, 13
 Apr 2022 13:48:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAOkYDM+3gwtprv87SzZaiZ+bkhe5Vc3SZ-txTzrxjR_9SHKW9Q@mail.gmail.com>
In-Reply-To: <CAOkYDM+3gwtprv87SzZaiZ+bkhe5Vc3SZ-txTzrxjR_9SHKW9Q@mail.gmail.com>
From: Stafford Horne <shorne@gmail.com>
Date: Thu, 14 Apr 2022 05:48:06 +0900
Message-ID: <CAAfxs74vng_-sz8ckT_D1KT7ToqaiKu8iOMgA+yq4epj=qN_VQ@mail.gmail.com>
To: Robert Finch <robfi680@gmail.com>
Subject: Re: [OpenRISC] Tomasulo's Core
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
Cc: Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgUm9iZXJ0LAoKVGhpcyBsb29rcyBsaWtlIGEgbmVhdCBwcm9qZWN0IHlvdSBhcmUgd29ya2lu
ZyBvbi4KCk9uIFdlZCwgQXByIDEzLCAyMDIyIGF0IDk6MTYgUE0gUm9iZXJ0IEZpbmNoIDxyb2Jm
aTY4MEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGksIEkgaGF2ZSBiZWVuIHBlcnVzaW5nIHRoZSBP
cGVuUklTQyBzaXRlIGFuZCBzdHVkeWluZyB0aGUgT3BlblJJU0MgZGVzaWduLiBJIHJlYWQgYSBj
b21tZW50IGFib3V0IHRoZSBsYWNrIG9mIG91dC1vZi1vcmRlciBjb3JlcyBhbmQgdGhvdWdodCBw
ZW9wbGUgbWF5IGJlIGludGVyZXN0ZWQgaW4gdGhlIG9uZSBJIGFtIHdvcmtpbmcgb24uIEl0IGlz
IG5vdCByZWFsbHkgcmVhZHkgZm9yIHByaW1lLXRpbWUgeWV0LiBJdCBpcyBsb2NhdGVkIGluIEdp
dGh1YiBhdCBodHRwczovL2dpdGh1Yi5jb20vcm9iZmluY2gvVGhvci90cmVlL21haW4vVGhvcjIw
MjIKPgo+IEl0IGlzIGFub3RoZXIgY29yZSB1c2luZyBhIHZlcnNpb24gb2YgVG9tYXN1bG/igJlz
IEFsZ29yaXRobS4KClRoZXJlIGlzIGEgIFRvbWFzdWxvJ3MgYWxnb3JpdGhtIGltcGxlbWVudGF0
aW9uIG9mIG9wZW5yaXNjIGhlcmU6Cmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVucmlzYy9vcjFrX21h
cm9jY2hpbm8KCkRvZXMgeW91ciBmZXRjaCBzdGFnZSBmZXRjaCBtdWx0aXBsZSBpbnN0cnVjdGlv
bnMgaW4gcGFyYWxsZWw/ICBUaGUKbWFyb2NjaGlubyBjdXJyZW50bHkgb25seSBmZXRjaGVzIG9u
ZSBpbnN0cnVjdGlvbiBhdCBhIHRpbWUuICBJdCB0aGVuCmV4ZWN1dGVzIGluIHBhcmFsbGVsLgoK
V2UgaGF2ZSBmb3VuZCBhIG5lYXQgdG9vbCBmb3IgbWVhc3VyaW5nIHBhcmFsbGVsaXphdGlvbjoK
ICBodHRwczovL2dpdGh1Yi5jb20vc2hpb3lhZGFuL0tvbmF0YQoKPiBJIHdhcyBnbGFkIHRvIHNl
ZSB0aGUgT3BlblJJU0MgZGVzaWduIG1ha2UgYnJhbmNoIGRlbGF5IHNsb3RzIG9wdGlvbmFsLiBJ
cyB0aGVyZSBhIHdheSB0byBzZXQgYSB0cnVlLyBmYWxzZSB2YWx1ZSBpbiBhIHJlZ2lzdGVyIHVz
aW5nIGEgc2V0IGluc3RydWN0aW9uPyBPcGVuUklTQyBsb29rcyBsaWtlIGFuIGV4Y2VsbGVudCBk
ZXNpZ24uIEkgYW0gaW50ZXJlc3RlZCBpbiA2NC8xMjggYml0IHRob3VnaC4gMTI4LWJpdCBkZWNp
bWFsIGZsb2F0aW5nLXBvaW50LgoKSGF2aW5nIGRlbGF5IHNsb3RzIG9uIGFuZCBvZmYgaW4gdGhl
IENQVSBjb3JlIGlzIGhhcmQgY29kZWQgYW5kIGNhbm5vdApiZSBjaGFuZ2VkIGR1cmluZyBydW50
aW1lLiAgIFRoZSBPcGVuUklTQyBjb3JlcyBhcmUgYWxsIDMyLWJpdCBub3csCnRoZSBNYXJvY2No
aW5vIGltcGxlbWVudHMgNjQtYml0IGZsb2F0aW5nIHBvaW50LgoKLVN0YWZmb3JkCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcg
bGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29y
ZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
