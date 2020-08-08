Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id DEC1723F956
	for <lists+openrisc@lfdr.de>; Sun,  9 Aug 2020 00:35:09 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5D92A20DAB;
	Sun,  9 Aug 2020 00:35:09 +0200 (CEST)
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by mail.librecores.org (Postfix) with ESMTPS id C1ECC20D02
 for <openrisc@lists.librecores.org>; Sun,  9 Aug 2020 00:35:06 +0200 (CEST)
Received: by mail-pj1-f67.google.com with SMTP id c6so2743174pje.1
 for <openrisc@lists.librecores.org>; Sat, 08 Aug 2020 15:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=I/495s6jK4+K+lb6gJ13kJw9U3KMzAEyRbv/wQPm9f8=;
 b=H3PLCcIdqUB3EIjsg8we5jSGI9NkkuDvWgva4xebovhozPZytq9rBepnyTmSuYCkKO
 8E7+pKxRjIoIvtunYP1O+4A+yPxtXwNYXUi1ToAzG8O0kgjOpUP5WdbULMZ0zpx2bPmh
 qzlcpfMbk2iDSkMqBQNDNL83I3ZOB6RajjCDS6khFj4cYF89Cmi6bxq+EpDduudOc16s
 OEYAVV2uA2Hmz6WgWKCSSa6bJazvH9z06VGgg7RbEd7l0VQYngs4gFnMo8rHJLCCXHwG
 X9SecNqMrx3wv/M4bGKVLlEgbhdYLmHSAiU1WrHFx96fo/BKuX4uGtYOJRtYUoxGORvv
 5jEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=I/495s6jK4+K+lb6gJ13kJw9U3KMzAEyRbv/wQPm9f8=;
 b=dIM6zFcWITJbCwaA4Nk1JeIlMLQaCKv7FYqjCgsDbbYxlzV8uHnoZkfSGQFbhRZAhz
 3me5SoXu9qix8bPpw9k2YiwclkVI4hNRxRIrQxzHiXcaElt5jGR2/1qY/pnzxJway/za
 VZAPbL3pUjcZSvwekxuR3HpiLL8432Hhy0F9BuBcApDmuklw/AZlDE7nGOCFIlSpT6m1
 NjsGbqBZrZNdt/pmfQN4yRQSji79kB64y8vcrcL/A5RyINBtVaADFBTaDe0sgiBZXubc
 M68IpUemXWvO7fODnX0BvrTmqmKSwvlCSw1oRGjStAkS2xzNu4+kUmxvf8US66jpoKff
 6M0g==
X-Gm-Message-State: AOAM530b+0Gy36hRir4a/niI4DgdzCRrbdlANJkWsXX2wG3WXwzN8ffJ
 YmA/I9VTz+H32jSjgC1aA0E=
X-Google-Smtp-Source: ABdhPJy18GEJMoZI66OE79WvxRq8YUz5aQXgKLgGrq2t6mfzL2oSPYvAGnuZyP8XL9T0CkaQJuQ9og==
X-Received: by 2002:a17:90a:1a42:: with SMTP id
 2mr18451210pjl.16.1596926104709; 
 Sat, 08 Aug 2020 15:35:04 -0700 (PDT)
Received: from localhost (g223.115-65-55.ppp.wakwak.ne.jp. [115.65.55.223])
 by smtp.gmail.com with ESMTPSA id y196sm18148356pfc.202.2020.08.08.15.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Aug 2020 15:35:03 -0700 (PDT)
Date: Sun, 9 Aug 2020 07:35:01 +0900
From: Stafford Horne <shorne@gmail.com>
To: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Message-ID: <20200808223501.GP80756@lianli.shorne-pla.net>
References: <20200805210725.310301-1-shorne@gmail.com>
 <20200805210725.310301-7-shorne@gmail.com>
 <20200806190229.b7jbmkavu7qqzegy@ltop.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200806190229.b7jbmkavu7qqzegy@ltop.local>
Subject: Re: [OpenRISC] [PATCH v2 6/6] openrisc: uaccess: Add user address
 space check to access_ok
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
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCBBdWcgMDYsIDIwMjAgYXQgMDk6MDI6MjlQTSArMDIwMCwgTHVjIFZhbiBPb3N0ZW5y
eWNrIHdyb3RlOgo+IE9uIFRodSwgQXVnIDA2LCAyMDIwIGF0IDA2OjA3OjI1QU0gKzA5MDAsIFN0
YWZmb3JkIEhvcm5lIHdyb3RlOgo+ID4gTm93IHRoYXQgX191c2VyIGFubm90YXRpb25zIGFyZSBm
aXhlZCBmb3Igb3BlbnJpc2MgdWFjY2VzcyBhcGkncyB3ZSBjYW4KPiA+IGFkZCBjaGVja2luZyB0
byB0aGUgYWNjZXNzX29rIG1hY3JvLiAgVGhpcyBwYXRjaCBhZGRzIHRoZSBfX2Noa191c2VyX3B0
cgo+ID4gY2hlY2ssIG9uIG5vcm1hbCBidWlsZHMgdGhlIGFkZGVkIGNoZWNrIGlzIGEgbm9wLgo+
ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4K
PiA+IC0tLQo+ID4gIGFyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vdWFjY2Vzcy5oIHwgMyArKy0K
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiAK
PiA+IGRpZmYgLS1naXQgYS9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCBiL2Fy
Y2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vdWFjY2Vzcy5oCj4gPiBpbmRleCA4NWE1NTM1OWIyNDQu
LjUzZGRjNjZhYmIzZiAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20v
dWFjY2Vzcy5oCj4gPiArKysgYi9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaAo+
ID4gQEAgLTU3LDcgKzU3LDggQEAgc3RhdGljIGlubGluZSBpbnQgX19yYW5nZV9vayh1bnNpZ25l
ZCBsb25nIGFkZHIsIHVuc2lnbmVkIGxvbmcgc2l6ZSkKPiA+ICAKPiA+ICAjZGVmaW5lIGFjY2Vz
c19vayhhZGRyLCBzaXplKQkJCQkJCVwKPiA+ICAoeyAJCQkJCQkJCQlcCj4gPiAtCV9fcmFuZ2Vf
b2soKHVuc2lnbmVkIGxvbmcpKGFkZHIpLCAoc2l6ZSkpOwkJCVwKPiA+ICsJX19jaGtfdXNlcl9w
dHIoYWRkcik7CQkJCQkJXAo+ID4gKwlfX3JhbmdlX29rKChfX2ZvcmNlIHVuc2lnbmVkIGxvbmcp
KGFkZHIpLCAoc2l6ZSkpOwkJXAo+ID4gIH0pCj4gCj4gSnVzdCBmb3IgaW5mbywgX19mb3JjZSBp
cyBub3QgbmVlZGVkIHdoZW4gY2FzdGluZyBhIHBvaW50ZXIgdG8KPiB1bnNpZ25lZCBsb25nIChv
ciB1aW50cHRyX3QpLiBJdCdzIG5vdCBpbmNvcnJlY3QgdG8gdXNlIG9uZQo+IGJ1dCBJIHRoaW5r
IGl0J3MgdG8gYXZvaWQgX19mb3JjZSBhcyBtdWNoIGFzIHBvc3NpYmxlLgoKVGhhbmtzLCBJIGRp
ZG4ndCByZWFsaXplIHRoYXQuICBJIHdpbGwgZml4LgoKLVN0YWZmb3JkCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApP
cGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3Jn
L2xpc3RpbmZvL29wZW5yaXNjCg==
