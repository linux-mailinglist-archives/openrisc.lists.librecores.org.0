Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 7B13E170D3C
	for <lists+openrisc@lfdr.de>; Thu, 27 Feb 2020 01:31:12 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2A13120917;
	Thu, 27 Feb 2020 01:31:12 +0100 (CET)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by mail.librecores.org (Postfix) with ESMTPS id A416720917
 for <openrisc@lists.librecores.org>; Thu, 27 Feb 2020 01:31:10 +0100 (CET)
Received: by mail-pg1-f195.google.com with SMTP id h8so480266pgs.9
 for <openrisc@lists.librecores.org>; Wed, 26 Feb 2020 16:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=2MwKceVB/8T/fWJxXCvPWmKs+5MAIGdSRlEhKMQMaSM=;
 b=CWajb/K7LI9FjAaB0ca4YN4TLt9eR/If8M1yvhaNyiG6fGghZi0c8rTuJyMJjpny6R
 zlFiY3Czt/oeHzrLsGWTOz5PhcCoQF941tW9fR370DJobzH/WlSEhwCuiQNctzOtm3/n
 8uj6wSTdA5b8qWK7CXc2dJoPQFWNADxjn5Y8pRtYfjVYwZhV4wRkAfgQbGQT8xhG1wZo
 ge0eOtm0w49qYCGDiYbfkbBWEb8++va1VITOpE+CZSSN+XPdLgxqDk1ccXlWGKivtl6l
 seszXaJphBaiEX+gy2tPdTHkbCVxSOUknbnD+JZg6CYIE5/1EWxeQC8gMVV1nHVD2GKg
 77RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2MwKceVB/8T/fWJxXCvPWmKs+5MAIGdSRlEhKMQMaSM=;
 b=KHh2YfQ2c5qSyKy54NNniew7uwMJphGrUXdFpEzCMj7zGlVGL/mcj5XeHisu7kjtxV
 blo+1utv0cLlmBr76ZiTSxYD5qHthwHQEs0Ie0bYP0JFz6HCAl73u1v+5LPpv9SyyMXX
 RwZqf8DLSRZYqoQi5CVfiTGOT6y/++JdEPhs2+xNQvA2hj97n2k8xiES53gFHEQwuU2H
 2bXTFIsRT4N2MdHr3/RuLyoR25E5vxdMSEgcTu3Gwo4YD9L+LKDza5zUXndO1EsLCWnI
 0ySTciC3c8LRbomuqq7Bz8ocPyL1H6RDp7STyYrROS/0jfWAXNuIkduiuhAKuNWbWkV8
 GLaA==
X-Gm-Message-State: APjAAAWdbKpvOOBF50We/l1V4h5x4w1dNH0akZ7TmUEDAdJnvntuQX/J
 AbnPlwPIgOflC/wt1zRb7qE=
X-Google-Smtp-Source: APXvYqy/7+8GLTujZKTC42dcivzJjldCPEFcGAmU/tIcSVJCbWe+v3OrlH0R3oIU05xe26KG1Ud3Qg==
X-Received: by 2002:a63:ed01:: with SMTP id d1mr1271350pgi.95.1582763467915;
 Wed, 26 Feb 2020 16:31:07 -0800 (PST)
Received: from localhost (g183.222-224-185.ppp.wakwak.ne.jp. [222.224.185.183])
 by smtp.gmail.com with ESMTPSA id x65sm4612875pfb.171.2020.02.26.16.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 16:31:07 -0800 (PST)
Date: Thu, 27 Feb 2020 09:31:05 +0900
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>,
 Openrisc <openrisc@lists.librecores.org>
Message-ID: <20200227003105.GF7926@lianli.shorne-pla.net>
References: <20200226225625.28935-1-shorne@gmail.com>
 <20200226225625.28935-2-shorne@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200226225625.28935-2-shorne@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [OpenRISC] [PATCH 1/3] openrisc: Convert copy_thread to
 copy_thread_tls
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
Cc: Jonas Bonn <jonas@southpole.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Christian Brauner <christian@brauner.io>, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCBGZWIgMjcsIDIwMjAgYXQgMDc6NTY6MjNBTSArMDkwMCwgU3RhZmZvcmQgSG9ybmUg
d3JvdGU6Cj4gVGhpcyBpcyByZXF1aXJlZCBmb3IgY2xvbmUzIHdoaWNoIHBhc3NlcyB0aGUgVExT
IHZhbHVlIHRocm91Z2ggYQo+IHN0cnVjdCByYXRoZXIgdGhhbiBhIHJlZ2lzdGVyLgoKWy4uLl0K
IAo+IGRpZmYgLS1naXQgYS9hcmNoL29wZW5yaXNjL2tlcm5lbC9wcm9jZXNzLmMgYi9hcmNoL29w
ZW5yaXNjL2tlcm5lbC9wcm9jZXNzLmMKPiBpbmRleCBiMDZmODRmNjY3NmYuLjY2OTVmMTY3ZTEy
NiAxMDA2NDQKPiAtLS0gYS9hcmNoL29wZW5yaXNjL2tlcm5lbC9wcm9jZXNzLmMKPiArKysgYi9h
cmNoL29wZW5yaXNjL2tlcm5lbC9wcm9jZXNzLmMKPiBAQCAtMTE3LDEyICsxMTcsMTMgQEAgdm9p
ZCByZWxlYXNlX3RocmVhZChzdHJ1Y3QgdGFza19zdHJ1Y3QgKmRlYWRfdGFzaykKPiAgZXh0ZXJu
IGFzbWxpbmthZ2Ugdm9pZCByZXRfZnJvbV9mb3JrKHZvaWQpOwo+ICAKPiAgLyoKPiAtICogY29w
eV90aHJlYWQKPiArICogY29weV90aHJlYWRfdGxzCj4gICAqIEBjbG9uZV9mbGFnczogZmxhZ3MK
PiAgICogQHVzcDogdXNlciBzdGFjayBwb2ludGVyIG9yIGZuIGZvciBrZXJuZWwgdGhyZWFkCj4g
ICAqIEBhcmc6IGFyZyB0byBmbiBmb3Iga2VybmVsIHRocmVhZDsgYWx3YXlzIE5VTEwgZm9yIHVz
ZXJzcGFjZSB0aHJlYWQKPiAgICogQHA6IHRoZSBuZXdseSBjcmVhdGVkIHRhc2sKPiAgICogQHJl
Z3M6IENQVSBjb250ZXh0IHRvIGNvcHkgZm9yIHVzZXJzcGFjZSB0aHJlYWQ7IGFsd2F5cyBOVUxM
IGZvciBrdGhyZWFkCj4gKyAqIEB0bHM6IHRoZSBUaHJlYWQgTG9jYWwgU3RvcmF0ZSBwb2ludGVy
IGZvciB0aGUgbmV3IHByb2Nlc3MKClRoaXMgc2hvdWxkIGJlICpTdG9yYWdlKi4KIApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5n
IGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNv
cmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
