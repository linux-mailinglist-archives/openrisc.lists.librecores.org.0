Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2D90514ED2F
	for <lists+openrisc@lfdr.de>; Fri, 31 Jan 2020 14:25:49 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C90562089D;
	Fri, 31 Jan 2020 14:25:48 +0100 (CET)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by mail.librecores.org (Postfix) with ESMTPS id A29932089D
 for <openrisc@lists.librecores.org>; Fri, 31 Jan 2020 14:25:46 +0100 (CET)
Received: by mail-pg1-f195.google.com with SMTP id b9so3430534pgk.12
 for <openrisc@lists.librecores.org>; Fri, 31 Jan 2020 05:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Uw1FQaJ7B7AC5+CVRylYzOQ0kTnjKrLEQb7DZzSA/4Y=;
 b=gNWV8Sbx6ScYTDYJ64qE+QmSC0CcNXwNBov85Rbgtcoq60E/gJuRzF3sa8kHAUXIJP
 58L7Dr3G5zt65WHFz/ANSvk1GG6q/Q+zaFlW0i1WWjrWKZIiDRqQAy7erEGGyh8iHq1M
 njRkcSrYOEWMVtGijmDGF/NSUWjJCJEpS+7qA/qLfBIGcd+IOYB4ITOWFCCsKjNnJo1b
 0ajDUvQcs0NfvetIRZztrHzeE80KcezUL4ubQL2Qx2RpRcvR678e9533fvXHRmmIGAWt
 c+fkvufa3kcA+WHnbdvl1Mg7OPP0j2TOanwCmY0NDYGhJLDcligaOTVPDyT1mc4LyF7C
 bz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Uw1FQaJ7B7AC5+CVRylYzOQ0kTnjKrLEQb7DZzSA/4Y=;
 b=FRPE/unxxhrzZ7+UQ//KGsI6GS60qIF3/OYYsWUW12CNU9UTN+iNwA+zA0cxANcVms
 ziPCN0kDSJQItU1QI2mXUpCdKGeKEQUn8Av13z8VdoGS8B/LtWamjjIsuhv2vljiqLAC
 pYmvluOcAA7jH/qeFvT7IH+8ovj0oELAKIm22rPJiC7UQ0lLMXrckBdNq6VwWoJ5zE0t
 Al8uDS+fQq/T5vHfLJSl+WYIl7p150m1+0bGHpNdL6FYMEXSqgf1PNxUnNON7l/oWMlT
 ktociWcTiNjE22qYjW2CvgggNnRAz6iYj0EY1HlezIHFf94j5ndMDsLU4qhco7QPCOmh
 bgLg==
X-Gm-Message-State: APjAAAXa7n5aSbfHc5P8sfdv7w+chOTD3o+NyeM2Lb1kuw2y9U+uOiaL
 4jDjon6W61TjpAYmYQGSErk=
X-Google-Smtp-Source: APXvYqzJZa0hq1t1IkczddY1sn7dC2Nwyv/xkjvgnEZRNzMIFUYnDNpERPVWmI6YbILlckNXdk9bkQ==
X-Received: by 2002:a62:1b4f:: with SMTP id b76mr10986760pfb.163.1580477145176; 
 Fri, 31 Jan 2020 05:25:45 -0800 (PST)
Received: from localhost (g52.222-224-164.ppp.wakwak.ne.jp. [222.224.164.52])
 by smtp.gmail.com with ESMTPSA id
 g18sm10448004pfi.80.2020.01.31.05.25.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2020 05:25:44 -0800 (PST)
