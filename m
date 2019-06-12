Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2F7D94271D
	for <lists+openrisc@lfdr.de>; Wed, 12 Jun 2019 15:12:18 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 16F1620274;
	Wed, 12 Jun 2019 15:12:18 +0200 (CEST)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by mail.librecores.org (Postfix) with ESMTPS id 58F3620155
 for <openrisc@lists.librecores.org>; Wed, 12 Jun 2019 15:12:16 +0200 (CEST)
Received: by mail-pf1-f195.google.com with SMTP id r7so3765637pfl.3
 for <openrisc@lists.librecores.org>; Wed, 12 Jun 2019 06:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=58C7UqcVKNQUoI1ZLLpPamtScLuPlrUTvZk/mGl8tHc=;
 b=Bm08tCFuiy3eQzcahFQCuadx+KD6WtI+N9m0CKaDgvb+9bxmQfivxl9kqCFEuzVl9E
 PBUZxgQ9PJFOYMBL//k3yZy0O5C9ql3fsM3liaj7LDM/j96ic6EpBQJX1fu6/mcO5Rj0
 24Lt6cPyrwFHCws6X6hBgXfAEBXY+Ov9BLkAsGmQ78tKKuTrwLOtBs0LcGBO8/GUXCDT
 aDvjvCr7izhu/mL4oE8Qg9MkQYyVuDfRVjpiN8Oc1nEyhW3ckAKg/GHubf2R9egVtv8i
 L6IyxNqQiUPcn4SLHxFhOF0M5z0znqzW7Sy+ZGSFDb+4cw353djTeiF+pJqo/zwu9let
 ctow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=58C7UqcVKNQUoI1ZLLpPamtScLuPlrUTvZk/mGl8tHc=;
 b=ifCg9kk4BmS3Z5f+jor5NwnbSXGeDjLuUFAROhWi1hS1rHI6KtFnsgjxLhIJ+sS3an
 d6+eNcDZQUNKVuiqNU43Zdc9d5MfpbUSWF0l7G/8o5xXTn069MgRg/XuoloidCxmMGw1
 hewPuKAK9gx/Z0eK81TmNhQW6yfWedd8wj/CiVd82fVSdRXVwadisad4ZJMM04s9oPMx
 TcVs7sb26GsiBNlrYXrdL+3i1dCRfbN6Z1utd2/eCGvFq6NIYRacdT+0ZvygzFzNhkVH
 32J/h2kwZ70oqHJnJmBnfSZCVECNsbCcgB1I9i4bqFI+yzglwvjLV49vTg7t7eMY0DLP
 NW7w==
X-Gm-Message-State: APjAAAUEK0mkTCLt0ifew1hQcNUKp5CkFGFV/M2SG8VEPbuiIP67KgfO
 fRoegq416rBPbHKek5eLQac=
X-Google-Smtp-Source: APXvYqyO+jGZef6ZpLxRGdsI2k7/FXDWl7hh41dMznQu1Ul7k6hD/ANR2/YNtggppTcWUJefdMdNQQ==
X-Received: by 2002:aa7:90d3:: with SMTP id k19mr84038803pfk.1.1560345134966; 
 Wed, 12 Jun 2019 06:12:14 -0700 (PDT)
Received: from localhost (g30.211-19-85.ppp.wakwak.ne.jp. [211.19.85.30])
 by smtp.gmail.com with ESMTPSA id e26sm18049468pfn.94.2019.06.12.06.12.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 12 Jun 2019 06:12:14 -0700 (PDT)
Date: Wed, 12 Jun 2019 22:12:12 +0900
From: Stafford Horne <shorne@gmail.com>
To: Nick Clifton <nickc@redhat.com>
Message-ID: <20190612131212.GD2358@lianli.shorne-pla.net>
References: <20190608213225.3230-1-shorne@gmail.com>
 <a597b99a-bf5c-0c6b-bc8a-c81faf856f1d@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a597b99a-bf5c-0c6b-bc8a-c81faf856f1d@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [OpenRISC] [PATCH v3 0/11] OpenRISC orfpx64a32 and openrisc
 spec 1.3 support
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
 GNU Binutils <binutils@sourceware.org>, Andrey Bacherov <bandvig@mail.ru>,
 Andrew Burgess <andrew.burgess@embecosm.com>,
 GDB patches <gdb-patches@sourceware.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMDU6MDI6NDNQTSArMDEwMCwgTmljayBDbGlmdG9uIHdy
b3RlOgo+IEhpIFN0YWZmb3JkLAo+IAo+ID4gSXRzIGJlZW4gYSB3aGlsZSBzaW5jZSB2MiwgYnV0
IHdlIGhhdmUgYmVlbiBidXN5IGNoYW5naW5nIGRpcmVjdGlvbiBhIGJpdC4KPiA+IEluc3RlYWQg
b2YganVzdCBhZGRpbmcgdGhlIG9yZnB4NjRhMzIgZXh0ZW5zaW9uIHN1cHBvcnQgd2UgaGF2ZSBj
cmVhdGVkIGEgbmV3Cj4gPiBhcmNoaXRlY3R1cmUgc3BlY2lmaWNhdGlvbiBbMF0gYW5kIHRoaXMg
c2VyaWVzIGluY2x1ZGVzIHNvbWUgb2YgdGhvc2UgY2hhbmdlcy4KPiAKPiBUaGUgYmludXRpbHMg
cGFydHMgb2YgdGhlIHBhdGNoIHNlcmllcyBhcmUgYXBwcm92ZWQgLSBwbGVhc2UgYXBwbHkuCgpU
aGFua3MgZm9yIHRoZSByZXZpZXcsCgpJIHdpbGwgYXBwbHkgb25jZSBJIGdldCB0aGUgZ28gYWhl
YWQgb24gdGhlIGNnZW4gcGF0Y2hlcy4KCi1TdGFmZm9yZApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NA
bGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5m
by9vcGVucmlzYwo=
