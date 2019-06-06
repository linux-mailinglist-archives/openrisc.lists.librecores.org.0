Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 0609738055
	for <lists+openrisc@lfdr.de>; Fri,  7 Jun 2019 00:11:37 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B719E2020B;
	Fri,  7 Jun 2019 00:11:36 +0200 (CEST)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mail.librecores.org (Postfix) with ESMTPS id 4FE0420123
 for <openrisc@lists.librecores.org>; Fri,  7 Jun 2019 00:11:35 +0200 (CEST)
Received: by mail-pl1-f171.google.com with SMTP id go2so1455753plb.9
 for <openrisc@lists.librecores.org>; Thu, 06 Jun 2019 15:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=EQg4lf+0ecXbVtAOwncRtKAHyPyb1UtrdoHaGkgze/8=;
 b=tPNMT7ZpOxdZp8h3Q/2SIgvLw2RF3Y2j1ipI5MJ7VuJv44hfS5DMabpAJlPgrLpf+V
 V1HWlQXGfBs+M4HSAYTNYQRnbb836Bb9rWX0D+4/iBXN+9cdtt9cYKEVRosWiUDGRiKe
 Sz3SW0dOdBf3Pbps0xdBTEAPgFackn0imaujxfAs97bfoLDCQywdjUybcb6H28IRBDGn
 jrEYbZauwooAPTrIUe0CndcaDHjJMftcunGJ24HfNHF1znlzLgh4Il0h5kC0/DC8Nom9
 /u+2Z+s1W+BpSkWHGymi+zffg4jBbtJ1Fd9JiH65rQQD1Z5MPgI5L2DwIw3KOmRiXOQT
 zTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EQg4lf+0ecXbVtAOwncRtKAHyPyb1UtrdoHaGkgze/8=;
 b=QySay3UQXP4ytUB9freayXv8D5qacOK/lrYbp+GtY4QMXP07cxuaL/rwhCPpUM3hHi
 r676DSzIdYj6b/2zVdSBudZfxLEApJLvHCo3EMbyD27ntbufZT5BXOnajD+Ni4hH7Z14
 o8mZHVocmk5PCCLWto5iHwiQnBiyHg1MJE+ETAXgVbPG8qX+tsS6SWR7nuXx4olO7JNq
 fAT1sP507YtTXWxNE9t5YAKviJiRqc02opDhlJx6roscqMfoTj8hOXfz2RfLcIfvdf+r
 2n6YFuKr3upAUH3LnpLoRjwLPywVTiSP9eM9Bk04+pUfrIMzj6jP+KpShp/Z/esXcn42
 bsiw==
X-Gm-Message-State: APjAAAVwxaqTkMCNTpgzpyMuy3Cz5TwP12LSH0nrS4ysPm4+XHD5rYDS
 no7cUeXe/cNC703G9tH46WU=
X-Google-Smtp-Source: APXvYqxOMByDfZT/t2DkCS+FC5dby+LgDTX6UnvlnGkZtpyThqOafYFX3Klr0osZD3bNNTv3ZZDrBw==
X-Received: by 2002:a17:902:a81:: with SMTP id
 1mr51983832plp.287.1559859093629; 
 Thu, 06 Jun 2019 15:11:33 -0700 (PDT)
Received: from localhost (g30.211-19-85.ppp.wakwak.ne.jp. [211.19.85.30])
 by smtp.gmail.com with ESMTPSA id u123sm143021pfu.67.2019.06.06.15.11.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 15:11:32 -0700 (PDT)
