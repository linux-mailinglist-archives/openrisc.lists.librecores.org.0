Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D4D3823FD60
	for <lists+openrisc@lfdr.de>; Sun,  9 Aug 2020 10:37:37 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 7071220C1F;
	Sun,  9 Aug 2020 10:37:37 +0200 (CEST)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by mail.librecores.org (Postfix) with ESMTPS id 995AA20D05
 for <openrisc@lists.librecores.org>; Sun,  9 Aug 2020 10:37:34 +0200 (CEST)
Received: by mail-pf1-f195.google.com with SMTP id m71so3129934pfd.1
 for <openrisc@lists.librecores.org>; Sun, 09 Aug 2020 01:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=effaZxDoaPjAVLtSBxTjGyQSyg5AQ1OCLPD98F6vZZU=;
 b=pOw2PCDNzyhV+BalCz8X7TiYGqtLVoyHeD1Cwg1Fwb41scx8+5bq5Nx/x5+nTylCXl
 OqZTv29FIBO7psYi/Lbrlrqg1ZytFXb/fa8Uwme4rzZQ5hG55aUia5A3QJVOlxALZLnC
 2PluKIdr7iv2U5AaQMLqV5JOG00FgENu/eskg7XG4/BnAoig5V7orHyrtQkKHPaV+z3m
 E+W1QMtk65QPeErY1HF4J5pKSGBVyq0vz3oThSAsLP48/l+dGupq58LJAwg4FjvC+y8q
 6I0/cMJlbNsaouq9Xe4wAeybvdTPanIOVKR1zRCWUZiv214Yo29kRg9R5H3Xh7kgeRlR
 7IxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=effaZxDoaPjAVLtSBxTjGyQSyg5AQ1OCLPD98F6vZZU=;
 b=FYHhex4n/PAoIMRf05jeVbtkmRFbOWFiv/vD6r4G70+HuuzohyV46sEitocx6CLBMU
 aIKS5zKLD+0YNemeGZyta1suUAgNO6gli9IrTg+nZ6dYc3Gvijx7l6Ia/mZ9Ca05VvCa
 2SFEBNkt/aAiPkm/TxXjgK5RHepI06CcK3OIa+f9oKWZjUn/enbZQ39nsDgpy04xYkxQ
 C77gWOSKdE7VKLoTpt3hmJx4J9l1ElXaQi3y0uKr9WesCS+49ZK0BGWhAt6yD9DQBC6W
 mzl+kyRNtUMfhrZRWuJ/2Z7UpIiT0SW7ePwSyISuBJqDiUEx86NzdkIOihguTIfwWblO
 9pGg==
X-Gm-Message-State: AOAM5325JfvG6xviFFwTDyY7F1TMraCP4YLyp+FFYH4wHuqKcngf2cYi
 caEo+B/C8WT8pEdWB7EH12Q=
X-Google-Smtp-Source: ABdhPJzJ6PyzofN3DmXQ31M1LSv44ZrdGfruc2zeZg12q1HJ9zZeHmGm9Jhy9S6HFE7F3zuYQ9TREw==
X-Received: by 2002:a63:6dcd:: with SMTP id i196mr707641pgc.70.1596962252669; 
 Sun, 09 Aug 2020 01:37:32 -0700 (PDT)
Received: from localhost (g223.115-65-55.ppp.wakwak.ne.jp. [115.65.55.223])
 by smtp.gmail.com with ESMTPSA id 25sm18861661pfh.133.2020.08.09.01.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2020 01:37:31 -0700 (PDT)
Date: Sun, 9 Aug 2020 17:37:29 +0900
From: Stafford Horne <shorne@gmail.com>
To: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Message-ID: <20200809083729.GS80756@lianli.shorne-pla.net>
References: <20200805210725.310301-1-shorne@gmail.com>
 <20200805210725.310301-6-shorne@gmail.com>
 <20200806190449.xqflhmbiiv5btusf@ltop.local>
 <20200808224822.GQ80756@lianli.shorne-pla.net>
 <20200808230842.4bdwrvuz3lbgkcom@ltop.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200808230842.4bdwrvuz3lbgkcom@ltop.local>
Subject: Re: [OpenRISC] [PATCH v2 5/6] openrisc: signal: Fix sparse address
 space warnings
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

