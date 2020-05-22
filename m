Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 020EB1DF1DD
	for <lists+openrisc@lfdr.de>; Sat, 23 May 2020 00:32:25 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9639E20BB7;
	Sat, 23 May 2020 00:32:24 +0200 (CEST)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by mail.librecores.org (Postfix) with ESMTPS id C515620BAC
 for <openrisc@lists.librecores.org>; Sat, 23 May 2020 00:32:22 +0200 (CEST)
Received: by mail-pl1-f194.google.com with SMTP id t7so4992530plr.0
 for <openrisc@lists.librecores.org>; Fri, 22 May 2020 15:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kfd/d6jDbUhhz59oywHXU3xheN+vBZcmp1wcC1Un5M8=;
 b=JzMsslu2qQp5LGp4PMVb+btYHwoesPzwke8TIeCCXiSJzV4/nEgBje+rxDUbse2Ne4
 6wAQrT0ojAWhe33L0zyZDkT2NvC6IW9HSb6QwSr4N1Jt7q7JCgNBuhEci90MbNFVpG9X
 IrfJjDuZQ57CdhVYw98xsxLEgUow+yxLuknlurLNk/uHfwQyx5wzvwPFyGIrrkILA6Ee
 nPlS3ZOBq3ZFFlFPBICmJ1D65VGvhYyYPoPGhQOqudvq2JdfSSoL1lgVs6nWAUW11em5
 F14JVklBo87rCZhj4Aj0it9qktYn2f9N+mlHcmwcZOWI6S7PPexHXRENq2UGsLuOLS15
 AQgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kfd/d6jDbUhhz59oywHXU3xheN+vBZcmp1wcC1Un5M8=;
 b=D+e27yQxRrZxEAwZsdiGaUFTioelDsXtNaxzvDjSissR+13IqBJyBysb1LwZ6qRKvw
 wJ4gWxd5OfUF4KJVQ7APhK7QdTnp4pX8zaaKF1cZ6lwgQmnIDOSrg41enOovvow00xSV
 OEbgTPqwkkq36OXYG5Ny3feu34dTEfbwsWh8EX2vQXVT6IF58wDWvA8phb2uK1yxoybF
 yASw5B1cAmLkjcJe2fy3ix7WNgUnLzOt8Tg2KAAIwgu2UPev0dh5JBR/wkUWWx5OGzYg
 tHa5qJQ5yAkvB3dkS/zaPWW99FXcpjge9FAWqEgg6nsnNuG72tjFes9lIC51V4eegCTg
 HuFA==
X-Gm-Message-State: AOAM533I4e7Anfmu1xQx09MROu63wpCarBdYX42rRqd5EKgN7t/0CVbV
 /NizYmuNSJE6xPYrzOsFgMc=
X-Google-Smtp-Source: ABdhPJxd3QPJkp2buGuMBag94TFV3fpK+otYODBTVj+xbuElZSqM/ULjNgIk6WB5isCaXMifijZvaw==
X-Received: by 2002:a17:90a:ad86:: with SMTP id
 s6mr6882626pjq.193.1590186740694; 
 Fri, 22 May 2020 15:32:20 -0700 (PDT)
Received: from localhost (g228.115-65-196.ppp.wakwak.ne.jp. [115.65.196.228])
 by smtp.gmail.com with ESMTPSA id
 t20sm7543698pjo.13.2020.05.22.15.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 15:32:19 -0700 (PDT)
Date: Sat, 23 May 2020 07:32:18 +0900
From: Stafford Horne <shorne@gmail.com>
To: Joseph Myers <joseph@codesourcery.com>
Message-ID: <20200522223218.GD75760@lianli.shorne-pla.net>
References: <20200522113633.209664-1-shorne@gmail.com>
 <20200522113633.209664-2-shorne@gmail.com>
 <87eerc3z7b.fsf@oldenburg2.str.redhat.com>
 <20200522215953.GC75760@lianli.shorne-pla.net>
 <alpine.DEB.2.21.2005222201450.10437@digraph.polyomino.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2005222201450.10437@digraph.polyomino.org.uk>
Subject: Re: [OpenRISC] [PATCH 1/1] Initial support for OpenRISC
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
Cc: Florian Weimer <fweimer@redhat.com>,
 Openrisc <openrisc@lists.librecores.org>,
 Stafford Horne via Libc-alpha <libc-alpha@sourceware.org>,
 Christian Svensson <blue@cmd.nu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gRnJpLCBNYXkgMjIsIDIwMjAgYXQgMTA6MDI6NTRQTSArMDAwMCwgSm9zZXBoIE15ZXJzIHdy
b3RlOgo+IE9uIFNhdCwgMjMgTWF5IDIwMjAsIFN0YWZmb3JkIEhvcm5lIHZpYSBMaWJjLWFscGhh
IHdyb3RlOgo+IAo+ID4gRm9yIGJpbnV0aWxzIGFuZCBnY2MgcmVxdWlyZSBwYXRjaGVzIHdoaWNo
IGFyZSBtZW50aW9uZWQgaW4gdGhlIGNvdmVyIGxldHRlci4KPiA+IEkgd2lsbCBkb2N1bWVudC4K
PiAKPiBJbiBteSB2aWV3IHRoZSBjaGFuZ2VzIG5lZWQgdG8gYmUgdXBzdHJlYW0gYmVmb3JlIHRo
ZSBwYXRjaCBjYW4gZ28gaW50byAKPiBnbGliYy4gIFdlIHdhbnQgdG8gYXZvaWQgdGhlIG1lc3Mg
d2UgaGFkIHdpdGggTWljcm9CbGF6ZSB3aGVyZSB0aGUgcG9ydCAKPiB0dXJuZWQgb3V0IHRvIGRl
cGVuZCBvbiBHQ0MgcGF0Y2hlcyB0aGF0IGhhZG4ndCB5ZXQgYmVlbiB1cHN0cmVhbWVkLgoKTm90
ZXMsICBJIGRvbid0IHRoaW5rIHRoYXQgd2lsbCBiZSBhIHByb2JsZW0uICBCaW51dGlscyBwYXRj
aGVzIGFyZSBhbHJlYWR5CnVwc3RyZWFtLiAgVGhlIEdDQyBwYXRjaGVzIHNob3VsZCBiZSB0b28g
YmVmb3JlIEkgc2VuZCB0aGUgVjIgc2VyaWVzIChJIGp1c3QKbmVlZCB0byBwdXNoIHRoZW0pLgoK
LVN0YWZmb3JkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Ck9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRw
czovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
