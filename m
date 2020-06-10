Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 4145F1F5CD4
	for <lists+openrisc@lfdr.de>; Wed, 10 Jun 2020 22:17:20 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C873220C60;
	Wed, 10 Jun 2020 22:17:19 +0200 (CEST)
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by mail.librecores.org (Postfix) with ESMTPS id 24B9C20493
 for <openrisc@lists.librecores.org>; Wed, 10 Jun 2020 22:17:18 +0200 (CEST)
Received: by mail-pl1-f193.google.com with SMTP id d8so1382378plo.12
 for <openrisc@lists.librecores.org>; Wed, 10 Jun 2020 13:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uZoJ3J1xq5pqWp4X37k0ygMtMZCY+ZW4kW6YziJCps0=;
 b=j52YsoP6np2JxYQMyWA9NOEbCzQ+OAZfsyWSkNH2RpjfrHYD3cTLSaHWDDWPXle2Mp
 InKJ5jILBMUZZ9SpaU+7h84c5hImutaqrJhIoLDc4PUB8QVkZyNlN0UBsD9jo4EwWxKs
 +HPbxXmbUywJ+Qrj9qShDfPfwPcDdThyKUy3u8aNwWxbdBYRKxAURyqOh41GoaXIDON2
 eN73jThl0Bfcno+OhX8zAmLVSXe04MRmX6ZW5qGX+NQMnpxZKgoR0KFE3TLMC3Wxk2dA
 D/F/1dgGAsOSsvrHY2BgUc7npSFU9u9gPkVrQFyuPVLWTH/P5rDHDLpazxgUBjToH14n
 eCEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uZoJ3J1xq5pqWp4X37k0ygMtMZCY+ZW4kW6YziJCps0=;
 b=fHjQE7GJ4IMwD0uoyC6i2Ll2gSR68w4nXUntansvha9ySsBMW/zHUbJHJJbeAuUVow
 wVKByjzwgnbU6y52GY1cfD0YPWBE0lzD/Bb3t23gMY+sSABRpfu0o9XsCBjaaBkMxHnt
 OT4i/ybSFmzpXC/rB0hHcGS29KGVyhwd3EBx/gPSrasiesOStmAkUpdBkK9onpCv/4hu
 PbnQWbdQ0PmVCbJGh9/v3ENQBn9DyACDT7RavsmUIth1HeAXv6kf+GJCP42v0voahu5T
 PezEZ8rRFJ27DBQXJH5HCGJ7MLHloxczZYZZT7Luo68vTvS565lweXMgpj7qV0LEQEvM
 HfVA==
X-Gm-Message-State: AOAM531v9Nd8dEr2u2tDkIOrqlNVhj3VgS4OWZf7icW3OGemJAVJHT/h
 IoFPXV4KxC1ECCTg/Sk8hNg=
X-Google-Smtp-Source: ABdhPJwWWGeQIpul/fHQJHwB/g+ckvTBf1ZBGrMFSwGlAb5JkGm5qKU+llumjzf+YltBsJO2ZZefnQ==
X-Received: by 2002:a17:90a:1d46:: with SMTP id
 u6mr4938758pju.146.1591820235836; 
 Wed, 10 Jun 2020 13:17:15 -0700 (PDT)
Received: from localhost (g228.115-65-196.ppp.wakwak.ne.jp. [115.65.196.228])
 by smtp.gmail.com with ESMTPSA id
 k126sm739343pfd.129.2020.06.10.13.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 13:17:14 -0700 (PDT)
Date: Thu, 11 Jun 2020 05:17:12 +0900
From: Stafford Horne <shorne@gmail.com>
To: Joseph Myers <joseph@codesourcery.com>
Message-ID: <20200610201712.GL75760@lianli.shorne-pla.net>
References: <20200522113633.209664-1-shorne@gmail.com>
 <20200522113633.209664-2-shorne@gmail.com>
 <87eerc3z7b.fsf@oldenburg2.str.redhat.com>
 <20200522215953.GC75760@lianli.shorne-pla.net>
 <alpine.DEB.2.21.2005222201450.10437@digraph.polyomino.org.uk>
 <20200522223218.GD75760@lianli.shorne-pla.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200522223218.GD75760@lianli.shorne-pla.net>
