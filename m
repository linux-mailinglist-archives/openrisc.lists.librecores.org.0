Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C74CD3C1B9F
	for <lists+openrisc@lfdr.de>; Fri,  9 Jul 2021 00:57:06 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 7F07223F6F;
	Fri,  9 Jul 2021 00:57:06 +0200 (CEST)
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by mail.librecores.org (Postfix) with ESMTP id BCF2A2138F
 for <openrisc@lists.librecores.org>; Fri,  9 Jul 2021 00:57:05 +0200 (CEST)
Received: from [192.168.126.129] ([146.241.183.1])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 1cx5mlcQVrxAb1cx5mK2cx; Fri, 09 Jul 2021 00:57:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1625785025; bh=1pUrQMVyWBaFFjWh76HtrbGnVW8BgNrdLnqQVRxqyVQ=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=KpE27iRkEwOCSOauSOK1OF8YgNczVx4L1QzhiRKECQ8oFnO7BKcf+igiNA6usiohj
 8ChFeQxEaszZXUw7+ylPXM+ofxzJDYBz1uywnsBllQ+wTNuOyydyeex3B14zpF2r+i
 GfMNxzlRgw1XlbV3LFAWfaDDKoOTBUn3kl4nBQCPIjL2DR5etBHWYyT8YlrsF6grW1
 HRSXpH85E87BT7TLxVeFBnMrXc1+xepvuNTTF9OWoB3f8D2Ck02b656VbVven9NEt8
 y5ONN0dEbfQRnpzd0mrYiHnZD4aQhgSrgqD9dZo8H8fZg906BZUCQMtXif8LFN60uS
 +JzGz2i1jvCGw==
To: Stafford Horne <shorne@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <dbcce22d-b288-2451-4a8d-681f802c6f49@benettiengineering.com>
 <CAAfxs77Y1qOzex=Bkn5c_4Zxt6nzZP2cpG6qJ85eXnrAm18FgA@mail.gmail.com>
 <6bc67759-18c2-bca5-bdb2-c637e873b8ab@benettiengineering.com>
 <YMvdpzYqcwNzAeQ/@antec> <YOYXPQENdaFWobWO@antec>
 <942dec94-e7e6-33d6-84e6-715e5e368c98@linaro.org> <YOdxwtNeQ2eUr+L3@antec>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <188474ce-6549-536f-9cb8-08cc0e2b551c@benettiengineering.com>
Date: Fri, 9 Jul 2021 00:57:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YOdxwtNeQ2eUr+L3@antec>
Content-Language: en-US
X-CMAE-Envelope: MS4wfGiSUo3z4pV9gLMCHnX1qzZoxVVs/p5LquQJSa/Sm1lcM7/0xqFHI9M+sveXjB3yM5P5daa7KdA+0vzSR4vUJK5WRnVinYqi+ndGb78Q0InqvPYBrIl6
 BzQ/wZrQ1HnC8DhE24aYfGf8Byo5Qgy/ac0yKOmTxdzaa0hof8U0zqDWflbxrT0tU2pOzbvImxUI8QmqZJDbb+YpLxfKs5jkgmLsc+ITZY9c2kpi0QB/rfn9
 mI4+nI8reGX2y4nC4FS/4E4AYeQIknMxO7+/7f02NJaJTgPp8K9JvhH6ioCJsNljRPLPX0lWe2Lf3ZC30yqpIU+jcTt9ef4nZxDTGyEpZhk=
Subject: Re: [OpenRISC] Maybe another or1k bug
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
Cc: Openrisc <openrisc@lists.librecores.org>,
 GNU Binutils <binutils@sourceware.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgU3RhZmZvcmQsCgpPbiA3LzgvMjEgMTE6NDQgUE0sIFN0YWZmb3JkIEhvcm5lIHdyb3RlOgo+
