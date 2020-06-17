Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id DB6171FC994
	for <lists+openrisc@lfdr.de>; Wed, 17 Jun 2020 11:13:19 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8564920CCA;
	Wed, 17 Jun 2020 11:13:19 +0200 (CEST)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by mail.librecores.org (Postfix) with ESMTPS id 65AEE20CC8
 for <openrisc@lists.librecores.org>; Wed, 17 Jun 2020 11:13:17 +0200 (CEST)
Received: by mail-pg1-f196.google.com with SMTP id l63so943015pge.12
 for <openrisc@lists.librecores.org>; Wed, 17 Jun 2020 02:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gAYnBirOibvZD28fzMVr6eBnxdlYq8UdtZIty2eARKQ=;
 b=VYkh1yeYhdUyCPucPOu10xX/RKtBH0OSbLxEkVY0rPHTbUoZPH1tu6z9D8vK77lnrs
 xzmDgReTiopsY74MH6RVw4jFjP9YNfHQfRQSy1hKWBkgcehJ3w/R3jqEytluA0GHDTpy
 BGlaL9ruS5pzKTGwFKMT8P371xU11hMLjExyvTlGpNI62ZQGUsd78WF1qNLs5/oqq6MG
 9YJTqoZ8A4apRTGhguTFrk4djlWXP8LbJj1UE176VAMiYRFCrslbgwz6C3lnIcp7u276
 YLNIpxI/bo8UKatx1lq9/dIqwjwXjsStR3otuhPw4gH0/ql3JfzNLiDMlleY00DobyGk
 bTAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gAYnBirOibvZD28fzMVr6eBnxdlYq8UdtZIty2eARKQ=;
 b=mgobmjgERY2te1ooLswjs0gVUliqiUusTY0hwWwHUkcFfrka2BgmZkOzAOa76GsmR1
 y60jGHyQ8vYIOAkFl3aqPA1hecyv8yAQuExJUayqJhBmUqEIImeuYzwk2hymKRHQbZoV
 F2E9+HSz3CLTqy+vlfCNH5YnqajccGI28KyxhSaRy7p5TCUW/teG8YIHyQIGfIEQ5ADB
 X5HGM7AkXJaR0DR1k/gB5Ut1hCweK+COVm4as3L9YBxIzA3fjpwK/lFdrFOpg6/bmC7E
 mt6wMHl6yZ6ALXBQuALZseLZvJ9YR3ocY0ebK1Ip40TUcah1EYn5+HpYOu/zYK1A7j3+
 TEqg==
X-Gm-Message-State: AOAM531qm3twUD0lWhjorXkegDyASibRinKOJ54Nnpn66M+yjqoE+326
 jTpJRWO+6etaygLkl+siVCE=
X-Google-Smtp-Source: ABdhPJyzAWj60tHMNwPcSwVmov5Jsn9l6pLvEoPWpuIG91qGd5fyC/dG62cHCRWBFY6zC68t6eD5kA==
X-Received: by 2002:a63:d848:: with SMTP id k8mr4974628pgj.82.1592385195558;
 Wed, 17 Jun 2020 02:13:15 -0700 (PDT)
Received: from localhost (g228.115-65-196.ppp.wakwak.ne.jp. [115.65.196.228])
 by smtp.gmail.com with ESMTPSA id
 b191sm17253146pga.13.2020.06.17.02.13.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 02:13:14 -0700 (PDT)
Date: Wed, 17 Jun 2020 18:13:08 +0900
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Message-ID: <20200617091308.GD1401039@lianli.shorne-pla.net>
References: <20200617090702.1684812-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200617090702.1684812-1-shorne@gmail.com>
Subject: Re: [OpenRISC] [PATCH] openrisc: Fix oops caused when dumping stack
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
Cc: Jonas Bonn <jonas@southpole.se>, openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBKdW4gMTcsIDIwMjAgYXQgMDY6MDc6MDFQTSArMDkwMCwgU3RhZmZvcmQgSG9ybmUg
d3JvdGU6Cj4gV2hlbiBkdW1waW5nIGEgc3RhY2sgc2l3dGggJ2NhdCAvcHJvYy8xL3N0YWNrJyB0
aGUga2VybmVsIHdvdWxkIG9vcHMuCgpJIHdpbGwgZml4IHRoaXMgdHlwbywgcy9zaXd0aC93aXRo
Ly4KCi1TdGFmZm9yZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3Jn
Cmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
