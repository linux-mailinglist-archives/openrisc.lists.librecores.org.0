Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 38E664976CB
	for <lists+openrisc@lfdr.de>; Mon, 24 Jan 2022 01:45:49 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C5CD72476D;
	Mon, 24 Jan 2022 01:45:48 +0100 (CET)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mail.librecores.org (Postfix) with ESMTPS id A92B7240C7
 for <openrisc@lists.librecores.org>; Mon, 24 Jan 2022 01:45:47 +0100 (CET)
Received: by mail-pj1-f53.google.com with SMTP id l16so14718398pjl.4
 for <openrisc@lists.librecores.org>; Sun, 23 Jan 2022 16:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=syJJE/Qo6SPH0sSL0neAN+nKt5eaHiqDKA6r4xdpWFk=;
 b=hX7OzedDjaKYQVBoUIG9Pwcc+aoUWV943bQwHSYprltvYFkoVVQciJ2K7U8JRrgDTp
 vJgf11p6kYT5dUNtKnYsyBm69OdYk551j6Ust56PNGxdHNWF/u5xPTjRFZbaIp4m1slQ
 ZKlw1xHL8ib0MCoW7e+8XbhBih80icLi17iQwNkRqW+l8v/knTBOASik4Ax3/mUln8//
 FwcDGGmSfwZ4nArcybfqi4w5V9VklBmWkuELO/ervw7htleo6or8kNS96j38UGyds/UO
 A/cLjqJoaL44ebcQ9yPYFtKxlhX51GXIXRjLgDRtZKmNsUlEATdBWMm0yPW/0MoGDAbF
 C3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=syJJE/Qo6SPH0sSL0neAN+nKt5eaHiqDKA6r4xdpWFk=;
 b=mcGJ4z+Wy91Uj+1/FIDBbXl5Q1HIBUD8XqfsiS/EA1A3GPyeU+/s2hx6kexQbwaqVx
 xDCyf2VEgNQALUtfgIjhmRdOIIPpMq38neNdo4p8usPIxyEEZa71V9+1CkJHjfUTLgxt
 6DlhK+FxHhdrqBaLI30S5f9YQOAIJX7UCpWmmr9M9h4xz5FKSNidrxxS25tRc85GQQcJ
 XGutmuXtfVO1mltR2HH4NyOOEQHWrmwVtwhVg742B7diMzE7gsSn+bEk926PIrBoLtfb
 zxD51++F1H1rFM2PlrmatHR1hFkC7IrUG8DaTeAGTPHqk+YwAGJmgwR+jIn2Rhc1IHpl
 m5sA==
X-Gm-Message-State: AOAM530BClHsN6R8ZHxk1e09Y/dMtMU0hdS7+YBiQT84TpzmbYZJymWK
 UQ8etU8JIqNt5ToBmRnny5I=
X-Google-Smtp-Source: ABdhPJzjOXW6micKO9T5xFVT4xpONrBnU5j0xRC5sUUOdGNlLIa/FE0dfIRzjqdLoLhkok9qV4bR6g==
X-Received: by 2002:a17:902:da88:b0:14b:2d82:c074 with SMTP id
 j8-20020a170902da8800b0014b2d82c074mr8531002plx.13.1642985146108; 
 Sun, 23 Jan 2022 16:45:46 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id o8sm386585pfu.52.2022.01.23.16.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 16:45:45 -0800 (PST)
Date: Mon, 24 Jan 2022 09:45:43 +0900
From: Stafford Horne <shorne@gmail.com>
To: Kuniyuki Iwashima <kuniyu@amazon.co.jp>
Message-ID: <Ye32t5ZccUwfa+ag@antec>
References: <Ye3keps4aHhkbYzr@antec>
 <20220124000249.4295-1-kuniyu@amazon.co.jp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220124000249.4295-1-kuniyu@amazon.co.jp>
Subject: Re: [OpenRISC] [PATCH] openrisc/boot: Remove unnecessary
 initialisation in memcpy().
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
Cc: jonas@southpole.se, benh@amazon.com, linux-kernel@vger.kernel.org,
 openrisc@lists.librecores.org, kuni1840@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBKYW4gMjQsIDIwMjIgYXQgMDk6MDI6NDlBTSArMDkwMCwgS3VuaXl1a2kgSXdhc2hp
bWEgd3JvdGU6Cj4gRnJvbTogICBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4KPiBE
YXRlOiAgIE1vbiwgMjQgSmFuIDIwMjIgMDg6Mjc6NTQgKzA5MDAKPiA+IE9uIFN1biwgSmFuIDIz
LCAyMDIyIGF0IDExOjAxOjAwQU0gKzA5MDAsIEt1bml5dWtpIEl3YXNoaW1hIHdyb3RlOgo+ID4g
PiAnZCcgYW5kICdzJyBhcmUgaW5pdGlhbGlzZWQgbGF0ZXIgd2l0aCAnZGVzdF93JyBhbmQgJ3Ny
Y193Jywgc28gd2UgbmVlZCBub3QKPiA+ID4gaW5pdGlhbGlzZSB0aGVtIGJlZm9yZSB0aGF0Lgo+
ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogS3VuaXl1a2kgSXdhc2hpbWEgPGt1bml5dUBhbWF6
b24uY28uanA+Cj4gPiAKPiA+IFRoaXMgbG9va3MgZmluZSB0byBtZS4gIEkgd2lsbCBxdWV1ZSB0
aGlzIGZvciB0aGUgbmV4dCByZWxlYXNlLgo+IAo+IFRoYW5rIHlvdS4KPiAKPiAKPiA+IAo+ID4g
SnVzdCBjdXJpb3VzIHdoeSBhcmUgeW91IHdvcmtpbmcgb24gT3BlblJJU0M/Cj4gCj4gV2hpbGUg
cmVhZGluZyBtZW1jcHkoKSB2YXJpYW50cywgSSBmb3VuZCBhIG5pdCB0byBmaXggaW4geDg2IGJv
b3QtdGltZQo+IG1lbWNweSgpIFswXS4gIFdoaWxlIEknbSBhdCBpdCwgSSBqdXN0IHN0YXJ0ZWQg
cmVhZGluZyBhbGwgYXJjaCBvbmVzIDspCj4gCj4gWzBdOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9sa21sLzIwMjIwMTIzMDE1ODA3LjQ1MDA1LTEta3VuaXl1QGFtYXpvbi5jby5qcC8KCkdvdCBp
dC4KClRoYW5rcyBhZ2FpbiEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMu
b3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
