Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 42D263A1F29
	for <lists+openrisc@lfdr.de>; Wed,  9 Jun 2021 23:44:51 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id EE54720D64;
	Wed,  9 Jun 2021 23:44:50 +0200 (CEST)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mail.librecores.org (Postfix) with ESMTPS id 7C11120D64
 for <openrisc@lists.librecores.org>; Wed,  9 Jun 2021 23:44:48 +0200 (CEST)
Received: by mail-pg1-f172.google.com with SMTP id e20so8906248pgg.0
 for <openrisc@lists.librecores.org>; Wed, 09 Jun 2021 14:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1EGVQfeBpJI/bG4+CHXSTxMquBa6qoPRig2ErgKOmDA=;
 b=jtMsXCyZI71iIZvOshRbJiUxpjM02r68hJNxR0R990QD4DdKfE6HCWRtMsgV1ibdj2
 N/pX9nzLoTJAvUDupvnDDkghwezm/t5rTWDwCkrIobs3Ku1bMzLs0JmqpVLoFNentBcK
 nXqXsV2LVaMzyXypxQiMKsHbT579OVSkUg+SB4dMIEVTzv9gCoaBWZAi3S2MR1IUZQTd
 XxSIDZP9uwFEyvswbmYfFJWW3lAAJOg2HXBCYfC8clf81+8SKa5psZvuhR5BQTS7RFYh
 pqvL+IT1goVl3wvGZeDR3/C57qK3ZEO1B5jvZ/juVYgTPj04W4OavBpFUy6R/0VLP71F
 Tt+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1EGVQfeBpJI/bG4+CHXSTxMquBa6qoPRig2ErgKOmDA=;
 b=O2Z+APf7eOO2eDLA43jZvOkFbTKiTVaM6ppjVZyVrrB949T2fgtfYUevZJh8yDtzTA
 uK4ct+g6p/rd1jw+227og9YjNamqXu0TmGhgAfVsDaVR/WekeXihh5l7oC36DU3Kv6e9
 Dorvrmabz4eRxy8djPK/E3XPBu61lsJGMCg63N/jxCkx5cuwm4H4YVP0ykZcAUHlIDdf
 hPVP7YmDTEBLskort7iRv5MUDaQ46aA/7tewgo6fIC2+jZtXV2VCDRw7Bob86ik2lOHM
 BuvayaxDrTpwDmYeO9y6o/YUJJ11TFbR9sPGSHx/3S5LN9tXYxy5VqhP7eCflV4FF8gm
 uZLA==
X-Gm-Message-State: AOAM531FpwY+ob5XG7TugQ3zvzkjI8MpXbQbnv5r16rtJjSnUkdYjNdr
 NatMfUhkEAZH5dXdPAUFskU=
X-Google-Smtp-Source: ABdhPJzKqTGBM+IUrhpwv0LZYxHh2IReZgPGp3Q7l9qsNm7kC+clZladzo5EEoLWC3IXzeT9AUpSVA==
X-Received: by 2002:a62:8855:0:b029:2ec:8119:d1c7 with SMTP id
 l82-20020a6288550000b02902ec8119d1c7mr1741643pfd.72.1623275086748; 
 Wed, 09 Jun 2021 14:44:46 -0700 (PDT)
Received: from localhost (g151.115-65-219.ppp.wakwak.ne.jp. [115.65.219.151])
 by smtp.gmail.com with ESMTPSA id
 t39sm420938pfg.147.2021.06.09.14.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 14:44:46 -0700 (PDT)