T24gU3VuLCBBdWcgMDksIDIwMjAgYXQgMDE6MDg6NDJBTSArMDIwMCwgTHVjIFZhbiBPb3N0ZW5y
eWNrIHdyb3RlOgo+IE9uIFN1biwgQXVnIDA5LCAyMDIwIGF0IDA3OjQ4OjIyQU0gKzA5MDAsIFN0
YWZmb3JkIEhvcm5lIHdyb3RlOgo+ID4gT24gVGh1LCBBdWcgMDYsIDIwMjAgYXQgMDk6MDQ6NDlQ
TSArMDIwMCwgTHVjIFZhbiBPb3N0ZW5yeWNrIHdyb3RlOgo+ID4gPiBPbiBUaHUsIEF1ZyAwNiwg
MjAyMCBhdCAwNjowNzoyNEFNICswOTAwLCBTdGFmZm9yZCBIb3JuZSB3cm90ZToKPiA+ID4gPiAt
LS0KPiA+ID4gPiAgYXJjaC9vcGVucmlzYy9rZXJuZWwvc2lnbmFsLmMgfCAxNCArKysrKysrLS0t
LS0tLQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9u
cygtKQo+ID4gPiA+IAo+ID4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL29wZW5yaXNjL2tlcm5lbC9z
aWduYWwuYyBiL2FyY2gvb3BlbnJpc2Mva2VybmVsL3NpZ25hbC5jCj4gPiA+ID4gaW5kZXggNGYw
NzU0ODc0ZDc4Li43Y2UwNzI4NDEyZjYgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvYXJjaC9vcGVucmlz
Yy9rZXJuZWwvc2lnbmFsLmMKPiA+ID4gPiArKysgYi9hcmNoL29wZW5yaXNjL2tlcm5lbC9zaWdu
YWwuYwo+ID4gPiA+IEBAIC03Niw3ICs3Niw3IEBAIGFzbWxpbmthZ2UgbG9uZyBfc3lzX3J0X3Np
Z3JldHVybihzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiA+ID4gPiAgCSAqIHRoZW4gZnJhbWUgc2hv
dWxkIGJlIGR3b3JkIGFsaWduZWQgaGVyZS4gIElmIGl0J3MKPiA+ID4gPiAgCSAqIG5vdCwgdGhl
biB0aGUgdXNlciBpcyB0cnlpbmcgdG8gbWVzcyB3aXRoIHVzLgo+ID4gPiA+ICAJICovCj4gPiA+
ID4gLQlpZiAoKChsb25nKWZyYW1lKSAmIDMpCj4gPiA+ID4gKwlpZiAoKChfX2ZvcmNlIHVuc2ln
bmVkIGxvbmcpZnJhbWUpICYgMykKPiA+ID4gPiAgCQlnb3RvIGJhZGZyYW1lOwo+ID4gPiAKPiA+
ID4gU2FtZSBhcyBwYXRjaCA2LCB0aGUgX19mb3JjZSBpcyBub3QgbmVlZGVkLgo+ID4gCj4gPiBU
aGFua3MsICBJIHRob3VnaHQgdGhpcyB3YXMgY29tcGxhaW5pbmcgYmVmb3JlLCBJIHRlc3RlZCBu
b3cgYW5kIHRoZXJlIGlzIG5vCj4gPiBwcm9ibGVtIHNvIEkgbXVzdCBoYXZlIGJlZW4gbWl4ZWQg
dXAgd2l0aCBzb21ldGhpbmcgZWxzZS4KPiAKPiBTcGFyc2Ugc2hvdWxkIGhhdmUgY29tcGxhaW5l
ZCB3aXRoIHdpdGggdGhlIGNhc3QgdG8gbG9uZyBidXQKPiBwdXJwb3NlbHkgZG9lc24ndCB3aXRo
IHVuc2lnbmVkIGxvbmcgKG9yIHVpbnRwdHJfdCkuCj4gU28sIG5vIG1peCB1cCwgSSB0aGluay4K
CllvdSBhcmUgcmlnaHQsIEkgbm90aWNlZCB0aGF0IHJpZ2h0IGFmdGVyIEkgc2VudCB0aGF0IGVt
YWlsLiAgVGhhbmtzIGEgbG90LgoKLVN0YWZmb3JkCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0
cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29w
ZW5yaXNjCg==
