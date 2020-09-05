Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id BFD0025E7E0
	for <lists+openrisc@lfdr.de>; Sat,  5 Sep 2020 15:25:41 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 550C920D76;
	Sat,  5 Sep 2020 15:25:41 +0200 (CEST)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by mail.librecores.org (Postfix) with ESMTPS id EBD7D20CF5
 for <openrisc@lists.librecores.org>; Sat,  5 Sep 2020 15:25:38 +0200 (CEST)
Received: by mail-pg1-f195.google.com with SMTP id m8so468213pgi.3
 for <openrisc@lists.librecores.org>; Sat, 05 Sep 2020 06:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RpTYqJDfCzMfPyaa3uIZG/zj/iG+ilw7s8rADz0kWtk=;
 b=SfHARBM3j8jhbV/5LA1/aP7kB9hdvJOSeRFtFowLgNAgQBaynONoaFZwb9HUjHEVfC
 wcmY7jTzvISdB3K+kKP5J4+t5d/nQ8ru0OERRUs2DsqodpY0rGZu+Om5ZnsTvEM4QjVD
 kvDB/rT7URWrZf61T1OSCS8+FZen8oVEFqHwdfNChGnbwy36AGdeu8pM2kyTZO7YPiSQ
 hL2KzX39FTZutU3lXDywSWHc6ojkUH2SPFaEZrwTf2gMPUCKIVdheQX2LwqxjUn3E1L1
 6zxhPanhEQGuMgrvvE2+AFDF0yo+4I3Rh3J/+mYwX/ho9TkN7lwzN73njlATavMqkEoi
 m4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RpTYqJDfCzMfPyaa3uIZG/zj/iG+ilw7s8rADz0kWtk=;
 b=bX/vCmFCoDiyp2KJkOcYKNO5lz5uL9xYGAo9V9I3sNsh2+4hEZi09OaZ92Z1jz4fT3
 uoIHNOlZ3xh2c/zrRKZKgb3/I0HCQiEeUW9NrflYAOfSrjBk7hsCEBIitBHAT8XyI1I3
 AbOaX4go7Vg7LhJzIgkNoYHin6UqM+WDg3i5X356sOcP9EkVhPwZ/z1tynxjkjR++z7l
 FbgpQkILjwClyrprrVgI96Ym1awlYEXN6IBPF2rOtQu15Uh5e05G0zqPFA9EK7XXs2Kf
 EIGcI1F8fSvsONqIw3kaQuTt39dmVfAAbTUiBH0shP1DSumTqo4FaRMeRYJymfd+Uj3+
 LmIw==
X-Gm-Message-State: AOAM5315sBnM0TxYQsMdbrLvJOhwSA5MOoqQ8aSgX3fnMmPIhhnaBm1E
 RdtlCI+wKjtEu/EQS0ureQc=
X-Google-Smtp-Source: ABdhPJzliTb1mfI3tkyrpWY3Qs/hrlwMGgtll10Q3LnFdyJL2Wgap5r1lHol6UW3u5qjIgB+mjgDpg==
X-Received: by 2002:a63:1226:: with SMTP id h38mr10662767pgl.196.1599312337504; 
 Sat, 05 Sep 2020 06:25:37 -0700 (PDT)
Received: from localhost (g223.115-65-55.ppp.wakwak.ne.jp. [115.65.55.223])
 by smtp.gmail.com with ESMTPSA id j14sm5414362pjz.21.2020.09.05.06.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2020 06:25:36 -0700 (PDT)
Date: Sat, 5 Sep 2020 22:25:34 +0900
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Message-ID: <20200905132534.GH3562056@lianli.shorne-pla.net>
References: <20200905131935.972386-1-shorne@gmail.com>
 <20200905131935.972386-2-shorne@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200905131935.972386-2-shorne@gmail.com>
