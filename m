Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2F6481DFB6A
	for <lists+openrisc@lfdr.de>; Sun, 24 May 2020 00:48:40 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 920DF20BBE;
	Sun, 24 May 2020 00:48:39 +0200 (CEST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by mail.librecores.org (Postfix) with ESMTPS id 27E3820B80
 for <openrisc@lists.librecores.org>; Sun, 24 May 2020 00:48:37 +0200 (CEST)
Received: by mail-ed1-f41.google.com with SMTP id h16so12134913eds.5
 for <openrisc@lists.librecores.org>; Sat, 23 May 2020 15:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QNlDLScasXXqIPXcHYwOFSrfJRg/XFoSJNSjh9UlLpk=;
 b=ibVj5fAGM757qTplJl+9cFN9n0HG8gBPrYv6oXnpnYDJNlZBjfZf1astHSsBTFATML
 IkDXX2e79sKuNaJXfLXqaCdVGSbqzL48Laxh9tuX5tAFbgj12PDo8x9ISuxtQirbDQS7
 7FbSNINPtQ59ju4Tfp7FVz8NiD0IvDXQ41fIBf6kUFvGvjnFuiYY5jBTSHndE7PK7jm7
 45HkQXWq4pbBY6V+8a7KfLLDzSDgDXnaABTbLr+zar1oVMy+Jdg05VbOZId+Noa+Lulz
 YiZVKjKTU99lyj88tUHXN4kdUsqMIZeke42v5UZJoczK2iZfYdxX0DIKYG91kt6wqyB8
 /1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QNlDLScasXXqIPXcHYwOFSrfJRg/XFoSJNSjh9UlLpk=;
 b=FpgzlkIzuV6R6ipPgva6hekPaTQBgdKsg/JizqRCp6WvG+SxS1FHt0CZEo/M+9NyU8
 pMsxVAXd1/SgkROpUKHFl/X5e49dsQklGewPCPm/lRp2ne1Tcr4RaVttIrwFMIvypV0N
 Aw+cP4WevIC+LbhtFf6kXZwHzYMO3A962EIRYzdH5Vd90UOF3T4JBwvLeMaezfQ2LcF3
 k0XsNYI60V9iCBIN+N/kPokmLRXs6YQtJeaP0hPdlwDOzdkE6TSHc2qd5pS2porTgEYp
 9We0VTyfYsPH2hIOcV9vn6/+WIQrpiSPQDcF9kVxnlXUTpShENUmiSlAxN8lwAPeuMIf
 CiWw==
X-Gm-Message-State: AOAM530j45KaJl7DYybKaAHTypdZQjMrMjMqlpcAw0M1eBBx5JTUiAZ6
 GUMLqA3Z0NOT4J5O8Ov+8aaOeyUyk57GXcm7R2g=
X-Google-Smtp-Source: ABdhPJxvnCLALhTPfh3gd2BJa5NgFTudfRdgw2n1/Aayb+TwwGColGJCgPqNocraMwCmKcYj7KHavZPmzFgfWIK9Ia8=
X-Received: by 2002:a50:b961:: with SMTP id m88mr8951414ede.4.1590274116815;
 Sat, 23 May 2020 15:48:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200506220323.GB2550@lianli.shorne-pla.net>
 <652e3bb7-93aa-4310-e798-2258b00300af@mail.ru>
 <20200508221759.GB4359@lianli.shorne-pla.net>
In-Reply-To: <20200508221759.GB4359@lianli.shorne-pla.net>
From: Stafford Horne <shorne@gmail.com>
Date: Sun, 24 May 2020 07:48:24 +0900
Message-ID: <CAAfxs74qCX4HnA04XcSN1DxbAotNX4iLqUP5m5c-pvP5pn0z8g@mail.gmail.com>
To: Andrey Bacherov <bandvig@mail.ru>
Subject: Re: [OpenRISC] OpenRISC: User mode writing to FPCSR
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

RllJLCBJIHBvc3RlZCB0aGUgcHJvcG9zYWwgb24gdGhlIHdlYnNpdGUgaGVyZToKCmh0dHBzOi8v
b3BlbnJpc2MuaW8vcHJvcG9zYWxzL3AxNy11c2VyLW1vZGUtZnBjc3IKCk9uIFNhdCwgTWF5IDks
IDIwMjAgYXQgNzoxOCBBTSBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4gd3JvdGU6
Cj4KPiBPbiBGcmksIE1heSAwOCwgMjAyMCBhdCAxMDo1MzowNVBNICswMzAwLCBBbmRyZXkgQmFj
aGVyb3Ygd3JvdGU6Cj4gPiBIZWxsbyBTdGFmZm9yZCwKPiA+Cj4gPiBJIGFncmVlIHdpdGggeW91
ciBwcm9wb3NhbCAoMSkuCj4gPiBJdCBsb29rcyByZWFzb25hYmxlLgo+Cj4gVGhhbmtzIGZvciB5
b3VyIHJldmlldy4gIEkgdGhpbmsgaXQgd2lsbCBiZSBhIGJpdCBvZgo+IHRpbWUgYmVmb3JlIEkg
c3RhcnQgb24gYW55IG9mIHRoaXMuCj4KPiAtU3RhZmZvcmQKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVND
QGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGlu
Zm8vb3BlbnJpc2MK
