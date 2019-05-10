Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 219DA1A499
	for <lists+openrisc@lfdr.de>; Fri, 10 May 2019 23:35:11 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B390928464;
	Fri, 10 May 2019 23:35:10 +0200 (CEST)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by mail.librecores.org (Postfix) with ESMTPS id D9E1B229CA
 for <openrisc@lists.librecores.org>; Fri, 10 May 2019 23:35:09 +0200 (CEST)
Received: by mail-pl1-f196.google.com with SMTP id p15so3390746pll.4
 for <openrisc@lists.librecores.org>; Fri, 10 May 2019 14:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=JQiORq/oShWMxFDwzIq8JryQf2mDAbYrbSK1Cq/eY38=;
 b=IjhPLZ+DQYScj2vBvXC4GRjrlWPuaCv++8zR/Qx6Jj7K4hC9YV870cIb1NprObp0Cg
 Nga/dEkJXTm13vxkMjqfUw4un2zT9kvtqCNFVxNSBxCrYx/q6c6lxA1VqNWEiVopUEPq
 bLh44P43ymVKjDMN5/0FcZ8ER929Bw6zPNjEVD31Tupp/kciFdR0O3Ym3TKROqDn5i/D
 t4/V3jtFl51FvlpfFILqjSiejENjqDCACo7U0HYMI3WjtLSfFVc4zYN1KAIwpN5shI0a
 UILW2CFXIaFrbCc8sqjOe/4/IzY1866TBlhWoeZWOEgwi9evivZEvP3fsKhSmT8J40Z+
 6EIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JQiORq/oShWMxFDwzIq8JryQf2mDAbYrbSK1Cq/eY38=;
 b=fzmkTFu+ThF5pQPyPVtMD7DLwtmNXaEjHwhPpjGFpg+4Cf6J1dT2uyJ4LBCCeRl5jK
 8Jm6oeXBodulGUcO1EbXC7JzED8ru1nJhqtwtA3zufM/YmAcY9r70K6U1pttaawOD3KS
 BAw0M1j0UK/aY8kS/ROWRMo7t09SEKAx5llRX+gfwkoHF11+wLslcE+PgOWRh4Zw2skb
 zER+9HEITFxFaUHwJOCqg7FgcwTsP8cBJexO3471keNL8Kf0c5ngAJ/7Xr01zV2TB2Ea
 rsVsgRzlqAsuDiThanBxsGcYzOaRhuJuYaVzwIxWPm6kPW5+qLuHmdE1xcRxkpPUjKE/
 lNKg==
X-Gm-Message-State: APjAAAX2RJPwgmldHOtUx6uujV7UfVSl5UmfL5cU8+6YTO7PkgI+V6vt
 csTtebo/j4TRDSh2+J9+G6c=
X-Google-Smtp-Source: APXvYqxUh1fhAqIti/JY0Gb7zTTsfGKNJa25OnFI+11V0j+pAZi3mhda8E/+Ayd4wB/32dHApOPy9w==
X-Received: by 2002:a17:902:2ba6:: with SMTP id
 l35mr15953275plb.56.1557524108000; 
 Fri, 10 May 2019 14:35:08 -0700 (PDT)
Received: from localhost (g30.211-19-85.ppp.wakwak.ne.jp. [211.19.85.30])
 by smtp.gmail.com with ESMTPSA id l15sm8614028pfi.79.2019.05.10.14.35.06
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 10 May 2019 14:35:07 -0700 (PDT)
Date: Sat, 11 May 2019 06:35:05 +0900
From: Stafford Horne <shorne@gmail.com>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Message-ID: <20190510213505.GH11006@lianli.shorne-pla.net>
References: <20190506131621.29929-1-shorne@gmail.com>
 <20190506131621.29929-2-shorne@gmail.com>
 <FF41D424-46AF-4A74-BB13-2E7A3DA4924E@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <FF41D424-46AF-4A74-BB13-2E7A3DA4924E@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [OpenRISC] [PATCH 1/2] or1k: Fix code quality for volatile
 memory loads
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
Cc: Openrisc <openrisc@lists.librecores.org>, gcc-patches@gcc.gnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCBNYXkgMDksIDIwMTkgYXQgMDc6NDQ6MTVQTSArMDIwMCwgQmVybmhhcmQgUmV1dG5l
ci1GaXNjaGVyIHdyb3RlOgo+IE9uIDYgTWF5IDIwMTkgMTU6MTY6MjAgQ0VTVCwgU3RhZmZvcmQg
SG9ybmUgPHNob3JuZUBnbWFpbC5jb20+IHdyb3RlOgo+ID5Wb2xhdGlsZSBtZW1vcnkgZG9lcyBu
b3QgbWF0Y2ggdGhlIG1lbW9yeV9vcGVyYW5kIHByZWRpY2F0ZS4gIFRoaXMKPiA+Y2F1c2VzIGV4
dHJhIGV4dGVuZC9tYXNrIGluc3RydWN0aW9ucyBpbnN0cnVjdGlvbnMgd2hlbiByZWFkaW5nCj4g
PmZyb20gdm9sYXRpbGUgbWVtb3J5LiAgT24gT3BlblJJU0MgbG9hZGluZyB2b2xpdGlsZSBtZW1v
cnkgY2FuIGJlCj4gCj4gcy92b2xpdGlsZS92b2xhdGlsZS9nCj4gCj4gYWxzbyBhdCBsZWFzdCBp
biB0aGUgdGVzdC4KPiBUaGFua3MsCgpUaGFuayB5b3UsCgpJIGFsd2F5cyBtaXNwZWxsIHRoYXQg
b25lLgoKLVN0YWZmb3JkCgo+IAo+ID5kaWZmIC0tZ2l0IGEvZ2NjL3Rlc3RzdWl0ZS9nY2MudGFy
Z2V0L29yMWsvc3dhcC0yLmMKPiA+Yi9nY2MvdGVzdHN1aXRlL2djYy50YXJnZXQvb3Ixay9zd2Fw
LTIuYwo+ID5uZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID5pbmRleCAwMDAwMDAwMDAwMC4uOGRkZWE0
ZTY1OWYKPiA+LS0tIC9kZXYvbnVsbAo+ID4rKysgYi9nY2MvdGVzdHN1aXRlL2djYy50YXJnZXQv
b3Ixay9zd2FwLTIuYwo+IAo+ID4rLyogQ2hlY2sgdG8gZW5zdXJlIHRoZSB2b2xpdGlsZSBsb2Fk
IGRvZXMgbm90IGdldCB6ZXJvIGV4dGVuZGVkLiAgKi8KPiAKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVND
QGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGlu
Zm8vb3BlbnJpc2MK
