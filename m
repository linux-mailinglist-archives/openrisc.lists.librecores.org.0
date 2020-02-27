Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 3CBC2171862
	for <lists+openrisc@lfdr.de>; Thu, 27 Feb 2020 14:16:27 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D879E20114;
	Thu, 27 Feb 2020 14:16:26 +0100 (CET)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by mail.librecores.org (Postfix) with ESMTPS id 525442013B
 for <openrisc@lists.librecores.org>; Thu, 27 Feb 2020 14:16:25 +0100 (CET)
Received: by mail-pl1-f195.google.com with SMTP id y1so1138432plp.7
 for <openrisc@lists.librecores.org>; Thu, 27 Feb 2020 05:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=NF9T8IeFNBwXfV4fQWs170IOL2X98pDMbcHSLSgXH20=;
 b=ZT/8Y8PkFGeau+lVJL+67Aqls/Ql90yHrcfGQoye6rNnhOFAxb+bMTM598j35r2fZ1
 y2OrA1o5B5oH7WDXsJVRT1zNYfNZeeGno7BwRODYlTlJurVeCFCuajtKuS1+lzLO7Dd2
 NlaDs/29xH4NRk6/XanKad0bU1Vs73PUsAOmIQQvUIAx0e6TNjTnCyuei9P4qxfItvBr
 AQfgVtO0cSh4IqjXOGio7YPmRHmXSpRo373jQ7jk1uqmxpDdLFFRpjpBq86nUeUhAoYN
 h9Hzjyizzzsthh8ktb21z0dr4lr+Atp8vKncmDdBX3Xe0/YDWtoua36QcEvMY0jL47/3
 EBMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NF9T8IeFNBwXfV4fQWs170IOL2X98pDMbcHSLSgXH20=;
 b=SpAaR7Wie6vu2K0HVJm9brPJ+g7GQVGJmgjcttADXJxQma7cHLxRyksGS774nQioMe
 B52BQzg2EjBPL/44hK98lodtilh3osiwhQe3L57f5ERb6gC6xqE6+ouuOe3JoGm1H2sr
 HMCMdwg0GaKwrjlTP7VBUZZz4xFx1jc6Rhk4C31GV03Yio4/T8FtYXrSwmXGLuf9v0AK
 qWJ1cyA6RnSSfftxctldS6eZ5NgmdzXKjXPLQjzyVW4mxyVnAC2CSmWxA5LiD45pwdEu
 l94L15yiWt2kTaw/IScQtvPHf54DXm8oFHHLBskQuSC+7I7Hx0LVoudGA648Uo9kS2wU
 iKiQ==
X-Gm-Message-State: APjAAAUNpzqtNU6UaOjwGyBpfb9Nqh8sSH1sIAyPBYTRZ6BESmBgVSBS
 F7HFw7Y2Xjx0A1ImIiM8NXQ=
X-Google-Smtp-Source: APXvYqwqpd6DvEp/v1FvwdsoRPvv73ubByBVSD4mvHFcF6+1p2pSRRrgM9Yq6fUjhQhyD4/3iqfO0w==
X-Received: by 2002:a17:90a:c691:: with SMTP id
 n17mr4865839pjt.41.1582809383686; 
 Thu, 27 Feb 2020 05:16:23 -0800 (PST)
Received: from localhost (g183.222-224-185.ppp.wakwak.ne.jp. [222.224.185.183])
 by smtp.gmail.com with ESMTPSA id 72sm7365104pfw.7.2020.02.27.05.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 05:16:22 -0800 (PST)