Date: Fri, 31 Jan 2020 22:25:42 +0900
From: Stafford Horne <shorne@gmail.com>
To: kbuild test robot <lkp@intel.com>
Message-ID: <20200131132542.GY24874@lianli.shorne-pla.net>
References: <1577634178-22530-5-git-send-email-Julia.Lawall@inria.fr>
 <201912301238.xfn6pKut%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <201912301238.xfn6pKut%lkp@intel.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [OpenRISC] [PATCH 4/4] openrisc: use mmgrab
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
Cc: Jonas Bonn <jonas@southpole.se>, kbuild-all@lists.01.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Julia Lawall <Julia.Lawall@inria.fr>, openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBEZWMgMzAsIDIwMTkgYXQgMTI6NDk6MTlQTSArMDgwMCwga2J1aWxkIHRlc3Qgcm9i
b3Qgd3JvdGU6Cj4gSGkgSnVsaWEsCj4gCj4gSSBsb3ZlIHlvdXIgcGF0Y2ghIFlldCBzb21ldGhp
bmcgdG8gaW1wcm92ZToKPiAKPiBbYXV0byBidWlsZCB0ZXN0IEVSUk9SIG9uIHZmaW8vbmV4dF0K
PiBbYWxzbyBidWlsZCB0ZXN0IEVSUk9SIG9uIGNoYXItbWlzYy9jaGFyLW1pc2MtdGVzdGluZyB2
NS41LXJjMyBuZXh0LTIwMTkxMjIwXQo+IFtpZiB5b3VyIHBhdGNoIGlzIGFwcGxpZWQgdG8gdGhl
IHdyb25nIGdpdCB0cmVlLCBwbGVhc2UgZHJvcCB1cyBhIG5vdGUgdG8gaGVscAo+IGltcHJvdmUg
dGhlIHN5c3RlbS4gQlRXLCB3ZSBhbHNvIHN1Z2dlc3QgdG8gdXNlICctLWJhc2UnIG9wdGlvbiB0
byBzcGVjaWZ5IHRoZQo+IGJhc2UgdHJlZSBpbiBnaXQgZm9ybWF0LXBhdGNoLCBwbGVhc2Ugc2Vl
IGh0dHBzOi8vc3RhY2tvdmVyZmxvdy5jb20vYS8zNzQwNjk4Ml0KPiAKPiB1cmw6ICAgIGh0dHBz
Oi8vZ2l0aHViLmNvbS8wZGF5LWNpL2xpbnV4L2NvbW1pdHMvSnVsaWEtTGF3YWxsL3VzZS1tbWdy
YWIvMjAxOTEyMzAtMDExNjExCj4gYmFzZTogICBodHRwczovL2dpdGh1Yi5jb20vYXdpbGxpYW0v
bGludXgtdmZpby5naXQgbmV4dAo+IGNvbmZpZzogb3BlbnJpc2Mtc2ltcGxlX3NtcF9kZWZjb25m
aWcgKGF0dGFjaGVkIGFzIC5jb25maWcpCj4gY29tcGlsZXI6IG9yMWstbGludXgtZ2NjIChHQ0Mp
IDkuMi4wCj4gcmVwcm9kdWNlOgo+ICAgICAgICAgd2dldCBodHRwczovL3Jhdy5naXRodWJ1c2Vy
Y29udGVudC5jb20vaW50ZWwvbGtwLXRlc3RzL21hc3Rlci9zYmluL21ha2UuY3Jvc3MgLU8gfi9i
aW4vbWFrZS5jcm9zcwo+ICAgICAgICAgY2htb2QgK3ggfi9iaW4vbWFrZS5jcm9zcwo+ICAgICAg
ICAgIyBzYXZlIHRoZSBhdHRhY2hlZCAuY29uZmlnIHRvIGxpbnV4IGJ1aWxkIHRyZWUKPiAgICAg
ICAgIEdDQ19WRVJTSU9OPTkuMi4wIG1ha2UuY3Jvc3MgQVJDSD1vcGVucmlzYyAKPiAKPiBJZiB5
b3UgZml4IHRoZSBpc3N1ZSwga2luZGx5IGFkZCBmb2xsb3dpbmcgdGFnCj4gUmVwb3J0ZWQtYnk6
IGtidWlsZCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+IAo+IEFsbCBlcnJvcnMgKG5ldyBv
bmVzIHByZWZpeGVkIGJ5ID4+KToKPiAKPiAgICBhcmNoL29wZW5yaXNjL2tlcm5lbC9zbXAuYzog
SW4gZnVuY3Rpb24gJ3NlY29uZGFyeV9zdGFydF9rZXJuZWwnOgo+ID4+IGFyY2gvb3BlbnJpc2Mv
a2VybmVsL3NtcC5jOjExNjoyOiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rp
b24gJ21tZ3JhYic7IGRpZCB5b3UgbWVhbiAnaWdyYWInPyBbLVdlcnJvcj1pbXBsaWNpdC1mdW5j
dGlvbi1kZWNsYXJhdGlvbl0KPiAgICAgIDExNiB8ICBtbWdyYWIobW0pOwo+ICAgICAgICAgIHwg
IF5+fn5+fgo+ICAgICAgICAgIHwgIGlncmFiCj4gICAgY2MxOiBzb21lIHdhcm5pbmdzIGJlaW5n
IHRyZWF0ZWQgYXMgZXJyb3JzCj4gCj4gdmltICsxMTYgYXJjaC9vcGVucmlzYy9rZXJuZWwvc21w
LmMKPiAKPiAgICAxMDcJCj4gICAgMTA4CWFzbWxpbmthZ2UgX19pbml0IHZvaWQgc2Vjb25kYXJ5
X3N0YXJ0X2tlcm5lbCh2b2lkKQo+ICAgIDEwOQl7Cj4gICAgMTEwCQlzdHJ1Y3QgbW1fc3RydWN0
ICptbSA9ICZpbml0X21tOwo+ICAgIDExMQkJdW5zaWduZWQgaW50IGNwdSA9IHNtcF9wcm9jZXNz
b3JfaWQoKTsKPiAgICAxMTIJCS8qCj4gICAgMTEzCQkgKiBBbGwga2VybmVsIHRocmVhZHMgc2hh
cmUgdGhlIHNhbWUgbW0gY29udGV4dDsgZ3JhYiBhCj4gICAgMTE0CQkgKiByZWZlcmVuY2UgYW5k
IHN3aXRjaCB0byBpdC4KPiAgICAxMTUJCSAqLwo+ICA+IDExNgkJbW1ncmFiKG1tKTsKPiAgICAx
MTcJCWN1cnJlbnQtPmFjdGl2ZV9tbSA9IG1tOwo+ICAgIDExOAkJY3B1bWFza19zZXRfY3B1KGNw
dSwgbW1fY3B1bWFzayhtbSkpOwo+ICAgIDExOQkKPiAgICAxMjAJCXByX2luZm8oIkNQVSV1OiBC
b290ZWQgc2Vjb25kYXJ5IHByb2Nlc3NvclxuIiwgY3B1KTsKPiAgICAxMjEJCj4gICAgMTIyCQlz
ZXR1cF9jcHVpbmZvKCk7Cj4gICAgMTIzCQlvcGVucmlzY19jbG9ja2V2ZW50X2luaXQoKTsKPiAg
ICAxMjQJCj4gICAgMTI1CQlub3RpZnlfY3B1X3N0YXJ0aW5nKGNwdSk7Cj4gICAgMTI2CQo+ICAg
IDEyNwkJLyoKPiAgICAxMjgJCSAqIE9LLCBub3cgaXQncyBzYWZlIHRvIGxldCB0aGUgYm9vdCBD
UFUgY29udGludWUKPiAgICAxMjkJCSAqLwo+ICAgIDEzMAkJY29tcGxldGUoJmNwdV9ydW5uaW5n
KTsKPiAgICAxMzEJCj4gICAgMTMyCQlzeW5jaHJvbmlzZV9jb3VudF9zbGF2ZShjcHUpOwo+ICAg
IDEzMwkJc2V0X2NwdV9vbmxpbmUoY3B1LCB0cnVlKTsKPiAgICAxMzQJCj4gICAgMTM1CQlsb2Nh
bF9pcnFfZW5hYmxlKCk7Cj4gICAgMTM2CQo+ICAgIDEzNwkJcHJlZW1wdF9kaXNhYmxlKCk7Cj4g
ICAgMTM4CQkvKgo+ICAgIDEzOQkJICogT0ssIGl0J3Mgb2ZmIHRvIHRoZSBpZGxlIHRocmVhZCBm
b3IgdXMKPiAgICAxNDAJCSAqLwo+ICAgIDE0MQkJY3B1X3N0YXJ0dXBfZW50cnkoQ1BVSFBfQVBf
T05MSU5FX0lETEUpOwo+ICAgIDE0Mgl9Cj4gICAgMTQzCQo+IAoKSGVsbG8sICBGWUkgSSBoYXZl
IGZpeGVkIHRoaXMgY29tbWl0IGFuZCBxdWV1ZWQgaXQgb24gbXkgNS43IGJyYW5jaC4KCi1TdGFm
Zm9yZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVu
UklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9s
aXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
