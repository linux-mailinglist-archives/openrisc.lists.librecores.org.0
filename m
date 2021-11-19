Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id BCCB54579B7
	for <lists+openrisc@lfdr.de>; Sat, 20 Nov 2021 00:48:30 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A0A4F242B6;
	Sat, 20 Nov 2021 00:48:30 +0100 (CET)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mail.librecores.org (Postfix) with ESMTPS id 2AD4A24221
 for <openrisc@lists.librecores.org>; Sat, 20 Nov 2021 00:48:28 +0100 (CET)
Received: by mail-pl1-f172.google.com with SMTP id k4so9281737plx.8
 for <openrisc@lists.librecores.org>; Fri, 19 Nov 2021 15:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=P/qteH19xBRQm0sUxvoj1NItoraVN2nSK5ZIpx0RIA4=;
 b=ZN1e00H+lRQU5jVvVWP5LyyYTyb3TpsVU/BWC5Gh9GoaN9WKin7zjmlcve27722eDS
 gfT6vAgO/KESoP3dMc75z5We1ZBEd3lElcuTb8vt1HHnuKV9f1np8R/Q+DdfUPGq8Xut
 mvHcniXmqHamQWX/Palkd54DHOJ7FSY+BPT7GqveA91gZk89czRl85m1w+IboaK0lxlu
 ehIZCI2yJQnU4kx8ANlo159Tj/anbE7mvrar6LvBsi7gfsM0q6VFjpo7dAH2+WZZw2Ll
 CJrSUf7Q0r+iR7f5EPqaH+FPo66tIbKE5Pzq7kORn8mg3Nxi0NioEUfn/WLRj96+xvCK
 xwOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=P/qteH19xBRQm0sUxvoj1NItoraVN2nSK5ZIpx0RIA4=;
 b=p24tiz534FNShalkdsd5ESAifgrIQvqdCpoeJJZ1F7TEQuaBIsnE0/WGPzR20PyzBo
 aYPiWs6+sOnf72jVP7rZpq0fOpmGtE87C5AZsPGtrU53DsRe25AW5dukMgat+DXfTbYS
 xzVFAurOyewcd0ahGNF+prMmzl8blEGoeug7v2Bz581ZC5oZIJqIP+tPSfmFlM9Ui80e
 kugriEalp1zqP7fCrEyopfhrtgGV49b+nIdA/w02Z2COFj2kwp3D6jWK5+pZQVtpQkho
 1S+8wy8psmRHox3V2QZp8V299WPhIBWScxzNDO/ORf6tRodHQSZxROY6Gb94Nc973ywk
 LCoQ==
X-Gm-Message-State: AOAM532h53JFZECV1d2B0I7iwm5nGflfNwtunfAH3OjqS6PixKe0yVV9
 JUD/gNAsIq8LYdEhEcq2srg=
X-Google-Smtp-Source: ABdhPJxL3fOW5Ca7xS0BPExaVuRDX9pL7nF/MJFYvMzSS0VEefFcf6S1qfnlVavZ5e+GSNXruV99Jg==
X-Received: by 2002:a17:90a:f00e:: with SMTP id
 bt14mr4521559pjb.219.1637365706644; 
 Fri, 19 Nov 2021 15:48:26 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id d12sm560090pgf.19.2021.11.19.15.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 15:48:26 -0800 (PST)
Date: Sat, 20 Nov 2021 08:48:24 +0900
From: Stafford Horne <shorne@gmail.com>
To: Joseph Myers <joseph@codesourcery.com>
Message-ID: <YZg3yJRwXU6jc3n6@antec>
References: <20211113031639.2402161-1-shorne@gmail.com>
 <20211113031639.2402161-9-shorne@gmail.com>
 <alpine.DEB.2.22.394.2111182228580.1393807@digraph.polyomino.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2111182228580.1393807@digraph.polyomino.org.uk>
Subject: Re: [OpenRISC] [PATCH v2 08/13] or1k: Linux Syscall Interface
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

T24gVGh1LCBOb3YgMTgsIDIwMjEgYXQgMTA6Mjk6NTJQTSArMDAwMCwgSm9zZXBoIE15ZXJzIHdy
b3RlOgo+IE9uIFNhdCwgMTMgTm92IDIwMjEsIFN0YWZmb3JkIEhvcm5lIHZpYSBMaWJjLWFscGhh
IHdyb3RlOgo+IAo+ID4gZGlmZiAtLWdpdCBhL3N5c2RlcHMvdW5peC9zeXN2L2xpbnV4L29yMWsv
YXJjaC1zeXNjYWxsLmggYi9zeXNkZXBzL3VuaXgvc3lzdi9saW51eC9vcjFrL2FyY2gtc3lzY2Fs
bC5oCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMC4uMGU2N2U1
NmFiYQo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvc3lzZGVwcy91bml4L3N5c3YvbGludXgv
b3Ixay9hcmNoLXN5c2NhbGwuaAo+ID4gQEAgLTAsMCArMSwzMjAgQEAKPiA+ICsvKiBBVVRPR0VO
RVJBVEVEIGJ5IHVwZGF0ZS1zeXNjYWxsLWxpc3RzLnB5LiAgKi8KPiAKPiBUaGlzIGZpbGUgc2Vl
bXMgdG8gYmUgbWlzc2luZyBhIGRlZmluaXRpb24gb2YgX19OUl9wcm9jZXNzX21yZWxlYXNlLiAg
TWFrZSAKPiBzdXJlIHlvdSByZWdlbmVyYXRlIGl0IHdpdGggTGludXggNS4xNSwgdGhlIGN1cnJl
bnQgdmVyc2lvbiB1c2VkIGZvciAKPiBzeXNjYWxsIGxpc3RzIGluIGdsaWJjLgoKUmlnaHQsIEkg
d2lsbCB1cGRhdGUuICBJIGhhdmUgYmVlbiB0cnlpbmcgdG8gcGxheSBjYXRjaCB1cCB3aXRoIHVw
c3RyZWFtLCBJCmRpZG4ndCB1cGRhdGUgdGhpcyB5ZXQuCgotU3RhZmZvcmQKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0
Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5v
cmcvbGlzdGluZm8vb3BlbnJpc2MK