Date: Thu, 27 Feb 2020 22:16:20 +0900
From: Stafford Horne <shorne@gmail.com>
To: Christian Brauner <christian.brauner@ubuntu.com>
Message-ID: <20200227131620.GG7926@lianli.shorne-pla.net>
References: <20200226225625.28935-1-shorne@gmail.com>
 <20200226225625.28935-2-shorne@gmail.com>
 <20200227121952.hywkuydswvdn3myc@wittgenstein>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200227121952.hywkuydswvdn3myc@wittgenstein>
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
 LKML <linux-kernel@vger.kernel.org>, Openrisc <openrisc@lists.librecores.org>,
 Allison Randal <allison@lohutok.net>, Thomas Gleixner <tglx@linutronix.de>,
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCBGZWIgMjcsIDIwMjAgYXQgMDE6MTk6NTJQTSArMDEwMCwgQ2hyaXN0aWFuIEJyYXVu
ZXIgd3JvdGU6Cj4gT24gVGh1LCBGZWIgMjcsIDIwMjAgYXQgMDc6NTY6MjNBTSArMDkwMCwgU3Rh
ZmZvcmQgSG9ybmUgd3JvdGU6Cj4gPiBUaGlzIGlzIHJlcXVpcmVkIGZvciBjbG9uZTMgd2hpY2gg
cGFzc2VzIHRoZSBUTFMgdmFsdWUgdGhyb3VnaCBhCj4gPiBzdHJ1Y3QgcmF0aGVyIHRoYW4gYSBy
ZWdpc3Rlci4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogU3RhZmZvcmQgSG9ybmUgPHNob3JuZUBn
bWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL29wZW5yaXNjL0tjb25maWcgICAgICAgICAgfCAg
MSArCj4gPiAgYXJjaC9vcGVucmlzYy9rZXJuZWwvcHJvY2Vzcy5jIHwgMTUgKysrKystLS0tLS0t
LS0tCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygt
KQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9LY29uZmlnIGIvYXJjaC9vcGVu
cmlzYy9LY29uZmlnCj4gPiBpbmRleCAxOTI4ZTA2MWZmOTYuLjVkZWJkYmU2ZmMzNSAxMDA2NDQK
PiA+IC0tLSBhL2FyY2gvb3BlbnJpc2MvS2NvbmZpZwo+ID4gKysrIGIvYXJjaC9vcGVucmlzYy9L
Y29uZmlnCj4gPiBAQCAtMTQsNiArMTQsNyBAQCBjb25maWcgT1BFTlJJU0MKPiA+ICAJc2VsZWN0
IEhBTkRMRV9ET01BSU5fSVJRCj4gPiAgCXNlbGVjdCBHUElPTElCCj4gPiAgCXNlbGVjdCBIQVZF
X0FSQ0hfVFJBQ0VIT09LCj4gPiArCXNlbGVjdCBIQVZFX0NPUFlfVEhSRUFEX1RMUwo+ID4gIAlz
ZWxlY3QgU1BBUlNFX0lSUQo+ID4gIAlzZWxlY3QgR0VORVJJQ19JUlFfQ0hJUAo+ID4gIAlzZWxl
Y3QgR0VORVJJQ19JUlFfUFJPQkUKPiA+IGRpZmYgLS1naXQgYS9hcmNoL29wZW5yaXNjL2tlcm5l
bC9wcm9jZXNzLmMgYi9hcmNoL29wZW5yaXNjL2tlcm5lbC9wcm9jZXNzLmMKPiA+IGluZGV4IGIw
NmY4NGY2Njc2Zi4uNjY5NWYxNjdlMTI2IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9vcGVucmlzYy9r
ZXJuZWwvcHJvY2Vzcy5jCj4gPiArKysgYi9hcmNoL29wZW5yaXNjL2tlcm5lbC9wcm9jZXNzLmMK
PiA+IEBAIC0xMTcsMTIgKzExNywxMyBAQCB2b2lkIHJlbGVhc2VfdGhyZWFkKHN0cnVjdCB0YXNr
X3N0cnVjdCAqZGVhZF90YXNrKQo+ID4gIGV4dGVybiBhc21saW5rYWdlIHZvaWQgcmV0X2Zyb21f
Zm9yayh2b2lkKTsKPiA+ICAKPiA+ICAvKgo+ID4gLSAqIGNvcHlfdGhyZWFkCj4gPiArICogY29w
eV90aHJlYWRfdGxzCj4gPiAgICogQGNsb25lX2ZsYWdzOiBmbGFncwo+ID4gICAqIEB1c3A6IHVz
ZXIgc3RhY2sgcG9pbnRlciBvciBmbiBmb3Iga2VybmVsIHRocmVhZAo+ID4gICAqIEBhcmc6IGFy
ZyB0byBmbiBmb3Iga2VybmVsIHRocmVhZDsgYWx3YXlzIE5VTEwgZm9yIHVzZXJzcGFjZSB0aHJl
YWQKPiA+ICAgKiBAcDogdGhlIG5ld2x5IGNyZWF0ZWQgdGFzawo+ID4gICAqIEByZWdzOiBDUFUg
Y29udGV4dCB0byBjb3B5IGZvciB1c2Vyc3BhY2UgdGhyZWFkOyBhbHdheXMgTlVMTCBmb3Iga3Ro
cmVhZAo+ID4gKyAqIEB0bHM6IHRoZSBUaHJlYWQgTG9jYWwgU3RvcmF0ZSBwb2ludGVyIGZvciB0
aGUgbmV3IHByb2Nlc3MKPiA+ICAgKgo+ID4gICAqIEF0IHRoZSB0b3Agb2YgYSBuZXdseSBpbml0
aWFsaXplZCBrZXJuZWwgc3RhY2sgYXJlIHR3byBzdGFja2VkIHB0X3JlZwo+ID4gICAqIHN0cnVj
dHVyZXMuICBUaGUgZmlyc3QgKHRvcG1vc3QpIGlzIHRoZSB1c2Vyc3BhY2UgY29udGV4dCBvZiB0
aGUgdGhyZWFkLgo+ID4gQEAgLTE0OCw4ICsxNDksOCBAQCBleHRlcm4gYXNtbGlua2FnZSB2b2lk
IHJldF9mcm9tX2Zvcmsodm9pZCk7Cj4gPiAgICovCj4gPiAgCj4gPiAgaW50Cj4gPiAtY29weV90
aHJlYWQodW5zaWduZWQgbG9uZyBjbG9uZV9mbGFncywgdW5zaWduZWQgbG9uZyB1c3AsCj4gPiAt
CSAgICB1bnNpZ25lZCBsb25nIGFyZywgc3RydWN0IHRhc2tfc3RydWN0ICpwKQo+ID4gK2NvcHlf
dGhyZWFkX3Rscyh1bnNpZ25lZCBsb25nIGNsb25lX2ZsYWdzLCB1bnNpZ25lZCBsb25nIHVzcCwK
PiA+ICsJCXVuc2lnbmVkIGxvbmcgYXJnLCBzdHJ1Y3QgdGFza19zdHJ1Y3QgKnAsIHVuc2lnbmVk
IGxvbmcgdGxzKQo+ID4gIHsKPiA+ICAJc3RydWN0IHB0X3JlZ3MgKnVzZXJyZWdzOwo+ID4gIAlz
dHJ1Y3QgcHRfcmVncyAqa3JlZ3M7Cj4gPiBAQCAtMTgwLDE1ICsxODEsOSBAQCBjb3B5X3RocmVh
ZCh1bnNpZ25lZCBsb25nIGNsb25lX2ZsYWdzLCB1bnNpZ25lZCBsb25nIHVzcCwKPiA+ICAKPiA+
ICAJCS8qCj4gPiAgCQkgKiBGb3IgQ0xPTkVfU0VUVExTIHNldCAidHAiIChyMTApIHRvIHRoZSBU
TFMgcG9pbnRlciBwYXNzZWQgdG8gc3lzX2Nsb25lLgo+IAo+IE1heWJlIHJld29yZCB0aGlzIHRv
Ogo+IAo+IEZvciBDTE9ORV9TRVRUTFMgc2V0ICJ0cCIgKHIxMCkgdG8gdGhlIFRMUyBwb2ludGVy
LiBXZSBwcm9iYWJseQo+IHNob3VsZG4ndCBtZW50aW9uIGNsb25lKCkgZXhwbGljaXRseSBhbnlt
b3JlLCBzaW5jZSB3ZSBub3cgaGF2ZQo+IGNsb25lMygpIGFuZCB0aGVyZWZvcmUgdHdvIGNhbGxl
cnMgdGhhdCBwYXNzIGluIHRscyBhcmd1bWVudHMuCgpTdXJlLCBJIHVwZGF0ZWQgaXQgaW4gdGhl
ICdkb2NzJyBjb21taXQsIGJ1dCBhcyB5b3UgbWVudGlvbiBJIGNhbiBqdXN0IHJlbW92ZQp0aGUg
bWVudGlvbiBvZiBjbG9uZSogYWxsIHRvZ2V0aGVyLiAgSSB3aWxsIGp1c3QgcmVtb3ZlIHRoYXQg
aGVyZSBhbmQgaXQgd29uJ3QKaGF2ZSB0byBiZSB0b3VjaGVkIGluIHRoZSAnZG9jcycgY29tbWl0
LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklT
QyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0
cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
