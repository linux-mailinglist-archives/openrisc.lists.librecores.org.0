Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A5F5C258CA5
	for <lists+openrisc@lfdr.de>; Tue,  1 Sep 2020 12:20:53 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B667920C4F;
	Tue,  1 Sep 2020 12:20:51 +0200 (CEST)
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by mail.librecores.org (Postfix) with ESMTPS id 25E1020899
 for <openrisc@lists.librecores.org>; Tue,  1 Sep 2020 12:20:49 +0200 (CEST)
Received: by mail-pj1-f66.google.com with SMTP id mm21so390524pjb.4
 for <openrisc@lists.librecores.org>; Tue, 01 Sep 2020 03:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mzeTFMKOo8l9sbsoHTHy+DYgTJIcAYGM2OFDh+7YnV4=;
 b=E7o8/lr3uAunH7766jfVTNlEN0CaV5kQIR+1FxqhDZDFBUwie7v0cdNC3ZbsBbTwDW
 +q4lKTh3I50jyruF0Kf3GRS8uJTb792Xm4Jhs2JT7Q2DnQ9BJ/xlCazanECpcRi870+o
 5abkQRfsQP/YV+g7FrifUOvzIYMibmvNZXSeHxQDlkWaCl/NXQfZ7mFLxEeaX+Pqilmi
 FqN1HbwLtcqnQ6Q3PvbJsdsNFIO0hQJVVQRMIFIA8hQazuz5wgoFXFAXszuUq3ER+nNs
 hZ2l+cWIInGBLtg8bGm5yxfNnX50WFaPlhD0IxIWcuzi63OxYbAB/jHesJXFf8vLDVZU
 WWbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mzeTFMKOo8l9sbsoHTHy+DYgTJIcAYGM2OFDh+7YnV4=;
 b=RerSoUOCY/b4bihyCv36RXrTsvtCR7zNyYwLx2lAeXmRi7ciOLpuRzJywLNpsRpejM
 bcJ2Z0uCeBr2iakOPueyVpfMbDN9b1wvik3WPk0gSsTulmDAQ8U/7gncej2CZY+Y5sxH
 8i/fUreMgchd1NvVSttrFZHTlw5trk2tBAfaz9RgZ1LOXmyoW7InL7kvBXvuwZPEeCv0
 cJZpuYFyoeKRwDGJzvDcOdhbZIfyXtT0I70EDkxHMS3Omh1NUPzfvVm5wFJ/RyFp1AHw
 ajInsxRwsnxuCZPh/x0oLcjd1S5/fYnN5Ah/ChGQ7xDY6jjAZ4LoN1lRMPFZwoVShPk1
 Lzzg==
X-Gm-Message-State: AOAM533eGrHlkNLXBDavfQo8aPpsqAAo9Ugvz/jt0gSLOgfiRM33uDuV
 8fDM119tkiaovuCTy7W2L+Q=
X-Google-Smtp-Source: ABdhPJyB/+mWYRD8yu0KCLSyy03GpQkyJPECT2gRsoK7qAVNUQZcl2UkP7yMDYVkplXnzcBddcvJcg==
X-Received: by 2002:a17:90a:4401:: with SMTP id s1mr863684pjg.79.1598955647085; 
 Tue, 01 Sep 2020 03:20:47 -0700 (PDT)
Received: from localhost (g223.115-65-55.ppp.wakwak.ne.jp. [115.65.55.223])
 by smtp.gmail.com with ESMTPSA id s67sm1352506pfs.117.2020.09.01.03.20.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 03:20:46 -0700 (PDT)
Date: Tue, 1 Sep 2020 19:20:44 +0900
From: Stafford Horne <shorne@gmail.com>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20200901102044.GB3562056@lianli.shorne-pla.net>
References: <20200831212102.4014642-1-shorne@gmail.com>
 <20200901055924.GC432455@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200901055924.GC432455@kernel.org>
Subject: Re: [OpenRISC] [PATCH] openrisc: Reserve memblock for initrd
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
 LKML <linux-kernel@vger.kernel.org>, Arvind Sankar <nivedita@alum.mit.edu>,
 openrisc@lists.librecores.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBTZXAgMDEsIDIwMjAgYXQgMDg6NTk6MjRBTSArMDMwMCwgTWlrZSBSYXBvcG9ydCB3
