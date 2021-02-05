Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 096E7310D9C
	for <lists+openrisc@lfdr.de>; Fri,  5 Feb 2021 17:08:06 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id AF54D20D93;
	Fri,  5 Feb 2021 17:08:05 +0100 (CET)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 by mail.librecores.org (Postfix) with ESMTPS id CCA3920D93
 for <openrisc@lists.librecores.org>; Fri,  5 Feb 2021 17:08:03 +0100 (CET)
Received: by mail-oi1-f182.google.com with SMTP id y199so5948475oia.4
 for <openrisc@lists.librecores.org>; Fri, 05 Feb 2021 08:08:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pa2z99CDmoKgXcEOAulWGlRKNiLQ7DeYHjbsElCag00=;
 b=BxNy222YbluBsFZ48zHbHAPEgPFTco7+QI/IeqWlXnMVztIfqr99YDvfDQ30I9bu1X
 EItHU/kFMCJ4E4DY/+XgVEavOciD7WMoQtz3IM5wYL3thjcqWqmHHAGfFtvt9sfhxtia
 l2Rtl1CF9vpCBFw9xhH/qCyRJklDC8kwLrc3Lk9L25pVOVgje2EbMF+bCvLzF1DW9EIn
 UwPA5UgDJ1OMGmnqR7iIxMiKp0iY9EOL5bdYXgooiN7t/NXjiMS0Fv2CTjtwUY3cXc/z
 upZdx+qUjnkqkM3id8Tl4q0PMA1vr2sNzlyh4ZihCPfvWNyU/8lRoXWjQNkc+cL+WJoL
 QD3Q==
X-Gm-Message-State: AOAM530jwstf0nZOxUUbFwYplFKukrEbJRRU7Iq4dVHlvlbwYR/PhdQv
 B9NW7kdH05NtwrKX7P7aIsP0rzUjJKrdeEbHjBI=
X-Google-Smtp-Source: ABdhPJzD/U89LOC50U+ufH6Lv7RqyWymOkXEkh1VHlWJ5xXAB+Dqmi4QpOFXFGwfYCXPBX2Rs3JFfJAvrexNYFwwwjg=
X-Received: by 2002:a54:4e88:: with SMTP id c8mr3365501oiy.148.1612541282637; 
 Fri, 05 Feb 2021 08:08:02 -0800 (PST)
MIME-Version: 1.0
References: <0b26eda7-229d-3dc9-f2ae-19b9212fb0ea@rwth-aachen.de>
 <20210129221643.GZ2002709@lianli.shorne-pla.net>
 <2a018afc-d797-3a91-ffab-e55ae3b0a795@rwth-aachen.de>
 <20210130230310.GC2002709@lianli.shorne-pla.net>
 <d9f4aafc-4d65-38b0-dde0-5e155836aee1@rwth-aachen.de>
 <20210131212752.GG2002709@lianli.shorne-pla.net>
 <6dbc27f8-5261-59c5-acba-70f6c6a74ba1@rwth-aachen.de>
 <20210205144317.GK2002709@lianli.shorne-pla.net>
In-Reply-To: <20210205144317.GK2002709@lianli.shorne-pla.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 Feb 2021 17:07:51 +0100
Message-ID: <CAMuHMdXzr4c4=Cg1_Lmw41cmxmMrG4P=dV0yVjuXvuR5pqyh0Q@mail.gmail.com>
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

SGkgU3RhZmZvcmQsCgpPbiBGcmksIEZlYiA1LCAyMDIxIGF0IDM6NDMgUE0gU3RhZmZvcmQgSG9y
bmUgPHNob3JuZUBnbWFpbC5jb20+IHdyb3RlOgo+IE9uIE1vbiwgRmViIDAxLCAyMDIxIGF0IDEy
OjQ5OjMxUE0gKzAxMDAsIEphbiBIZW5yaWsgV2VpbnN0b2NrIHdyb3RlOgo+ID4gVXNlIHRoZSBk
ZXZpY2UgdHJlZSB0byBkZXRlcm1pbmUgdGhlIHByZXNlbnQgY3B1cyBpbnN0ZWFkIG9mIGFzc3Vt
aW5nIGFsbAo+ID4gQ09ORklHX05SQ1BVUyBhcmUgYWN0dWFsbHkgcHJlc2VudCBpbiB0aGUgc3lz
dGVtLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEphbiBIZW5yaWsgV2VpbnN0b2NrIDxqYW4ud2Vp
bnN0b2NrQHJ3dGgtYWFjaGVuLmRlPgo+Cj4gSGkgSmFuLAo+Cj4gSSBjYW5ub3QgYXBwbHkgdGhp
cyBwYXRjaCwgaXQgc2VlbXMgeW91IHNvbWVob3cgc2VudCBpdCBzaWduZWQgYXMgYSBtdWx0aXBh
cnQKPiBtZXNzYWdlIHZpYSBUaHVuZGVyYmlyZC4KPgo+IFRoaXMgY2F1c2VzIGVycm9ycyB3aGVu
IHRyeWluZyB0byBhcHBseSwgZXZlbiBhZnRlciBJIHRyaWVkIHRvIG1hbnVhbGx5IGZpeCB0aGUK
PiBwYXRjaCBtYWlsOgo+Cj4gICAgIEFwcGx5aW5nOiBvcGVucmlzYzogdXNlIGRldmljZSB0cmVl
IHRvIGRldGVybWluZSBwcmVzZW50IGNwdXMKPiAgICAgZXJyb3I6IHNoYTEgaW5mb3JtYXRpb24g
aXMgbGFja2luZyBvciB1c2VsZXNzIChhcmNoL29wZW5yaXNjL2tlcm5lbC9zbXAuYykuCj4gICAg
IGVycm9yOiBjb3VsZCBub3QgYnVpbGQgZmFrZSBhbmNlc3Rvcgo+ICAgICBQYXRjaCBmYWlsZWQg
YXQgMDAwMSBvcGVucmlzYzogdXNlIGRldmljZSB0cmVlIHRvIGRldGVybWluZSBwcmVzZW50IGNw
dXMKPgo+IENhbiB5b3Ugc2VuZCB0aGlzIHVzaW5nICdnaXQgc2VuZC1lbWFpbD8nCj4KPiBJZiBu
b3QgSSBjYW4gZ2V0IGl0IGFwcGxpZWQgd2l0aCBzb21lIHdvcmssIG90aGVyd2lzZSB5b3UgY2Fu
IHBvaW50IG1lIHRvIGEgZ2l0Cj4gcmVwbyB3aGljaCBJIGNhbiBwdWxsIGl0IGZyb20uCgoiYjQg
YW0gNmRiYzI3ZjgtNTI2MS01OWM1LWFjYmEtNzBmNmM2YTc0YmExQHJ3dGgtYWFjaGVuLmRlIiB3
b3JrcwpmaW5lIGZvciBtZS4KCmdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vdXRpbHMvYjQv
YjQuZ2l0CgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0
CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQg
aWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3
aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEkn
bSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0
aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMg
VG9ydmFsZHMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
T3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBz
Oi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
