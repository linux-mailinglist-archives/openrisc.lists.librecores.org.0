Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A5D8C41719
	for <lists+openrisc@lfdr.de>; Tue, 11 Jun 2019 23:48:15 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5FD6320250;
	Tue, 11 Jun 2019 23:48:15 +0200 (CEST)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by mail.librecores.org (Postfix) with ESMTPS id 98DE720106
 for <openrisc@lists.librecores.org>; Tue, 11 Jun 2019 23:48:13 +0200 (CEST)
Received: by mail-wm1-f67.google.com with SMTP id c66so4475725wmf.0
 for <openrisc@lists.librecores.org>; Tue, 11 Jun 2019 14:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=embecosm.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Pl4APQp8D9IU0qmCOMoVwd2l33LwiVRoTNgxBiY5s5o=;
 b=OYCQIQ82vrvpXW47oe41U/94fsjxR+9ZST32RSyYJ36wgIaec6bndj05bR9UPi/sWx
 pYLCpdV/eTd7X7tu/blzvbI8AQfKFADjSBKEgGSdr19S7oSEmZoa8NSO1GYCrvc3wpx8
 k0Q4xsGKhoUQzik0ONx3Rd1FMO7Ki1B1tEQEucPnwmQXvLNWsxw9R5HPYjSOW+eUu27V
 /YT+ggbP6Po7oFjF7UDEdfmGRbij9MFwHqUNM4yA6NLokU43aduIBTpPZTtNZh0rBqbO
 5AMKlHWmozIhSMhm/GojQOiK6yetcHJWhL7Y3y84Hy5tX76iTh9Kl3cqTQaUQ/tFCNbW
 Manw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Pl4APQp8D9IU0qmCOMoVwd2l33LwiVRoTNgxBiY5s5o=;
 b=PTuS+6fF2Zc+7b/pqjIOzPji6nZS7cN9Qj6Yqd5e9x1QJla7AeJYrnLY2M5/7AZgLo
 FeL6KZefjhQYBwvn5eEovuM1TJ8JRWQUWlGfnZPgdokvPAXHy+06B+3Heixi1lJt2P65
 spK9/UouIaElX5uv0cLBYCW57fBu3j3WVrKVGEAitcAZxjB88Fau0EICGKdqdsjobzoP
 jSyFzB+6jKeSyOjuD3EwiCehmaTfy46KuOPMda0bO9iWsFpBrya7+tH05Q8t56LTYm5p
 yQeUAJ68mjELW3Dq/YAOCRU1jLV/m7lBvmwv6B99211iEQ6CPL5Eqdwx43kYsmorK7uD
 vRGg==
X-Gm-Message-State: APjAAAUw3ivoF5CpyNm708LGFT7xKKcrsiZJBK1VB+Cj1JkAcivxk1ny
 OXJs5/fijTxFdohKu6G6Adnnbg==
X-Google-Smtp-Source: APXvYqx+QBqZBjw4FXk+Ucct3sTKUo3v6FBNl3bvNefZphQVTgtXnASbwxSATDBn05UMwU8FhVnJ+Q==
X-Received: by 2002:a1c:544d:: with SMTP id p13mr20289367wmi.78.1560289693211; 
 Tue, 11 Jun 2019 14:48:13 -0700 (PDT)
