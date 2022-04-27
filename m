Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2150551246C
	for <lists+openrisc@lfdr.de>; Wed, 27 Apr 2022 23:18:30 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id CA4B22431D;
	Wed, 27 Apr 2022 23:18:29 +0200 (CEST)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by mail.librecores.org (Postfix) with ESMTPS id D3744248D4
 for <openrisc@lists.librecores.org>; Wed, 27 Apr 2022 20:47:45 +0200 (CEST)
Received: by mail-yb1-f180.google.com with SMTP id s30so5022861ybi.8
 for <openrisc@lists.librecores.org>; Wed, 27 Apr 2022 11:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zAhfQLXPrcc3iEs8Mayj7mdKWRElREYqruuog9Gb3CQ=;
 b=HVQjBvaZin9noWg2xfTTe+1nB2YKyCdckDVePAwYC7twUoc3Vnoa/24iZsiq5eSmTY
 6UslKMxKmpVfDuFJMm/u9HxVM+VTLQKtQ8CXd8sOHRJeByKtzkcG4Obnxdt+C5sagL34
 qgncVbSMydPzXNsHTmzkUS+PgSp5nbV8CrahJ0+RPidFY3GdTqbvtfMQIXsifFMIqZyI
 E8xnLUk4+GE9LQbpv2JOGPzs19O4QYyjD+22aAwMijhwuIELNitVfZquRb9HvPVtD/vB
 yh3S5IVJSMchTQ9Mvbkm8hUauQscW0qqRrZzt5WQVHaDkLvbP0IjdoBv60sZHUfTF4YD
 yGxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zAhfQLXPrcc3iEs8Mayj7mdKWRElREYqruuog9Gb3CQ=;
 b=F7HRvetVysr98thM1iZPUfiA6sd1qqATzReb9Sebvz5kGois7MBJxvsYLeE5HoCI0a
 AmZxBelMLTNHWQINxTTN3liE9o7qAwNpxOFR6c/DUY6aYVx6ANkrLJ9g/53Ecq8LlaSd
 +jLZP3gQW/IquqJLds4d2xJQEaNKPpb64GdMIjIS9LhfFInFzESbpHtErQPxhdZwH2L2
 yyUwCs2hzGuQHaE8Y2rqurj3NdlOzJTjTUCg93kRyEpTLz8gGpHdWZhSMzfkQvqXEYyr
 vB4RUdh0gtzGf6jgVrcdVGjbTvE8I7ShoqZS2UUEibAw7zJwEbpId+nOOx2viSDEb9qB
 5Mlw==
X-Gm-Message-State: AOAM533KOPzvBRXKfWVSS7VcpaZcFfY8eKGivAqw1JnRs4tWjMefFUEw
 70tCtCqvt1G5jfkPq4i11kZfpeHgcCC9A2+P4J+WBQ==
X-Google-Smtp-Source: ABdhPJx3obP3CzOBsnNy8H/9Zwl6QoCZA+lm6iMKeUyI80XYLjWuOOWoHTlWJkK1wrUZ0Nxz99m/1pfX2Jt3VqIFDF8=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr27091835ybq.67.1651085264763; Wed, 27
 Apr 2022 11:47:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1492384862.git.shorne@gmail.com>
 <fb69c137317a365dcb549dfef1ecd2fbff48e92c.1492384862.git.shorne@gmail.com>
 <YmmA4li384azQ2i9@zx2c4.com>
