Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id CEEB734F41C
	for <lists+openrisc@lfdr.de>; Wed, 31 Mar 2021 00:17:50 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 24B1220E79;
	Wed, 31 Mar 2021 00:17:49 +0200 (CEST)
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [81.169.146.168])
 by mail.librecores.org (Postfix) with ESMTPS id EDAF8211CC
 for <openrisc@lists.librecores.org>; Tue, 30 Mar 2021 20:07:42 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; t=1617127652; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=Eyq7UqYoQqaEh0TMUnq5UzdsBNGHStBafdmSxV9W2kisa22bG7lmyAywbGT1XJNba7
 eioohjWH90m+ApCCaLfIJxxrR0fQOvTVZ+fpgqmhqIMk/mcG5vvv755Km5wHzjfz85eD
 AIodf4KHXJpzky4K9Aqs3tShThestACt/nWf04t592qQQCRQl6j3BZfA4sQbOP2xon7H
 CO2OSrUFpfKhmJRWkNPpKptwmAM6sMygUV0eEVrdYDzhUtLa+wHtAn+mOZEsc3EVuVuK
 I1WEqmTMsSz6bLFh8xF0oI/lJJm26GPzvsu8uvlw+eAR9YXciV1S+X5IXCmUg1qJUIug
 fnig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1617127652;
 s=strato-dkim-0002; d=strato.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=TBtxdLUkTjgMvDEB4mRh0JBbXrVFmzYUj0lLVMFFsdA=;
 b=iDxuBxBtN4zGXwH2FsNDucbzs44++UuByW9OubNfPa+SgIUVYehN+9wajhoPfWf8ne
 AJBeDpLzfO9gvPi1AhT0jxBhUc3mkrU3McdEHDV+b0zDo5wFvykL3ipqabsAzZU6O7uz
 is7TqCigWd9ZbgrEsfGbT107MDunzyDPutsq+PzsCSPNZocW9LxvOzLbkyCPLhoBlc7/
 oipum/qvWNjCcVAwprWos80uz+EPG1wDUnbl2HlPeD0LPZubEv85OlwKgkt04b/wC3ze
 Q/YiSR5IF99tHUC2aAp+hTj0JNzGcOYR8WbAB/c0XCz3bibgnOfYzQ2C5UX/ZGASRCMW
 /9Eg==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1617127652;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=TBtxdLUkTjgMvDEB4mRh0JBbXrVFmzYUj0lLVMFFsdA=;
 b=mbDZevjFp2b5R5VUle8FDC8MwkfYJzBYGCwkaBTe2ybLg6GWxZEJsH5woKenUz96DZ
 HLCOwfabBd5h1GPxw3d1/qdKw063SU3JfrMvJjSZc4etXqVgZ2OuBchcRp0XGZjLqw0Q
 XI9sVLA8HjveKwrt594YK3I6FiUVUxeNeTlYhNwAe6WYcF1jzcOR6pVtqoJP9uP/xZ/D
 Syv6uzaw6Ma5RlMrYSJzO01MZ2ln4j1+WzqLWaT+SnK0MZvUpV72FVIyBP3MJRqqvVES
 dGUeryXh/+ZW1PiQ4IEXCAuRPM4Xx3PnN8Xk5C5+DltqN18M43BTURpT9dF2flHnmD8l
 liYA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmAjw47t884="
X-RZG-CLASS-ID: mo00
Received: from [192.168.178.35] by smtp.strato.de (RZmta 47.23.1 DYNA|AUTH)
 with ESMTPSA id h03350x2UI7VJS3
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Tue, 30 Mar 2021 20:07:31 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20210330172714.GR109100@zorba>
Date: Tue, 30 Mar 2021 20:07:30 +0200
Message-Id: <D8C1FBF6-E5C0-4233-BCB8-694274EA28F9@goldelico.com>
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
 <878228ad88df38f8914c7aa25dede3ed05c50f48.1616765869.git.christophe.leroy@csgroup.eu>
 <20210330172714.GR109100@zorba>
To: Daniel Walker <danielwa@cisco.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Wed, 31 Mar 2021 00:17:44 +0200
Subject: Re: [OpenRISC] [PATCH v3 01/17] cmdline: Add generic function to
 build command line.
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
Cc: linux-arch@vger.kernel.org, Rob Herring <robh@kernel.org>,
 microblaze <monstr@monstr.eu>, daniel@gimpelevich.san-francisco.ca.us,
 devicetree <devicetree@vger.kernel.org>, linux-sh@vger.kernel.org,
 will@kernel.org, linux-xtensa@linux-xtensa.org, x86@kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 nios2 <ley.foon.tan@intel.com>, linux-mips <linux-mips@vger.kernel.org>,
 openrisc@lists.librecores.org, linux-hexagon@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Cj4gQW0gMzAuMDMuMjAyMSB1bSAxOToyNyBzY2hyaWViIERhbmllbCBXYWxrZXIgPGRhbmllbHdh
