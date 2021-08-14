Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 946A43EC5C9
	for <lists+openrisc@lfdr.de>; Sun, 15 Aug 2021 00:25:11 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6F34E2406B;
	Sun, 15 Aug 2021 00:25:11 +0200 (CEST)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mail.librecores.org (Postfix) with ESMTPS id 5CF5722C28
 for <openrisc@lists.librecores.org>; Sun, 15 Aug 2021 00:25:09 +0200 (CEST)
Received: by mail-pj1-f42.google.com with SMTP id nt11so20776626pjb.2
 for <openrisc@lists.librecores.org>; Sat, 14 Aug 2021 15:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xYjEYY0agZb3IgYYGWH8SAYiP/Vet96CMM77ivL2BZQ=;
 b=X5WqxnfqbI4XbMTnk0mmqrfyLPgkqSu5r1I24j8xnypDHxpDrwWZ8Z38YTv4hCtDzU
 mYYajO4xE/Hc4ifNVYoh/VnQOnFRw2ve5LSEwkiFweV5/Zk0dCDLs8l7RSpCLq5T5zs4
 meRIAddl6ozuI5YSaL/+iO4Qt9pLYw/3eRgJ266w+qZLxk78psz3nAmbHUOf42ZPYoAQ
 Ey5aj1M9LHcO1Cr24BChA5VAQihj9gw+66V+yTT0iWItoa8tWDvPF2HPMByFHA8Gtjh/
 UXUOSW1r02nCaPwryL4lmi8kQZnhsANBPvB3NPRUTupjAezjjEU4VCp7hLis8fPHm3CQ
 XLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xYjEYY0agZb3IgYYGWH8SAYiP/Vet96CMM77ivL2BZQ=;
 b=t8ueeBwN3TGBVe/6FsJD+XYyNc7XTdvomBBF2QyYwd3m4DbsFyXeg0RNI2X0+EmVqy
 BMozxbKZM30QnzmaYy15DUmNvwy+g9+paNNLmcorPZCX8SzpeFRxdOK3W3KG1hU/swjx
 po5DmmiVgdaSmHEZpOo79R/uNVi58dZRar2dQwRaQdz0dzjCo/tzyUDSk4sGUU5FcqDz
 paP9LMhTs/TTOv0XJlpuHa97YVuctXrHXIuHLr0KogTAmg670iWzVz69dEhVtMPERMGt
 GYh0yaG7TPvcA3W6+2nQ8wn0Oqf9wKSPWsBvzr4nxaTu3M8ZXfo+yV8OYBhUgVFxEO+4
 mlVA==
X-Gm-Message-State: AOAM531X8c6Gwegrqb7C+bc+BhuwoYe7rB0+GnypdYuj3hW888rsH47p
 kjnb7H4gkX3qOqAKABf0l9w=
X-Google-Smtp-Source: ABdhPJz7X1PIgVx0K7lKSorXAOlmVANDKoE/CSkUgcB6zgTT0XkcQDOPA5B6AMwZ3bpbe2QCYiZX4A==
X-Received: by 2002:a17:90b:3144:: with SMTP id
 ip4mr8919020pjb.42.1628979907870; 
 Sat, 14 Aug 2021 15:25:07 -0700 (PDT)
Received: from localhost (g195.61-45-49.ppp.wakwak.ne.jp. [61.45.49.195])
 by smtp.gmail.com with ESMTPSA id nn18sm4810522pjb.21.2021.08.14.15.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Aug 2021 15:25:07 -0700 (PDT)
Date: Sun, 15 Aug 2021 07:25:05 +0900
From: Stafford Horne <shorne@gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <YRhCwQPveo8+lnGH@antec>
References: <20210501211145.2980164-1-shorne@gmail.com>
 <da63081f-fe79-32c2-37f1-f17ce62f967b@benettiengineering.com>
 <YRg9yfcMeP6X3zhu@antec>
 <9e4b2d98-5ba1-c35f-b419-3df2d84a5dab@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9e4b2d98-5ba1-c35f-b419-3df2d84a5dab@benettiengineering.com>
Subject: Re: [OpenRISC] [PATCH v2 0/2] OpenRISC support for cmodel=large
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
Cc: Openrisc <openrisc@lists.librecores.org>,
 GCC patches <gcc-patches@gcc.gnu.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU3VuLCBBdWcgMTUsIDIwMjEgYXQgMTI6MDU6MzdBTSArMDIwMCwgR2l1bGlvIEJlbmV0dGkg
