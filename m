Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 0B59C267C93
	for <lists+openrisc@lfdr.de>; Sat, 12 Sep 2020 23:22:14 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A626620B5B;
	Sat, 12 Sep 2020 23:22:12 +0200 (CEST)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by mail.librecores.org (Postfix) with ESMTPS id 948A320DD4
 for <openrisc@lists.librecores.org>; Fri, 11 Sep 2020 22:55:29 +0200 (CEST)
Received: by mail-ed1-f67.google.com with SMTP id ay8so11474694edb.8
 for <openrisc@lists.librecores.org>; Fri, 11 Sep 2020 13:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ggDeVKUI4NGl/o8mg/fjLzMDUrlaYtxa8WyaQiJ3Zzk=;
 b=Esc1QmdLi/6Qx3KaIAIQHQvS4P7JAMBYZoivizjNtvFSxIcRM6aFcTDwUlzVgp7zVl
 xZfGAKAd4+K5GljAHRzQZaFdXoJ3mXWzLg6BUVNC5gyMgAiISesnHGUQil3rv03vqihZ
 9X7HRf6C06TSG9WAVFbYL6tbU1PNR/YXoB7wnpZk4eTiYiC3BmLzfoVtp4823QwJRVGy
 eaH9FxHjNJs1R8UvvB+s3VK/CtgVkp/qRGS08ycITkIDCNI85AidVJPONdTdvj9S4zB2
 GnTXKALTM4Y5rXO3v+mJPh8qyUdYFkccTxHUp8gnLj1M9n1mnnvRXa1LwOjccbvfMbzM
 oRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ggDeVKUI4NGl/o8mg/fjLzMDUrlaYtxa8WyaQiJ3Zzk=;
 b=ZdXCrmWuRo3PoMzArU3H3JibxM31Ipy2xnb/MVkd2RYum6mp3eOff8r+Sc0BhER9qS
 JnSnu6928vNrcM8l+XXDJWP3V3GP0avG8cVP8qC6Aci7QRPil6TPGqT+pV2ABd5ss4Q9
 jwwxw478cghU2dqqQ9VQe5wVVi0mKzjSnxkc2hksflgGwi64w5VfTWdLKomlw8TzUt3u
 I2O+MDFLmR2BKncdNFOcmyLzZfVr2kOIqNv2GMtRwThUoJz94TxZ9lXqFoEZUjfyquiS
 89L15Fo/wkrXv/bVrR90/TutGANvYhOcJGHl72Qx3IRm/E9XrLQA9AVTujwYnFaaJq8N
 34Tg==
X-Gm-Message-State: AOAM531Yt5fL5agOLQtOtVDHxOK9P43X5rYEe5vkbpoB7KUpNUefHUPC
 UIOOf5lCe83f4BVMwc3A0NE=
X-Google-Smtp-Source: ABdhPJwe7IN3NAF7/5APCdifVHq2JNF9augUg+dt+qFalvnsfMz7Z0m4AuUDYm3aoMQVPr/iCU4J9w==
X-Received: by 2002:a50:84a2:: with SMTP id 31mr4534948edq.138.1599857729206; 
 Fri, 11 Sep 2020 13:55:29 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7fe:f700:e86e:d952:c3c2:494c])
 by smtp.gmail.com with ESMTPSA id q26sm2169824ejr.97.2020.09.11.13.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 13:55:28 -0700 (PDT)
Date: Fri, 11 Sep 2020 22:55:26 +0200
From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To: Stafford Horne <shorne@gmail.com>
Message-ID: <20200911205526.65llro2gnh7zlsu4@ltop.local>
References: <20200910233940.2132107-1-shorne@gmail.com>
 <20200910233940.2132107-4-shorne@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910233940.2132107-4-shorne@gmail.com>
X-Mailman-Approved-At: Sat, 12 Sep 2020 23:22:07 +0200
Subject: Re: [OpenRISC] [PATCH v3 3/3] openrisc: Fix issue with get_user for
 64-bit values
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
Cc: Jonas Bonn <jonas@southpole.se>, Albert Ou <aou@eecs.berkeley.edu>,
 LKML <linux-kernel@vger.kernel.org>, openrisc@lists.librecores.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gRnJpLCBTZXAgMTEsIDIwMjAgYXQgMDg6Mzk6NDBBTSArMDkwMCwgU3RhZmZvcmQgSG9ybmUg
