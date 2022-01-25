Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 4F53749A1FD
	for <lists+openrisc@lfdr.de>; Tue, 25 Jan 2022 02:19:47 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id DA3EB2431F;
	Tue, 25 Jan 2022 02:19:46 +0100 (CET)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mail.librecores.org (Postfix) with ESMTPS id D483020169
 for <openrisc@lists.librecores.org>; Tue, 25 Jan 2022 02:19:45 +0100 (CET)
Received: by mail-pl1-f178.google.com with SMTP id c3so17630622pls.5
 for <openrisc@lists.librecores.org>; Mon, 24 Jan 2022 17:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6fJ0nHpUlmtE1Dzue8JPvgQnpOZzJ804kMFi5nMPtqo=;
 b=ZIY9e9NdTBcyD8/beUm/TDisQQ7joNZvlL6KIbUX88mntCCsw6v7FTiqg7mqKwJPIb
 wjXPk5Et8bawRwVb7VeWI2bRDQmQ8W/0JzoG/MS9OO5vZJbWApe9vqbT9ZKB1GqPu68U
 42LuDTxYRZV3TKhnENZ0qJM4Hl/iByIxBiN9ITYwm5aoxwQyJXYDOMqEeBZ+4oSlsIvC
 moMlYQI7fb8E390sodJdU7vSjYEchgrlNKRAk3HbWURO3Gb21SJgFRuR8CnhDZjqpSpZ
 i4kOKCTipjtjKCTK+ie8qF0Ipprz3KgzUrNqM4IpZVsBHG8k729iogCcQBL0yd6TVigp
 wdZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6fJ0nHpUlmtE1Dzue8JPvgQnpOZzJ804kMFi5nMPtqo=;
 b=QwWvD+sFoDnt2EsTbiHzhZEkdWFI9Po4bWLi3mzn8zTPQ3Yw8jMfSDoILSVHHu9C2N
 wUxTHDQVucNZhc8FBQFTIrDow4mFnLCubT6kdrJxqh8vRhocXyY3wEUQYzrsDYXycL2x
 Zq+JEXiabh6Q//VRvBgUwiy4J7Rw6yo1YwtC3RRMEwFvI7E7dRIqBTZlKbl8ZGGxf38M
 dhBaUzhCzrj+eBAeYoPoCo13fqxVEUTxYgKR5ZS4ooXdHERrWnymljdKltfVv8Qh0Ze+
 sGtM5j+wAFRz/pGAcZObEUEM0WOjw5y/H1rAJwsXfXW81ZvIiDfvmZgWqbbJRlyFv8pO
 t/dg==
X-Gm-Message-State: AOAM530hx+MrV0qGQujsKpafCo3cNtEmdZ/1RDc7Bub9Dft8OOHeI6Wv
 4SHK+SEhN2TasOP/U/jIXj0=
X-Google-Smtp-Source: ABdhPJxm3WFngo6ui98gxMNszx8NTigBZz1SGXD85dwpdPEBVqb5dNjTz+x4sT+PHRVSr+L+tbJABQ==
X-Received: by 2002:a17:902:9887:b0:14a:199:bc51 with SMTP id
 s7-20020a170902988700b0014a0199bc51mr16743129plp.39.1643073584312; 
 Mon, 24 Jan 2022 17:19:44 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id h9sm6128933pfi.54.2022.01.24.17.19.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 17:19:43 -0800 (PST)
Date: Tue, 25 Jan 2022 10:19:41 +0900
From: Stafford Horne <shorne@gmail.com>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Message-ID: <Ye9QLX3znGzPdDDF@antec>
References: <20220104031414.2416928-1-shorne@gmail.com>
 <87tudt2rpg.fsf@oldenburg.str.redhat.com>
 <d3bbc7eb-348f-872c-32ef-fcff7d2f4153@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d3bbc7eb-348f-872c-32ef-fcff7d2f4153@linaro.org>
Subject: Re: [OpenRISC] [PATCH v5 00/13] Glibc OpenRISC port
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
 GLIBC patches <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBKYW4gMjQsIDIwMjIgYXQgMTA6NTQ6NThBTSAtMDMwMCwgQWRoZW1lcnZhbCBaYW5l
bGxhIHdyb3RlOgo+IAo+IAo+IE9uIDI0LzAxLzIwMjIgMTA6MjMsIEZsb3JpYW4gV2VpbWVyIHZp
YSBMaWJjLWFscGhhIHdyb3RlOgo+ID4gKiBTdGFmZm9yZCBIb3JuZToKPiA+IAo+ID4+IFRoaXMg
aXMgdGhlIE9wZW5SSVNDIHBvcnQgZm9yIGdsaWJjIHRoYXQgSSBoYXZlIGJlZW4gd29ya2luZyBv
bi4KPiA+IAo+ID4gVGhlIHBvcnQgZG9lcyBub3QgZGVmaW5lIFBJX1NUQVRJQ19BTkRfSElEREVO
LiAgSXMgdGhpcyByZWFsbHkKPiA+IG5lY2Vzc2FyeSwgb3IganVzdCBhbiBvdmVyc2lnaHQgZHVl
IHRvIHRoZSB3YXkgdGhlIHBvcnQgd2FzIGNvbnN0cnVjdGVkCj4gPiAocHJlc3VtYWJseSB3aXRo
IE1JUFMgYXMgdGhlIHRlbXBsYXRlKT8KPiA+IAo+ID4gUElfU1RBVElDX0FORF9ISURERU4gbWVh
bnMgdGhhdCByZWZlcmVuY2VzIHRvIHN0YXRpYyBmdW5jdGlvbnMgYW5kIGRhdGEKPiA+IGFuZCBz
eW1ib2xzIHdpdGggaGlkZGVuIHZpc2liaWxpdHkgZG8gbm90IG5lZWQgYW55IHJ1bi10aW1lIHJl
bG9jYXRpb25zCj4gPiBhZnRlciB0aGUgZmluYWwgbGluaywgd2l0aCB0aGUgYnVpbGQgZmxhZ3Mg
dXNlZCBieSBnbGliYy4KPiAKPiBBdCBsZWFzdCB0aGUgbG9hZGVyIHdpdGggYSBzaW1wbGUgaGVs
bG8gd29ybGQgZG9lcyBub3QgZmFpbCB3aXRoIHFlbXUgd2l0aCAKPiBQSV9TVEFUSUNfQU5EX0hJ
RERFTiBzZXQuCj4gCj4gU3RhZmZvcmssIGNvdWxkIHlvdSBjb25maXJtIGl0IGlzIG9rIHRvIG1h
a2Ugb3IxayB1c2UgUElfU1RBVElDX0FORF9ISURERU4/CgpZZXMsIHRoaXMgd2FzIGp1c3QgYW4g
b3ZlcnNpZ2h0IGFuZCBpdCBkaWRuJ3Qgc2hvdyB1cCBkdXJpbmcgdGVzdGluZy4gSSB0aGluawp0
aGlzIGlzIE9LIGFzIGRlc2NyaWJlZCBvcjFrIGRvZXMgbm90IG5lZWQgcnVudGltZSByZWxvY2F0
aW9ucyBmb3IgaGlkZGVuCnN5bWJvbHMgYWZ0ZXIgdGhlIGZpbmFsIGxpbmsuCgpTaGFsbCBJIG1h
a2UgdGhlIHBhdGNoIHRvIGFkZCBjb25maWd1cmUuYWM/ICBPciBkbyB5b3UgaGF2ZSB0aGF0IHJl
YWR5IHRvIGdvCmFscmVhZHk/CgotU3RhZmZvcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3Rz
LmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3Bl
bnJpc2MK