Subject: Re: [OpenRISC] [PATCH v2 1/3] openrisc: Reserve memblock for initrd
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
Cc: Jonas Bonn <jonas@southpole.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arvind Sankar <nivedita@alum.mit.edu>, openrisc@lists.librecores.org,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU2F0LCBTZXAgMDUsIDIwMjAgYXQgMTA6MTk6MzNQTSArMDkwMCwgU3RhZmZvcmQgSG9ybmUg
d3JvdGU6Cj4gUmVjZW50bHkgT3BlblJJU0MgYWRkZWQgc3VwcG9ydCBmb3IgZXh0ZXJuYWwgaW5p
dHJkIGltYWdlcywgYnV0IEkgZm91bmQKPiBzb21lIGluc3RhYmlsaXR5IHdoZW4gdXNpbmcgbGFy
Z2VyIGJ1aWxkcm9vdCBpbml0cmQgaW1hZ2VzLiBJdCB0dXJuZWQKPiBvdXQgdGhhdCBJIGZvcmdv
dCB0byByZXNlcnZlIHRoZSBtZW1ibG9jayBzcGFjZSBmb3IgdGhlIGluaXRyZCBpbWFnZS4KPiAK
PiBUaGlzIHBhdGNoIGZpeGVzIHRoZSBpbnN0YWJpbGl0eSBpc3N1ZSBieSByZXNlcnZpbmcgbWVt
YmxvY2sgc3BhY2UuCj4gCj4gRml4ZXM6IGZmNmM5MjNkYmVjMyAoIm9wZW5yaXNjOiBBZGQgc3Vw
cG9ydCBmb3IgZXh0ZXJuYWwgaW5pdHJkIGltYWdlcyIpCj4gU2lnbmVkLW9mZi1ieTogU3RhZmZv
cmQgSG9ybmUgPHNob3JuZUBnbWFpbC5jb20+Cj4gLS0tCkZvcmdvdCB0byBtZW50aW9uOgoKQ2hh
bmdlcyBzaW5jZSB2MToKICAtIFVwZGF0ZWQgdG8gdXNlIHNlcGFyYXRlIHZhcmlhYmxlcyBhcyBz
dWdnZXN0ZWQgYnkgTWlrZS4KCj4gIGFyY2gvb3BlbnJpc2Mva2VybmVsL3NldHVwLmMgfCAxMCAr
KysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAt
LWdpdCBhL2FyY2gvb3BlbnJpc2Mva2VybmVsL3NldHVwLmMgYi9hcmNoL29wZW5yaXNjL2tlcm5l
bC9zZXR1cC5jCj4gaW5kZXggYjE4ZTc3NWY4YmUzLi4xM2M4N2YxZjg3MmIgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9vcGVucmlzYy9rZXJuZWwvc2V0dXAuYwo+ICsrKyBiL2FyY2gvb3BlbnJpc2Mva2Vy
bmVsL3NldHVwLmMKPiBAQCAtODAsNiArODAsMTYgQEAgc3RhdGljIHZvaWQgX19pbml0IHNldHVw
X21lbW9yeSh2b2lkKQo+ICAJICovCj4gIAltZW1ibG9ja19yZXNlcnZlKF9fcGEoX3N0ZXh0KSwg
X2VuZCAtIF9zdGV4dCk7Cj4gIAo+ICsjaWZkZWYgQ09ORklHX0JMS19ERVZfSU5JVFJECj4gKwkv
KiBUaGVuIHJlc2VydmUgdGhlIGluaXRyZCwgaWYgYW55ICovCj4gKwlpZiAoaW5pdHJkX3N0YXJ0
ICYmIChpbml0cmRfZW5kID4gaW5pdHJkX3N0YXJ0KSkgewo+ICsJCXVuc2lnbmVkIGxvbmcgYWxp
Z25lZF9zdGFydCA9IEFMSUdOX0RPV04oaW5pdHJkX3N0YXJ0LCBQQUdFX1NJWkUpOwo+ICsJCXVu
c2lnbmVkIGxvbmcgYWxpZ25lZF9lbmQgPSBBTElHTihpbml0cmRfZW5kLCBQQUdFX1NJWkUpOwo+
ICsKPiArCQltZW1ibG9ja19yZXNlcnZlKF9fcGEoYWxpZ25lZF9zdGFydCksIGFsaWduZWRfZW5k
IC0gYWxpZ25lZF9zdGFydCk7Cj4gKwl9Cj4gKyNlbmRpZiAvKiBDT05GSUdfQkxLX0RFVl9JTklU
UkQgKi8KPiArCj4gIAllYXJseV9pbml0X2ZkdF9yZXNlcnZlX3NlbGYoKTsKPiAgCWVhcmx5X2lu
aXRfZmR0X3NjYW5fcmVzZXJ2ZWRfbWVtKCk7Cj4gIAo+IC0tIAo+IDIuMjYuMgo+IApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5n
IGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNv
cmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
