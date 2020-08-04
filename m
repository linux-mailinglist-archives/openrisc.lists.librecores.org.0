Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id BEAF22460DE
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:46:47 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 61B6820E7D;
	Mon, 17 Aug 2020 10:46:47 +0200 (CEST)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by mail.librecores.org (Postfix) with ESMTPS id 9964120C57
 for <openrisc@lists.librecores.org>; Tue,  4 Aug 2020 22:48:27 +0200 (CEST)
Received: by mail-ej1-f65.google.com with SMTP id kq25so31001109ejb.3
 for <openrisc@lists.librecores.org>; Tue, 04 Aug 2020 13:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NqpbOQVzDCzUgU0urNu9EPIE4Ge9MLfqzEnXxyaLaK0=;
 b=vSmsvJySEicOLbSHzIA6J7MgSzVb0wwZnrCz69Ozrzro7d3Ac1yqFZH0FAfB73KIwY
 8JYwmoBy0NZVisqeb84sLLG/CkCrIjrwrM1XE4HolDbRdylLOvRrwDKWgx8qGEzEJCX7
 zppNPDwiytYQmvHetDGpoJBMfqCPpoxdG9YtpEesl8rGln7bjGSWl9OOJnxr81w5/GNj
 QTUhiusCCh6y1z8gksTYZi5Vl2onOiiaMGavWoSA8LmVVgXrkBQKiHHEZQ2sujUoGs0w
 /4Ix6WtmX4toYoHqZFEFmBgBYybhz8y/7cQqkah6j200r92kY8kaRy5dlF0SEBcW42Rf
 TI4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NqpbOQVzDCzUgU0urNu9EPIE4Ge9MLfqzEnXxyaLaK0=;
 b=nrs39zbaSUFI3dtqmHrwqR80jYkupy55rWxbHMJRiewhauiZdLefiAH8xXFrVyBsKT
 koUTWDVscMpZbfz6pnwwxDjdSUjY/pIp4bztIusP5/ppAHsx9XfxbZCP7xFWjymsdYxZ
 LJYWjL5LgXllq0n+Za1I7Ah5koh1qihMBb/QzvY/0YHC+ipEy1KXWiiLnxVRSMCVhlBM
 5E172cgS9fL8oQj29NEw/gAm0miJgqUvioCmjDYnscWUdxi4BZ63eCW2SmWVdNQQZ6N7
 QsSJqc6dC/P5Z5ez/1d5ga0tk04gs6XvhZEoeNAOQlmCiYDk4iGh4oEMFrOX4Oh21xZT
 se/w==
X-Gm-Message-State: AOAM531mMizrTllXLF5pqATxRwVkf7Y97mbNWI0RTqi3I/rihGSkqPPx
 4t4Fvoeu2fukeZiLPPPH+kjCWRm3
X-Google-Smtp-Source: ABdhPJwu9MuLWp3ZrRR44iWqE5kIVxrgTONB0odsS9YEKhesx9g3xCecLA/JtmUU+mCFSReF2GgKxA==
X-Received: by 2002:a17:906:1392:: with SMTP id
 f18mr22686757ejc.521.1596574107347; 
 Tue, 04 Aug 2020 13:48:27 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:a7fb:e200:d068:a44f:fa3b:62da])
 by smtp.gmail.com with ESMTPSA id di5sm78772edb.16.2020.08.04.13.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 13:48:24 -0700 (PDT)
Date: Tue, 4 Aug 2020 22:48:08 +0200
From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To: Stafford Horne <shorne@gmail.com>
Message-ID: <20200804204808.ttgkwrievzn5aoqd@ltop.local>
References: <20200804042354.3930694-1-shorne@gmail.com>
 <20200804042354.3930694-4-shorne@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200804042354.3930694-4-shorne@gmail.com>
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:38 +0200
Subject: Re: [OpenRISC] [PATCH 3/6] openrisc: uaccess: Use static inline
 function in access_ok
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
Cc: Jonas Bonn <jonas@southpole.se>, openrisc@lists.librecores.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBBdWcgMDQsIDIwMjAgYXQgMDE6MjM6NTFQTSArMDkwMCwgU3RhZmZvcmQgSG9ybmUg
d3JvdGU6Cj4gQXMgc3VnZ2VzdGVkIGJ5IExpbnVzIHdoZW4gcmV2aWV3aW5nIGNvbW1pdCA5Y2Iy
ZmViNGQyMWQKPiAoImFyY2gvb3BlbnJpc2M6IEZpeCBpc3N1ZXMgd2l0aCBhY2Nlc3Nfb2soKSIp
IGxhc3QgeWVhcjsgbWFraW5nCj4gX19yYW5nZV9vayBhbiBpbmxpbmUgZnVuY3Rpb24gYWxzbyBm
aXhlcyB0aGUgdXNlZCB0d2ljZSBpc3N1ZSB0aGF0IHRoZQo+IGNvbW1pdCB3YXMgZml4aW5nLiAg
SSBhZ3JlZSBpdCdzIGEgZ29vZCBjbGVhbnVwLiAgVGhpcyBwYXRjaCBhZGRyZXNzZXMKPiB0aGF0
IGFzIEkgYW0gY3VycmVudGx5IHdvcmtpbmcgb24gdGhlIGFjY2Vzc19vayBtYWNybyB0byBmaXh1
cCBzcGFyc2UKPiBhbm5vdGF0aW9ucyBpbiBPcGVuUklTQy4KPiAKPiBTdWdnZXN0ZWQtYnk6IExp
bnVzIFRvcnZhbGRzIDx0b3J2YWxkc0BsaW51eC1mb3VuZGF0aW9uLm9yZz4KPiBTaWduZWQtb2Zm
LWJ5OiBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4KCkxvb2sgZ29vZCB0byBtZS4K
Ci0tIEx1YwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpP
cGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6
Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
