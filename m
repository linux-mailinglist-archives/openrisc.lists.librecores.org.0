Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 3A29225C2A7
	for <lists+openrisc@lfdr.de>; Thu,  3 Sep 2020 16:31:43 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C6A8B20CB5;
	Thu,  3 Sep 2020 16:31:42 +0200 (CEST)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by mail.librecores.org (Postfix) with ESMTPS id 1EB0C20BD3
 for <openrisc@lists.librecores.org>; Thu,  3 Sep 2020 16:31:40 +0200 (CEST)
Received: by mail-pf1-f193.google.com with SMTP id m8so2490343pfh.3
 for <openrisc@lists.librecores.org>; Thu, 03 Sep 2020 07:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=oFkfi9X0bSyXN4Ol4NwfhYQ7K4ImI2pu3/xQMs0Xbv0=;
 b=MKcs7Qp8KGb5+t9fJnG083u4Kx6jssLPOPuGjGnViTuBwYXUYj8SkxVu8TxvG+761V
 5jrmqvo5emK3h8WHpzZmo8kS5n6YpWxfdwzpUWLSnNpCl7HwfAbXFjVyuiEvxu52rM+j
 +CFROzDjJI50NcZoCXs8L4qBWmoLZs+5/AkbOCFND0nfn3KRlAeoNd8AW3w8q68Zs2P9
 zsNWJG8wLxAu7hZH/mIVYkmj02yfDn7D6TYV8WCac1RKjWV5gb1GF9qXq7r0U01Vu6wN
 qMLWn8c7JX6P5kzXgnpEbs+WyooB9h+Cov7neLg4lwjLL31c6ZRjiH6LeiiU6X561wbU
 UtBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oFkfi9X0bSyXN4Ol4NwfhYQ7K4ImI2pu3/xQMs0Xbv0=;
 b=RGWN7BhZqDuzL4epuCS3F55ftBkOkzdxXFOXshhFL992ZrakmFgYnRHQ++GUdorcMF
 v0jrPw+2S5xy0c7f1oa6zzMtexbTk2T9PKP4mQn8X9XRwW5MdCkOBV89Si4eQJJnAsAv
 jecOrhp9SZ33xzat/4iNxFWguocleAHPVIPzk7HckoOEPermtqpWdsnUtltGQicDfY4Z
 K1OTMl2HgXBTn1wjxlGEUtA+FUn1svI/eUG8ALuZTeul6SQUSLbaBWyd+d6gcJemh6+f
 bYn3leZhx+78zoOakPK3PUaylzg0J6Ac+i7IJYvNz4ssGGSE1o0zB/Bg7sVbaNFaIddc
 /+pA==
X-Gm-Message-State: AOAM531C/h0DXGDXz1tPHi3LQ4eOc09U9gKIpXY/UK4SOt7hCnBlCtKc
 be1xQ7zgV6+Fk/SucbgphgI=
X-Google-Smtp-Source: ABdhPJwlYk90RS7DiBtFzKRDGKn9wXHh7hXxCQNlalKw2n+V/V5fU5hw8dP94ZQaoDksnGg07uKbtA==
X-Received: by 2002:a05:6a00:811:: with SMTP id
 m17mr4053548pfk.20.1599143498199; 
 Thu, 03 Sep 2020 07:31:38 -0700 (PDT)
Received: from localhost (g223.115-65-55.ppp.wakwak.ne.jp. [115.65.55.223])
 by smtp.gmail.com with ESMTPSA id n1sm3489776pfu.154.2020.09.03.07.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 07:31:37 -0700 (PDT)
Date: Thu, 3 Sep 2020 23:31:35 +0900
From: Stafford Horne <shorne@gmail.com>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20200903143135.GD3562056@lianli.shorne-pla.net>
References: <20200831212102.4014642-1-shorne@gmail.com>
 <20200901055924.GC432455@kernel.org>
 <20200901102044.GB3562056@lianli.shorne-pla.net>
 <20200901121130.GA698558@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200901121130.GA698558@kernel.org>
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