d3JvdGU6Cj4gT24gOC8xNS8yMSAxMjowMyBBTSwgU3RhZmZvcmQgSG9ybmUgd3JvdGU6Cj4gPiBP
biBTYXQsIEF1ZyAxNCwgMjAyMSBhdCAxMTowMToxNlBNICswMjAwLCBHaXVsaW8gQmVuZXR0aSB3
cm90ZToKPiA+ID4gSGkgQWxsLAo+ID4gPiAKPiA+ID4gT24gNS8xLzIxIDExOjExIFBNLCBTdGFm
Zm9yZCBIb3JuZSB3cm90ZToKPiA+ID4gPiBDaGFuZ2VzIGZyb20gdjE6Cj4gPiA+ID4gICAgLSBB
ZGRlZCBwYXRjaCB0byBlbmFibGVkIGNtb2RsZT1sYXJnZSBvbiBjcnRzdHVmZgo+ID4gPiA+IAo+
ID4gPiA+IFRoaXMgc2VyaWVzIGZpeGVzIHNvbWUgYnVncyBmb3VuZCB3aGVuIGxpbmtpbmcgbGFy
Z2UgYmluYXJpZXMsIGJvdGggaW4gYnVpbGRyb290Cj4gPiA+ID4gYW5kIGdsaWJjIHRlc3Rpbmcu
Cj4gPiA+ID4gCj4gPiA+ID4gU3RhZmZvcmQgSG9ybmUgKDIpOgo+ID4gPiA+ICAgICBvcjFrOiBB
ZGQgbWNtb2RlbCBvcHRpb24gdG8gaGFuZGxlIGxhcmdlIEdPVHMKPiA+ID4gPiAgICAgb3Ixazog
VXNlIGNtb2RlbD1sYXJnZSB3aGVuIGJ1aWxkaW5nIGNydHN0dWZmCj4gPiA+ID4gCj4gPiA+ID4g
ICAgZ2NjL2NvbmZpZy9vcjFrL29yMWstb3B0cy5oICAgfCAzMCArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysKPiA+ID4gPiAgICBnY2MvY29uZmlnL29yMWsvb3Ixay5jICAgICAgICB8IDEx
ICsrKysrKysrKy0tCj4gPiA+ID4gICAgZ2NjL2NvbmZpZy9vcjFrL29yMWsuaCAgICAgICAgfCAg
NyArKysrKysrCj4gPiA+ID4gICAgZ2NjL2NvbmZpZy9vcjFrL29yMWsub3B0ICAgICAgfCAxOSAr
KysrKysrKysrKysrKysrKysrCj4gPiA+ID4gICAgZ2NjL2RvYy9pbnZva2UudGV4aSAgICAgICAg
ICAgfCAxMiArKysrKysrKysrKy0KPiA+ID4gPiAgICBsaWJnY2MvY29uZmlnLmhvc3QgICAgICAg
ICAgICB8ICA0ICsrLS0KPiA+ID4gPiAgICBsaWJnY2MvY29uZmlnL29yMWsvdC1jcnRzdHVmZiB8
ICAyICsrCj4gPiA+ID4gICAgNyBmaWxlcyBjaGFuZ2VkLCA4MCBpbnNlcnRpb25zKCspLCA1IGRl
bGV0aW9ucygtKQo+ID4gPiA+ICAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBnY2MvY29uZmlnL29yMWsv
b3Ixay1vcHRzLmgKPiA+ID4gPiAgICBjcmVhdGUgbW9kZSAxMDA2NDQgbGliZ2NjL2NvbmZpZy9v
cjFrL3QtY3J0c3R1ZmYKPiA+ID4gPiAKPiA+ID4gCj4gPiA+IEkndmUgdGVzdGVkIHRoaXMgcGF0
Y2hzZXQgYW5kIHdvcmtzIGFzIGV4cGVjdGVkLgo+ID4gPiBJdCBmaXhlZCBsaWJnZW9zIGJ1aWxk
IGZhaWx1cmUgaW4gY29uanVuY3Rpb24gd2l0aDoKPiA+ID4gaHR0cHM6Ly9zb3VyY2V3YXJlLm9y
Zy9naXQvZ2l0d2ViLmNnaT9wPWJpbnV0aWxzLWdkYi5naXQ7aD0zYzNkZTI5YjA0OGJjYTZiNGFh
NDIzNWM2NDdiOTMyOGU3MTgwMWI2Cj4gPiA+IAo+ID4gPiBIb3BlIHRoaXMgaGVscHMgdG8gY29t
bWl0IGl0IHVwc3RyZWFtIHNpbmNlIEkgc3RpbGwgZG9uJ3Qgc2VlIGl0LCBvciBhbSBJCj4gPiA+
IHdyb25nPwo+ID4gCj4gPiBZb3UgYXJlIG5vdCB3cm9uZywgSSBkaWQgbm90IHB1c2ggdGhlIGNo
YW5nZWQgdG8gR0NDIHlldC4gIEkgd2lsbCBkbyBzb29uLgo+IAo+IEFoIG9rLCB5b3UncmUgdGhl
IG1haW50YWluZXIgOi0pIEkgdGhvdWdodCB0aGVyZSB3YXMgc29tZW9uZSBlbHNlIHdobyBuZWVk
ZWQKPiB0byBwdXNoIGl0IDotKQoKWWVhaCwgSSBwdXNoZWQgaXQgbm93LgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QK
T3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9y
Zy9saXN0aW5mby9vcGVucmlzYwo=
