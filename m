Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 4AF16130A0E
	for <lists+openrisc@lfdr.de>; Sun,  5 Jan 2020 22:53:40 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A8A3120861;
	Sun,  5 Jan 2020 22:53:38 +0100 (CET)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by mail.librecores.org (Postfix) with ESMTPS id E8589209A2
 for <openrisc@lists.librecores.org>; Fri,  3 Jan 2020 13:47:53 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,390,1571695200"; d="scan'208";a="429787611"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jan 2020 13:47:49 +0100
Date: Fri, 3 Jan 2020 13:47:49 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: julia@hadrien
To: Dan Carpenter <dan.carpenter@oracle.com>
In-Reply-To: <20200103123059.GI3911@kadam>
Message-ID: <alpine.DEB.2.21.2001031344480.2982@hadrien>
References: <1577634178-22530-1-git-send-email-Julia.Lawall@inria.fr>
 <20200103123059.GI3911@kadam>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 05 Jan 2020 22:53:35 +0100
Subject: Re: [OpenRISC] [PATCH 0/4] use mmgrab
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
Cc: kvm@vger.kernel.org, Cornelia Huck <cohuck@redhat.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 openrisc@lists.librecores.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

CgpPbiBGcmksIDMgSmFuIDIwMjAsIERhbiBDYXJwZW50ZXIgd3JvdGU6Cgo+IE9uIFN1biwgRGVj
IDI5LCAyMDE5IGF0IDA0OjQyOjU0UE0gKzAxMDAsIEp1bGlhIExhd2FsbCB3cm90ZToKPiA+IE1t
Z3JhYiB3YXMgaW50cm9kdWNlZCBpbiBjb21taXQgZjFmMTAwNzY0NGZmICgibW06IGFkZCBuZXcg
bW1ncmFiKCkKPiA+IGhlbHBlciIpIGFuZCBtb3N0IG9mIHRoZSBrZXJuZWwgd2FzIHVwZGF0ZWQg
dG8gdXNlIGl0LiBVcGRhdGUgYSBmZXcKPiA+IHJlbWFpbmluZyBmaWxlcy4KPgo+IEkgd29uZGVy
IGlmIHRoZXJlIGlzIGFuIGF1dG9tYXRpYyB3YXkgdG8gZ2VuZXJhdGUgdGhlc2Uga2luZCBvZgo+
IENvY2NpbmVsbGUgc2NyaXB0cyB3aGljaCB1c2UgaW5saW5lcyBpbnN0ZWFkIG9mIG9wZW4gY29k
aW5nLiAgTGlrZSBtYXliZQo+IG1ha2UgYSBsaXN0IG9mIG9uZSBsaW5lIGZ1bmN0aW9ucywgYW5k
IHRoZW4gYXV0byBnZW5lcmF0ZSBhIHJlY2lwZS4gIE9yCj4gdGhlIG1tZ3JhYigpIGZ1bmN0aW9u
IGNvdWxkIGhhdmUgbXVsdGlwbGUgbGluZXMgaWYgdGhlIGZpcnN0IGZldyB3ZXJlCj4ganVzdCBz
YW5pdHkgY2hlY2tzIGZvciBOVUxMIG9yIHNvbWV0aGluZy4uLgoKSSB0cmllZCB0aGlzIGF0IG9u
ZSBwb2ludCAoMTAgeWVhcnMgYWdvISk6CgpodHRwczovL3BhZ2VzLmxpcDYuZnIvSnVsaWEuTGF3
YWxsL2FjcDRpczA5LWxhd2FsbC5wZGYKClBlcmhhcHMgaXQgaXMgd29ydGggcmV2aXZpbmcuCgpq
dWxpYQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVu
UklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9s
aXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
