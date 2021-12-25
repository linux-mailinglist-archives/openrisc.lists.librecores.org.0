Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2D32447F4A0
	for <lists+openrisc@lfdr.de>; Sat, 25 Dec 2021 23:44:35 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C137B242ED;
	Sat, 25 Dec 2021 23:44:34 +0100 (CET)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mail.librecores.org (Postfix) with ESMTPS id EE075240F2
 for <openrisc@lists.librecores.org>; Sat, 25 Dec 2021 23:44:32 +0100 (CET)
Received: by mail-pj1-f54.google.com with SMTP id iy13so10282585pjb.5
 for <openrisc@lists.librecores.org>; Sat, 25 Dec 2021 14:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VX9LgXMSutW9+9M1P6MsVEcWG0shAUBPRWHoeV1ZBEI=;
 b=izEwgog5v/iu+79T/HTZqk1wG6AclhfG7T2VowAmIVY2V+RZHkNA2fjP4owhlR2NZz
 AT0L8cS5ufXIuKYVXPR72T1FBFwRaVyHUkgNai7Ujmg1IzxeBTBP4jnBIH/tPZhZEN56
 ef8PU4NH+qMSLYEaE2FbtP/2rquBeMskh1TerYf5RcSlRwNlNN7xDnm7SmJ8YmOGkeSB
 QMzwK8PzxmN/nP1rCuk/YwgHjn4AzkmlhIiu3bxa4f1JTir19JnX4DU2Uk51gfUYI49U
 5vpzmRBQGJ1ObXxMyDHJ1a6/XrcdXTRjA9WMYI/5Xd+/UBbBDnmyES9pHsqS6BBKjUjg
 zH6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VX9LgXMSutW9+9M1P6MsVEcWG0shAUBPRWHoeV1ZBEI=;
 b=a2c5uYqrCeNCibraEhbuGtfmlZ1/y9fvZ3Eujqt6TpG9jhRxS0evxcVJOiGL4kgGKq
 clYlvCgPMgUS1vUbIbX4GYB5FJTnEJNHmk6W2SbMJIoU2jXr3lunsJnWkFGB84OoJCO+
 zNuasDQaEE8stFNSLVlvejOSr5vQZsYBl6/oA9ibMFxvfTbreAsCBqVnAmfQ2/+sjvY/
 4T1mSitCRM46zv2UTR7hTouXL8QDAldJcUvfgzRp8I0VIITByL+ENaickWlwMhgqYi5J
 ByNPKoxZ7U/41r+VCNTFkmc0pu4wjDmovmLIut5OOcG4XzoFI+lZQXTVeNHIgCBxTBqK
 lJxg==
X-Gm-Message-State: AOAM532iwm3wVUayh3k+/oTjNocRMh1RJ8Ecsi71/d163/2RyTSOqukO
 zQ9O9QqIB5npAOnBWNbRLkk=
X-Google-Smtp-Source: ABdhPJyEgaDLttZmMAPlGXdndspdtDrP7OLfGOBR6Yk474h0sUnhxxSPWYL9Cwebc/6Bx1M4N8JE4A==
X-Received: by 2002:a17:90b:4f44:: with SMTP id
 pj4mr14266453pjb.52.1640472271504; 
 Sat, 25 Dec 2021 14:44:31 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id p17sm13547624pfh.86.2021.12.25.14.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Dec 2021 14:44:30 -0800 (PST)
Date: Sun, 26 Dec 2021 07:44:28 +0900
From: Stafford Horne <shorne@gmail.com>
To: Andreas Schwab <schwab@linux-m68k.org>
Message-ID: <YceezKrlAWqcnpS0@antec>
References: <20211210233456.4146479-1-shorne@gmail.com>
 <cedcb34e-36e3-3bb8-07b7-8412c052b81d@linaro.org>
 <Ybl/E2BWBGRMwF0G@antec> <YcSZ0iyC6STzh9uP@antec>
 <87pmpnnwjf.fsf@igel.home> <YcTpmhHaqS5KaFTG@antec>
 <CAAfxs75QcK2VkXOtbR70y9SjcNnqvNtTMq0bt+8M1az3A_LVPg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAfxs75QcK2VkXOtbR70y9SjcNnqvNtTMq0bt+8M1az3A_LVPg@mail.gmail.com>
