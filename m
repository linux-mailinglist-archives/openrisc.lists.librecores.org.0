Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2D24C3FE484
	for <lists+openrisc@lfdr.de>; Wed,  1 Sep 2021 23:06:17 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C9B9F24039;
	Wed,  1 Sep 2021 23:06:16 +0200 (CEST)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mail.librecores.org (Postfix) with ESMTPS id 90265235CA
 for <openrisc@lists.librecores.org>; Wed,  1 Sep 2021 23:06:15 +0200 (CEST)
Received: by mail-ed1-f54.google.com with SMTP id i6so910157edu.1
 for <openrisc@lists.librecores.org>; Wed, 01 Sep 2021 14:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=tGcECeKElFtjQ47zSEZThH6NK9oDBs1uCLQHIdnRmPY=;
 b=Lv/M5OSh0Bnrx9t62EBepx+UTBwixiDY0o6TIcY8o1eMVDi2rS9R01lPXbIbtQxUT6
 vMB9mvpKPd1lzLwDuSm8KiNv7prT8RKKHxRzAXdQ17ZsvNph2JPu3069CNPlL7Kx/ZUO
 ueVGhVaT+oEOrqSJMCdrM4INA7UUT7JGckcZ432gp5seYhDlRURpXAZyXfOUSg9O64je
 89dDOqaHd9mvISuj8x5RE8R529WuLZpnp6y4relvJd9TlH3GC0LMXZBmrvglFx7y3fh4
 f5uwDcP8FdITXm/1UHrIGytim85LpM2RqJrRgK8JA++NOzAO39uHyO76v/Z9T8MxFG0M
 pDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=tGcECeKElFtjQ47zSEZThH6NK9oDBs1uCLQHIdnRmPY=;
 b=AYO6VFO/SNiXWAt63HqlbvRLAR/X7j9N2RibW8KsjdRPnE+BhNLACKS/nw+mk+TB5D
 /+5rB5/2NFdf77gafINQQ/HVoIZRt7UG/ViEHQBW2UaFSstzC61PbQxBqcmK4NpsbD7A
 0vzGtumujlcI+J3Bad9oz4jKhnBZYNvd/Vb3TNE9CQ7PasuI/b6h++CquJqga/0dikGA
 p2cm+dnm6uXwM3SSl/EoiRFXAY1+plJxJgUEQIVUfrc0fSwGcSAojbFMQeihIebceXiX
 mEzrQ5yGkjsQUs8J4pPqs77hcICVsItbqnsTK6r6tWfAJkzK3d9ur3+Xatf4PjPvL/FY
 RkGQ==
X-Gm-Message-State: AOAM533/c/jdhOi1IrZtzHuq3JlAGX/bikEAUKypPOSRqO+Ue2ySYa3I
 cFcZEroro8vw2KB9pE3bN947wnBUCdK0yW5etfYsy28RfNE=
X-Google-Smtp-Source: ABdhPJzvMecxzYEjfNkXLAxEDYF0navYNvxCA67jIQvpNWBI8fSa8LHeov10ItV9Vlji4Iw5i5+XlH1+DYZ8koVcq7c=
X-Received: by 2002:aa7:ca04:: with SMTP id y4mr1651334eds.162.1630530375242; 
 Wed, 01 Sep 2021 14:06:15 -0700 (PDT)
MIME-Version: 1.0
References: <CADGJwMwapL_eB_ZqKmaDsoFxCY_3qvKu=0BfdSGQZaC5GEjP1Q@mail.gmail.com>
 <YSgmu/bnzRnI7AGI@antec>
 <CADGJwMzBfYmkXPAuTuPtEmMruuTydmW1h--YQJjWTmHyiDOv6Q@mail.gmail.com>
 <CAAfxs74_+W_dTa-yjx=+jJ3fm9R1hzS1_QVWJTPvn3fEgXaEng@mail.gmail.com>
 <CADGJwMzCa_u2+V3Tu-pp92GgxubwiU0HQo0Dy5G3b0sAO2xzFw@mail.gmail.com>
In-Reply-To: <CADGJwMzCa_u2+V3Tu-pp92GgxubwiU0HQo0Dy5G3b0sAO2xzFw@mail.gmail.com>
From: Stafford Horne <shorne@gmail.com>
Date: Thu, 2 Sep 2021 06:06:03 +0900
Message-ID: <CAAfxs77m594YDv0bbhY98Ye10F0jWyROqrDpCheq5Azk7Gg0aA@mail.gmail.com>
To: Harshitha S <harshithasridhar172000@gmail.com>, 
 Openrisc <openrisc@lists.librecores.org>
Subject: Re: [OpenRISC] Continue OpenRISC contibution
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

