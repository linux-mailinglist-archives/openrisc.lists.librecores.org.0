Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 0A5DD3098B9
	for <lists+openrisc@lfdr.de>; Sun, 31 Jan 2021 00:03:17 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B1C7520CB1;
	Sun, 31 Jan 2021 00:03:16 +0100 (CET)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mail.librecores.org (Postfix) with ESMTPS id 2A58320CB1
 for <openrisc@lists.librecores.org>; Sun, 31 Jan 2021 00:03:15 +0100 (CET)
Received: by mail-pj1-f53.google.com with SMTP id x11so473922pjr.3
 for <openrisc@lists.librecores.org>; Sat, 30 Jan 2021 15:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+zVe5wqUAoeHSpi/8FrWkSqWDUIAFS7adbUJ7KyJwOs=;
 b=U4Kw3ocFKFFv8Q9KIfoH9uocdxLx107zMK7QOauzgcRhMneSkbCa/a9+wpHjB4Tun9
 JkQmbb5RgH205vjLc79hmK6EGKTLnA6hf9vtE7hn/MV3f/1fv5QBs2ZDf5FhJmPj/Ea5
 y89gcdaSTuP/Qu3urZYWBwnFWWS84/QAC7Ch2/x3AICljUUT0S9h4TzCVLQ3nbZbRKwp
 OoOVpjWEsBQxr0hMIjyY2Eq7dcv351Us1ddQ1+wHKE5G5bBYqkaadwlj76R8WyVqkGp8
 Q2wWmKOQem1H40nleZ5lVhpBFDJuBr5i4QDjS8C1itd/Fk2Rym0pNBpyFnGo3aPVw8v0
 1AxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+zVe5wqUAoeHSpi/8FrWkSqWDUIAFS7adbUJ7KyJwOs=;
 b=cXRTeRbuWKLwMcrlkcToNjSfM+280xIRNCyiYV6KwV6cuhhFT3RhV7CwAgvlD2+IBW
 uZeWygUokQY0jeZ7ZCBciqocdl4sUaezRdIKcVvkkOaDtF2DGScXZZz2zRA+REDUf0Mo
 F1YFygbOcQCk6kv10ePJ9skuBFNTVx2zIF52xK3vNn0It9820sSZJYX4+m4SN7eoNtK6
 byf1NV8vv9M6LPmgJU7da6pZh2wENLuw4t396h+V3gVTvvC76OUXXZGpR2PSnqd8rggk
 zHxoFv1fuHsq8BPO13Jc3Wjb49vg/RxCHLVv0tUdzvWDnD+ANP/AQ1UgbnVQhRAEIdVD
 uDaw==
X-Gm-Message-State: AOAM533i0Fr8SQaU7rvMUrxG525XaclNCV/zzeuPa73s8iu9rx2k8g/y
 RM7UhtF0/j7Mrr66Lk/SLdA=
X-Google-Smtp-Source: ABdhPJymKHYEMfkIJnur+rUhtefwj6MfpiCTIeIe73hTaSr4WwImKbL9BALaTAvEycTwDV0EVvc7og==
X-Received: by 2002:a17:902:854b:b029:db:c725:edcd with SMTP id
 d11-20020a170902854bb02900dbc725edcdmr11362398plo.64.1612047793286; 
 Sat, 30 Jan 2021 15:03:13 -0800 (PST)
Received: from localhost (g54.222-224-210.ppp.wakwak.ne.jp. [222.224.210.54])
 by smtp.gmail.com with ESMTPSA id
 197sm12862257pgg.43.2021.01.30.15.03.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 15:03:12 -0800 (PST)
Date: Sun, 31 Jan 2021 08:03:10 +0900
From: Stafford Horne <shorne@gmail.com>
To: Jan Henrik Weinstock <jan.weinstock@rwth-aachen.de>,
 g@lianli.shorne-pla.net
Message-ID: <20210130230310.GC2002709@lianli.shorne-pla.net>
References: <0b26eda7-229d-3dc9-f2ae-19b9212fb0ea@rwth-aachen.de>
 <20210129221643.GZ2002709@lianli.shorne-pla.net>
 <2a018afc-d797-3a91-ffab-e55ae3b0a795@rwth-aachen.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2a018afc-d797-3a91-ffab-e55ae3b0a795@rwth-aachen.de>
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