Date: Fri, 7 Jun 2019 07:11:30 +0900
From: Stafford Horne <shorne@gmail.com>
To: BAndViG <bandvig@mail.ru>
Message-ID: <20190606221130.GF3379@lianli.shorne-pla.net>
References: <20190413084708.GC32284@lianli.shorne-pla.net>
 <3D70BAC7A5B64C0E977D84EC118F146E@BAndViG>
 <20190425211702.GG32284@lianli.shorne-pla.net>
 <e441bb74-5cea-6002-c33e-4822f082265b@twiddle.net>
 <20190507211254.GD11006@lianli.shorne-pla.net>
 <6CFC558D2E0643BAA8C0CFCB1AEE95BB@BAndViG>
 <3ce42625-83fe-4ee2-b48f-23e6362ee616@twiddle.net>
 <AED0C7019AE04A2F87CD0E432FA20A70@BAndViG>
 <20190511100433.GA20465@lianli.shorne-pla.net>
 <A49361B4A05048AD995FF588CC923E61@BAndViG>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <A49361B4A05048AD995FF588CC923E61@BAndViG>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [OpenRISC] OpenRISC 1.3 spec
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
Cc: Openrisc <openrisc@lists.librecores.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU3VuLCBNYXkgMTIsIDIwMTkgYXQgMTA6NTg6NTNQTSArMDMwMCwgQkFuZFZpRyB3cm90ZToK
Pj5Gcm9tOiBTdGFmZm9yZCBIb3JuZQo+PlNlbnQ6IFNhdHVyZGF5LCBNYXkgMTEsIDIwMTkgMTow
NCBQTQo+Cj4+PiBPbiBGcmksIE1heSAxMCwgMjAxOSBhdCAxMDo1NjowNUFNICswMzAwLCBCQW5k
VmlHIHdyb3RlOgo+Pj4gSSd2ZSBiZWVuIHRoaW5raW5nIGFib3V0IGEgdmFyaWFudHMgZm9yIFIw
IHdyaXRlIHByb3RlY3Rpb24uIFIwIGNvdWxkIGJlCj4+PiB6ZXJvIGluaXRpYWxpemVkIGF0IGNw
dV9yc3QgYnkgZGVkaWNhdGVkIGNpcmN1aXRzLiBBbmQgYGludmFsaWQgPiAKPj5pbnN0cnVjdGlv
bmAKPj4+IGV4Y2VwdGlvbiBzaG91bGQgYmUgcmFpc2VkIGlmIGFuIGluc3RydWN0aW9uIHRyaWVz
IHRvIHdyaXRlIHRvIFIwLiBBdCB0aGUKPj4+IHNhbWUgdGltZSBzdWNoIGJlaGF2aW9yIGlzIGlu
Y29tcGF0aWJsZSB3aXRoIGN1cnJlbnQgcnVuLXRpbWUgPiAKPj5pbml0aWFsaXphdGlvbgo+Pj4g
c2VxdWVuY2VzIGltcGxlbWVudGVkIGluIE9SMUsgdG9vbCBjaGFpbnMuIFRoZSBjaXJjbGUgaXMg
Y2xvc2VkLgo+Cj4+V2Ugc3RpbGwgaGF2ZSB0aGUgb3B0aW9uIHRvIGRyb3AgdGhlIHZhbGlkYXRp
b24uICBKdXN0IGFzIHdlIGRvbid0IGhhdmUKPj52YWxpZGF0aW9uIGZvciB3cml0aW5nIHRvIHIw
LCBJIHRoaW5rIGl0cyBmaW5lIHRvIHNheSByMzEncyBwYWlyIHJlZ2lzdGVyIGlzCj4+dW5kZWZp
bmVkIGFuZCBzaG91bGQgYmUgYXZvaWRlZC4gKGkuZS4gb24gc29tZSBtYWNoaW5lcyBpdCBtaWdo
dCBnbyBpbnRvIHRoZQo+PnNoYWRvdyByZWcgc3BhY2UpCj4KPk9uIHRoZSBvbmUgaGFuZCBJJ20g
YSBraW5kIG9mIHBlcmZlY3Rpb25pc3QgYW5kIHdvdWxkIHByZWZlciB0byAKPmltcGxlbWVudCBz
dWNoIHByb3RlY3Rpb25zLiBPbiB0aGUgb3RoZXIgaGFuZCB0aGV5IGNvc3Qgbm90aWNlYWJsZSAK
PnNwYWNlIGFuZCB0aW1pbmcuIE5vdCB0cml2aWFsIGNob2ljZSBmb3IgbWUgOikuCj4KPj5PbiB0
aGUgb3RoZXIgaGFuZCwgSSBoYXZlIGZpbmlzaGVkIHRoZSBHQ0MgdXBkYXRlcyBmb3IgdW5vcmRl
cmVkIGNvbXBhcmlzb25zLgo+PllvdSBjYW4gc2VlIHRoZSBwYXRjaCBoZXJlLCBJIGJ1aWx0IG5l
d2xpYiB3aXRoIHRoaXMgZW5hYmxlZCBhbmQgd2FzIGFibGUgdG8KPj5zaGFrZSBvdXQgYSBmZXcg
YnVncy4gIEl0IHNlZW1zIHRvIHdvcms6Cj4KPj4gIC0gaHR0cHM6Ly9naXRodWIuY29tL3N0ZmZy
ZGhybi9nY2MvY29tbWl0cy9vcjFrLWZwdS0yCj4KPj5UaGUgbmV3IGdjYyBhcmd1bWVudCBpczoK
Pgo+PiAgLW11bm9yZGVyZWQtZmxvYXQKPgo+SSd2ZSBidWlsZCB0d28gdmFyaWFudHMgb2YgR0ND
OS9OZXdMSUIgdG9vbCBjaGFpbnMuIE9uZSBoYXMgZ290IAo+Ii1taGFyZC1mbG9hdCAtbXVub3Jk
ZXJlZC1mbG9hdCIgb3B0aW9ucyByYWlzZWQgYnkgZGVmYXVsdC4gQW5kIAo+YW5vdGhlciBvbmUg
aGFzIGdvdCAiLW1oYXJkLWZsb2F0IC1tZG91YmxlLWZsb2F0IC1tdW5vcmRlcmVkLWZsb2F0IiAK
PmRlZmF1bHQgb3B0aW9ucy4gRmlyc3QgdmFyaWFudCB3YXMgdXNlZCB0byBidWlsZCBzaW5nbGUg
cHJlY2lzaW9uIAo+V2hldHN0b25lIGZvciBtb3Ixa3grRlBVMzIgYW5kIHNlY29uZCB0byBidWls
ZCBzaW5nbGUgYW5kIGRvdWJsZSAKPnByZWNpc2lvbiBXaGV0c3RvbmUgZm9yIE1BUk9DQ0hJTk8u
IEFsbCB2YXJpYW50cyB3b3JrLgo+V2UgY291bGQgbWVyZ2UgZnBfdW5vcmRlcmVkX2NtcCBicmFu
Y2hlcyBpbnRvIG1hc3Rlci4gT3Igc2hvdWxkIHdlIAo+cG9zdHBvbmUgdGhlIG1lcmdlIHRpbGwg
eW91ciBiaW51dGlscy9nY2MgcGF0Y2hlcyBiZWluZyB1cHN0cmVhbWVkPwo+Cj5XQlIKPkFuZHJl
eQoKCkhlbGxvIFJpY2hhcmQsIEFuZHJleSwgT3BlblJJU0NlcnMsCgpUaGlzIGlzIHRoZSBmaW5h
bCByZXZpZXcgZm9yIHNwZWMgdmVyc2lvbiAxLjMuICBUaGUgcGRmIGlzIGhlcmU6CgogLSBodHRw
czovL2dpdGh1Yi5jb20vb3BlbnJpc2MvZG9jL3Jhdy9tYXN0ZXIvb3BlbnJpc2MtYXJjaC0xLjMt
cmV2MS5wZGYKClRvIHNlZSBhIGhpc3Rvcnkgb2YgdGhlIGNoYW5nZXMgc28gZmFyIGNoZWNrIG91
dCB0aGVzZSBwdWxsIHJlcXVlc3RzOgoKIC0gaHR0cHM6Ly9naXRodWIuY29tL29wZW5yaXNjL2Rv
Yy9wdWxsLzIgLSBTcGVjIFVwZGF0ZXMgZnJvbSBTdGFmZm9yZAogLSBodHRwczovL2dpdGh1Yi5j
b20vb3BlbnJpc2MvZG9jL3B1bGwvMyAtIFNQZWMgVXBkYXRlcyBmcm9tIEFuZHJleQoKVGhlc2Ug
UFJzIGFyZSBhbGwgbWVyZ2VkIGFuZCB0aGUgbGFzdCB0aGluZyB3ZSBoYXZlIGlzIHRvIG1lcmdl
IHRoZSB3ZWJzaXRlIGFuZApuZXdzIHVwZGF0ZXMgdG8gbWFrZSBpdCBvZmZpY2lhbDoKCiAtIGh0
dHBzOi8vZ2l0aHViLmNvbS9vcGVucmlzYy9vcGVucmlzYy5naXRodWIuaW8vcHVsbC8xMwoKSSds
bCBsZXQgaXQgc2l0IGZvciBhIGJpdCB0byBzZWUgaWYgd2UgY2FuIGNvbGxlY3QgYW55IGNvbW1l
bnRzIG9yIGZlZWRiYWNrIG9uCnRoZSBmaW5hbCBkb2N1bWVudC4gIFNvIHBsZWFzZSBzcGVhayB1
cC4KCkJ1dCBhbnl3YXksIGlmIHRoZXJlIGFyZSBhbnkgaXNzdWVzIGFmdGVyIHRoZSBmYWN0IHdl
IGNhbiBhbHdheXMgY3JlYXRlIGEKcmV2aXNpb24gMi4KCi1TdGFmZm9yZApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QK
T3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9y
Zy9saXN0aW5mby9vcGVucmlzYwo=
