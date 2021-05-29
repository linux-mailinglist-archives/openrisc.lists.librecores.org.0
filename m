Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D6421394C59
	for <lists+openrisc@lfdr.de>; Sat, 29 May 2021 15:48:35 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8377023CC4;
	Sat, 29 May 2021 15:48:35 +0200 (CEST)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mail.librecores.org (Postfix) with ESMTPS id 30C7420417
 for <openrisc@lists.librecores.org>; Sat, 29 May 2021 15:48:33 +0200 (CEST)
Received: by mail-pg1-f172.google.com with SMTP id t9so979329pgn.4
 for <openrisc@lists.librecores.org>; Sat, 29 May 2021 06:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WzEVVVOFU2I7+S66Q1KlYufG1IO5O8QdDvfcHceNhHU=;
 b=awnqRG/Ay1+3Na89+JwutFPnFTHtypg6wCTQM0kZ8dkfOEy1PiwhZpmCZzZfR/2t4x
 Rvn7h+pkZA1O/jnVUbDbLd8Dg9Wd9vy1VmMkUVuk1AN+7Pg5FbFqWJqjugz9dKq5tiHI
 VZX2BE8jdyrjQMy8Nwe9eS4gyiCSn93RAe5HCmENv5JO/S9CCDaUDb4o+SWabYDf2K3M
 228dh3yka4qfzZzwO8dbEKfsRAZTajljJdX3VcRmh1ZeBRs0Yd4jQsDy7B+hwBktP8wm
 J0XnPTwjyHuNQ8XRiDrhmfVteO9HwKF6LLgCdylcOuprkQmBGfurPrx0FUQpobWszATN
 Z1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WzEVVVOFU2I7+S66Q1KlYufG1IO5O8QdDvfcHceNhHU=;
 b=tpvxwWwBU4N8JwssXVNlUNdZa20iuP9pHvCFyW4dQKKFxc2uEGdOPrpFtjS+pd3taI
 6q9rUUsoqSlbGJk6tBZHGWWDTD4cz2uPJKx+w37ISKXgEQejizpVd0cqBvUccoDCpNLo
 yjTX8p4oElK8/M/J2vCT2R0IVvB93xoMrgQk8PCmFGBI4KQ1s4fCM8YfE+fKIdheWfwM
 UVZX4uMGmRhM6SVTMfgWn40O4H4MRIRxR6Uv2UmTb2NlQuMn1ffQ2EavEKZi4NzcnnB+
 mwNgLyEtSuYJe3CFFMVAz2LK12h3JUNDVerUd3RASObKu/mHk88Zq/Qhrf9PlU83GTx9
 KDPA==
X-Gm-Message-State: AOAM533h6B3bdc1LSf76CH8kkr2vK+4AZSON/usNB225nK4xflGiHKjl
 U1jWn7UpOrkoV8l1vP9mfRQ=
X-Google-Smtp-Source: ABdhPJyMzUWT4MXHK/Yh8LMQWmZylBbhPUgOi71zVxF1p8YSvWiXrxoTuw98/XlHh675XmOUB23WLQ==
X-Received: by 2002:a63:1465:: with SMTP id 37mr13893915pgu.113.1622296111506; 
 Sat, 29 May 2021 06:48:31 -0700 (PDT)
Received: from localhost (g176.222-224-212.ppp.wakwak.ne.jp. [222.224.212.176])
 by smtp.gmail.com with ESMTPSA id w8sm7375325pgf.81.2021.05.29.06.48.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 May 2021 06:48:30 -0700 (PDT)
Date: Sat, 29 May 2021 22:48:28 +0900
From: Stafford Horne <shorne@gmail.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <YLJGLIODWC3rmJKG@antec>
References: <20210529105504.180544-1-wangkefeng.wang@huawei.com>
 <20210529105504.180544-11-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210529105504.180544-11-wangkefeng.wang@huawei.com>
