Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 9809C308FEB
	for <lists+openrisc@lfdr.de>; Fri, 29 Jan 2021 23:16:51 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 4A0A720F45;
	Fri, 29 Jan 2021 23:16:51 +0100 (CET)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mail.librecores.org (Postfix) with ESMTPS id 7B8A720F45
 for <openrisc@lists.librecores.org>; Fri, 29 Jan 2021 23:16:48 +0100 (CET)
Received: by mail-pj1-f47.google.com with SMTP id l18so7103899pji.3
 for <openrisc@lists.librecores.org>; Fri, 29 Jan 2021 14:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KRdVj8aDHVVWjYR6nci89gkQtpmD5ypYkI2gm5mcuf4=;
 b=Pw7iqrICxBPTIMPeUWRHhbCw5REf5ZKOgix+DO/BQJK7JhhzhxFa5JfSMWTjcQfpGd
 QwW8D2wrNIir8wvWk80dTmyR6T/JtvzhL7EmZvg8+4WR4hUwk1HQEkigD1GyzUKvJvvJ
 KW6gZFbYAIx0JbKeR8yk7E+NcUOGmo0d3+U5sR9oZG3yoygvvN6sogM6vfSN5VJZ6HxD
 o5+dd/GVAlobFtKFqf5n5YDpqDwCdyHXteN1WmksawHnXjctR8YcLX4ws2jhS0M87TrV
 uZNQr9oCuNv6uToQElt5rmm339VizL0H7h/OD9vqTzKd/yuQwaqgMT8UALxmEeVRSv+8
 VAPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KRdVj8aDHVVWjYR6nci89gkQtpmD5ypYkI2gm5mcuf4=;
 b=i0JGmBVGyhSYZPTs6P8j4LhpnUOe/pW8IPeIeDoMKYmq9ry8splkql1iAqo5aPeFnD
 K1TlJ22tERkd3ORYSTGz69K+a7AHxJ9L409lQCk2bOU+nhp6YoxffNbhTEhLJshe1isr
 6poIUsYJI6bipsZc0lrHeKcGRHpe59Un91IMIYPiuk7EZZFuk75Eguit97h5iSgx+AIo
 tvF5AhPWWDkU7H6nCIhAcGOmj6La1LbEtTCLm4NtOUKIJLJxIMA8sdo7YEYeqQjHhdh4
 BbgCntXrfbbeO5MtCKgklBNe7ML0DqrNnlzUnTmrm4aAlkD58smlrQ+TD38wEbrqtr0V
 DUhg==
X-Gm-Message-State: AOAM533OVkXj0jtXqh55FFSMcCb/1JcNSdsD/1mv1+VX+d0mfgQfFF+o
 q2waMLO74IjJeGsIMZiGsJ0=
X-Google-Smtp-Source: ABdhPJz91JOpUKxsFKCybaYKoGDzZ4Q6GylJHaJD3+kia44hVpbDtI3Ew7wt8R9csq+W1O1fe3CO5g==
X-Received: by 2002:a17:903:228a:b029:da:d645:ab58 with SMTP id
 b10-20020a170903228ab02900dad645ab58mr6516799plh.25.1611958606857; 
 Fri, 29 Jan 2021 14:16:46 -0800 (PST)
Received: from localhost (g54.222-224-210.ppp.wakwak.ne.jp. [222.224.210.54])
 by smtp.gmail.com with ESMTPSA id
 101sm8596927pjo.38.2021.01.29.14.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 14:16:46 -0800 (PST)
