Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 3791317176A
	for <lists+openrisc@lfdr.de>; Thu, 27 Feb 2020 13:35:39 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 09BC6209CE;
	Thu, 27 Feb 2020 13:35:38 +0100 (CET)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by mail.librecores.org (Postfix) with ESMTPS id B79EB205FA
 for <openrisc@lists.librecores.org>; Tue, 25 Feb 2020 11:10:15 +0100 (CET)
Received: by mail-pf1-f194.google.com with SMTP id y5so6914913pfb.11
 for <openrisc@lists.librecores.org>; Tue, 25 Feb 2020 02:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DyMpEJKs+8inuT3JzdxHRTYW4XbPRxYmHFS7rJcMiTo=;
 b=FxNo9rOoXFWu5407FfbtyWpGIRbj9KKxjTY8RxTKLZ/mRamBivEBBBF8o7iguYZCS8
 o7FmpgVAUMoOvpOlaV53Ni+rnyeUxpEmSlCDQzAgq3EMp5LZgTchDOR4Rtbjchc0ShZA
 xPmjexB8VS+oFN3Szxr7y2OW1DzelczMzVdBWqwUAnW9cqWia+40vQjvQcPpzoTafSwj
 w2kkhPlcAJE/2wVnad5TQ6WRXyttnLoLu3HSQjyg4YU5qRw4xBJMHDlPb6lt1f80TGTK
 EF8lLM32t+LGLvX18eHSOWak+36hGKwbYTMWsfqp7yTAuT5LIeNmjg2MjynP5A+0ch8j
 3Sjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DyMpEJKs+8inuT3JzdxHRTYW4XbPRxYmHFS7rJcMiTo=;
 b=FFx4i5kP2a9MFM3hq6eMDAb0rmvgHkG2xzMEBNuM9jw40z5DaZBq8w3o5H4cbUizPs
 vCypT3RyLa6eXAy0fkoz00D5QgYKVri5Pp2ja6TOBkEoMqa5u6pwpUVFBzposzZN4Wza
 wpMaSm+bSu46KJH/zll8aQ4hEpGkEP2a/zQS1VfSeGTQmxzPFih2e2rbwOb0OF4TxSDz
 8RmCuO2TCwRWy0n1kJjymXOv1YAWTLs7xn/GW7aBfqpXgobr1DdIp5jUcP6ii4+DJAKL
 UTiohej5dZJC9Vy2eEkjskaLmFdvkmD5pSUU84V9bHLx0s2iw5iEa/f5BJfGj4O4f7q1
 nS9Q==
X-Gm-Message-State: APjAAAW1x7fp4RJOiu7IUipQnaMV0R+ypcByd2KbFyqc4yOMNucDonYM
 3mgl1AMQtvsx/JC3mPdoRaU=
X-Google-Smtp-Source: APXvYqz0j531hOiU4KYMfzFOo5zoLMaozISOegwSY9/l8Sa7mBFi1nfsYrnWAhTfioijX7BIKX/e5g==
X-Received: by 2002:aa7:946b:: with SMTP id t11mr55120817pfq.57.1582625414317; 
 Tue, 25 Feb 2020 02:10:14 -0800 (PST)
Received: from localhost (g183.222-224-185.ppp.wakwak.ne.jp. [222.224.185.183])
 by smtp.gmail.com with ESMTPSA id r7sm17083740pfg.34.2020.02.25.02.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 02:10:13 -0800 (PST)
Date: Tue, 25 Feb 2020 19:10:10 +0900
From: Stafford Horne <shorne@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200225101010.GC7926@lianli.shorne-pla.net>
References: <20200220170139.387354-1-hch@lst.de>
 <20200220170139.387354-3-hch@lst.de>
 <20200221221447.GA7926@lianli.shorne-pla.net>
 <20200224194528.GA10155@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200224194528.GA10155@lst.de>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Thu, 27 Feb 2020 13:35:25 +0100
Subject: Re: [OpenRISC] [PATCH 2/2] openrisc: use the generic in-place
 uncached DMA allocator
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
Cc: Jonas Bonn <jonas@southpole.se>, Mark Rutland <mark.rutland@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, openrisc@lists.librecores.org,
 linux-arch@vger.kernel.org, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBGZWIgMjQsIDIwMjAgYXQgMDg6NDU6MjhQTSArMDEwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gU2F0LCBGZWIgMjIsIDIwMjAgYXQgMDc6MTQ6NDdBTSArMDkwMCwgU3Rh
ZmZvcmQgSG9ybmUgd3JvdGU6Cj4gPiBPbiBUaHUsIEZlYiAyMCwgMjAyMCBhdCAwOTowMTozOUFN
IC0wODAwLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiA+ID4gU3dpdGNoIG9wZW5yaXNjIHRv
IHVzZSB0aGUgZG1hLWRpcmVjdCBhbGxvY2F0b3IgYW5kIGp1c3QgcHJvdmlkZSB0aGUKPiA+ID4g
aG9va3MgZm9yIHNldHRpbmcgbWVtb3J5IHVuY2FjaGVkIG9yIGNhY2hlZC4KPiA+ID4gCj4gPiA+
IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+ID4gCj4gPiBS
ZXZpZXdlZC1ieTogU3RhZmZvcmQgSG9ybmUgPHNob3JuZUBnbWFpbC5jb20+Cj4gPiAKPiA+IEFs
c28sIEkgdGVzdCBib290ZWQgb3BlbnJpc2Mgd2l0aCBsaW51eCA1LjUgKyB0aGVzZSBwYXRjaGVz
LiAgVGhhbmtzIGZvcgo+ID4gY29udGludWluZyB0byBzaHJpbmsgbXkgY29kZSBiYXNlLgo+IAo+
IEkganVzdCByZXNlbnQgYSBuZXcgdmVyc2lvbiB0aGF0IGNoYW5nZXMgaG93IHRoZSBob29rcyB3
b3JrIGJhc2VkIG9uCj4gZmVlZGJhY2sgZnJvbSBSb2Jpbi4gIEV2ZXJ5dGhpbmcgc2hvdWxkIHdv
cmsgYXMtaXMsIGJ1dCBpZiB5b3UgaGF2ZQo+IHNvbWUgdGltZSB0byByZXRlc3QgdGhhdCB3b3Vs
ZCBiZSBncmVhdC4KCk5vIHByb2JsZW0uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJy
ZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNj
Cg==