Subject: Re: [OpenRISC] [PATCH 10/15] openrisc: convert to
 setup_initial_init_mm()
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
Cc: Jonas Bonn <jonas@southpole.se>, Andrew Morton <akpm@linux-foundation.org>,
 openrisc@lists.librecores.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU2F0LCBNYXkgMjksIDIwMjEgYXQgMDY6NTQ6NTlQTSArMDgwMCwgS2VmZW5nIFdhbmcgd3Jv
dGU6Cj4gVXNlIHNldHVwX2luaXRpYWxfaW5pdF9tbSgpIGhlbHBlciB0byBzaW1wbGlmeSBjb2Rl
Lgo+IAo+IENjOiBKb25hcyBCb25uIDxqb25hc0Bzb3V0aHBvbGUuc2U+Cj4gQ2M6IFN0ZWZhbiBL
cmlzdGlhbnNzb24gPHN0ZWZhbi5rcmlzdGlhbnNzb25Ac2F1bmFsYWh0aS5maT4KPiBDYzogU3Rh
ZmZvcmQgSG9ybmUgPHNob3JuZUBnbWFpbC5jb20+Cj4gQ2M6IG9wZW5yaXNjQGxpc3RzLmxpYnJl
Y29yZXMub3JnCj4gU2lnbmVkLW9mZi1ieTogS2VmZW5nIFdhbmcgPHdhbmdrZWZlbmcud2FuZ0Bo
dWF3ZWkuY29tPgoKTG9va3MgZmluZSB0byBtZS4KCkFja2VkLWJ5OiBTdGFmZm9yZCBIb3JuZSA8
c2hvcm5lQGdtYWlsLmNvbT4KCj4gLS0tCj4gIGFyY2gvb3BlbnJpc2Mva2VybmVsL3NldHVwLmMg
fCA1ICstLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNCBkZWxldGlvbnMo
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9rZXJuZWwvc2V0dXAuYyBiL2FyY2gv
b3BlbnJpc2Mva2VybmVsL3NldHVwLmMKPiBpbmRleCBjNmY5ZTdiOWY3Y2IuLjhhZTJkYTZhYzA5
NyAxMDA2NDQKPiAtLS0gYS9hcmNoL29wZW5yaXNjL2tlcm5lbC9zZXR1cC5jCj4gKysrIGIvYXJj
aC9vcGVucmlzYy9rZXJuZWwvc2V0dXAuYwo+IEBAIC0yOTMsMTAgKzI5Myw3IEBAIHZvaWQgX19p
bml0IHNldHVwX2FyY2goY2hhciAqKmNtZGxpbmVfcCkKPiAgI2VuZGlmCj4gIAo+ICAJLyogcHJv
Y2VzcyAxJ3MgaW5pdGlhbCBtZW1vcnkgcmVnaW9uIGlzIHRoZSBrZXJuZWwgY29kZS9kYXRhICov
Cj4gLQlpbml0X21tLnN0YXJ0X2NvZGUgPSAodW5zaWduZWQgbG9uZylfc3RleHQ7Cj4gLQlpbml0
X21tLmVuZF9jb2RlID0gKHVuc2lnbmVkIGxvbmcpX2V0ZXh0Owo+IC0JaW5pdF9tbS5lbmRfZGF0
YSA9ICh1bnNpZ25lZCBsb25nKV9lZGF0YTsKPiAtCWluaXRfbW0uYnJrID0gKHVuc2lnbmVkIGxv
bmcpX2VuZDsKPiArCXNldHVwX2luaXRpYWxfaW5pdF9tbShfc3RleHQsIF9ldGV4dCwgX2VkYXRh
LCBfZW5kKTsKPiAgCj4gICNpZmRlZiBDT05GSUdfQkxLX0RFVl9JTklUUkQKPiAgCWlmIChpbml0
cmRfc3RhcnQgPT0gaW5pdHJkX2VuZCkgewo+IC0tIAo+IDIuMjYuMgo+IApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QK
T3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9y
Zy9saXN0aW5mby9vcGVucmlzYwo=
