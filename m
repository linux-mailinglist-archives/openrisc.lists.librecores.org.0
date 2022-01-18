Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 3AE6A492531
	for <lists+openrisc@lfdr.de>; Tue, 18 Jan 2022 12:48:25 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A834A247A2;
	Tue, 18 Jan 2022 12:48:24 +0100 (CET)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mail.librecores.org (Postfix) with ESMTPS id D8279202A8
 for <openrisc@lists.librecores.org>; Tue, 18 Jan 2022 12:48:22 +0100 (CET)
Received: by mail-pl1-f173.google.com with SMTP id e8so10510604plh.8
 for <openrisc@lists.librecores.org>; Tue, 18 Jan 2022 03:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Dejh5tcJ4gWGMzdNPEhsckEWG7ff8PXHm722G9XwW+k=;
 b=lhyWQKxAG89IPXoDBrz6HFbtQzqa9iaOYj+PFdjDoTlmha8BtPoN/SFZIdB4e77qbZ
 CBlTTcpb1QSpDDgbaKs/yMQRWx9xJEXXy+ObN+vGaqwEMUHvNvPJBcdihgIWzbIbwIyi
 t0z3JbvURqorA6ScZQzlV6PZRhjt97uJ/0+BbBjzHQmSKSLHn+JB8eFs2Fs6o8tQ/mKQ
 rUwpVZK3W7hmfBhNJ7b3ynsP/J30cSDxjWsJesM1dv+MWnERRqVLqHEqhrY7T3xefrk/
 40Idt100/aXP2A0ckDAObcJP+ame/UJT0rubeLfx0tMIplSAiSL4vidJMCU86XCODEqc
 kKAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Dejh5tcJ4gWGMzdNPEhsckEWG7ff8PXHm722G9XwW+k=;
 b=WU+HnS1pjezLvfhXSELUyHZqdAmgr7hmYZ+JwIoAC5gPdT3+bNMssU2MvIHiYn8S1W
 fxSCxfjuqQViki/3QoRlRFemM7sBU3o/QpcFXYPf9MamggRY6GUSlueswXF01H3Kpu4J
 9durMe711dX6+ghITodlRCALDTYSHnGx9yAGw3tmyCNnJJsAaxZ5L1/yPdYUqhfTV4T6
 vvuP6AItPv9R3rKiiCH5eoaNqfvqv09QtFSnY05eC92k7WxVsaxEFLg/kjx7oGju5NxO
 afpNw3NBsjopLuYYJNj/UVpLO7hNUFXq7vWPXVnDaafT+CZn9fxmmQG+A7bG1f29wQVL
 XASQ==
X-Gm-Message-State: AOAM531RLGWzOsRIDmKz+bdf71hk2SVlbz8YVJQUGr3u3C/C1jYn2j1/
 PXxYpHMFVMJ6+lo4aO/sY8Q=
X-Google-Smtp-Source: ABdhPJxwzr02xBpJ396V3SpOF+QPWB4Svb44p09ND0mT7txf7kG/F8oGaHQopWM70s1EOb1e2640uQ==
X-Received: by 2002:a17:902:ec83:b0:14a:3c28:6820 with SMTP id
 x3-20020a170902ec8300b0014a3c286820mr27820410plg.43.1642506501286; 
 Tue, 18 Jan 2022 03:48:21 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id k9sm14959387pgr.47.2022.01.18.03.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 03:48:20 -0800 (PST)
Date: Tue, 18 Jan 2022 20:48:17 +0900
From: Stafford Horne <shorne@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <YeapAai1NIuy0zV4@antec>
References: <20220118074836.GA20994@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220118074836.GA20994@lst.de>
Subject: Re: [OpenRISC] architectures that still need to remove set_fs()
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org,
 Vincent Chen <deanbo422@gmail.com>, Jonas Bonn <jonas@southpole.se>,
 Brian Cain <bcain@codeaurora.org>, linux-hexagon@vger.kernel.org,
 linux-csky@vger.kernel.org, Vineet Gupta <vgupta@kernel.org>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, openrisc@lists.librecores.org,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Greentime Hu <green.hu@gmail.com>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Nick Hu <nickhu@andestech.com>,
 linux-kernel@linux-xtensa.org, linux-arch@linux-xtensa.org,
 Dinh Nguyen <dinguyen@kernel.org>, linux-alpha@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGksCgpPbiBUdWUsIEphbiAxOCwgMjAyMiBhdCAwODo0ODozNkFNICswMTAwLCBDaHJpc3RvcGgg
