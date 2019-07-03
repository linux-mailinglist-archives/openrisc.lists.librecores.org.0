Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id EE8EF5EF18
	for <lists+openrisc@lfdr.de>; Thu,  4 Jul 2019 00:20:02 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A1BCC20343;
	Thu,  4 Jul 2019 00:20:02 +0200 (CEST)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by mail.librecores.org (Postfix) with ESMTPS id 8CE6220317
 for <openrisc@lists.librecores.org>; Thu,  4 Jul 2019 00:20:00 +0200 (CEST)
Received: by mail-pf1-f193.google.com with SMTP id r7so1941350pfl.3
 for <openrisc@lists.librecores.org>; Wed, 03 Jul 2019 15:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kUqLYxJx0xvJP4RUX1CV3nX9D0UksuywBdIjmsm3TkQ=;
 b=XKbHxOeJIMPbD+2FVbzGW+SKqFp7KgHl8+0B2QxHZc5aInMsrpgBYitXdodypub4Ko
 hD4uRVNeHC1uumYrVO1slUT6w4t4BYg004OMXJ7de0Ywx3Kr+p0K+6n3E8zrMqvoyyxT
 YIlggWOvax+h0eE6FSv2wmPfXkvsV1lnRgwHSY+jaqVcs9Ty5u4zHZfeUSsQGQjb08NK
 G59FZqc7Mw74f7PwbIeh4Hprk21f1VnueYZCmxqSnruh3MoiwiqSd4Yo1rCpYKpBcG1x
 +YnYd9G7np38HCL2+lHkz6NVuBwocA8UbjURhSxGPxqmztmq6Iv5/qo+cnI0Km9vyODF
 E/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kUqLYxJx0xvJP4RUX1CV3nX9D0UksuywBdIjmsm3TkQ=;
 b=r7ytsEBlkT9Ia9HCoRjKBTcy/rF9YssNMnqZpjPOlGwUYhzObnu/XJfu55XB+j4OOC
 i1b/hrtmuCrVVptjuospcTOvWvvtGa7lF1GrGWwJNicmfOi6d46iDncKdXRsC0cIAYbh
 maRyIJ+SQB2hSv8fZJLvOBLIPIXn3NTKfxlPvgGKCoRJaZRkpCqxJfscYg1pzgxNrI+G
 d1MeiQEwXlB5y3CxPYEgwZLN0ewFiSZPCI9qDjkQ6+mHYFomhxAkCBkHJLh+jPLmyFfT
 0u5icOUoTBLVQ1JmX2AXyjtPn1jBGwcjP/M/82JNWdumPaZLLymuzzggnI3Auft9phmg
 5xEg==
X-Gm-Message-State: APjAAAXz6Lima2gkfzkErpItenm9dkgxYN6HudddqALyDKxO556CUZZ7
 YnL4zVeNSzBoU7NvDNEG/hM=
X-Google-Smtp-Source: APXvYqysCUbwOx9qXOsEE//pLYKy74wFZio7yCUd/QBiSlkg9sbe9gr83bCeqVNMGZQp5EpF6eSH0g==
X-Received: by 2002:a17:90a:f491:: with SMTP id
 bx17mr15796916pjb.118.1562192399043; 
 Wed, 03 Jul 2019 15:19:59 -0700 (PDT)
Received: from localhost (g223.61-115-60.ppp.wakwak.ne.jp. [61.115.60.223])
 by smtp.gmail.com with ESMTPSA id p2sm3689642pfb.118.2019.07.03.15.19.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 15:19:58 -0700 (PDT)
Date: Thu, 4 Jul 2019 07:19:56 +0900
From: Stafford Horne <shorne@gmail.com>
To: Richard Henderson <rth@twiddle.net>
Message-ID: <20190703221956.GE2601@lianli.shorne-pla.net>
References: <20190703033351.11924-1-shorne@gmail.com>
 <20190703033351.11924-5-shorne@gmail.com>
 <20190703154301.GY18316@gate.crashing.org>
 <64def15b-f701-4a5e-2724-6fb1e859be9a@twiddle.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <64def15b-f701-4a5e-2724-6fb1e859be9a@twiddle.net>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [OpenRISC] [PATCH v2 4/5] or1k: Initial support for FPU
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
Cc: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>,
 Openrisc <openrisc@lists.librecores.org>,
 GCC patches <gcc-patches@gcc.gnu.org>,
 Segher Boessenkool <segher@kernel.crashing.org>, Jeff Law <law@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDk6MDk6NTFQTSArMDIwMCwgUmljaGFyZCBIZW5kZXJz
