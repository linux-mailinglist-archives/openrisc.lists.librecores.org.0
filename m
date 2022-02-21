Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D09D84BE987
	for <lists+openrisc@lfdr.de>; Mon, 21 Feb 2022 19:07:36 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 651BE247DF;
	Mon, 21 Feb 2022 19:07:36 +0100 (CET)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by mail.librecores.org (Postfix) with ESMTPS id AB00A247BE
 for <openrisc@lists.librecores.org>; Mon, 21 Feb 2022 19:07:34 +0100 (CET)
Received: by mail-oi1-f172.google.com with SMTP id q5so11736469oij.6
 for <openrisc@lists.librecores.org>; Mon, 21 Feb 2022 10:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Tub2RyCDG5MPFmLhV0vv1h0olijV15zDpWYMFibe8nc=;
 b=URP4IJb55xjK71zdvsU/yTJUg/XzTgjoUkChuIJT+4gt1TwmUhQtqkpXD60wWccx/I
 2dTJqAxegmIuuBEgfsbNdl2pJxUCi8CNXJ6ApkNyKyj3s+crmy9x4B0UdF7QifHxxbd4
 H8P0UH/co//L7zoRX4urXTzrwtqCWwNQcEdY+8oE7FXfrmNA5R1LxfjmzL/EGmxILnnB
 zmNYBwAm6HD4EkmoSlg+zbHV1sGZQ4bLz85ant+o7vUR5Z5BVwxidfLl4MevNfI1LCns
 ajMni3xyoyntpIvKRAFU/8x+VRK/+0JaTysUGEGkE9bKLpUjWr2Atsv1CSqn3wvY4ORl
 F9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Tub2RyCDG5MPFmLhV0vv1h0olijV15zDpWYMFibe8nc=;
 b=GHLklJ7j1HqzMG7vI5zoZWpzykVlo3UW5AgGgoBGfqAxH3fnpp8LqSgsuwbUkOy1kf
 m0iRKv7XMyQncN2wOSMm5MdxnP2U2bt+aujLcR8xxJOC/Kxb6W4X9jpHRRgsEYsako/A
 cmy2R5t1d1BCZjsPLwDYiwX2xQM/jOLUc2mk7oNEFuNb/0II48usBAwgBJzgUtbGpHtn
 3svZ9QhUguMUv8YAFWAmyXDYN9LPlSY3P+LhkHpkhMFeMUxKE7uNY8bdy3MnrHNY4VOs
 i88BV6PUU2EG4QlGwjk0Cx9iIaUCzj0NbeRe7ACp8hzu779jEVj7tsxSV2+s5wdgyojU
 3TXg==
X-Gm-Message-State: AOAM532jF1NDfnWZwEz0rcyvL7ivGLPujF3mZPoFFIXXmBrTT6F2ZPf1
 TbkkeHdmGEtCr5LywK7/Exc7Jg==
X-Google-Smtp-Source: ABdhPJxDxJTxt4x4IHJi8c3DhJ3qe9Ys4WO+mnCg4r7s+0NSWtCtTSAWU4/IUziF1aVwZwouQKK61A==
X-Received: by 2002:aca:b688:0:b0:2d3:5411:9bc0 with SMTP id
 g130-20020acab688000000b002d354119bc0mr128769oif.192.1645466853405; 
 Mon, 21 Feb 2022 10:07:33 -0800 (PST)
Received: from ?IPV6:2804:431:c7ca:cb36:ae42:babb:bfa3:4f13?
 ([2804:431:c7ca:cb36:ae42:babb:bfa3:4f13])
 by smtp.gmail.com with ESMTPSA id z28sm2062402oti.5.2022.02.21.10.07.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 10:07:32 -0800 (PST)
Message-ID: <df791ab9-d0e6-090d-6164-817b4e8574db@linaro.org>
Date: Mon, 21 Feb 2022 15:07:30 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>,
 GLIBC patches <libc-alpha@sourceware.org>
References: <20220128232842.3329969-1-shorne@gmail.com>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
In-Reply-To: <20220128232842.3329969-1-shorne@gmail.com>
Subject: Re: [OpenRISC] [PATCH] or1k: Define PI_STATIC_AND_HIDDEN
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
Cc: Florian Weimer <fweimer@redhat.com>,
 Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

