Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 933BC5160CF
	for <lists+openrisc@lfdr.de>; Sun,  1 May 2022 00:42:15 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8242F247E1;
	Sun,  1 May 2022 00:42:14 +0200 (CEST)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mail.librecores.org (Postfix) with ESMTPS id 3EAD324130
 for <openrisc@lists.librecores.org>; Sun,  1 May 2022 00:42:13 +0200 (CEST)
Received: by mail-pl1-f169.google.com with SMTP id c23so9954735plo.0
 for <openrisc@lists.librecores.org>; Sat, 30 Apr 2022 15:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=pJxFKc3A4Q9u6UxRnvbPf1GtP9CvKofvMElbwbfkYlU=;
 b=hU9KYocbJP8ZgH5JGVJtzDFNO2/V3wwkem7+7q9zcyQgl2iEtRpVfuNHiVgNQvQrvY
 k+2J6GniT4XopabxoTjeH42Ah1zM1y7fUCt1S4WV0gDdWqbvgEDtM6AIO1v4dDDi2aFd
 +dMthd7vh2JvpwmVOI2ltPrMcEjiui9GuQSHBGL/OVz1GgVcYMJrlPWVirIP57yHvL/v
 VViY6janCln0lpKwFgsaENdHmIzM1Yf7a3jIrfNNy91pYnQd8EKAwDb0rDBBIOfR2Tun
 bwL4A2rXVHEwmFpLGjTEznP5u2wvG5+mb82hLJFlaO4Y5/DQVjCFWA87p9gcPT4GZFNq
 B90g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pJxFKc3A4Q9u6UxRnvbPf1GtP9CvKofvMElbwbfkYlU=;
 b=XONMcNTmbcrlxOtWQsz1QUH2C2mHxF8tCN6D+DXxUdHIYVWvRi5dU1ugvs6U0bTNV7
 K8crcigVODKMYMszLDgSqzJgohsuQNkD65uwbGa9S8gBq10eXB77iIeZtbRLOm88G89M
 drUVm3c1Au2szN3PWRmd2lFUtAeLKURJV/wC+rNwHNwnEBwo/TEfwVV28YhSnAan0bQC
 pkNON7apq3wIilt8PQSBqnrz2uAfnkhFGDDHfX5h/gqTT2yq7YneF0pvS71YvqPhI9Ru
 oAo07++R6iToEkKj1qhqgG7BkAZDywJKwIYdZSPlB/xCPb6510qQu+D85dhpBlp+F1t+
 4blQ==
X-Gm-Message-State: AOAM530mNeOdaWqsgL+xRW4lfHUNvWegFxE+7BxJ3HSLq2kuqZfj0MQ2
 GgrlvOCfvEt4Y/4cBJOeS+Y=
X-Google-Smtp-Source: ABdhPJxb9q9pIxCM+xqqQt0tHc+/wHxrUhjCJfX3mXD9c8/sSrw130lPFO1ZYm8656VSeK1FzKBPMg==
X-Received: by 2002:a17:902:cecb:b0:15e:8ddd:c7b1 with SMTP id
 d11-20020a170902cecb00b0015e8dddc7b1mr4126145plg.105.1651358531738; 
 Sat, 30 Apr 2022 15:42:11 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a17090270c800b0015e8d4eb1e9sm597974plt.51.2022.04.30.15.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 15:42:10 -0700 (PDT)
Date: Sun, 1 May 2022 07:42:09 +0900
From: Stafford Horne <shorne@gmail.com>
To: Julia Lawall <Julia.Lawall@inria.fr>
Message-ID: <Ym27QcSo/U6xSIQc@antec>
References: <20220430191122.8667-8-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220430191122.8667-8-Julia.Lawall@inria.fr>
Subject: Re: [OpenRISC] [PATCH] openrisc: fix typos in comments
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
Cc: Jonas Bonn <jonas@southpole.se>, openrisc@lists.librecores.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU2F0LCBBcHIgMzAsIDIwMjIgYXQgMDk6MTE6MjJQTSArMDIwMCwgSnVsaWEgTGF3YWxsIHdy
b3RlOgo+IFZhcmlvdXMgc3BlbGxpbmcgbWlzdGFrZXMgaW4gY29tbWVudHMuCj4gRGV0ZWN0ZWQg
d2l0aCB0aGUgaGVscCBvZiBDb2NjaW5lbGxlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGlhIExh
d2FsbCA8SnVsaWEuTGF3YWxsQGlucmlhLmZyPgo+IAo+IC0tLQo+ICBhcmNoL29wZW5yaXNjL21t
L3RsYi5jIHwgICAgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9tbS90bGIuYyBiL2FyY2gv
b3BlbnJpc2MvbW0vdGxiLmMKPiBpbmRleCAyYjZmZWFiZjYzODEuLmUyZjJhM2MzYmIyMiAxMDA2
NDQKPiAtLS0gYS9hcmNoL29wZW5yaXNjL21tL3RsYi5jCj4gKysrIGIvYXJjaC9vcGVucmlzYy9t
bS90bGIuYwo+IEBAIC0xMjgsNyArMTI4LDcgQEAgdm9pZCBsb2NhbF9mbHVzaF90bGJfbW0oc3Ry
dWN0IG1tX3N0cnVjdCAqbW0pCj4gIAo+ICAJLyogV2FzIHNlZWluZyBidWdzIHdpdGggdGhlIG1t
IHN0cnVjdCBwYXNzZWQgdG8gdXMuIFNjcmFwcGVkIG1vc3Qgb2YKPiAgCSAgIHRoaXMgZnVuY3Rp
b24uICovCj4gLQkvKiBTZXZlcmFsIGFyY2hpdGN0dXJlcyBkbyB0aGlzICovCj4gKwkvKiBTZXZl
cmFsIGFyY2hpdGVjdHVyZXMgZG8gdGhpcyAqLwo+ICAJbG9jYWxfZmx1c2hfdGxiX2FsbCgpOwo+
ICB9CgpUaGFua3MgSSBoYXZlIHF1ZXVlZCB0aGlzIGZvciA1LjE5LgoKLVN0YWZmb3JkCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxp
bmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJl
Y29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
