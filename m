Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 11EF5177207
	for <lists+openrisc@lfdr.de>; Tue,  3 Mar 2020 10:09:30 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 09BB6206AB;
	Tue,  3 Mar 2020 10:09:27 +0100 (CET)
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by mail.librecores.org (Postfix) with ESMTPS id 0C8992017F
 for <openrisc@lists.librecores.org>; Mon,  2 Mar 2020 10:16:41 +0100 (CET)
Received: by mail-pj1-f68.google.com with SMTP id l8so649530pjy.1
 for <openrisc@lists.librecores.org>; Mon, 02 Mar 2020 01:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ndch3h4URTloyii1gSOs74b+yGmOg265tPn81wcSc2E=;
 b=vL0VVsuaaoEsbUHMmRXA6lfSc7FopuGlr36i0AXnSjtq/HXbT/8a6v2h2NFzs7jmga
 DQNmZYmIN2qjCn4v4UprQ1hhz87Li5nLtHphVK3d096BA9X8u9jvsl+X1E12z9uDygY0
 tDZeDZt7dIcEa5iu/48Zcj9kqwt/Afy8lQ2vPLl7eyAB1mcmVl07n5BrFg1XH9SvUM4V
 cODnqdSWYkDAaS9/SYbnZvwG7/Jwq9o5rMX/rJPp73ybLwKm3V2HM/o4EREpet7DoAG4
 6ELWoIXedXfCwuV2u4nSq8sFAeFOZrb5Dfj1fao4CFdutyOVFG77o0e8I3Wc9gSbNNju
 9spQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ndch3h4URTloyii1gSOs74b+yGmOg265tPn81wcSc2E=;
 b=ltRBuNQUHhaArK8leeIRk87dqz4uoeYJ5kA73aXij7xW1tGZWN0Cu84bTyIVfgRwYd
 027J2sbeLK9YFdUhjcV2OeIRH1Shc/ZpKQsOnBWQUm6jynXNPFFumqd1PdVUJikkyov4
 N/pMpUeeqO1ER0L4cTBK6+rHGh3ZGjyTzfzBs0lytOfR4cf2FqNcEhWsO0Bo7NqqGxcM
 wZ70ksKpDGe1OoRS/FrB2E1j4xeSE5FWzIjeYRu+vcqOQhji/Qsf1GGFvL9yZ/qIrUx4
 BNYdZK7NAeAC9sIvcipsBPmHgQoObJFlceH4d54uhfcwdeJ5P+nizTPEL5gC0zMCDD4T
 bD8Q==
X-Gm-Message-State: APjAAAVzqjsAP4FwBgq5Lh5eve2AYNKiSfxI2NeV9cspVhyBGsGK1zgN
 6yg4ASq26IzGMEijbgckmUc=
X-Google-Smtp-Source: APXvYqxYIsfqZ+2k8oz/ngUWeeMoVuDFCKNrgGHaEoCYv0tsPO+VuDwJwr+REUi3DbiXhJ5trOFulQ==
X-Received: by 2002:a17:902:8ec9:: with SMTP id
 x9mr17070699plo.182.1583140599577; 
 Mon, 02 Mar 2020 01:16:39 -0800 (PST)
Received: from localhost (g183.222-224-185.ppp.wakwak.ne.jp. [222.224.185.183])
 by smtp.gmail.com with ESMTPSA id p18sm21513722pjo.3.2020.03.02.01.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 01:16:38 -0800 (PST)
Date: Mon, 2 Mar 2020 18:16:35 +0900
From: Stafford Horne <shorne@gmail.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <20200302091635.GK7926@lianli.shorne-pla.net>
References: <1583114190-7678-1-git-send-email-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1583114190-7678-1-git-send-email-anshuman.khandual@arm.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Tue, 03 Mar 2020 10:09:23 +0100
Subject: Re: [OpenRISC] [PATCH] mm/special: Create generic fallbacks for
 pte_special() and pte_mkspecial()
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
Cc: linux-ia64@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-mm@kvack.org, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 Vincent Chen <deanbo422@gmail.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, Paul Burton <paulburton@kernel.org>,
 Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 linux-parisc@vger.kernel.org, linux-arch@vger.kernel.org,
 Matt Turner <mattst88@gmail.com>, Sam Creasey <sammy@sammy.net>,
 Fenghua Yu <fenghua.yu@intel.com>, Jeff Dike <jdike@addtoit.com>,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Greentime Hu <green.hu@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>,
 Brian Cain <bcain@codeaurora.org>, Nick Hu <nickhu@andestech.com>,
 Max Filippov <jcmvbkbc@gmail.com>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-alpha@vger.kernel.org,
 nios2-dev@lists.rocketboards.org, Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBNYXIgMDIsIDIwMjAgYXQgMDc6MjY6MzBBTSArMDUzMCwgQW5zaHVtYW4gS2hhbmR1
YWwgd3JvdGU6Cgo+IGRpZmYgLS1naXQgYS9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL3BndGFi
bGUuaCBiL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gaW5kZXggMjQ4ZDIy
ZDhmYWE3Li43ZjNmYjljZWIwODMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9vcGVucmlzYy9pbmNsdWRl
L2FzbS9wZ3RhYmxlLmgKPiArKysgYi9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL3BndGFibGUu
aAo+IEBAIC0yMzYsOCArMjM2LDYgQEAgc3RhdGljIGlubGluZSBpbnQgcHRlX3dyaXRlKHB0ZV90
IHB0ZSkgeyByZXR1cm4gcHRlX3ZhbChwdGUpICYgX1BBR0VfV1JJVEU7IH0KPiAgc3RhdGljIGlu
bGluZSBpbnQgcHRlX2V4ZWMocHRlX3QgcHRlKSAgeyByZXR1cm4gcHRlX3ZhbChwdGUpICYgX1BB
R0VfRVhFQzsgfQo+ICBzdGF0aWMgaW5saW5lIGludCBwdGVfZGlydHkocHRlX3QgcHRlKSB7IHJl
dHVybiBwdGVfdmFsKHB0ZSkgJiBfUEFHRV9ESVJUWTsgfQo+ICBzdGF0aWMgaW5saW5lIGludCBw
dGVfeW91bmcocHRlX3QgcHRlKSB7IHJldHVybiBwdGVfdmFsKHB0ZSkgJiBfUEFHRV9BQ0NFU1NF
RDsgfQo+IC1zdGF0aWMgaW5saW5lIGludCBwdGVfc3BlY2lhbChwdGVfdCBwdGUpIHsgcmV0dXJu
IDA7IH0KPiAtc3RhdGljIGlubGluZSBwdGVfdCBwdGVfbWtzcGVjaWFsKHB0ZV90IHB0ZSkgeyBy
ZXR1cm4gcHRlOyB9Cj4gIAo+ICBzdGF0aWMgaW5saW5lIHB0ZV90IHB0ZV93cnByb3RlY3QocHRl
X3QgcHRlKQo+ICB7CgpGb3Igb3BlbnJpc2MgYml0czoKCkFja2VkLWJ5OiBTdGFmZm9yZCBIb3Ju
ZSA8c2hvcm5lQGdtYWlsLmNvbT4KIApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVj
b3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
