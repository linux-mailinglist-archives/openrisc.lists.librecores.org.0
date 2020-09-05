Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 4720A25EB01
	for <lists+openrisc@lfdr.de>; Sat,  5 Sep 2020 23:34:16 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D491C20AF7;
	Sat,  5 Sep 2020 23:34:15 +0200 (CEST)
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by mail.librecores.org (Postfix) with ESMTPS id 386CF20AF7
 for <openrisc@lists.librecores.org>; Sat,  5 Sep 2020 23:34:13 +0200 (CEST)
Received: by mail-pj1-f68.google.com with SMTP id o16so4808413pjr.2
 for <openrisc@lists.librecores.org>; Sat, 05 Sep 2020 14:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Qk4slgfid1yPByHqYlwQFEuSRddQf9kuyAkrPfErQjg=;
 b=WlVgjmdVfdyU8pU/+PGGtpMTnKySdx4q36fU9wgecVCQ9lEg6XpJcuUeleFuJ+JRgV
 3uzS0+4jHXBXokhpPV2+w+0Ifdop36SjFUIZE8k+SscsyUrTI5jYGHTnY2uJmdWuP8Kb
 bMuTPgC1guHZTOFgZXeHGuDdt1C57tdioBt2kIbh1vDhw0uZCvQFKRhqPh+dpZd9RYK5
 EES3GokZZ471TqFAJpBCYB0O1MMgkk0tOrTUHBMN+qrZKapFBO/aKX7uinmSOW/vpbV5
 wo/rr264kNHCxeT2ML5BzhnBKIgm7d9vaGzuPeJ5yM5ft488R5lnL8FbbSNWi1Ed9OiL
 3tkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Qk4slgfid1yPByHqYlwQFEuSRddQf9kuyAkrPfErQjg=;
 b=FVwYCfX2dDoyByHQW/vJuV4lTuC+CTySECOYfTUoRYePMky7764Mf6wx+BNS6K+9P0
 knpBRQPt9MXwEYMa4fctDs4Wq1x0/DEVejUkcp6YYlpLaiwg3SE5Bawkaor5CJktl1p0
 e8XgEh2Ec3GAltWUeqNYxTupFMJZ1971oTx5HJL86ZEtjBD+4G6EhokzrwDwXSA+NbrV
 V2h/zj69AilhTBHX1ZEoUyrVtRianvtxGv+riDBh9tHHqxf2xFMP8/6YORqocysF2VZh
 uhPReNA7Z4hdFDZpOrYkL2wyWg+zre7VoZZTsfzSFi1wUyZ0r9tuEdryNbZAY/4jJwa6
 3JIw==
X-Gm-Message-State: AOAM533ClRSuhEhFbd7VF6pSH/pPsuGCOgUvlvHDRYIxNYzNK4nPhJPw
 WNPjAgphymlzUHT0IXv5peA=
X-Google-Smtp-Source: ABdhPJzKUHHA3feATlv6jsm69qf4LKSDklMjXEE1Q86SIik3kweQMIipte0rN6+WJlslTfsZHh54JQ==
X-Received: by 2002:a17:90a:f198:: with SMTP id
 bv24mr14533985pjb.117.1599341651203; 
 Sat, 05 Sep 2020 14:34:11 -0700 (PDT)
Received: from localhost (g223.115-65-55.ppp.wakwak.ne.jp. [115.65.55.223])
 by smtp.gmail.com with ESMTPSA id u138sm10713710pfc.218.2020.09.05.14.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2020 14:34:10 -0700 (PDT)
Date: Sun, 6 Sep 2020 06:34:08 +0900
From: Stafford Horne <shorne@gmail.com>
To: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Message-ID: <20200905213408.GI3562056@lianli.shorne-pla.net>
References: <20200905131935.972386-1-shorne@gmail.com>
 <20200905131935.972386-4-shorne@gmail.com>
 <20200905135714.74bsr5h423k7guw4@ltop.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200905135714.74bsr5h423k7guw4@ltop.local>
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

T24gU2F0LCBTZXAgMDUsIDIwMjAgYXQgMDM6NTc6MTRQTSArMDIwMCwgTHVjIFZhbiBPb3N0ZW5y
eWNrIHdyb3RlOgo+IE9uIFNhdCwgU2VwIDA1LCAyMDIwIGF0IDEwOjE5OjM1UE0gKzA5MDAsIFN0
YWZmb3JkIEhvcm5lIHdyb3RlOgo+IAo+IEhpLAo+IAo+IFRoZSBjaGFuZ2UgZm9yIDY0LWJpdCBn
ZXRfdXNlcigpIGxvb2tzIGdvb2QgdG8gbWUuCj4gQnV0IEkgd29uZGVyLCBnaXZlbiB0aGF0IG9w
ZW5yaXNjIGlzIGJpZy1lbmRpYW4sIHdoYXQgd2lsbCBoYXBwZW4KPiB5b3UgaGF2ZSB0aGUgb3Bw
b3NpdGUgc2l0dWF0aW9uOgo+IAl1MzIgKnB0cjsKPiAJdTY0IHZhbDsKPiAJLi4uCj4gCWdldF91
c2VyKHZhbCwgcHRyKTsKPiAKPiBXb24ndCB5b3UgZW5kIHdpdGggdGhlIHZhbHVlIGluIHRoZSBt
b3N0IHNpZ25pZmljYW50IHBhcnQgb2YKPiB0aGUgcmVnaXN0ZXIgcGFpcj8KCkhpIEx1YywKClRo
ZSBnZXRfdXNlciBmdW5jdGlvbiB1c2VzIHRoZSBzaXplIG9mIHRoZSBwdHIgdG8gZGV0ZXJtaW5l
IGhvdyB0byBkbyB0aGUgbG9hZCAsCnNvIHRoaXMgY2FzZSB3b3VsZCBub3QgdXNlIHRoZSA2NC1i
aXQgcGFpciByZWdpc3RlciBsb2dpYy4gIEkgdGhpbmsgaXQgc2hvdWxkIGJlCm9rLCB0aGUgZW5k
IHJlc3VsdCB3b3VsZCBiZSB0aGUgc2FtZSBhcyBjIGNvZGU6CgogIHZhciA9ICpwdHI7CgotU3Rh
ZmZvcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3Bl
blJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8v
bGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
