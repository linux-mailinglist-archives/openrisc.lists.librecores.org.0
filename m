Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D9E8D3FC863
	for <lists+openrisc@lfdr.de>; Tue, 31 Aug 2021 15:38:37 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 555BD24136;
	Tue, 31 Aug 2021 15:38:27 +0200 (CEST)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mail.librecores.org (Postfix) with ESMTPS id 5A98E240F5
 for <openrisc@lists.librecores.org>; Tue, 31 Aug 2021 15:38:26 +0200 (CEST)
Received: by mail-pf1-f178.google.com with SMTP id x16so14996137pfh.2
 for <openrisc@lists.librecores.org>; Tue, 31 Aug 2021 06:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WzysMINDWCSbmHUc9UvnAx/N2L4Si/qdlxqcZ4CNB3s=;
 b=m+Qt4PzmYB1nmb0a2Wh2dxp5PBGb3Jj43cs0twsUIXl5ay0x8k/H6lseNGCNXH+z+S
 UiJWXQUD4WrH6eY/LJbBVKFewGkj+P5Y4nMD2pnVDaiPsX3QvmXAvDF458Om4IhgOQoG
 uEs6YSkHWc0rBH+SsZHMCLnbqerEebD7lMf74BycmhujV9/iXyNFNUHqTaUDhV5qiDOY
 zHaxpO6OSTNbSUa3YxeW98+J7E0SyvaJ3d0sXrOvQX0VT/Kf8O7RolyiadYtZH5folWZ
 Au3iBRifP/L46Da4PGkpNmfd/encLK4v5JvmjaHAdZZ7C/boACzvxeAW8V8Ju2FSIJAm
 G3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WzysMINDWCSbmHUc9UvnAx/N2L4Si/qdlxqcZ4CNB3s=;
 b=SSJJOBMmIprcNyaVxk80oFsgHCDEmF/IgZTeNiWa4/FpXfTef/HxUozwhiz5tb83sC
 57EmAiCkTurb1G8K4t0AHbmUFzKsekmzWy9RXpkBpvhElogAfenh0mMJynwH/LkzjZaW
 kDxeqEEXbAs8qBWSrnAGgQ8eOXSVsC6wKkQJ7ZvMrVtyiLtU5lwCh3jQRIssPesm+tJb
 DZpIhlXxtuIaX9T5HgbF5XDctcYF4z66xtDVtOO6W1L5abw2cSAhMLuGDmUKIKSswq6q
 KRU7GqT3pAYan+J7b/2FvKFLEgaXMdpj9MRpGdw4+2alcz/0peSXqavy4XSM8mOeAP/d
 I3IA==
X-Gm-Message-State: AOAM531YajzEbTCYliUIWtATmG2L+yi186Kv992WYFdtWsqDtqUmqx+9
 Vdqen3hR+nqDsgMMWOfn7rQ=
X-Google-Smtp-Source: ABdhPJyT8UW/wkzA5qBJI5yn9jYvdYygleKLr9uaVhsUiJag/yc7Fa/7urLfv1YSedfhKyZZzl3pGQ==
X-Received: by 2002:a63:d10b:: with SMTP id k11mr10730282pgg.26.1630417104664; 
 Tue, 31 Aug 2021 06:38:24 -0700 (PDT)
Received: from localhost (g163.222-224-165.ppp.wakwak.ne.jp. [222.224.165.163])
 by smtp.gmail.com with ESMTPSA id a21sm3185180pjo.14.2021.08.31.06.38.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 06:38:23 -0700 (PDT)
Date: Tue, 31 Aug 2021 22:38:22 +0900
From: Stafford Horne <shorne@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Message-ID: <YS4wzi1o0zwEjRuK@antec>
References: <20210826132946.3324593-1-joel@jms.id.au> <YSwjlzegL+cKt1hg@antec>
 <CACPK8XdzpSpz_iswn7ojE1TbXpYFqG2orALSvJP7piq=UC0xDg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACPK8XdzpSpz_iswn7ojE1TbXpYFqG2orALSvJP7piq=UC0xDg@mail.gmail.com>