CgpPbiAyOC8wMS8yMDIyIDIwOjI4LCBTdGFmZm9yZCBIb3JuZSB3cm90ZToKPiBQSV9TVEFUSUNf
QU5EX0hJRERFTiBtZWFucyB0aGF0IHJlZmVyZW5jZXMgdG8gc3RhdGljIGZ1bmN0aW9ucywgZGF0
YQo+IGFuZCBzeW1ib2xzIHdpdGggaGlkZGVuIHZpc2liaWxpdHkgZG8gbm90IG5lZWQgYW55IHJ1
bi10aW1lIHJlbG9jYXRpb25zCj4gYWZ0ZXIgdGhlIGZpbmFsIGxpbmssIHdpdGggdGhlIGJ1aWxk
IGZsYWdzIHVzZWQgYnkgZ2xpYmMuCj4gCj4gT3BlblJJU0MgZm9sbG93cyB0aGlzIHNvIGVuYWJs
ZWQgUElfU1RBVElDX0FORF9ISURERU4gYnkgYWRkaW5nCj4gY29uZmlndXJlLmFjIGFuZCBnZW5l
cmF0aW5nIGNvbmZpZ3VyZS4KPiAKPiBTdWdnZXN0ZWQtYnk6IEZsb3JpYW4gV2VpbWVyIDxmd2Vp
bWVyQHJlZGhhdC5jb20+CgpMR1RNLCB0aGFua3MuICBTdGFmZm9yZCwgeW91IGFyZSB0aGUgb3Ix
ayBtYWludGFpbmVyIGFuZCBtb3N0IGxpa2VseSB0aGUKb25lIHdpdGggYSBzZXR1cCB0byBhY3R1
YWxseSB0ZXN0IGl0LiAgRm9yIHN1Y2ggYXJjaCBzcGVjaWZpYyBjaGFuZ2VzLAp5b3UgY2FuIHB1
c2ggaXQgd2l0aG91dCByZXF1aXJlIG90aGVyIG1haW50YWluZXIgYWNrLgoKPiAtLS0KPiBUaGlz
IHdhcyBkaXNjdXNzZWQgb24gdGhlIG1haWxpbmcgbGlzdDoKPiAgIGh0dHBzOi8vc291cmNld2Fy
ZS5vcmcvcGlwZXJtYWlsL2xpYmMtYWxwaGEvMjAyMi1KYW51YXJ5LzEzNTYyMC5odG1sCj4gCj4g
SSB0aG91Z2h0IHRvIGdldCB0aGlzIG91dCBhcyBJIHN0YXJ0IHRvIHRlc3QgMi4zNSB3ZSB3YW50
IHRoaXMgY2hhbmdlIGluLgo+IAo+ICBzeXNkZXBzL29yMWsvY29uZmlndXJlICAgIHwgNSArKysr
Kwo+ICBzeXNkZXBzL29yMWsvY29uZmlndXJlLmFjIHwgNCArKysrCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgOSBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBzeXNkZXBzL29yMWsvY29u
ZmlndXJlCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBzeXNkZXBzL29yMWsvY29uZmlndXJlLmFjCj4g
Cj4gZGlmZiAtLWdpdCBhL3N5c2RlcHMvb3Ixay9jb25maWd1cmUgYi9zeXNkZXBzL29yMWsvY29u
ZmlndXJlCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5kNzNkYjRk
ZGJlCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3N5c2RlcHMvb3Ixay9jb25maWd1cmUKPiBAQCAt
MCwwICsxLDUgQEAKPiArIyBUaGlzIGZpbGUgaXMgZ2VuZXJhdGVkIGZyb20gY29uZmlndXJlLmFj
IGJ5IEF1dG9jb25mLiAgRE8gTk9UIEVESVQhCj4gKyAjIExvY2FsIGNvbmZpZ3VyZSBmcmFnbWVu
dCBmb3Igc3lzZGVwcy9vcjFrL2VsZi4KPiArCj4gKyRhc19lY2hvICIjZGVmaW5lIFBJX1NUQVRJ
Q19BTkRfSElEREVOIDEiID4+Y29uZmRlZnMuaAo+ICsKPiBkaWZmIC0tZ2l0IGEvc3lzZGVwcy9v
cjFrL2NvbmZpZ3VyZS5hYyBiL3N5c2RlcHMvb3Ixay9jb25maWd1cmUuYWMKPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLmRiNmE2MDg3ZTEKPiAtLS0gL2Rldi9udWxs
Cj4gKysrIGIvc3lzZGVwcy9vcjFrL2NvbmZpZ3VyZS5hYwo+IEBAIC0wLDAgKzEsNCBAQAo+ICtH
TElCQ19QUk9WSURFUyBkbmwgU2VlIGFjbG9jYWwubTQgaW4gdGhlIHRvcCBsZXZlbCBzb3VyY2Ug
ZGlyZWN0b3J5Lgo+ICsjIExvY2FsIGNvbmZpZ3VyZSBmcmFnbWVudCBmb3Igc3lzZGVwcy9vcjFr
L2VsZi4KPiArCj4gK0FDX0RFRklORShQSV9TVEFUSUNfQU5EX0hJRERFTikKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0
Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5v
cmcvbGlzdGluZm8vb3BlbnJpc2MK
