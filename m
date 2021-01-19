Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 672342FC212
	for <lists+openrisc@lfdr.de>; Tue, 19 Jan 2021 22:18:20 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1646620CF9;
	Tue, 19 Jan 2021 22:18:20 +0100 (CET)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mail.librecores.org (Postfix) with ESMTPS id 551E720D50
 for <openrisc@lists.librecores.org>; Tue, 19 Jan 2021 22:18:18 +0100 (CET)
Received: by mail-pg1-f180.google.com with SMTP id g15so13758235pgu.9
 for <openrisc@lists.librecores.org>; Tue, 19 Jan 2021 13:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3gGc6xmmoSvdkUnPtvD2cUuU2pgqJT2sG/Kj+cTx2Ow=;
 b=E+PMbx7YyoRJxYEHCUNdVSgsLboCI+fWLaUkV1sytmlXgN8UYu3dCswTVzrsbg7LpC
 BV3Ekfxt9IrmdXx1+el7Q8BZdXc9Hp0UOueDS2AMcAEbGBNTCmt2rDlNI6xSk3bvsbP2
 VkwNueMOQxxtM29bFnjA12uxEJh9HsnosReir+V4M8mAeiurSTHAeMmez8jcdMJdMPhz
 8E5TlpZfl+TYN/3ch7JCpGJIaGXy4q0jKTc3ulFVRgf+mrv/4jUcfzTTCsu0IK0PeLD6
 96E/dUZsNqmdSdQ00XFp7J1FYjEUhTHnZDRp1EHEiRYAgSMMBqZvN3P92mXEbQRf6cXP
 F/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3gGc6xmmoSvdkUnPtvD2cUuU2pgqJT2sG/Kj+cTx2Ow=;
 b=OmGs56DrnW65TaDMMGXkcHY+nfM4jx6pMFMv4iP4as6a+O4Xd5Xjy7CrqQFJUNGfho
 9uzleed7Bf8bCJIvSn7IUhITJk2MvtCSyYij14p0cWReAVsGLgqb2l78Wplywpqkdg/w
 T/N6ClbeeU5VbaR2tKOPklPCaxZTnLoVFGvUjl/ZyfuJ+74rf9mykD/cTawvWkap8FyR
 aG4VHIISSJT4zy32czp5uNO+3WQbjDqSVUgn1feD7HPCuSgdKa7YRYc6fyKU7gLiYJ1x
 Ji3vrOYCpAvyiDuhbTk8n3O0amK+jfNPw4mUEZCs4Ii3PMz/ZJgNW6FlBiqGJmCGJFrl
 9Gsg==
X-Gm-Message-State: AOAM533koHNAYODG64twnakkHfrjD/p4nUn14sx8AgNQV4wLRsAFWNiD
 9YIUDr4tbQ78NLflMWHZ3Qs=
X-Google-Smtp-Source: ABdhPJy3SLZg1jtIFvfTpuk3aSZUqemVXdTy9CFLm1+aD5deONZCpvrCaszU07SZuCFH26XTgw6HQA==
X-Received: by 2002:a62:a11c:0:b029:1ba:bab6:6b02 with SMTP id
 b28-20020a62a11c0000b02901babab66b02mr208112pff.51.1611091096439; 
 Tue, 19 Jan 2021 13:18:16 -0800 (PST)
Received: from localhost (g238.115-65-210.ppp.wakwak.ne.jp. [115.65.210.238])
 by smtp.gmail.com with ESMTPSA id
 e16sm53689pfj.45.2021.01.19.13.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 13:18:15 -0800 (PST)
Date: Wed, 20 Jan 2021 06:18:14 +0900
From: Stafford Horne <shorne@gmail.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Message-ID: <20210119211814.GK2002709@lianli.shorne-pla.net>
References: <20201228083328.3823431-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201228083328.3823431-1-geert+renesas@glider.be>
Subject: Re: [OpenRISC] [PATCH] openrisc: io: Add missing __iomem annotation
 to iounmap()
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
Cc: Jonas Bonn <jonas@southpole.se>, kernel test robot <lkp@intel.com>,
 openrisc@lists.librecores.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBEZWMgMjgsIDIwMjAgYXQgMDk6MzM6MjhBTSArMDEwMCwgR2VlcnQgVXl0dGVyaG9l
dmVuIHdyb3RlOgo+IFdpdGggQz0xOgo+IAo+ICAgICBkcml2ZXJzL3NvYy9yZW5lc2FzL3Jtb2Jp
bGUtc3lzYy5jOjMzMDozMzogc3BhcnNlOiBzcGFyc2U6IGluY29ycmVjdCB0eXBlIGluIGFyZ3Vt
ZW50IDEgKGRpZmZlcmVudCBhZGRyZXNzIHNwYWNlcykgQEAgICAgIGV4cGVjdGVkIHZvaWQgKmFk
ZHIgQEAgICAgIGdvdCB2b2lkIFtub2RlcmVmXSBfX2lvbWVtICpbYXNzaWduZWRdIGJhc2UgQEAK
PiAgICAgZHJpdmVycy9zb2MvcmVuZXNhcy9ybW9iaWxlLXN5c2MuYzozMzA6MzM6IHNwYXJzZTog
ICAgIGV4cGVjdGVkIHZvaWQgKmFkZHIKPiAgICAgZHJpdmVycy9zb2MvcmVuZXNhcy9ybW9iaWxl
LXN5c2MuYzozMzA6MzM6IHNwYXJzZTogICAgIGdvdCB2b2lkIFtub2RlcmVmXSBfX2lvbWVtICpb
YXNzaWduZWRdIGJhc2UKPiAKPiBGaXggdGhpcyBieSBhZGRpbmcgdGhlIG1pc3NpbmcgX19pb21l
bSBhbm5vdGF0aW9uIHRvIGlvdW5tYXAoKS4KPiAKPiBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qg
cm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9ldmVu
IDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4KClJldmlld2VkIGFuZCBPSy4gIEkgcXVldWVkIHRo
aXMgdG8gbXkgNS4xMSBmaXhlcyBicmFuY2guICBJIHdpbGwgc2VuZCBhIFBSIGZvciB0aGlzCm92
ZXIgdGhlIHdlZWtlbmQuCgpodHRwczovL2dpdGh1Yi5jb20vb3BlbnJpc2MvbGludXgvY29tbWl0
cy9vcjFrLTUuMTEtZml4ZXMKCihGb3VuZCB0aGlzIG9uZSBpbiBzcGFtIGFuZCBob3BlZnVsbHkg
Zml4ZWQgdXAgbXkgZmlsdGVycyBub3cpCgotU3RhZmZvcmQKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVND
QGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGlu
Zm8vb3BlbnJpc2MK
