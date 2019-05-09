Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 1F3AF1C39E
	for <lists+openrisc@lfdr.de>; Tue, 14 May 2019 09:07:42 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C35FA25CE5;
	Tue, 14 May 2019 09:07:41 +0200 (CEST)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by mail.librecores.org (Postfix) with ESMTPS id EA34322FE4
 for <openrisc@lists.librecores.org>; Fri, 10 May 2019 06:39:30 +0200 (CEST)
Received: by mail-wm1-f67.google.com with SMTP id y2so5797115wmi.5
 for <openrisc@lists.librecores.org>; Thu, 09 May 2019 21:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:in-reply-to:references:mime-version:content-transfer-encoding
 :subject:to:cc:from:message-id;
 bh=oI8ZonFb+6GVA/4sIFiiaaotiQrxhL5EHwWk0lkmaw8=;
 b=X/prlMNrKlUuALQJRaL62hmQ53Np/IyNtFcm0254WqD6+S4vs0WtWUdmhWnfPw2rgN
 8KihkSpNd4yitKfHKSyBYLsGT85g7P7enGfmBbntbBYCg7zqLJdYyl86MIFlThwkh9z6
 n6Avv03yNyEfS2NJ3DSBbbo35xA8lKxonTwXuhHFVwGYIltQBtQ+0LCkEnZ5olkERqi5
 kX/LpI0ofzBkzEgprpYC528rkiaVNlz+2S+FS2o8DavdgX+R5MiwbTkW9tl2fhy3T290
 Roj/B5Ia1hpZvPeyJaVRSPKHyLAPpSJNcEK3Qtu3shzXmKeRFFRsykiZir5+M8MoIBJn
 Zu0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:references:mime-version
 :content-transfer-encoding:subject:to:cc:from:message-id;
 bh=oI8ZonFb+6GVA/4sIFiiaaotiQrxhL5EHwWk0lkmaw8=;
 b=DDF8By84vHcEvoZTI42JcDmhJDyi9ljcZoQYNhrtGK+beOei/7vl8CxFCEAN/Y+9M3
 wjbRF0wgxRZa71wAVDl+LcsWdyOStZ4w/2UZqFrw7201vKunikTLTIrOLI05qGW1Ge4T
 w5mSBBFxM5TOU7Yi4UHgFE5BqSvFP/IvDrLOaS9wqghbAOAZITt0CtcwUi2PtH1QVd4E
 hKcxs8fSHFSLF43i3SSap5YO5r79SLAXOx6duadI16+Bjp0vMoMuDtDj7hCpW80+iBFF
 2K3jae3BReJ2D1NMzMhnNH8DhckRT0AG/UHxGvjronNbdE0w0RvXICmKqf1Q/MG+lklN
 cNQg==
X-Gm-Message-State: APjAAAVXkg/f3Tj1mXBBTTImOuz2iCH7r1HGs775mQdhw4s2RS7nDnvP
 bZcx+qtZ72ApzIgGCuDUvdk=
X-Google-Smtp-Source: APXvYqyo6ciqP/bHSlkmxg/Q53UxGHwrk9oC4mkJV1KEWU0dOTGlkH4FxZ97NXTfDXJ0EosglLj3LA==
X-Received: by 2002:a1c:f30e:: with SMTP id q14mr5769365wmq.31.1557463170500; 
 Thu, 09 May 2019 21:39:30 -0700 (PDT)
Received: from [192.168.100.129] (85-127-81-11.dsl.dynamic.surfer.at.
 [85.127.81.11])
 by smtp.gmail.com with ESMTPSA id z17sm4791493wrm.33.2019.05.09.21.39.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 May 2019 21:39:29 -0700 (PDT)
Date: Thu, 09 May 2019 19:44:15 +0200
In-Reply-To: <20190506131621.29929-2-shorne@gmail.com>
References: <20190506131621.29929-1-shorne@gmail.com>
 <20190506131621.29929-2-shorne@gmail.com>
MIME-Version: 1.0
To: gcc-patches@gcc.gnu.org, Stafford Horne <shorne@gmail.com>,
 GCC patches <gcc-patches@gcc.gnu.org>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Message-ID: <FF41D424-46AF-4A74-BB13-2E7A3DA4924E@gmail.com>
X-Mailman-Approved-At: Tue, 14 May 2019 09:07:40 +0200
Subject: Re: [OpenRISC] [PATCH 1/2] or1k: Fix code quality for volatile
 memory loads
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

T24gNiBNYXkgMjAxOSAxNToxNjoyMCBDRVNULCBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWls
LmNvbT4gd3JvdGU6Cj5Wb2xhdGlsZSBtZW1vcnkgZG9lcyBub3QgbWF0Y2ggdGhlIG1lbW9yeV9v
cGVyYW5kIHByZWRpY2F0ZS4gIFRoaXMKPmNhdXNlcyBleHRyYSBleHRlbmQvbWFzayBpbnN0cnVj
dGlvbnMgaW5zdHJ1Y3Rpb25zIHdoZW4gcmVhZGluZwo+ZnJvbSB2b2xhdGlsZSBtZW1vcnkuICBP
biBPcGVuUklTQyBsb2FkaW5nIHZvbGl0aWxlIG1lbW9yeSBjYW4gYmUKCnMvdm9saXRpbGUvdm9s
YXRpbGUvZwoKYWxzbyBhdCBsZWFzdCBpbiB0aGUgdGVzdC4KVGhhbmtzLAoKCj5kaWZmIC0tZ2l0
IGEvZ2NjL3Rlc3RzdWl0ZS9nY2MudGFyZ2V0L29yMWsvc3dhcC0yLmMKPmIvZ2NjL3Rlc3RzdWl0
ZS9nY2MudGFyZ2V0L29yMWsvc3dhcC0yLmMKPm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj5pbmRleCAw
MDAwMDAwMDAwMC4uOGRkZWE0ZTY1OWYKPi0tLSAvZGV2L251bGwKPisrKyBiL2djYy90ZXN0c3Vp
dGUvZ2NjLnRhcmdldC9vcjFrL3N3YXAtMi5jCgo+Ky8qIENoZWNrIHRvIGVuc3VyZSB0aGUgdm9s
aXRpbGUgbG9hZCBkb2VzIG5vdCBnZXQgemVybyBleHRlbmRlZC4gICovCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QK
T3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9y
Zy9saXN0aW5mby9vcGVucmlzYwo=
