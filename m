Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 84701475235
	for <lists+openrisc@lfdr.de>; Wed, 15 Dec 2021 06:37:28 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2C429242D6;
	Wed, 15 Dec 2021 06:37:28 +0100 (CET)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mail.librecores.org (Postfix) with ESMTPS id 1378D22D3C
 for <openrisc@lists.librecores.org>; Wed, 15 Dec 2021 06:37:27 +0100 (CET)
Received: by mail-pj1-f52.google.com with SMTP id
 oa5-20020a17090b1bc500b001b0f8a5e6b7so2607010pjb.0
 for <openrisc@lists.librecores.org>; Tue, 14 Dec 2021 21:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OPE16NGUehq7H+GPj7sdm2nwjOe6Q0+oH4ixzeF6Z+Y=;
 b=ifi1AyjaVjETzUCjwATUi+809C1dcCGXg/iLNqD0dr+QE/wGrudQENFgNUs3OxLA6D
 qmtXJR/+pQll08mE4FSxqTzN/GAYIgs5HSRVjwtS++cZHOVqjfr3DYtSTZ2DJ65zqZn2
 Yt6hm+lVijiA9qejgIhLe6AdVKKNmN5124G9Tijn+jZllf/wWHVZFAWfCcV5LewtzmWa
 GBCPQa0AZprx68/WayTEb21wktR0aLn8eD3BrWz/ny0SmYd4btsiAaE2IjtispPBLLuj
 mJqmMx64kPEuOztK8RqRVVSM3Xsh40iVNOX341E0uevC8NvU2nXuh1Mhxl5r/vX+w7rg
 /KHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OPE16NGUehq7H+GPj7sdm2nwjOe6Q0+oH4ixzeF6Z+Y=;
 b=7KMwz6sm8ArC8AcVHimvq4bl+Mi+6oN7Ae29JrVbl15nr+OfaxfYLCIdPuVaEIKNTL
 bUDrGyViuVUSp3Tr8KTe55wJ4aFRLRO4miASKngIRcD4VoYlQMwkHohSgIdZeEMw/DG4
 9m7e+sQuXgNTElAZiIJeIEyN1gwu/dGt+aIl6WuC8VfH/ZkrJrxS6MsDe37WS3aKCvsp
 keepLuYeKl2hMz/IcB6DTnjm5wjSChrH972n5gEk6iCkuM1P27Lp5QA5uSQF6iv0RuJP
 TL0xFw5lyIDyYTbh0uD/u9AjM0KXpL2luMhgO8B7OrGpT1HFPWCgpcRHbc3tHddLzVqr
 iumA==
X-Gm-Message-State: AOAM530IpvGIi3lkmiAcbfKW1APugBEnwvt5vCVNlUv6XVCdV194v7DM
 VGGYVLYSw5EQ4l6UJ8wj2u0=
X-Google-Smtp-Source: ABdhPJzNps9gO/Cp/w0Dz96hbV+JeE7HyABREpcgsAxBOSwIvzsE+kZ0zY67RqIjdDt8VWnVeGxa5Q==
X-Received: by 2002:a17:90b:1217:: with SMTP id
 gl23mr9906895pjb.191.1639546645443; 
 Tue, 14 Dec 2021 21:37:25 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id v11sm1018585pfu.184.2021.12.14.21.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 21:37:24 -0800 (PST)
Date: Wed, 15 Dec 2021 14:37:23 +0900
From: Stafford Horne <shorne@gmail.com>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Message-ID: <Ybl/E2BWBGRMwF0G@antec>
References: <20211210233456.4146479-1-shorne@gmail.com>
 <cedcb34e-36e3-3bb8-07b7-8412c052b81d@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cedcb34e-36e3-3bb8-07b7-8412c052b81d@linaro.org>
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
 GLIBC patches <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBEZWMgMTQsIDIwMjEgYXQgMDU6MjU6MDlQTSAtMDMwMCwgQWRoZW1lcnZhbCBaYW5l
