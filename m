Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id AB1AE4E3743
	for <lists+openrisc@lfdr.de>; Tue, 22 Mar 2022 04:10:44 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 4F9A22485E;
	Tue, 22 Mar 2022 04:10:44 +0100 (CET)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mail.librecores.org (Postfix) with ESMTPS id CA2D024847
 for <openrisc@lists.librecores.org>; Tue, 22 Mar 2022 04:10:42 +0100 (CET)
Received: by mail-pj1-f52.google.com with SMTP id b8so14570976pjb.4
 for <openrisc@lists.librecores.org>; Mon, 21 Mar 2022 20:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Hh+l+cDJOH+rmHGFl5Z8Zd7K4dLUYHJocdz9v2HO6zA=;
 b=DjtmHKskX4TxeKbVb7A93JrGp2xt18gLwaV/CfU6iNuYFEdrAE1RP9ngjSmWlQq13X
 yHAxabQDUqqWL45RtLOICtJf40+Gw0+ps6Y9Uq1uM+L7l1QUKvFRirvhaJOrT/kAg/9X
 wNvXOLCWc4HE2YMGhHYgJ8xDGCbuo1qWdoXBThR4yz4nKi3EbI10zq7VCWwUZP44Znq5
 Ht1vQtGaa9S25e03tNwBJ5eR8sbMM2GdHdFFgFD8RHjkpInfUCZ1l+WWPm7viu8CUe5C
 aGh+Dea1u2wzHcWT4ZdW1u6zquKoTRTy4hix8MEkUKRaOqMESjh5vkUuC7SFEKzSVR4X
 hysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Hh+l+cDJOH+rmHGFl5Z8Zd7K4dLUYHJocdz9v2HO6zA=;
 b=QjfINyRkztgo1cEHCvppOQm/zwilZnPImfXtdFid6k8g9yW2agWMdsyajXN5p1JByY
 AKqRWo+PQsw6ABQ+lFOsCQAX56rpF5ZeVTC7z//LheH4CesUYJuMOS6u1DQsUA+W7Jg8
 GkhEXf7QbUDk5J9TXWfxJAv8ddne2pX7OZtwq+XztS+bssJPSvb4gSDgaePJSVLR+hx0
 zbmLTHDQ+7HUjq15TPFYjQAf5l4syCHdp7/6L/F2D+Q+PnI+h9iy/nedNBFImsMLGb29
 w2WL5VOjInRN28OvsMboks4zXbWwcmvyIZxv7L82Nx4r0XSjujki3GyhZaiImg58Ui9O
 xE1Q==
X-Gm-Message-State: AOAM532rvKbOkEz+WfS9QUaiUb3xKXu10ziSb4Gq3vBXgKIvg/sQsF4G
 yOoZXcB70VtaDwcl1YfOUWc=
X-Google-Smtp-Source: ABdhPJzg61lhXH43T0oAx2tFK5dMDO7rgoTBBFqYh0KY+3YN04A1J1laQWvkvScPHw0opdbB0iyBtg==
X-Received: by 2002:a17:902:e9d3:b0:154:6dd6:2521 with SMTP id
 19-20020a170902e9d300b001546dd62521mr5289232plk.59.1647918641193; 
 Mon, 21 Mar 2022 20:10:41 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 s141-20020a632c93000000b0038134d09219sm16260355pgs.55.2022.03.21.20.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 20:10:37 -0700 (PDT)
Date: Tue, 22 Mar 2022 12:10:36 +0900
From: Stafford Horne <shorne@gmail.com>
To: guoren@kernel.org
Message-ID: <Yjk+LGwhc50zvsk2@antec>
References: <20220319035457.2214979-1-guoren@kernel.org>
 <20220319035457.2214979-2-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220319035457.2214979-2-guoren@kernel.org>
