Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 075C94DCA13
	for <lists+openrisc@lfdr.de>; Thu, 17 Mar 2022 16:34:53 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C0255235F1;
	Thu, 17 Mar 2022 16:34:52 +0100 (CET)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by mail.librecores.org (Postfix) with ESMTPS id 8CEDA20CF9
 for <openrisc@lists.librecores.org>; Thu, 17 Mar 2022 16:34:51 +0100 (CET)
Received: by mail-qk1-f169.google.com with SMTP id z66so4604020qke.10
 for <openrisc@lists.librecores.org>; Thu, 17 Mar 2022 08:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qtliUzkRIUdjqjO0W+fikeYFFq5bQx8hw1n4Uq6lPAg=;
 b=qZRRueAnOHjaHMRHQ+QIIoDnWulYAUxCMJ1f9PLJOiXq+diWU/Nsh3HRXjKTOHUm89
 FdVU4EnrCVLmv+jdu1vwRuH5xMQyCKdw/F0Qk4dOA5DQSO/zfZ7fqVB+ZiP20rwRTgL2
 Tx1no5rGcZqDfFMOdohpUGHQxgvf4P+eQQVo07wTPTbk6zai1gX84K5lqBJB+7ICayuN
 be5wo9BbPg8ZE/axbhzenv08W3Rzfbbd1dZ3GoXVU9f0y3NwzmnLpdrAkYx8ephYpXeP
 05w3fv1bqTdhGsZYxLe1PqWeeUS7hccm0sxAy0O9cbJcJBo1HrIV21wQxYRxMJDyHngu
 3Y/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qtliUzkRIUdjqjO0W+fikeYFFq5bQx8hw1n4Uq6lPAg=;
 b=Y9rFpV6xcxqQiDIOOzJZfU53iUXtOc1QoCYwqVijtb0AnbDNueV2TGfeOVx3/MWZsL
 l9sb3SAh7pVdna1vGfba7J6LBhzLByYTA+aEFPglVQv1wlFL4zxJ07ynKEkLEBRgCjDg
 SwXL5W6LBeq+TgUOzo6oSAGfq52ohXb9jAG0yBPH1dyvtclGQj4XnQsSXHkLvBDfq9/i
 J4k+q2rodzgNFxfupF8oae2x21yTce9rdzDmSpWGhIXR69zYf2NQt0bBZ3eWpDxY/sFa
 yRS+aN03BVT5wkzzU+bP+x7NDgGG2utGqFJ2Z7h3L9UaLeruQkym4Tjd/cA5Qodw/qNH
 LSrw==
X-Gm-Message-State: AOAM530a5Nnozp/EnV4sDSK3R9eMCErxw+/Gyx9zj6r7D9UgWBhzhcEa
 REh1wuZHoiq5GNBA8AREais=
X-Google-Smtp-Source: ABdhPJx8dXv4UXQyiWK4n7wEDfULbNQbnJsKlVOxYDBmUuKOSaCsRNCIvmR7bFavxrrEy4dWi4VA8A==
X-Received: by 2002:a05:620a:28c4:b0:67d:c400:a9d7 with SMTP id
 l4-20020a05620a28c400b0067dc400a9d7mr3231420qkp.369.1647531290494; 
 Thu, 17 Mar 2022 08:34:50 -0700 (PDT)
Received: from auth2-smtp.messagingengine.com (auth2-smtp.messagingengine.com.
 [66.111.4.228]) by smtp.gmail.com with ESMTPSA id
 k1-20020ac85fc1000000b002e1c6420790sm3840883qta.40.2022.03.17.08.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 08:34:49 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailauth.nyi.internal (Postfix) with ESMTP id C3AFC27C0054;
 Thu, 17 Mar 2022 11:34:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 17 Mar 2022 11:34:48 -0400
X-ME-Sender: <xms:FFUzYvYeHB8UgJLpkpjGoO87Dhu0M5cz9KeoEWrnjVktCEfb1vUgmw>
 <xme:FFUzYuZOiKnmJ9UPGFPz4T8kLq-7OgnWaYZQ3_YQiP4jKERtQl_YhT2meotSV3qM3
 n-PA6boLk5hbLP7wQ>
