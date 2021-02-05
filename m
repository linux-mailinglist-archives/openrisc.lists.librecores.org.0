Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 6383831157E
	for <lists+openrisc@lfdr.de>; Fri,  5 Feb 2021 23:36:58 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 00F9F205A7;
	Fri,  5 Feb 2021 23:36:57 +0100 (CET)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mail.librecores.org (Postfix) with ESMTPS id B2290205A7
 for <openrisc@lists.librecores.org>; Fri,  5 Feb 2021 23:36:55 +0100 (CET)
Received: by mail-pj1-f43.google.com with SMTP id l18so4626059pji.3
 for <openrisc@lists.librecores.org>; Fri, 05 Feb 2021 14:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=c5JPFuMfSk0p/DYjLQXzqCeRqsMAJt+xoGt9eJd6O9o=;
 b=XNrkFV7hR1zDtMPWmy2ge+vMrcaUXRlcxRTLhZ+fys99T+CZGC+DgKB0xexkUCzy2t
 xAOdxCeZSn4vXFXOL7565btR9oh2H2cqwHwnpLBFY3MWO6BvsyEbLjEqObljb/mgERFJ
 H1PZxtHyZTlhfXiVz4LTVlwVco8BPprGjX6I5zbnPR77qBNANVC/nEGT9osvqHK8OvDU
 wdCsuEwk+V24NJjtdG8ZlB8Ttwxi9duZ8d909YPZVr+LdLWH2Jj6K6NAv0j1vxu1A4Zr
 placymNWQHAf9RG/N/iQ2L2IhRxifCZa7DNbl5mYIIN78Z9BXTQRVolJc/TO2HxIjcaG
 JBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=c5JPFuMfSk0p/DYjLQXzqCeRqsMAJt+xoGt9eJd6O9o=;
 b=WEg+bvnX597KgprqJWVpCCQXpoNvdAcwu6jZBtzBttlhFClP21hlham9cL5aipOluV
 J0lAJJlK6rY69PYOpLTokFuHYGPUw2skOz1VdcpfQhAxze1+pFwBZN4PMnXwe6KhBBNa
 MmzGU9VDtCc7AYthM0Yx6gQ6IBOAZiui0LoJNwZ4Y051BQF4K8twkzo7//Z/0DxfN925
 kqgA0QUoM88Hms0ibVwd8JMnEMFxPeG2aidmi48nrIPgPomr3Q+iKgCpSTAZOts4DWSj
 C8xJcj7ImnJoKU7whAGfL6tzemlgnF1gHv1rRae9mmwEZWvKSAFDoEgAYV354BU+fivx
 U32A==
X-Gm-Message-State: AOAM532lX4L9KVyTfPqU59tGKw+mT+mIxqjMkQL767rrFQ0QOr94ih57
 XGnHYPZiL5DC1vsxAtpSuI0=
X-Google-Smtp-Source: ABdhPJwVh8zI4/mrx1vTSrH8IilN4/EyID+ieED1x4L3e0nnrZnXiFEQFMMmrsliviQhv9qInJbJNA==
X-Received: by 2002:a17:90b:33ca:: with SMTP id
 lk10mr6084442pjb.186.1612564613947; 
 Fri, 05 Feb 2021 14:36:53 -0800 (PST)
Received: from localhost (g186.222-224-165.ppp.wakwak.ne.jp. [222.224.165.186])
 by smtp.gmail.com with ESMTPSA id 6sm10429671pfz.34.2021.02.05.14.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 14:36:53 -0800 (PST)
Date: Sat, 6 Feb 2021 07:36:51 +0900
From: Stafford Horne <shorne@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <20210205223651.GL2002709@lianli.shorne-pla.net>
References: <0b26eda7-229d-3dc9-f2ae-19b9212fb0ea@rwth-aachen.de>
 <20210129221643.GZ2002709@lianli.shorne-pla.net>
 <2a018afc-d797-3a91-ffab-e55ae3b0a795@rwth-aachen.de>
 <20210130230310.GC2002709@lianli.shorne-pla.net>
 <d9f4aafc-4d65-38b0-dde0-5e155836aee1@rwth-aachen.de>
 <20210131212752.GG2002709@lianli.shorne-pla.net>
 <6dbc27f8-5261-59c5-acba-70f6c6a74ba1@rwth-aachen.de>
 <20210205144317.GK2002709@lianli.shorne-pla.net>
 <CAMuHMdXzr4c4=Cg1_Lmw41cmxmMrG4P=dV0yVjuXvuR5pqyh0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdXzr4c4=Cg1_Lmw41cmxmMrG4P=dV0yVjuXvuR5pqyh0Q@mail.gmail.com>
Subject: Re: [OpenRISC] [PATCH v2] openrisc: use device tree to determine
 present cpus
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Openrisc <openrisc@lists.librecores.org>,
 Jan Henrik Weinstock <jan.weinstock@rwth-aachen.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gRnJpLCBGZWIgMDUsIDIwMjEgYXQgMDU6MDc6NTFQTSArMDEwMCwgR2VlcnQgVXl0dGVyaG9l
