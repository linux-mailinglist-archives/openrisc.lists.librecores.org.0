Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 0D5B8311C65
	for <lists+openrisc@lfdr.de>; Sat,  6 Feb 2021 10:33:40 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A8277202FD;
	Sat,  6 Feb 2021 10:33:39 +0100 (CET)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com
 [209.85.161.54])
 by mail.librecores.org (Postfix) with ESMTPS id 0D88D202FD
 for <openrisc@lists.librecores.org>; Sat,  6 Feb 2021 10:33:37 +0100 (CET)
Received: by mail-oo1-f54.google.com with SMTP id t196so116840oot.2
 for <openrisc@lists.librecores.org>; Sat, 06 Feb 2021 01:33:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XFFDEkopwcHNc74GjE/yhhK68CfD6gYZp1kAhc2ZkFo=;
 b=kVx7EiQESTxkk64irGbFMPDrsUgDFIpfMn94IVHARVJ1bQyiPNMKtBIuXXhpltkV4/
 620tbozKXQxP5v+ZJFSQhOuDJaelIL7QHmmQZdIcAujmiJSWf4brs8k9qkxgdGI9L4jY
 UP/rCeTJD1MqD8xCyMSJhsJcfYOZXQ4/nn2nA5iZ1SRJX0gE7lSpWiXZsl7rLGzbNB8t
 OSSYXc9B/dWLXh/70R6yVcewd6+kQNSYb5cBKf6cfG/Mcdb+BWTfY28V6dU361G9+CZ5
 uINivlDyLsq5fuhdCe1BUqBC0EyqHF3I0ovsQSFCu+90PmUzWh/fWpB1uHKhpWLJljTP
 zbKw==
X-Gm-Message-State: AOAM530hiIM2P+HjNm5m/jjQUoXVvr/dXKfrL1sanGD8tPLoqnbOjWJA
 BnWl7ePNHPsBux485aUxD5CYrCqk4ZuIsy+4KFw=
X-Google-Smtp-Source: ABdhPJyvktGIGV1kS455fRCji4bXochr9MKhRoJB+FzPrg7h++oQvydzh+fr9PnRq+BLts9gL3LxNMmV/MDiVD7Kvqs=
X-Received: by 2002:a4a:945:: with SMTP id 66mr971140ooa.1.1612604015882; Sat,
 06 Feb 2021 01:33:35 -0800 (PST)
MIME-Version: 1.0
References: <0b26eda7-229d-3dc9-f2ae-19b9212fb0ea@rwth-aachen.de>
 <20210129221643.GZ2002709@lianli.shorne-pla.net>
 <2a018afc-d797-3a91-ffab-e55ae3b0a795@rwth-aachen.de>
 <20210130230310.GC2002709@lianli.shorne-pla.net>
 <d9f4aafc-4d65-38b0-dde0-5e155836aee1@rwth-aachen.de>
 <20210131212752.GG2002709@lianli.shorne-pla.net>
 <6dbc27f8-5261-59c5-acba-70f6c6a74ba1@rwth-aachen.de>
 <20210205144317.GK2002709@lianli.shorne-pla.net>
 <CAMuHMdXzr4c4=Cg1_Lmw41cmxmMrG4P=dV0yVjuXvuR5pqyh0Q@mail.gmail.com>
 <20210205223651.GL2002709@lianli.shorne-pla.net>
In-Reply-To: <20210205223651.GL2002709@lianli.shorne-pla.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 6 Feb 2021 10:33:24 +0100
Message-ID: <CAMuHMdV5M2X+zC9e2VidEt6vNdnP1j3yeB4tJTRgkCCDCwV8hQ@mail.gmail.com>
To: Stafford Horne <shorne@gmail.com>
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
Cc: Jonas Bonn <jonas@southpole.se>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Openrisc <openrisc@lists.librecores.org>,
 Jan Henrik Weinstock <jan.weinstock@rwth-aachen.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgU3RhZmZvcmQsCgpPbiBGcmksIEZlYiA1LCAyMDIxIGF0IDExOjM2IFBNIFN0YWZmb3JkIEhv
