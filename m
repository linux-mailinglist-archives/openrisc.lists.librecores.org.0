Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id F2823A3FB8
	for <lists+openrisc@lfdr.de>; Fri, 30 Aug 2019 23:37:12 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8970E204E0;
	Fri, 30 Aug 2019 23:37:12 +0200 (CEST)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by mail.librecores.org (Postfix) with ESMTPS id 97794201E8
 for <openrisc@lists.librecores.org>; Fri, 30 Aug 2019 23:37:10 +0200 (CEST)
Received: by mail-pg1-f195.google.com with SMTP id e11so4157367pga.5
 for <openrisc@lists.librecores.org>; Fri, 30 Aug 2019 14:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5ZJeOqu6NGW5ReU1+ss0ndWVetc6Ty8l6hEGfriglSc=;
 b=YZz7kxK8exT4DPcSfDKAPERz8RaG2HJ2qO4a1q+g6/Xqw+qm9gVWfCl3asmZzfs/TB
 TG+0PbXW46NgNlzMaCKKolvK5gcD16cbAM5H/UuJCJovH3mx1S+dtBhG4pOD5KNaTbpk
 oXrQocyKh9rlPOQ1h8ICADVxqDTe8/+h5JBZbKIL2wtZ48fik9IeacwYKeCKrZEo32vW
 j+P7WxrxwO/iAb+uK2vVA1w8O2F9Tms3pFwA05WmrTsq/u5Z8lj4J/LT3L+0YyRzbY7w
 x0SvciGfmUsI67WLzcFCVwT4z9oZ2liRw4l38WGMonGFVKM767JpF+TvoZLDEuahjhNR
 GxJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5ZJeOqu6NGW5ReU1+ss0ndWVetc6Ty8l6hEGfriglSc=;
 b=Vg8FQlsRG5LE+RKOWqKRXKnoSu13bEVVhkLXmIJ8M94Izg1jKp2BD3eGm8XjunKTn9
 C2jJ/QPOYu/lliHvSCPKIRKNf68sMvSl8PxaDlsebvXQARRPei5bOsac5ziZewf5EdK0
 lXacPrA+6qEeDKdORfIVWb1M4ssQALoPqK2VD+6Gcv6ut03tS6myDQmei4Hq7FR209vo
 8m3HAk24HPWh1A0mjk3fgVegaqTeC88YkIX7oemHZ/Ch5RD9vXxJU3X1TWbqETjKJcJE
 yMQ/EXYolJic+65asP/YO5zBtw6yrYxYxyazcDzgKN4OClH71Z4XYSosLpkFhbASLKlq
 STEw==
X-Gm-Message-State: APjAAAVYgRHfEW1VFw5Ph2Y7hjyuFQpILSibq+oX0eSniAd1SnutljDW
 igqhaQZRjMY9wJH2ThqIsaU=
X-Google-Smtp-Source: APXvYqydk+dQkOhAhq/I+0GcTtiPHE9RNX+y8VVPHlmMgiDmJqiHT4rpVdDbqCHdu04aZSVRPHoICA==
X-Received: by 2002:a62:7911:: with SMTP id u17mr4286792pfc.162.1567201028634; 
 Fri, 30 Aug 2019 14:37:08 -0700 (PDT)
Received: from localhost (g75.222-224-160.ppp.wakwak.ne.jp. [222.224.160.75])
 by smtp.gmail.com with ESMTPSA id
 t9sm6022284pgj.89.2019.08.30.14.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2019 14:37:07 -0700 (PDT)
Date: Sat, 31 Aug 2019 06:37:05 +0900
From: Stafford Horne <shorne@gmail.com>
To: Richard Henderson <rth@twiddle.net>
Message-ID: <20190830213705.GV24874@lianli.shorne-pla.net>
References: <20190822114404.1318-1-shorne@gmail.com>
 <20190830093101.GU24874@lianli.shorne-pla.net>
 <796f2b6f-e81f-6150-0349-d6ee3c884981@twiddle.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <796f2b6f-e81f-6150-0349-d6ee3c884981@twiddle.net>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [OpenRISC] [PATCH] or1k: Fix issue with set_got clobbering r9
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
 GCC patches <gcc-patches@gcc.gnu.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gRnJpLCBBdWcgMzAsIDIwMTkgYXQgMDg6MjE6NTZBTSAtMDcwMCwgUmljaGFyZCBIZW5kZXJz
