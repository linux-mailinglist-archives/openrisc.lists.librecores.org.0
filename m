Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 28C0A2460E6
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:46:52 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E38BD20E9A;
	Mon, 17 Aug 2020 10:46:51 +0200 (CEST)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by mail.librecores.org (Postfix) with ESMTPS id 9B97E20CA5
 for <openrisc@lists.librecores.org>; Thu,  6 Aug 2020 21:02:31 +0200 (CEST)
Received: by mail-ed1-f67.google.com with SMTP id v22so25136945edy.0
 for <openrisc@lists.librecores.org>; Thu, 06 Aug 2020 12:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=yQz8jNT7jbM1zvtc9MWwIejDFC/8b3Ez/9JWOSG7lno=;
 b=QThCNrkJPHr7s8iGlc4uJowP3s2qbSNAZJpUW7ELidrJUK4mRke6zh9BN727pTaUcX
 s0Zdlw7Yaz2UO4I4m0bPU7i0qJgki0oxGA9nHGGa22RnjGxdNU/ZrqiH1bjNEtU3n0T7
 QhloKmQ7m8OCCX86CWv9iFnezJNfb5LboVOUqU1SoQOpM4AATGJUIwltweLLiPN/Wtqc
 KkE97A0v/Ob2s+fW8cVjdA1WCYb3a1f/aXSSns2Q3rWqgu1JGZm8ZFM910hEHPuSupIQ
 fDDi8TRxAAbWx9P0lLKwFYnP0XEPve49vOaD80w93nLM17VQ5XiNOGJq6SWp+38D1SO+
 +a0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yQz8jNT7jbM1zvtc9MWwIejDFC/8b3Ez/9JWOSG7lno=;
 b=hCtXY1jt6hNm631nve3x9NRW8ASdnZA3nsTEJfyX9wroStJX3bGomOAmbOkOSbOVsh
 q9UVBrEmGn5W4Gpf5s9ifsjToYQ9Gmsb8Id3JJPk7tv7ml6E6vKVeMcgK35dbaDjkIOr
 x/nR0VHDr+u5M6OfiZUNnlE4PONyCkFjGwoqoHlpXHCBxaPdFOpcXMq9oVsXssgar9Zo
 aPk7eZGpuRjBQZxIYqEdL5vH9fJNYhOUORxb4vNoAMX3bA7upxGUNK47vM00vo0rTNXS
 pE5FC/nxux6eeOd0BHMAAb998Zq1iQqzDVL6D0sgAadFiqcUdgE218cupIHbH20nq8/J
 06/Q==
X-Gm-Message-State: AOAM531BERvgeP4YDn6bNdOfLcI5gppFrTkjWKkGkpgJaIF2SvR74jBb
 gbSHFx5L5C2lOeYB+AX7wWE=
X-Google-Smtp-Source: ABdhPJzm3Zj+ASLTF3FMTFHWlkAVgt69skwnKs2qqEcaZxXLYEOnyqK4lKXFT9L3QRgSHWdh9CG7uA==
X-Received: by 2002:aa7:db10:: with SMTP id t16mr5281903eds.196.1596740551235; 
 Thu, 06 Aug 2020 12:02:31 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:a7fb:e200:d567:ec52:e0a5:f485])
 by smtp.gmail.com with ESMTPSA id w19sm4262655ejv.92.2020.08.06.12.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 12:02:30 -0700 (PDT)
Date: Thu, 6 Aug 2020 21:02:29 +0200
From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To: Stafford Horne <shorne@gmail.com>
Message-ID: <20200806190229.b7jbmkavu7qqzegy@ltop.local>
References: <20200805210725.310301-1-shorne@gmail.com>
 <20200805210725.310301-7-shorne@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200805210725.310301-7-shorne@gmail.com>
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:38 +0200
Subject: Re: [OpenRISC] [PATCH v2 6/6] openrisc: uaccess: Add user address
 space check to access_ok
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
Cc: Jonas Bonn <jonas@southpole.se>, openrisc@lists.librecores.org,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCBBdWcgMDYsIDIwMjAgYXQgMDY6MDc6MjVBTSArMDkwMCwgU3RhZmZvcmQgSG9ybmUg
d3JvdGU6Cj4gTm93IHRoYXQgX191c2VyIGFubm90YXRpb25zIGFyZSBmaXhlZCBmb3Igb3BlbnJp
c2MgdWFjY2VzcyBhcGkncyB3ZSBjYW4KPiBhZGQgY2hlY2tpbmcgdG8gdGhlIGFjY2Vzc19vayBt
YWNyby4gIFRoaXMgcGF0Y2ggYWRkcyB0aGUgX19jaGtfdXNlcl9wdHIKPiBjaGVjaywgb24gbm9y
bWFsIGJ1aWxkcyB0aGUgYWRkZWQgY2hlY2sgaXMgYSBub3AuCj4gCj4gU2lnbmVkLW9mZi1ieTog
U3RhZmZvcmQgSG9ybmUgPHNob3JuZUBnbWFpbC5jb20+Cj4gLS0tCj4gIGFyY2gvb3BlbnJpc2Mv
aW5jbHVkZS9hc20vdWFjY2Vzcy5oIHwgMyArKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL29wZW5yaXNjL2lu
Y2x1ZGUvYXNtL3VhY2Nlc3MuaCBiL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vdWFjY2Vzcy5o
Cj4gaW5kZXggODVhNTUzNTliMjQ0Li41M2RkYzY2YWJiM2YgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9v
cGVucmlzYy9pbmNsdWRlL2FzbS91YWNjZXNzLmgKPiArKysgYi9hcmNoL29wZW5yaXNjL2luY2x1
ZGUvYXNtL3VhY2Nlc3MuaAo+IEBAIC01Nyw3ICs1Nyw4IEBAIHN0YXRpYyBpbmxpbmUgaW50IF9f
cmFuZ2Vfb2sodW5zaWduZWQgbG9uZyBhZGRyLCB1bnNpZ25lZCBsb25nIHNpemUpCj4gIAo+ICAj
ZGVmaW5lIGFjY2Vzc19vayhhZGRyLCBzaXplKQkJCQkJCVwKPiAgKHsgCQkJCQkJCQkJXAo+IC0J
X19yYW5nZV9vaygodW5zaWduZWQgbG9uZykoYWRkciksIChzaXplKSk7CQkJXAo+ICsJX19jaGtf
dXNlcl9wdHIoYWRkcik7CQkJCQkJXAo+ICsJX19yYW5nZV9vaygoX19mb3JjZSB1bnNpZ25lZCBs
b25nKShhZGRyKSwgKHNpemUpKTsJCVwKPiAgfSkKCkp1c3QgZm9yIGluZm8sIF9fZm9yY2UgaXMg
bm90IG5lZWRlZCB3aGVuIGNhc3RpbmcgYSBwb2ludGVyIHRvCnVuc2lnbmVkIGxvbmcgKG9yIHVp
bnRwdHJfdCkuIEl0J3Mgbm90IGluY29ycmVjdCB0byB1c2Ugb25lCmJ1dCBJIHRoaW5rIGl0J3Mg
dG8gYXZvaWQgX19mb3JjZSBhcyBtdWNoIGFzIHBvc3NpYmxlLgoKLS0gTHVjCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlz
dApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMu
b3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
