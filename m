Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C00AA1718AF
	for <lists+openrisc@lfdr.de>; Thu, 27 Feb 2020 14:29:15 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6D30420114;
	Thu, 27 Feb 2020 14:29:15 +0100 (CET)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by mail.librecores.org (Postfix) with ESMTPS id CB76420114
 for <openrisc@lists.librecores.org>; Thu, 27 Feb 2020 14:29:12 +0100 (CET)
Received: by mail-pg1-f193.google.com with SMTP id j15so1482876pgm.6
 for <openrisc@lists.librecores.org>; Thu, 27 Feb 2020 05:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=J6qXS1wSxw6vDTcttyVtlLNJ03skjYv/jVjoYtks20E=;
 b=Lrt9AvuLeb9jeVeqLm8sfmFsu+KF47C0RipoVstxmDSMD+LYcUnkQ9WYUql+DWq0MV
 lLAVA/qmKK87xKLgsV5unf8vquJltLNFOH9tIXLZdhiC0/X5Kyspr5LgP9XyOSmL2tNr
 ctUvgjNimS8EAc2ayJ3GlFlWzXEICybNOI03niRlE76FSlsK2SLONOa2kwEfQN6fpmk1
 VAcjd+zBE+I8Y4zoeWWcpUAwi3CXlPZAuCogKfv0ETD6ggHBst34Sw0WUJi0BkKK+Gox
 eqk0nXsLlfv22RCqse+bzyO3XlVAo9QTzEgn0sSTjvyt6aio/6WEgduQGDQu5GSF/+eO
 j+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=J6qXS1wSxw6vDTcttyVtlLNJ03skjYv/jVjoYtks20E=;
 b=Fa7MQ/gBSn0Dp7ir7k6TrTH0V8Kw84pETF9pc7WPqBfAifLPSfgChANtSp8/gXetAe
 8xh4RAfZLn5qUdekWtOPoQQpFbLbbAdRJnKyhAUrmqZGEXDAkYmcJub277VvMQGJx+tr
 BDTNlisvmXto6Ih+bPTb/yqHOhd4SKyk+bwfxvUL81SJXwJ99WKTRj7/M4YH9jjtWAYD
 VrsHpYeTBrHURu/yQbVF3Pxn5h1Y/DQiQVCgVJ+k8fx3LNeLULqrVcNwiHII7RPYKDCq
 PgZkeEzNmOuxwX51dWuSMx15QMsWQqTYkD3TpoflliQTWG+j/dx0s/KquLrKNA4g9Ylt
 J46A==
X-Gm-Message-State: APjAAAWfXwlYLLjapcCivSEwO6NplvBjqcYMO4v9FRcJYc1AW5oPQKfI
 YdI/3NHN+L66RGAw3JLEzNs=
X-Google-Smtp-Source: APXvYqz+Y5xmU0t4GXQu1hmoMQ0gDOlSlB1DKLqEr4yP3nPm0JTRyMcnK1DuzL7jcjd9v6+CTEqXnA==
X-Received: by 2002:aa7:946b:: with SMTP id t11mr3998714pfq.57.1582810151046; 
 Thu, 27 Feb 2020 05:29:11 -0800 (PST)
Received: from localhost (g183.222-224-185.ppp.wakwak.ne.jp. [222.224.185.183])
 by smtp.gmail.com with ESMTPSA id r145sm7553229pfr.5.2020.02.27.05.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 05:29:10 -0800 (PST)
Date: Thu, 27 Feb 2020 22:29:08 +0900
From: Stafford Horne <shorne@gmail.com>
To: Christian Brauner <christian.brauner@ubuntu.com>
Message-ID: <20200227132908.GI7926@lianli.shorne-pla.net>
References: <20200226225625.28935-1-shorne@gmail.com>
 <20200226225625.28935-3-shorne@gmail.com>
 <20200227122147.rnpzcy7rjexgy6yx@wittgenstein>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200227122147.rnpzcy7rjexgy6yx@wittgenstein>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [OpenRISC] [PATCH 2/3] openrisc: Enable the clone3 syscall
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
Cc: Jonas Bonn <jonas@southpole.se>, Openrisc <openrisc@lists.librecores.org>,
 LKML <linux-kernel@vger.kernel.org>, Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCBGZWIgMjcsIDIwMjAgYXQgMDE6MjE6NDdQTSArMDEwMCwgQ2hyaXN0aWFuIEJyYXVu
ZXIgd3JvdGU6Cj4gT24gVGh1LCBGZWIgMjcsIDIwMjAgYXQgMDc6NTY6MjRBTSArMDkwMCwgU3Rh
ZmZvcmQgSG9ybmUgd3JvdGU6Cj4gPiBFbmFibGUgdGhlIGNsb25lMyBzeXNjYWxsIGZvciBPcGVu
UklTQy4gIFdlIHVzZSB0aGUgZ2VuZXJpYyB2ZXJzaW9uLgo+ID4gCj4gPiBUaGlzIHdhcyB0ZXN0
ZWQgd2l0aCB0aGUgY2xvbmUzIHRlc3QgZnJvbSBzZWxmdGVzdHMuICBOb3RlLCBmb3IgYWxsCj4g
PiB0ZXN0cyB0byBwYXNzIGl0IHJlcXVpcmVkIGVuYWJsaW5nIENPTkZJR19OQU1FU1BBQ0VTIHdo
aWNoIGlzIG5vdAo+ID4gZW5hYmxlZCBpbiB0aGUgZGVmYXVsdCBrZXJuZWwgY29uZmlnLgo+IAo+
IEZvciBPcGVuUklTQywgSSBhc3N1bWUuIEhtLCBtYXliZSB3ZSBzaG91bGQgZml4IHRoZSB0ZXN0
cyB0byBza2lwIHdoZW4KPiBDT05GSUdfTkFNRVNQQUNFUyBpcyBub3QgZW5hYmxlZC4KClllcywg
bm90IHRoZSBkZWZhdWx0IGZvciBvcGVucmlzYyBkZWZjb25maWcuICBJdCBtaWdodCBtYWtlIHNl
bnNlIHRvIGVpdGhlciBza2lwCnRoZSB0ZXN0cyBvZiBoYXZlIHRoZW0gYXMgZXhwZWN0ZWQgZmFp
bHMgd2hlbiBDT05GSUdfTkFNRVNQQUNFUyBpcyBvZmYuCgpPbiB0aGUgb3RoZXJoYW5kLCBJIGFt
IG5vdCBzdXJlIGlmIHRoZSBzZWxmIHRlc3RzIGtub3cgYWJvdXQgdGhlIENPTkZJR18qCmF2YWls
YWJsZS4gIEkgbm90aWNlIG1hbnkgdGVzdCBkaXJlY3RvcmllcyBoYXZlIGEgJ2NvbmZpZycgZmls
ZSBhbmQgYSByZWFkbWUKc2F5aW5nLCBmb3IgdGhlc2UgdGVzdCB0byBydW4gZW5zdXJlIHVzZSBo
YXZlIGF0IGxlYXN0ICd0aGVzZScgY29uZmlnIHZhbHVlcwpzZXQuCgotU3RhZmZvcmQKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGlu
ZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVj
b3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
