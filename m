Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 50F0143BBC7
	for <lists+openrisc@lfdr.de>; Tue, 26 Oct 2021 22:44:07 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id EB4312422A;
	Tue, 26 Oct 2021 22:44:06 +0200 (CEST)
Received: from mail-out-2.itc.rwth-aachen.de (mail-out-2.itc.rwth-aachen.de
 [134.130.5.47])
 by mail.librecores.org (Postfix) with ESMTPS id 9084E24176
 for <openrisc@lists.librecores.org>; Tue, 26 Oct 2021 22:44:05 +0200 (CEST)
IronPort-SDR: OUI9gguObYV31SXJ/K+3/j1DrUZjiIATVl9UXH3gyOETIKxOuthurqms2AYxxR6wHFccLYkQ+b
 DCbx5uWqwzVA==
X-IPAS-Result: =?us-ascii?q?A2ByCwAGaHhh/50agoZagQmDKoFPWGqER45rgXeeUQsBA?=
 =?us-ascii?q?QEBAQEBAQEIATcIAgQBAYdTAiU4EwECBAEBAQEDAgMBAQEBBQEBBgEBAQEBA?=
 =?us-ascii?q?QUEgSSFLzkNhmwPAQV2AiYCSRYNCAEBgm0BgwcBDq4ogTGBAYNOAYEagyyBX?=
 =?us-ascii?q?QYJAYEGKocdhyCBZUSBFSeGJAICgiuCS4JlBI8/gQCBd5UeqQwHggmBLIpLl?=
 =?us-ascii?q?BgGQYNqkgKRMZYMgj+HcIJCiyCNawIEAgQFAhaBeIF9TSSDOVAXAg+SEopgQ?=
 =?us-ascii?q?DICAQE0AgYLAQEDCYVqjQUBAQ?=
IronPort-Data: A9a23:lX6o9qs7M/VTuxGV2pe4u3Mr4ufnVPNcMUV32f8akzHdYApBsoF/q
 tZmKWHXOvrbM2GnL950bIXnoUxT7JaAmNBkHQpv+yA8Qi5HgMeUXt7xwmUcns+xBpCZEBg3v
 512hv3odp1coqr0/0/1WlTZQPoVOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cw24bhWGthh
 PuryyHhEA79s9JLGj9Mg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZcxMUdrJp8tuSH
 I4v+pnkpD+Dr0d1Yj+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRYRQR8/ttmHozx+4
 MpRucWoQhUwAo/3pOcyUiVSDCNyOqITrdcrIVDn2SCS51fZb3vh07BxVQQ8e5cH5uYyCG0I+
 fFwxDIlN0vfwbvtmPThFK8125tLwMrDZevzvllCxDefMvsnR4vfRK7JzcVHwDd1j8lFHfvYI
 cYUAdZqRE2eOU0TZg1MVfrSms/43WOudGJ+iWiHuO0xvEjs7V1a2ZbyZY+9ltuiAJ89clyjj
 mXe8mLjAwoRHNie0iaetHatjPXCliThVZlUE6e3nsOGm3WJ2XATBQ1TSgL+q7+jlVK+HttTb
 UAZksYzkZUPGIWQZoGVd3WFTLSs53bwh/I4/zUG1Tyw
IronPort-HdrOrdr: A9a23:aj6T7q6uF9QlGJH/1APXwPbXdLJyesId70hD6qkRc31om6mj/K
 qTdZsgpHzJYVoqNU3I4OrwXpVoIkmzyXcW2+Us1N6ZNWHbUAHBFvAa0WKI+VLd8kPFltK02c
 9bAspD4NCZNykcsS7xiDPIdurJz7G8gcSVuds=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.87,184,1631570400"; d="scan'208";a="162844235"
Received: from rwthex-w1-b.rwth-ad.de ([134.130.26.157])
 by mail-in-2.itc.rwth-aachen.de with ESMTP; 26 Oct 2021 22:44:05 +0200
Received: from [IPv6:2a02:908:108b:a40:b131:ad:affd:8e59]
 (2a02:908:108b:a40:b131:ad:affd:8e59) by rwthex-w1-b.rwth-ad.de
 (2a00:8a60:1:e500::26:157) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.14; Tue, 26 Oct
 2021 22:44:04 +0200
From: Jan Henrik Weinstock <jan.weinstock@rwth-aachen.de>
To: <openrisc@lists.librecores.org>
Message-ID: <e35018e8-a15b-550d-cc3e-6b6d045f1b52@rwth-aachen.de>
Date: Tue, 26 Oct 2021 22:43:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [2a02:908:108b:a40:b131:ad:affd:8e59]
X-ClientProxiedBy: RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155) To
 rwthex-w1-b.rwth-ad.de (2a00:8a60:1:e500::26:157)
Subject: [OpenRISC] OpenRISC SMP kernels broken after 5.8?
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgYWxsLAoKSSByZWNlbnRseSB0cmllZCB0byB1cGRhdGUgdGhlIGtlcm5lbCBteSBzaW11bGF0
b3JbMV0gaXMgcnVubmluZyB0byAKNS4xMCwgYnV0IEkgbm90aWNlZCB0aGUgbmV3ZXIga2VybmVs
cyAoPjUuOCkgYWxsIHBhbmljIGluIApmbHVzaF90bGJfcGFnZVsyXSwgYmVjYXVzZSBpdCBpcyBj
YWxsZWQgd2l0aCB2bWEgPT0gTlVMTCBmcm9tIApmbHVzaF90bGJfa2VybmVsX3JhbmdlWzNdLiBM
b29raW5nIGF0IHRoZSBjb2RlLCBJIGRvIG5vdCBzZWUgaG93IHRoaXMgCmNvdWxkIHdvcmsgZm9y
IGFueSBTTVAga2VybmVsIChob3dldmVyLCBmb3Igbm9uLVNNUCwgd2UgY2FsbCAKbG9jYWxfdGxi
X2ZsdXNoX3BhZ2VbNF0sIHdoZXJlIHdlIGRvIG5vdCB1c2Ugdm1hLCBzbyBJIGd1ZXNzIGl0cyBm
aW5lIAp0aGVyZSkuIEFueSBpZGVhcz8KClsxXSBodHRwczovL2dpdGh1Yi5jb20vamFud2VpbnN0
b2NrL29yMWttdnAKWzJdIApodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS4xMC43
NS9zb3VyY2UvYXJjaC9vcGVucmlzYy9rZXJuZWwvc21wLmMjTDMxMgpbM10gCmh0dHBzOi8vZWxp
eGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjEwLjc1L3NvdXJjZS9hcmNoL29wZW5yaXNjL2luY2x1
ZGUvYXNtL3RsYmZsdXNoLmgjTDU5Cls0XSAKaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGlu
dXgvdjUuMTAuNzUvc291cmNlL2FyY2gvb3BlbnJpc2MvbW0vdGxiLmMjTDk2Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlz
dApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMu
b3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
