Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 6F397F7407
	for <lists+openrisc@lfdr.de>; Mon, 11 Nov 2019 13:37:37 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A9CE220690;
	Mon, 11 Nov 2019 13:37:35 +0100 (CET)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by mail.librecores.org (Postfix) with ESMTPS id BA3F820748
 for <openrisc@lists.librecores.org>; Wed,  6 Nov 2019 19:16:50 +0100 (CET)
Received: by mail-ot1-f66.google.com with SMTP id m15so12898806otq.7
 for <openrisc@lists.librecores.org>; Wed, 06 Nov 2019 10:16:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=15BA2o2ULwBaZdW2cSXzi/G8aVSlqB+lkO94w9/s3/8=;
 b=uGHuaOr7B3rRH9tMB3l2luevfZ4FTCeSV3mwQQEMc/7nTCk1L/VWwUtxLpmR2q09/g
 HShVhZnAhCxFCRrUScB0oKMoXZANTDeKcvZQYGtwG5Qspuq9Nr0I0Gn7V6NjZ/kbxXLo
 0uiZijAPi8zF2vlC86akFOyq+HckkQFjqChGwKZ1J0QsRuRo4zrXd+rdLOfOyj3zduqH
 5qXjsx3sHzuvrBiEIMDfqje0fSBWxEowiOYeLTtlptgzMu871Cdbr9OMOGw5VgNbaS0t
 rokT3T2Egv8AO3teBcxwjMGU8wiyuW+kJYewJJ6tfvT+s5ZNEPRPhlAT5LJUMToDNy0a
 hYJw==
X-Gm-Message-State: APjAAAVSAt8cydBamWdlKlo8ci/nCHNRmTSONslq+8Q3Tyrq3L0Rk6by
 uM+FbL9w9o4Br7HAbYujxB09JcuPlepA2BCfEng=
X-Google-Smtp-Source: APXvYqyJzH2QJnGyQxa9UcvqsSRwLOqnLR39MniE098RrjM8S3f0LW/gsjuzU8BhMp3pbPwutON3uAZxVc/hg56lCG0=
X-Received: by 2002:a9d:191e:: with SMTP id j30mr2894554ota.297.1573064209066; 
 Wed, 06 Nov 2019 10:16:49 -0800 (PST)
MIME-Version: 1.0
References: <20191029064834.23438-12-hch@lst.de>
 <mhng-33ea9141-2440-4a2d-8133-62094486fc48@palmer-si-x1c4>
In-Reply-To: <mhng-33ea9141-2440-4a2d-8133-62094486fc48@palmer-si-x1c4>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Nov 2019 19:16:38 +0100
Message-ID: <CAMuHMdVuDp_8UDeWv8tdPAH5JS84=-yfwZjOk-YQcoYKM9za+w@mail.gmail.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
X-Mailman-Approved-At: Mon, 11 Nov 2019 13:37:30 +0100
Subject: Re: [OpenRISC] [PATCH 11/21] asm-generic: don't provide ioremap for
 CONFIG_MMU
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>, linux-mips@vger.kernel.org,
 Guo Ren <guoren@kernel.org>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Christoph Hellwig <hch@lst.de>, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Greentime Hu <green.hu@gmail.com>,
 nios2-dev@lists.rocketboards.org, Guan Xuetao <gxt@pku.edu.cn>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>, Parisc List <linux-parisc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgUGFsbWVyLAoKT24gV2VkLCBOb3YgNiwgMjAxOSBhdCA3OjExIFBNIFBhbG1lciBEYWJiZWx0
IDxwYWxtZXJAZGFiYmVsdC5jb20+IHdyb3RlOgo+IEl0IGxvb2tzIGxpa2UgdGhlIGRpZmZlcmVu
Y2UgaW4gcHJvdG90eXBlIGJldHdlZW4gdGhlIGFyY2hpdGVjdHVyZXMgaXMgYmV0d2Vlbgo+Cj4g
ICAgIHZvaWQgX19pb21lbSAqaW9yZW1hcChyZXNvdXJjZV9zaXplX3QsIHNpemVfdCkKPiAgICAg
dm9pZCBfX2lvbWVtICppb3JlbWFwKHBoeXNfYWRkcl90LCBzaXplX3QpCj4gICAgIHZvaWQgX19p
b21lbSAqaW9yZW1hcChwaHlzX2FkZHJfdCwgdW5zaWduZWQgbG9uZykKPiAgICAgdm9pZCBfX2lv
bWVtICppb3JlbWFwKHVuc2lnbmVkIGxvbmcsIHVuc2lnbmVkIGxvbmcpCj4KPiBzaG91bGRuJ3Qg
dGhleSBhbGwganVzdCBiZSB0aGF0IGZpcnN0IG9uZT8gIEluIG90aGVyIHdvcmRzLCB3b3VsZG4n
dCBpdCBiZQo+IGJldHRlciB0byBhbHdheXMgcHJvdmlkZSB0aGUgZ2VuZXJpYyBpb3JlbWFwIHBy
b3RvdHlwZSBhbmQgdW5pZnkgdGhlIHBvcnRzCj4gaW5zdGVhZD8KCkFncmVlZC4gQnV0IEknZCBn
byBmb3IgdGhlIHNlY29uZCBvbmUuCgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAg
ICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBv
ZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwg
Y29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNr
ZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dy
YW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgLS0gTGludXMgVG9ydmFsZHMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJl
Y29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