SGVsbHdpZyB3cm90ZToKPiBIaSBhbGwsCj4gCj4geW91IGFyZSBpbiB0aGlzIGxpc3QgYmVjYXVz
ZSB5b3VyIGFyY2hpdGVjdHVyZSBzdGlsbCBpbXBsZW1lbnRzIGFuZAo+IHVzZXMgYWRkcmVzcyBz
cGFjZSBvdmVycmlkZXMgdXNpbmcgc2V0X2ZzKCksIHdoaWNoIGFyZSBkZXByZWNhdGVkIGFuZAo+
IGhhdmUgYmVlbiByZW1vdmVkIGZyb20gYWxsIG1haW5zdHJlYW0gYXJjaGl0ZWN0dXJlIHBvcnRz
LiAgVG8gaGVscAo+IGNsZWFudXAgdGhlIGNvcmUga2VybmVsIGl0IHdvdWxkIGJlIGdyZWF0IHRv
IG1ha2UgcHJvZ3Jlc3Mgb24gcmVtb3ZpbmcKPiBzZXRfZnMgZW50aXJlbHkuCj4gCj4gVGhlIGZv
bGxvd2luZyBzdGVwcyBhcmUgcmVxdWlyZWQ6Cj4gCj4gICgxKSBpbXBsZW1lbnQgdGhlIF9fZ2V0
X2tlcm5lbF9ub2ZhdWx0IGFuZCBfX3B1dF9rZXJuZWxfbm9mYXVsdAo+ICAgICAgaGVscGVyIHRv
IGFjY2VzcyBrZXJuZWwgbWVtb3J5IHdpdGhvdXQgcGFnZSBmYXVsdHMsIHJlcGxhY2luZwo+ICAg
ICAgdGhlIGdldC9wdXRfdXNlciB1bmRlciBzZXRfZnMoS0VSTkVMX0RTKSBhYnVzZS4gIE1pcHMg
aGFzIGEgZ29vZAo+ICAgICAgZXhhbXBsZSBmb3IgYSB0cml2aWFsIGltcGxlbWVudGF0aW9uIGZv
ciBhcmNoaXRlY3R1cmVzIHRoYXQgdXNlCj4gICAgICBhIGNvbW1vbiBhZGRyZXNzIHNwYWNlIGlu
IGNvbW1pdCAwNDMyNGY0NGNiNjkKCkFsc28gc2VlIGNvbW1pdCAwOGVlM2EwMDlmNDlhIHdoaWNo
IGlzIHByZXBhcmF0aW9uIGZvciByZW1vdmluZyBzZXRfZnMvZ2V0X2ZzCnRoaXMgY29tbWl0IGlt
cGxlbWVudHMgX19nZXRfa2VybmVsX25vZmF1bHQvX19wdXRfa2VybmVsX25vZmF1bHQgZm9yIG1p
cHMuCgo+ICAoMikgcmVtb3ZlIGFueSBhcmNoaXRlY3R1cmUgc3BlY2lmaWMgdXNlIG9mIHN1Y2gg
Y29uc3RydWN0cy4gIFRoaXMKPiAgICAgIG9ubHkgYWZmZWN0cyBpYTY0IGFuZCBzaC4KPiAgKDMp
IHN0b3Agc2VsZWN0aW5nIHRoZSBTRVRfRlMgYW5kIHJlbW92ZSBhbGwgdGhlIHNldF9mcy1yZWxh
dGVkCj4gICAgICBpbmZyYXN0cnVjdHVyZS4gIFRoZSBhYm92ZSBtaXBzIGNvbW1pdCBpcyBhIGdv
b2QgZ3VpZGUgb25jZSBhZ2Fpbi4KPiAKPiBUaGFua3MhCgpJIHdpbGwgbG9vayBpbnRvIHRoaXMg
Zm9yIE9wZW5SSVNDLgoKLVN0YWZmb3JkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJy
ZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNj
Cg==