QGNpc2NvLmNvbT46Cj4gCj4gT24gRnJpLCBNYXIgMjYsIDIwMjEgYXQgMDE6NDQ6NDhQTSArMDAw
MCwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToKPj4gVGhpcyBjb2RlIHByb3ZpZGVzIGFyY2hpdGVj
dHVyZXMgd2l0aCBhIHdheSB0byBidWlsZCBjb21tYW5kIGxpbmUKPj4gYmFzZWQgb24gd2hhdCBp
cyBidWlsdCBpbiB0aGUga2VybmVsIGFuZCB3aGF0IGlzIGhhbmRlZCBvdmVyIGJ5IHRoZQo+PiBi
b290bG9hZGVyLCBiYXNlZCBvbiBzZWxlY3RlZCBjb21waWxlLXRpbWUgb3B0aW9ucy4KPj4gCj4+
IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91
cC5ldT4KPj4gLS0tCj4+IHYzOgo+PiAtIEFkZHJlc3NlZCBjb21tZW50cyBmcm9tIFdpbGwKPj4g
LSBBZGRlZCBjYXBhYmlsaXR5IHRvIGhhdmUgc3JjID09IGRzdAo+PiAtLS0KPj4gaW5jbHVkZS9s
aW51eC9jbWRsaW5lLmggfCA1NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwo+PiAxIGZpbGUgY2hhbmdlZCwgNTcgaW5zZXJ0aW9ucygrKQo+PiBjcmVhdGUgbW9kZSAx
MDA2NDQgaW5jbHVkZS9saW51eC9jbWRsaW5lLmgKPj4gCj4+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L2xpbnV4L2NtZGxpbmUuaCBiL2luY2x1ZGUvbGludXgvY21kbGluZS5oCj4+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uZGVhODdlZGQ0MWJlCj4+IC0tLSAvZGV2
L251bGwKPj4gKysrIGIvaW5jbHVkZS9saW51eC9jbWRsaW5lLmgKPj4gQEAgLTAsMCArMSw1NyBA
QAo+PiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KPj4gKyNpZm5kZWYg
X0xJTlVYX0NNRExJTkVfSAo+PiArI2RlZmluZSBfTElOVVhfQ01ETElORV9ICj4+ICsKPj4gKyNp
bmNsdWRlIDxsaW51eC9zdHJpbmcuaD4KPj4gKwo+PiArLyogQWxsb3cgYXJjaGl0ZWN0dXJlcyB0
byBvdmVycmlkZSBzdHJsY2F0LCBwb3dlcnBjIGNhbid0IHVzZSBzdHJpbmdzIHNvIGVhcmx5ICov
Cj4+ICsjaWZuZGVmIGNtZGxpbmVfc3RybGNhdAo+PiArI2RlZmluZSBjbWRsaW5lX3N0cmxjYXQg
c3RybGNhdAo+PiArI2VuZGlmCj4+ICsKPj4gKy8qCj4+ICsgKiBUaGlzIGZ1bmN0aW9uIHdpbGwg
YXBwZW5kIG9yIHByZXBlbmQgYSBidWlsdGluIGNvbW1hbmQgbGluZSB0byB0aGUgY29tbWFuZAo+
PiArICogbGluZSBwcm92aWRlZCBieSB0aGUgYm9vdGxvYWRlci4gS2NvbmZpZyBvcHRpb25zIGNh
biBiZSB1c2VkIHRvIGFsdGVyCj4+ICsgKiB0aGUgYmVoYXZpb3Igb2YgdGhpcyBidWlsdGluIGNv
bW1hbmQgbGluZS4KPj4gKyAqIEBkc3Q6IFRoZSBkZXN0aW5hdGlvbiBvZiB0aGUgZmluYWwgYXBw
ZW5kZWQvcHJlcGVuZGVkIHN0cmluZy4KPj4gKyAqIEBzcmM6IFRoZSBzdGFydGluZyBzdHJpbmcg
b3IgTlVMTCBpZiB0aGVyZSBpc24ndCBvbmUuCj4+ICsgKiBAbGVuOiB0aGUgbGVuZ3RoIG9mIGRl
c3QgYnVmZmVyLgo+PiArICovCj4gCj4gQXBwZW5kIG9yIHByZXBlbmQgPyBDaXNjbyByZXF1aXJl
cyBib3RoIGF0IHRoZSBzYW1lIHRpbWUuIFRoaXMgaXMgd2h5IG15Cj4gaW1wbGVtZW50YXRpb24g
cHJvdmlkZXMgYm90aC4gSSBjYW4ndCB1c2UgdGhpcyB3aXRoIGJvdGggYXQgb25jZS4KCkp1c3Qg
YW4gaWRlYTogd2hhdCBhYm91dCBkZWZpbmluZyBDTURMSU5FIGFzIGEgcGF0dGVybiB3aGVyZSBl
LmcuICIkJCIgb3IgIiUlIgppcyByZXBsYWNlZCBieSB0aGUgYm9vdCBsb2FkZXIgY29tbWFuZCBs
aW5lPwoKVGhlbiB5b3UgY2FuIGZvcm11bGF0ZSByZXBsYWNlLCBwcmVwZW5kLCBhcHBlbmQsIHBy
ZXBlbmQrYXBwZW5kIHdpdGggYSBzaW5nbGUKQ09ORklHIHNldHRpbmcuCgpJdCBtYXkgYmUgYSBs
aXR0bGUgbW9yZSBjb21wbGV4IGluIGNvZGUgKHNjYW5uaW5nIGZvciB0aGUgcGF0dGVybiBhbmQg
cmVwbGFjaW5nCml0IGFuZCB0YWtlIGNhcmUgdG8gdGVtcG9yYXJ5IG1lbW9yeSkgYnV0IElNSE8g
aXQgY291bGQgYmUgd29ydGggdG8gY29uc2lkZXIuCgpCUiwKTmlrb2xhdXMgU2NoYWxsZXIKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1h
aWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxp
YnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
