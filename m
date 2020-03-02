Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 3F1C91756A8
	for <lists+openrisc@lfdr.de>; Mon,  2 Mar 2020 10:14:28 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 925D7209A6;
	Mon,  2 Mar 2020 10:14:27 +0100 (CET)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by mail.librecores.org (Postfix) with ESMTPS id BD5A52017F
 for <openrisc@lists.librecores.org>; Mon,  2 Mar 2020 10:14:25 +0100 (CET)
Received: by mail-pf1-f193.google.com with SMTP id y5so5257097pfb.11
 for <openrisc@lists.librecores.org>; Mon, 02 Mar 2020 01:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=jbYJ7iAwXtw3qHGCUh262XjdCqjxTMtijdsn55mpS/k=;
 b=H3+4zIV9HKnladukMOmDiZ35Gh/ZxJkO+dJiwuEemnKI1pSCuFwnbo5kTUHGcNkzja
 iWny9D9Hw1lNAz+K343wDuZayoQ1sd66CbkM4/1TDx8z7vk1tSDrbZbKt0MmipVWuycZ
 lT35C/oqjozLxSUo1k3yLoaexycalsdjq8PHtm8/Eu5IOyv6yFRoIRbX0fjFnk/NfMk2
 2dzsiZoF8CjAVBsRhiYXGQW6KI6xN+IFKt1n6E6vdYHLAkZccDAcC4xIS3mh9Wj5eLQz
 lfykrvVM/Q6Sq3z1IN9LPtxfSw/OpW9J1fDy1+hTWM/+bEPDbpOwuqQCu+zPeDZ1Ei3Y
 FExg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jbYJ7iAwXtw3qHGCUh262XjdCqjxTMtijdsn55mpS/k=;
 b=CakwkKazeA3C4nnRXiV4fcPA7Rxv968h5q2+kPwM/xTanpXV32SNC4KszclO2jbHB1
 lL2SDkVVD22KB702NeAB00pUrhBfuS2BJVHef+bCiT5J1bu/droOL+ge1i3g8bbuRgzd
 6DqsL9asBLLDc3ss4Eu0pfYQxJTq1ZG9EdcLxrOuuRmwYSE6b97nupj0XGhmi5+dWvUX
 +P8AogC63X45vlVbBJAW7fHUIiGZWQt3X0/YUPhy/QatT+2/cIua6Bu1/sd+7jNAg6dw
 z9uA8Im8cCHuIFTpUfoDGgQwBkWXtgCiJIUmBZ8+MtwFOw0TE3uE4R7tdcABQl9eVp2l
 y6/w==
X-Gm-Message-State: APjAAAV6pQMC9wnWEE7SyIypv3lw7kQONm73y9F2iO8vl13DiO7jrHkk
 NlHjkFIsZJsPC4J4IRaZvpY=
X-Google-Smtp-Source: APXvYqymaBUya5ytmvTtp0PboZnQb4U/lUzOvBaqSiMlQfHTNZhmekB97K4JS5Z9cfet6TyDGqGnrA==
X-Received: by 2002:a63:131f:: with SMTP id i31mr19023174pgl.101.1583140464141; 
 Mon, 02 Mar 2020 01:14:24 -0800 (PST)
Received: from localhost (g183.222-224-185.ppp.wakwak.ne.jp. [222.224.185.183])
 by smtp.gmail.com with ESMTPSA id z19sm3079764pfn.121.2020.03.02.01.14.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 01:14:23 -0800 (PST)
Date: Mon, 2 Mar 2020 18:14:20 +0900
From: Stafford Horne <shorne@gmail.com>
To: Christian Brauner <christian.brauner@ubuntu.com>
Message-ID: <20200302091420.GJ7926@lianli.shorne-pla.net>
References: <20200301213851.8096-1-shorne@gmail.com>
 <20200302074411.p56ctghzllrijrqz@wittgenstein>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200302074411.p56ctghzllrijrqz@wittgenstein>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [OpenRISC] [PATCH v2 0/3] OpenRISC clone3 support
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
Cc: Openrisc <openrisc@lists.librecores.org>,
 LKML <linux-kernel@vger.kernel.org>, Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBNYXIgMDIsIDIwMjAgYXQgMDg6NDQ6MTFBTSArMDEwMCwgQ2hyaXN0aWFuIEJyYXVu
ZXIgd3JvdGU6Cj4gT24gTW9uLCBNYXIgMDIsIDIwMjAgYXQgMDY6Mzg6NDhBTSArMDkwMCwgU3Rh
ZmZvcmQgSG9ybmUgd3JvdGU6Cj4gPiBUaGlzIHNlcmllcyBmaXhlcyB0aGUgY2xvbmUzIG5vdCBp
bXBsZW1lbnRlZCB3YXJuaW5ncyBJIGhhdmUgYmVlbiBzZWVpbmcKPiA+IGR1cmluZyByZWNlbnQg
YnVpbGRzLiAgSXQgd2FzIGEgc2ltcGxlIGNhc2Ugb2YgaW1wbGVtZW50aW5nIGNvcHlfdGhyZWFk
X3Rscwo+ID4gYW5kIHR1cm5pbmcgb24gY2xvbmUzIGdlbmVyaWMgc3VwcG9ydC4gIFRlc3Rpbmcg
c2hvd3Mgbm8gaXNzdWVzLgo+ID4gCj4gPiBDaGFuZ2VzIHNpbmNlIHYxOgo+ID4gCj4gPiAgLSBG
aXggc29tZSBjb21tZW50cyBwb2ludGVkIG91dCBpbiByZXZpZXdzCj4gPiAgLSBBZGQgQWNrcyB0
byAyLzMgYW5kIDMvMyBmcm9tIENocmlzdGlhbiBCcmF1bmVyCj4gCj4gRXhjZWxsZW50LiBJIGFj
a2VkIGFsbCBpbmRpdmlkdWFsIHBhdGNoZXMgbm93LiBCdXQgdGhlIHdob2xlIHNlcmllczoKPiAK
PiBBY2tlZC1ieTogQ2hyaXN0aWFuIEJyYXVuZXIgPGNocmlzdGlhbi5icmF1bmVyQHVidW50dS5j
b20+CgpUaGFua3MgYSBsb3QgZm9yIHRoZSByZXZpZXcuCgotU3RhZmZvcmQKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0
Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5v
cmcvbGlzdGluZm8vb3BlbnJpc2MK
