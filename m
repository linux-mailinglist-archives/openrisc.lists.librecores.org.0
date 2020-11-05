Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 63A512A892B
	for <lists+openrisc@lfdr.de>; Thu,  5 Nov 2020 22:38:43 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D8EEE20F86;
	Thu,  5 Nov 2020 22:38:42 +0100 (CET)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by mail.librecores.org (Postfix) with ESMTPS id 0700520EE3
 for <openrisc@lists.librecores.org>; Thu,  5 Nov 2020 22:38:41 +0100 (CET)
Received: by mail-pg1-f195.google.com with SMTP id h6so2268849pgk.4
 for <openrisc@lists.librecores.org>; Thu, 05 Nov 2020 13:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YH1Vbo0X/SCLdGG5UBoRfs+DK4j9xZJVKN5YvGEWVyI=;
 b=Qm2rHUaY70muUjLkt2Zu+5oFVOrUum8K177/uxBx+KsGi5Mu5qgYbQW0IRAVXGN3wV
 hBFPaZdL8u/uBgATv0Pl1Uov3B2K/kAak7Xpu/GcLPv3DuSovECUwe0A7tha2k5Nm06D
 tA6VyBBpyPkrl942d0b+alWg+i7PCkQ/wWXZ4NWhbw6MAOy7tCsK0gAKB92MGSNXmH+Q
 qp6KC+zvlPYnjLCK8HqNINnHKdAKd7lQ2m+sWxwESDOiUQv2NlGmvAneDHAU+JYCZF3m
 wiig8cbCQ1MG3V2+MAxdzvurdUJAZ8JKEr9KWp/zGku6qTm+buim2m74BkDhw94FFyNs
 bI5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YH1Vbo0X/SCLdGG5UBoRfs+DK4j9xZJVKN5YvGEWVyI=;
 b=bEvNtTrnAf1H1+rsDmprJM49JrD0VAylCQNT/xahzoF8W16ZFsaAQkLZd7iUjftkFl
 E1GoTrBTEfZd2baySXBuVs6uuOO2TvT4GDBfxkqQhAlLS0iGQ0O3zD6e2U8QyjrtiuV5
 ZRi0JftOjFUHsMpppVurY88eDDdJmQFbhPG4FMB9AFdJ0EKEYXVN3QLtAdNdFy9HjVNM
 KrikGNBD+wXphKL+49KlVT8ac01JykHePDvd3jlPkBE5qaIvIEqi7fa1txH5XcGXKAew
 R4Mg37JqcYRuxXNeyOy3ngsvTPnWpKjm/qtf3EmXFey1GPx6JLz60EF05TsdLk5TqlnN
 XF/A==
X-Gm-Message-State: AOAM5317hPknhwjk8y0vWpWh/aFdC6oS3pi31sikT9bFcUOSCBthCpFP
 fp69IE/hie6sTtOI8jdwYP4=
X-Google-Smtp-Source: ABdhPJyrTodCUjYh8pU5eiZx5wYv7uupgt1T5lbCtrJwx4CFHYKNlB9aJfEakEkpHrOtGXrKBlE/WQ==
X-Received: by 2002:a63:8c51:: with SMTP id q17mr4180046pgn.241.1604612319334; 
 Thu, 05 Nov 2020 13:38:39 -0800 (PST)
Received: from localhost (g133.220-213-56.ppp.wakwak.ne.jp. [220.213.56.133])
 by smtp.gmail.com with ESMTPSA id
 o13sm3149317pjq.19.2020.11.05.13.38.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 13:38:38 -0800 (PST)
Date: Fri, 6 Nov 2020 06:38:35 +0900
From: Stafford Horne <shorne@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Message-ID: <20201105213835.GD3294551@lianli.shorne-pla.net>
References: <35f5c4f7-06d9-ea5b-1bc1-f26b16eefca0@kernel.dk>
 <1c01cbf6-78ff-e33a-ee7c-57249e3bc6d8@kernel.dk>
 <874e8313-49bd-3b14-8981-daaa7b0d3992@kernel.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <874e8313-49bd-3b14-8981-daaa7b0d3992@kernel.dk>
