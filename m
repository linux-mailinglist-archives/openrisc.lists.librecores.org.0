Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id DA3475EF33
	for <lists+openrisc@lfdr.de>; Thu,  4 Jul 2019 00:40:03 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 927C22035A;
	Thu,  4 Jul 2019 00:40:03 +0200 (CEST)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by mail.librecores.org (Postfix) with ESMTPS id 3601920317
 for <openrisc@lists.librecores.org>; Thu,  4 Jul 2019 00:40:02 +0200 (CEST)
Received: by mail-pl1-f194.google.com with SMTP id bh12so1983711plb.4
 for <openrisc@lists.librecores.org>; Wed, 03 Jul 2019 15:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Sgsiftcs3h9wScDogN//+aaPu78bhMmjWweL4COnGmA=;
 b=IFlnaVdOQE6FKLdNv/x36ktW4SNtTtRG2i0s6mVG+pbuZIOzlJcF9xVg0tixND2YQD
 4ec5UeVsf8X9d4vV35DWd7LhgpwBXrmPix6xjCB+2RpkYnbx134Wy6NUmxHQBpWY0tqK
 sfy2btZL3IEC669NJtkQnfOVvQWLy2VKWSVXa+1pLZPyzTWwFAreFAA/OoTYV8vLmICX
 2rehau2oWnX4Ri45/QZob+p5km3PHcvowBP4oWpEki7qaFbgap6Jes80PZ+ruTG5ME3W
 R5FX6qbrieJQn52ANU9bMCxggfbX4YI6ftZUk59JY45pOtAdbFz2Bz7iZrr0tZXzuoVq
 3s5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Sgsiftcs3h9wScDogN//+aaPu78bhMmjWweL4COnGmA=;
 b=IUq7zctUmpJXOMMvT/9IB2Rnn9gb2N5B9WmGuX7p2buRn0+36R12ooU1P05cevYm56
 AUhIxmHyN0cGq/3Rdqq6yhQpXwFJUGuSgzZ4Om+g4qnRVxvKiBbxHlsoq83QqOq+j5In
 2nCoY/jMya4UWouC/YJWfDGp+8vhGSqfv9IsT2r3AE5G3GolcowMNNmEQw+8O0GEkysF
 mYNDvADfpRp0n+SaHdgQZcc0hGVaD9RMtaf8B9tZWzUqZbCi9ts9rAqsc8f+C76oNXa7
 7P/HCNx94MHerw8m6R8vb1v72InHdhFUsH3WpumzHqr/8J2v9TsKm5IOM4znCq4QXJyL
 F46Q==
X-Gm-Message-State: APjAAAWWgxBU0xBdNqKDCUxSzV8NfKGFFuWIExFd8+h6nd1LCC4AaNOf
 lZQ5WxqVLTrFXqJ/nWKgKXs=
X-Google-Smtp-Source: APXvYqzVFyXdvhBEa1N4IaPxHaIjqUMlVzsKWlh/1eiZYqAAnsb7iVKO6caTjo8vzvkBCV9kH9/Gog==
X-Received: by 2002:a17:902:968c:: with SMTP id
 n12mr47393362plp.59.1562193600510; 
 Wed, 03 Jul 2019 15:40:00 -0700 (PDT)
Received: from localhost (g223.61-115-60.ppp.wakwak.ne.jp. [61.115.60.223])
 by smtp.gmail.com with ESMTPSA id t11sm2906067pgp.1.2019.07.03.15.39.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 15:39:59 -0700 (PDT)
Date: Thu, 4 Jul 2019 07:39:57 +0900
From: Stafford Horne <shorne@gmail.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Message-ID: <20190703223957.GF2601@lianli.shorne-pla.net>
References: <20190703033351.11924-1-shorne@gmail.com>
 <20190703033351.11924-4-shorne@gmail.com>
 <20190703144902.GX18316@gate.crashing.org>
 <20190703214917.GB2601@lianli.shorne-pla.net>
 <20190703222658.GD18316@gate.crashing.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190703222658.GD18316@gate.crashing.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [OpenRISC] [PATCH v2 3/5] or1k: Add mrori option,
 fix option docs
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
Cc: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>,
 Openrisc <openrisc@lists.librecores.org>,
 GCC patches <gcc-patches@gcc.gnu.org>, Jeff Law <law@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDU6MjY6NThQTSAtMDUwMCwgU2VnaGVyIEJvZXNzZW5r