Subject: Re: [OpenRISC] [PATCH V2 1/5] asm-generic: ticket-lock: New generic
 ticket-based spinlock
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
Cc: linux-arch@vger.kernel.org, arnd@arndb.de, peterz@infradead.org,
 boqun.feng@gmail.com, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 openrisc@lists.librecores.org, palmer@dabbelt.com,
 Palmer Dabbelt <palmer@rivosinc.com>, longman@redhat.com,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGVsbG8sCgpUaGVyZSBpcyBhIHByb2JsZW0gd2l0aCB0aGlzIHBhdGNoIG9uIEJpZyBFbmRpYW4g
bWFjaGluZXMsIHNlZSBiZWxvdy4KCk9uIFNhdCwgTWFyIDE5LCAyMDIyIGF0IDExOjU0OjUzQU0g
KzA4MDAsIGd1b3JlbkBrZXJuZWwub3JnIHdyb3RlOgo+IEZyb206IFBldGVyIFppamxzdHJhIDxw
ZXRlcnpAaW5mcmFkZWFkLm9yZz4KPiAKPiBUaGlzIGlzIGEgc2ltcGxlLCBmYWlyIHNwaW5sb2Nr
LiAgU3BlY2lmaWNhbGx5IGl0IGRvZXNuJ3QgaGF2ZSBhbGwgdGhlCj4gc3VidGxlIG1lbW9yeSBt
b2RlbCBkZXBlbmRlbmNpZXMgdGhhdCBxc3BpbmxvY2sgaGFzLCB3aGljaCBtYWtlcyBpdCBtb3Jl
Cj4gc3VpdGFibGUgZm9yIHNpbXBsZSBzeXN0ZW1zIGFzIGl0IGlzIG1vcmUgbGlrZWx5IHRvIGJl
IGNvcnJlY3QuCj4gCj4gW1BhbG1lcjogY29tbWl0IHRleHRdCj4gU2lnbmVkLW9mZi1ieTogUGFs
bWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+Cj4gCj4gLS0KPiAKPiBJIGhhdmUgc3Bl
Y2lmaWNhbGx5IG5vdCBpbmNsdWRlZCBQZXRlcidzIFNPQiBvbiB0aGlzLCBhcyBoZSBzZW50IGhp
cwo+IG9yaWdpbmFsIHBhdGNoCj4gPGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvWUhiQkJ1
VkZObkk0a2pqM0BoaXJlei5wcm9ncmFtbWluZy5raWNrcy1hc3MubmV0Lz4KPiB3aXRob3V0IG9u
ZS4KPiAtLS0KPiAgaW5jbHVkZS9hc20tZ2VuZXJpYy9zcGlubG9jay5oICAgICAgICAgIHwgMTEg
KysrLQo+ICBpbmNsdWRlL2FzbS1nZW5lcmljL3NwaW5sb2NrX3R5cGVzLmggICAgfCAxNSArKysr
Kwo+ICBpbmNsdWRlL2FzbS1nZW5lcmljL3RpY2tldC1sb2NrLXR5cGVzLmggfCAxMSArKysrCj4g
IGluY2x1ZGUvYXNtLWdlbmVyaWMvdGlja2V0LWxvY2suaCAgICAgICB8IDg2ICsrKysrKysrKysr
KysrKysrKysrKysrKysKPiAgNCBmaWxlcyBjaGFuZ2VkLCAxMjAgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvYXNtLWdlbmVyaWMvc3Bp
bmxvY2tfdHlwZXMuaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9hc20tZ2VuZXJpYy90
aWNrZXQtbG9jay10eXBlcy5oCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2FzbS1nZW5l
cmljL3RpY2tldC1sb2NrLmgKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9hc20tZ2VuZXJpYy90
aWNrZXQtbG9jay5oIGIvaW5jbHVkZS9hc20tZ2VuZXJpYy90aWNrZXQtbG9jay5oCj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjU5MzczZGUzZTMyYQo+IC0tLSAv
ZGV2L251bGwKPiArKysgYi9pbmNsdWRlL2FzbS1nZW5lcmljL3RpY2tldC1sb2NrLmgKCi4uLgoK
PiArc3RhdGljIF9fYWx3YXlzX2lubGluZSB2b2lkIHRpY2tldF91bmxvY2soYXJjaF9zcGlubG9j
a190ICpsb2NrKQo+ICt7Cj4gKwl1MTYgKnB0ciA9ICh1MTYgKilsb2NrICsgX19pc19kZWZpbmVk
KF9fQklHX0VORElBTik7CgpBcyBtZW50aW9uZWQsIHRoaXMgcGF0Y2ggc2VyaWVzIGJyZWFrcyBT
TVAgb24gT3BlblJJU0MuICBJIHRyYWNlZCBpdCB0byB0aGlzCmxpbmUuICBUaGUgYWJvdmUgYF9f
aXNfZGVmaW5lZChfX0JJR19FTkRJQU4pYCAgZG9lcyBub3QgcmV0dXJuIDEgYXMgZXhwZWN0ZWQK
ZXZlbiBvbiBCSUdfRU5ESUFOIG1hY2hpbmVzLiAgVGhpcyB3b3JrczoKCgpkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9hc20tZ2VuZXJpYy90aWNrZXQtbG9jay5oIGIvaW5jbHVkZS9hc20tZ2VuZXJpYy90
aWNrZXQtbG9jay5oCmluZGV4IDU5MzczZGUzZTMyYS4uNTJiNWRjOWZmZGJhIDEwMDY0NAotLS0g
YS9pbmNsdWRlL2FzbS1nZW5lcmljL3RpY2tldC1sb2NrLmgKKysrIGIvaW5jbHVkZS9hc20tZ2Vu
ZXJpYy90aWNrZXQtbG9jay5oCkBAIC0yNiw2ICsyNiw3IEBACiAjZGVmaW5lIF9fQVNNX0dFTkVS
SUNfVElDS0VUX0xPQ0tfSAogCiAjaW5jbHVkZSA8bGludXgvYXRvbWljLmg+CisjaW5jbHVkZSA8
bGludXgva2NvbmZpZy5oPgogI2luY2x1ZGUgPGFzbS1nZW5lcmljL3RpY2tldC1sb2NrLXR5cGVz
Lmg+CiAKIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCB0aWNrZXRfbG9jayhhcmNoX3NwaW5s
b2NrX3QgKmxvY2spCkBAIC01MSw3ICs1Miw3IEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgYm9v
bCB0aWNrZXRfdHJ5bG9jayhhcmNoX3NwaW5sb2NrX3QgKmxvY2spCiAKIHN0YXRpYyBfX2Fsd2F5
c19pbmxpbmUgdm9pZCB0aWNrZXRfdW5sb2NrKGFyY2hfc3BpbmxvY2tfdCAqbG9jaykKIHsKLSAg
ICAgICB1MTYgKnB0ciA9ICh1MTYgKilsb2NrICsgX19pc19kZWZpbmVkKF9fQklHX0VORElBTik7
CisgICAgICAgdTE2ICpwdHIgPSAodTE2ICopbG9jayArIElTX0VOQUJMRUQoQ09ORklHX0NQVV9C
SUdfRU5ESUFOKTsKICAgICAgICB1MzIgdmFsID0gYXRvbWljX3JlYWQobG9jayk7CiAKICAgICAg
ICBzbXBfc3RvcmVfcmVsZWFzZShwdHIsICh1MTYpdmFsICsgMSk7CgoKPiArCXUzMiB2YWwgPSBh
dG9taWNfcmVhZChsb2NrKTsKPiArCj4gKwlzbXBfc3RvcmVfcmVsZWFzZShwdHIsICh1MTYpdmFs
ICsgMSk7Cj4gK30KPiArCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMu
b3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