IE9uIFdlZCwgSnVsIDA3LCAyMDIxIGF0IDAyOjI1OjM5UE0gLTA3MDAsIFJpY2hhcmQgSGVuZGVy
c29uIHdyb3RlOgo+PiBPbiA3LzcvMjEgMjowNiBQTSwgU3RhZmZvcmQgSG9ybmUgd3JvdGU6Cj4+
PiArQ0MgUmljaGFyZHMgb3RoZXIgYWNjb3VudAo+Pj4KPj4+IEhpIFJpY2hhcmQsCj4+Pgo+Pj4g
SSBDY2VkIHRoaXMgdG8geW91IHR3aWRkbGUubmV0IGFjY291bnQgeW91IG9uIHRoaXMgb25lIG9y
aWdpbmFsbHkuIERvIHlvdSByZWNhbGwKPj4+IHdoeSB3ZSBhZGRlZCB0aGUgYmVsb3cgY2hlY2sg
aW4gb3IxayBiZmQ/ICBJdCBzZWVtcyB0byBiZSBvdmVybHkgcmVzdHJpY3RpdmUgYW5kCj4+PiBj
YXVzaW5nIHNvbWUgaXNzdWVzIGJlbG93Lgo+Pj4KPj4+ICAgIGNhc2UgUl9PUjFLX0lOU05fUkVM
XzI2Ogo+Pj4gICAgICBpZiAoYmZkX2xpbmtfcGljIChpbmZvKSAmJiAhU1lNQk9MX1JFRkVSRU5D
RVNfTE9DQUwgKGluZm8sIGgpKQo+Pj4gICAgICAgIEVSUk9SCj4+IC4uLgo+Pj4+IDQuIFRoZSBz
eW1ib2xzIGFyZSBmcm9tIGByZWFkZWxmIC1zYDoKPj4+Pgo+Pj4+ICAgICAgMjIxOiAwMDAwOGNl
NCAgIDcxNiBGVU5DICAgIEdMT0JBTCBQUk9URUNURUQgICAyNCBhbFNvdXJjZVBhdXNldgo+Pj4+
ICAgICAgMjIyOiAwMDAwOGZiMCAgICAzNiBGVU5DICAgIEdMT0JBTCBQUk9URUNURUQgICAyNCBh
bFNvdXJjZVBhdXNlCj4+Pj4gICAgICAyMjM6IDAwMDA4ZmQ0ICAgNzg0IEZVTkMgICAgR0xPQkFM
IFBST1RFQ1RFRCAgIDI0IGFsU291cmNlU3RvcHYKPj4+PiAgICAgIDIyNDogMDAwMDkyZTQgICAg
MzYgRlVOQyAgICBHTE9CQUwgUFJPVEVDVEVEICAgMjQgYWxTb3VyY2VTdG9wCj4+Pj4gICAgICAy
MjU6IDAwMDA5MzA4ICAgNzIwIEZVTkMgICAgR0xPQkFMIFBST1RFQ1RFRCAgIDI0IGFsU291cmNl
UmV3aW5kdgo+Pj4+ICAgICAgMjI2OiAwMDAwOTVkOCAgICAzNiBGVU5DICAgIEdMT0JBTCBQUk9U
RUNURUQgICAyNCBhbFNvdXJjZVJld2luZAo+Pgo+PiBBaCwgU1RWX1BST1RFQ1RFRC4gIFVudXN1
YWwuCj4+Cj4+IEl0IGxvb2tzIGxpa2UgdGhpcyBzaG91bGQgYmUgU1lNQk9MX0NBTExTX0xPQ0FM
LiAgVGhlIG9ubHkgZGlmZmVyZW5jZSBmcm9tCj4+IFNZTUJPTF9SRUZFUkVOQ0VTX0xPQ0FMIGlz
IHZlcnN1cyBwcm90ZWN0ZWQgc3ltYm9scy4KPiAKPiBUaGFua3MgUmljaGFyZC4KPiAKPiBJIHdp
bGwgcG9zdCBhIHBhdGNoIGZvciB0aGlzIGluIGEgZmV3IGRheXMuICBPciwgbWF5YmUgR2l1bGlv
IGNhbiBkbyBpdCBpZiBoZQo+IGhhcyB0aW1lLgoKWWVzLCBJIGNhbiBnaXZlIGEgdHJ5LiBJJ3Zl
IG5ldmVyIHBhdGNoZWQgYmludXRpbHMgYnV0IEkgY2FuIHRyeSB0by4gCkknbGwgbGV0IHlvdSBr
bm93IHRoZSByZXN1bHQgc29vbi4KClRoYW5rIHlvdSBhbmQKQmVzdCByZWdhcmRzCi0tIApHaXVs
aW8gQmVuZXR0aQpCZW5ldHRpIEVuZ2luZWVyaW5nIHNhcwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NA
bGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5m
by9vcGVucmlzYwo=