dmVuIHdyb3RlOgo+IEhpIFN0YWZmb3JkLAo+IAo+IE9uIEZyaSwgRmViIDUsIDIwMjEgYXQgMzo0
MyBQTSBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiBPbiBNb24s
IEZlYiAwMSwgMjAyMSBhdCAxMjo0OTozMVBNICswMTAwLCBKYW4gSGVucmlrIFdlaW5zdG9jayB3
cm90ZToKPiA+ID4gVXNlIHRoZSBkZXZpY2UgdHJlZSB0byBkZXRlcm1pbmUgdGhlIHByZXNlbnQg
Y3B1cyBpbnN0ZWFkIG9mIGFzc3VtaW5nIGFsbAo+ID4gPiBDT05GSUdfTlJDUFVTIGFyZSBhY3R1
YWxseSBwcmVzZW50IGluIHRoZSBzeXN0ZW0uCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEph
biBIZW5yaWsgV2VpbnN0b2NrIDxqYW4ud2VpbnN0b2NrQHJ3dGgtYWFjaGVuLmRlPgo+ID4KPiA+
IEhpIEphbiwKPiA+Cj4gPiBJIGNhbm5vdCBhcHBseSB0aGlzIHBhdGNoLCBpdCBzZWVtcyB5b3Ug
c29tZWhvdyBzZW50IGl0IHNpZ25lZCBhcyBhIG11bHRpcGFydAo+ID4gbWVzc2FnZSB2aWEgVGh1
bmRlcmJpcmQuCj4gPgo+ID4gVGhpcyBjYXVzZXMgZXJyb3JzIHdoZW4gdHJ5aW5nIHRvIGFwcGx5
LCBldmVuIGFmdGVyIEkgdHJpZWQgdG8gbWFudWFsbHkgZml4IHRoZQo+ID4gcGF0Y2ggbWFpbDoK
PiA+Cj4gPiAgICAgQXBwbHlpbmc6IG9wZW5yaXNjOiB1c2UgZGV2aWNlIHRyZWUgdG8gZGV0ZXJt
aW5lIHByZXNlbnQgY3B1cwo+ID4gICAgIGVycm9yOiBzaGExIGluZm9ybWF0aW9uIGlzIGxhY2tp
bmcgb3IgdXNlbGVzcyAoYXJjaC9vcGVucmlzYy9rZXJuZWwvc21wLmMpLgo+ID4gICAgIGVycm9y
OiBjb3VsZCBub3QgYnVpbGQgZmFrZSBhbmNlc3Rvcgo+ID4gICAgIFBhdGNoIGZhaWxlZCBhdCAw
MDAxIG9wZW5yaXNjOiB1c2UgZGV2aWNlIHRyZWUgdG8gZGV0ZXJtaW5lIHByZXNlbnQgY3B1cwo+
ID4KPiA+IENhbiB5b3Ugc2VuZCB0aGlzIHVzaW5nICdnaXQgc2VuZC1lbWFpbD8nCj4gPgo+ID4g
SWYgbm90IEkgY2FuIGdldCBpdCBhcHBsaWVkIHdpdGggc29tZSB3b3JrLCBvdGhlcndpc2UgeW91
IGNhbiBwb2ludCBtZSB0byBhIGdpdAo+ID4gcmVwbyB3aGljaCBJIGNhbiBwdWxsIGl0IGZyb20u
Cj4gCj4gImI0IGFtIDZkYmMyN2Y4LTUyNjEtNTljNS1hY2JhLTcwZjZjNmE3NGJhMUByd3RoLWFh
Y2hlbi5kZSIgd29ya3MKPiBmaW5lIGZvciBtZS4KPiAKPiBnaXQ6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL3V0aWxzL2I0L2I0LmdpdAoKRGlkIGl0IHdvcms/ICBGb3IgbWUgSSBnb3QsIGJhc2Ug
bm90IGZvdW5kLgoKICAgIExvb2tpbmcgdXAKICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3Iv
NmRiYzI3ZjgtNTI2MS01OWM1LWFjYmEtNzBmNmM2YTc0YmExJTQwcnd0aC1hYWNoZW4uZGUKICAg
IEdyYWJiaW5nIHRocmVhZCBmcm9tIGxvcmUua2VybmVsLm9yZy9sa21sCiAgICBBbmFseXppbmcg
OSBtZXNzYWdlcyBpbiB0aGUgdGhyZWFkCiAgICBXaWxsIHVzZSB0aGUgbGF0ZXN0IHJldmlzaW9u
OiB2MgogICAgWW91IGNhbiBwaWNrIG90aGVyIHJldmlzaW9ucyB1c2luZyB0aGUgLXZOIGZsYWcK
ICAgIC0tLQogICAgV3JpdGluZwogICAgLi92Ml8yMDIxMDIwMV9qYW5fd2VpbnN0b2NrX29wZW5y
aXNjX3VzZV9kZXZpY2VfdHJlZV90b19kZXRlcm1pbmVfcHJlc2VudF9jcHVzLm1ieAogICAgICBb
UEFUQ0ggdjJdIG9wZW5yaXNjOiB1c2UgZGV2aWNlIHRyZWUgdG8gZGV0ZXJtaW5lIHByZXNlbnQg
Y3B1cwogICAgLS0tCiAgICBUb3RhbCBwYXRjaGVzOiAxCiAgICAtLS0KICAgICBMaW5rOgogICAg
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci82ZGJjMjdmOC01MjYxLTU5YzUtYWNiYS03MGY2YzZh
NzRiYTFAcnd0aC1hYWNoZW4uZGUKICAgICBCYXNlOiBub3QgZm91bmQKCSAgIGdpdCBhbQogICAg
Li92Ml8yMDIxMDIwMV9qYW5fd2VpbnN0b2NrX29wZW5yaXNjX3VzZV9kZXZpY2VfdHJlZV90b19k
ZXRlcm1pbmVfcHJlc2VudF9jcHVzLm1ieAoKLVN0YWZmb3JkCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklT
Q0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3Rp
bmZvL29wZW5yaXNjCg==