T24gVHVlLCBTZXAgMDEsIDIwMjAgYXQgMDM6MTE6MzBQTSArMDMwMCwgTWlrZSBSYXBvcG9ydCB3
cm90ZToKPiBPbiBUdWUsIFNlcCAwMSwgMjAyMCBhdCAwNzoyMDo0NFBNICswOTAwLCBTdGFmZm9y
ZCBIb3JuZSB3cm90ZToKPiA+IE9uIFR1ZSwgU2VwIDAxLCAyMDIwIGF0IDA4OjU5OjI0QU0gKzAz
MDAsIE1pa2UgUmFwb3BvcnQgd3JvdGU6Cj4gPiA+IE9uIFR1ZSwgU2VwIDAxLCAyMDIwIGF0IDA2
OjIxOjAxQU0gKzA5MDAsIFN0YWZmb3JkIEhvcm5lIHdyb3RlOgo+ID4gPiA+IFJlY2VudGx5IE9w
ZW5SSVNDIGFkZGVkIHN1cHBvcnQgZm9yIGV4dGVybmFsIGluaXRyZCBpbWFnZXMsIGJ1dCBJIGZv
dW5kCj4gPiA+ID4gc29tZSBpbnN0YWJpbGl0eSB3aGVuIHVzaW5nIGxhcmdlciBidWlsZHJvb3Qg
aW5pdHJkIGltYWdlcy4gSXQgdHVybmVkCj4gPiA+ID4gb3V0IHRoYXQgSSBmb3Jnb3QgdG8gcmVz
ZXJ2ZSB0aGUgbWVtYmxvY2sgc3BhY2UgZm9yIHRoZSBpbml0cmQgaW1hZ2UuCj4gPiA+ID4gCj4g
PiA+ID4gVGhpcyBwYXRjaCBmaXhlcyB0aGUgaW5zdGFiaWxpdHkgaXNzdWUgYnkgcmVzZXJ2aW5n
IG1lbWJsb2NrIHNwYWNlLgo+ID4gPiA+IAo+ID4gPiA+IEZpeGVzOiBmZjZjOTIzZGJlYzMgKCJv
cGVucmlzYzogQWRkIHN1cHBvcnQgZm9yIGV4dGVybmFsIGluaXRyZCBpbWFnZXMiKQo+ID4gPiA+
IFNpZ25lZC1vZmYtYnk6IFN0YWZmb3JkIEhvcm5lIDxzaG9ybmVAZ21haWwuY29tPgo+ID4gPiA+
IC0tLQo+ID4gPiA+ICBhcmNoL29wZW5yaXNjL2tlcm5lbC9zZXR1cC5jIHwgOSArKysrKysrKysK
PiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQo+ID4gPiA+IAo+ID4gPiA+
IGRpZmYgLS1naXQgYS9hcmNoL29wZW5yaXNjL2tlcm5lbC9zZXR1cC5jIGIvYXJjaC9vcGVucmlz
Yy9rZXJuZWwvc2V0dXAuYwo+ID4gPiA+IGluZGV4IGIxOGU3NzVmOGJlMy4uMmM4YWE1M2NjN2Jh
IDEwMDY0NAo+ID4gPiA+IC0tLSBhL2FyY2gvb3BlbnJpc2Mva2VybmVsL3NldHVwLmMKPiA+ID4g
PiArKysgYi9hcmNoL29wZW5yaXNjL2tlcm5lbC9zZXR1cC5jCj4gPiA+ID4gQEAgLTgwLDYgKzgw
LDE1IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBzZXR1cF9tZW1vcnkodm9pZCkKPiA+ID4gPiAgCSAq
Lwo+ID4gPiA+ICAJbWVtYmxvY2tfcmVzZXJ2ZShfX3BhKF9zdGV4dCksIF9lbmQgLSBfc3RleHQp
Owo+ID4gPiA+ICAKPiA+ID4gPiArI2lmZGVmIENPTkZJR19CTEtfREVWX0lOSVRSRAo+ID4gPiA+
ICsJLyogVGhlbiByZXNlcnZlIHRoZSBpbml0cmQsIGlmIGFueSAqLwo+ID4gPiA+ICsJaWYgKGlu
aXRyZF9zdGFydCAmJiAoaW5pdHJkX2VuZCA+IGluaXRyZF9zdGFydCkpIHsKPiA+ID4gPiArIAlt
ZW1ibG9ja19yZXNlcnZlKEFMSUdOX0RPV04oX19wYShpbml0cmRfc3RhcnQpLCBQQUdFX1NJWkUp
LAo+ID4gPiA+ICsJCUFMSUdOKGluaXRyZF9lbmQsIFBBR0VfU0laRSkgLQo+ID4gPiA+ICsJCUFM
SUdOX0RPV04oaW5pdHJkX3N0YXJ0LCBQQUdFX1NJWkUpKTsKPiA+ID4gPiArCX0KPiA+ID4gCj4g
PiA+IFRoZSBjb3JlIG1tIHRha2VzIGNhcmUgb2YgcmVzZXJ2aW5nIHRoZSBlbnRyaXJlIHBhZ2Vz
IGZvciB0aGUgbWVtb3J5Cj4gPiA+IHJlc2VydmVkIHdpdGggbWVtYmxvY2ssIHNvIGl0IGlzIG5v
dCBuZWNlc3NhcnkgdG8gZG8gaXQgaGVyZS4KPiA+IAo+ID4gVGhhbmtzIGZvciB0aGUgcG9pbnRl
cgo+ID4gCj4gPiBJIGd1ZXNzIHdoYXQgeW91IG1lYW4gaXMgaXQgaXMgbm90IHJlcXVpcmVkIHRv
IGRvIHRoZSBwYWdlIGFsaWdubWVudC4KPiAKPiBSaWdodC4gCj4gCj4gPiBJIHVzZWQgb3RoZXIg
YXJjaGl0ZWN0dXJlcyBhcyBhbiBleGFtcGxlIGFuZCBtb3N0IGRvIHRoZSBhbGlnbm1lbnQsIEkK
PiA+IHRoaW5rIGZvciBtb3N0IGFyY2hpdGVjdHVyZXMgdGhpcyBjYW4gYmUgcHVsbGVkIG91dCB0
byBnZW5lcmljIGNvZGUuCj4gCj4gWW91IGFyZSBtb3JlIHRoYW4gd2VsY29tZSA6KQo+IFdlIGFs
cmVhZHkgaGF2ZSBhIGdlbmVyaWMgZnJlZV9pbml0cmRfbWVtKCksIG1heWJlIGl0J3MgdGltZSB0
byBoYXZlIGEKPiBnZW5lcmljIHJlc2VydmVfaW5pdHJkX21lbSgpLgo+IAo+IEknbSBvayB3aXRo
IG9wZW5yaXNjIGRvaW5nIHRoZSBhbGlnbm1lbnQsIGJ1dCBJIHRoaW5rIHVzaW5nIGxvY2FsCj4g
dmFyaWFibGVzIHdvdWxkIG1ha2UgdGhlIGNvcmUgbW9yZSByZWFkYWJsZSwgZS5nCj4gCj4gCWlm
IChpbml0ZF9zdGFydCAmJiAoaW5pdHJkX2VuZCkpIHsKPiAJCXVuc2lnbmVkIGxvbmcgYWxpZ25l
ZF9zdGFydCA9IEFMSUdOX0RPV04oaW5pdHJkX3N0YXJ0LCBQQUdFX1NJWkUpOwo+IAkJdW5zaWdu
ZWQgbG9uZyBhbGlnbmVkX2VuZCA9IEFMSUdOKGVuZCwgUEFHRV9TSVpFKTsKPiAKPiAJCW1lbWJs
b2NrX3Jlc2VydmUoYWxpZ25lZF9zdGFydCwgYWxpZ25lZF9lbmQpOwo+IAl9Cj4gCj4gV2hhdCBk
byB5b3Ugc2F5PwoKV2VsbCwgaWYgdGhlIGFsaWdubWVudCBpcyBub3QgbmVlZGVkIEkgcmF0aGVy
IG5vdCBkbyBpdC4gIFRoYXQgd291bGQgbWFrZSB0aGUKY29kZSBhcyBzaW1wbGUgYXM6CgogICAg
ICAgIGlmIChpbml0cmRfc3RhcnQgJiYgKGluaXRyZF9lbmQgPiBpbml0cmRfc3RhcnQpKSB7CiAg
ICAgICAgICAgICAgICBtZW1ibG9ja19yZXNlcnZlKF9fcGEoaW5pdHJkX3N0YXJ0KSwgaW5pdHJk
X2VuZCAtIGluaXRyZF9zdGFydCk7CiAgICAgICAgfQoKTGV0IG1lIGxvb2sgd2hhdCBpcyBpbnZv
bHZlZCBpbiBtYWtpbmcgYSByZXNlcnZlX2luaXRyZF9tZW0oKS4KCi1TdGFmZm9yZAoKPiA+IC1T
dGFmZm9yZAo+ID4gCj4gPiA+ID4gKyNlbmRpZiAvKiBDT05GSUdfQkxLX0RFVl9JTklUUkQgKi8K
PiA+ID4gPiArCj4gPiA+ID4gIAllYXJseV9pbml0X2ZkdF9yZXNlcnZlX3NlbGYoKTsKPiA+ID4g
PiAgCWVhcmx5X2luaXRfZmR0X3NjYW5fcmVzZXJ2ZWRfbWVtKCk7Cj4gPiA+ID4gIAo+ID4gPiA+
IC0tIAo+ID4gPiA+IDIuMjYuMgo+ID4gPiA+IAo+ID4gPiAKPiA+ID4gLS0gCj4gPiA+IFNpbmNl
cmVseSB5b3VycywKPiA+ID4gTWlrZS4KPiAKPiAtLSAKPiBTaW5jZXJlbHkgeW91cnMsCj4gTWlr
ZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJ
U0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlz
dHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
