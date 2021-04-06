Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E5745355DA4
	for <lists+openrisc@lfdr.de>; Tue,  6 Apr 2021 23:08:36 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 0F29E20F4B;
	Tue,  6 Apr 2021 23:08:36 +0200 (CEST)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mail.librecores.org (Postfix) with ESMTPS id 880B620689
 for <openrisc@lists.librecores.org>; Tue,  6 Apr 2021 10:57:03 +0200 (CEST)
Received: by mail-pf1-f173.google.com with SMTP id m11so7308950pfc.11
 for <openrisc@lists.librecores.org>; Tue, 06 Apr 2021 01:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uZUmKkwLM2oSaojuTn4DZClVwuluaLe6PZbLvPR8s3c=;
 b=WpscpUN2s8UcwB80GPNIwVjusSFrsDNimXL3met/I3dY8jN7f/vDKn6GC3ZCHm0gvJ
 X0eSOYRoV3NrPws6+e881tyauDFR2DHTYRV6VDqRR6VreNS5QLy+z6a529MqZm6XO64F
 lmZaxZTY8DzlbI/lOZk7FXot9YJCSbwMtxI73bs8JqKe+1fcadudbIefJQn+3yvE5QwO
 v51LL2yCRBNsZZY7W/VBJY2QK9Zy7gCpGu0LKVY+ttIhCbpKZSiKfm34rIQ6oN64mUjr
 ODCo1c/gMcffa6EZt3MRR1y4wMbMqMCvg55HnV7a22su7k7OVEgCuiZOOpr1Dun6mzcW
 ahtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uZUmKkwLM2oSaojuTn4DZClVwuluaLe6PZbLvPR8s3c=;
 b=YxJTy6r3neKGz5v43hCWPzq7IpHu1S2tyVMOTEvgE4atNA53xhnt9CjxDOqWr798Dd
 7dEUvRBERIIQlLW8zqiLUUKnXF5QMtd9p/xrchc4x3AwuvZoI5z7OGCMBM2FnM7uNRC4
 X1rLVWm8ku4wbvjcsm3W+C+nmoAdpJBdbCGIb6WA/6p06infMz0x4bCzoxg2uG/ItOYg
 asfGIqOjpcvePP58fV69C2N0OMwE06TbdbHqTkOmIwFVu9+fYGFHVe/csoq/R9iTMSIr
 rZPvcPucied3MRbg81shkDmH6WXCHpImy36SkLXUu0XzdrnYE2Fg4OTUmtyCqFCj0jWk
 9GuQ==
X-Gm-Message-State: AOAM532lxSOp3diEWH1vyHLldHHVGxR8VpZvdGGq4Ajrr8tid49eF/RQ
 jFU9HDHX+ZsilvJM8hXVmk0=
X-Google-Smtp-Source: ABdhPJyoX4fauwUz8/uRPC+PLrlDTqY/BbNhdRIQpb2w7mh6/qLvfq7K0aPB9a6PVbfbagmli9jcUQ==
X-Received: by 2002:a63:e903:: with SMTP id i3mr21319346pgh.374.1617699421963; 
 Tue, 06 Apr 2021 01:57:01 -0700 (PDT)
Received: from localhost (g139.124-45-193.ppp.wakwak.ne.jp. [124.45.193.139])
 by smtp.gmail.com with ESMTPSA id
 y15sm20720606pgi.31.2021.04.06.01.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 01:57:01 -0700 (PDT)
Date: Tue, 6 Apr 2021 17:56:59 +0900
From: Stafford Horne <shorne@gmail.com>
To: guoren@kernel.org
Message-ID: <20210406085659.GF3288043@lianli.shorne-pla.net>
References: <1617201040-83905-1-git-send-email-guoren@kernel.org>
 <1617201040-83905-7-git-send-email-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1617201040-83905-7-git-send-email-guoren@kernel.org>