b24gd3JvdGU6Cj4gT24gNy8zLzE5IDU6NDMgUE0sIFNlZ2hlciBCb2Vzc2Vua29vbCB3cm90ZToK
PiA+PiBAQCAtMjEyLDYgKzIxNCw3IEBAIGVudW0gcmVnX2NsYXNzCj4gPj4gICNkZWZpbmUgUkVH
X0NMQVNTX0NPTlRFTlRTICAgICAgXAo+ID4+ICB7IHsgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCB9
LAlcCj4gPj4gICAgeyBTSUJDQUxMX1JFR1NfTUFTSywgICAwIH0sCVwKPiA+PiArICB7IDB4N2Zm
ZmZlZmUsIDB4MDAwMDAwMDAgfSwJXAo+ID4gCj4gPiBBYm92ZSB5b3Ugc2FpZCByMCwgcjMwLCBy
MzEgYXJlIGV4Y2x1ZGVkLCBidXQgdGhpcyBpcyByMCwgcjgsIHIzMCwgb3IKPiA+IGluIEdDQyBy
ZWdpc3RlciBudW1iZXJzLCAwLCA4LCBhbmQgMzE/ICBZb3UgcHJvYmFibHkgc2hvdWxkIG1lbnRp
b24gcjgKPiA+IHNvbWV3aGVyZSAoaXQncyBiZWNhdXNlIGl0IGlzIHRoZSBsYXN0IGFyZywgdGhp
cyBhdm9pZCBwcm9ibGVtcywgSSBndWVzcz8pLAo+ID4gYW5kIHRoZSAzMC8zMSB0aGluZyBpcyBj
b25mdXNlZCBzb21lIHdheS4gIE1heWJlIGl0IGlzIGFsbCBqdXN0IHRoYXQgb25lCj4gPiBkb2N1
bWVudGF0aW9uIGxpbmUgOi0pCj4gCj4gLi4uIGFuZCBpZiByOCBpcyBleGNsdWRlZCBiZWNhdXNl
IG9mIGFyZ3VtZW50cywgSSBzdXNwZWN0IHRoYXQgdGhpcyBpcyB0aGUKPiB3cm9uZyBmaXgsIGFz
IHRoZXJlJ3Mgbm90aGluZyBpbmhlcmVudGx5IHdyb25nIHdpdGggcjc6cjggb3Igcjg6cjkgYXMg
YSBwYWlyLAo+IGF0IGxlYXN0IHRoYXQgSSBjYW4gc2VlLgo+IAo+IFBlcmhhcHMgZnVuY3Rpb25f
YXJnIGFuZC9vciBmdW5jdGlvbl9hcmdfYWR2YW5jZSBpcyB0aGUgcmlnaHQgcGxhY2UgZm9yIGEg
Zml4Pwo+IFRoZSBjYWxsaW5nIGNvbnZlbnRpb24gc2F5cyB0aGF0IDY0LWJpdCBhcmd1bWVudHMg
YXJlIG5vdCBzcGxpdCBhY3Jvc3MKPiByZWdpc3RlcnMrc3RhY2ssIHNvIHlvdSBhbHJlYWR5IHNo
b3VsZG4ndCBoYXZlIHNlZW4gKHI4LCBbc3ArMF0pIGFzIGEgcGFpci4KCkkgd2lsbCBkb3VibGUg
Y2hlY2ssIHRoZSBtYXNrIG1heSBiZSB3cm9uZy4gIEl0IHNob3VsZCBub3QgbWF0dGVyIGFib3V0
IHRoZQpmdW5jdGlvbiBhcmdzLgoKSSBkaWRuJ3Qgc2VlIGFueSBpc3N1ZSB0aGF0IGNhdXNlZCBt
ZSB0byBhZGQgcjguICBTbyBJIG1heSBoYXZlIGp1c3QgbWFza2VkIHRodwpyb25nIGJpdCB0aGlu
a2luZyBpdCdzIHIzMS4gIElzIHRoZXJlIHNvbWV0aGluZyB3b3JuZyB3aXRoIHdoYXQgSSBkaWQ/
CgpUaGUgbWFzayBpcyAweDdmZmZmZWZlLCBhbmQgbmFtZXMgc2hvdWxkIGNvcnJlc2JvbmQgdG8g
dGhpcyBuYW1lIGxpc3Q/CgojZGVmaW5lIFJFR0lTVEVSX05BTUVTIHsKICAicjAiLCAgICJyMSIs
ICAgInIyIiwgICAicjMiLCAgICJyNCIsICAgInI1IiwgICAicjYiLCAgICJyNyIsICAjIDdlLCBl
eGNsIHIwCiAgInI4IiwgICAicjkiLCAgICJyMTAiLCAgInIxMSIsICAicjEyIiwgICJyMTMiLCAg
InIxNCIsICAicjE1IiwgIyBmZiwgZXhjbCBub25lCiAgInIxNyIsICAicjE5IiwgICJyMjEiLCAg
InIyMyIsICAicjI1IiwgICJyMjciLCAgInIyOSIsICAicjMxIiwgIyBmZSwgZXhjbCByMzEKICAi
cjE2IiwgICJyMTgiLCAgInIyMCIsICAicjIyIiwgICJyMjQiLCAgInIyNiIsICAicjI4IiwgICJy
MzAiLCAjIGZlLCBleGNsIHIzMAogICI/YXAiLCAgIj9mcCIsICAiP3NyX2YiIH0KCkRvIEkgaGF2
ZSBpdCBiYWNrd2FyZHM/ICBXaXRoIGFuIGVuZGlhbiBpc3N1ZT8KCi1TdGFmZm9yZApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5n
IGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNv
cmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