V2hpY2ggbW9kZWwgb2Ygc3BhcnRhbiA3IEZQR0EgYm9hcmQgZG8geW91IGhhdmU/ICBMZXRzIGZp
Z3VyZSBvdXQgaWYKaXQgaGFzIHN1cHBvcnQgZm9yIGEgZnVzZXNvYyBzb2MuCgpIZXJlIGlzIGEg
bGlzdCBvZiBzb21lIG9mIHRoZSBib2FyZHMgc3VwcG9ydGVkLgpodHRwczovL2dpdGh1Yi5jb20v
b3BlbnJpc2Mvb3Jwc29jLWNvcmVzL3RyZWUvbWFzdGVyL3N5c3RlbXMKClNvbWUgb2YgdGhlc2Ug
aGF2ZSBiZWVuIG1vdmVkIG91dCB0byBpbmRlcGVuZGVudCBwcm9qZWN0cyBub3c6CiAgLSBodHRw
czovL2dpdGh1Yi5jb20vb2xvZmsvZGUwX25hbm8KICAtIGh0dHBzOi8vZ2l0aHViLmNvbS9zdGZm
cmRocm4vbW9yMWt4LWdlbmVyaWMgIChqdXN0IGZvciBzaW11bGF0aW9uCm5vdCBmcGdhIGJvYXJk
cykKCkl0IGlzIHByZWZlcnJlZCBmb3IgdGhlIHN5c3RlbXMgdG8gYmUgaW4gdGhlaXIgb3duIHJl
cG9zaXRvcmllcyBub3cuCgpJZiB5b3VyIGJvYXJkIGlzIG5vdCBoZXJlIHRoZW4gd2UgY2FuIHNl
YXJjaCBmb3IgZnVzZXNvYyBzdXBwb3J0LCBpZgpub3RoaW5nIGlzIGZvdW5kIHlvdSBjYW4gd29y
ayBvbiBicmluZ2luZyB1cCBmdXNlc29jIG9uIGl0LgoKT24gVGh1LCBTZXAgMiwgMjAyMSBhdCAx
OjE3IEFNIEhhcnNoaXRoYSBTCjxoYXJzaGl0aGFzcmlkaGFyMTcyMDAwQGdtYWlsLmNvbT4gd3Jv
dGU6Cj4KPiBUaGFua3MgZm9yIHRoZSBpbmZvLCBJIHdpbGwgZ28gdGhyb3VnaCB0aGVzZSBsaW5r
cy4KPgo+IFllcywgSSBoYXZlIFNwYXJ0YW4gNyBGUEdBIGJvYXJkLgo+Cj4gT24gV2VkLCAxIFNl
cCwgMjAyMSwgNjo1NiBQTSBTdGFmZm9yZCBIb3JuZSwgPHNob3JuZUBnbWFpbC5jb20+IHdyb3Rl
Ogo+Pgo+PiBJbiB0ZXJtcyBvZiBkZWJ1Z2dpbmcgSSBwdXQgdGhpcyB0b2dldGhlciBhIHdoaWxl
IGJhY2sgZm9yIGhvdyB0bwo+PiBzZXR1cCBhbmQgdXNlIHRoZSBPcGVuT0NEIC8gR0RCIGRlYnVn
IGVudmlyb25tZW50IGZvciBvcGVucmlzYy4KPj4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5yaXNj
L3R1dG9yaWFscy9ibG9iL21hc3Rlci9kb2NzL0RlYnVnZ2luZy5tZAo+Pgo+PiBUaGlzIGFzc3Vt
ZXMgeW91IGhhdmUgYW4gRlBHQSBib2FyZCBsaWtlIHRoZSBkZTAgbmFubyBhbmQgYXJlIGFibGUg
dG8KPj4gcHJvZ3JhbSBvbmUgb2YgdGhlIGZ1c2Vzb2MgbW9yMWt4IHdpdGggYWR2X2RlYnVnX3N5
cyBiaXRzdHJlYW1zIG9udG8KPj4gaXQuICBBbGwgdGhhdCBjYW4gYmUgZG9uZSB2aWEgZnVzZXNv
YyB3aGljaCB3cmFwcyB0aGUgcHJvY2Vzcy4gIFRoZXJlCj4+IGFyZSBkb2N1bWVudHMgYWJvdXQg
ZG9pbmcgdGhhdCBvbiB0aGUgd2ViLCBhbHNvIG9uZSBoZXJlOgo+PiBodHRwczovL2dpdGh1Yi5j
b20vb3BlbnJpc2MvdHV0b3JpYWxzL3RyZWUvbWFzdGVyL2RlMF9uYW5vCj4+Cj4+IERvIHlvdSBo
YXZlIGFuIEZQR0EgYm9hcmQgeW91IGNhbiB1c2U/Cj4+Cj4+IC1TdGFmZm9yZAo+Pgo+PiBPbiBT
dW4sIEF1ZyAyOSwgMjAyMSBhdCAyOjE2IEFNIEhhcnNoaXRoYSBTCj4+IDxoYXJzaGl0aGFzcmlk
aGFyMTcyMDAwQGdtYWlsLmNvbT4gd3JvdGU6Cj4+ID4KPj4gPiBIZWxsbyBTdGFmZm9yZCwKPj4g
Pgo+PiA+IEkgd2FudCB0byBzdGFydCB3aXRoIGEgc2ltcGxlIG9uZS4gSSBoYXZlIHVwZGF0ZWQg
dGhlIE1vcjFreCBGb3JtYWwgaW4gdGhlIHJlYWRtZS4KPj4gPiBMZXQgbWUga25vdyBpZiBhbnl0
aGluZyBlbHNlIHRvIGJlIGluY2x1ZGVkLgo+PiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9IYXJzaGl0
aGExNzIwMDAvbW9yMWt4L2NvbW1pdC9lMTkyYjgzY2UwMWNkNGI0NjdjZTc0ZmU2NWIyZjNhN2Nl
ZDdhMjJkCj4+ID4KPj4gPiBJIHdpbGwgdHJ5IGZpeGluZyB0aGUgYnVncyBhbmQgYWxzbyB3b3Jr
IG9uIG9yMWt4LWZvcm1hbC4gTWVhbndoaWxlLCBJJ20gdGhpbmtpbmcgb2YgZXhwbG9yaW5nIE9w
ZW5PQ0QvR0RCCj4+ID4gZm9yIG1vcjFreCBDUFUgZGVidWdnaW5nIGJ1dCBoYXZpbmcgbm8gaWRl
YSB3aGVyZSB0byBzdGFydC4gQ2FuIHlvdSBndWlkZSBtZSBiZWdpbm5pbmcgd2l0aCBDUFUgZGVi
dWdnaW5nPwo+PiA+Cj4+ID4gLUhhcnNoaXRoYQo+PiA+Cj4+ID4gT24gRnJpLCBBdWcgMjcsIDIw
MjEgYXQgNToxMSBBTSBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4gd3JvdGU6Cj4+
ID4+Cj4+ID4+IE9uIFRodSwgQXVnIDI2LCAyMDIxIGF0IDEwOjE3OjE3UE0gKzA1MzAsIEhhcnNo
aXRoYSBTIHdyb3RlOgo+PiA+PiA+IEhlbGxvLAo+PiA+PiA+Cj4+ID4+ID4gSSdtIHRoaW5raW5n
IG9mIGNvbnRpbnVpbmcgbXkgY29udHJpYnV0aW9uIHRvIHRoZSBPcGVuUklTQyBwcm9qZWN0LiBX
aXRoIG15Cj4+ID4+ID4gR1NvQyBwcm9qZWN0LCBJIGhhdmUgbGVhcm5lZCB0b28gbWFueSBuZXcg
c2tpbGxzIGFuZCB3aXNoIHRvIGtlZXAgdGhpcwo+PiA+PiA+IGxlYXJuaW5nIHBhY2UuIEkgd291
bGQgYmUgaGFwcHkgdG8gbGVhcm4gYW5kIGV4cGxvcmUgbmV3IHNraWxscy4gUGxlYXNlIGxldAo+
PiA+PiA+IG1lIGtub3cgd2hhdCBJIGNhbiB3b3JrIHVwb24uCj4+ID4+Cj4+ID4+IEhpIEhhcnNo
aXRhLAo+PiA+Pgo+PiA+PiAoQ0NpbmcgbGlzdCkKPj4gPj4KPj4gPj4gR2xhZCB0byBoZWFyIHlv
dSBhcmUgc3RpbGwgaW50ZXJlc3RlZC4gIEkgdGhpbmsgdGhlcmUgYXJlIGFsd2F5cyBwbGVudHkg
b2YKPj4gPj4gdGhpbmdzLCBzb21lIHRoaW5ncyBvbiB0aGUgdG9wIG9mIG15IGhlYWQ6Cj4+ID4+
ICAgLSBTaW1wbGUgLSB1cGRhdGUgdGhlIG1vcjFreC9yZWFkbWUubWQgdG8gZXhwbGFpbiB3ZSBz
dXBwb3J0IGZvcm1hbAo+PiA+PiAgIC0gTWVkaXVtIC0gZml4IHRoZSBidWdzIHRoYXQgeW91IHJh
aXNlZAo+PiA+PiAgIC0gQmlnZ2VyIC0gb3Ixay1mb3JtYWwgKGxpa2UgcmlzY3YtZm9ybWFsLCBm
b3JtYWxseSB2ZXJpZnkgZWFjaCBpbnN0cnVjdGlvbikKPj4gPj4KPj4gPj4gLVN0YWZmb3JkCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1h
aWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxp
YnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