cm5lIDxzaG9ybmVAZ21haWwuY29tPiB3cm90ZToKPiBPbiBGcmksIEZlYiAwNSwgMjAyMSBhdCAw
NTowNzo1MVBNICswMTAwLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4gPiBPbiBGcmksIEZl
YiA1LCAyMDIxIGF0IDM6NDMgUE0gU3RhZmZvcmQgSG9ybmUgPHNob3JuZUBnbWFpbC5jb20+IHdy
b3RlOgo+ID4gPiBPbiBNb24sIEZlYiAwMSwgMjAyMSBhdCAxMjo0OTozMVBNICswMTAwLCBKYW4g
SGVucmlrIFdlaW5zdG9jayB3cm90ZToKPiA+ID4gPiBVc2UgdGhlIGRldmljZSB0cmVlIHRvIGRl
dGVybWluZSB0aGUgcHJlc2VudCBjcHVzIGluc3RlYWQgb2YgYXNzdW1pbmcgYWxsCj4gPiA+ID4g
Q09ORklHX05SQ1BVUyBhcmUgYWN0dWFsbHkgcHJlc2VudCBpbiB0aGUgc3lzdGVtLgo+ID4gPiA+
Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSmFuIEhlbnJpayBXZWluc3RvY2sgPGphbi53ZWluc3Rv
Y2tAcnd0aC1hYWNoZW4uZGU+Cj4gPiA+Cj4gPiA+IEkgY2Fubm90IGFwcGx5IHRoaXMgcGF0Y2gs
IGl0IHNlZW1zIHlvdSBzb21laG93IHNlbnQgaXQgc2lnbmVkIGFzIGEgbXVsdGlwYXJ0Cj4gPiA+
IG1lc3NhZ2UgdmlhIFRodW5kZXJiaXJkLgo+ID4gPgo+ID4gPiBUaGlzIGNhdXNlcyBlcnJvcnMg
d2hlbiB0cnlpbmcgdG8gYXBwbHksIGV2ZW4gYWZ0ZXIgSSB0cmllZCB0byBtYW51YWxseSBmaXgg
dGhlCj4gPiA+IHBhdGNoIG1haWw6Cj4gPiA+Cj4gPiA+ICAgICBBcHBseWluZzogb3BlbnJpc2M6
IHVzZSBkZXZpY2UgdHJlZSB0byBkZXRlcm1pbmUgcHJlc2VudCBjcHVzCj4gPiA+ICAgICBlcnJv
cjogc2hhMSBpbmZvcm1hdGlvbiBpcyBsYWNraW5nIG9yIHVzZWxlc3MgKGFyY2gvb3BlbnJpc2Mv
a2VybmVsL3NtcC5jKS4KPiA+ID4gICAgIGVycm9yOiBjb3VsZCBub3QgYnVpbGQgZmFrZSBhbmNl
c3Rvcgo+ID4gPiAgICAgUGF0Y2ggZmFpbGVkIGF0IDAwMDEgb3BlbnJpc2M6IHVzZSBkZXZpY2Ug
dHJlZSB0byBkZXRlcm1pbmUgcHJlc2VudCBjcHVzCj4gPiA+Cj4gPiA+IENhbiB5b3Ugc2VuZCB0
aGlzIHVzaW5nICdnaXQgc2VuZC1lbWFpbD8nCj4gPiA+Cj4gPiA+IElmIG5vdCBJIGNhbiBnZXQg
aXQgYXBwbGllZCB3aXRoIHNvbWUgd29yaywgb3RoZXJ3aXNlIHlvdSBjYW4gcG9pbnQgbWUgdG8g
YSBnaXQKPiA+ID4gcmVwbyB3aGljaCBJIGNhbiBwdWxsIGl0IGZyb20uCj4gPgo+ID4gImI0IGFt
IDZkYmMyN2Y4LTUyNjEtNTljNS1hY2JhLTcwZjZjNmE3NGJhMUByd3RoLWFhY2hlbi5kZSIgd29y
a3MKPiA+IGZpbmUgZm9yIG1lLgo+ID4KPiA+IGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
dXRpbHMvYjQvYjQuZ2l0Cj4KPiBEaWQgaXQgd29yaz8gIEZvciBtZSBJIGdvdCwgYmFzZSBub3Qg
Zm91bmQuCj4KPiAgICAgTG9va2luZyB1cAo+ICAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9y
LzZkYmMyN2Y4LTUyNjEtNTljNS1hY2JhLTcwZjZjNmE3NGJhMSU0MHJ3dGgtYWFjaGVuLmRlCj4g
ICAgIEdyYWJiaW5nIHRocmVhZCBmcm9tIGxvcmUua2VybmVsLm9yZy9sa21sCj4gICAgIEFuYWx5
emluZyA5IG1lc3NhZ2VzIGluIHRoZSB0aHJlYWQKPiAgICAgV2lsbCB1c2UgdGhlIGxhdGVzdCBy
ZXZpc2lvbjogdjIKPiAgICAgWW91IGNhbiBwaWNrIG90aGVyIHJldmlzaW9ucyB1c2luZyB0aGUg
LXZOIGZsYWcKPiAgICAgLS0tCj4gICAgIFdyaXRpbmcKPiAgICAgLi92Ml8yMDIxMDIwMV9qYW5f
d2VpbnN0b2NrX29wZW5yaXNjX3VzZV9kZXZpY2VfdHJlZV90b19kZXRlcm1pbmVfcHJlc2VudF9j
cHVzLm1ieAo+ICAgICAgIFtQQVRDSCB2Ml0gb3BlbnJpc2M6IHVzZSBkZXZpY2UgdHJlZSB0byBk
ZXRlcm1pbmUgcHJlc2VudCBjcHVzCj4gICAgIC0tLQo+ICAgICBUb3RhbCBwYXRjaGVzOiAxCj4g
ICAgIC0tLQo+ICAgICAgTGluazoKPiAgICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci82ZGJj
MjdmOC01MjYxLTU5YzUtYWNiYS03MGY2YzZhNzRiYTFAcnd0aC1hYWNoZW4uZGUKPiAgICAgIEJh
c2U6IG5vdCBmb3VuZAoKVGhhdCBqdXN0IG1lYW5zIHRoZSBwYXRjaCBjb250YWlucyBubyBpbmZv
cm1hdGlvbiB3LnIudC4gaXRzIGJhc2UsIGkuZS4KYWdhaW5zdCB3aGljaCB0cmVlL2NvbW1pdCBp
dCBhcHBsaWVzIHRvLiAgVG8gYmUgaWdub3JlZC4KCj4gICAgICAgICAgICBnaXQgYW0KPiAgICAg
Li92Ml8yMDIxMDIwMV9qYW5fd2VpbnN0b2NrX29wZW5yaXNjX3VzZV9kZXZpY2VfdHJlZV90b19k
ZXRlcm1pbmVfcHJlc2VudF9jcHVzLm1ieAoKSnVzdCBydW4gdGhlIGFib3ZlIGNvbW1hbmQgOy0p
CgpJbiBhZGRpdGlvbiwgeW91IGNhbiBydW4gImZvcm1haWwgLXMgc2NyaXB0cy9jaGVja3BhdGNo
LnBsIDwgKm1ieCIgZmlyc3QsIHRvCnJ1biB0aGUgbWJveCAod2hpY2ggY291bGQgY29udGFpbiBt
dWx0aXBsZSBwYXRjaGVzKSB0aHJvdWdoIGNoZWNrcGF0Y2guCgoKR3J7b2V0amUsZWV0aW5nfXMs
CgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAt
LSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5v
cmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNh
bGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJ
IGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVu
UklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xp
c3RpbmZvL29wZW5yaXNjCg==