Received: from localhost (host86-180-62-212.range86-180.btcentralplus.com.
 [86.180.62.212])
 by smtp.gmail.com with ESMTPSA id f21sm4333584wmb.2.2019.06.11.14.48.11
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 11 Jun 2019 14:48:12 -0700 (PDT)
Date: Tue, 11 Jun 2019 22:48:11 +0100
From: Andrew Burgess <andrew.burgess@embecosm.com>
To: Stafford Horne <shorne@gmail.com>
Message-ID: <20190611214811.GS23204@embecosm.com>
References: <20190610204940.3846-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190610204940.3846-1-shorne@gmail.com>
X-Operating-System: Linux/4.18.19-100.fc27.x86_64 (x86_64)
X-Uptime: 22:47:33 up 15 days,  1:32,
X-Fortune: Kleeneness is next to Godelness.
X-Editor: GNU Emacs [ http://www.gnu.org/software/emacs ]
User-Agent: Mutt/1.9.2 (2017-12-15)
Subject: Re: [OpenRISC] [PATCH v3 10/11] sim/testsuite/or1k: Add test case
 for l.adrp instruction
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
Cc: Nick Clifton <nickc@redhat.com>, Openrisc <openrisc@lists.librecores.org>,
 GNU Binutils <binutils@sourceware.org>, Andrey Bacherov <bandvig@mail.ru>,
 GDB patches <gdb-patches@sourceware.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

KiBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4gWzIwMTktMDYtMTEgMDU6NDk6Mzkg
KzA5MDBdOgoKPiBUaGlzIGlzIGEgc2ltcGxlIHRlc3QgdG8gZW5zdXJlIHRoYXQgdGhlIGwuYWRy
cCBpbnN0cnVjdGlvbiBjYW4gYmUgYXNzZW1ibGVkIGFuZAo+IHNpbXVsYXRlZCBjb3JyZWN0bHku
Cj4gCj4gc2ltL3Rlc3RzdWl0ZS9zaW0vb3Ixay9DaGFuZ2VMb2c6Cj4gCj4geXl5eS1tbS1kZCAg
U3RhZmZvcmQgSG9ybmUgIDxzaG9ybmVAZ21haWwuY29tPgo+IAo+IAkqIGFkcnAuUzogTmV3IGZp
bGUuCgpUaGlzIGlzIGZpbmUgd2l0aCBvbmUgbml0IGJlbG93LgoKVGhhbmtzLApBbmRyZXcKCgo+
IC0tLQo+IENoYW5nZXMgc2luY2UgdjI6Cj4gIC0gbmV3IHBhdGNoCj4gCj4gIHNpbS90ZXN0c3Vp
dGUvc2ltL29yMWsvYWRycC5TIHwgNzMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysKPiAgMSBmaWxlIGNoYW5nZWQsIDczIGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IHNpbS90ZXN0c3VpdGUvc2ltL29yMWsvYWRycC5TCj4gCj4gZGlmZiAtLWdpdCBhL3NpbS90
ZXN0c3VpdGUvc2ltL29yMWsvYWRycC5TIGIvc2ltL3Rlc3RzdWl0ZS9zaW0vb3Ixay9hZHJwLlMK
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLmJhMzg0Y2NjODQKPiAt
LS0gL2Rldi9udWxsCj4gKysrIGIvc2ltL3Rlc3RzdWl0ZS9zaW0vb3Ixay9hZHJwLlMKPiBAQCAt
MCwwICsxLDczIEBACj4gKy8qIFRlc3RzIHRoZSBsb2FkIHBhZ2UgYWRkcmVzcyBpbnN0cnVjdGlv
bi4KPiArCj4gKyAgIENvcHlyaWdodCAoQykgMjAxNy0yMDE5IEZyZWUgU29mdHdhcmUgRm91bmRh
dGlvbiwgSW5jLgoKVGhpcyBkYXRlIHJhbmdlIHNob3VsZCBqdXN0IGJlICcyMDE5Jy4KCj4gKwo+
ICsgICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUg
aXQgYW5kL29yIG1vZGlmeQo+ICsgICBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5l
cmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQo+ICsgICB0aGUgRnJlZSBTb2Z0d2Fy
ZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAzIG9mIHRoZSBMaWNlbnNlLCBvcgo+ICsgICAo
YXQgeW91ciBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLgo+ICsKPiArICAgVGhpcyBwcm9ncmFt
IGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCj4gKyAg
IGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJh
bnR5IG9mCj4gKyAgIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIg
UFVSUE9TRS4gIFNlZSB0aGUKPiArICAgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1v
cmUgZGV0YWlscy4KPiArCj4gKyAgIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2Yg
dGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlCj4gKyAgIGFsb25nIHdpdGggdGhpcyBwcm9n
cmFtLiAgSWYgbm90LCBzZWUgPGh0dHA6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+LiAgKi8KPiAr
Cj4gKyMgbWFjaDogb3Ixawo+ICsjIG91dHB1dDogcmVwb3J0KDB4MDAwMDIwNjQpO1xuCj4gKyMg
b3V0cHV0OiByZXBvcnQoMHgwMDAxMjEzOCk7XG4KPiArIyBvdXRwdXQ6IHJlcG9ydCgweDAwMDAy
MDAwKTtcbgo+ICsjIG91dHB1dDogcmVwb3J0KDB4MDAwMTIwMDApO1xuCj4gKyMgb3V0cHV0OiBy
ZXBvcnQoMHgwMDAwMjAwMCk7XG4KPiArIyBvdXRwdXQ6IHJlcG9ydCgweDAwMDE0MDAwKTtcbgo+
ICsjIG91dHB1dDogcmVwb3J0KDB4MDAwMDAwMDApO1xuCj4gKyMgb3V0cHV0OiBleGl0KDApXG4K
PiArCj4gKyNpbmNsdWRlICJvcjFrLWFzbS10ZXN0LWhlbHBlcnMuaCIKPiArCj4gKwlTVEFOREFS
RF9URVNUX0VOVklST05NRU5UCj4gKwo+ICsJLnNlY3Rpb24gLmRhdGEKPiArCS5vcmcgMHgxMDAw
MAo+ICsJLmFsaWduIDQKPiArCS50eXBlICAgcGksIEBvYmplY3QKPiArCS5zaXplICAgcGksIDQK
PiArcGk6Cj4gKwkuZmxvYXQJMy4xNDE1OQo+ICsKPiArCS5zZWN0aW9uIC50ZXh0Cj4gK3N0YXJ0
X3Rlc3RzOgo+ICsJUFVTSCBMSU5LX1JFR0lTVEVSX1I5Cj4gKwo+ICsJLyogUHJpbnQgb3V0IHRo
ZSBQQy4gIFRvIGNvbXBhcmUgd2l0aCB0aGF0IGxvYWRlZCBieSBsLmFkcnAuICAqLwo+ICsJbC5q
YWwJY2FwdHVyZV9wYwo+ICsJIGwubm9wCj4gK2NhcHR1cmVfcGM6Cj4gKwlSRVBPUlRfUkVHX1RP
X0NPTlNPTEUgcjkKPiArCj4gKwkvKiBQcmludCBvdXQgb3VyIGRhdGEgYWRkcmVzcyB0byBjb21w
YXJlZCB3aXRoIGwuYWRycCBvZmZzZXQuICAqLwo+ICsJbC5tb3ZoaQlyMTEsIGhhKHBpKQo+ICsJ
bC5hZGRpCXIxMSwgcjExLCBsbyhwaSkKPiArCVJFUE9SVF9SRUdfVE9fQ09OU09MRSByMTEKPiAr
Cj4gKwkvKiBUZXN0IGwuYWRycCB3aXRoIHN5bWJvbHMsIGxvYWRzIHBhZ2Ugb2Ygc3ltYm9sIHRv
IHJlZ2lzdGVyLiAgKi8KPiArCWwuYWRycAlyNCwgc3RhcnRfdGVzdHMKPiArCVJFUE9SVF9SRUdf
VE9fQ09OU09MRSByNAo+ICsKPiArCWwuYWRycAlyNCwgcGkKPiArCVJFUE9SVF9SRUdfVE9fQ09O
U09MRSByNAo+ICsKPiArCS8qIFRlc3QgbC5hZHJwIHdpdGggaW1tZWRpYXRlLCBpbW1lZGlhdGUg
aXMgdGhlIHBhZ2Ugb2Zmc2V0LiAgKi8KPiArCWwuYWRycAlyNCwgMHgwCj4gKwlSRVBPUlRfUkVH
X1RPX0NPTlNPTEUgcjQKPiArCj4gKwlsLmFkcnAJcjQsIDB4MTIwMDAKPiArCVJFUE9SVF9SRUdf
VE9fQ09OU09MRSByNAo+ICsKPiArCWwuYWRycAlyNCwgLTB4MjAwMAo+ICsJUkVQT1JUX1JFR19U
T19DT05TT0xFIHI0Cj4gKwo+ICsJUE9QIExJTktfUkVHSVNURVJfUjkKPiArCVJFVFVSTl9UT19M
SU5LX1JFR0lTVEVSX1I5Cj4gLS0gCj4gMi4yMS4wCj4gCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0Bs
aXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZv
L29wZW5yaXNjCg==