Subject: Re: [OpenRISC] [PATCH] openrisc: add support for TIF_NOTIFY_SIGNAL
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
Cc: jonas@southpole.se, openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCBOb3YgMDUsIDIwMjAgYXQgMTE6MTU6MjNBTSAtMDcwMCwgSmVucyBBeGJvZSB3cm90
ZToKPiBBZGRpbmcgZm9sa3MgZnJvbSBNQUlOVEFJTkVSUywgYXMgdGhlIGxpc3QgYXBwZWFycyBj
bG9zZWQuCgpUaGFua3MsIEkgZGlkbid0IHJlYWxpemUgdGhlIGxpc3Qgd2FzIGJyb2tlbiwgSSB3
aWxsIGFzayB0aGUgYWRtaW5zCmFib3V0IGl0LgoKPiAKPiBPbiAxMS81LzIwIDk6MTggQU0sIEpl
bnMgQXhib2Ugd3JvdGU6Cj4gPiBHZW50bGUgbnVkZ2Ugb24gdGhpcyBvbmUuCj4gPiAKPiA+IE9u
IDEwLzI5LzIwIDEwOjE4IEFNLCBKZW5zIEF4Ym9lIHdyb3RlOgo+ID4+IFdpcmUgdXAgVElGX05P
VElGWV9TSUdOQUwgaGFuZGxpbmcgZm9yIG9wZW5yaXNjLgo+ID4+Cj4gPj4gQ2M6IG9wZW5yaXNj
QGxpc3RzLmxpYnJlY29yZXMub3JnCj4gPj4gU2lnbmVkLW9mZi1ieTogSmVucyBBeGJvZSA8YXhi
b2VAa2VybmVsLmRrPgo+ID4+IC0tLQo+ID4+Cj4gPj4gNS4xMSBoYXMgc3VwcG9ydCBxdWV1ZWQg
dXAgZm9yIFRJRl9OT1RJRllfU0lHTkFMLCBzZWUgdGhpcyBwb3N0aW5nCj4gPj4gZm9yIGRldGFp
bHM6Cj4gPj4KPiA+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9pby11cmluZy8yMDIwMTAyNjIw
MzIzMC4zODYzNDgtMS1heGJvZUBrZXJuZWwuZGsvCj4gPj4KPiA+PiBBcyBwYXJ0IG9mIHRoYXQg
d29yaywgSSdtIGFkZGluZyBUSUZfTk9USUZZX1NJR05BTCBzdXBwb3J0IHRvIGFsbCBhcmNocywK
PiA+PiBhcyB0aGF0IHdpbGwgZW5hYmxlIGEgc2V0IG9mIGNsZWFudXBzIG9uY2UgYWxsIG9mIHRo
ZW0gc3VwcG9ydCBpdC4gSSdtCj4gPj4gaGFwcHkgY2FycnlpbmcgdGhpcyBwYXRjaCBpZiBuZWVk
IGJlLCBvciBpdCBjYW4gYmUgZnVuZWxsZWQgdGhyb3VnaCB0aGUKPiA+PiBhcmNoIHRyZWUuIExl
dCBtZSBrbm93LgoKUGxlYXNlIGNhcnJ5IGl0LCB5b3UgY2FuIG1haW50YWluIHRoZSBkZXBlbmRl
bmNpZXMgZWFzaWVyLgoKPiA+PiAgYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS90aHJlYWRfaW5m
by5oIHwgMiArKwo+ID4+ICBhcmNoL29wZW5yaXNjL2tlcm5lbC9zaWduYWwuYyAgICAgICAgICAg
fCAyICstCj4gPj4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS90aHJl
YWRfaW5mby5oIGIvYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS90aHJlYWRfaW5mby5oCj4gPj4g
aW5kZXggOWFmZTY4YmM0MjNiLi40ZjlkMmEyNjE0NTUgMTAwNjQ0Cj4gPj4gLS0tIGEvYXJjaC9v
cGVucmlzYy9pbmNsdWRlL2FzbS90aHJlYWRfaW5mby5oCj4gPj4gKysrIGIvYXJjaC9vcGVucmlz
Yy9pbmNsdWRlL2FzbS90aHJlYWRfaW5mby5oCj4gPj4gQEAgLTk4LDYgKzk4LDcgQEAgcmVnaXN0
ZXIgc3RydWN0IHRocmVhZF9pbmZvICpjdXJyZW50X3RocmVhZF9pbmZvX3JlZyBhc20oInIxMCIp
Owo+ID4+ICAjZGVmaW5lIFRJRl9TSU5HTEVTVEVQCQk0CS8qIHJlc3RvcmUgc2luZ2xlc3RlcCBv
biByZXR1cm4gdG8gdXNlcgo+ID4+ICAJCQkJCSAqIG1vZGUKPiA+PiAgCQkJCQkgKi8KPiA+PiAr
I2RlZmluZSBUSUZfTk9USUZZX1NJR05BTAk1CS8qIHNpZ25hbCBub3RpZmljYXRpb25zIGV4aXN0
ICovCj4gPj4gICNkZWZpbmUgVElGX1NZU0NBTExfVFJBQ0VQT0lOVCAgOCAgICAgICAvKiBmb3Ig
ZnRyYWNlIHN5c2NhbGwgaW5zdHJ1bWVudGF0aW9uICovCj4gPj4gICNkZWZpbmUgVElGX1JFU1RP
UkVfU0lHTUFTSyAgICAgOQo+ID4+ICAjZGVmaW5lIFRJRl9QT0xMSU5HX05SRkxBRwkxNgkvKiB0
cnVlIGlmIHBvbGxfaWRsZSgpIGlzIHBvbGxpbmcJCQkJCQkgKiBUSUZfTkVFRF9SRVNDSEVECj4g
Pj4gQEAgLTEwOSw2ICsxMTAsNyBAQCByZWdpc3RlciBzdHJ1Y3QgdGhyZWFkX2luZm8gKmN1cnJl
bnRfdGhyZWFkX2luZm9fcmVnIGFzbSgicjEwIik7Cj4gPj4gICNkZWZpbmUgX1RJRl9TSUdQRU5E
SU5HCQkoMTw8VElGX1NJR1BFTkRJTkcpCj4gPj4gICNkZWZpbmUgX1RJRl9ORUVEX1JFU0NIRUQJ
KDE8PFRJRl9ORUVEX1JFU0NIRUQpCj4gPj4gICNkZWZpbmUgX1RJRl9TSU5HTEVTVEVQCQkoMTw8
VElGX1NJTkdMRVNURVApCj4gPj4gKyNkZWZpbmUgX1RJRl9OT1RJRllfU0lHTkFMCSgxPDxUSUZf
Tk9USUZZX1NJR05BTCkKPiA+PiAgI2RlZmluZSBfVElGX1BPTExJTkdfTlJGTEFHCSgxPDxUSUZf
UE9MTElOR19OUkZMQUcpCj4gPj4gIAo+ID4+ICAKPiA+PiBkaWZmIC0tZ2l0IGEvYXJjaC9vcGVu
cmlzYy9rZXJuZWwvc2lnbmFsLmMgYi9hcmNoL29wZW5yaXNjL2tlcm5lbC9zaWduYWwuYwo+ID4+
IGluZGV4IGFmNjZmOTY4ZGQ0NS4uMWViY2ZmMjcxMDk2IDEwMDY0NAo+ID4+IC0tLSBhL2FyY2gv
b3BlbnJpc2Mva2VybmVsL3NpZ25hbC5jCj4gPj4gKysrIGIvYXJjaC9vcGVucmlzYy9rZXJuZWwv
c2lnbmFsLmMKPiA+PiBAQCAtMjk5LDcgKzI5OSw3IEBAIGRvX3dvcmtfcGVuZGluZyhzdHJ1Y3Qg
cHRfcmVncyAqcmVncywgdW5zaWduZWQgaW50IHRocmVhZF9mbGFncywgaW50IHN5c2NhbGwpCj4g
Pj4gIAkJCWlmICh1bmxpa2VseSghdXNlcl9tb2RlKHJlZ3MpKSkKPiA+PiAgCQkJCXJldHVybiAw
Owo+ID4+ICAJCQlsb2NhbF9pcnFfZW5hYmxlKCk7Cj4gPj4gLQkJCWlmICh0aHJlYWRfZmxhZ3Mg
JiBfVElGX1NJR1BFTkRJTkcpIHsKPiA+PiArCQkJaWYgKHRocmVhZF9mbGFncyAmIChfVElGX1NJ
R1BFTkRJTkd8X1RJRl9OT1RJRllfU0lHTkFMKSkgewo+ID4+ICAJCQkJaW50IHJlc3RhcnQgPSBk
b19zaWduYWwocmVncywgc3lzY2FsbCk7Cj4gPj4gIAkJCQlpZiAodW5saWtlbHkocmVzdGFydCkp
IHsKPiA+PiAgCQkJCQkvKgo+ID4+Cj4gPiAKPiA+IAo+IAo+IAo+IC0tIAo+IEplbnMgQXhib2UK
ClRoaXMgbG9va3MgZmluZSB0byBtZS4KCkFja2VkLWJ5OiBTdGFmZm9yZCBIb3JuZSA8c2hvcm5l
QGdtYWlsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpo
dHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
