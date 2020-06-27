Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 660E020DCE8
	for <lists+openrisc@lfdr.de>; Mon, 29 Jun 2020 22:45:10 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3972E20853;
	Mon, 29 Jun 2020 22:45:10 +0200 (CEST)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by mail.librecores.org (Postfix) with ESMTPS id 5760120CA9
 for <openrisc@lists.librecores.org>; Sat, 27 Jun 2020 23:23:40 +0200 (CEST)
Received: by mail-pf1-f196.google.com with SMTP id t11so1340444pfq.11
 for <openrisc@lists.librecores.org>; Sat, 27 Jun 2020 14:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mizxgkzS/h5RAiTRnXHHAMYgNZSKy87tz0psMUuXu0c=;
 b=KrOHe2AlaGQ7tV28Vl9qyOQ0elfd8r//wq4xzvB5xDb5jWlg6mXfsKxabi0zi9yPbE
 a3CGp38U8cqw2mebqkt6TnvwzPA6E6KEcgpIj8HCQ1rHyHT3QVxyrownujSHvkYTCVSa
 Gy95rzA2weVyQoDCaBGwSARvG5wXI2h42LYwK1iUZUWKUYeZG14+sFo/aPCYLw2NwZJj
 nBqydL7WFvWCAVkBuzJ2gva+wATslrp9imqMIKL3E0H/YMoAyiaNhBbjIsjfeCv51DOd
 WRdGRRQ8YZYlJSkPBIPY8Mf5k8q0bkdsr138mWgQL9YfzyKrJwEngJSJT/C0ZJyP38ue
 p6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mizxgkzS/h5RAiTRnXHHAMYgNZSKy87tz0psMUuXu0c=;
 b=V2bhZh2/9JBQOwwwWNg8pBoegOsDpoLCl28PlC52j4GdBKyqGPSfc1bzb5XF51w96Q
 sj5vK0F5j2iLJrKbDcKZ9dIUotIp5e34gVj4pITdT2wTx+MrO528I87QanMm8vLkQcRk
 gNdhRPqVxXlbcDh0+WMEw9hw6xgv6GreZue2rjoj3RzXihiPAjP3xyNLOQxlx2JUy0ed
 16BXdlTasoFc1/NoI9IrqkcvCF0uzQmz5YjSudL5ghkaPYLTeKRu232NP93Gr+1fdMQG
 O5fBh2ApfzBJhAY5CZPt6JiqDMdnIPZYPyFxXpFl6gSO9AlXC0zFCUl65VmpvHO+/Vpw
 zA2A==
X-Gm-Message-State: AOAM532lSWNUIRw/5LlVDf4rU7IwjUlNbRElKdzjfaA97bnOzTxtCy86
 gopZR6wMB3PrHSkoCcoPv7A=
X-Google-Smtp-Source: ABdhPJyLzAtm2TextcgHnw6pDE2t7RidtLOm1t9FNzgTafND17DEExqOaKhxKo2F07v49LSV9JtDbQ==
X-Received: by 2002:a62:e305:: with SMTP id g5mr8523544pfh.115.1593293018476; 
 Sat, 27 Jun 2020 14:23:38 -0700 (PDT)
Received: from localhost (g2.222-224-226.ppp.wakwak.ne.jp. [222.224.226.2])
 by smtp.gmail.com with ESMTPSA id mw5sm15217406pjb.27.2020.06.27.14.23.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jun 2020 14:23:37 -0700 (PDT)
Date: Sun, 28 Jun 2020 06:23:35 +0900
From: Stafford Horne <shorne@gmail.com>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20200627212335.GJ1401039@lianli.shorne-pla.net>
References: <20200627143453.31835-1-rppt@kernel.org>
 <20200627143453.31835-3-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200627143453.31835-3-rppt@kernel.org>
X-Mailman-Approved-At: Mon, 29 Jun 2020 22:44:54 +0200
Subject: Re: [OpenRISC] [PATCH 2/8] opeinrisc: switch to generic version of
 pte allocation
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>, linux-csky@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-hexagon@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Mike Rapoport <rppt@linux.ibm.com>, Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org,
 linux-um@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Andy Lutomirski <luto@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU2F0LCBKdW4gMjcsIDIwMjAgYXQgMDU6MzQ6NDdQTSArMDMwMCwgTWlrZSBSYXBvcG9ydCB3
cm90ZToKPiBGcm9tOiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gCj4gUmVw
bGFjZSBwdGVfYWxsb2Nfb25lKCksIHB0ZV9mcmVlKCkgYW5kIHB0ZV9mcmVlX2tlcm5lbCgpIHdp
dGggdGhlIGdlbmVyaWMKPiBpbXBsZW1lbnRhdGlvbi4gVGhlIG9ubHkgYWN0dWFsIGZ1bmN0aW9u
YWwgY2hhbmdlIGlzIHRoZSBhZGRpdGlvbiBvZgo+IF9fR0ZQX0FDQ09VVCBmb3IgdGhlIGFsbG9j
YXRpb24gb2YgdGhlIHVzZXIgcGFnZSB0YWJsZXMuCj4gCj4gVGhlIHB0ZV9hbGxvY19vbmVfa2Vy
bmVsKCkgaXMga2VwdCBiYWNrIGJlY2F1c2UgaXRzIGltcGxlbWVudGF0aW9uIG9uCj4gb3BlbnJp
c2MgaXMgZGlmZmVyZW50IHRoYW4gdGhlIGdlbmVyaWMgb25lLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IE1pa2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4KClRoYW5rJ3MgZm9yIHRoaXMuCgpB
Y2tlZC1ieTogU3RhZmZvcmQgSG9ybmUgPHNob3JuZUBnbWFpbC5jb20+Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApP
cGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3Jn
L2xpc3RpbmZvL29wZW5yaXNjCg==