X-ME-Received: <xmr:FFUzYh-UVM2fTmsTdkWHiKYdFTe43WEYk361olaw-wwkAqtLNKQRGT7kKQ4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudefgedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhn
 ucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrth
 htvghrnhepvdelieegudfggeevjefhjeevueevieetjeeikedvgfejfeduheefhffggedv
 geejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsg
 hoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieeg
 qddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigi
 hmvgdrnhgrmhgv
X-ME-Proxy: <xmx:FFUzYlpXjh1DBe_h89xavc8SP5ArO-AFfAUabR_Rm9M1SOFWb5QB5Q>
 <xmx:FFUzYqrRUUeB5Tk3Yl3nSEtpNiuzFix1x61nNAGT5NoGdrxgBJYFvw>
 <xmx:FFUzYrSd0xVQNCjGqzNwy83mxeIizp-GUgA4qMhUkwGPis5Jmoo2Hw>
 <xmx:FVUzYt80E1fXaJ1tXGQtXLBz1Dc4KYT1JWMoG6alobFQJ9QsAHALhS8RthE>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Mar 2022 11:34:44 -0400 (EDT)
Date: Thu, 17 Mar 2022 23:34:18 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Waiman Long <longman@redhat.com>
Message-ID: <YjNU+tj5YJrYtwtK@boqun-archlinux>
References: <20220316232600.20419-1-palmer@rivosinc.com>
 <20220316232600.20419-3-palmer@rivosinc.com>
 <YjM+P32I4fENIqGV@boqun-archlinux>
 <364c72a9-64ca-592a-510b-d48a963121aa@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <364c72a9-64ca-592a-510b-d48a963121aa@redhat.com>
Subject: Re: [OpenRISC] [PATCH 2/5] asm-generic: ticket-lock: New generic
 ticket-based spinlock
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
Cc: jonas@southpole.se, linux-arch@vger.kernel.org, wangkefeng.wang@huawei.com,
 aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>, peterz@infradead.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
 mingo@redhat.com, Palmer Dabbelt <palmer@dabbelt.com>, jszhang@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCBNYXIgMTcsIDIwMjIgYXQgMTE6MDM6NDBBTSAtMDQwMCwgV2FpbWFuIExvbmcgd3Jv
