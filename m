Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 9508642740
	for <lists+openrisc@lfdr.de>; Wed, 12 Jun 2019 15:14:09 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 58A0D2027B;
	Wed, 12 Jun 2019 15:14:09 +0200 (CEST)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by mail.librecores.org (Postfix) with ESMTPS id 080FC20155
 for <openrisc@lists.librecores.org>; Wed, 12 Jun 2019 15:14:08 +0200 (CEST)
Received: by mail-pf1-f193.google.com with SMTP id j2so9657047pfe.6
 for <openrisc@lists.librecores.org>; Wed, 12 Jun 2019 06:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4bwTT94KmV4CjuRnxQWw+4V5+YqAitxE8bK7k+23Gww=;
 b=azEDGqhIZFDKw4BYjxgHJ04cqV/2oQ1ijuLVvUJX2iss9ELepiT23H1HzVk5LOGg3H
 HAFrQ3Lz/qq4AbJczTWIQItzASHDjjD7GrpGmKhbQJrx49lGSSLcwl95MuozgUDfFDqI
 ByvsG7u6M+C8L867GhE2QeXwjzoASKqSP+gmYf+JGBeZb6pgvboRu3TGKcmoufijz8oe
 Ci6se2f9jompkbVTlvp9YrGKGP+WG6XPsttGKewWFQTVYWHFfv3YECs+hwLCZ1pPup7M
 1BgIJjrjDfrBNaAilU4lN/xjjo5EZ7yLy/LGdsvrfLEIrTYXR7yvhji8o6jqaFaEpo2n
 Z/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4bwTT94KmV4CjuRnxQWw+4V5+YqAitxE8bK7k+23Gww=;
 b=I4fm/DB/R/QxTRMYH/i0GIuda8XU+8OSza1ojTxh/VfnBkQZFfG4/VgclcEK3MBZZc
 r9n8eqB+mxzys2qae7qPD4GUUOquy3AXgIJlX/3n1mZEJETK5NTr7wVurXxNRDJCyCvT
 wHTe2gNQgR9IMBPqMB58COUIF5DUwDo8NBBmfttI73yT/WrXUhgGu4hmsIWdFV28iNjD
 TcORt84Bh3Xv75kzrz59JFZKVHfi0BJDCYehR1O6cwQT6PW20hy4S/cFmTtnXhU5XvUb
 OUXkLr4R0cnjCaqzy7tZl2eNQpJWI98r/cUFxjAO5rbdwYXEsIheceOAarNYEOvcvFUM
 cfxA==
X-Gm-Message-State: APjAAAXJ07HD9ItqZA1BvS9BVu7VXnpS48CaqG6q1UYH3UG0yzFLoZIh
 nvLsQDlXkEGFxC+qAfckgQU=
X-Google-Smtp-Source: APXvYqy15aQxNY9J6t7qTG8OzvFRn/UcykToLtVHqzhKc+kfXUCIkdk3IjoxUtnjB2nbRoj0oK2v6A==
X-Received: by 2002:a17:90a:2228:: with SMTP id
 c37mr33210760pje.9.1560345246532; 
 Wed, 12 Jun 2019 06:14:06 -0700 (PDT)
Received: from localhost (g30.211-19-85.ppp.wakwak.ne.jp. [211.19.85.30])
 by smtp.gmail.com with ESMTPSA id c9sm22889290pfn.3.2019.06.12.06.14.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 12 Jun 2019 06:14:05 -0700 (PDT)
