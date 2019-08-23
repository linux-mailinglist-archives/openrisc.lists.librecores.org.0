Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C45439E7D2
	for <lists+openrisc@lfdr.de>; Tue, 27 Aug 2019 14:24:30 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2A0A120357;
	Tue, 27 Aug 2019 14:24:30 +0200 (CEST)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by mail.librecores.org (Postfix) with ESMTPS id 8132020224
 for <openrisc@lists.librecores.org>; Fri, 23 Aug 2019 15:55:43 +0200 (CEST)
Received: by mail-pf1-f195.google.com with SMTP id q139so6495300pfc.13
 for <openrisc@lists.librecores.org>; Fri, 23 Aug 2019 06:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=BUAiw1OCmJxcFhDfFwk6vJ4atOusYa0enlexPK5RdcM=;
 b=p1kpl17yQ70OZJjj0Ex1dhmfo2/01ZSY1fOdxj+J/0LKK1tvqbyWGApNp+RopSCBU9
 F4JDgPHlcLiS1iW8iLa6+Oz3hvJ93YLeeZOw8VI/PWR7yXZkQ2Y3BWj/9xw0zvYm8PgM
 xCORxywfStYr2iObddDIvw4uxyyFDzJ4nH8mOJxihZGgGGvOFtqX5rLKfVLumbHnUiDf
 cp+XG0kMNbLUq5HT5W+hUh/PxuwaBDz2hVRJ6ISjeckQ/denHk7F5JHtEBhHBSkgw5OY
 5pVQ0XdibEupNYaM8DhPTT4HkPLbYUHv2fszhaDZIjemQ/II2oo6OpoSBdKla1hplbzS
 Zchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BUAiw1OCmJxcFhDfFwk6vJ4atOusYa0enlexPK5RdcM=;
 b=pCWczhaFc05dM+nUZO0MDw8Kbj64Kr+01VVy6oVqLuoZTkeGqSLPbnUReV8mF05Q2a
 wumr4Kx2C6jVp18AHGLt/BNAbph2K8WhvGmv4iscgHzU5iZ8ViTLynWKviGaXXmi/VMH
 vZqY+zF5kuNTrJKyPz/hYyd+3Cso7Pg1QzgQ1CrYOp+Zln6sUbKnYTNCsxHVfRE6Q/3K
 4DGHEOy+rofHE5kk5b1UMfPR1s8Y9S2ibglVD45SD2Kc7i8mRj/+R0j6BrJbsrHk3iXZ
 TgUuj0Q7HA3QIEDBi9T9VvOVxVbGn1F93gK9SYN3XCVejxasRNPGkS5/z1ss+tEy4J3t
 UcuA==
X-Gm-Message-State: APjAAAV4Ptpn2eL/3d6wMFSGYBCwgx+zoWyw1h3A571aHfbATx7GNR8L
 uMCAl3TFKXf0jLLCrta8hkU=
X-Google-Smtp-Source: APXvYqzeZA+QEa5Xq4+pVCPW2H7vItZxat4J0/SQ1XBxiBF3Po4TqLpUuSgHOh67wlOMVyJ/4CHLaQ==
X-Received: by 2002:a17:90a:aa90:: with SMTP id
 l16mr5454982pjq.73.1566568541762; 
 Fri, 23 Aug 2019 06:55:41 -0700 (PDT)
Received: from localhost (g75.222-224-160.ppp.wakwak.ne.jp. [222.224.160.75])
 by smtp.gmail.com with ESMTPSA id
 z13sm2477619pjn.32.2019.08.23.06.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2019 06:55:41 -0700 (PDT)
Date: Fri, 23 Aug 2019 22:55:39 +0900
From: Stafford Horne <shorne@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20190823135539.GC24874@lianli.shorne-pla.net>
References: <20190817073253.27819-1-hch@lst.de>
 <20190817073253.27819-6-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190817073253.27819-6-hch@lst.de>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Tue, 27 Aug 2019 14:24:28 +0200
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

T24gU2F0LCBBdWcgMTcsIDIwMTkgYXQgMDk6MzI6MzJBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT3BlbnJpc2MgaXMgdGhlIG9ubHkgYXJjaGl0ZWN0dXJlIG5vdCBtYXBwaW5n
IGlvcmVtYXAgYXMgdW5jYWNoZWQsCj4gd2hpY2ggaGFzIGJlZW4gdGhlIGRlZmF1bHQgc2luY2Ug
dGhlIExpbnV4IDIuNi54IGRheXMuICBTd2l0Y2ggaXQKPiBvdmVyIHRvIGltcGxlbWVudCB1bmNh
Y2hlZCBzZW1hbnRpY3MgYnkgZGVmYXVsdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGgg
SGVsbHdpZyA8aGNoQGxzdC5kZT4KPiAtLS0KPiAgYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS9p
by5oICAgICAgfCAyMCArKystLS0tLS0tLS0tLS0tLS0tLQo+ICBhcmNoL29wZW5yaXNjL2luY2x1
ZGUvYXNtL3BndGFibGUuaCB8ICAyICstCj4gIGFyY2gvb3BlbnJpc2MvbW0vaW9yZW1hcC5jICAg
ICAgICAgIHwgIDggKysrKy0tLS0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyks
IDIyIGRlbGV0aW9ucygtKQoKQWNrZWQtYnk6IFN0YWZmb3JkIEhvcm5lIDxzaG9ybmVAZ21haWwu
Y29tPgoKVGhhbmtzLAogLVN0YWZmb3JkIApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGli
cmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlz
Ywo=
