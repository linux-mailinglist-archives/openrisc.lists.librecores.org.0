Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE353BC6B7
	for <lists+openrisc@lfdr.de>; Tue,  6 Jul 2021 08:40:14 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id CD08F20272;
	Tue,  6 Jul 2021 08:40:13 +0200 (CEST)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mail.librecores.org (Postfix) with ESMTPS id 1A07D20272
 for <openrisc@lists.librecores.org>; Tue,  6 Jul 2021 08:40:12 +0200 (CEST)
Received: by mail-pl1-f171.google.com with SMTP id f11so11504088plg.0
 for <openrisc@lists.librecores.org>; Mon, 05 Jul 2021 23:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=RnfC90qmrJRM/A3hqOe/93Ug+s8qei2DZtNwiknaExQ=;
 b=rfDHuSYDvco53PrlcQNTQIw/rO1D+x/M6kaA1somiOMKXkWvB/Q7EwEyjLCFBWa8tW
 n0YBhjyg8v42iLVSS60G/6V5ESwnL3geAdaz97hXM8ODbU+w+0ZsRQj0rtr+Q0i/AS8x
 aairMi8rBOcZKZRG6bnSBj4m7IJoOpKflp2PUSzDnxb23QcfUXRge5bNVgU6tr5up4Dv
 bYGzZOdcskDE+v8KjSnS+JRv6ByFpDaqTcyQXIl4Z5ygCex04/juUp4xJUwTmnwLw6u9
 8/BXHb+cNmBQfsYPeyEbFu1p7/CZloQYs9AseWp1xQgyiHawdkbVz8AgwbsydDpB6PQQ
 BjCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=RnfC90qmrJRM/A3hqOe/93Ug+s8qei2DZtNwiknaExQ=;
 b=TqJkc3DFe45CdJD4YLKsaDpAEjmJxYj6uEfaUt5vjFtpjyHQeaLux2TIOw8+OZy0Y8
 Y5GMydflQBfiXANJnw/W7c84a9eO0e0c4uEsufpA0D1pOK/LYlPU8dDAp7/PFLFx723u
 5eHmTlLZQsF0BIhq7EFzMh9s3ORJ6U3xAExXT8CrgTJkJVPhuVeZS/M29y8IoTv0bn3E
 Ccy48SmqtnXlhyth8LVu9wRh8Ko2q03ukQWK7wPHb/2xiZ5wWMXiIBe3FVIWKOy0sokI
 EZBtsTn9/wp3ryN3D0E/L27/Z+LLfV+1lFGAS5M6vfnAMjqh7Ht9AEh+QjHMZRXCe3SH
 mJlQ==
X-Gm-Message-State: AOAM533C1PpFVYyzK0Upbvn3TGIdhlPbnd1xsawn7TLcwprjbiwUEFAv
 N4pxsWwcmsgCUi5RpuT55GU=
X-Google-Smtp-Source: ABdhPJwS/TL6GSdJ9UJz79AMLTNaG3F0oGhQYz0lOsx6ZNd8CZPH04S2lKOnnCe5a4cVP8dWIFMWkA==
X-Received: by 2002:a17:90a:df10:: with SMTP id
 gp16mr2922095pjb.164.1625553610207; 
 Mon, 05 Jul 2021 23:40:10 -0700 (PDT)
Received: from localhost (g164.115-65-218.ppp.wakwak.ne.jp. [115.65.218.164])
 by smtp.gmail.com with ESMTPSA id
 m7sm7357158pjf.8.2021.07.05.23.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 23:40:09 -0700 (PDT)
Date: Tue, 6 Jul 2021 15:40:07 +0900
From: Stafford Horne <shorne@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YOP6x0Mz8aBv9x18@antec>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [OpenRISC] [GIT PULL] OpenRISC updates for 5.14
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
Cc: Gabriel Somlo <gsomlo@gmail.com>, Openrisc <openrisc@lists.librecores.org>,
 LKML <linux-kernel@vger.kernel.org>, Mateusz Holenko <mholenko@antmicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgTGludXMsCgpQbGVhc2UgY29uc2lkZXIgZm9yIHB1bGwKClRoZSBmb2xsb3dpbmcgY2hhbmdl
cyBzaW5jZSBjb21taXQgNjE0MTI0YmVhNzdlNDUyYWE2ZGY3YTg3MTRlOGJjODIwYjQ4OTkyMjoK
CiAgTGludXggNS4xMy1yYzUgKDIwMjEtMDYtMDYgMTU6NDc6MjcgLTA3MDApCgphcmUgYXZhaWxh
YmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAgZ2l0Oi8vZ2l0aHViLmNvbS9vcGVucmlz
Yy9saW51eC5naXQgdGFncy9mb3ItbGludXMKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0
byBhZDRlNjAwY2JmODk3ZjQ3NTI1YjM0MmNkNGIwMmU4OGVkMzAwYTgzOgoKICBkcml2ZXJzL3Nv
Yy9saXRleDogcmVtb3ZlIDgtYml0IHN1YnJlZ2lzdGVyIG9wdGlvbiAoMjAyMS0wNi0xMSAwNDoz
NTo0MCArMDkwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KT3BlblJJU0MgdXBkYXRlcyBmb3IgNS4xNAoKT25lIGNoYW5n
ZSB0byBzaW1wbGlmeSBMaXRleCBDU1IgKE1NSU8gcmVnaXN0ZXIpIGFjY2VzcyBieSBsaW1pdGlu
ZyB0aGVtCnRvIDMyLWJpdCBvZmZzZXRzLiAgTm93IHRoaXMgaXMgYWdyZWVkIGFtb25nIExpdGV4
IGhhcmR3YXJlIGFuZCBrZXJuZWwKZGV2ZWxvcGVycyBpdCB3aWxsIGFsbG93IHVzIHRvIHN0YXJ0
IHVwc3RyZWFtaW5nIG90aGVyIExpdGV4IHBlcmlwaGVyYWwKZHJpdmVycy4KCi0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KR2Fi
cmllbCBTb21sbyAoMSk6CiAgICAgIGRyaXZlcnMvc29jL2xpdGV4OiByZW1vdmUgOC1iaXQgc3Vi
cmVnaXN0ZXIgb3B0aW9uCgogZHJpdmVycy9zb2MvbGl0ZXgvS2NvbmZpZyAgICAgICAgICB8ICAx
MiAtLS0tLQogZHJpdmVycy9zb2MvbGl0ZXgvbGl0ZXhfc29jX2N0cmwuYyB8ICAgMyArLQogaW5j
bHVkZS9saW51eC9saXRleC5oICAgICAgICAgICAgICB8IDEwMyArKysrKystLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDEw
MiBkZWxldGlvbnMoLSkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3Jn
Cmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