Subject: Re: [OpenRISC] [PATCH v3 00/13] Glibc OpenRISC port
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
 Stafford Horne via Libc-alpha <libc-alpha@sourceware.org>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU2F0LCBEZWMgMjUsIDIwMjEgYXQgMDQ6MjQ6MzVQTSArMDkwMCwgU3RhZmZvcmQgSG9ybmUg
d3JvdGU6Cj4gT24gRnJpLCBEZWMgMjQsIDIwMjEsIDY6MjYgQU0gU3RhZmZvcmQgSG9ybmUgPHNo
b3JuZUBnbWFpbC5jb20+IHdyb3RlOgo+IAo+ID4gT24gVGh1LCBEZWMgMjMsIDIwMjEgYXQgMDQ6
NTc6NTZQTSArMDEwMCwgQW5kcmVhcyBTY2h3YWIgd3JvdGU6Cj4gPiA+IE9uIERleiAyNCAyMDIx
LCBTdGFmZm9yZCBIb3JuZSB2aWEgTGliYy1hbHBoYSB3cm90ZToKPiA+ID4KPiA+ID4gPiBJdCBz
ZWVtcyB0aGUgd3JpdGUgdG8gdGhlIHRtcCBmaWxlIHdhcyBmYWlsaW5nIGR1ZSB0aGUgcmUtb3Bl
biBub3QKPiA+IHBhc3NpbmcKPiA+ID4gPiBPX0xBUkdFRklMRS4KPiA+ID4KPiA+ID4gb3BlbjY0
IGltcGxpZXMgT19MQVJHRUZJTEUsIHNvIGlmIHRoYXQgaXMgbWFraW5nIGEgZGlmZmVyZW5jZSwg
dGhlbiB5b3VyCj4gPiA+IG9wZW42NCBpcyBicm9rZW4uCj4gPgo+ID4gUmlnaHQsIHRoYXQgaXMg
d2hhdCB0aGUgZG9jcyBzYXkuICBUaGlzIGFyY2hpdGVjdXR1cmUgaXMgMzItYml0cy4KPiA+Cj4g
PiBBbmQgdGhlIG9wZW42NCBwYXRoIGlzIGdlbmVyaWMuCj4gPgo+ID4gUG9zc2libHkgdGhpcyBi
aXQgcmVtb3ZpbmcgT19MQVJHRUZJTEUgaXMgd3Jvbmc/Cj4gPgo+ID4gSW4gc3lzZGVwcy91bml4
L3N5c3YvbGludXgvb3BlbjY0LmM6Cj4gPgo+ID4gICAyNyAjaWZkZWYgX19PRkZfVF9NQVRDSEVT
X09GRjY0X1QKPiA+ICAgMjggIyBkZWZpbmUgRVhUUkFfT1BFTl9GTEFHUyAwCj4gPiAgIDI5ICNl
bHNlCj4gPiAgIDMwICMgZGVmaW5lIEVYVFJBX09QRU5fRkxBR1MgT19MQVJHRUZJTEUKPiA+ICAg
MzEgI2VuZGlmCj4gPgo+ID4gT3RoZXJ3aXNlIHRoZXJlIGlzIHNvbWV0aGluZyBpcyB3cm9uZyBv
biBsaW51eC4gIEl0IGlzIGV4cGxpY2l0bHkgY2hlY2tpbmcKPiA+IGZvciB0aGUgcHJlY2Vuc2Ug
b2YgT19MQVJHRUZJTEUuCj4gPgo+ID4gaW4gZnMvcmVhZF93cml0ZS5jIGluIGdlbmVyaWNfd3Jp
dGVfY2hlY2tfbGltaXRzOgo+ID4KPiA+ICAgICAgICAgaWYgKCEoZmlsZS0+Zl9mbGFncyAmIE9f
TEFSR0VGSUxFKSkKPiA+ICAgICAgICAgICAgICAgICBtYXhfc2l6ZSA9IE1BWF9OT05fTEZTOwo+
ID4KPiAKPiBUaGVyZSdzIHNvbWV0aGluZyB3cm9uZyB3aXRoIF9fT0ZGX1RfTUFUQ0hFU19PRkY2
NF9UIGluIHRoaXMgcG9ydC4gIFdlIGhhdmUKPiAzMi1iaXQgb2ZmX3QgaW4gTGludXguICBTbyBf
X09GRl9UX01BVENIRVNfT0ZGNjRfVCBzaG91bGQgYmUgdW5kZWZpbmVkIEkKPiB0aGluay4gIEkn
bGwgbG9vayBpbnRvLgoKU28sIF9fT0ZGX1RfTUFUQ0hFU19PRkY2NF9UIGlmIGRlZmluZWQgaWYg
VElNRVNJWkU9PTY0ICYmIFdPUkRTSVpFPT0zMiwgYW5kIGl0J3MKY29ycmVjdCBmcm9tIGdsaWJj
J3MgcGVyc3BlY3RpdmUgYXMgb2ZmX3QgaXMgNjQtYml0cyBpbiB0aGUgdXNlciBBUEkuICBIb3dl
dmVyLAppdCBpcyBub3QgY29ycmVjdCBmb3IgdXNlIGZvciBzZXR0aW5nIE9fTEFSR0VGSUxFLgoK
SW4gbGludXggdGhlIE9fTEFSR0VGSUxFIGZsYWcgaXMgZm9yY2VkIGJhc2VkIG9uIGFyY2hpdGVj
dHVyZSBjb25maWd1cmF0aW9uCkFSQ0hfMzJCSVRfT0ZGX1QuCgogICAgI2RlZmluZSBmb3JjZV9v
X2xhcmdlZmlsZSgpICghSVNfRU5BQkxFRChDT05GSUdfQVJDSF8zMkJJVF9PRkZfVCkpCgpUaGVu
IGl0IGlzIHVzZWQgaW4gc3lzY2FsbHM6CgogICAgU1lTQ0FMTF9ERUZJTkU0KG9wZW5hdCwgaW50
LCBkZmQsIGNvbnN0IGNoYXIgX191c2VyICosIGZpbGVuYW1lLCBpbnQsIGZsYWdzLAoJCSAgICB1
bW9kZV90LCBtb2RlKQogICAgewoJICAgIGlmIChmb3JjZV9vX2xhcmdlZmlsZSgpKQoJCSAgICBm
bGFncyB8PSBPX0xBUkdFRklMRTsKCSAgICByZXR1cm4gZG9fc3lzX29wZW4oZGZkLCBmaWxlbmFt
ZSwgZmxhZ3MsIG1vZGUpOwogICAgfQoKT24gbW9zdCAzMi1iaXQgYXJjaGl0ZWN0dXJlcyBBUkNI
XzMyQklUX09GRl9UIGlzIGNvbmZpZ3VyZWQuICBTTyBJIHRoaW5rIHRoZXJlCmlzIHNvbWV0aGlu
ZyB3cm9uZyB3aXRoIGhvdyB3ZSBhcmUgc2V0dGluZyB1cCBFWFRSQV9PUEVOX0ZMQUdTIGJhc2Vk
IG9uCl9fT0ZGX1RfTUFUQ0hFU19PRkY2NF9UIG9ubHkuICBNYXliZSBpdCBzaG91bGQgYmUgY2hh
bmdlZCB0byBXT1JEU0laRT09MzIgb3IgYQpjb21iaW5hdGlvbi4gIEkgd2lsbCBzZW5kIGEgc2Vw
YXJhdGUgcGF0Y2ggdG8gZGlzY3Vzcy4KCi1TdGFmZm9yZApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NA
bGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5m
by9vcGVucmlzYwo=