Date: Wed, 12 Jun 2019 22:14:03 +0900
From: Stafford Horne <shorne@gmail.com>
To: cgen@sourceware.org
Message-ID: <20190612131403.GE2358@lianli.shorne-pla.net>
References: <20190601072629.4070-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190601072629.4070-1-shorne@gmail.com>
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
Cc: Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGVsbG8sCgpEaWQgYW55b25lIGhhdmUgYSBjaGFuY2UgdG8gbG9vayBhdCB0aGlzPyAgVGhlIGJp
bnV0aWxzIHBhdGNoZXMgdGhhdCByZXF1aXJlCnRoaXMgYXJlIGFwcHJvdmVkLCBidXQgSSByYXRo
ZXIgbm90IGNvbW1pdCB0aGVtIHVubGVzcyB0aGlzIEkgZ2V0IE9LIG9uIHRoZXNlCnBhdGNoZXMg
YW5kIHB1c2ggdGhlbS4KCi1TdGFmZm9yZAoKT24gU2F0LCBKdW4gMDEsIDIwMTkgYXQgMDQ6MjY6
MjdQTSArMDkwMCwgU3RhZmZvcmQgSG9ybmUgd3JvdGU6Cj4gSGVsbG8sCj4gCj4gQXMgSSBhbSB3
b3JraW5nIG9uIG9wZW5yaXNjIHdoaWNoIHVzZXMgY2dlbiBpbiBiaW51dGlscyBJIGhhdmUgbmVl
ZGVkIHRvIG1ha2UKPiB0aGVzZSBjaGFuZ2VzLgo+IAo+IFRoZSBVbm9yZGVyZWQgY29tcGFyZXMg
aXMgbmVlZGVkIGZvciBGUFUgdW5vcmRlcmVkIChOYU4gZGV0ZWN0aW5nKSBjb21wYXJpc29ucy4K
PiBUaGVzZSBoYXZlIGJlZW4gaW1wbGVtZW50ZWQgYW5kIHRlc3RlZCBpbiBPcGVuUklTQyAoYm90
aCBzaW11bGF0aW9uIGFuZAo+IGFzc2VtYmxlciAocnVubmluZyBvbiBGUEdBIGhhcmR3YXJlKSku
Cj4gCj4gVGhlIGdlbi1kb2MgY2hhbmdlcyBjb21lIGZyb20gbWUgbm90aWNpbmcgdGhlIGRvY3Mg
WzBdIG9uIHRoZSBjZ2VuIHdlYnNpdGUgYXJlCj4gdmVyeSBtdWNoIG91dCBvZiBkYXRlLgo+IAo+
IERvZXMgYW55b25lIGtub3cgdGhlIHByb2Nlc3MgdG8gZ2V0IHRoZSByZWdlbmVyYXRlZCBkb2Nz
IHBvc3RlZD8gIEkgdGhpbmsgdGhleQo+IGFyZSBiZW5lZmljaWFsIGFuZCB3aXRoIHNvbWUgbW9y
ZSB1cGRhdGVzIHRoZXkgY291bGQgYmUgcmVhbGx5IGdvb2QuCj4gCj4gWzBdIGh0dHBzOi8vc291
cmNld2FyZS5vcmcvY2dlbi9nZW4tZG9jLwo+IAo+IFN0YWZmb3JkIEhvcm5lICgyKToKPiAgIGNn
ZW46IEFkZCB1bm9yZGVyZWQgY29tcGFyZSBvcGVyYXRpb24KPiAgIGdlbi1kb2M6IFVwZGF0ZXMg
Zm9yIGxhdGVzdCBjcHUgZGVmaW5pdGlvbnMKPiAKPiAgZ2VuLWFsbC1kb2MgICB8IDQ2ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KPiAgaHRtbC5zY20gICAg
ICB8ICAyICstCj4gIHJ0bC1jLnNjbSAgICAgfCAgNCArKysrCj4gIHJ0eC1mdW5jcy5zY20gfCAg
NyArKysrKysrCj4gIDQgZmlsZXMgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRp
b25zKC0pCj4gIG1vZGUgY2hhbmdlIDEwMDY0NCA9PiAxMDA3NTUgZ2VuLWFsbC1kb2MKPiAKPiAt
LSAKPiAyLjIxLjAKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3Jn
Cmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