X-Mailman-Approved-At: Tue, 06 Apr 2021 23:08:34 +0200
Subject: Re: [OpenRISC] [PATCH v6 6/9] openrisc: qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
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
Cc: linux-arch@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Guo Ren <guoren@linux.alibaba.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 openrisc@lists.librecores.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Jonas Bonn <jonas@southpole.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBNYXIgMzEsIDIwMjEgYXQgMDI6MzA6MzdQTSArMDAwMCwgZ3VvcmVuQGtlcm5lbC5v
cmcgd3JvdGU6Cj4gRnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+IAo+
IFdlIGRvbid0IGhhdmUgbmF0aXZlIGh3IHhjaGcxNiBpbnN0cnVjdGlvbiwgc28gbGV0IHFzcGlu
bG9jawo+IGdlbmVyaWMgY29kZSB0byBkZWFsIHdpdGggaXQuCj4gCj4gVXNpbmcgdGhlIGZ1bGwt
d29yZCBhdG9taWMgeGNoZyBpbnN0cnVjdGlvbnMgaW1wbGVtZW50IHhjaGcxNiBoYXMKPiB0aGUg
c2VtYW50aWMgcmlzayBmb3IgYXRvbWljIG9wZXJhdGlvbnMuCj4gCj4gVGhpcyBwYXRjaCBjYW5j
ZWxzIHRoZSBkZXBlbmRlbmN5IG9mIG9uIHFzcGlubG9jayBnZW5lcmljIGNvZGUgb24KPiBhcmNo
aXRlY3R1cmUncyB4Y2hnMTYuCj4gCj4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGxp
bnV4LmFsaWJhYmEuY29tPgo+IENjOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IENj
OiBKb25hcyBCb25uIDxqb25hc0Bzb3V0aHBvbGUuc2U+Cj4gQ2M6IFN0ZWZhbiBLcmlzdGlhbnNz
b24gPHN0ZWZhbi5rcmlzdGlhbnNzb25Ac2F1bmFsYWh0aS5maT4KPiBDYzogU3RhZmZvcmQgSG9y
bmUgPHNob3JuZUBnbWFpbC5jb20+Cj4gQ2M6IG9wZW5yaXNjQGxpc3RzLmxpYnJlY29yZXMub3Jn
CgpBY2tlZC1ieTogU3RhZmZvcmQgSG9ybmUgPHNob3JuZUBnbWFpbC5jb20+Cgo+IC0tLQo+ICBh
cmNoL29wZW5yaXNjL0tjb25maWcgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJpc2MvS2NvbmZpZyBiL2FyY2gvb3BlbnJp
c2MvS2NvbmZpZwo+IGluZGV4IDU5MWFjYzU5OTBkYy4uYjI5OWU0MDk0MjlmIDEwMDY0NAo+IC0t
LSBhL2FyY2gvb3BlbnJpc2MvS2NvbmZpZwo+ICsrKyBiL2FyY2gvb3BlbnJpc2MvS2NvbmZpZwo+
IEBAIC0zMyw2ICszMyw3IEBAIGNvbmZpZyBPUEVOUklTQwo+ICAJc2VsZWN0IE9SMUtfUElDCj4g
IAlzZWxlY3QgQ1BVX05PX0VGRklDSUVOVF9GRlMgaWYgIU9QRU5SSVNDX0hBVkVfSU5TVF9GRjEK
PiAgCXNlbGVjdCBBUkNIX1VTRV9RVUVVRURfU1BJTkxPQ0tTCj4gKwlzZWxlY3QgQVJDSF9VU0Vf
UVVFVUVEX1NQSU5MT0NLU19YQ0hHMzIKPiAgCXNlbGVjdCBBUkNIX1VTRV9RVUVVRURfUldMT0NL
Uwo+ICAJc2VsZWN0IE9NUElDIGlmIFNNUAo+ICAJc2VsZWN0IEFSQ0hfV0FOVF9GUkFNRV9QT0lO
VEVSUwo+IC0tIAo+IDIuMTcuMQo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVj
b3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