In-Reply-To: <YmmA4li384azQ2i9@zx2c4.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 27 Apr 2022 19:47:33 +0100
Message-ID: <CAFEAcA9FZZzzZJaCHrepni+5oUELxW1TtZ3gZHxSUdfKdx+ghQ@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailman-Approved-At: Wed, 27 Apr 2022 23:18:28 +0200
Subject: Re: [OpenRISC] [Qemu-devel] [PATCH 2/7] target/openrisc: add
 shutdown logic
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
Cc: openrisc@lists.librecores.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCAyNyBBcHIgMjAyMiBhdCAxODo0NiwgSmFzb24gQS4gRG9uZW5mZWxkIDxKYXNvbkB6
eDJjNC5jb20+IHdyb3RlOgo+Cj4gSGV5IFN0YWZmb3JkLAo+Cj4gT24gTW9uLCBBcHIgMTcsIDIw
MTcgYXQgMDg6MjM6NTFBTSArMDkwMCwgU3RhZmZvcmQgSG9ybmUgd3JvdGU6Cj4gPiBJbiBvcGVu
cmlzYyBzaW11bGF0b3JzIHdlIHVzZSBob29rcyBsaWtlICdsLm5vcCAxJyB0byBjYXVzZSB0aGUK
PiA+IHNpbXVsYXRvciB0byBleGl0LiAgSW1wbGVtZW50IHRoYXQgZm9yIHFlbXUgdG9vLgo+ID4K
PiA+IFJlcG9ydGVkLWJ5OiBXYWxkZW1hciBCcm9ka29yYiA8d2J4QG9wZW5hZGsub3JnPgo+ID4g
U2lnbmVkLW9mZi1ieTogU3RhZmZvcmQgSG9ybmUgPHNob3JuZUBnbWFpbC5jb20+Cj4KPiBJJ20g
Y3VyaW91cyBhcyB0byB3aHkgdGhpcyBuZXZlciBnb3QgbWVyZ2VkLiBJIG5vdGljZWQgSSdtIGVu
dGlyZWx5IGFibGUKPiB0byBzaHV0ZG93biBvciB0byByZWJvb3QgKHdoaWNoIGlzIG1vc3RseSB3
aGF0IEkgY2FyZSBhYm91dCkgTGludXggZnJvbQo+IE9wZW5SSVNDLiBJdCBqdXN0IGhhbmdzLgoK
VGhpcyBraW5kIG9mIHRoaW5nIG5lZWRzIHRvIGJlIGVpdGhlcjoKICgxKSB3ZSdyZSBtb2RlbGxp
bmcgcmVhbCBoYXJkd2FyZSBhbmQgdGhhdCByZWFsIGhhcmR3YXJlIGhhcyBhCmRldmljZSBvciBv
dGhlciBtZWNoYW5pc20gZ3Vlc3QgY29kZSBjYW4gcHJvZCB0byBjYXVzZSBhIHBvd2VyLW9mZgpv
ciByZWJvb3QuIFRoZW4gd2UgbW9kZWwgdGhhdCBkZXZpY2UsIGFuZCBndWVzdCBjb2RlIHRyaWdn
ZXJzIGEKc2h1dGRvd24gb3IgcmVib290IGV4YWN0bHkgYXMgaXQgd291bGQgb24gdGhlIHJlYWwg
aGFyZHdhcmUuCiAoMikgdGhlcmUgaXMgYW4gYXJjaGl0ZWN0dXJhbGx5IGRlZmluZWQgQUJJIGZv
ciBzaW11bGF0b3JzLCBkZWJ1ZwpzdHVicywgZXRjLCB0aGF0IGluY2x1ZGVzIHZhcmlvdXMgb3Bl
cmF0aW9ucyB0eXBpY2FsbHkgaW5jbHVkaW5nCmFuICJleGl0IHRoZSBzaW11bGF0b3IiIGZ1bmN0
aW9uLiAoQXJtIHNlbWlob3N0aW5nIGlzIGFuIGV4YW1wbGUKb2YgdGhpcy4pIEluIHRoYXQgY2Fz
ZSB3ZSBjYW4gaW1wbGVtZW50IHRoYXQgZnVuY3Rpb25hbGl0eSwKZ3VhcmRlZCBieSBhbmQgY29u
dHJvbGxlZCBieSB0aGUgYXBwcm9wcmlhdGUgY29tbWFuZCBsaW5lIG9wdGlvbnMuCihUaGlzIGlz
IGdlbmVyYWxseSBub3QgYXMgbmljZSBhcyBvcHRpb24gMSwgYmVjYXVzZSB0aGUgZ3Vlc3QgY29k
ZQpoYXMgdG8gYmUgY29tcGlsZWQgdG8gaGF2ZSBzdXBwb3J0IGZvciBzZW1paG9zdGluZyBhbmQg
YWxzbyBiZWNhdXNlCnR1cm5pbmcgaXQgb24gaXMgdXN1YWxseSBhbHNvIGdpdmluZyBpbXBsaWNp
dCBwZXJtaXNzaW9uIGZvciB0aGUKZ3Vlc3QgY29kZSB0byByZWFkIGFuZCB3cml0ZSBhcmJpdHJh
cnkgaG9zdCBmaWxlcywgZXRjLikKCkVpdGhlciB3YXksIHVuZG9jdW1lbnRlZCByYW5kb20gaGFj
a3MgYXJlbid0IGEgZ29vZCBpZGVhLCB3aGljaAppcyB3aHkgdGhpcyB3YXNuJ3QgbWVyZ2VkLgoK
dGhhbmtzCi0tIFBNTQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcK
aHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