b24gd3JvdGU6Cj4gTEdUTS4KClRoYW5rIHlvdS4KIAo+IE9uIDgvMzAvMTkgMjozMSBBTSwgU3Rh
ZmZvcmQgSG9ybmUgd3JvdGU6Cj4gPiBIZWxsbywgYW55IGNvbW1lbnRzIG9uIHRoaXM/Cj4gPiAK
PiA+IElmIG5vdGhpbmcgSSB3aWxsIGNvbW1pdCBpbiBhIGZldyBkYXlzLgo+ID4gCj4gPiBPbiBU
aHUsIEF1ZyAyMiwgMjAxOSBhdCAwODo0NDowNFBNICswOTAwLCBTdGFmZm9yZCBIb3JuZSB3cm90
ZToKPiA+PiBXaGVuIGNvbXBpbGluZyBnbGliYyB3ZSBmb3VuZCB0aGF0IHRoZSBHT1QgcmVnaXN0
ZXIgd2FzIGJlaW5nIGFsbG9jYXRlZAo+ID4+IHI5IHdoZW4gdGhlIGluc3RydWN0aW9uIHdhcyBz
dGlsbCBzZXRfZ290X3RtcC4gIFRoYXQgY2F1c2VkIHNldF9nb3QgdG8KPiA+PiBjbG9iYmVyIHI5
LiAgV2UgY2Fubm90IHNpbXBseSBzYXkgc2V0X2dvdF90bXAgY2xvYmJlcnMgcjkgYXMgdGhpcyBp
cyB0aGUKPiA+PiByZWFzb24gZm9yIGhhdmluZyB0aGUgdGVtcG9yYXJ5IHNldF9nb3RfdG1wLgo+
ID4+Cj4gPj4gRml4IGJ5IHVzaW5nIGEgcmVnaXN0ZXIgY2xhc3MgY29uc3RyYWludCB0aGF0IGRv
ZXMgbm90IGFsbG93IHI5IGR1cmluZwo+ID4+IHJlZ2lzdGVyIGFsbG9jYXRpb24uCj4gPj4KPiA+
PiBnY2MvQ2hhbmdlTG9nOgo+ID4+Cj4gPj4gCSogY29uZmlnL29yMWsvY29uc3RyYWludHMubWQg
KHQpOiBOZXcgY29uc3RyYWludC4KPiA+PiAJKiBjb25maWcvb3Ixay9vcjFrLmggKEdPVF9SRUdT
KTogTmV3IHJlZ2lzdGVyIGNsYXNzLgo+ID4+IAkqIGNvbmZpZy9vcjFrL29yMWsubWQgKHNldF9n
b3RfdG1wLCBzZXRfZ290KTogVXNlIHQgY29udHJhaW50Lgo+ID4+IC0tLQo+ID4+ICBnY2MvY29u
ZmlnL29yMWsvY29uc3RyYWludHMubWQgfCA0ICsrKysKPiA+PiAgZ2NjL2NvbmZpZy9vcjFrL29y
MWsuaCAgICAgICAgIHwgMyArKysKPiA+PiAgZ2NjL2NvbmZpZy9vcjFrL29yMWsubWQgICAgICAg
IHwgNCArKy0tCj4gPj4gIDMgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2djYy9jb25maWcvb3Ixay9jb25zdHJhaW50
cy5tZCBiL2djYy9jb25maWcvb3Ixay9jb25zdHJhaW50cy5tZAo+ID4+IGluZGV4IDhjYWM3ZWI1
MzI5Li5iYTMzMGM2YjhjMiAxMDA2NDQKPiA+PiAtLS0gYS9nY2MvY29uZmlnL29yMWsvY29uc3Ry
YWludHMubWQKPiA+PiArKysgYi9nY2MvY29uZmlnL29yMWsvY29uc3RyYWludHMubWQKPiA+PiBA
QCAtMjUsNiArMjUsNyBAQAo+ID4+ICA7IFdlIHVzZToKPiA+PiAgOyAgYyAtIHNpYmNhbGwgcmVn
aXN0ZXJzCj4gPj4gIDsgIGQgLSBkb3VibGUgcGFpciBiYXNlIHJlZ2lzdGVycyAoZXhjbHVkZXMg
cjAsIHIzMCBhbmQgcjMxIHdoaWNoIG92ZXJmbG93KQo+ID4+ICs7ICB0IC0gZ290IGFkZHJlc3Mg
cmVnaXN0ZXJzIChleGNsdWRlcyByOSBpcyBjbG9iYmVyZWQgYnkgc2V0X2dvdCkKPiA+IAo+ID4g
SSB3aWxsIGNoYW5nZWUgdGhpcyB0byAoLi4uIHI5IHdoaWNoIGlzIGNsb2JiZXJlZCAuLi4pCj4g
PiAKPiA+PiAgOyAgSSAtIGNvbnN0YW50IHNpZ25lZCAxNi1iaXQKPiA+PiAgOyAgSyAtIGNvbnN0
YW50IHVuc2lnbmVkIDE2LWJpdAo+ID4+ICA7ICBNIC0gY29uc3RhbnQgc2lnbmVkIDE2LWJpdCBz
aGlmdGVkIGxlZnQgMTYtYml0cyAobC5tb3ZoaSkKPiA+PiBAQCAtMzYsNiArMzcsOSBAQAo+ID4+
ICAoZGVmaW5lX3JlZ2lzdGVyX2NvbnN0cmFpbnQgImQiICJET1VCTEVfUkVHUyIKPiA+PiAgICAi
UmVnaXN0ZXJzIHdoaWNoIGNhbiBiZSB1c2VkIGZvciBkb3VibGUgcmVnIHBhaXJzLiIpCj4gPj4g
IAo+ID4+ICsoZGVmaW5lX3JlZ2lzdGVyX2NvbnN0cmFpbnQgInQiICJHT1RfUkVHUyIKPiA+PiAr
ICAiUmVnaXN0ZXJzIHdoaWNoIGNhbiBiZSB1c2VkIHRvIHN0b3JlIHRoZSBHbG9iYWwgT2Zmc2V0
IFRhYmxlIChHT1QpIGFkZHJlc3MuIikKPiA+PiArCj4gPj4gIDs7IEltbWVkaWF0ZXMKPiA+PiAg
KGRlZmluZV9jb25zdHJhaW50ICJJIgo+ID4+ICAgICJBIHNpZ25lZCAxNi1iaXQgaW1tZWRpYXRl
IGluIHRoZSByYW5nZSAtMzI3NjggdG8gMzI3NjcuIgo+ID4+IGRpZmYgLS1naXQgYS9nY2MvY29u
ZmlnL29yMWsvb3Ixay5oIGIvZ2NjL2NvbmZpZy9vcjFrL29yMWsuaAo+ID4+IGluZGV4IDJiMjll
NjJmZGQzLi40YzMyNjA3YmFjMSAxMDA2NDQKPiA+PiAtLS0gYS9nY2MvY29uZmlnL29yMWsvb3Ix
ay5oCj4gPj4gKysrIGIvZ2NjL2NvbmZpZy9vcjFrL29yMWsuaAo+ID4+IEBAIC0xOTAsNiArMTkw
LDcgQEAgZW51bSByZWdfY2xhc3MKPiA+PiAgICBOT19SRUdTLAo+ID4+ICAgIFNJQkNBTExfUkVH
UywKPiA+PiAgICBET1VCTEVfUkVHUywKPiA+PiArICBHT1RfUkVHUywKPiA+PiAgICBHRU5FUkFM
X1JFR1MsCj4gPj4gICAgRkxBR19SRUdTLAo+ID4+ICAgIEFMTF9SRUdTLAo+ID4+IEBAIC0yMDIs
NiArMjAzLDcgQEAgZW51bSByZWdfY2xhc3MKPiA+PiAgICAiTk9fUkVHUyIsIAkJCVwKPiA+PiAg
ICAiU0lCQ0FMTF9SRUdTIiwJCVwKPiA+PiAgICAiRE9VQkxFX1JFR1MiLAkJXAo+ID4+ICsgICJH
T1RfUkVHUyIsCQkJXAo+ID4+ICAgICJHRU5FUkFMX1JFR1MiLAkJXAo+ID4+ICAgICJGTEFHX1JF
R1MiLAkJCVwKPiA+PiAgICAiQUxMX1JFR1MiIH0KPiA+PiBAQCAtMjE1LDYgKzIxNyw3IEBAIGVu
dW0gcmVnX2NsYXNzCj4gPj4gIHsgeyAweDAwMDAwMDAwLCAweDAwMDAwMDAwIH0sCVwKPiA+PiAg
ICB7IFNJQkNBTExfUkVHU19NQVNLLCAgIDAgfSwJXAo+ID4+ICAgIHsgMHg3ZjdmZmZmZSwgMHgw
MDAwMDAwMCB9LAlcCj4gPj4gKyAgeyAweGZmZmZmZGZmLCAweDAwMDAwMDAwIH0sCVwKPiA+PiAg
ICB7IDB4ZmZmZmZmZmYsIDB4MDAwMDAwMDMgfSwJXAo+ID4+ICAgIHsgMHgwMDAwMDAwMCwgMHgw
MDAwMDAwNCB9LAlcCj4gPj4gICAgeyAweGZmZmZmZmZmLCAweDAwMDAwMDA3IH0JXAo+ID4+IGRp
ZmYgLS1naXQgYS9nY2MvY29uZmlnL29yMWsvb3Ixay5tZCBiL2djYy9jb25maWcvb3Ixay9vcjFr
Lm1kCj4gPj4gaW5kZXggY2VlMTFkMDc4Y2MuLjM2YmNlZTMzNmFiIDEwMDY0NAo+ID4+IC0tLSBh
L2djYy9jb25maWcvb3Ixay9vcjFrLm1kCj4gPj4gKysrIGIvZ2NjL2NvbmZpZy9vcjFrL29yMWsu
bWQKPiA+PiBAQCAtNzA2LDcgKzcwNiw3IEBACj4gPj4gIDs7IHNldF9nb3QgcGF0dGVybiBiZWxv
dy4gIFRoaXMgd29ya3MgYmVjYXVzZSB0aGUgc2V0X2dvdF90bXAgaW5zbiBpcyB0aGUKPiA+PiAg
OzsgZmlyc3QgaW5zbiBpbiB0aGUgc3RyZWFtIGFuZCB0aGF0IGl0IGlzbid0IG1vdmVkIGR1cmlu
ZyBSQS4KPiA+PiAgKGRlZmluZV9pbnNuICJzZXRfZ290X3RtcCIKPiA+PiAtICBbKHNldCAobWF0
Y2hfb3BlcmFuZDpTSSAwICJyZWdpc3Rlcl9vcGVyYW5kIiAiPXIiKQo+ID4+ICsgIFsoc2V0ICht
YXRjaF9vcGVyYW5kOlNJIDAgInJlZ2lzdGVyX29wZXJhbmQiICI9dCIpCj4gPj4gIAkodW5zcGVj
X3ZvbGF0aWxlOlNJIFsoY29uc3RfaW50IDApXSBVTlNQRUNWX1NFVF9HT1QpKV0KPiA+PiAgICAi
Igo+ID4+ICB7Cj4gPj4gQEAgLTcxNSw3ICs3MTUsNyBAQAo+ID4+ICAKPiA+PiAgOzsgVGhlIGlu
c24gdG8gaW5pdGlhbGl6ZSB0aGUgR09ULgo+ID4+ICAoZGVmaW5lX2luc24gInNldF9nb3QiCj4g
Pj4gLSAgWyhzZXQgKG1hdGNoX29wZXJhbmQ6U0kgMCAicmVnaXN0ZXJfb3BlcmFuZCIgIj1yIikK
PiA+PiArICBbKHNldCAobWF0Y2hfb3BlcmFuZDpTSSAwICJyZWdpc3Rlcl9vcGVyYW5kIiAiPXQi
KQo+ID4+ICAJKHVuc3BlYzpTSSBbKGNvbnN0X2ludCAwKV0gVU5TUEVDX1NFVF9HT1QpKQo+ID4+
ICAgICAoY2xvYmJlciAocmVnOlNJIExSX1JFR05VTSkpXQo+ID4+ICAgICIiCj4gPj4gLS0gCj4g
Pj4gMi4yMS4wCj4gPj4KPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMu
b3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