Date: Sat, 30 Jan 2021 07:16:43 +0900
From: Stafford Horne <shorne@gmail.com>
To: Jan Henrik Weinstock <jan.weinstock@rwth-aachen.de>
Message-ID: <20210129221643.GZ2002709@lianli.shorne-pla.net>
References: <0b26eda7-229d-3dc9-f2ae-19b9212fb0ea@rwth-aachen.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0b26eda7-229d-3dc9-f2ae-19b9212fb0ea@rwth-aachen.de>
Subject: Re: [OpenRISC] [PATCH] openrisc: use device tree to determine
 present cpus
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
Cc: jonas@southpole.se, openrisc@lists.librecores.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gRnJpLCBKYW4gMjksIDIwMjEgYXQgMDc6Mjk6MzFQTSArMDEwMCwgSmFuIEhlbnJpayBXZWlu
c3RvY2sgd3JvdGU6Cj4gVGhpcyBwYXRjaCBwcm9wb3NlcyB0byB1c2UgdGhlIGRldmljZSB0cmVl
IHRvIGRldGVybWluZSB0aGUgcHJlc2VudCBjcHVzCj4gaW5zdGVhZCBvZiBhc3N1bWluZyBhbGwg
Q09ORklHX05SQ1BVUyBhcmUgYWN0dWFsbHkgcHJlc2VudCBpbiB0aGUgc3lzdGVtLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEphbiBIZW5yaWsgV2VpbnN0b2NrIDxqYW4ud2VpbnN0b2NrQHJ3dGgtYWFj
aGVuLmRlPgo+IC0tLQo+ICBhcmNoL29wZW5yaXNjL2tlcm5lbC9zbXAuYyB8IDE4ICsrKysrKysr
KysrKysrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9rZXJuZWwvc21wLmMgYi9hcmNo
L29wZW5yaXNjL2tlcm5lbC9zbXAuYwo+IGluZGV4IDI5YzgyZWYyZS4uNzViZTdlMzRmIDEwMDY0
NAo+IC0tLSBhL2FyY2gvb3BlbnJpc2Mva2VybmVsL3NtcC5jCj4gKysrIGIvYXJjaC9vcGVucmlz
Yy9rZXJuZWwvc21wLmMKPiBAQCAtMTYsNiArMTYsNyBAQAo+ICAjaW5jbHVkZSA8bGludXgvc2No
ZWQuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3NjaGVkL21tLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9p
cnEuaD4KPiArI2luY2x1ZGUgPGxpbnV4L29mLmg+Cj4gICNpbmNsdWRlIDxhc20vY3B1aW5mby5o
Pgo+ICAjaW5jbHVkZSA8YXNtL21tdV9jb250ZXh0Lmg+Cj4gICNpbmNsdWRlIDxhc20vdGxiZmx1
c2guaD4KPiBAQCAtNjgsMTQgKzY5LDI1IEBAIHZvaWQgX19pbml0IHNtcF9pbml0X2NwdXModm9p
ZCkKPiAKPiAgdm9pZCBfX2luaXQgc21wX3ByZXBhcmVfY3B1cyh1bnNpZ25lZCBpbnQgbWF4X2Nw
dXMpCj4gIHsKPiAtCWludCBpOwo+ICsJdTMyIGNwdV9pZDsKPiArCXN0cnVjdCBkZXZpY2Vfbm9k
ZSAqY3B1LCAqY3B1czsKPiAKPiAgCS8qCj4gIAkgKiBJbml0aWFsaXNlIHRoZSBwcmVzZW50IG1h
cCwgd2hpY2ggZGVzY3JpYmVzIHRoZSBzZXQgb2YgQ1BVcwo+ICAJICogYWN0dWFsbHkgcG9wdWxh
dGVkIGF0IHRoZSBwcmVzZW50IHRpbWUuCj4gIAkgKi8KPiAtCWZvciAoaSA9IDA7IGkgPCBtYXhf
Y3B1czsgaSsrKQo+IC0JCXNldF9jcHVfcHJlc2VudChpLCB0cnVlKTsKPiArCWNwdXMgPSBvZl9m
aW5kX25vZGVfYnlfcGF0aCgiL2NwdXMiKTsKPiArCWZvcl9lYWNoX2NoaWxkX29mX25vZGUoY3B1
cywgY3B1KSB7Cj4gKwkJaWYgKG9mX3Byb3BlcnR5X3JlYWRfdTMyKGNwdSwgInJlZyIsICZjcHVf
aWQpKSB7Cj4gKwkJCXByX3dhcm4oIiVzIG1pc3NpbmcgcmVnIHByb3BlcnR5IiwgY3B1LT5mdWxs
X25hbWUpOwo+ICsJCQljb250aW51ZTsKPiArCQl9Cj4gKwo+ICsJCWlmIChjcHVfaWQgPj0gbWF4
X2NwdXMpCj4gKwkJCWNvbnRpbnVlOwo+ICsKPiArCQlzZXRfY3B1X3ByZXNlbnQoY3B1X2lkLCB0
cnVlKTsKPiArCX0KCkhlbGxvLCBJIGxvb2tlZCBpbnRvIHdoYXQgb3RoZXIgYXJjaGl0ZWN0dXJl
cyBkby4gIFJpc2MtViBkb2VzIHNvbWV0aGluZyBzaW1pbGFyCmJ1dCBpdCBkb2VzIHRoZSBzZXR1
cCBpbiAyIHBhcnRzOgoKIC0gaXQgdXNlcyB0aGUgZGV2aWNlIHRyZWUgdG8gc2V0IHBvc3NpYmxl
IENQVSdzIGluIHNldHVwX3NtcC4gVXNpbmcKICAgZm9yX2VhY2hfb2ZfY3B1X25vZGUgYW5kIHNl
dF9jcHVfcG9zc2libGUuCgogLSBUaGVuIGluIHNtcF9wcmVwYXJlX2NwdXMsIGl0IGxvb3BzIG92
ZXIgcG9zc2libGUgY3B1cyB3aXRoCiAgIGZvcl9lYWNoX3Bvc3NpYmxlX2NwdS4KCk5vdGUsIGl0
IHNlZW1zIHJpc2MtdiBkb2VzJ3QgYWN0dWFsbHkgY2hlY2sgbWF4X2NwdXMgd2hlbiBzZXR0aW5n
CnNldF9jcHVfcHJlc2VudCB3aGljaCBtYXkgYmUgYSBidWcuCgpJIHRoaW5rIHRoZSB0d28gcGFy
dCBhcHByb2FjaCBpcyB3aGF0IHdlIHdhbnQgdG8gZG86CgogLSB3ZSBzaG91bGQgZG8gc2V0X2Nw
dV9wb3NzaWJsZSBpbiBzbXBfaW5pdF9jcHVzIGJhc2VkIG9uIGRldmljZSB0cmVlLgogICBCYXNp
Y2FsbHkgdGhlIHNhbWUgYXMgeW91ciBsb29wIGFib3ZlIGJ1dCB1c2luZyBmb3JfZWFjaF9vZl9j
cHVfbm9kZQogICBhbmQgTlJfQ1BVUy4KIC0gd2UgY2FuIHRoZW4gZG8gc2V0X2NwdV9wcmVzZW50
IHVzaW5nIGZvcl9lYWNoX3Bvc3NpYmxlX2NwdSBpbgogICBzbXBfcHJlcGFyZV9jcHVzLgoKV2hh
dCBkbyB5b3UgdGhpbms/CgotU3RhZmZvcmQKCj4gIH0KPiAKPiAgdm9pZCBfX2luaXQgc21wX2Nw
dXNfZG9uZSh1bnNpZ25lZCBpbnQgbWF4X2NwdXMpCj4gLS0gCj4gMi4xNy4xCj4gCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGlu
ZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVj
b3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