cm90ZToKPiBPbiBUdWUsIFNlcCAwMSwgMjAyMCBhdCAwNjoyMTowMUFNICswOTAwLCBTdGFmZm9y
ZCBIb3JuZSB3cm90ZToKPiA+IFJlY2VudGx5IE9wZW5SSVNDIGFkZGVkIHN1cHBvcnQgZm9yIGV4
dGVybmFsIGluaXRyZCBpbWFnZXMsIGJ1dCBJIGZvdW5kCj4gPiBzb21lIGluc3RhYmlsaXR5IHdo
ZW4gdXNpbmcgbGFyZ2VyIGJ1aWxkcm9vdCBpbml0cmQgaW1hZ2VzLiBJdCB0dXJuZWQKPiA+IG91
dCB0aGF0IEkgZm9yZ290IHRvIHJlc2VydmUgdGhlIG1lbWJsb2NrIHNwYWNlIGZvciB0aGUgaW5p
dHJkIGltYWdlLgo+ID4gCj4gPiBUaGlzIHBhdGNoIGZpeGVzIHRoZSBpbnN0YWJpbGl0eSBpc3N1
ZSBieSByZXNlcnZpbmcgbWVtYmxvY2sgc3BhY2UuCj4gPiAKPiA+IEZpeGVzOiBmZjZjOTIzZGJl
YzMgKCJvcGVucmlzYzogQWRkIHN1cHBvcnQgZm9yIGV4dGVybmFsIGluaXRyZCBpbWFnZXMiKQo+
ID4gU2lnbmVkLW9mZi1ieTogU3RhZmZvcmQgSG9ybmUgPHNob3JuZUBnbWFpbC5jb20+Cj4gPiAt
LS0KPiA+ICBhcmNoL29wZW5yaXNjL2tlcm5lbC9zZXR1cC5jIHwgOSArKysrKysrKysKPiA+ICAx
IGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9hcmNo
L29wZW5yaXNjL2tlcm5lbC9zZXR1cC5jIGIvYXJjaC9vcGVucmlzYy9rZXJuZWwvc2V0dXAuYwo+
ID4gaW5kZXggYjE4ZTc3NWY4YmUzLi4yYzhhYTUzY2M3YmEgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNo
L29wZW5yaXNjL2tlcm5lbC9zZXR1cC5jCj4gPiArKysgYi9hcmNoL29wZW5yaXNjL2tlcm5lbC9z
ZXR1cC5jCj4gPiBAQCAtODAsNiArODAsMTUgQEAgc3RhdGljIHZvaWQgX19pbml0IHNldHVwX21l
bW9yeSh2b2lkKQo+ID4gIAkgKi8KPiA+ICAJbWVtYmxvY2tfcmVzZXJ2ZShfX3BhKF9zdGV4dCks
IF9lbmQgLSBfc3RleHQpOwo+ID4gIAo+ID4gKyNpZmRlZiBDT05GSUdfQkxLX0RFVl9JTklUUkQK
PiA+ICsJLyogVGhlbiByZXNlcnZlIHRoZSBpbml0cmQsIGlmIGFueSAqLwo+ID4gKwlpZiAoaW5p
dHJkX3N0YXJ0ICYmIChpbml0cmRfZW5kID4gaW5pdHJkX3N0YXJ0KSkgewo+ID4gKwkJbWVtYmxv
Y2tfcmVzZXJ2ZShBTElHTl9ET1dOKF9fcGEoaW5pdHJkX3N0YXJ0KSwgUEFHRV9TSVpFKSwKPiA+
ICsJCQlBTElHTihpbml0cmRfZW5kLCBQQUdFX1NJWkUpIC0KPiA+ICsJCQlBTElHTl9ET1dOKGlu
aXRyZF9zdGFydCwgUEFHRV9TSVpFKSk7Cj4gPiArCX0KPiAKPiBUaGUgY29yZSBtbSB0YWtlcyBj
YXJlIG9mIHJlc2VydmluZyB0aGUgZW50cmlyZSBwYWdlcyBmb3IgdGhlIG1lbW9yeQo+IHJlc2Vy
dmVkIHdpdGggbWVtYmxvY2ssIHNvIGl0IGlzIG5vdCBuZWNlc3NhcnkgdG8gZG8gaXQgaGVyZS4K
ClRoYW5rcyBmb3IgdGhlIHBvaW50ZXIKCkkgZ3Vlc3Mgd2hhdCB5b3UgbWVhbiBpcyBpdCBpcyBu
b3QgcmVxdWlyZWQgdG8gZG8gdGhlIHBhZ2UgYWxpZ25tZW50LiAgSSB1c2VkCm90aGVyIGFyY2hp
dGVjdHVyZXMgYXMgYW4gZXhhbXBsZSBhbmQgbW9zdCBkbyB0aGUgYWxpZ25tZW50LCBJIHRoaW5r
IGZvciBtb3N0CmFyY2hpdGVjdHVyZXMgdGhpcyBjYW4gYmUgcHVsbGVkIG91dCB0byBnZW5lcmlj
IGNvZGUuCgotU3RhZmZvcmQKCj4gPiArI2VuZGlmIC8qIENPTkZJR19CTEtfREVWX0lOSVRSRCAq
Lwo+ID4gKwo+ID4gIAllYXJseV9pbml0X2ZkdF9yZXNlcnZlX3NlbGYoKTsKPiA+ICAJZWFybHlf
aW5pdF9mZHRfc2Nhbl9yZXNlcnZlZF9tZW0oKTsKPiA+ICAKPiA+IC0tIAo+ID4gMi4yNi4yCj4g
PiAKPiAKPiAtLSAKPiBTaW5jZXJlbHkgeW91cnMsCj4gTWlrZS4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5S
SVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlz
dGluZm8vb3BlbnJpc2MK