b29sIHdyb3RlOgo+IE9uIFRodSwgSnVsIDA0LCAyMDE5IGF0IDA2OjQ5OjE3QU0gKzA5MDAsIFN0
YWZmb3JkIEhvcm5lIHdyb3RlOgo+ID4gT24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDk6NDk6MDJB
TSAtMDUwMCwgU2VnaGVyIEJvZXNzZW5rb29sIHdyb3RlOgo+ID4gPiBPbiBXZWQsIEp1bCAwMywg
MjAxOSBhdCAxMjozMzo0OVBNICswOTAwLCBTdGFmZm9yZCBIb3JuZSB3cm90ZToKPiA+ID4gPiBA
QCAtMTc5LDExICsxODMsMTEgQEAKPiA+ID4gPiAgICBbKHNldCAobWF0Y2hfb3BlcmFuZDpTSSAw
ICJyZWdpc3Rlcl9vcGVyYW5kIiAiPXIsciIpCj4gPiA+ID4gIAkocm90YXRlcnQ6U0kgKG1hdGNo
X29wZXJhbmQ6U0kgMSAicmVnaXN0ZXJfb3BlcmFuZCIgICJyLHIiKQo+ID4gPiA+ICAJCSAgKG1h
dGNoX29wZXJhbmQ6U0kgMiAicmVnX29yX3U2X29wZXJhbmQiICJyLG4iKSkpXQo+ID4gPiA+IC0g
ICJUQVJHRVRfUk9SIgo+ID4gPiA+ICsgICJUQVJHRVRfUk9SIHx8IFRBUkdFVF9ST1JJIgo+ID4g
PiA+ICAgICJACj4gPiA+ID4gICAgIGwucm9yXHQlMCwgJTEsICUyCj4gPiA+ID4gICAgIGwucm9y
aVx0JTAsICUxLCAlMiIKPiA+ID4gPiAtICBbKHNldF9hdHRyICJpbnNuX3N1cHBvcnQiICIqLHNo
ZnRpbW0iKV0pCj4gPiA+ID4gKyAgWyhzZXRfYXR0ciAiaW5zbl9zdXBwb3J0IiAicm9yLHJvcmki
KV0pCj4gPiA+IAo+ID4gPiBEb2VzIHRoaXMgd29yaz8gIElmIHlvdSB1c2UgLW1uby1yb3IgLW1y
b3JpPyAgSXQgd2lsbCB0aGVuIGFsbG93IGdlbmVyYXRpbmcKPiA+ID4gYSByZWcgZm9yIHRoZSBz
ZWNvbmQgb3BlcmFuZCwgYW5kIElDRSBsYXRlciBvbiwgYXMgZmFyIGFzIEkgY2FuIHNlZT8KPiA+
IAo+ID4gSXQgZG9lcyBzZWVtIHRvIHdvcmsuICBXaHkgd291bGQgaXQgcHJvZHVjZSBhbiBpbnRl
cm5hbCBjb21waWxlciBlcnJvcj8KPiA+IAo+ID4gT25lIHRoaW5nIEkgaGF2ZSBpcyBSZWdlY3RO
ZWdhdGl2ZSBvbiBtcm9yIGFuZCBtcm9yaSwgc28gLW1uby1yb3Igd2lsbCBub3QgYmUKPiA+IGFs
bG93ZWQgYW5kIGNhdXNlIGFuIGVycm9yLgo+IAo+IEJ1dCBib3RoIG9wdGlvbnMgYXJlIG9mZiBi
eSBkZWZhdWx0LCBhbmQgbmVpdGhlciBpcyBlbmFibGVkIG9yIGRpc2FibGVkCj4gYmFzZWQgb24g
dGhlIHNldHRpbmcgb2YgdGhlIG90aGVyLgo+IAo+ID4gRXhhbXBsZTogCj4gPiAKPiA+ICAgICAk
IGNhdCAuL2djYy90ZXN0c3VpdGUvZ2NjLnRhcmdldC9vcjFrL3Jvci00LmMKPiA+IAo+ID4gCXVu
c2lnbmVkIGludCByb3RhdGU2ICh1bnNpZ25lZCBpbnQgYSkgewo+ID4gCSAgcmV0dXJuICggYSA+
PiA2ICkgfCAoIGEgPDwgKCAzMiAtIDYgKSApOwo+ID4gCX0KPiAKPiBUaGF0J3MgYSBmaXhlZCBk
aXN0YW5jZSByb3RhdGUuICBNeSBxdWVzdGlvbiBpcyB3aWxsIGl0IHdvcmsgaWYgdGhlCj4gZGlz
dGFuY2UgaXMgYSB2YXJpYWJsZS4gIFRoZSBvdGhlciBkaXJlY3Rpb24gc2hvdWxkIHdvcmsgZmlu
ZSwgYWdyZWVkLgo+IAo+IFNvLCBkb2VzIHJvci1bMTJdLmMgd29yayB3aXRoIC1tcm9yaSBhbmQg
bm8gLW1yb3I/ICBUaGUgcHJlZGljYXRlcyBzYXkKPiB0aGlzIGluc24gcGF0dGVybiBpcyBqdXN0
IGZpbmUgaW4gdGhhdCBjYXNlLCBidXQgdGhlIGNvbnN0cmFpbnRzIHdpbGwKPiBkaXNhZ3JlZS4K
Ck9LLCB5ZXMgSSBzZWUgaXQgbm93LiAgU29ycnkgSSBtaXMtdW5kZXJzdG9vZCB3aGF0IHlvdSBt
ZWFudCBieSBzZWNvbmQgYXJndW1lbnQuCkkgd2lsbCBmaXguICBJdCdzIHByb2JhYmx5IGdvaW5n
IHRvIGJlIGVhc2llc3QgdG8gc3BsaXQgdGhpcyB0byAyIGluc3RydWN0aW9ucy4KCi1TdGFmZm9y
ZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklT
QyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0
cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
