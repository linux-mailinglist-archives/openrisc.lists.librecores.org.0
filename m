Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C2A1F3EC5BC
	for <lists+openrisc@lfdr.de>; Sun, 15 Aug 2021 00:04:00 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 314D92407F;
	Sun, 15 Aug 2021 00:04:00 +0200 (CEST)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mail.librecores.org (Postfix) with ESMTPS id 3CA7222C28
 for <openrisc@lists.librecores.org>; Sun, 15 Aug 2021 00:03:58 +0200 (CEST)
Received: by mail-pj1-f43.google.com with SMTP id
 j12-20020a17090aeb0c00b00179530520b3so5849373pjz.0
 for <openrisc@lists.librecores.org>; Sat, 14 Aug 2021 15:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=22ffdNYgeQpiseJtizxDu/0vV/PD6imvoewCGmFTB1w=;
 b=Vg2FlVtMZ7DH1l7rVH//hxVvWA85r9smH7dVXT4K7YaNbVOxdvWIeDy+qOzog6EqF4
 YkTzWkZWHE9RZUANz0djdaYV12h7Ls4hT5kqd4W8QBooadFVooGsnKikP24z2B8tw2ut
 zxhcIet4fV+YJBkSA3+ItWjHUQexh/Va6Zs2gE7RR6I0ErbWDO3fVz+6MI4PiBpFMKuk
 QwiukJonVy1nWtIrvPK1GwhAudIcIPl4T9l2ImN0n2fw3iVFyLzeoTssH9IBW2UO10IZ
 fGIrGUhWl6U+bQZ5uLGmXLWILlqbjtaJY8rvRl4ZQz1YW2b/8Flxk3thB+RQhATUQ0ms
 Vm9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=22ffdNYgeQpiseJtizxDu/0vV/PD6imvoewCGmFTB1w=;
 b=kGHHX3dnv45JgtEEiF5I1uzopAgNvvNgknRgJYjTgZJwj5sDbyyrSFhthUC0DSsw92
 Bk93F+9YS3iJ/t/lsnMonpXRSs+FFUg6WggLtwiJCGi66A1Z8B9oOgfP4QEcZiEAgzKX
 ipijvrEP44yU/6ASOLf5IQg4CZjhvIQ7zkmhzjabOQBDdk/hNuC+5p4cPagLD9T27fU3
 YwYP9YhLQef5NdY0rzcuGXm8OMbppN+385KzOiTaUYjqekSecFpKLALjUXMOrhB6bFSA
 NzNgSzBFzNC0E/O0+706uPtnzko3QPmYWHcfKjjeB4s4mldQbEguFQ3tN8wjzMyWXC6K
 Mhtg==
X-Gm-Message-State: AOAM530OJt3wiNIqbG1B8npV3yOgGvTM0O9xerY4WB1JZek0xgRF9ac4
 8bgbYAlO7nQdSjaYrqspJTf3qZKy9Zg=
X-Google-Smtp-Source: ABdhPJziT/v6N/pV1+bvpOfx60Ow+DKfTloxYVYqKRNf+28QEgolyUDHI69oDHXZz0Fs8lglUdeYlA==
X-Received: by 2002:aa7:810b:0:b029:2fe:decd:c044 with SMTP id
 b11-20020aa7810b0000b02902fedecdc044mr8634865pfi.15.1628978636599; 
 Sat, 14 Aug 2021 15:03:56 -0700 (PDT)
Received: from localhost (g195.61-45-49.ppp.wakwak.ne.jp. [61.45.49.195])
 by smtp.gmail.com with ESMTPSA id c2sm7799692pgh.82.2021.08.14.15.03.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Aug 2021 15:03:55 -0700 (PDT)
Date: Sun, 15 Aug 2021 07:03:53 +0900
From: Stafford Horne <shorne@gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <YRg9yfcMeP6X3zhu@antec>
References: <20210501211145.2980164-1-shorne@gmail.com>
 <da63081f-fe79-32c2-37f1-f17ce62f967b@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <da63081f-fe79-32c2-37f1-f17ce62f967b@benettiengineering.com>
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

