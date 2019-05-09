Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D01B219360
	for <lists+openrisc@lfdr.de>; Thu,  9 May 2019 22:29:41 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 804A128465;
	Thu,  9 May 2019 22:29:41 +0200 (CEST)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by mail.librecores.org (Postfix) with ESMTPS id 2AE1225B28
 for <openrisc@lists.librecores.org>; Thu,  9 May 2019 22:29:40 +0200 (CEST)
Received: by mail-pf1-f194.google.com with SMTP id z26so1902997pfg.6
 for <openrisc@lists.librecores.org>; Thu, 09 May 2019 13:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=l4O8yGfx0iVmNfl52kEOEmR7aAeQhe9rkOdXj37REss=;
 b=pGbY3QLzi/sy/IrtjDMz+c+i/d7Kh8tSxO4PS1O3VM95vP0MiSBNJBCurif4WgHrvH
 sZAw4g/0quPsReqGFflV7ym/8qltQ/DAXLSSVY2etlO/jtiO6RaaheYzclHfFB+2fOmE
 lNKAkMt2JyHVm3HYKASWbNOz8uC0PXNTOZqNykPWHynD/vTK5cA254J50Yz+8urp8hrI
 UCxVAPmhbl4X2eu0xTKlGEvfzShu7ssxm+92NTtxnrslCUHrNcA7w270+DWAejp87MJw
 6UyeG0Dl/boAe18Rr9cnY4aU1xjBuB/R2ytX2zsVTrrc6B76JCHB18uzVee0BhdiLIzN
 yT/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=l4O8yGfx0iVmNfl52kEOEmR7aAeQhe9rkOdXj37REss=;
 b=lPPXvQaM2YdCTkUgngs1xffw/nqZGK9AksmoXL75NWjLR335JIaU+Pj5G+9UzahyKI
 UwCphw6AlU8hVmxuN8gtvMYgqr5s2QEEuph54ToGy1OIIWoPgWofB/i2saR7uyxQUZe2
 29FY7X+EvdLhydZwgvj1YfKhTEyYukqz+3RZHCGL9YaCTzxoRIootIXlfiwV9AmqfBlf
 9ie+ZVne78ZTc9003kPiUcu6Jheg4+y63+Wlm2qnQgYLQaTrso4AuE8k39k4I56OXU1x
 sk8tEvRLospePqWJRJomxECFYxJT0vw8OQMTOD2GekkUjZaVguVrRVEtyZ21Woaax7U/
 ge8A==
X-Gm-Message-State: APjAAAXf3vW2/b+VOQA2qJxleuH6+yJFNyqebr1wAI80qY7qsqZZmlR7
 oc9wnXwoEK13Si2E4ZsJRE0=
X-Google-Smtp-Source: APXvYqyzvz0O0qvag4SbjbhEDeOHuIZQQtY71oqxg5o9BiEHoaYEQeGHkbTPQZxcc/4pVPh6BQknRg==
X-Received: by 2002:a63:8242:: with SMTP id w63mr8332864pgd.169.1557433777924; 
 Thu, 09 May 2019 13:29:37 -0700 (PDT)
Received: from localhost (g30.211-19-85.ppp.wakwak.ne.jp. [211.19.85.30])
 by smtp.gmail.com with ESMTPSA id j22sm4045036pfn.129.2019.05.09.13.29.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 09 May 2019 13:29:36 -0700 (PDT)
Date: Fri, 10 May 2019 05:29:34 +0900
From: Stafford Horne <shorne@gmail.com>
To: BAndViG <bandvig@mail.ru>
Message-ID: <20190509202934.GF11006@lianli.shorne-pla.net>
References: <CAAfxs77GkWenpN0s1pM_YeVgNZabBx55fCqLfxoMffTSa-E=cw@mail.gmail.com>
 <afc760d8-0e01-6470-c8d2-6ddc366f3d10@twiddle.net>
 <20190412214843.GB32284@lianli.shorne-pla.net>
 <05413d8c-395c-de51-95f6-cdaa85c834dd@twiddle.net>
 <20190413084708.GC32284@lianli.shorne-pla.net>
 <3D70BAC7A5B64C0E977D84EC118F146E@BAndViG>
 <20190425211702.GG32284@lianli.shorne-pla.net>
 <e441bb74-5cea-6002-c33e-4822f082265b@twiddle.net>
 <20190507211254.GD11006@lianli.shorne-pla.net>
 <6CFC558D2E0643BAA8C0CFCB1AEE95BB@BAndViG>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6CFC558D2E0643BAA8C0CFCB1AEE95BB@BAndViG>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBNYXkgMDgsIDIwMTkgYXQgMDk6MDU6NThQTSArMDMwMCwgQkFuZFZpRyB3cm90ZToK
