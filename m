Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 0A78943672A
	for <lists+openrisc@lfdr.de>; Thu, 21 Oct 2021 18:02:09 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 819E024194;
	Thu, 21 Oct 2021 18:02:08 +0200 (CEST)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mail.librecores.org (Postfix) with ESMTPS id 2BBB120BDE
 for <openrisc@lists.librecores.org>; Thu, 21 Oct 2021 18:02:07 +0200 (CEST)
Received: by mail-pg1-f174.google.com with SMTP id j190so773823pgd.0
 for <openrisc@lists.librecores.org>; Thu, 21 Oct 2021 09:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=aQXnGSvGwqVsJ8nP8kr+l4vStpxJv5nNjrJiBNRwZ+M=;
 b=jhcXD7uXJAO9grkMAifc99WARslOnjDNWHarUyzrdB0UVxuWb42YrgWWVyzhkJtx6N
 FU3tSvW3JDgvVfLXOyckE3uKTYO/9/PIzybZXNdE8CPK20RMM9jQWkTlCEogsh811zdS
 B6u+g+Ze6cDw7Y18Te1VGsUkKIkZoT7CpHEhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aQXnGSvGwqVsJ8nP8kr+l4vStpxJv5nNjrJiBNRwZ+M=;
 b=feaub+gjUaiLrKtWKJpJtXXokSWKjYuX1DZQmRb0TGnSUAKZxliPCUz/sKFkIXXyF0
 BVoUxlq3myNw35dFyiR665qIi7upaZ/FBh8mpDJgxtWKICBIRnqrQiyxxD/9KpwBB1Rb
 b3rFEPbv8B6X8pgI5VrYcF7C32J0j3a7T2YrGWPNOCGguSn4XZarZ/aO8t7ypfE9dluT
 /HVjZyGuqjLLAsA6JeIVzjYZho30GPEv++BUZw+H7eUljJo048AfgWfqu43ZB2mIhKnA
 kOcLtWz2v+4rq45SN3NLUYd8ICj6W2XN69hjpTkNdxffao3doU5GBzLfHumthUdeCW+z
 pCjA==
X-Gm-Message-State: AOAM533hcVhegG1g0jcHOrBaeeicF9KnbJXo88pRJQVQcCksAOGxWeDi
 f7hHuMypySfT3p5RqiLSFxYD3g==
X-Google-Smtp-Source: ABdhPJx1yhwpe/xDEMSeojXmDAbO0TukzgYU8mc+AUTj9ZKyfVJv0GgYxvFuub4zNr1a2522ltR6+g==
X-Received: by 2002:a63:731a:: with SMTP id o26mr5153446pgc.248.1634832125531; 
 Thu, 21 Oct 2021 09:02:05 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id i2sm6595890pfa.34.2021.10.21.09.02.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 09:02:05 -0700 (PDT)
Date: Thu, 21 Oct 2021 09:02:04 -0700
From: Kees Cook <keescook@chromium.org>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Message-ID: <202110210858.41719190D2@keescook>
References: <87y26nmwkb.fsf@disp2133>
 <20211020174406.17889-2-ebiederm@xmission.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211020174406.17889-2-ebiederm@xmission.com>
Subject: Re: [OpenRISC] [PATCH 02/20] exit: Remove calls of do_exit after
 noreturn versions of die
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
Cc: Rich Felker <dalias@libc.org>, linux-xtensa@linux-xtensa.org,
 Oleg Nesterov <oleg@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-sh@vger.kernel.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 Jonas Bonn <jonas@southpole.se>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, openrisc@lists.librecores.org,
 Al Viro <viro@zeniv.linux.org.uk>, Chris Zankel <chris@zankel.net>,
 Nick Hu <nickhu@andestech.com>, linux-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBPY3QgMjAsIDIwMjEgYXQgMTI6NDM6NDhQTSAtMDUwMCwgRXJpYyBXLiBCaWVkZXJt
YW4gd3JvdGU6Cj4gT24gbmRzMzIsIG9wZW5yaXNjLCBzMzkwLCBzaCwgYW5kIHh0ZW5zYSB0aGUg
ZnVuY3Rpb24gZGllIG5ldmVyCj4gcmV0dXJucy4gIE1hcmsgZGllIF9fbm9yZXR1cm4gc28gdGhh
dCBubyBvbmUgZXhwZWN0cyBkaWUgdG8gcmV0dXJuLgo+IFJlbW92ZSB0aGUgZG9fZXhpdCBjYWxs
cyBhZnRlciBkaWUgYXMgdGhleSB3aWxsIG5ldmVyIGJlIHJlYWNoZWQuCgpNYXliZSBub3RlIHRo
YXQgdGhlICJidXN0X3NwaW5sb2NrcyIgY2FsbHMgYXJlIGFsc28gcmVkdW5kYW50LCBzaW5jZQp0
aGV5J3JlIGluIGRpZSgpLiBJIG5vdGUgdGhhdCBpcyBhICJtaXNtYXRjaCIgYmV0d2VlbiB0aGUg
ZG9fa2lsbCgpCmluIGRpZSgpIChTSUdTRUdWKSBhbmQgYWZ0ZXIgZGllKCkgKFNJR0tJTEwpLiBU
aGlzIHBhdGNoIG1ha2VzIG5vCmJlaGF2aW9yYWwgY2hhbmdlICh0aGUgZmlyc3QgY2FsbGVyIHdv
dWxkICJ3aW4iKSwgYnV0IEkgdGhvdWdodCBJJ2Qgbm90ZQppdCBpbiBjYXNlIHNvbWUgYXJjaGl0
ZWN0dXJlIHdvdWxkIHByZWZlciBhIGRpZmZlcmVudCBzaWduYWwuCgpSZXZpZXdlZC1ieTogS2Vl
cyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+CgotS2VlcwoKLS0gCktlZXMgQ29vawpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWls
aW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJy
ZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