Subject: Re: [OpenRISC] [PATCH 0/3] openrisc/litex: Add liteeth support
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
Cc: openrisc@lists.librecores.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBBdWcgMzAsIDIwMjEgYXQgMDE6NDE6MjZBTSArMDAwMCwgSm9lbCBTdGFubGV5IHdy
b3RlOgo+IE9uIE1vbiwgMzAgQXVnIDIwMjEgYXQgMDA6MTcsIFN0YWZmb3JkIEhvcm5lIDxzaG9y
bmVAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUaHUsIEF1ZyAyNiwgMjAyMSBhdCAxMDo1
OTo0M1BNICswOTMwLCBKb2VsIFN0YW5sZXkgd3JvdGU6Cj4gPiA+IEhlbGxvIFN0YWZmb3JkLAo+
ID4gPgo+ID4gPiBIZXJlIGFyZSBzb21lIGNoYW5nZXMgc28gdGhhdCB0aGUgb3BlbnJpc2Mga2Vy
bmVsIGNhbiBib290IHdpdGggZXRoZXJuZXQKPiA+ID4gc3VwcG9ydCB3aXRoIHRoZSBpbi10cmVl
IGRldmljZSB0cmVlLgo+ID4gPgo+ID4gPiBJIGhhdmUgYWxzbyB1cGRhdGVkIHRoZSBhZGRyZXNz
IG9mIHRoZSBzZXJpYWwgZGV2aWNlIHRvIG1hdGNoIHJlY2VudAo+ID4gPiBsaXRleC4gSSByZWFs
aXNlIHRoaXMgbWF5IGtlZXAgY2hhbmdpbmcsIGJ1dCBpdCBkb2VzIG1ha2UgaXQgZWFzaWVyIHRv
Cj4gPiA+IHRlc3QgdXBzdHJlYW0ga2VybmVscyBpZiB0aGUgYmFzaWNzIHdvcmsuCj4gPiA+Cj4g
PiA+IEpvZWwgU3RhbmxleSAoMyk6Cj4gPiA+ICAgb3BlbnJpc2MvbGl0ZXg6IFVwZGF0ZSB1YXJ0
IGFkZHJlc3MKPiA+ID4gICBvcGVucmlzYy9saXRleDogQWRkIGV0aGVybmV0IGRldmljZQo+ID4g
PiAgIG9wZW5yaXNjL2xpdGV4OiBVcGRhdGUgZGVmY29uZmlnCj4gPiA+Cj4gPiA+ICBhcmNoL29w
ZW5yaXNjL2Jvb3QvZHRzL29yMWtsaXRleC5kdHMgICAgICB8IDEzICsrKysrKysrKystLQo+ID4g
PiAgYXJjaC9vcGVucmlzYy9jb25maWdzL29yMWtsaXRleF9kZWZjb25maWcgfCAyNiArKysrKysr
KysrKysrKy0tLS0tLS0tLQo+ID4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCsp
LCAxMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBIaSwKPiA+Cj4gPiBUaGVzZSBhbGwgbG9vayBmaW5l
IHRvIG1lLiAgTm90ZSwgSSBoYXZlIGp1c3QgdXNpbmcgdGhlIGF1dG9nZW5lcmF0ZWQgLmR0cyBm
aWxlCj4gPiBjcmVhdGVkIGJ5IHRoZSBsaXRleCBidWlsZCwgc28gSSBkb24ndCB1c3VhbGx5IHVz
ZSB0aGlzIG9uZSBvdGhlciB0aGFuIGZvciBzb21lCj4gPiBiYXNpYyB0ZXN0aW5nLiAgSSBrbm93
IGF1dG8gZ2VuZXJhdGVkIG9uZSBoYXMgaXQncyBxdWlya3MgYnV0IGl0IGRvZXMgd29yay4KPiA+
Cj4gPiBJdCdzIGdvb2QgdG8gaGF2ZSB0aGVzZSBoZXJlIHRob3VnaC4KPiAKPiBBZ3JlZWQuCj4g
Cj4gVGhlIGF1dG8gZ2VuZXJhdGVkIG9uZXMgbmVlZCBhIGxvdCBvZiB3b3JrIHRvIGJlIHJlbGV2
YW50IG91dHNpZGUgb2YKPiB0aGUgdmV4cmlzY3YgQ1BVIChJIHRyaWVkIHRvIGJ1aWxkIGZvciBy
b2NrZXQsIGEgZGlmZmVyZW50IHJpc2N2LCBhbmQKPiB0aGUgc2NyaXB0IGJsZXcgdXAuLi4pLgo+
IAo+IEluIHRoZSBmdXR1cmUgaXQgd291bGQgYmUgZ29vZCB0byBoYXZlIHRoaXMgb25lIHN1cHBv
cnQgdGhlIGRyaXZlcnMKPiB0aGF0IGFyZSBtZXJnZWQgdXBzdHJlYW0uCj4gCj4gPgo+ID4gSSB3
aWxsIHF1ZXVlIHRoZXNlIGFmdGVyIHRoZSBlaHRlcm5ldCBkcml2ZXIgaXMgcXVldWVkLiAgQXJl
IHlvdSBwbGFubmluZyBtZSB0bwo+ID4gcXVldWUgdGhlIGV0aGVybmV0IGRyaXZlcj8gIE9yIHdp
bGwgc29tZW9uZSBlbHNlIGJlIHRha2luZyB0aGF0IGluPwo+IAo+IEkgc2hvdWxkIGhhdmUgbWVu
dGlvbmVkIHRoYXQgdGhlIGRyaXZlciBhbmQgYmluZGluZ3Mgd2VyZSBtZXJnZWQKPiB0aHJvdWdo
IHRoZSBuZXR3b3JrIHRyZWUgbGFzdCB3ZWVrLiBZb3UgY2FuIHNlZSB0aGVtIGluIEZyaWRheSdz
Cj4gbGludXgtbmV4dC4KCkFscmlnaHQsIGluIHRoYXQgY2FzZSBJIGFtIGFkZGluZyB0aGVtIG5v
dy4KCi1TdGFmZm9yZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3Jn
Cmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
