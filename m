Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 218D42E0A8B
	for <lists+openrisc@lfdr.de>; Tue, 22 Dec 2020 14:18:55 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9ED5B21081;
	Tue, 22 Dec 2020 14:18:54 +0100 (CET)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mail.librecores.org (Postfix) with ESMTPS id 6802220EC9
 for <openrisc@lists.librecores.org>; Tue, 22 Dec 2020 14:18:53 +0100 (CET)
Received: by mail-pl1-f169.google.com with SMTP id be12so7429626plb.4
 for <openrisc@lists.librecores.org>; Tue, 22 Dec 2020 05:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+gbc2CqvgZj+5ij6o3Cu101R/iuKhpMX3sKpHEpakwo=;
 b=e7LEqkprwtC2ftOjcXddyMIJDToqaQhHK+HoWaZH11tpWDXWttmNQnTR3dhpBQlnpl
 gqCb+HiXoZZQqBfqvLepbxau/l7WU6M98TJ9hHRcKi7ATHUF/9dTruXLB2wUFtiEyNGX
 2OnVshzZp8Fnva+zWTc/8IyM5OIjehWMo1/biib9+IfuFXrFORXukZQP3lYultsincAw
 s5EuBCR/Yy6iv3pdgIRZl6IW9xchtVncLcpn4o6iWd5BSocvGkXNYoc3aZzHXbrq0TU2
 YqfMPF+TxppMKZxhFHLkbtH0eP1aSe/1DUmKyveZfQHiGXle1FRy4t2QOMkCmS1cjKqS
 afvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+gbc2CqvgZj+5ij6o3Cu101R/iuKhpMX3sKpHEpakwo=;
 b=aPGgTr+R7GMwbdl9PXB757dtHR2DnhZZIzRIg+1LcA0G1oXCsTEvmsi1ILjVTHRG7y
 s4FzLN3UfP3O0zgVgQ26vX05pHplV/DVmXhX4Q0R7nnEda9yYC8PDP2vCQrgyZ3xkG/B
 f/DN1lmtH+WSIhT0ZvIfbuUaHBvpGoEpdM57YeWPnzPyEbxDzglIoEril0byh+ne9bIZ
 +ZOrQ+zV690+mojK/X5Xe+EXBUW0c5Q8bJh+CFrDI7D3NqpoNnRF9jltkx8/0qsf0LBh
 SzFYIH1Ay+t5TNqatM0Zb/3hWIvXSXfm9NQ63nMzsIWedP/2Y/Gu6eATyMhISoWTT8q5
 4s+A==
X-Gm-Message-State: AOAM530sl3Cclny4hKsD7eQ+u4pRIWD2NnFjQZRzbrpeDPNhbAdk1xgW
 qwEgegC9n3jVg6rU6zLI5Iw=
X-Google-Smtp-Source: ABdhPJzalw3n9i7QryOGNTZ9LguC0n/AmX82UM6Bjz0Gl+TMxnydu0+oJJ5Yb1dau1LkM+fWIxyiHA==
X-Received: by 2002:a17:90a:c910:: with SMTP id
 v16mr22017153pjt.198.1608643131678; 
 Tue, 22 Dec 2020 05:18:51 -0800 (PST)
Received: from localhost (g39.222-224-245.ppp.wakwak.ne.jp. [222.224.245.39])
 by smtp.gmail.com with ESMTPSA id
 l190sm20234146pfl.205.2020.12.22.05.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Dec 2020 05:18:48 -0800 (PST)
Date: Tue, 22 Dec 2020 22:18:45 +0900
From: Stafford Horne <shorne@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Message-ID: <20201222131845.GJ3168563@lianli.shorne-pla.net>
References: <20201222070731.491076-1-joel@jms.id.au>
 <CAK7LNAS_+VTDspmBNXPZzMKDhzDz9+TyKjrOs_Xho-ZMEPGDKA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK7LNAS_+VTDspmBNXPZzMKDhzDz9+TyKjrOs_Xho-ZMEPGDKA@mail.gmail.com>
Subject: Re: [OpenRISC] [PATCH v2] openrisc: Add vmlinux.bin target
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
Cc: Jonas Bonn <jonas@southpole.se>, Mateusz Holenko <mholenko@antmicro.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 openrisc@lists.librecores.org, Karol Gugala <kgugala@antmicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBEZWMgMjIsIDIwMjAgYXQgMDQ6MjI6MTZQTSArMDkwMCwgTWFzYWhpcm8gWWFtYWRh
IHdyb3RlOgo+IE9uIFR1ZSwgRGVjIDIyLCAyMDIwIGF0IDQ6MDcgUE0gSm9lbCBTdGFubGV5IDxq
b2VsQGptcy5pZC5hdT4gd3JvdGU6Cj4gPgo+ID4gQnVpbGQgaXQgYnkgZGVmYXVsdC4gVGhpcyBp
cyBjb21tb25seSB1c2VkIGJ5IGZwZ2EgdGFyZ2V0cy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBK
b2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1Pgo+ID4gLS0tCj4gPiB2MjogQWRkcmVzcyByZXZp
ZXcgZnJvbSBNYXNhaGlybwo+ID4KPiA+ICAtIEFkZCB2bWxpbnV4LmJpbiB0byBwaG9ueSB0YXJn
ZXQKPiA+ICAtIHNpbXBsZnkgdm1saW51eC5iaW4gcnVsZQo+ID4gIC0gYWRkIGNsZWFudXAgcnVs
ZQo+ID4gIC0gYWRkIHZtbGludXguYmluIHRvIHRhcmdldHMKPiA+ICAtIEFkZCBnaXRpZ25vcmUK
PiAKPiAKPiAgUmV2aWV3ZWQtYnk6IE1hc2FoaXJvIFlhbWFkYSA8bWFzYWhpcm95QGtlcm5lbC5v
cmc+Cj4gCgpUaGFua3MsIEkgd2lsbCBxdWV1ZSB0aGlzLiAgSSBhbSBqdXN0IHdvbmRlcmluZyBp
ZiBJIHNob3VsZCB3YWl0IGZvciA1LjEyIG9yCmp1c3QgZ28gYWhlYWQgYW4gc2VuZCBpdCBpbiA1
LjExIGFzIGEgZml4LgoKLVN0YWZmb3JkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJy
ZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNj
Cg==