dGU6ClsuLi5dCj4gPiA+ICsgKiBJdCBhbHNvIHJlbGllcyBvbiBhdG9taWNfZmV0Y2hfYWRkKCkg
YmVpbmcgc2FmZSB2cyBzbXBfc3RvcmVfcmVsZWFzZSgpIG9uIGEKPiA+ID4gKyAqIHN1Yi13b3Jk
IG9mIHRoZSB2YWx1ZS4gVGhpcyBpcyBnZW5lcmFsbHkgdHJ1ZSBmb3IgYW55dGhpbmcgTEwvU0Mg
YWx0aG91Z2gKPiA+ID4gKyAqIHlvdSdkIGJlIGhhcmQgcHJlc3NlZCB0byBmaW5kIGFueXRoaW5n
IHVzZWZ1bCBpbiBhcmNoaXRlY3R1cmUgc3BlY2lmaWNhdGlvbnMKPiA+ID4gKyAqIGFib3V0IHRo
aXMuIElmIHlvdXIgYXJjaGl0ZWN0dXJlIGNhbm5vdCBkbyB0aGlzIHlvdSBtaWdodCBiZSBiZXR0
ZXIgb2ZmIHdpdGgKPiA+ID4gKyAqIGEgdGVzdC1hbmQtc2V0Lgo+ID4gPiArICoKPiA+ID4gKyAq
IEl0IGZ1cnRoZXIgYXNzdW1lcyBhdG9taWNfKl9yZWxlYXNlKCkgKyBhdG9taWNfKl9hY3F1aXJl
KCkgaXMgUkNwYyBhbmQgaGVuY2UKPiA+ID4gKyAqIHVzZXMgYXRvbWljX2ZldGNoX2FkZCgpIHdo
aWNoIGlzIFNDIHRvIGNyZWF0ZSBhbiBSQ3NjIGxvY2suCj4gPiA+ICsgKgo+ID4gUHJvYmFibHkg
aXQncyBiZXR0ZXIgdG8gdXNlICJmdWxseS1vcmRlcmVkIiBpbnN0ZWFkIG9mICJTQyIsIGJlY2F1
c2Ugb3VyCj4gPiBhdG9taWMgZG9jdW1lbnRzIG5ldmVyIHVzZSAiU0MiIG9yICJTZXF1ZW50aWFs
IENvbnNpc3RlbnkiIHRvIGRlc2NyaWJlCj4gPiB0aGUgc2VtYW50aWNzLCBmdXJ0aGVyIEknbSBu
b3Qgc3VyZSBvdXIgImZ1bGx5LW9yZGVyZWQiIGlzIGVxdWl2YWxlbnQgdG8KPiA+IFNDLCBiZXR0
ZXIgbm90IGNhdXNlIG1pc3VuZGVyc3RhbmRpbmcgaW4gdGhlIGZ1dHVyZSBoZXJlLgo+IAo+IFRo
ZSB0ZXJtcyBSQ3BjLCBSQ3NjIGNvbWVzIGZyb20gYWNhZGVtaWEuIEkgYmVsaWV2ZSB3ZSBjYW4g
a2VlcCB0aGlzIGJ1dCBhZGQKCkknbSBub3Qgc2F5aW5nIHdlIGNhbm5vdCBrZWVwICJSQ3BjIiBh
bmQgIlJDc2MiLCBhbmQgd2UgYWN0dWFsbHkgdXNlCnRoZW0gdG8gZGVzY3JpYmUgdGhlIG1lbW9y
eSBvcmRlcmluZyBhdHRyaWJ1dGVzIG9mIG91ciBsb2NrIG9yIGF0b21pYwpwcmltaXRpdmVzLiBU
aGVzZSB0ZXJtcyBhcmUgd2VsbCBkZWZpbmVkLgoKVGhlIHRoaW5nIGlzIHRoYXQgaW5zdGVhZCBv
ZiAiU0MiIHdlIHVzZSAiZnVsbHktb3JkZXJlZCIgdG8gZGVzY3JpYmUgdGhlCm1lbW9yeSBvcmRl
cmluZyBzZW1hbnRpY3Mgb2YgYXRvbWljcyBsaWtlIGNtcHhjaGcoKSwgYW5kIElJVUMgdGhlCmRl
ZmluaXRpb24gb2YgIlNDIiBpc24ndCBlcXVpdmFsZW50IHRvICJmdWxseS1vcmRlcmVkIiwgaW4g
b3RoZXIgd29yZHMsCnRoZXJlIGlzIG5vICJTQyIgYXRvbWljIGluIExpbnV4IGtlcm5lbCByaWdo
dCBub3cuIFNvIHVzaW5nICJTQyIgaGVyZQppcyBub3QgcXVpdGUgcmlnaHQuIEp1c3Qgc2F5ICIu
Li53aGljaCBpcyBmdWxseS1vcmRlcmVkIHRvIGNyZWF0ZSBhbgpSQ3NjIGxvY2suIgoKQnV0IHll
cywgbWF5YmUgSSdtIHdyb25nLCBhbmQgIlNDIiBjYW4gYmUgdXNlZCBleGNoYW5nYWJseSB3aXRo
CiJmdWxseS1vcmRlcmVkIiwgYnV0IGF0IGxlYXN0IHNvbWUgcmVhc29uaW5nIGlzIG5lZWRlZC4K
ClJlZ2FyZHMsCkJvcXVuCgo+IG1vcmUgY29tbWVudCB0byBlbGFib3JhdGUgd2hhdCB0aGV5IGFy
ZSBhbmQgd2hhdCBkbyB0aGV5IG1lYW4gZm9yIHRoZQo+IGF2ZXJhZ2Uga2VybmVsIGVuZ2luZWVy
Lgo+IAo+IENoZWVycywKPiBMb25nbWFuCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5s
aWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5y
aXNjCg==