T24gU2F0LCBKYW4gMzAsIDIwMjEgYXQgMTI6MDA6MTBQTSArMDEwMCwgSmFuIEhlbnJpayBXZWlu
c3RvY2sgd3JvdGU6Cj4gSGkgU3RhZmZvcmQsIEdlZXJ0LAo+IAo+IHRoYW5rcyBmb3IgeW91ciBm
ZWVkYmFjay4gSSBoYXZlIG1hZGUgdGhlIGZvbGxvd2luZyBjaGFuZ2VzIHRvIHRoZSBwYXRjaDoK
CkhpLCBUaGFua3MgZm9yIHRoZSB1cGRhdGVzLgoKPiAxLiB1c2UgZm9yX2VhY2hfb2ZfY3B1X25v
ZGUKPiAyLiBwb3NzaWJsZV9jcHVzIGlzIG5vdyB3aGF0IGlzIGluIHRoZSBkZXZpY2V0cmVlLCB1
cCB0byBOUl9DUFVTCj4gMy4gcHJlc2VudF9jcHVzIGlzIG5vdyBhbGwgcG9zc2libGUgY3B1cywg
dXAgdG8gbWF4X2NwdXMKClRoaXMgbG9va3MgZ29vZCwgb25lIHNtYWxsIGNvbW1lbnQgYmVsb3cu
ICBDYW4geW91IHNlbmQgdGhlIG5leHQgcGF0Y2ggYXMgYSB2Mj8KClVzaW5nICdnaXQgZm9ybWF0
LXBhdGNoIC12MiAuLi4nCgo+IFNpZ25lZC1vZmYtYnk6IEphbiBIZW5yaWsgV2VpbnN0b2NrIDxq
YW4ud2VpbnN0b2NrQHJ3dGgtYWFjaGVuLmRlPgo+IC0tLQpZb3UgY2FuIGluY2x1ZGUgdGhlICdD
aGFuZ2VzIHNpbmNlIHYxJyBpbiB0aGUgc3BhY2UgaGVyZSBhZnRlciAnLS0tJy4KCj4gIGFyY2gv
b3BlbnJpc2Mva2VybmVsL3NtcC5jIHwgMjMgKysrKysrKysrKysrKysrKystLS0tLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2FyY2gvb3BlbnJpc2Mva2VybmVsL3NtcC5jIGIvYXJjaC9vcGVucmlzYy9rZXJuZWwv
c21wLmMKPiBpbmRleCAyOWM4MmVmMmUuLjgzY2JmNDNkNCAxMDA2NDQKPiAtLS0gYS9hcmNoL29w
ZW5yaXNjL2tlcm5lbC9zbXAuYwo+ICsrKyBiL2FyY2gvb3BlbnJpc2Mva2VybmVsL3NtcC5jCj4g
QEAgLTE2LDYgKzE2LDcgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L3NjaGVkLmg+Cj4gICNpbmNsdWRl
IDxsaW51eC9zY2hlZC9tbS5oPgo+ICAjaW5jbHVkZSA8bGludXgvaXJxLmg+Cj4gKyNpbmNsdWRl
IDxsaW51eC9vZi5oPgo+ICAjaW5jbHVkZSA8YXNtL2NwdWluZm8uaD4KPiAgI2luY2x1ZGUgPGFz
bS9tbXVfY29udGV4dC5oPgo+ICAjaW5jbHVkZSA8YXNtL3RsYmZsdXNoLmg+Cj4gQEAgLTYwLDIy
ICs2MSwzMiBAQCB2b2lkIF9faW5pdCBzbXBfcHJlcGFyZV9ib290X2NwdSh2b2lkKQo+IAo+ICB2
b2lkIF9faW5pdCBzbXBfaW5pdF9jcHVzKHZvaWQpCj4gIHsKPiAtCWludCBpOwo+ICsJc3RydWN0
IGRldmljZV9ub2RlKiBjcHU7Cj4gKwl1MzIgY3B1X2lkOwo+IAo+IC0JZm9yIChpID0gMDsgaSA8
IE5SX0NQVVM7IGkrKykKPiAtCQlzZXRfY3B1X3Bvc3NpYmxlKGksIHRydWUpOwo+ICsJZm9yX2Vh
Y2hfb2ZfY3B1X25vZGUoY3B1KSB7Cj4gKwkJaWYgKG9mX3Byb3BlcnR5X3JlYWRfdTMyKGNwdSwg
InJlZyIsICZjcHVfaWQpKSB7Cj4gKwkJCXByX3dhcm4oIiVzIG1pc3NpbmcgcmVnIHByb3BlcnR5
IiwgY3B1LT5mdWxsX25hbWUpOwo+ICsJCQljb250aW51ZTsKPiArCQl9Cj4gKwo+ICsJCWlmIChj
cHVfaWQgPCBOUl9DUFVTKQoKU2hvdWxkIHdlIHdhcm4gb24gdGhlIGVsc2UgY2FzZT8KCj4gKwkJ
CXNldF9jcHVfcG9zc2libGUoY3B1X2lkLCB0cnVlKTsKPiArCX0KPiAgfQoKLVN0YWZmb3JkCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1h
aWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxp
YnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