Subject: Re: [OpenRISC] [PATCH 1/1] Initial support for OpenRISC
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
 Stafford Horne via Libc-alpha <libc-alpha@sourceware.org>,
 Christian Svensson <blue@cmd.nu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU2F0LCBNYXkgMjMsIDIwMjAgYXQgMDc6MzI6MThBTSArMDkwMCwgU3RhZmZvcmQgSG9ybmUg
d3JvdGU6Cj4gT24gRnJpLCBNYXkgMjIsIDIwMjAgYXQgMTA6MDI6NTRQTSArMDAwMCwgSm9zZXBo
IE15ZXJzIHdyb3RlOgo+ID4gT24gU2F0LCAyMyBNYXkgMjAyMCwgU3RhZmZvcmQgSG9ybmUgdmlh
IExpYmMtYWxwaGEgd3JvdGU6Cj4gPiAKPiA+ID4gRm9yIGJpbnV0aWxzIGFuZCBnY2MgcmVxdWly
ZSBwYXRjaGVzIHdoaWNoIGFyZSBtZW50aW9uZWQgaW4gdGhlIGNvdmVyIGxldHRlci4KPiA+ID4g
SSB3aWxsIGRvY3VtZW50Lgo+ID4gCj4gPiBJbiBteSB2aWV3IHRoZSBjaGFuZ2VzIG5lZWQgdG8g
YmUgdXBzdHJlYW0gYmVmb3JlIHRoZSBwYXRjaCBjYW4gZ28gaW50byAKPiA+IGdsaWJjLiAgV2Ug
d2FudCB0byBhdm9pZCB0aGUgbWVzcyB3ZSBoYWQgd2l0aCBNaWNyb0JsYXplIHdoZXJlIHRoZSBw
b3J0IAo+ID4gdHVybmVkIG91dCB0byBkZXBlbmQgb24gR0NDIHBhdGNoZXMgdGhhdCBoYWRuJ3Qg
eWV0IGJlZW4gdXBzdHJlYW1lZC4KPiAKPiBOb3RlcywgIEkgZG9uJ3QgdGhpbmsgdGhhdCB3aWxs
IGJlIGEgcHJvYmxlbS4gIEJpbnV0aWxzIHBhdGNoZXMgYXJlIGFscmVhZHkKPiB1cHN0cmVhbS4g
IFRoZSBHQ0MgcGF0Y2hlcyBzaG91bGQgYmUgdG9vIGJlZm9yZSBJIHNlbmQgdGhlIFYyIHNlcmll
cyAoSSBqdXN0Cj4gbmVlZCB0byBwdXNoIHRoZW0pLgoKCkhpIEFsbCwKCkp1c3QgYW4gdXBkYXRl
IG9uIHRoaXMgc2VyaWVzLiAgSSBoYXZlIG1hZGUgYWxsIG9mIHRoZSBjaGFuZ2VzIGJ1dCB0aGUg
dXBkYXRlcwp0byBuZXcga2VybmVsIEFQSSdzIGFyZSBtYWtpbmcgcXVpdGUgYSBuZXcgdGVzdCBm
YWlsLiAgTW9zdGx5IHRoZXNlIGFyZQplbnZpcm9ubWVudGFsIGlzc3VlcyB0aGF0IEkgbmVlZCB0
byBzb3J0IG91dC4KCk15IHRvZG8gbGlzdCBub3cgaXM6CgogLSBTb3J0IG91dCBhbGwgbmV3IGZh
aWx1cmVzCiAtIFNvcnQgb3V0IHRoZSBGUFUgZmFpbHVyZXMgKEkgbWF5IG1haWwgYXNraW5nIGZv
ciBoZWxwIG9uIHRoYXQpCiAtIEdvIHRob3VnaCBhbGwgZmlsZXMgYWdhaW4gdG8gZW5zdXJlIHdo
YXQgaXMgYW5kIGlzbid0IG5lZWRlZCAoaS5lLiByZW1vdmVkCiAgIGR1ZSB0byB1cHN0cmVhbSBy
ZWZhY3RvcmluZ3MpCiAtIFVwZGF0ZSB0aGUgd2lraSBwYWdlcyBhcyByZXF1aXJlZCBieSBOZXdQ
b3J0cwoKSXQncyBnb2luZyB0byB0YWtlIG1lIGEgYml0IGxvbmdlciB0aGFuIEkgZXhwZWN0ZWQg
dG8gZ2V0IHYyIG91dC4KCi1TdGFmZm9yZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGli
cmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlz
Ywo=
