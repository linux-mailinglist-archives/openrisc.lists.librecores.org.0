Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D4CD52460DD
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:46:46 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9353E20EB7;
	Mon, 17 Aug 2020 10:46:46 +0200 (CEST)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by mail.librecores.org (Postfix) with ESMTPS id A745E20CAD
 for <openrisc@lists.librecores.org>; Tue,  4 Aug 2020 22:46:12 +0200 (CEST)
Received: by mail-ej1-f68.google.com with SMTP id kq25so30994910ejb.3
 for <openrisc@lists.librecores.org>; Tue, 04 Aug 2020 13:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JkYcaggsGpcDWWPmcXd4JLlQeabzirm750hdjJEVhuE=;
 b=NFg4cddveDkJRaT1O3RuBGLGAnrKH5WS9QKSCol+urjsTiuPILUDsu2qHvIeGvmLZ7
 AWv+dqZp+ggBIBhCmlj/dhWBVfER342c908cQgR43cNevS278v8mPTqDnS7tFQPPI5ww
 0GTMHUZTW6oF7Vwz76ilfFm73ybFJNJ6rEwTxyixKG7b6bq1YJt4kSLY9n9xZOkm9GsA
 Ms3trDIpC1buR1fQsncoCu5fBb+/ZfZTnIFQ2mKOkNppcVA5uH6Iy+VT47X6Eph1VOxy
 8xECIF/WyUUaRndvro2duUlC7pL0ilZAE0eC7zsuhY2oRYLgdwQDK96xLtZRKCd3F+U+
 PQuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JkYcaggsGpcDWWPmcXd4JLlQeabzirm750hdjJEVhuE=;
 b=fPEQceNOnWX0bAOwbjY8VRkNZ2g0UuSJ/v0TYkNlHJr0aD+WgjJ9vn6qZd59MUUNcT
 HqHtyo14BeNjMYa2c/K0HcguZ9HHoc5ALyyJ6COB+oL+QOYbEpFl3vVh3BM0KoUjMA20
 hK7lgkyShIjKEYmMK3LKgv5ahsBjQavznlDYw3heQ/zDFjNGSLlffulE7IDkW61EONHD
 MNyK2eW0E8fYZCGrrnvzjpymLJZKX4PaTfGADAK0RaDYeSXfoZVw2tMd5SdkYKfwRaPu
 JdtM/GBDhvxLcuEugIXEa6mDNBa3VM4MIbFZ1bmjor2tdeTpGjMQVyKAWz3HmsvKTYJ3
 dttw==
X-Gm-Message-State: AOAM532T5qE05pFB01+fsMEC8E0i/SlM5KY7f1KxXLOL3uL+aTRPcljq
 FGjtwqHPdC7SrE9BjX/1hkc=
X-Google-Smtp-Source: ABdhPJyJT3XUe9lccfmgoNsSMRHEfwHQ577N9kfOoJ/bFHSN6uqY4hLXGO1yPEfJygTyEl+Xt0QxSQ==
X-Received: by 2002:a17:906:c08a:: with SMTP id
 f10mr22883770ejz.181.1596573972287; 
 Tue, 04 Aug 2020 13:46:12 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:a7fb:e200:d068:a44f:fa3b:62da])
 by smtp.gmail.com with ESMTPSA id i9sm38188ejb.48.2020.08.04.13.46.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 13:46:11 -0700 (PDT)
Date: Tue, 4 Aug 2020 22:46:10 +0200
From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To: Stafford Horne <shorne@gmail.com>
Message-ID: <20200804204610.mxzw6ahdnfw6yko2@ltop.local>
References: <20200804042354.3930694-1-shorne@gmail.com>
 <20200804042354.3930694-3-shorne@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200804042354.3930694-3-shorne@gmail.com>
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:38 +0200
Subject: Re: [OpenRISC] [PATCH 2/6] openrisc: uaccess: Fix sparse address
 space warnings
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

T24gVHVlLCBBdWcgMDQsIDIwMjAgYXQgMDE6MjM6NTBQTSArMDkwMCwgU3RhZmZvcmQgSG9ybmUg
d3JvdGU6Cj4gVGhlIE9wZW5SSVNDIHVzZXIgYWNjZXNzIGZ1bmN0aW9ucyBwdXRfdXNlcigpLCBn
ZXRfdXNlcigpIGFuZAo+IGNsZWFyX3VzZXIoKSB3ZXJlIG1pc3NpbmcgcHJvcGVyIHNwYXJzZSBh
bm5vdGF0aW9ucy4gIFRoaXMgZ2VuZXJhdGVkCj4gd2FybmluZ3MgbGlrZSB0aGUgYmVsb3cuCj4g
Cj4gVGhpcyBwYXRjaCBhZGRzIHRoZSBhbm5vdGF0aW9ucyB0byBmaXggdGhlIHdhcm5pbmdzLgo+
IAo+IEV4YW1wbGUgd2FybmluZ3M6Cj4gCj4gbmV0L2lwdjQvaXBfc29ja2dsdWUuYzo3NTk6Mjk6
IHdhcm5pbmc6IGluY29ycmVjdCB0eXBlIGluIGFyZ3VtZW50IDEgKGRpZmZlcmVudCBhZGRyZXNz
IHNwYWNlcykKPiBuZXQvaXB2NC9pcF9zb2NrZ2x1ZS5jOjc1OToyOTogICAgZXhwZWN0ZWQgdm9p
ZCBjb25zdCB2b2xhdGlsZSBbbm9kZXJlZl0gX191c2VyICoKPiBuZXQvaXB2NC9pcF9zb2NrZ2x1
ZS5jOjc1OToyOTogICAgZ290IGludCBjb25zdCAqX19ndV9hZGRyCj4gbmV0L2lwdjQvaXBfc29j
a2dsdWUuYzo3NjQ6Mjk6IHdhcm5pbmc6IGluY29ycmVjdCB0eXBlIGluIGluaXRpYWxpemVyIChk
aWZmZXJlbnQgYWRkcmVzcyBzcGFjZXMpCj4gbmV0L2lwdjQvaXBfc29ja2dsdWUuYzo3NjQ6Mjk6
ICAgIGV4cGVjdGVkIHVuc2lnbmVkIGNoYXIgY29uc3QgKl9fZ3VfYWRkcgo+IG5ldC9pcHY0L2lw
X3NvY2tnbHVlLmM6NzY0OjI5OiAgICBnb3QgdW5zaWduZWQgY2hhciBbbm9kZXJlZl0gX191c2Vy
ICoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4K
Ckxvb2sgZ29vZCB0byBtZS4KCi0tIEx1YwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGli
cmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlz
Ywo=
