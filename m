Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 6F1714AD0AF
	for <lists+openrisc@lfdr.de>; Tue,  8 Feb 2022 06:29:56 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1F6B8242E2;
	Tue,  8 Feb 2022 06:29:56 +0100 (CET)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mail.librecores.org (Postfix) with ESMTPS id 50E37242E2
 for <openrisc@lists.librecores.org>; Tue,  8 Feb 2022 06:29:53 +0100 (CET)
Received: by mail-pj1-f48.google.com with SMTP id v4so9253617pjh.2
 for <openrisc@lists.librecores.org>; Mon, 07 Feb 2022 21:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dlzrIFj91NwpxBiaHLZyR8n4A+siJQYBxRzBvCpxADs=;
 b=f1A+JdaZYaY9TWvyitqUfomLKyN2Ijxhve4UQQSJLaacJbCjx+wVi6Uy6nmNDiHUOd
 4YIXosi1ceigyNMn3eeyZiOzfsSSE3sx3UVK2AiQWY4bFM/q6eVbg+85DUzen4pL9caa
 klG6o9KLF9naFuXa62145JAo4nWYB3NMSotHVwpfZl8IUkQTwBdbdVXtu1T5qful/Wdn
 9uaI+J+q8rbBYdchz3mFcg/YuVXctbF04Hbzca1tzqpfQtzJ6ZAxft5j24r9uTA90gZJ
 VShW5M3qAsh1oFJqsD2zh1js6gdJIF+tZqMN7y10q7r4OCQypCn2BmFJGODtW9maz341
 mGzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dlzrIFj91NwpxBiaHLZyR8n4A+siJQYBxRzBvCpxADs=;
 b=LvhRFcwrsBq4G/jtbfQsYkFbxtZAVL+AraGSCXhfeGN6bfR43TLpdbLMQMKSSP01HZ
 PsR7jbIa4cvC9E+1pMKBTNumdUEYlz8erpeZjfBCzcDraCgFDKyznbo+SdUPPfAiTD7F
 vt8LIlxas/vQv1J2B+q0cHHeTN6KpurBGzD/XWbrMl3RwfsKfs58y/qChAqUS7LVeLjh
 zRPSk7M9MDh1AJoHSSjySvcE/7S7vrfaMyhotgxh4LziBf7uwBAwKh3QvVVQv7PEmX4a
 M/aFvL5dYp/VUyRwk5riZMNgcbk3lsumiiPqbsMdk3Sth/XQBJZqRP7G5mWcT1puxJjn
 B4Kg==
X-Gm-Message-State: AOAM531hOg7gRujvYACvN00GmN6QNF5f9zvWA2XiWTonnxMWWbMn+TgU
 Nb5xSVgLXe5AaEi1fMSN+Jw=
X-Google-Smtp-Source: ABdhPJxw4EpP+UL7eYdf9x7CQ7NfimeR1q/caB9hXrpzphn1gdnPcw2V2aK1jjeRagrMqvE8Vtfd4Q==
X-Received: by 2002:a17:903:4052:: with SMTP id
 n18mr3189182pla.124.1644298186718; 
 Mon, 07 Feb 2022 21:29:46 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id j8sm14806278pfc.48.2022.02.07.21.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 21:29:45 -0800 (PST)
Date: Tue, 8 Feb 2022 14:29:44 +0900
From: Stafford Horne <shorne@gmail.com>
To: David Laight <David.Laight@aculab.com>
Message-ID: <YgH/yC42RRbeJkiv@antec>
References: <20220206013648.3491865-1-shorne@gmail.com>
 <YgC/8ng5WX6Nt104@infradead.org>
 <3744dcbbf2874875b023548aacdd8b41@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3744dcbbf2874875b023548aacdd8b41@AcuMS.aculab.com>
Subject: Re: [OpenRISC] [PATCH] openrisc: remove CONFIG_SET_FS
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
Cc: Jonas Bonn <jonas@southpole.se>, Arnd Bergmann <arnd@arndb.de>,
 Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 'Christoph Hellwig' <hch@infradead.org>,
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBGZWIgMDcsIDIwMjIgYXQgMDU6MTQ6NDNQTSArMDAwMCwgRGF2aWQgTGFpZ2h0IHdy
b3RlOgo+IEZyb206IENocmlzdG9waCBIZWxsd2lnCj4gPiBTZW50OiAwNyBGZWJydWFyeSAyMDIy
IDA2OjQ1Cj4gPiAKPiA+IE9uIFN1biwgRmViIDA2LCAyMDIyIGF0IDEwOjM2OjQ3QU0gKzA5MDAs
IFN0YWZmb3JkIEhvcm5lIHdyb3RlOgo+ID4gPiBSZW1vdmUgdGhlIGFkZHJlc3Mgc3BhY2Ugb3Zl
cnJpZGUgQVBJIHNldF9mcygpIHVzZWQgZm9yIFVzZXIgTW9kZSBMaW51eC4KPiA+IAo+ID4gVGhp
cyBhaW4ndCBVTUwgOikKPiA+IAo+ID4gPiArCXJldHVybiBzaXplIDw9IFRBU0tfU0laRSAmJiBh
ZGRyIDw9IChUQVNLX1NJWkUgLSBzaXplKTsKPiA+IAo+ID4gTm8gbmVlZCBmb3IgdGhlIGlubmVy
IGJyYWNlcy4KPiAKPiBTaW5jZSBUQVNLX1NJWkUgaXMgYWN0dWFsbHkgYW4gYWRkcmVzcyB3b3Vs
ZG4ndCBiZSBiZXR0ZXIgdG8KPiBzd2FwIHRoZSBjb25kaXRpb24gYXJvdW5kIChpbiBldmVyeSBh
cmNoaXRlY3R1cmUpLgo+IAo+IAlyZXR1cm4gYWRkciA8PSBUQVNLX1NJWkUgJiYgc2l6ZSA8PSBU
QVNLX1NJWkUgLSBhZGRyOwoKSGkgRGF2aWQsCgpJIGxpa2UgdGhhdCwgaXQgaXMgbW9yZSBjbGVh
ciwgSSB3aWxsIHVwZGF0ZSB0byB0aGF0IGluIHYzLgoKLVN0YWZmb3JkCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApP
cGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3Jn
L2xpc3RpbmZvL29wZW5yaXNjCg==
