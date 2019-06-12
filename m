Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2366243123
	for <lists+openrisc@lfdr.de>; Wed, 12 Jun 2019 22:53:38 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id AF07620286;
	Wed, 12 Jun 2019 22:53:37 +0200 (CEST)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by mail.librecores.org (Postfix) with ESMTPS id 1F61120274
 for <openrisc@lists.librecores.org>; Wed, 12 Jun 2019 22:53:36 +0200 (CEST)
Received: by mail-pg1-f196.google.com with SMTP id w34so9561028pga.12
 for <openrisc@lists.librecores.org>; Wed, 12 Jun 2019 13:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ALOrOdHFodXnDkGpOHiweVJIh3z1S1ydqOKW1/xxRWo=;
 b=nfZpLW77OwVvC9JLN3BkZ6PprRzY0TU3NyLG7VSDVZe4PlFGfYy3j2iwUk0O4qYIKR
 9Vrzc474ts/99/Wga3cK8yTKmoevKjlf08xl/I3CpYiScb0I3Yb3xAsKicyjATspODu1
 7ud0epAs0xyuH3R2iU2EwYv3nRyJCzhsD/52xFVqAEYXNngR8uoMy1mQ6KZYjiaSSvOa
 NCM23i72EA9hIWFGESqWKk2VU9opK6lz9gBHp58kYNU6hF9od3Uri8c1WNegTmSEpHWX
 axENT7Z1Wdf8x1FSrF3+M0sWPN4du16vqVD1dzFXpYeIej8Ghhqwn3npaPohZwbNLOJo
 0wug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ALOrOdHFodXnDkGpOHiweVJIh3z1S1ydqOKW1/xxRWo=;
 b=IMqz6xqPuMQ3nfyywON/d5lXwAtOBkOpU5aiWS+MrMP4BTKh/Fng2VNvHfVUkPNfts
 0nbtS1eWjpm5mUbvErBIFQjrFENBoiW2vAcoips2MgSA/Mwq8ge+93ma1Qx72oseVO1g
 xEBNH8ErzBtTyNd1tsWmUvGBYm7THfyEcJQLDIE1Yudx3WP41DxSbU2luUtZzHFFCGNg
 DnCNNy2pvRU0FVdCUI7Y4lmzjApr8gyqY4uWHv6aPoi6FZ5vtx4ajG/1PVLKLPjfMx0c
 +ehUlq7vopg1TTJEDQpDTMfHP/id4z99MFHHcTMWE7uNtXKZpi45bg4X3jykTGlL7SSe
 bBDw==
X-Gm-Message-State: APjAAAXyVZWzAsUvHdUbgs+5hcGFaEMpkQTVEjDfIzWa9F8Kmh1Gu6N/
 KA5JOxC6iMii6Lry+3ieaBg=
X-Google-Smtp-Source: APXvYqx7nDlmi302TPlVH4safb7RMlAxjptoear5HbquriHEC4GYto4+xv4mGTgy2RZN2UEmzix+9g==
X-Received: by 2002:aa7:8052:: with SMTP id y18mr56669281pfm.169.1560372814446; 
 Wed, 12 Jun 2019 13:53:34 -0700 (PDT)
Received: from localhost (g30.211-19-85.ppp.wakwak.ne.jp. [211.19.85.30])
 by smtp.gmail.com with ESMTPSA id a22sm448004pfn.173.2019.06.12.13.53.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 12 Jun 2019 13:53:33 -0700 (PDT)
Date: Thu, 13 Jun 2019 05:53:31 +0900
From: Stafford Horne <shorne@gmail.com>
To: "Frank Ch. Eigler" <fche@redhat.com>
Message-ID: <20190612205331.GG2358@lianli.shorne-pla.net>
References: <20190601072629.4070-1-shorne@gmail.com>
 <20190612131403.GE2358@lianli.shorne-pla.net>
 <20190612150440.GA31262@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190612150440.GA31262@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [OpenRISC] [PATCH 0/2] CGEN unordered fpu compares + fixes
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
Cc: cgen@sourceware.org, Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMTE6MDQ6NDBBTSAtMDQwMCwgRnJhbmsgQ2guIEVpZ2xl
ciB3cm90ZToKPiBIaSAtCj4gCj4gPiBEaWQgYW55b25lIGhhdmUgYSBjaGFuY2UgdG8gbG9vayBh
dCB0aGlzPyAgVGhlIGJpbnV0aWxzIHBhdGNoZXMgdGhhdCByZXF1aXJlCj4gPiB0aGlzIGFyZSBh
cHByb3ZlZCwgYnV0IEkgcmF0aGVyIG5vdCBjb21taXQgdGhlbSB1bmxlc3MgdGhpcyBJIGdldCBP
SyBvbiB0aGVzZQo+ID4gcGF0Y2hlcyBhbmQgcHVzaCB0aGVtLgo+IAo+IFRoZXNlIGFyZSBtZXJn
ZWQsIHRoYW5rcy4KClRoYW5rcywKCk5vdGUsIEkgbm90aWNlZCB0aGUgY2hhbmdlbG9nIHdhcyBu
b3QgdXBkYXRlZC4gIEkgdXN1YWxseSBkbyB0aGF0IGFzIHBhcnQgb2YgdGhlCmZpbmFsIHBoYXNl
IHVwIHB1c2hpbmcgdGhlIGNoYW5nZXMgdG8gZ2l0LgoKT3IgZGlkIHdlIHN0b3AgbWFpbnRhaW5p
bmcgdGhlIGNoYW5nZSBsb2cgd2hlbiBtb3ZpbmcgdG8gZ2l0IChJIHdvdWxkIGhhdmUgbm8KcHJv
YmxlbSB3aXRoIHRoYXQgbXlzZWxmIDspICk/CgotU3RhZmZvcmQKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5S
SVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlz
dGluZm8vb3BlbnJpc2MK
