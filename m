Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 369002460DF
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:46:48 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 07C5320E7B;
	Mon, 17 Aug 2020 10:46:47 +0200 (CEST)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by mail.librecores.org (Postfix) with ESMTPS id CBD4820CE2
 for <openrisc@lists.librecores.org>; Tue,  4 Aug 2020 22:50:37 +0200 (CEST)
Received: by mail-ej1-f65.google.com with SMTP id m22so866312eje.10
 for <openrisc@lists.librecores.org>; Tue, 04 Aug 2020 13:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KkI8LyHYPiT/h3NnMBo5llKwufDfy44GU0em0whdiHo=;
 b=N3nUdOpstU6tgvlbaZ/Vd5Np5LpD5/A/embmd7N8aOzXsl7s+P7D0Divmm7dFugl7D
 /7e+Nb3uchaRfzeevOYDdWbFPiQMCmqkeud32UoqnkEQeQtXl6DX7yjM/rnerZEfSE8N
 2+oMoDhNuPtZY5WnljVg8cEv+RkFWeUKZ+B9iBA9USpMe2DhREho5nmjjE02gsjOxt4a
 p0cwYS+gl6C/noiagQyf2FdL1wxAmF4kr6fPgY4VcWMhsvWF3hMxGIfjtwXL7/dBZD2y
 YVgN+7n4q/gPj0BgeLCrGKyvPq70CkWuZWD1/8mccmNcqIuAb7EBLYKvCQffSRASuk/c
 WWtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KkI8LyHYPiT/h3NnMBo5llKwufDfy44GU0em0whdiHo=;
 b=OqWentQQfakocazrMSiVj1BSAfxkTwiRXbRXJ0+IuiUxYKGcqcrFaj5XMu8of7yhG+
 Qbk1XLsVvCL+K8yMg9gj0F0HVXKfZI3BwKiBh9C7HCpVBqccKGSQakRf2Bh+FToUrmTc
 Cbjf9eL2qqYMzuZl+uas4upHNj7iAxtx6ePn1MOiV64tvJEwCDBHh+myiYKw3YlIkNvk
 4+zwmhpGJzEqzBu3tZVgBKxVEklykRfbhzk9GDYk6mMo+E99vrjxT2NeOMGi0YNCftRy
 iZHNl9FSojvFpyP3x/ssW7SZQc4LuriEK+lOR8GuT9b6ZUa6ex7opMlw/rPHGBWLll0W
 lPew==
X-Gm-Message-State: AOAM531QeVRfnpDGJXgCMNXWK/vM7Qo5TWj+PmqCUtBjmRFJ83nPuX6y
 ZSan/eRKiV5lZKYTDGlELlM=
X-Google-Smtp-Source: ABdhPJzHvn4emSveEiuT4CvTKsAbWiDEiECpET9ac5jEqbAsUZ/TicV6wxWGqMfcKf8yQYkAsx+fBA==
X-Received: by 2002:a17:906:2801:: with SMTP id
 r1mr4018755ejc.17.1596574237558; 
 Tue, 04 Aug 2020 13:50:37 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:a7fb:e200:d068:a44f:fa3b:62da])
 by smtp.gmail.com with ESMTPSA id f22sm58218edt.91.2020.08.04.13.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 13:50:36 -0700 (PDT)
Date: Tue, 4 Aug 2020 22:50:36 +0200
From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To: Stafford Horne <shorne@gmail.com>
Message-ID: <20200804205036.vgy7h3mmojzmjihs@ltop.local>
References: <20200804042354.3930694-1-shorne@gmail.com>
 <20200804042354.3930694-7-shorne@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200804042354.3930694-7-shorne@gmail.com>
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:38 +0200
Subject: Re: [OpenRISC] [PATCH 6/6] openrisc: uaccess: Add user address
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

T24gVHVlLCBBdWcgMDQsIDIwMjAgYXQgMDE6MjM6NTRQTSArMDkwMCwgU3RhZmZvcmQgSG9ybmUg
d3JvdGU6Cj4gTm93IHRoYXQgX191c2VyIGFubm90YXRpb25zIGFyZSBmaXhlZCBmb3Igb3BlbnJp
c2MgdWFjY2VzcyBhcGkncyB3ZSBjYW4KPiBhZGQgY2hlY2tpbmcgdG8gdGhlIGFjY2Vzc19vayBt
YWNyby4gIFRoaXMgcGF0Y2ggYWRkcyB0aGUgX19jaGtfdXNlcl9wdHIKPiBjaGVjaywgb24gbm9y
bWFsIGJ1aWxkcyB0aGUgYWRkZWQgY2hlY2sgaXMgYSBub3AuCj4gCj4gU2lnbmVkLW9mZi1ieTog
U3RhZmZvcmQgSG9ybmUgPHNob3JuZUBnbWFpbC5jb20+CgpMb29rIGdvb2QgdG8gbWUuCgotLSBM
dWMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJ
U0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlz
dHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
