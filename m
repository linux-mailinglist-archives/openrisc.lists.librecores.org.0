Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 3B63D3661CB
	for <lists+openrisc@lfdr.de>; Tue, 20 Apr 2021 23:53:42 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 77D6E21347;
	Tue, 20 Apr 2021 23:53:41 +0200 (CEST)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mail.librecores.org (Postfix) with ESMTPS id B261B20603
 for <openrisc@lists.librecores.org>; Tue, 20 Apr 2021 23:53:38 +0200 (CEST)
Received: by mail-pf1-f180.google.com with SMTP id h15so8961077pfv.2
 for <openrisc@lists.librecores.org>; Tue, 20 Apr 2021 14:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cgqEWqmMp9OpxRp/r2KiSyW2613ynlxAh8XU7N+uMLs=;
 b=p2Aw+kqDeZgkk6iQugai3EoHfRebMSF6Rq6j7vJZWJX8tKd/g3Jdc2E97gdooEQ1Kc
 E+MVhdwOxMS3YbYJkHLzLq7bRqRE0V2UbjX3ebpmYAiHML1gPZ1LYKOaLpW3hcPd7Bpo
 iu82TfJeGP2/8oywxPwZLW5REv8NQnx7AmCLBHU+/0TMVIIU0Hy7aJkObUAf9BtZh2ks
 Psp1f6opE2mqSqLDLPF0iFA/3+U36EWRJcZD9TduZ8XJ1Lk33CE+AdU7El+ck+QZGNAI
 i/0gyq8afs7quh+nXG22xay4qxygv8hRMT+9bKAaBF2kjmYFl31xbvuT7+UdHZMdRaSR
 FuvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cgqEWqmMp9OpxRp/r2KiSyW2613ynlxAh8XU7N+uMLs=;
 b=rIpuHTfsGvKd3uQIxg4ZGlSj/lJVp99nZ8ernqn9tD9qHIpo+52DEKCt+aPeMIm7dY
 jBLoai2ioRt7dAllE9bbpLlYB23AJcAuiMoMzxtO/PpFLpsEjAt2RW/Sm3clXyXyfPgw
 Fwy3TLjxBWnMv/VJCN+ABHzH6veWUbilT66WnKjXC6cM8gcBdmD+sYwZBiNJQNcnS7G9
 vr+JGa2HflNplBaEu634fDxFCVSRJw96ksQ5bcj1vHgBrF8WnEmrSY0My3EXUP1ebH0o
 rft0RfGLA9NAGvRDWXdP+ruXCmO7OUSnfIlrbLsOeQALHiKN3WSyZC22ozY9xp6xcimV
 YTwg==
X-Gm-Message-State: AOAM532ztD3csPuJZ/qWCfbNNRpYgzj3KPPmv73vg7S74SSpsgBdlqDX
 zIz33pFMS/9SxXRxcDix2bQ=
X-Google-Smtp-Source: ABdhPJxuPaC+gdpy4416+SNc1iieNaKAxzU4RdzySV9hd0YKinWeg3xmih7SMjsgMm8yozZZICJWaQ==
X-Received: by 2002:a17:90b:3884:: with SMTP id
 mu4mr7197991pjb.165.1618955617134; 
 Tue, 20 Apr 2021 14:53:37 -0700 (PDT)
Received: from localhost (g191.124-44-145.ppp.wakwak.ne.jp. [124.44.145.191])
 by smtp.gmail.com with ESMTPSA id
 pc17sm78177pjb.19.2021.04.20.14.53.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 14:53:36 -0700 (PDT)
Date: Wed, 21 Apr 2021 06:53:34 +0900
From: Stafford Horne <shorne@gmail.com>
To: GNU Binutils <binutils@sourceware.org>
Message-ID: <20210420215334.GN3288043@lianli.shorne-pla.net>
References: <20210419000524.3625897-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210419000524.3625897-1-shorne@gmail.com>
Subject: Re: [OpenRISC] [PATCH 0/4] OpenRISC large binary fixes
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
Cc: giulio.benetti@benettiengineering.com,
 Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBBcHIgMTksIDIwMjEgYXQgMDk6MDU6MjBBTSArMDkwMCwgU3RhZmZvcmQgSG9ybmUg
d3JvdGU6Cj4gVGhlc2UgYXJlIHNldmVyYWwgZml4ZXMgdG8gT3BlblJJU0MgQkZEIHRvIGhhbmRs
ZSBpc3N1ZXMgbW9zdGx5IHJlbGF0ZWQgdG8KPiBsaW5raW5nIGxhcmdlIGZpbGVzLgo+IAo+IFRo
ZXJlIHdpbGwgYmUgYSBHQ0MgcGF0Y2ggdGhlbiBkZXBlbmRzIG9uIHRoaXMsIGEgbmV3IC1tY21v
ZGVsPWxhcmdlIGFyZ3VtZW50IGlzCj4gYWRkZWQgdG8gR0NDIHRvIGFsbG93IGNyZWF0aW5nIEdP
VCByZWxvY2F0aW9uIHZhbHVlcyBsYXJnZXIgdGhhbiA2NGsuCj4gCj4gVGhlIHNlcmllcyBmaXhl
cyAzIGlzc3VlczoKPiAKPiAgKiBQUiAyNzYyNCAtIEFzc2VydGlvbiBmYWlsdXJlIHdoZW4gZHlu
YW1pYyBzeW1vbCBpcyBsb2NhbGl6ZWQKPiAgKiBQUiAyMTQ2NCAtIEdPVCByZWxvY2F0aW9uIHRy
dW5jYXRpb24uCj4gICogUFIgMjc3NDYgLSBJc3N1ZSB3aXRoIHNpbGVudCBvdmVybG93cyBpbiBQ
TFQgY29kZS4KCkFzIGRpc2N1c3NlZCBvZmZsaW5lIHdpdGggR2l1bGlvLCB0aGlzIHNlcmllcyBk
b2VzIG5vdCBwcm9wZXJseSBmaXggdGhlIFBSIDIxNDY0Cmlzc3VlLiAgSSBoYXZlIGZpeGVkIHRo
ZSBpc3N1ZSBhbmQgd2lsbCBwb3N0IGEgdjIgYWZ0ZXIgSSBmaXggc29tZSBvdGhlciB0aGluZ3MK
dW5jb3ZlcmVkLi4uCgpJbnN0ZWFkIG9mIHVzaW5nIGxhcmdlIFBMVHMgd2hlbmV2ZXIgd2Ugc2Vl
IGdvdGhhKCkgcmVsb2NhdGlvbnMsIEkgd2lsbCB0cnkgdG8KZGV0ZWN0IHdoZW4gdGhlIHBsdF9y
ZWxvY2F0aW9uIG92ZXJmbG93cyBhbmQgc3dpdGNoIHRvIHVzZSB0aGUgbGFyZ2UgbW9kZWwgdGhl
bi4KClRoaXMgaXMgbmVlZGVkIGFzIHRoZSBnY2MgY3J0c3R1ZmYgd2lsbCBub3cgYWx3YXlzIGhh
dmUgZ290aGEoKSByZWxvY2F0aW9ucywgd2l0aAp0aGUgY3VycmVudCBiaW51dGlscyB0aGlzIHdv
dWxkIGNhdXNlIHRoZSBsYXJnZSBQTFQgY29kZSB0byBhbHdheXMgYmUgZ2VuZXJhdGVkLgpXZSBk
b24ndCB3YW50IHRoYXQuCgotU3RhZmZvcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxp
YnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJp
c2MK