PiA+IEZyb206IFN0YWZmb3JkIEhvcm5lCj4gPiBTZW50OiBXZWRuZXNkYXksIE1heSAwOCwgMjAx
OSAxMjoxMiBBTQo+ID4gVG86IFJpY2hhcmQgSGVuZGVyc29uCj4gPiBDYzogQkFuZFZpRyA7IE9w
ZW5yaXNjCj4gPiBTdWJqZWN0OiBSZTogW09wZW5SSVNDXSBPcGVuUklTQyAxLjMgc3BlYwo+IAo+
ID4gT24gVHVlLCBNYXkgMDcsIDIwMTkgYXQgMDg6Mjg6NDVBTSAtMDcwMCwgUmljaGFyZCBIZW5k
ZXJzb24gd3JvdGU6Cj4gPiA+IE9uIDQvMjUvMTkgMjoxNyBQTSwgU3RhZmZvcmQgSG9ybmUgd3Jv
dGU6Cj4gPiA+ID4gVGhpcyBpcyBpbXBsZW1lbnRlZCBpbiBiaW51dGlscyBub3cuIFNlZSBteSBw
YXRjaGVzIGhlcmU6Cj4gPiA+ID4KPiA+ID4gPiAgIC0gaHR0cHM6Ly9naXRodWIuY29tL3N0ZmZy
ZGhybi9iaW51dGlscy1nZGIvY29tbWl0cy9vcmZweDY0YTMyLTMKPiA+ID4gPgo+ID4gPiA+IEkg
aGF2ZSBub3Qgc3F1YXNoZWQgdGhlIGNvbW1pdHMgYmVjYXVzZSBpdCBtYWtlcyBpdCBhIGJpdCBl
YXNpZXIgZm9yCj4gPiA+ID4gcmV2aWV3aW5nCj4gPiA+ID4gd2hhdCBJIGRpZCB0byBnZXQgdGhl
c2UgZmxhZ3Mgd29ya2luZy4KPiA+ID4KPiA+ID4gSSd2ZSBpbXBsZW1lbnRlZCB0aGlzIGZvciBx
ZW11LAo+ID4gPgo+ID4gPiAgIGh0dHBzOi8vZ2l0aHViLmNvbS9ydGg3NjgwL3FlbXUvY29tbWl0
cy90Z3Qtb3Ixawo+ID4gPgo+ID4gPiBhbHRob3VnaCB1bnRlc3RlZCBzbyBmYXIuICBJIG5lZWQg
dG8gcmVnZW5lcmF0ZSBteQo+ID4gPiBjcm9zcy10ZXN0aW5nIGVudmlyb25tZW50IGZvciBvcjFr
Li4uCj4gCj4gPiBUaGlzIGxvb2tzIGdvb2QsIEkgbGlrZSBob3cgeW91IGRvIChyRDEgKyByRDFP
ZmZzZXQgKyAxKSBpbnN0ZWFkIG9mIHdoYXQKPiA+IEkgd2FzCj4gPiBkb2luZyAockQxICsgKHJE
MU9mZnNldCA/IDIgOiAxICkpLiAgSSB3aWxsIGZpeCBteSBtYXRjaGVzIHRvIHVzZSB5b3VyCj4g
PiBtZXRob2QuCj4gCj4gQWgsIEkgaW1wbGVtZW50ZWQgc2ltaWxhciBhcHByb2FjaCBpbiBNQVJP
Q0NISU5PIGluZGVwZW5kZW50bHkgOiksIHNlZQo+IGxhdGVzdCBjb21taXQgdG8gZnBfdW5vcmRl
cmVkX2NtcCBicmFuY2g6Cj4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5yaXNjL29yMWtfbWFyb2Nj
aGluby9jb21taXQvMzEzYjI1Njg3NWM4YjYxOWY1YjE2ZGI0N2Q5MTVlNWRmYWVkZmZmNwoKTmlj
ZS4KCj4gPiBBbHNvLCBqdXN0IGEgcmVtaW5kZXIsIHRoZSBsYXRlc3QgcGF0Y2hlcyBmb3IgR0ND
IEZQVSBzdXBwb3J0IGFyZSB1cCBoZXJlLiAgSQo+ID4gaGF2ZSByZWJhc2VkIHRvIHRoZSA5LjEu
MCByZWxlYXNlLiAgQWxzbywgYWRkZWQgYSBuZXcgUkVHIENMQVNTIGZvciBSRUcKPiA+IFBBSVJT
IHRvCj4gPiBmaXggYW4gaXNzdWUgZm9yIHdoZW4gKHJEMSArIHJEMU9mZnNldCArIDEpIG92ZXJm
bG93cy4KPiAKPiA+ICAgaHR0cHM6Ly9naXRodWIuY29tL3N0ZmZyZGhybi9nY2MvY29tbWl0cy9v
cjFrLWZwdS0yCj4gCj4gQnR3LCBlYXJsaWVyIHlvdSB3cm90ZSAiLi4uIG9uIG9uZSBlbmQgNjQt
Yml0IG9wZW5yaXNjIGRvZXNuJ3QgbG9va3MgdG8gZXZlbgo+IGJlIGNvbWluZyAuLi4iLiBBY3R1
YWxseSBJIHRoaW5rIGl0IHdvdWxkbid0IGJlIGEgdmVyeSBkaWZmaWN1bHQgZm9yIG1lIHRvCj4g
Y3JlYXRlIDY0LWJpdCBPcGVSSVNDIGJ5IHNvbWUgcmUtZmFjdG9yaW5nIG9mIE1BUk9DQ0hJTk8n
cyBtb2R1bGVzLiBBdCB0aGUKPiBzYW1lIHRpbWUgaXMgYW55Ym9keSBpbnRlcmVzdGVkIGluIGl0
Pwo+IAo+IEFkZGl0aW9uYWxseSwgaXMgYW55Ym9keSBpbnRlcmVzdGVkIGluIGxpdHRsZSBlbmRp
YW4gc3VwcG9ydD8gSSd2ZSBiZWVuCj4gdGhpbmtpbmcgdG8gaW1wbGVtZW50IGl0IGFzIGEgcGFy
YW1ldGVyLCBsaWtlIE9QVElPTl9FTkRJQU4gPQo+ICJCSUciLyJMSVRUTEUiLiBXaXRoIHRoZSBh
cHByb2FjaCBTUltMRUVdOgo+ICAtIHNob3VsZCBiZSBzZXQgYXQgY29tcGlsZSB0aW1lIGluIGFj
Y29yZGluZyB3aXRoIE9QVElPTl9FTkRJQU4gdmFsdWUKPiAgLSBjb3VsZG4ndCBiZSBjaGFuZ2Vk
IGJ5IHdyaXRpbmcgaW50byBTUgoKSSB0aGluayBpdHMgcG9zc2libGUsIGl0IHJlcXVpcmVzIHdv
cmsgdG8gYmUgZG9uZSBvbiBiaW51dGlscywgc2ltdWxhdG9ycyBhbmQKZ2NjLiAgVGhlcmUgaGFz
IGJlZW4gYSBzdGFydCB0byB0aGlzIHdvcmsgYmVmb3JlIGJ1dCBJIGRpZG4ndCBjb250aW51ZSBh
cyBwZXIKc2ltcGxpY2l0eS4KCkJUVywKCkkgaGF2ZSBmaW5pc2hlZCB0aGUgZmlyc3QgdmVyc2lv
biBvZiBpbXBsZW1lbnRpbmcgdW5vcmRlcmVkIGNvbXBhcmlzb25zIGluCmJpbnV0aWxzLiAgUGxl
YXNlIGhhdmUgYSBsb29rIGhlcmU6CgogIGh0dHBzOi8vZ2l0aHViLmNvbS9zdGZmcmRocm4vYmlu
dXRpbHMtZ2RiL2NvbW1pdHMvb3JmcHg2NGEzMi0zYQoKLVN0YWZmb3JkCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApP
cGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3Jn
L2xpc3RpbmZvL29wZW5yaXNjCg==
