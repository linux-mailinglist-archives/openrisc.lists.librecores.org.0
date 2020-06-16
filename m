Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 460B61FBDB7
	for <lists+openrisc@lfdr.de>; Tue, 16 Jun 2020 20:11:56 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id F09B620BE0;
	Tue, 16 Jun 2020 20:11:55 +0200 (CEST)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by mail.librecores.org (Postfix) with ESMTPS id A76B520AC1
 for <openrisc@lists.librecores.org>; Tue, 16 Jun 2020 20:11:53 +0200 (CEST)
Received: by mail-pg1-f194.google.com with SMTP id r18so9570236pgk.11
 for <openrisc@lists.librecores.org>; Tue, 16 Jun 2020 11:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=V8krypQYvLLdoGkdoWAmqL4AijiFXVU+JMq1HqUDiLE=;
 b=DPoTPmVq8LnQ8E46Fms7EJqK2SCs0dbHEwdpcZB8xUde2Ie3gU9CCHATQ+JDgkiflb
 l1mY+O3zFozAf5/wiKJIT2zuvtEsAq/ADYa/3oQKbSedxk2+P6sd1Mvc78vPLB7GiRYx
 9nHe/GW3QWOfbPS7JComESZiQ9KEtVI+AfvR4MmEVpQHpP6yR4JHh1Px8qqcA3KE7xXY
 9DqhNwLiBmoIyazx0eDxbysFSlhzWhcXXZCdLB1CJ4TIOUhFA1pjdnzmBG4oyry1XXQF
 32duI8CY14pUR61Ii310aSvAFPP1XPf71Rho0grRTe3RJIY7iCE+q27RZANAwoukgM60
 HGPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=V8krypQYvLLdoGkdoWAmqL4AijiFXVU+JMq1HqUDiLE=;
 b=ILqfPMHYhoelqee+xl3fLlR0kRldtsTylX2ddJLQs+UoBKfoGRAgRwmHI9nU5WKST3
 cDEVxFGlM7tq432+UvyNRp+q5ZtDC8Q+ahZaofQPsZSqQlfHYhtJC0x0kfWNym/WeOV9
 koJzpFzZ4d1Ocl+UpkEEIzZF0hx8ihAu2QNTOsDYMUnQT0QEbTzb23159dU8xCYqTAMm
 uLnTftJQ8U3RiapCE7wlTZJHB64ORU6k9WzggLy8+aVJs3PuIOw4U5RTCJht5yW6fQaD
 jdFEeFigigPp/Co0Xzbz5bXns9il3H5tuMd0f676EB806u6kPh5IMogwuWNflL57aBOq
 HEcg==
X-Gm-Message-State: AOAM531DGUr9kVXJ/t5cCiWnnG0TxOobj4T/ZBD7i8aoZHBmoaA5IJkI
 xnDQwpqlTq2mhdDgu9tB/BA=
X-Google-Smtp-Source: ABdhPJzwhQLrWNvkHH121vPPASIn8omkp4XiIlciAzQ2Ypefq4x3InARPVnT1WT6BkeZmcYgceofuA==
X-Received: by 2002:a63:690:: with SMTP id 138mr1947500pgg.122.1592331111761; 
 Tue, 16 Jun 2020 11:11:51 -0700 (PDT)
Received: from localhost (g228.115-65-196.ppp.wakwak.ne.jp. [115.65.196.228])
 by smtp.gmail.com with ESMTPSA id
 u128sm17377967pfu.148.2020.06.16.11.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 11:11:51 -0700 (PDT)
Date: Wed, 17 Jun 2020 03:11:48 +0900
From: Stafford Horne <shorne@gmail.com>
To: Peter Xu <peterx@redhat.com>
Message-ID: <20200616181148.GQ75760@lianli.shorne-pla.net>
References: <20200615221607.7764-1-peterx@redhat.com>
 <20200615221607.7764-16-peterx@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200615221607.7764-16-peterx@redhat.com>
Subject: Re: [OpenRISC] [PATCH 15/25] mm/openrisc: Use mm_fault_accounting()
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, Jonas Bonn <jonas@southpole.se>,
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBKdW4gMTUsIDIwMjAgYXQgMDY6MTU6NTdQTSAtMDQwMCwgUGV0ZXIgWHUgd3JvdGU6
Cj4gVXNlIHRoZSBuZXcgbW1fZmF1bHRfYWNjb3VudGluZygpIGhlbHBlciBmb3IgcGFnZSBmYXVs
dCBhY2NvdW50aW5nLgo+IAo+IEF2b2lkIGRvaW5nIHBhZ2UgZmF1bHQgYWNjb3VudGluZyBtdWx0
aXBsZSB0aW1lcyBpZiB0aGUgcGFnZSBmYXVsdCBpcyByZXRyaWVkLgo+IEFsc28sIHRoZSBwZXJm
IGV2ZW50cyBmb3IgcGFnZSBmYXVsdHMgd2lsbCBiZSBhY2NvdW50ZWQgdG9vIHdoZW4gdGhlIGNv
bmZpZyBoYXMKPiBDT05GSUdfUEVSRl9FVkVOVFMgZGVmaW5lZC4KPiAKPiBDQzogSm9uYXMgQm9u
biA8am9uYXNAc291dGhwb2xlLnNlPgo+IENDOiBTdGVmYW4gS3Jpc3RpYW5zc29uIDxzdGVmYW4u
a3Jpc3RpYW5zc29uQHNhdW5hbGFodGkuZmk+Cj4gQ0M6IFN0YWZmb3JkIEhvcm5lIDxzaG9ybmVA
Z21haWwuY29tPgo+IENDOiBvcGVucmlzY0BsaXN0cy5saWJyZWNvcmVzLm9yZwo+IFNpZ25lZC1v
ZmYtYnk6IFBldGVyIFh1IDxwZXRlcnhAcmVkaGF0LmNvbT4KCkFja2VkLWJ5OiBTdGFmZm9yZCBI
b3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJl
Y29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
