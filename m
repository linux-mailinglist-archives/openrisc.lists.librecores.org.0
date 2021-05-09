Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 7D6713778A6
	for <lists+openrisc@lfdr.de>; Sun,  9 May 2021 23:18:11 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 580182139B;
	Sun,  9 May 2021 23:18:11 +0200 (CEST)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mail.librecores.org (Postfix) with ESMTPS id 76D9E20A49
 for <openrisc@lists.librecores.org>; Sun,  9 May 2021 23:18:09 +0200 (CEST)
Received: by mail-pj1-f44.google.com with SMTP id
 h14-20020a17090aea8eb02901553e1cc649so8904184pjz.0
 for <openrisc@lists.librecores.org>; Sun, 09 May 2021 14:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rbwIn0tWgSdNhdH5lPly7AWTzAvikcCRK3NlmDTHFjU=;
 b=Q2P/aJfZKZWxPibdU09rZbB0qLe+e0iNJq86pTd1bKHjeOHHyWyVq99HdnUtYBLmu4
 /eeN3qr0F+bFjntQ+WXlA5Ppb6Vs/LYlw9bKtBGotJZ77IJuAlJX4VXb7by1EcS5Qwy4
 vE+FR8UPqt4LEym7SUih26vGJupRoih6Ukwv7ZHQL9qJGSAwgJVmvwdZwIUQ/aGfXvkh
 XAbUG5tQ6kwSrD19/qzjnJQWtLcmQBStf9jqk+Mb9h0Okkw3ds66bpMPFKFTsQSAs9vL
 TxLdISFQfy2OzN/Xou9kXQdrIUoOQ43RdyeDlXtrw1CofwTOnuZkBr4N/TJt7aWKwlvB
 7kEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rbwIn0tWgSdNhdH5lPly7AWTzAvikcCRK3NlmDTHFjU=;
 b=WLiFN1Ts1l+JV6UL1X6/1bfGo03n3JL77MDGxXFovaPfZVI8x13LGElBY1c22HbhtT
 Isi0RSfEB6ImTxppYACE6NSR8g+kJwH6Iv5vq22rzM2WEnIBpBkc74/Ubj8ZAHmDb/Cu
 k0stXT/lnlNBWK+Rnid7Hde/aDO08l98IfFzmREp2/XZXXGjYdfoopT0l6Y6aXN252nC
 7dWTOnr5GyqeNuBltevIIULYLezATjx2wYcjzcB3boU0sljy758fEl2w3+qa6tLsTetS
 PBHNhQbd80GwmhjEyMDj13LdNzpzUSRmn7k6r8+AGL8MAcEtgHrb1n2xdc7mxfuAk1ml
 nOHQ==
X-Gm-Message-State: AOAM531yXqvvczdgTJC81y0zJtQTkl/VktgZo9O9rHMPjCEv8+iZjB4O
 +EF59Bx5shzQNZD8jmqXq7E=
X-Google-Smtp-Source: ABdhPJwVYtPv05PhD6q9QfU7ekFxHIsmxearWyimhPp8Ae96Q8Ri5OE5fDR9tnS/UcWV413cw//76Q==
X-Received: by 2002:a17:902:7281:b029:ea:afe2:b356 with SMTP id
 d1-20020a1709027281b02900eaafe2b356mr21766956pll.16.1620595087712; 
 Sun, 09 May 2021 14:18:07 -0700 (PDT)
Received: from localhost (g1.222-224-229.ppp.wakwak.ne.jp. [222.224.229.1])
 by smtp.gmail.com with ESMTPSA id r32sm9486424pgm.49.2021.05.09.14.18.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 May 2021 14:18:07 -0700 (PDT)
Date: Mon, 10 May 2021 06:18:05 +0900
From: Stafford Horne <shorne@gmail.com>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <YJhRjTPdJbjI5iyj@antec>
References: <20210509091103.7985-1-rppt@kernel.org>
 <20210509091103.7985-3-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210509091103.7985-3-rppt@kernel.org>
