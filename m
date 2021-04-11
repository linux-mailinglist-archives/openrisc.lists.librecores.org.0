Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 550F135B5F9
	for <lists+openrisc@lfdr.de>; Sun, 11 Apr 2021 18:01:30 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B426821325;
	Sun, 11 Apr 2021 18:01:28 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 2C822202AE
 for <openrisc@lists.librecores.org>; Sun, 11 Apr 2021 18:01:26 +0200 (CEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1A5D7610C7
 for <openrisc@lists.librecores.org>; Sun, 11 Apr 2021 16:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618156884;
 bh=bxyiUc7lO8RjWeGmFNt0Glxp3nNNC162o0D7XY+vRXg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ocbV3yCEonWttAc1zcbh4sFMlpL/8mLiYxvnPxd4vaNWUoxIUghQq/418Vd/8+OsQ
 uJqpH09JX3FyCKp5XaQYZxmUsBFGWg8DBDqrZUYcGC9eTTDGDZ7Pv1fsnvFz66yY3l
 CqFgPgBK9ODxn1O/DoS0JWKwm1nNfEok9TRCbissXEHtyCsrFX5+LauK+0HULFJudx
 MheQDdG6dqOZZtISRGENS7K5+2Yo60vM8RzSwh/VaorG8/XaeVnWmZ6gy7/XASCyPB
 iuDB+RBHMB+CmVctzSKyVDMGk7JOvcTcXfexy6bCgR4aqAXQUWdHhM9dc/xolI6hq+
 ieCqE55bqcOfw==
Received: by mail-lj1-f179.google.com with SMTP id o16so12297668ljp.3
 for <openrisc@lists.librecores.org>; Sun, 11 Apr 2021 09:01:24 -0700 (PDT)
X-Gm-Message-State: AOAM533Ta9kiPPliSy1KXHbIk9qIpwpnU6YQda8Ji/Vuj2IuzPhgVF7K
 CUoMBKrDi+coeU9XFihrilGsvGRzK9v7AvaBQxE=
X-Google-Smtp-Source: ABdhPJy10CnI96Z9R6HlWIrVpcoYY10s7Y9maxlV3dOVr4CugIJl0sk8MNc8rkDLu53Ak6ongjwa0tUvq8SrIM/7luU=
X-Received: by 2002:a05:651c:3c3:: with SMTP id
 f3mr15178457ljp.105.1618156882398; 
 Sun, 11 Apr 2021 09:01:22 -0700 (PDT)
MIME-Version: 1.0
References: <1617201040-83905-1-git-send-email-guoren@kernel.org>
 <1617201040-83905-5-git-send-email-guoren@kernel.org>
In-Reply-To: <1617201040-83905-5-git-send-email-guoren@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 12 Apr 2021 00:01:10 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT2Pe8o0wm1ohJE-A0HNjteiB6T3HMcH3Fdj7Tm7SSR8Q@mail.gmail.com>
Message-ID: <CAJF2gTT2Pe8o0wm1ohJE-A0HNjteiB6T3HMcH3Fdj7Tm7SSR8Q@mail.gmail.com>
To: Guo Ren <guoren@kernel.org>
Subject: Re: [OpenRISC] [PATCH v6 4/9] csky: locks: Optimize coding
 convention
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
Cc: linux-arch <linux-arch@vger.kernel.org>, linux-xtensa@linux-xtensa.org,
 Guo Ren <guoren@linux.alibaba.com>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, openrisc@lists.librecores.org,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBNYXIgMzEsIDIwMjEgYXQgMTA6MzIgUE0gPGd1b3JlbkBrZXJuZWwub3JnPiB3cm90
ZToKPgo+IEZyb206IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPgo+ICAtIFVz
aW5nIHNtcF9jb25kX2xvYWRfYWNxdWlyZSBpbiBhcmNoX3NwaW5fbG9jayBieSBQZXRlcidzCj4g
ICAgYWR2aWNlLgo+ICAtIFVzaW5nIF9fc21wX2FjcXVpcmVfZmVuY2UgaW4gYXJjaF9zcGluX3Ry
eWxvY2sKPiAgLSBVc2luZyBzbXBfc3RvcmVfcmVsZWFzZSBpbiBhcmNoX3NwaW5fdW5sb2NrCj4K
PiBBbGwgYWJvdmUgYXJlIGp1c3QgY29kaW5nIGNvbnZlbnRpb25zIGFuZCB3b24ndCBhZmZlY3Qg
dGhlCj4gZnVuY3Rpb24uCj4KPiBUT0RPIGluIHNtcF9jb25kX2xvYWRfYWNxdWlyZSBmb3IgYXJj
aGl0ZWN0dXJlOgo+ICAtIGN1cnJlbnQgY3NreSBvbmx5IGhhczoKPiAgICBsci53IHZhbCwgPHAw
Pgo+ICAgIHNjLncgPHAwPi4gdmFsMgo+ICAgIChBbnkgb3RoZXIgc3RvcmVzIHRvIHAwIHdpbGwg
bGV0IHNjLncgZmFpbGVkKQo+Cj4gIC0gQnV0IHNtcF9jb25kX2xvYWRfYWNxdWlyZSBuZWVkOgo+
ICAgIGxyLncgdmFsLCA8cDA+Cj4gICAgd2ZlCj4gICAgKEFueSBzdG9yZXMgdG8gcDAgd2lsbCBz
ZW5kIHRoZSBldmVudCB0byBsZXQgd2ZlIHJldGlyZWQpCj4KPiBTaWduZWQtb2ZmLWJ5OiBHdW8g
UmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtcmlzY3YvQ0FBaFNkeTFKSExVRnd1N1J1Q2FRK1JVV1JCa3MyS3NEdmE3RXBS
dDgtLTRaZm9mU1VRQG1haWwuZ21haWwuY29tL1QvI20xM2FkYWMyODViN2Y1MWY0Zjg3OWE1ZDZi
NjU3NTNlY2IxYTc1MjRlCj4gQ2M6IFBldGVyIFppamxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9y
Zz4KPiBDYzogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiAtLS0KPiAgYXJjaC9jc2t5
L2luY2x1ZGUvYXNtL3NwaW5sb2NrLmggfCAxMSArKysrLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gv
Y3NreS9pbmNsdWRlL2FzbS9zcGlubG9jay5oIGIvYXJjaC9jc2t5L2luY2x1ZGUvYXNtL3NwaW5s
b2NrLmgKPiBpbmRleCA2OWY1YWEyNDljNWYuLjY5Njc3MTY3OTc3YSAxMDA2NDQKPiAtLS0gYS9h
cmNoL2Nza3kvaW5jbHVkZS9hc20vc3BpbmxvY2suaAo+ICsrKyBiL2FyY2gvY3NreS9pbmNsdWRl
L2FzbS9zcGlubG9jay5oCj4gQEAgLTI2LDEwICsyNiw4IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBh
cmNoX3NwaW5fbG9jayhhcmNoX3NwaW5sb2NrX3QgKmxvY2spCj4gICAgICAgICAgICAgICAgIDog
InIiKHApLCAiciIodGlja2V0X25leHQpCj4gICAgICAgICAgICAgICAgIDogImNjIik7Cj4KPiAt
ICAgICAgIHdoaWxlIChsb2NrdmFsLnRpY2tldHMubmV4dCAhPSBsb2NrdmFsLnRpY2tldHMub3du
ZXIpCj4gLSAgICAgICAgICAgICAgIGxvY2t2YWwudGlja2V0cy5vd25lciA9IFJFQURfT05DRShs
b2NrLT50aWNrZXRzLm93bmVyKTsKPiAtCj4gLSAgICAgICBzbXBfbWIoKTsKPiArICAgICAgIHNt
cF9jb25kX2xvYWRfYWNxdWlyZSgmbG9jay0+dGlja2V0cy5vd25lciwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgVkFMID09IGxvY2t2YWwudGlja2V0cy5uZXh0KTsK
SXQncyB3cm9uZywgd2Ugc2hvdWxkIGRldGVybWluZSBsb2NrdmFsIGJlZm9yZSBuZXh0IHJlYWQu
CgpGaXh1cDoKCmRpZmYgLS1naXQgYS9hcmNoL2Nza3kvaW5jbHVkZS9hc20vc3BpbmxvY2suaCBi
L2FyY2gvY3NreS9pbmNsdWRlL2FzbS9zcGlubG9jay5oCmluZGV4IGZlOThhZDhlY2U1MS4uMmJl
NjI3Y2ViOWRmIDEwMDY0NAotLS0gYS9hcmNoL2Nza3kvaW5jbHVkZS9hc20vc3BpbmxvY2suaAor
KysgYi9hcmNoL2Nza3kvaW5jbHVkZS9hc20vc3BpbmxvY2suaApAQCAtMjcsNyArMjcsOCBAQCBz
dGF0aWMgaW5saW5lIHZvaWQgYXJjaF9zcGluX2xvY2soYXJjaF9zcGlubG9ja190ICpsb2NrKQog
ICAgICAgICAgICAgICAgOiAiciIocCksICJyIih0aWNrZXRfbmV4dCkKICAgICAgICAgICAgICAg
IDogImNjIik7CgotICAgICAgIHNtcF9jb25kX2xvYWRfYWNxdWlyZSgmbG9jay0+dGlja2V0cy5v
d25lciwKKyAgICAgICBpZiAobG9ja3ZhbC5vd25lciAhPSBsb2NrdmFsLnRpY2tldHMubmV4dCkK
KyAgICAgICAgICAgICAgIHNtcF9jb25kX2xvYWRfYWNxdWlyZSgmbG9jay0+dGlja2V0cy5vd25l
ciwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFZBTCA9PSBsb2NrdmFs
LnRpY2tldHMubmV4dCk7Cgo+ICB9Cj4KPiAgc3RhdGljIGlubGluZSBpbnQgYXJjaF9zcGluX3Ry
eWxvY2soYXJjaF9zcGlubG9ja190ICpsb2NrKQo+IEBAIC01NSwxNSArNTMsMTQgQEAgc3RhdGlj
IGlubGluZSBpbnQgYXJjaF9zcGluX3RyeWxvY2soYXJjaF9zcGlubG9ja190ICpsb2NrKQo+ICAg
ICAgICAgfSB3aGlsZSAoIXJlcyk7Cj4KPiAgICAgICAgIGlmICghY29udGVuZGVkKQo+IC0gICAg
ICAgICAgICAgICBzbXBfbWIoKTsKPiArICAgICAgICAgICAgICAgX19zbXBfYWNxdWlyZV9mZW5j
ZSgpOwo+Cj4gICAgICAgICByZXR1cm4gIWNvbnRlbmRlZDsKPiAgfQo+Cj4gIHN0YXRpYyBpbmxp
bmUgdm9pZCBhcmNoX3NwaW5fdW5sb2NrKGFyY2hfc3BpbmxvY2tfdCAqbG9jaykKPiAgewo+IC0g
ICAgICAgc21wX21iKCk7Cj4gLSAgICAgICBXUklURV9PTkNFKGxvY2stPnRpY2tldHMub3duZXIs
IGxvY2stPnRpY2tldHMub3duZXIgKyAxKTsKPiArICAgICAgIHNtcF9zdG9yZV9yZWxlYXNlKCZs
b2NrLT50aWNrZXRzLm93bmVyLCBsb2NrLT50aWNrZXRzLm93bmVyICsgMSk7Cj4gIH0KPgo+ICBz
dGF0aWMgaW5saW5lIGludCBhcmNoX3NwaW5fdmFsdWVfdW5sb2NrZWQoYXJjaF9zcGlubG9ja190
IGxvY2spCj4gLS0KPiAyLjE3LjEKPgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCk1MOiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1jc2t5LwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NA
bGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5m
by9vcGVucmlzYwo=
