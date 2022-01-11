Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A0CE248B23C
	for <lists+openrisc@lfdr.de>; Tue, 11 Jan 2022 17:31:19 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 548982478B;
	Tue, 11 Jan 2022 17:31:19 +0100 (CET)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com
 [209.85.221.171])
 by mail.librecores.org (Postfix) with ESMTPS id 6B397240C7
 for <openrisc@lists.librecores.org>; Tue, 11 Jan 2022 17:31:18 +0100 (CET)
Received: by mail-vk1-f171.google.com with SMTP id e123so1763551vkb.8
 for <openrisc@lists.librecores.org>; Tue, 11 Jan 2022 08:31:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hBzsLucjMFLkRGvL8/pcBHCnf2yMJj7gUBN+DOgV7i4=;
 b=yUxy5o++ajZ0Dp8f9+RuOtfvRSxUcwcMbbzxOPyVOiP+MA6ediYyB+KpumDYzt94lt
 W7aVfxU4wEAKcKUdOq2ab1aVOcBC/PG9N4b50CmL4AOl6HkjiLdwjnCKKP+eyEmwkE8f
 wvIruyjKwqzyEmBeYdKpqgRu82788nf7XLpkQKkezxqpfFTXKh6gpOa2fEAJGmNQoGA2
 swPcRTdBNy+JFO/6qF2M/IWBxugx9U98NiAZJod8J0h6cp9FXXzNKbyw4PjPEFekzytK
 z0bOhmi3FuHrOeAx96mkspu0ZB4qCOvXC7iNm6M+YQGpV+zg/f6U69ItKQim97gby5Jw
 h3mg==
X-Gm-Message-State: AOAM531A1mpmWWqq1eyUD9FCxKv6t6UDjJnGh5Uu/6a7mEUXP12TflO0
 EvBFVShYlYW2/Pgp3JmYrUgfRec3aYS+dQ==
X-Google-Smtp-Source: ABdhPJx6JlBbVRHhMPkkc0gr0y85LGnVEzwPpxTLZjzGYMbX7tToPhttMhU42CT50TS8v+dULpc/xw==
X-Received: by 2002:a1f:2a47:: with SMTP id q68mr2718640vkq.9.1641918677216;
 Tue, 11 Jan 2022 08:31:17 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com.
 [209.85.222.52])
 by smtp.gmail.com with ESMTPSA id s32sm6048670uas.3.2022.01.11.08.31.16
 for <openrisc@lists.librecores.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jan 2022 08:31:16 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id m90so15579876uam.2
 for <openrisc@lists.librecores.org>; Tue, 11 Jan 2022 08:31:16 -0800 (PST)
X-Received: by 2002:a9f:3e01:: with SMTP id o1mr2359918uai.89.1641918676624;
 Tue, 11 Jan 2022 08:31:16 -0800 (PST)
MIME-Version: 1.0
References: <20220111030055.2043568-1-shorne@gmail.com>
In-Reply-To: <20220111030055.2043568-1-shorne@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Jan 2022 17:31:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUUShmJfRWUCS+CQ_OUW9cUHuZQS3aTPznt-i+TT0Tgtw@mail.gmail.com>
Message-ID: <CAMuHMdUUShmJfRWUCS+CQ_OUW9cUHuZQS3aTPznt-i+TT0Tgtw@mail.gmail.com>
To: Stafford Horne <shorne@gmail.com>
Subject: Re: [OpenRISC] [PATCH] openrisc: init: Add support for common clk
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
Cc: Jonas Bonn <jonas@southpole.se>, Randy Dunlap <rdunlap@infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, Gabriel Somlo <gsomlo@gmail.com>,
 Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgU3RhZmZvcmQsCgpPbiBUdWUsIEphbiAxMSwgMjAyMiBhdCA0OjAxIEFNIFN0YWZmb3JkIEhv
cm5lIDxzaG9ybmVAZ21haWwuY29tPiB3cm90ZToKPiBXaGVuIHRlc3RpbmcgdGhlIG5ldyBsaXRl
eF9tbWMgZHJpdmVyIGl0IHdhcyBmb3VuZCB0byBub3Qgd29yayBvbgo+IE9wZW5SSVNDIGR1ZSB0
byBtaXNzaW5nIHN1cHBvcnQgZm9yIGNvbW1vbiBjbGsuICBUaGlzIHBhdGNoIGRvZXMgdGhlCj4g
YmFzaWMgaW5pdGlhbGl6YXRpb24gdG8gYWxsb3cgT3BlblJJU0MgdG8gdXNlIHRoZSBjb21tb24g
Y2xrIGZyYW1ld29yay4KPgo+IFNpZ25lZC1vZmYtYnk6IFN0YWZmb3JkIEhvcm5lIDxzaG9ybmVA
Z21haWwuY29tPgoKVGhhbmtzIGZvciB5b3VyIHBhdGNoIQoKVGhpcyBtYXRjaGVzIHdoYXQgb3Ro
ZXIgYXJjaGl0ZWN0dXJlcyBhcmUgZG9pbmcsIGFuZCBpcyBJTUhPIHRoZSB3YXkKZm9yd2FyZCBm
b3Igc2hhcmluZyBGUEdBIGRyaXZlcnMgYW1vbmcgYXJjaGl0ZWN0dXJlcy4KUmV2aWV3ZWQtYnk6
IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+CgpHcntvZXRqZSxlZXRp
bmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLQpHZWVydCBVeXR0ZXJob2V2
ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02
OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwg
SSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlz
dHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QK
T3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9y
Zy9saXN0aW5mby9vcGVucmlzYwo=
