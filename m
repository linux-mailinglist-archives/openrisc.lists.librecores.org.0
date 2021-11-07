Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 06FF34475FB
	for <lists+openrisc@lfdr.de>; Sun,  7 Nov 2021 22:03:41 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C8D29240FF;
	Sun,  7 Nov 2021 22:03:40 +0100 (CET)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mail.librecores.org (Postfix) with ESMTPS id 413BE20DE0
 for <openrisc@lists.librecores.org>; Sun,  7 Nov 2021 22:03:38 +0100 (CET)
Received: by mail-pf1-f172.google.com with SMTP id y5so3860455pfb.4
 for <openrisc@lists.librecores.org>; Sun, 07 Nov 2021 13:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=vpk/9gC3ocHn4ZTx9Y5Ns4605yfWLspw1UZYKZ4qbL4=;
 b=oMI6VJNmaZJ1HkQKmEHBT9BGd2Dqedm9yaQgSgVnyAKQNv2huPXwRpeExh+aI9xGOM
 FJ63v5dsBaOfQZ+8BXzuJhyEg0Wc9uzridCk61nk3LS/SBoGXFEA+nx38K3WwgAC0tRw
 nCQCwv53FDyv7Hg3YMplCLA3rYEiTzEUx3Mjtzhrn/CRFZ6f9rkA5T0gCOP4Sa0pOE+2
 +XCZGIVnUJ6UQfwa5dkC7W9j0gr/WJ9w0EfxTFOhjLWKRBcfnjRqpzF0Jrc/qhvWg9zg
 aDwu7Pvlwl27DVWPlDrWJbJC2OEFBE8DNXG+mOS+1oDkv3L9piSw2iwbPuC0DHZvk8f+
 LCBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=vpk/9gC3ocHn4ZTx9Y5Ns4605yfWLspw1UZYKZ4qbL4=;
 b=TzN5bFZATdh+SI3oy6xxjtvxnRodFoiU2jDfCYMP3FEPEiMxWV63HRtwyv9WfDN/Jq
 jgrjqqr/rdr30ZFNbn7iForHya97wTdTSxnY/MhOQDMZPMQkuKgO3e+Vsnul26T3zxim
 638vebH2eev0sbVe8fgX9o4frhTIe2BU3a/tj8C9iJMSwjsAx+Wtcx7fUD+ewILTFVZK
 2Oh/PIQaLGm26/w32LGZp5iF+MX1sueiu12bV24e+8mWhjUpBTuH7nT8K4XotmjLYqQw
 rHRKxjenNdhmP3FU5ezqIIyj/ggS0Ppl481Jjeb5wy7n10tRCmlWMl/9dwqtYzhKCZia
 1nbA==
X-Gm-Message-State: AOAM532tQ7j302tt+zSkzOzpLfzzVR7rz9rGi/yRlKyjwGUEQADGwhAq
 msrSIXnQ+PeI01vQ4wNVB+k=
X-Google-Smtp-Source: ABdhPJxLQw6JYOQ8wahFwNjT7FlHw3ALHyOamMCkSiss3eLK5K2w/lJsKT0jrTRPhXTWnQNR+ozp4w==
X-Received: by 2002:a05:6a00:21c4:b0:475:e532:3d18 with SMTP id
 t4-20020a056a0021c400b00475e5323d18mr76873799pfj.40.1636319016634; 
 Sun, 07 Nov 2021 13:03:36 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id f19sm13703390pfc.72.2021.11.07.13.03.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 13:03:35 -0800 (PST)
Date: Mon, 8 Nov 2021 06:03:34 +0900
From: Stafford Horne <shorne@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YYg/JpmfY9/Z8qO1@antec>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [OpenRISC] [GIT PULL] OpenRISC updates for 5.16
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
Cc: Openrisc <openrisc@lists.librecores.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgTGludXMsCgpQbGVhc2UgY29uc2lkZXIgZm9yIHB1bGwsCgpUaGUgZm9sbG93aW5nIGNoYW5n
ZXMgc2luY2UgY29tbWl0IDU4MTZiM2U2NTc3ZWFhNjc2Y2ViMDBhODQ4ZjBmZDY1ZmUyYWRjMjk6
CgogIExpbnV4IDUuMTUtcmMzICgyMDIxLTA5LTI2IDE0OjA4OjE5IC0wNzAwKQoKYXJlIGF2YWls
YWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogIGdpdDovL2dpdGh1Yi5jb20vb3BlbnJp
c2MvbGludXguZ2l0IHRhZ3MvZm9yLWxpbnVzCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAg
dG8gMjdkZmY5YTljMjQ3ZDRlMzhkODJjMmU3MjM0OTE0Y2ZlODQ5OTI5NDoKCiAgb3BlbnJpc2M6
IGZpeCBTTVAgdGxiIGZsdXNoIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSAoMjAyMS0xMS0wMyAy
MDo0ODoyOSArMDkwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KT3BlblJJU0MgdXBkYXRlcyBmb3IgNS4xNgoKVGhpcyBp
bmNsdWRlcyAyIG1pbm9yIGNsZWFudXBzLCBwbHVzIGEgYnVnIGZpeCBmb3IgT3BlblJJU0MgVExC
IGZsdXNoCmNvZGUgdGhhdCBhbGxvd3MgdGhlIHRoZSBTTVAga2VybmVsIHRvIGJvb3QgYWdhaW4u
CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCkRlbmlzIEtpcmphbm92ICgxKToKICAgICAgb3BlbnJpc2M6IHNpZ25hbDogcmVt
b3ZlIHVudXNlZCBERUJVR19TSUcgbWFjcm8KClJhbmR5IER1bmxhcCAoMSk6CiAgICAgIG9wZW5y
aXNjOiB0aW1lOiBkb24ndCBtYXJrIGNvbW1lbnQgYXMga2VybmVsLWRvYwoKU3RhZmZvcmQgSG9y
bmUgKDEpOgogICAgICBvcGVucmlzYzogZml4IFNNUCB0bGIgZmx1c2ggTlVMTCBwb2ludGVyIGRl
cmVmZXJlbmNlCgogYXJjaC9vcGVucmlzYy9rZXJuZWwvZG1hLmMgICAgfCA0ICsrLS0KIGFyY2gv
b3BlbnJpc2Mva2VybmVsL3NpZ25hbC5jIHwgMiAtLQogYXJjaC9vcGVucmlzYy9rZXJuZWwvc21w
LmMgICAgfCA2ICsrKystLQogYXJjaC9vcGVucmlzYy9rZXJuZWwvdGltZS5jICAgfCAyICstCiA0
IGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBs
aXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jl
cy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
