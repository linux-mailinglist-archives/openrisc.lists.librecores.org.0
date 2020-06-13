Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 76DAA1F8052
	for <lists+openrisc@lfdr.de>; Sat, 13 Jun 2020 04:19:45 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1BD8D20C81;
	Sat, 13 Jun 2020 04:19:45 +0200 (CEST)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by mail.librecores.org (Postfix) with ESMTPS id 819F420AF7
 for <openrisc@lists.librecores.org>; Sat, 13 Jun 2020 04:19:42 +0200 (CEST)
Received: by mail-pl1-f196.google.com with SMTP id n9so4496082plk.1
 for <openrisc@lists.librecores.org>; Fri, 12 Jun 2020 19:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Bo0TAuzTN7c9oRMEnH/nTxVp984RSzHy+ZWlZuT0u48=;
 b=ROp/0+QK2eUfPPBuUEv9CrEl/J3QmKM5q4rYsB5p8kdf3h4bq2jl3JlUWLoT5mCkQf
 6H7B+OWAFfcT+0p4n5sf1p5FX0CxeeQZq6rXBt4/upKbAgXS3c4oVTwIG1Tpcl2Xjs5b
 SGN0u1NkTpz4BZ5n4JgKLnnwpC6UxSfi7cQsen9oKafX5dZQZjArfeTW46T7BgGBEp29
 UFNCcHx20/ZzL2+LGSgiUZOsyNdkuxTpLw2wROvR4vRIYBpi0MOjD2d7qvI9f5qyCdaI
 2KGAa/8WvuU4cXVCIzRGC9GQXcgslGipxpRrmWyv0+qdkW5oTP2vX9AfzRxgWenP4Yfy
 qq9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Bo0TAuzTN7c9oRMEnH/nTxVp984RSzHy+ZWlZuT0u48=;
 b=sK2feg/GZTY3T+lCTr6h0erRGEzU+OMp6HBhHvwnXzMt72sG8lTSdUcnXvLCT9h8HL
 yyrwUWPE/YSSoHE9NlKTI+Drj8EnfU+JjK/WfaQvqY+9kGR2HpSczCYJ9d70xB4vqi84
 BP76ZkNDDZuDIwyOjc6l2zKCCm25sathzaJwvKvW70sOrzyVkeSM5juIr7Rwoo8CBoUj
 kFmCCaOV3n3hDDKjNtTWE27leVwYxOJZ16Ozgt1Fy0vD4d6GiFmqkjSDHihFHwNyKw0q
 TYoAFpzVqsnZ+35BZhzWteGF4jR9WRA801xHTFWJVIWx79XFTHuqJIJ+td/DjrdAypll
 bFSg==
X-Gm-Message-State: AOAM5338NeWxOQdZzuY56YZADjH+xNdz+VEXXEImsZkQQyuByAuHDMgr
 jL+CRc1T2vJEgAk4lXJNQuA=
X-Google-Smtp-Source: ABdhPJzfg5fG/KiTssGHqRsSdRs82XZN06XUV0vl9NFITbS8LB1efTd2+AXFfrV27C/yzTfoMG0uKA==
X-Received: by 2002:a17:90a:e007:: with SMTP id
 u7mr1689819pjy.208.1592014780295; 
 Fri, 12 Jun 2020 19:19:40 -0700 (PDT)
Received: from localhost (g228.115-65-196.ppp.wakwak.ne.jp. [115.65.196.228])
 by smtp.gmail.com with ESMTPSA id
 c2sm7343978pfi.71.2020.06.12.19.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2020 19:19:39 -0700 (PDT)
Date: Sat, 13 Jun 2020 11:19:37 +0900
From: Stafford Horne <shorne@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20200613021937.GN75760@lianli.shorne-pla.net>
References: <20200613021757.GM75760@lianli.shorne-pla.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200613021757.GM75760@lianli.shorne-pla.net>
Subject: Re: [OpenRISC] [GIT PULL] OpenRISC updates for v5.8
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

Q0NpbmcgbGlzdC4KCk9uIFNhdCwgSnVuIDEzLCAyMDIwIGF0IDExOjE3OjU3QU0gKzA5MDAsIFN0
YWZmb3JkIEhvcm5lIHdyb3RlOgo+IEhpIExpbnVzLAo+IAo+IFBsZWFzZSBjb25zaWRlciBmb3Ig
cHVsbDoKPiAKPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGFlODNkMGI0MTZk
YjAwMmZlOTU2MDFlN2Y5N2Y2NGI1OTUxNGQ5MzY6Cj4gCj4gICBMaW51eCA1LjctcmMyICgyMDIw
LTA0LTE5IDE0OjM1OjMwIC0wNzAwKQo+IAo+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBv
c2l0b3J5IGF0Ogo+IAo+ICAgZ2l0Oi8vZ2l0aHViLmNvbS9vcGVucmlzYy9saW51eC5naXQgdGFn
cy9mb3ItbGludXMKPiAKPiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gNmJkMTQwZTE0
ZDlhYWE3MzRlYzM3OTg1YjhiMjBhOTZjMGVjZTk0ODoKPiAKPiAgIG9wZW5yaXNjOiBGaXggaXNz
dWUgd2l0aCBhcmd1bWVudCBjbG9iYmVyaW5nIGZvciBjbG9uZS9mb3JrICgyMDIwLTA2LTAxIDA2
OjE1OjMyICswOTAwKQo+IAo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBPcGVuUklTQyB1cGRhdGVzIGZvciA1LjgKPiAK
PiBPbmUgcGF0Y2ggZm91bmQgd2lsZSBJIHdhcyBnZXR0aW5nIHRoZSBnbGliYyBwb3J0IHJlYWR5
Ogo+ICAtIEZpeCBpc3N1ZSB3aXRoIGNsb25lIFRMUyBhcmcgZ2V0dGluZyBvdmVyd3JpdHRlbgo+
IAo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KPiBTdGFmZm9yZCBIb3JuZSAoMSk6Cj4gICAgICAgb3BlbnJpc2M6IEZpeCBp
c3N1ZSB3aXRoIGFyZ3VtZW50IGNsb2JiZXJpbmcgZm9yIGNsb25lL2ZvcmsKPiAKPiAgYXJjaC9v
cGVucmlzYy9rZXJuZWwvZW50cnkuUyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGli
cmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlz
Ywo=
