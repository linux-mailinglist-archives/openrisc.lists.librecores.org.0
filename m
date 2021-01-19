Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2ABD32FB333
	for <lists+openrisc@lfdr.de>; Tue, 19 Jan 2021 08:38:14 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 86FD020FEF;
	Tue, 19 Jan 2021 08:38:13 +0100 (CET)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by mail.librecores.org (Postfix) with ESMTPS id CD70720417
 for <openrisc@lists.librecores.org>; Tue, 19 Jan 2021 08:38:11 +0100 (CET)
Received: by mail-ot1-f49.google.com with SMTP id b24so18953329otj.0
 for <openrisc@lists.librecores.org>; Mon, 18 Jan 2021 23:38:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VBGZIOa/m+9eMR0sp83+iQO+6+sQ38vU5foSTPAy3jA=;
 b=VcogTPqpGFFzp4RTXLMN8aqVmSYkEHEag5NVf5jdvW3ujLLgkC3thRUE2mWXS2VBrJ
 LVvLNB9Efa+XVhNy8gG6/oJ1m3NwtKPNXQlCL904PMYoLumNcUHVuT5DQLnCIMT3IvZO
 DPYP9Re66bO81nkl5y11NCH+WB67uL6Z6X7BoQf+m4Qx5g+9Y25uAPK1NhjN/hVxGog6
 QyUFzzrVszXqCwFkx4y8bZTqURnfbl172lnprKntTpj1JHPPniCLf8V8K9XDG2zS43dc
 DR2UWsS/wN8FO5c/84w/WAxx6EXg64PzxvLb9d7YdGq+GkE3gDa5rMYZhUXDd72WXTkD
 qo4Q==
X-Gm-Message-State: AOAM530xqZW6gIL/DD9leYwUJp0yjIGLy2iu4ffUHXWt0npCfMRfWjat
 2MMHOvDp/2UrB3egbbIE/3SYOG0jbeP8nQlZoUc=
X-Google-Smtp-Source: ABdhPJwfkMhoyARc+jcKbzqZ+Tvx/zEiSzvAH5QC+MITtOt+DoYZxs0bBhUeFPVPjmT0BFvb3t0wdFCJ0+bfSnL+0Vc=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id
 u26mr2542769oth.250.1611041890557; 
 Mon, 18 Jan 2021 23:38:10 -0800 (PST)
MIME-Version: 1.0
References: <81bbd71a-ff79-9f15-753a-d47b36b91756@pengutronix.de>
 <ea134d96-0856-62af-ea19-f6e0c2d80c90@duagon.com>
 <20210118212917.GI2002709@lianli.shorne-pla.net>
In-Reply-To: <20210118212917.GI2002709@lianli.shorne-pla.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Jan 2021 08:37:59 +0100
Message-ID: <CAMuHMdU+2oopABWih=-5t01gwaX-EQauMz7u=xFxiA62WJ4+8A@mail.gmail.com>
To: Stafford Horne <shorne@gmail.com>
Subject: Re: [OpenRISC] Fwd: Re: [PATCH v5] net: can: Introduce MEN
 16Z192-00 CAN controller driver
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

SGkgU3RhZmZvcmQsCgpPbiBNb24sIEphbiAxOCwgMjAyMSBhdCAxMDoyOSBQTSBTdGFmZm9yZCBI
b3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4gd3JvdGU6Cj4gT24gTW9uLCBKYW4gMTgsIDIwMjEgYXQg
MDk6MDk6MDRQTSArMDEwMCwgQWJoaWplZXQgQmFkdXJrYXIgd3JvdGU6Cj4gPiBpIGFtIGdldHRp
bmcgc3BhcnNlIHdhcm5pbmcgcmVnYXJkaW5nIGlvdW5tYXAgaW1wbGVtZW50YXRpb24gb2Ygb3Bl
bnJpc2MgYXJjaGl0ZWN0dXJlIGZvciBteSBDQU4gZHJpdmVyIHBhdGNoLiBJcyB0aGVyZSBhbnkg
c3BlY2lmaWMgcmVhc29uIHdoeSBpb3VubWFwIG9mIG9wZW5yaXNjIGRvZXNuJ3QgaGF2ZSBfX2lv
bWVtIGFubm5vdGF0aW9uPyBDb3VsZCB5b3UgcGxlYXNlIHN1Z2dlc3QgYSBmaXggZm9yIHRoaXM/
Cj4KPiBIZWxsbywKPgo+IFNvcnJ5IEkgbWlzc2VkIHRoaXMgcGF0Y2ggYXMgSSBkaWRuJ3QgcmVj
b2duaXplIHRoZSBzdWJqZWN0Lgo+Cj4gWW91IGNvdWxkIHNlbmQgYSBwYXRjaCBmb3IgaW91bm1h
cCBpZiB5b3UgbGlrZS4gIE90aGVyd2lzZSBJIGNhbiBnZXQgYXJvdW5kIHRvCj4gaXQgaW4gYSBm
ZXcgZGF5cy4KPgo+IFRoZSBwYXRjaCB3b3VsZCBiZSBzb21ldGhpbmcgbGlrZToKPgo+IC0tLSBh
L2FyY2gvb3BlbnJpc2MvbW0vaW9yZW1hcC5jCj4gKysrIGIvYXJjaC9vcGVucmlzYy9tbS9pb3Jl
bWFwLmMKPiBAQCAtNzcsNyArNzcsNyBAQCB2b2lkIF9faW9tZW0gKl9fcmVmIGlvcmVtYXAocGh5
c19hZGRyX3QgYWRkciwgdW5zaWduZWQgbG9uZwo+IHNpemUpCj4gIH0KPiAgRVhQT1JUX1NZTUJP
TChpb3JlbWFwKTsKPgo+IC12b2lkIGlvdW5tYXAodm9pZCAqYWRkcikKPiArdm9pZCBpb3VubWFw
KHZvaWQgX19pb21lbSAqYWRkcikKPiAgewo+ICAgICAgICAgLyogSWYgdGhlIHBhZ2UgaXMgZnJv
bSB0aGUgZml4bWFwIHBvb2wgdGhlbiB3ZSBqdXN0IGNsZWFyIG91dAo+ICAgICAgICAgICogdGhl
IGZpeG1hcCBtYXBwaW5nLgoKVGhhdCBpcyBub3Qgc3VmZmljaWVudC4KUGxlYXNlIGNoZWNrIG91
dCB0aGUgcGF0Y2ggSSBzdWJtaXR0ZWQgdGhyZWUgd2Vla3MgYWdvOgpodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9sa21sLzIwMjAxMjI4MDgzMzI4LjM4MjM0MzEtMS1nZWVydCtyZW5lc2FzQGdsaWRl
ci5iZS8KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQK
Ci0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBp
YTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdp
dGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdt
IHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRo
aW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBU
b3J2YWxkcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpP
cGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6
Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