d3JvdGU6Cj4gQSBidWlsZCBmYWlsdXJlIHdhcyByYWlzZWQgYnkga2J1aWxkIHdpdGggdGhlIGZv
bGxvd2luZyBlcnJvci4KPiAKPiAgICAgZHJpdmVycy9hbmRyb2lkL2JpbmRlci5jOiBBc3NlbWJs
ZXIgbWVzc2FnZXM6Cj4gICAgIGRyaXZlcnMvYW5kcm9pZC9iaW5kZXIuYzozODYxOiBFcnJvcjog
dW5yZWNvZ25pemVkIGtleXdvcmQvcmVnaXN0ZXIgbmFtZSBgbC5sd3ogP2FwLDQocjI0KScKPiAg
ICAgZHJpdmVycy9hbmRyb2lkL2JpbmRlci5jOjM4NjY6IEVycm9yOiB1bnJlY29nbml6ZWQga2V5
d29yZC9yZWdpc3RlciBuYW1lIGBsLmFkZGkgP2FwLHIwLDAnCj4gCj4gVGhlIGlzc3VlIGlzIHdp
dGggNjQtYml0IGdldF91c2VyKCkgY2FsbHMgb24gb3BlbnJpc2MuICBJIHRyYWNlZCB0aGlzIHRv
Cj4gYSBwcm9ibGVtIHdoZXJlIGluIHRoZSBpbnRlcm5hbGx5IGluIHRoZSBnZXRfdXNlciBtYWNy
b3MgdGhlcmUgaXMgYSBjYXN0Cj4gdG8gbG9uZyBfX2d1X3ZhbCB0aGlzIGNhdXNlcyBHQ0MgdG8g
dGhpbmsgdGhlIGdldF91c2VyIGNhbGwgaXMgMzItYml0Lgo+IFRoaXMgYmluZGVyIGNvZGUgaXMg
cmVhbGx5IGxvbmcgYW5kIEdDQyBhbGxvY2F0ZXMgcmVnaXN0ZXIgcjMwLCB3aGljaAo+IHRyaWdn
ZXJzIHRoZSBpc3N1ZS4gVGhlIDY0LWJpdCBnZXRfdXNlciBhc20gdHJpZXMgdG8gZ2V0IHRoZSA2
NC1iaXQgcGFpcgo+IHJlZ2lzdGVyLCB3aGljaCBmb3IgcjMwIG92ZXJmbG93cyB0aGUgZ2VuZXJh
bCByZWdpc3RlciBuYW1lcyBhbmQgcmV0dXJucwo+IHRoZSBkdW1teSByZWdpc3RlciA/YXAuCj4g
Cj4gVGhlIGZpeCBoZXJlIGlzIHRvIG1vdmUgdGhlIHRlbXBvcmFyeSB2YXJpYWJsZXMgaW50byB0
aGUgYXNtIG1hY3Jvcy4gIFdlCj4gdXNlIGEgMzItYml0IF9fZ3VfdG1wIGZvciAzMi1iaXQgYW5k
IHNtYWxsZXIgbWFjcm8gYW5kIGEgNjQtYml0IHRtcCBpbgo+IHRoZSA2NC1iaXQgbWFjcm8uICBU
aGUgY2FzdCBpbiB0aGUgNjQtYml0IG1hY3JvIGhhcyBhIHRyaWNrIG9mIGNhc3RpbmcKPiB0aHJv
dWdoIF9fdHlwZW9mX18oKHgpLSh4KSkgd2hpY2ggYXZvaWRzIHRoZSBiZWxvdyB3YXJuaW5nLiAg
VGhpcyB3YXMKPiBiYXJyb3dlZCBmcm9tIHJpc2N2Lgo+IAo+ICAgICBhcmNoL29wZW5yaXNjL2lu
Y2x1ZGUvYXNtL3VhY2Nlc3MuaDoyNDA6ODogd2FybmluZzogY2FzdCB0byBwb2ludGVyIGZyb20g
aW50ZWdlciBvZiBkaWZmZXJlbnQgc2l6ZQo+IAo+IEkgdGVzdGVkIHRoaXMgaXMgYSBzbWFsbCB1
bml0IHRlc3QgdG8gY2hlY2sgcmVhZGluZyBiZXR3ZWVuIDY0LWJpdCBhbmQKPiAzMi1iaXQgcG9p
bnRlcnMgdG8gNjQtYml0IGFuZCAzMi1iaXQgdmFsdWVzIGluIGFsbCBjb21iaW5hdGlvbnMuICBB
bHNvIEkKPiByYW4gbWFrZSBDPTEgdG8gY29uZmlybSBubyBuZXcgc3BhcnNlIHdhcm5pbmdzIGNh
bWUgdXAuICBJdCBhbGwgbG9va3MKPiBjbGVhbiB0byBtZS4KCkl0IGxvb2tzIGNvcnJlY3QgdG8g
bWUgdG9vIG5vdyBhdCBDICYgYXNzZW1ibHkgbGV2ZWwuCkZlZWwgZnJlZSB0byBhZGQgbXk6ClJl
dmlld2VkLWJ5OiBMdWMgVmFuIE9vc3RlbnJ5Y2sgPGx1Yy52YW5vb3N0ZW5yeWNrQGdtYWlsLmNv
bT4KCi0tIEx1YwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0
cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