Subject: Re: [OpenRISC] [PATCH 2/2] openrisc: mm/init.c: remove unused
 variable 'end' in paging_init()
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
Cc: Jonas Bonn <jonas@southpole.se>, Mike Rapoport <rppt@linux.ibm.com>,
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU3VuLCBNYXkgMDksIDIwMjEgYXQgMTI6MTE6MDNQTSArMDMwMCwgTWlrZSBSYXBvcG9ydCB3
cm90ZToKPiBGcm9tOiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gCj4gQSBi
dWlsZCB3aXRoIFc9MSBlbmFibGVkIHByb2R1Y2VzIHRoZSBmb2xsb3dpbmcgd2FybmluZzoKPiAK
PiAgIENDICAgICAgYXJjaC9vcGVucmlzYy9tbS9pbml0Lm8KPiBhcmNoL29wZW5yaXNjL21tL2lu
aXQuYzogSW4gZnVuY3Rpb24gJ3BhZ2luZ19pbml0JzoKPiBhcmNoL29wZW5yaXNjL21tL2luaXQu
YzoxMzE6MTY6IHdhcm5pbmc6IHZhcmlhYmxlICdlbmQnIHNldCBidXQgbm90IHVzZWQgWy1XdW51
c2VkLWJ1dC1zZXQtdmFyaWFibGVdCj4gICAxMzEgfCAgdW5zaWduZWQgbG9uZyBlbmQ7Cj4gICAg
ICAgfCAgICAgICAgICAgICAgICBefn4KPiAKPiBSZW1vdmUgdGhlIHVudXNlZCB2YXJpYWJsZSAn
ZW5kJy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5j
b20+Cj4gLS0tCj4gIGFyY2gvb3BlbnJpc2MvbW0vaW5pdC5jIHwgMyAtLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJpc2MvbW0v
aW5pdC5jIGIvYXJjaC9vcGVucmlzYy9tbS9pbml0LmMKPiBpbmRleCBmM2ZhMDJiODgzOGEuLjZl
MzhlYzk2Y2FiOCAxMDA2NDQKPiAtLS0gYS9hcmNoL29wZW5yaXNjL21tL2luaXQuYwo+ICsrKyBi
L2FyY2gvb3BlbnJpc2MvbW0vaW5pdC5jCj4gQEAgLTEyOCw3ICsxMjgsNiBAQCB2b2lkIF9faW5p
dCBwYWdpbmdfaW5pdCh2b2lkKQo+ICB7Cj4gIAlleHRlcm4gdm9pZCB0bGJfaW5pdCh2b2lkKTsK
PiAgCj4gLQl1bnNpZ25lZCBsb25nIGVuZDsKPiAgCWludCBpOwo+ICAKPiAgCXByaW50ayhLRVJO
X0lORk8gIlNldHRpbmcgdXAgcGFnaW5nIGFuZCBQVEVzLlxuIik7Cj4gQEAgLTE0NCw4ICsxNDMs
NiBAQCB2b2lkIF9faW5pdCBwYWdpbmdfaW5pdCh2b2lkKQo+ICAJICovCj4gIAljdXJyZW50X3Bn
ZFtzbXBfcHJvY2Vzc29yX2lkKCldID0gaW5pdF9tbS5wZ2Q7Cj4gIAo+IC0JZW5kID0gKHVuc2ln
bmVkIGxvbmcpX192YShtYXhfbG93X3BmbiAqIFBBR0VfU0laRSk7Cj4gLQo+ICAJbWFwX3JhbSgp
Owo+ICAKPiAgCXpvbmVfc2l6ZXNfaW5pdCgpOwoKVGhhbmtzLCBJIHdpbGwgcXVldWUgdGhpcyBp
biB0aGUgb3BlbnJpc2MgZml4ZXMgcXVldWUuCgotU3RhZmZvcmQKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5S
SVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlz
dGluZm8vb3BlbnJpc2MK
