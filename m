Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id F1F95267C8F
	for <lists+openrisc@lfdr.de>; Sat, 12 Sep 2020 23:22:11 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 86C1020B06;
	Sat, 12 Sep 2020 23:22:10 +0200 (CEST)
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by mail.librecores.org (Postfix) with ESMTPS id 5AE2A20BDE
 for <openrisc@lists.librecores.org>; Sat,  5 Sep 2020 15:57:17 +0200 (CEST)
Received: by mail-ej1-f67.google.com with SMTP id z22so12176578ejl.7
 for <openrisc@lists.librecores.org>; Sat, 05 Sep 2020 06:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=i7vHnbsQaTVoLJzyyFyi0SrSiuFZTKN5WtNqQ73f1pI=;
 b=Ezkdcm/1AiLLyGLqw7QrBbjI+ob4TYlIspAe7l+941Y2g3E0mPSWsG3hMwoRGUPB3W
 xNlF/hGQtEgiTXCLt4dxKF9zIOSHpd1K4uF35xysMtsgvkXfR9xWXC0dbLJYdVOlKKKa
 IY7RuWuQ85bNjJOVp/esmgzhuhFv8LNzToFB4Wfuxi909jyjQDmf2Y0wKrcqmw+ogdtX
 J8ZnnH0Ig/1YGLAUy5iQHUYrKq5Fe1ilJ1SHAAQCcbnotfa0X7duvruzGGzcZHYLJvpc
 bnjuAMzYov5r+RR3IaUpk6V6pCUA3LEeuqLHHSYLqMlvU4zCkpJ1ktl0aOoZj12MQUdH
 2Q6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=i7vHnbsQaTVoLJzyyFyi0SrSiuFZTKN5WtNqQ73f1pI=;
 b=lr+zxobGfuYODiEY/e0QrWZasuRgFAUjfwOcclNH8ckVR9S3/+gkxmY1S1OcnNY8nV
 eyCs0oMM7Iam7U6SP5kLF0PZY0Mg1ZVPn9lj8e7sckuHKFiPvwCl4M6Ux50s6fpwm0h0
 J58kgJU6ebwrq3qQ7r4hrVUIzupLYjCpSq0IznZ0Q4ydfiadnYMCiELMEt8s4gXqduX9
 4qW+xLMs2gFFCOI1iiudm/DdTF5pqImxC9HFGIryi5sCEOMFJNzrYDT8wIkTGjg7cr4h
 ahqFykEScJGM17GpxLjNwbBXsJorwDZiCJVsJJoa1DvjS5RxXKb4le3n9EIv1UJwtbIt
 Ap6A==
X-Gm-Message-State: AOAM532YOLfmmG70xLxHlLHZVJcHCLjn6jmT54VtLzx9BjzkG7piyuHc
 9gLge8lT/XLA0aeBcnaCDnY=
X-Google-Smtp-Source: ABdhPJyZXke4ITsp+HoHza4LYDRy+JGbTyBl/Psg2ZtgrlX6lJGnxACB8hPu2U8b2bXCly7ymlR5LA==
X-Received: by 2002:a17:906:1d08:: with SMTP id
 n8mr12978014ejh.236.1599314236978; 
 Sat, 05 Sep 2020 06:57:16 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:a7fb:e200:e1b1:2430:dffc:e425])
 by smtp.gmail.com with ESMTPSA id f13sm9142992ejb.81.2020.09.05.06.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2020 06:57:16 -0700 (PDT)
Date: Sat, 5 Sep 2020 15:57:14 +0200
From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To: Stafford Horne <shorne@gmail.com>
Message-ID: <20200905135714.74bsr5h423k7guw4@ltop.local>
References: <20200905131935.972386-1-shorne@gmail.com>
 <20200905131935.972386-4-shorne@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200905131935.972386-4-shorne@gmail.com>
X-Mailman-Approved-At: Sat, 12 Sep 2020 23:22:07 +0200
Subject: Re: [OpenRISC] [PATCH v2 3/3] openrisc: Fix issue with get_user for
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
Cc: Jonas Bonn <jonas@southpole.se>, LKML <linux-kernel@vger.kernel.org>,
 openrisc@lists.librecores.org, Greentime Hu <green.hu@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU2F0LCBTZXAgMDUsIDIwMjAgYXQgMTA6MTk6MzVQTSArMDkwMCwgU3RhZmZvcmQgSG9ybmUg
d3JvdGU6CgpIaSwKClRoZSBjaGFuZ2UgZm9yIDY0LWJpdCBnZXRfdXNlcigpIGxvb2tzIGdvb2Qg
dG8gbWUuCkJ1dCBJIHdvbmRlciwgZ2l2ZW4gdGhhdCBvcGVucmlzYyBpcyBiaWctZW5kaWFuLCB3
aGF0IHdpbGwgaGFwcGVuCnlvdSBoYXZlIHRoZSBvcHBvc2l0ZSBzaXR1YXRpb246Cgl1MzIgKnB0
cjsKCXU2NCB2YWw7CgkuLi4KCWdldF91c2VyKHZhbCwgcHRyKTsKCldvbid0IHlvdSBlbmQgd2l0
aCB0aGUgdmFsdWUgaW4gdGhlIG1vc3Qgc2lnbmlmaWNhbnQgcGFydCBvZgp0aGUgcmVnaXN0ZXIg
cGFpcj8KCi0tIEx1YwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcK
aHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