bGxhIHdyb3RlOgo+IAo+IAo+IE9uIDEwLzEyLzIwMjEgMjA6MzQsIFN0YWZmb3JkIEhvcm5lIHZp
YSBMaWJjLWFscGhhIHdyb3RlOgo+ID4gVGhpcyBpcyB0aGUgT3BlblJJU0MgcG9ydCBmb3IgZ2xp
YmMgdGhhdCBJIGhhdmUgYmVlbiB3b3JraW5nIG9uLgo+ID4gCj4gPiBDaGFuZ2VzIHNpbmNlIHYy
Ogo+ID4gIC0gRml4ZWQgc3VnZ2VzdGlvbnMgZnJvbSBKb3NlcGggTXllcnM6Cj4gPiAgICAtIEZp
eCBjb21tZW50IHN0eWxlLCBhbmQgZGVzY3JpcHRpb24gb24gdG9wIG9mIGVhY2ggZmlsZQo+ID4g
ICAgLSBNYWtlIHN1cmUgbWFjcm9zIGhhdmUgcGFyZW50aGVzZXMgd2hlbiBuZWVkZWQsCj4gPiAg
ICAtIEJ1bXAgcmVxdWlyZWQga2VybmVsIGRvd24gdG8gNS40LjAgYW5kIGRvY3VtZW50Cj4gPiAg
ICAtIFJlZ2VuZXJhdGUgYXJjaC1zeXNjYWxsLmgKPiA+ICAtIEZpeGVkIHN1Z2dlc3Rpb25zIGZy
b20gQWRoZW1lcnZhbDoKPiA+ICAgIC0gUmVtb3ZlIGtlcm5lbF9zdGF0LmgKPiA+ICAgIC0gSnVz
dCBzZXQgTU1BUDJfUEFHRV9VTklUIHRvIDhLCj4gPiAgICAtIFJlbW92ZSBpb2N0bC5jIGFuZCBz
eXNjYWxsLmMgZmlsZXMKPiA+ICAtIFVwZGF0ZSBUQ0IgYWxpZ25tZW50IHRvIDMyIGJ5dGVzCj4g
PiAKPiA+IENoYW5nZXMgc2luY2UgdjE6Cj4gPiAgLSBVcGRhdGUgYXBpJ3MgYXMgc3VnZ2VzdGVk
IGJ5IEZsb3JpYW4KPiA+ICAtIFJlbW92ZSBoYXJkIGZsb2F0IHN1cHBvcnQKPiA+ICAtIFVwZGF0
ZXMgdG8gZ2V0IGFsbCB0ZXN0cyBwYXNzaW5nCj4gPiAgLSBTcGxpdCBwYXRjaCBpbnRvIG1hbmFn
YWJsZSBiaXRzIHNpbWlsYXIgdG8gcmVjZW50IEFSQyBwb3J0Cj4gPiAKPiA+IERvY3VtZW50YXRp
b246Cj4gPiAKPiA+ICAgQXJjaGl0ZWN0dXJlIC8gQUJJIGRvY3M6Cj4gPiAgICBodHRwczovL3Jh
dy5naXRodWJ1c2VyY29udGVudC5jb20vb3BlbnJpc2MvZG9jL21hc3Rlci9vcGVucmlzYy1hcmNo
LTEuMy1yZXYxLnBkZgo+ID4gCj4gPiBUZXN0IFJlc3VsdHM6Cj4gPiAKPiA+ICAgYnVpbGQtbWFu
eS1nbGliY3MucHk6Cj4gPiAKPiA+ICAgIFBBU1Mgd2l0aCBtYWlubGluZSBhbmcgZ2NjLTExLgo+
ID4gCj4gPiAgIEZ1bGwgdGVzdCBzdWl0ZToKPiA+IAo+ID4gICAgVGhlIGZ1bGwgc3VpdGUgaXMg
cnVubmluZyB1c2luZyB0aGUgZ2NjLTExIGJyYW5jaCBvZiBHQ0MsIG1haW5saW5lIHNob3dzCj4g
PiAgICBpc3N1ZXMgd2l0aCBtYXRoIHNvZnQtZnAuCj4gPiAKPiA+ICAgIE5vdGUsIHRoZXJlIGFy
ZSBhIGZldyBtb3JlIGZhaWx1cmVzIGNvbXBhcmVkIHRvIGJlZm9yZSwgdGhpcyBpcyBkdWUgdG8g
bWUKPiA+ICAgIHJ1bm5pbmcgd2l0aCBhIHRpbWVvdXQgb2YgMzAgdnMgdXN1YWwgMzAwLiAgSXQg
YWxsb3dzIHRoZSB0ZXN0cyB0byBjb21wbGV0ZQo+ID4gICAgZmFzdGVyLCBidXQgSSBnZXQgYSBm
ZXcgbW9yZSB0aW1lb3V0cy4gIFRoZXJlIHdlcmUgMTUgdGltZW91dHMgd2hpY2ggSQo+ID4gICAg
Y29uZmlybSBkbyB3b3JrIGlmIEkgaW5jcmVhc2UgdGhlIHRpbWVvdXRmYWN0b3IuIFRoZSAyIHJl
YWwgZmFpbHVyZXMgbWFya2VkCj4gPiAgICB3aXRoICogYmVsb3cuCj4gPiAKPiA+ICAgICAjIHRl
c3Qgc3RhcnQ6ICAgIDIwMjEtMTItMDhUMTk6NTk6MDArMDk6MDAKPiA+IAo+ID4gICAgICMgZmFp
bHVyZXMKPiA+ICAgICBGQUlMOiplbGYvdHN0LWJ6MTUzMTEKPiAKPiBUaGlzIHNlZW1zIHRvIGJl
IGEgcmVhbCBpc3N1ZSwgdGhlIG91dHB1dCBzaG93cyB0aGUgbmV3IHNvcnRpbmcgYWxnb3JpdGht
IHNlZW1zIAo+IG5vdCBiZSBlbmFibGVkICh0aGUgb3V0cHV0IHNob3dzIHRoZSBkZXN0cnVjdG9y
IG9yZGVyIGZvciBkeW5hbWljX3NvcnQ9MSkuICBXZSAKPiBuZWVkIHRvIGZpZ3VyZSBvdXQgd2hh
dCBpcyBoYXBwZW5pbmcgaGVyZS4KPgo+ID4gICAgIEZBSUw6IGxvY2FsZS90c3QtbG9jYWxlZGVm
LXBhdGgtbm9ybQo+ID4gICAgIEZBSUw6IG1hbGxvYy90c3QtZHluYXJyYXktZmFpbAo+ID4gICAg
IEZBSUw6IG1hbGxvYy90c3QtZHluYXJyYXktZmFpbC1tZW0KPiA+ICAgICBGQUlMOiBucHRsL3Rz
dC1tdXRleDEwCj4gPiAgICAgRkFJTDogbnNzL3RzdC1uc3MtZmlsZXMtaG9zdHMtZ2V0ZW50Cj4g
PiAgICAgRkFJTDogbnNzL3RzdC1uc3MtZmlsZXMtaG9zdHMtbXVsdGkKPiA+ICAgICBGQUlMOiBw
b3NpeC90c3QtcmVnY29tcC10cnVuY2F0ZWQKPiA+ICAgICBGQUlMOiBzdGRpby1jb21tb24vdHN0
LXZmcHJpbnRmLXdpZHRoLXByZWMKPiA+ICAgICBGQUlMOiBzdGRpby1jb21tb24vdHN0LXZmcHJp
bnRmLXdpZHRoLXByZWMtYWxsb2MKPiA+ICAgICBGQUlMOiBzdGRpby1jb21tb24vdHN0LXZmcHJp
bnRmLXdpZHRoLXByZWMtbWVtCj4gPiAgICAgRkFJTDogc3RyaW5nL3Rlc3QtbWVtY3B5Cj4gPiAg
ICAgRkFJTDogc3RyaW5nL3Rlc3QtbWVtY3B5LWxhcmdlCj4gPiAgICAgRkFJTDogc3RyaW5nL3Rl
c3QtbWVtcGNweQo+ID4gICAgIEZBSUw6IHN0cmluZy90c3QtY21wCj4gPiAgICAgRkFJTDogc3Vw
cG9ydC90c3Qtc3VwcG9ydF9ibG9iX3JlcGVhdAo+ID4gICAgIEZBSUw6KnRpbWV6b25lL3RzdC10
enNldAo+IAo+IEl0IHNlZW1zIHRoZSB0ZXN0aW5nIGZpbGUgc3lzdGVtIGRvZXMgbm90IHN1cHBv
cnQgc3BhcnNlIGZpbGVzIG9yIGF0IGxlYXN0Cj4gaGFzIHNvbWUgbGltaXRzIG9mIHRoZSBmaWxl
IHNpemUgYW5kIHN1cHBvcnRfZGVzY3JpcHRvcl9zdXBwb3J0c19ob2xlcyBpcwo+IG5vIGRldGV0
aW5nIGl0LgoKTGV0IG1lIHNlZSBpZiBJIGNhbiBmaWd1cmUgb3V0IHRoZSBzcGFyc2UgZmlsZSBz
dXBwb3J0LiAgSWYgdGhhdCBjYW4gd29yawp0aGVuIGl0IHdvdWxkIGJlIGdvb2QuICBUaGUgZmls
ZXN5c3RlbSBJIGFtIHVzaW5nIGlzOgoKIHRtcGZzIG9uIC90bXAgdHlwZSB0bXBmcyAocncscmVs
YXRpbWUpCgo+IEkgdGhpbmsgd2Ugc2hvdWxkIHVzZSBhIGxhcmdlIHdyaXRlX29mZnNldCBhbmQg
YmxvY2tfaGVhZHJvb20sIG1heWJlCj4gc29tZXRoaW5nIGxhcmdlciB0aGFuIDMyLWJpdCBvZmZz
ZXQgdG8gYWN0dWFsbHkgY2hlY2sgaXQuICBDb3VsZCB5b3UKPiBjaGVjayBpZiBpbmNyZWFzaW5n
IGJvdGggdmFsdWVzIGRvZXMgbWFrZSB0aGUgdGVzdCB1bnN1cHBvcnRlZC4KCkkgd2lsbCBjaGVj
ay4KCi1TdGFmZm9yZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcK
aHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