Date: Thu, 10 Jun 2021 06:44:43 +0900
From: Stafford Horne <shorne@gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <YME2SzQdpj/AVz/2@antec>
References: <20210609153059.191496-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210609153059.191496-1-giulio.benetti@benettiengineering.com>
Subject: Re: [OpenRISC] [PATCH] bfd/elf32-or1k: fix building with gcc
 version < 5
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBKdW4gMDksIDIwMjEgYXQgMDU6MzA6NTlQTSArMDIwMCwgR2l1bGlvIEJlbmV0dGkg
d3JvdGU6Cj4gR2NjIHZlcnNpb24gPj0gNSBoYXMgc3RhbmRhcmQgQyBtb2RlIG5vdCBzZXQgdG8g
LXN0ZD1nbnUxMSwgc28gaWYgd2UgdXNlCj4gYW4gb2xkIGNvbXBpbGVyKGkuZS4gZ2NjIDQuOSkg
YnVpbGQgZmFpbHMgb246Cj4gYGBgCj4gZWxmMzItb3Ixay5jOjIyNTE6MzogZXJyb3I6ICdmb3In
IGxvb3AgaW5pdGlhbCBkZWNsYXJhdGlvbnMgYXJlIG9ubHkgYWxsb3dlZCBpbgo+IEM5OSBvciBD
MTEgbW9kZQo+ICAgICBmb3IgKHNpemVfdCBpID0gMDsgaSA8IGluc25fY291bnQ7IGkrKykKPiAg
ICAgXgo+IGBgYAo+IAo+IFNvIGxldCdzIGRlY2xhcmUgYHNpemVfdCBpYCBhdCB0aGUgdG9wIG9m
IHRoZSBmdW5jdGlvbiBpbnN0ZWFkIG9mIGluc2lkZQo+IGZvciBsb29wLgoKVGhpcyBsb29rcyBv
ayB0byBtZS4gIENhbiB5b3UgYWxzbyBpbmNsdWRlIHRoZSBjaGFuZ2Vsb2cgZW50cnkgbmVlZGVk
IGZvcgpiaW51dGlscyBwYXRjaGVzPwoKU29tZXRoaW5nIGxpa2U6CgpiZmQvQ2hhbmdlTG9nOgoK
CSogZWxmMzItb3Ixay5jIChvcjFrX3dyaXRlX3BsdF9lbnRyeSk6IE1vdmUgaSBkZWNsYXJhdGlv
biB0byB0b3Agb2YKCWZ1bmN0aW9uLgoKPiBTaWduZWQtb2ZmLWJ5OiBHaXVsaW8gQmVuZXR0aSA8
Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4KPiAtLS0KPiAgYmZkL2VsZjMy
LW9yMWsuYyB8IDUgKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYmZkL2VsZjMyLW9yMWsuYyBiL2JmZC9lbGYz
Mi1vcjFrLmMKPiBpbmRleCA0YWU3ZjMyNGQzMy4uMzIwNjNhYjAyODkgMTAwNjQ0Cj4gLS0tIGEv
YmZkL2VsZjMyLW9yMWsuYwo+ICsrKyBiL2JmZC9lbGYzMi1vcjFrLmMKPiBAQCAtMjI0NCw5ICsy
MjQ0LDEwIEBAIG9yMWtfd3JpdGVfcGx0X2VudHJ5IChiZmQgKm91dHB1dF9iZmQsIGJmZF9ieXRl
ICpjb250ZW50cywgdW5zaWduZWQgaW5zbmosCj4gIHsKPiAgICB1bnNpZ25lZCBub2RlbGF5ID0g
ZWxmX2VsZmhlYWRlciAob3V0cHV0X2JmZCktPmVfZmxhZ3MgJiBFRl9PUjFLX05PREVMQVk7Cj4g
ICAgdW5zaWduZWQgb3V0cHV0X2luc25zW1BMVF9NQVhfSU5TTl9DT1VOVF07Cj4gKyAgc2l6ZV90
IGk7Cj4gIAo+ICAgIC8qIENvcHkgaW5zdHJ1Y3Rpb25zIGludG8gdGhlIG91dHB1dCBidWZmZXIu
ICAqLwo+IC0gIGZvciAoc2l6ZV90IGkgPSAwOyBpIDwgaW5zbl9jb3VudDsgaSsrKQo+ICsgIGZv
ciAoaSA9IDA7IGkgPCBpbnNuX2NvdW50OyBpKyspCj4gICAgICBvdXRwdXRfaW5zbnNbaV0gPSBp
bnNuc1tpXTsKPiAgCj4gICAgLyogSG9ub3IgdGhlIG5vLWRlbGF5LXNsb3Qgc2V0dGluZy4gICov
Cj4gQEAgLTIyNzcsNyArMjI3OCw3IEBAIG9yMWtfd3JpdGVfcGx0X2VudHJ5IChiZmQgKm91dHB1
dF9iZmQsIGJmZF9ieXRlICpjb250ZW50cywgdW5zaWduZWQgaW5zbmosCj4gICAgICB9Cj4gIAo+
ICAgIC8qIFdyaXRlIG91dCB0aGUgb3V0cHV0IGJ1ZmZlci4gICovCj4gLSAgZm9yIChzaXplX3Qg
aSA9IDA7IGkgPCAoaW5zbl9jb3VudCsxKTsgaSsrKQo+ICsgIGZvciAoaSA9IDA7IGkgPCAoaW5z
bl9jb3VudCsxKTsgaSsrKQo+ICAgICAgYmZkX3B1dF8zMiAob3V0cHV0X2JmZCwgb3V0cHV0X2lu
c25zW2ldLCBjb250ZW50cyArIChpKjQpKTsKPiAgfQo+ICAKPiAtLSAKPiAyLjI1LjEKPiAKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFp
bGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGli
cmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
