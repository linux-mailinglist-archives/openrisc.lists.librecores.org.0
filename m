Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 610C0A562F
	for <lists+openrisc@lfdr.de>; Mon,  2 Sep 2019 14:35:40 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A1D4E20546;
	Mon,  2 Sep 2019 14:35:37 +0200 (CEST)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by mail.librecores.org (Postfix) with ESMTPS id BD4F3201E8
 for <openrisc@lists.librecores.org>; Fri, 30 Aug 2019 23:45:16 +0200 (CEST)
Received: by mail-pl1-f195.google.com with SMTP id d3so3946637plr.1
 for <openrisc@lists.librecores.org>; Fri, 30 Aug 2019 14:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=CyAnPYKlnqoE6HYrk4XrrLs/lfWC1furlwMXZwIbdJM=;
 b=Ey9XQvoj8H/Rnwv8NzD/KreDQNAtk/Y1mAfNtWWSPWRvpRHkSG3qzrkTUiyqzLyy8y
 FhYeM7nvgl239YS8plycKvLT74pvzlcX8njCo82d73vUDrqGOQIz8oARAkP7UKilrwM5
 NDqVYaJdxQw5YtmBNy2VGaqetGKnvddyuLZTFzzrXm1WRH2hh5P7VzQIaPjNRzRh/cM8
 +iOgz2nm0iGcnxDUVyloWrKJlS93KDGv8twzcGSeFsCL8uqXFf9uQEZtHNVy3yjgG/aD
 DEMAEjrPTZxgLBaKb3rpS25bBzOjAWuXx/Z+kiRAvu2tepHCjzQrK3HOb0q7by4MMmYW
 wmeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CyAnPYKlnqoE6HYrk4XrrLs/lfWC1furlwMXZwIbdJM=;
 b=iYHsEoQIXvedXon3vBldp1dUU2AzjabY4M79lrhTqA07lD6aGu0LHRJRW6Dgwtx224
 qg6HEXzsVATVl0swNa6jR2cWrQ65KPanQGUhzecqyFQQfLJAlgrqnnmhSeQQFlJ//tq3
 eI9FAmcAarwKb+hnEpQLruAkPRyTN279KyZn4uTffXCSqajKIWtGcSs7D6/c4pP+iWN4
 QF3hS1UzRlk62ROIUgNx+xJifxG7slwP9WSL04DOzlts5URGo/6C3Yg/8PnM2smoNViF
 jhx842vNZ273gKHhq87xzJR6eJiu1AJS/IJVGByCouXGnHJv+FtOasTGPogMTNdAn1Ob
 ekIw==
X-Gm-Message-State: APjAAAWkXSojKD5HQDO40ZYw+x9x+8zdHrR7O5TH8hgylhMRuBEX15dH
 A8YJQSIeIy5ofCRov70oLN0=
X-Google-Smtp-Source: APXvYqzQSc6jNbxZKUcovD9FZLciwfGuo7Kt2wn5aZSHSDm6zSKrBIeIlpBZCEWXRcfFUHXs7Afe6Q==
X-Received: by 2002:a17:902:9b8f:: with SMTP id
 y15mr18714988plp.194.1567201515169; 
 Fri, 30 Aug 2019 14:45:15 -0700 (PDT)
Received: from localhost (g75.222-224-160.ppp.wakwak.ne.jp. [222.224.160.75])
 by smtp.gmail.com with ESMTPSA id
 q69sm5777108pjb.0.2019.08.30.14.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2019 14:45:14 -0700 (PDT)
Date: Sat, 31 Aug 2019 06:45:12 +0900
From: Stafford Horne <shorne@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20190830214512.GX24874@lianli.shorne-pla.net>
References: <20190817073253.27819-1-hch@lst.de>
 <20190817073253.27819-6-hch@lst.de>
 <20190823135539.GC24874@lianli.shorne-pla.net>
 <20190830160705.GF26887@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190830160705.GF26887@lst.de>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Mon, 02 Sep 2019 14:35:35 +0200
Subject: Re: [OpenRISC] [PATCH 05/26] openrisc: map as uncached in ioremap
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Greentime Hu <green.hu@gmail.com>,
 linux-mtd@lists.infradead.org, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-alpha@vger.kernel.org, nios2-dev@lists.rocketboards.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gRnJpLCBBdWcgMzAsIDIwMTkgYXQgMDY6MDc6MDVQTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgMTA6NTU6MzlQTSArMDkwMCwgU3Rh
ZmZvcmQgSG9ybmUgd3JvdGU6Cj4gPiBPbiBTYXQsIEF1ZyAxNywgMjAxOSBhdCAwOTozMjozMkFN
ICswMjAwLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiA+ID4gT3BlbnJpc2MgaXMgdGhlIG9u
bHkgYXJjaGl0ZWN0dXJlIG5vdCBtYXBwaW5nIGlvcmVtYXAgYXMgdW5jYWNoZWQsCj4gPiA+IHdo
aWNoIGhhcyBiZWVuIHRoZSBkZWZhdWx0IHNpbmNlIHRoZSBMaW51eCAyLjYueCBkYXlzLiAgU3dp
dGNoIGl0Cj4gPiA+IG92ZXIgdG8gaW1wbGVtZW50IHVuY2FjaGVkIHNlbWFudGljcyBieSBkZWZh
dWx0Lgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBs
c3QuZGU+Cj4gPiA+IC0tLQo+ID4gPiAgYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS9pby5oICAg
ICAgfCAyMCArKystLS0tLS0tLS0tLS0tLS0tLQo+ID4gPiAgYXJjaC9vcGVucmlzYy9pbmNsdWRl
L2FzbS9wZ3RhYmxlLmggfCAgMiArLQo+ID4gPiAgYXJjaC9vcGVucmlzYy9tbS9pb3JlbWFwLmMg
ICAgICAgICAgfCAgOCArKysrLS0tLQo+ID4gPiAgMyBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlv
bnMoKyksIDIyIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBBY2tlZC1ieTogU3RhZmZvcmQgSG9ybmUg
PHNob3JuZUBnbWFpbC5jb20+Cj4gCj4gQ2FuIHlvdSBzZW5kIHRoaXMgb25lIHRvIExpbnVzIGZv
ciA1LjQ/ICBUaGF0IHdvdWxkIGhlbHAgd2l0aCB0aGUKPiBwb3NzaWJpbGl0eSB0byByZW1vdmUg
aW9yZW1hcF9ub2NhY2hlIGFmdGVyIHRoYXQuCgpTdXJlLCBJIHdpbGwgcGljayB0aGlzIHVwLgoK
LVN0YWZmb3JkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Ck9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRw
czovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