T24gU2F0LCBBdWcgMTQsIDIwMjEgYXQgMTE6MDE6MTZQTSArMDIwMCwgR2l1bGlvIEJlbmV0dGkg
d3JvdGU6Cj4gSGkgQWxsLAo+IAo+IE9uIDUvMS8yMSAxMToxMSBQTSwgU3RhZmZvcmQgSG9ybmUg
d3JvdGU6Cj4gPiBDaGFuZ2VzIGZyb20gdjE6Cj4gPiAgIC0gQWRkZWQgcGF0Y2ggdG8gZW5hYmxl
ZCBjbW9kbGU9bGFyZ2Ugb24gY3J0c3R1ZmYKPiA+IAo+ID4gVGhpcyBzZXJpZXMgZml4ZXMgc29t
ZSBidWdzIGZvdW5kIHdoZW4gbGlua2luZyBsYXJnZSBiaW5hcmllcywgYm90aCBpbiBidWlsZHJv
b3QKPiA+IGFuZCBnbGliYyB0ZXN0aW5nLgo+ID4gCj4gPiBTdGFmZm9yZCBIb3JuZSAoMik6Cj4g
PiAgICBvcjFrOiBBZGQgbWNtb2RlbCBvcHRpb24gdG8gaGFuZGxlIGxhcmdlIEdPVHMKPiA+ICAg
IG9yMWs6IFVzZSBjbW9kZWw9bGFyZ2Ugd2hlbiBidWlsZGluZyBjcnRzdHVmZgo+ID4gCj4gPiAg
IGdjYy9jb25maWcvb3Ixay9vcjFrLW9wdHMuaCAgIHwgMzAgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrCj4gPiAgIGdjYy9jb25maWcvb3Ixay9vcjFrLmMgICAgICAgIHwgMTEgKysrKysr
KysrLS0KPiA+ICAgZ2NjL2NvbmZpZy9vcjFrL29yMWsuaCAgICAgICAgfCAgNyArKysrKysrCj4g
PiAgIGdjYy9jb25maWcvb3Ixay9vcjFrLm9wdCAgICAgIHwgMTkgKysrKysrKysrKysrKysrKysr
Kwo+ID4gICBnY2MvZG9jL2ludm9rZS50ZXhpICAgICAgICAgICB8IDEyICsrKysrKysrKysrLQo+
ID4gICBsaWJnY2MvY29uZmlnLmhvc3QgICAgICAgICAgICB8ICA0ICsrLS0KPiA+ICAgbGliZ2Nj
L2NvbmZpZy9vcjFrL3QtY3J0c3R1ZmYgfCAgMiArKwo+ID4gICA3IGZpbGVzIGNoYW5nZWQsIDgw
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBn
Y2MvY29uZmlnL29yMWsvb3Ixay1vcHRzLmgKPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGxpYmdj
Yy9jb25maWcvb3Ixay90LWNydHN0dWZmCj4gPiAKPiAKPiBJJ3ZlIHRlc3RlZCB0aGlzIHBhdGNo
c2V0IGFuZCB3b3JrcyBhcyBleHBlY3RlZC4KPiBJdCBmaXhlZCBsaWJnZW9zIGJ1aWxkIGZhaWx1
cmUgaW4gY29uanVuY3Rpb24gd2l0aDoKPiBodHRwczovL3NvdXJjZXdhcmUub3JnL2dpdC9naXR3
ZWIuY2dpP3A9YmludXRpbHMtZ2RiLmdpdDtoPTNjM2RlMjliMDQ4YmNhNmI0YWE0MjM1YzY0N2I5
MzI4ZTcxODAxYjYKPiAKPiBIb3BlIHRoaXMgaGVscHMgdG8gY29tbWl0IGl0IHVwc3RyZWFtIHNp
bmNlIEkgc3RpbGwgZG9uJ3Qgc2VlIGl0LCBvciBhbSBJCj4gd3Jvbmc/CgpZb3UgYXJlIG5vdCB3
cm9uZywgSSBkaWQgbm90IHB1c2ggdGhlIGNoYW5nZWQgdG8gR0NDIHlldC4gIEkgd2lsbCBkbyBz
b29uLgoKLVN0YWZmb3JkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9y
ZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
