Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id BF4EE44F0F4
	for <lists+openrisc@lfdr.de>; Sat, 13 Nov 2021 04:16:56 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A3215242A5;
	Sat, 13 Nov 2021 04:16:56 +0100 (CET)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mail.librecores.org (Postfix) with ESMTPS id 853EA24189
 for <openrisc@lists.librecores.org>; Sat, 13 Nov 2021 04:16:54 +0100 (CET)
Received: by mail-pl1-f182.google.com with SMTP id v20so9934201plo.7
 for <openrisc@lists.librecores.org>; Fri, 12 Nov 2021 19:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QI3kUSvB1mOc0Qq5i1435r8ObrrjgsHmzyf2QlGnJiw=;
 b=VQdLx/FKBKWYz+84OM3z7TT3H25bEMNLy4nkX3lTv5DqUp1YbLG2lNem4J7KDIyAOe
 MUY3cRE4hVxq2gE2F41/WHyMriVZB+4xSJs4XwoD6j2l0iG8OfFIhZkxzehW7114ryBF
 qh/7VSDrsHqnMC5/L+J6z8oeoDZsZXKMmxnZSlptgoUyaHqrumndyDKVn0Ow/zFJD9UK
 lL0D3VQ1hOQrdZoCd+Buk6wBePMRP2VhlDlOQ5MEIrmzEGm3hm63zfziZ3XNW8viLSF7
 zmLvWLRpaAcf1TMgsjFG21ZPuE3Jk9hZBAWPaNdBr/oSHAl/PvtcqpAHhwcWBs2QA8ro
 2hgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QI3kUSvB1mOc0Qq5i1435r8ObrrjgsHmzyf2QlGnJiw=;
 b=QitJex9a2Cy2Y7bhWzDA4OnFYV1eVtl0kwG0yQmg1SIVS+3f/M54DxkHh44TRlTBN9
 dllVHUoLdtrkqYEzE/WfOh1T8BSXjLQQA0TAc+fnh4bKgH0RdCEWjncMtjWPaDQUdDP0
 GwYv5tiowCUCSrbjsKri+sAs2uUKPB0Z7S9ON/1P9naSWFvfQ+dlepKGHvDFblpOBEaG
 jbzFsIZS8cuWo6H9gqAMivQYLUrZpspGKWq7dDeNZA0iWES+qcjs9La+PDTu9Piowqw4
 8R38CzXZhVdPV9K23c9c17UyMgCJkw6/N5EWQKUaJOUWvpZC+k36wLAtjfF0W7bOrEmG
 ITHA==
X-Gm-Message-State: AOAM532fir7jCqJrLSXPUT2Orv9G+Fq89/zqhxDIEQlSi3VHBbjXohn/
 3eu5xdwrw7//q36tGCD/lgnDJsaUh/g=
X-Google-Smtp-Source: ABdhPJwmBXoSK5NwgcgC0LzHwPJ73J1CHwNiIJUZoXENDJQehVTZGvfir9DV0IehMGpkkKK3P3Al8w==
X-Received: by 2002:a17:903:285:b0:142:7a83:6dd2 with SMTP id
 j5-20020a170903028500b001427a836dd2mr13640919plr.59.1636773412819; 
 Fri, 12 Nov 2021 19:16:52 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id h3sm12078734pjz.43.2021.11.12.19.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 19:16:52 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: GLIBC patches <libc-alpha@sourceware.org>
Date: Sat, 13 Nov 2021 12:16:29 +0900
Message-Id: <20211113031639.2402161-4-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211113031639.2402161-1-shorne@gmail.com>
References: <20211113031639.2402161-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v2 03/13] or1k: ABI Implementation
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
Cc: Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VGhpcyBjb2RlIGRlYWxzIHdpdGggdGhlIE9wZW5SSVNDIEFCSS4KLS0tCiBzeXNkZXBzL29yMWsv
X19sb25nam1wLlMgICAgICAgfCA1NSArKysrKysrKysrKysrKysrKysrKysrKwogc3lzZGVwcy9v
cjFrL2JpdHMvZW5kaWFubmVzcy5oIHwgMTEgKysrKysKIHN5c2RlcHMvb3Ixay9iaXRzL3NldGpt
cC5oICAgICB8IDMyICsrKysrKysrKysrKysKIHN5c2RlcHMvb3Ixay9ic2QtX3NldGptcC5TICAg
ICB8ICAxICsKIHN5c2RlcHMvb3Ixay9ic2Qtc2V0am1wLlMgICAgICB8ICAxICsKIHN5c2RlcHMv
b3Ixay9kbC10cmFtcG9saW5lLlMgICB8IDc5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrCiBzeXNkZXBzL29yMWsvam1wYnVmLW9mZnNldHMuaCAgfCAyMyArKysrKysrKysrCiBzeXNk
ZXBzL29yMWsvam1wYnVmLXVud2luZC5oICAgfCAzNSArKysrKysrKysrKysrKysKIHN5c2RlcHMv
b3Ixay9tYWNoaW5lLWdtb24uaCAgICB8IDM1ICsrKysrKysrKysrKysrKwogc3lzZGVwcy9vcjFr
L21lbXVzYWdlLmggICAgICAgIHwgMjAgKysrKysrKysrCiBzeXNkZXBzL29yMWsvc2V0am1wLlMg
ICAgICAgICAgfCA1NiArKysrKysrKysrKysrKysrKysrKysrKwogc3lzZGVwcy9vcjFrL3N5c2Rl
cC5oICAgICAgICAgIHwgODIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMTIg
ZmlsZXMgY2hhbmdlZCwgNDMwIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBzeXNk
ZXBzL29yMWsvX19sb25nam1wLlMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBzeXNkZXBzL29yMWsvYml0
cy9lbmRpYW5uZXNzLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBzeXNkZXBzL29yMWsvYml0cy9zZXRq
bXAuaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHN5c2RlcHMvb3Ixay9ic2QtX3NldGptcC5TCiBjcmVh
dGUgbW9kZSAxMDA2NDQgc3lzZGVwcy9vcjFrL2JzZC1zZXRqbXAuUwogY3JlYXRlIG1vZGUgMTAw
NjQ0IHN5c2RlcHMvb3Ixay9kbC10cmFtcG9saW5lLlMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBzeXNk
ZXBzL29yMWsvam1wYnVmLW9mZnNldHMuaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHN5c2RlcHMvb3Ix
ay9qbXBidWYtdW53aW5kLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBzeXNkZXBzL29yMWsvbWFjaGlu
ZS1nbW9uLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBzeXNkZXBzL29yMWsvbWVtdXNhZ2UuaAogY3Jl
YXRlIG1vZGUgMTAwNjQ0IHN5c2RlcHMvb3Ixay9zZXRqbXAuUwogY3JlYXRlIG1vZGUgMTAwNjQ0
IHN5c2RlcHMvb3Ixay9zeXNkZXAuaAoKZGlmZiAtLWdpdCBhL3N5c2RlcHMvb3Ixay9fX2xvbmdq
bXAuUyBiL3N5c2RlcHMvb3Ixay9fX2xvbmdqbXAuUwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCAwMDAwMDAwMDAwLi5mOGFhNWRkYThmCi0tLSAvZGV2L251bGwKKysrIGIvc3lzZGVwcy9vcjFr
L19fbG9uZ2ptcC5TCkBAIC0wLDAgKzEsNTUgQEAKKy8qIGxvbmdqbXAsIE9wZW5SSVNDIHZlcnNp
b24uCisgICBDb3B5cmlnaHQgKEMpIDIwMjEgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMu
CisgICBUaGlzIGZpbGUgaXMgcGFydCBvZiB0aGUgR05VIEMgTGlicmFyeS4KKworICAgVGhlIEdO
VSBDIExpYnJhcnkgaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5k
L29yCisgICBtb2RpZnkgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgTGVzc2VyIEdlbmVy
YWwgUHVibGljCisgICBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBG
b3VuZGF0aW9uOyBlaXRoZXIKKyAgIHZlcnNpb24gMi4xIG9mIHRoZSBMaWNlbnNlLCBvciAoYXQg
eW91ciBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLgorCisgICBUaGUgR05VIEMgTGlicmFyeSBp
cyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAorICAgYnV0
IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkg
b2YKKyAgIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9T
RS4gIFNlZSB0aGUgR05VCisgICBMZXNzZXIgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9y
ZSBkZXRhaWxzLgorCisgICBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBH
TlUgTGVzc2VyIEdlbmVyYWwgUHVibGljCisgICBMaWNlbnNlIGFsb25nIHdpdGggdGhlIEdOVSBD
IExpYnJhcnk7IGlmIG5vdCwgd3JpdGUgdG8gdGhlIEZyZWUKKyAgIFNvZnR3YXJlIEZvdW5kYXRp
b24sIEluYy4sIDU5IFRlbXBsZSBQbGFjZSwgU3VpdGUgMzMwLCBCb3N0b24sIE1BCisgICAwMjEx
MS0xMzA3IFVTQS4gICovCisKKyNpbmNsdWRlIDxmZWF0dXJlcy5oPgorI2RlZmluZSBfQVNNCisj
ZGVmaW5lIF9TRVRKTVBfSAorI2luY2x1ZGUgPGJpdHMvc2V0am1wLmg+CisKKwkuZ2xvYmwJX19s
b25nam1wOworCS50eXBlCV9fbG9uZ2ptcCwgQGZ1bmN0aW9uOworCS5hbGlnbgk0OworCitfX2xv
bmdqbXA6CisJbC5sd3oJcjEsIDAocjMpCisJbC5sd3oJcjIsIDQocjMpCisKKwkvKiBpZiByNCBp
cyAwLCBzb21ldGhpbmcgd3JvbmcsIHNvIHNldCBpdCB0byAxICovCisJbC5zZmVxaQlyNCwgMHgw
CisJbC5ibmYJMWYJCS8qIHI0ICE9IDAsIGxvbmdqbXAgdmFsdWUgc2Vuc2libGUgKi8KKwkgbC5u
b3AKKwlsLm9yaQlyNCwgcjAsIDB4MQkvKiBtYWtlIG5vbnplcm8gKi8KKzE6CisJbC5hZGRpCXIx
MSwgcjQsIDAKKwlsLmx3eglyOSwgOChyMykKKwlsLmx3eglyMTAsIDEyKHIzKQorCWwubHd6CXIx
NCwgMTYocjMpCisJbC5sd3oJcjE2LCAyMChyMykKKwlsLmx3eglyMTgsIDI0KHIzKQorCWwubHd6
CXIyMCwgMjgocjMpCisJbC5sd3oJcjIyLCAzMihyMykKKwlsLmx3eglyMjQsIDM2KHIzKQorCWwu
bHd6CXIyNiwgNDAocjMpCisJbC5sd3oJcjI4LCA0NChyMykKKwlsLmx3eglyMzAsIDQ4KHIzKQor
CWwuanIJcjkKKwkgbC5ub3AKKwkuc2l6ZQlfX2xvbmdqbXAsIC4gLSBfX2xvbmdqbXAKKworbGli
Y19oaWRkZW5fZGVmKF9fbG9uZ2ptcCkKZGlmZiAtLWdpdCBhL3N5c2RlcHMvb3Ixay9iaXRzL2Vu
ZGlhbm5lc3MuaCBiL3N5c2RlcHMvb3Ixay9iaXRzL2VuZGlhbm5lc3MuaApuZXcgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi43YjYxZDhhZGI3Ci0tLSAvZGV2L251bGwKKysrIGIv
c3lzZGVwcy9vcjFrL2JpdHMvZW5kaWFubmVzcy5oCkBAIC0wLDAgKzEsMTEgQEAKKyNpZm5kZWYg
X0JJVFNfRU5ESUFOTkVTU19ICisjZGVmaW5lIF9CSVRTX0VORElBTk5FU1NfSCAxCisKKyNpZm5k
ZWYgX0JJVFNfRU5ESUFOX0gKKyMgZXJyb3IgIk5ldmVyIHVzZSA8Yml0cy9lbmRpYW5uZXNzLmg+
IGRpcmVjdGx5OyBpbmNsdWRlIDxlbmRpYW4uaD4gaW5zdGVhZC4iCisjZW5kaWYKKworLyogT3Bl
blJJU0MgaXMgYmlnLWVuZGlhbi4gICovCisjZGVmaW5lIF9fQllURV9PUkRFUiBfX0JJR19FTkRJ
QU4KKworI2VuZGlmIC8qIGJpdHMvZW5kaWFubmVzcy5oICovCmRpZmYgLS1naXQgYS9zeXNkZXBz
L29yMWsvYml0cy9zZXRqbXAuaCBiL3N5c2RlcHMvb3Ixay9iaXRzL3NldGptcC5oCm5ldyBmaWxl
IG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmRhYzUxMWM5MDQKLS0tIC9kZXYvbnVsbAor
KysgYi9zeXNkZXBzL29yMWsvYml0cy9zZXRqbXAuaApAQCAtMCwwICsxLDMyIEBACisvKiBEZWZp
bmUgdGhlIG1hY2hpbmUtZGVwZW5kZW50IHR5cGUgYGptcF9idWYnLiAgT3BlblJJU0MgdmVyc2lv
bi4KKyAgIENvcHlyaWdodCAoQykgMjAyMSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIEluYy4K
KyAgIFRoaXMgZmlsZSBpcyBwYXJ0IG9mIHRoZSBHTlUgQyBMaWJyYXJ5LgorCisgICBUaGUgR05V
IEMgTGlicmFyeSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQv
b3IKKyAgIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBMZXNzZXIgR2VuZXJh
bCBQdWJsaWMKKyAgIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZv
dW5kYXRpb247IGVpdGhlcgorICAgdmVyc2lvbiAyLjEgb2YgdGhlIExpY2Vuc2UsIG9yIChhdCB5
b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24uCisKKyAgIFRoZSBHTlUgQyBMaWJyYXJ5IGlz
IGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCisgICBidXQg
V0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBv
ZgorICAgTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NF
LiAgU2VlIHRoZSBHTlUKKyAgIExlc3NlciBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3Jl
IGRldGFpbHMuCisKKyAgIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdO
VSBMZXNzZXIgR2VuZXJhbCBQdWJsaWMKKyAgIExpY2Vuc2UgYWxvbmcgd2l0aCB0aGUgR05VIEMg
TGlicmFyeTsgaWYgbm90LCB3cml0ZSB0byB0aGUgRnJlZQorICAgU29mdHdhcmUgRm91bmRhdGlv
biwgSW5jLiwgNTkgVGVtcGxlIFBsYWNlLCBTdWl0ZSAzMzAsIEJvc3RvbiwgTUEKKyAgIDAyMTEx
LTEzMDcgVVNBLiAgKi8KKworCisjaWZuZGVmIF9PUjFLX0JJVFNfU0VUSk1QX0gKKyNkZWZpbmUg
X09SMUtfQklUU19TRVRKTVBfSCAgMQorCisjaWYgIWRlZmluZWQgX1NFVEpNUF9IICYmICFkZWZp
bmVkIF9QVEhSRUFEX0gKKyMgZXJyb3IgIk5ldmVyIGluY2x1ZGUgPGJpdHMvc2V0am1wLmg+IGRp
cmVjdGx5OyB1c2UgPHNldGptcC5oPiBpbnN0ZWFkLiIKKyNlbmRpZgorCisjaWZuZGVmIF9BU00K
K3R5cGVkZWYgbG9uZyBpbnQgX19qbXBfYnVmWzEzXTsKKyNlbmRpZgorCisjZW5kaWYgLyogX09S
MUtfQklUU19TRVRKTVBfSCAqLwpkaWZmIC0tZ2l0IGEvc3lzZGVwcy9vcjFrL2JzZC1fc2V0am1w
LlMgYi9zeXNkZXBzL29yMWsvYnNkLV9zZXRqbXAuUwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCAwMDAwMDAwMDAwLi40ZTZhMmRhNTYwCi0tLSAvZGV2L251bGwKKysrIGIvc3lzZGVwcy9vcjFr
L2JzZC1fc2V0am1wLlMKQEAgLTAsMCArMSBAQAorLyogX3NldGptcCBpcyBpbiBzZXRqbXAuUyAg
Ki8KZGlmZiAtLWdpdCBhL3N5c2RlcHMvb3Ixay9ic2Qtc2V0am1wLlMgYi9zeXNkZXBzL29yMWsv
YnNkLXNldGptcC5TCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjFkYTg0
OGQyZjEKLS0tIC9kZXYvbnVsbAorKysgYi9zeXNkZXBzL29yMWsvYnNkLXNldGptcC5TCkBAIC0w
LDAgKzEgQEAKKy8qIHNldGptcCBpcyBpbiBzZXRqbXAuUyAgKi8KZGlmZiAtLWdpdCBhL3N5c2Rl
cHMvb3Ixay9kbC10cmFtcG9saW5lLlMgYi9zeXNkZXBzL29yMWsvZGwtdHJhbXBvbGluZS5TCm5l
dyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmI4MmIyZTBlN2MKLS0tIC9kZXYv
bnVsbAorKysgYi9zeXNkZXBzL29yMWsvZGwtdHJhbXBvbGluZS5TCkBAIC0wLDAgKzEsNzkgQEAK
Ky8qIE1hY2hpbmUtZGVwZW5kZW50IEVMRiBydW50aW1lIHN5bWJvbCByZXNvbHV0aW9uLCBPcGVu
UklTQyB2ZXJzaW9uLgorICAgQ29weXJpZ2h0IChDKSAyMDIxIEZyZWUgU29mdHdhcmUgRm91bmRh
dGlvbiwgSW5jLgorICAgVGhpcyBmaWxlIGlzIHBhcnQgb2YgdGhlIEdOVSBDIExpYnJhcnkuCisK
KyAgIFRoZSBHTlUgQyBMaWJyYXJ5IGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmli
dXRlIGl0IGFuZC9vcgorICAgbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIExl
c3NlciBHZW5lcmFsIFB1YmxpYworICAgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkgdGhlIEZyZWUg
U29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyCisgICB2ZXJzaW9uIDIuMSBvZiB0aGUgTGljZW5z
ZSwgb3IgKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4KKworICAgVGhlIEdOVSBD
IExpYnJhcnkgaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1
bCwKKyAgIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVk
IHdhcnJhbnR5IG9mCisgICBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNV
TEFSIFBVUlBPU0UuICBTZWUgdGhlIEdOVQorICAgTGVzc2VyIEdlbmVyYWwgUHVibGljIExpY2Vu
c2UgZm9yIG1vcmUgZGV0YWlscy4KKworICAgWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29w
eSBvZiB0aGUgR05VIExlc3NlciBHZW5lcmFsIFB1YmxpYworICAgTGljZW5zZSBhbG9uZyB3aXRo
IHRoZSBHTlUgQyBMaWJyYXJ5OyBpZiBub3QsIHdyaXRlIHRvIHRoZSBGcmVlCisgICBTb2Z0d2Fy
ZSBGb3VuZGF0aW9uLCBJbmMuLCA1OSBUZW1wbGUgUGxhY2UsIFN1aXRlIDMzMCwgQm9zdG9uLCBN
QQorICAgMDIxMTEtMTMwNyBVU0EuICAqLworCisvKiBUaGlzIGNvZGUgaXMgdXNlZCB0byBjYWxs
IF9kbF9saW51eF9yZXNvbHZlciAoZGwtcnVudGltZS5jKS4KKworICAgV2UgYXNzdW1lIHRoYXQg
UjExIGNvbnRhaW4gcmVsb2NhdGlvbiBvZmZzZXQgYW5kIFIxMiBjb250YWlucworICAgbGlua19t
YXAgKF9EWU5BTUlDKS4gVGhpcyBtdXN0IGJlIGNvbnNpc3RlbnQgd2l0aCB0aGUgSlVNUF9TTE9U
CisgICBsYXlvdXQgZ2VuZXJhdGVkIGJ5IGJpbnV0aWxzLiAqLworCisJLnNlY3Rpb24gLnRleHQK
KwkuYWxpZ24gNAorCisJLmdsb2JhbAlfZGxfcnVudGltZV9yZXNvbHZlCisJLnR5cGUJX2RsX3J1
bnRpbWVfcmVzb2x2ZSwgQGZ1bmN0aW9uCisKK19kbF9ydW50aW1lX3Jlc29sdmU6CisJLmNmaV9z
dGFydHByb2MKKwlsLnN3CS00KHIxKSwgcjkKKwlsLnN3CS04KHIxKSwgcjEKKworCS8qIHNhdmUg
ZnVuY3Rpb24gYXJndW1lbnRzLiAgKi8KKwlsLnN3CS0xMihyMSksIHIzCisJbC5zdwktMTYocjEp
LCByNAorCWwuc3cJLTIwKHIxKSwgcjUKKwlsLnN3CS0yNChyMSksIHI2CisJbC5zdwktMjgocjEp
LCByNworCWwuc3cJLTMyKHIxKSwgcjgKKworCS5jZmlfb2Zmc2V0IDksIC00CisJLmNmaV9vZmZz
ZXQgMSwgLTgKKwkuY2ZpX29mZnNldCAzLCAtMTIKKwkuY2ZpX29mZnNldCA0LCAtMTYKKwkuY2Zp
X29mZnNldCA1LCAtMjAKKwkuY2ZpX29mZnNldCA2LCAtMjQKKwkuY2ZpX29mZnNldCA3LCAtMjgK
KwkuY2ZpX29mZnNldCA4LCAtMzIKKworCWwuYWRkaQlyMSxyMSwgLTMyCisJLmNmaV9kZWZfY2Zh
X29mZnNldCAzMgorCisJbC5vcmkJcjMsIHIxMiwgMAorCWwub3JpCXI0LCByMTEsIDAKKworCWwu
amFsCV9kbF9maXh1cAorCSBsLm5vcAorCisJLyogUmVzdG9yZSBmdW5jdGlvbiBhcmd1bWVudHMu
ICAqLworCWwuYWRkaQlyMSxyMSwgMzIKKwlsLmx3eglyOCwgLTMyKHIxKQorCWwubHd6CXI3LCAt
MjgocjEpCisJbC5sd3oJcjYsIC0yNChyMSkKKwlsLmx3eglyNSwgLTIwKHIxKQorCWwubHd6CXI0
LCAtMTYocjEpCisJbC5sd3oJcjMsIC0xMihyMSkKKworCS8qIHJlc3RvcmUgcmV0dXJuIGFkZHJl
c3MuICAqLworCWwubHd6CXI5LCAtNChyMSkKKworCWwuanIJcjExCisJIGwubm9wCisKKwkuY2Zp
X2VuZHByb2MKKwkuc2l6ZQlfZGxfcnVudGltZV9yZXNvbHZlLCAuIC0gX2RsX3J1bnRpbWVfcmVz
b2x2ZQpkaWZmIC0tZ2l0IGEvc3lzZGVwcy9vcjFrL2ptcGJ1Zi1vZmZzZXRzLmggYi9zeXNkZXBz
L29yMWsvam1wYnVmLW9mZnNldHMuaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAw
MDAwLi5hY2Y2NTM3Mzk1Ci0tLSAvZGV2L251bGwKKysrIGIvc3lzZGVwcy9vcjFrL2ptcGJ1Zi1v
ZmZzZXRzLmgKQEAgLTAsMCArMSwyMyBAQAorLyogUHJpdmF0ZSBtYWNyb3MgZm9yIGFjY2Vzc2lu
ZyBfX2ptcF9idWYgY29udGVudHMuICBPcGVuUklTQyB2ZXJzaW9uLgorICAgQ29weXJpZ2h0IChD
KSAyMDIxIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgSW5jLgorICAgVGhpcyBmaWxlIGlzIHBh
cnQgb2YgdGhlIEdOVSBDIExpYnJhcnkuCisKKyAgIFRoZSBHTlUgQyBMaWJyYXJ5IGlzIGZyZWUg
c29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcgorICAgbW9kaWZ5IGl0IHVu
ZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIExlc3NlciBHZW5lcmFsIFB1YmxpYworICAgTGljZW5z
ZSBhcyBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyCisg
ICB2ZXJzaW9uIDIuMSBvZiB0aGUgTGljZW5zZSwgb3IgKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0
ZXIgdmVyc2lvbi4KKworICAgVGhlIEdOVSBDIExpYnJhcnkgaXMgZGlzdHJpYnV0ZWQgaW4gdGhl
IGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwKKyAgIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5U
WTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCisgICBNRVJDSEFOVEFCSUxJ
VFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlIEdOVQorICAg
TGVzc2VyIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KKworICAgWW91
IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIExlc3NlciBHZW5lcmFsIFB1
YmxpYworICAgTGljZW5zZSBhbG9uZyB3aXRoIHRoZSBHTlUgQyBMaWJyYXJ5LiAgSWYgbm90LCBz
ZWUKKyAgIDxodHRwczovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uICAqLworCisjZGVmaW5lIF9f
Sk1QX0JVRl9TUCAgICAwCisKKy8qIEhlbHBlciBmb3IgZ2VuZXJpYyBfX19fbG9uZ2ptcF9jaGso
KS4gKi8KKyNkZWZpbmUgSkJfRlJBTUVfQUREUkVTUyhidWYpIFwKKyAgICAoKHZvaWQgKikgKHVu
c2lnbmVkIGxvbmcpIChidWZbX19KTVBfQlVGX1NQXSkpCmRpZmYgLS1naXQgYS9zeXNkZXBzL29y
MWsvam1wYnVmLXVud2luZC5oIGIvc3lzZGVwcy9vcjFrL2ptcGJ1Zi11bndpbmQuaApuZXcgZmls
ZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi45ODI3Yzc0NzQ0Ci0tLSAvZGV2L251bGwK
KysrIGIvc3lzZGVwcy9vcjFrL2ptcGJ1Zi11bndpbmQuaApAQCAtMCwwICsxLDM1IEBACisvKiBD
b3B5cmlnaHQgKEMpIDIwMjEgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMuCisgICBUaGlz
IGZpbGUgaXMgcGFydCBvZiB0aGUgR05VIEMgTGlicmFyeS4KKworICAgVGhlIEdOVSBDIExpYnJh
cnkgaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yCisgICBt
b2RpZnkgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgTGVzc2VyIEdlbmVyYWwgUHVibGlj
CisgICBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9u
OyBlaXRoZXIKKyAgIHZlcnNpb24gMi4xIG9mIHRoZSBMaWNlbnNlLCBvciAoYXQgeW91ciBvcHRp
b24pIGFueSBsYXRlciB2ZXJzaW9uLgorCisgICBUaGUgR05VIEMgTGlicmFyeSBpcyBkaXN0cmli
dXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAorICAgYnV0IFdJVEhPVVQg
QU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKKyAgIE1F
UkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0
aGUgR05VCisgICBMZXNzZXIgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxz
LgorCisgICBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgTGVzc2Vy
IEdlbmVyYWwgUHVibGljCisgICBMaWNlbnNlIGFsb25nIHdpdGggdGhlIEdOVSBDIExpYnJhcnku
ICBJZiBub3QsIHNlZQorICAgPGh0dHBzOi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4gICovCisK
KyNpbmNsdWRlIDxzZXRqbXAuaD4KKyNpbmNsdWRlIDxqbXBidWYtb2Zmc2V0cy5oPgorI2luY2x1
ZGUgPHN0ZGludC5oPgorI2luY2x1ZGUgPHVud2luZC5oPgorCisvKiBUZXN0IGlmIGxvbmdqbXAg
dG8gSk1QQlVGIHdvdWxkIHVud2luZCB0aGUgZnJhbWUKKyAgIGNvbnRhaW5pbmcgYSBsb2NhbCB2
YXJpYWJsZSBhdCBBRERSRVNTLiAgKi8KKyNkZWZpbmUgX0pNUEJVRl9VTldJTkRTKGptcGJ1Ziwg
YWRkcmVzcywgZGVtYW5nbGUpIFwKKyAgKCh2b2lkICopIChhZGRyZXNzKSA8ICh2b2lkICopIGRl
bWFuZ2xlIChqbXBidWZbX19KTVBfQlVGX1NQXSkpCisKKyNkZWZpbmUgX0pNUEJVRl9DRkFfVU5X
SU5EU19BREooX2ptcGJ1ZiwgX2NvbnRleHQsIF9hZGopIFwKKyAgX0pNUEJVRl9VTldJTkRTX0FE
SiAoX2ptcGJ1ZiwgKHZvaWQgKikgX1Vud2luZF9HZXRDRkEgKF9jb250ZXh0KSwgX2FkaikKKwor
I2RlZmluZSBfSk1QQlVGX1VOV0lORFNfQURKKF9qbXBidWYsIF9hZGRyZXNzLCBfYWRqKSBcCisg
ICgodWludHB0cl90KSAoX2FkZHJlc3MpIC0gKF9hZGopIDwgKHVpbnRwdHJfdCkgKF9qbXBidWYp
W19fSk1QX0JVRl9TUF0gLSAoX2FkaikpCisKKy8qIFdlIHVzZSB0aGUgbm9ybWFsIGxvbmdqbXAg
Zm9yIHVud2luZGluZy4gICovCisjZGVmaW5lIF9fbGliY191bndpbmRfbG9uZ2ptcChidWYsIHZh
bCkgX19saWJjX2xvbmdqbXAgKGJ1ZiwgdmFsKQpkaWZmIC0tZ2l0IGEvc3lzZGVwcy9vcjFrL21h
Y2hpbmUtZ21vbi5oIGIvc3lzZGVwcy9vcjFrL21hY2hpbmUtZ21vbi5oCm5ldyBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjcxNTIxMDVlZWMKLS0tIC9kZXYvbnVsbAorKysgYi9z
eXNkZXBzL29yMWsvbWFjaGluZS1nbW9uLmgKQEAgLTAsMCArMSwzNSBAQAorLyogTWFjaGluZS1k
ZXBlbmRlbnQgZGVmaW5pdGlvbnMgZm9yIHByb2ZpbGluZyBzdXBwb3J0LiAgT3BlblJJU0MgdmVy
c2lvbi4KKyAgIENvcHlyaWdodCAoQykgMjAyMSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIElu
Yy4KKyAgIFRoaXMgZmlsZSBpcyBwYXJ0IG9mIHRoZSBHTlUgQyBMaWJyYXJ5LgorCisgICBUaGUg
R05VIEMgTGlicmFyeSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBh
bmQvb3IKKyAgIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBMZXNzZXIgR2Vu
ZXJhbCBQdWJsaWMKKyAgIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJl
IEZvdW5kYXRpb247IGVpdGhlcgorICAgdmVyc2lvbiAyLjEgb2YgdGhlIExpY2Vuc2UsIG9yIChh
dCB5b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24uCisKKyAgIFRoZSBHTlUgQyBMaWJyYXJ5
IGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCisgICBi
dXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50
eSBvZgorICAgTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQ
T1NFLiAgU2VlIHRoZSBHTlUKKyAgIExlc3NlciBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBt
b3JlIGRldGFpbHMuCisKKyAgIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhl
IEdOVSBMZXNzZXIgR2VuZXJhbCBQdWJsaWMKKyAgIExpY2Vuc2UgYWxvbmcgd2l0aCB0aGUgR05V
IEMgTGlicmFyeS4gIElmIG5vdCwgc2VlCisgICA8aHR0cHM6Ly93d3cuZ251Lm9yZy9saWNlbnNl
cy8+LiAgKi8KKworI2luY2x1ZGUgPHN5c2RlcC5oPgorCisjZGVmaW5lIF9NQ09VTlRfREVDTChm
cm9tcGMsIHNlbGZwYykJCQkJCVwKK3N0YXRpYyB2b2lkCQkJCQkJCQlcCitfX21jb3VudF9pbnRl
cm5hbCAodW5zaWduZWQgbG9uZyBpbnQgZnJvbXBjLCB1bnNpZ25lZCBsb25nIGludCBzZWxmcGMp
CisKKy8qIFRoaXMgaXMgdmVyeSBzaW1wbGUgYXMgZ2NjIGRvZXMgYWxsIHRoZSBoZWF2eSBsaWZ0
aW5nIGF0IHRoZSBfbWNvdW50CisgICBjYWxsIHNpdGUuICBHQ0MgcGFzc2VzIGluIHRoZSByZXR1
cm4gYWRkcmVzcyBvZiB0aGUgZnVuY3Rpb24gY2FsbGluZworICAgX21jb3VudC4gICovCisKKyNk
ZWZpbmUgTUNPVU5UCQkJCQkJCQlcCit2b2lkCQkJCQkJCQkJXAorX21jb3VudCAodm9pZCAqZnJv
bXBjKQkJCQkJCQlcCit7CQkJCQkJCQkJXAorICBfX21jb3VudF9pbnRlcm5hbCAoKHVuc2lnbmVk
IGxvbmcgaW50KSBmcm9tcGMsCQkJXAorCQkgICAgICh1bnNpZ25lZCBsb25nIGludCkgX19idWls
dGluX3JldHVybl9hZGRyZXNzICgwKSk7CVwKK30KZGlmZiAtLWdpdCBhL3N5c2RlcHMvb3Ixay9t
ZW11c2FnZS5oIGIvc3lzZGVwcy9vcjFrL21lbXVzYWdlLmgKbmV3IGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggMDAwMDAwMDAwMC4uNjFmNWJkNWEwNQotLS0gL2Rldi9udWxsCisrKyBiL3N5c2RlcHMv
b3Ixay9tZW11c2FnZS5oCkBAIC0wLDAgKzEsMjAgQEAKKy8qIENvcHlyaWdodCAoQykgMjAyMSBG
cmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIEluYy4KKyAgIFRoaXMgZmlsZSBpcyBwYXJ0IG9mIHRo
ZSBHTlUgQyBMaWJyYXJ5LgorCisgICBUaGUgR05VIEMgTGlicmFyeSBpcyBmcmVlIHNvZnR3YXJl
OyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKKyAgIG1vZGlmeSBpdCB1bmRlciB0aGUg
dGVybXMgb2YgdGhlIEdOVSBMZXNzZXIgR2VuZXJhbCBQdWJsaWMKKyAgIExpY2Vuc2UgYXMgcHVi
bGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlcgorICAgdmVyc2lv
biAyLjEgb2YgdGhlIExpY2Vuc2UsIG9yIChhdCB5b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNp
b24uCisKKyAgIFRoZSBHTlUgQyBMaWJyYXJ5IGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRo
YXQgaXQgd2lsbCBiZSB1c2VmdWwsCisgICBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhv
dXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgorICAgTUVSQ0hBTlRBQklMSVRZIG9yIEZJ
VE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZSBHTlUKKyAgIExlc3NlciBH
ZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCisKKyAgIFlvdSBzaG91bGQg
aGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBMZXNzZXIgR2VuZXJhbCBQdWJsaWMKKyAg
IExpY2Vuc2UgYWxvbmcgd2l0aCB0aGUgR05VIEMgTGlicmFyeTsgaWYgbm90LCBzZWUKKyAgIDxo
dHRwczovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uICAqLworCisjZGVmaW5lIEdFVFNQKCkgKHsg
cmVnaXN0ZXIgdWludHB0cl90IHN0YWNrX3B0ciBhc20gKCJyMSIpOyBzdGFja19wdHI7IH0pCisK
KyNpbmNsdWRlIDxzeXNkZXBzL2dlbmVyaWMvbWVtdXNhZ2UuaD4KZGlmZiAtLWdpdCBhL3N5c2Rl
cHMvb3Ixay9zZXRqbXAuUyBiL3N5c2RlcHMvb3Ixay9zZXRqbXAuUwpuZXcgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMDAwMDAwMDAwLi42NjA5OTViNDkzCi0tLSAvZGV2L251bGwKKysrIGIvc3lz
ZGVwcy9vcjFrL3NldGptcC5TCkBAIC0wLDAgKzEsNTYgQEAKKy8qIHNldGptcCwgT3BlblJJU0Mg
dmVyc2lvbi4KKyAgIENvcHlyaWdodCAoQykgMjAyMSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24s
IEluYy4KKyAgIFRoaXMgZmlsZSBpcyBwYXJ0IG9mIHRoZSBHTlUgQyBMaWJyYXJ5LgorCisgICBU
aGUgR05VIEMgTGlicmFyeSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBp
dCBhbmQvb3IKKyAgIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBMZXNzZXIg
R2VuZXJhbCBQdWJsaWMKKyAgIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3
YXJlIEZvdW5kYXRpb247IGVpdGhlcgorICAgdmVyc2lvbiAyLjEgb2YgdGhlIExpY2Vuc2UsIG9y
IChhdCB5b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24uCisKKyAgIFRoZSBHTlUgQyBMaWJy
YXJ5IGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCisg
ICBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJy
YW50eSBvZgorICAgTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQ
VVJQT1NFLiAgU2VlIHRoZSBHTlUKKyAgIExlc3NlciBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZv
ciBtb3JlIGRldGFpbHMuCisKKyAgIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2Yg
dGhlIEdOVSBMZXNzZXIgR2VuZXJhbCBQdWJsaWMKKyAgIExpY2Vuc2UgYWxvbmcgd2l0aCB0aGUg
R05VIEMgTGlicmFyeTsgaWYgbm90LCB3cml0ZSB0byB0aGUgRnJlZQorICAgU29mdHdhcmUgRm91
bmRhdGlvbiwgSW5jLiwgNTkgVGVtcGxlIFBsYWNlLCBTdWl0ZSAzMzAsIEJvc3RvbiwgTUEKKyAg
IDAyMTExLTEzMDcgVVNBLiAgKi8KKworI2luY2x1ZGUgPHN5c2RlcC5oPgorI2RlZmluZSBfQVNN
CisjZGVmaW5lIF9TRVRKTVBfSAorI2luY2x1ZGUgPGJpdHMvc2V0am1wLmg+CisKK0VOVFJZIChf
c2V0am1wKQorCWwuYWRkaQlyNCwgcjAsIDAgICAgIC8qIFNldCBzZWNvbmQgYXJndW1lbnQgdG8g
MC4gICovCisJbC5qCS5Mb2NhbF9fc2lnc2V0am1wCisJIGwubm9wCitFTkQgKF9zZXRqbXApCits
aWJjX2hpZGRlbl9kZWYgKF9zZXRqbXApCisKK0VOVFJZIChzZXRqbXApCisJbC5hZGRpCXI0LCBy
MCwgMSAgICAgLyogU2V0IHNlY29uZCBhcmd1bWVudCB0byAxLiAgKi8KKwlsLmoJLkxvY2FsX19z
aWdzZXRqbXAKKwkgbC5ub3AKK0VORCAoc2V0am1wKQorCitFTlRSWSAoX19zaWdzZXRqbXApCisu
TG9jYWxfX3NpZ3NldGptcDoKKwlsLnN3CTAocjMpLCByMQorCWwuc3cJNChyMyksIHIyCisJbC5z
dwk4KHIzKSwgcjkKKwlsLnN3CTEyKHIzKSwgcjEwCisJbC5zdwkxNihyMyksIHIxNAorCWwuc3cJ
MjAocjMpLCByMTYKKwlsLnN3CTI0KHIzKSwgcjE4CisJbC5zdwkyOChyMyksIHIyMAorCWwuc3cJ
MzIocjMpLCByMjIKKwlsLnN3CTM2KHIzKSwgcjI0CisJbC5zdwk0MChyMyksIHIyNgorCWwuc3cJ
NDQocjMpLCByMjgKKwlsLnN3CTQ4KHIzKSwgcjMwCisJbC5qCV9fc2lnam1wX3NhdmUKKwkgbC5u
b3AKK0VORCAoX19zaWdzZXRqbXApCitoaWRkZW5fZGVmIChfX3NpZ3NldGptcCkKZGlmZiAtLWdp
dCBhL3N5c2RlcHMvb3Ixay9zeXNkZXAuaCBiL3N5c2RlcHMvb3Ixay9zeXNkZXAuaApuZXcgZmls
ZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi42ZGEzMjgzZjQ1Ci0tLSAvZGV2L251bGwK
KysrIGIvc3lzZGVwcy9vcjFrL3N5c2RlcC5oCkBAIC0wLDAgKzEsODIgQEAKKy8qIENvcHlyaWdo
dCAoQykgMjAyMSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIEluYy4KKyAgIFRoaXMgZmlsZSBp
cyBwYXJ0IG9mIHRoZSBHTlUgQyBMaWJyYXJ5LgorCisgICBUaGUgR05VIEMgTGlicmFyeSBpcyBm
cmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKKyAgIG1vZGlmeSBp
dCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBMZXNzZXIgR2VuZXJhbCBQdWJsaWMKKyAgIExp
Y2Vuc2UgYXMgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhl
cgorICAgdmVyc2lvbiAyLjEgb2YgdGhlIExpY2Vuc2UsIG9yIChhdCB5b3VyIG9wdGlvbikgYW55
IGxhdGVyIHZlcnNpb24uCisKKyAgIFRoZSBHTlUgQyBMaWJyYXJ5IGlzIGRpc3RyaWJ1dGVkIGlu
IHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCisgICBidXQgV0lUSE9VVCBBTlkgV0FS
UkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgorICAgTUVSQ0hBTlRB
QklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZSBHTlUK
KyAgIExlc3NlciBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCisKKyAg
IFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBMZXNzZXIgR2VuZXJh
bCBQdWJsaWMKKyAgIExpY2Vuc2UgYWxvbmcgd2l0aCB0aGUgR05VIEMgTGlicmFyeS4gIElmIG5v
dCwgc2VlCisgICA8aHR0cHM6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+LiAgKi8KKworI2luY2x1
ZGUgPHN5c2RlcHMvZ2VuZXJpYy9zeXNkZXAuaD4KKyNpbmNsdWRlIDxmZWF0dXJlcy5oPgorCisj
aWYgZGVmaW5lZCBfX0FTU0VNQkxFUl9fIHx8IGRlZmluZWQgUkVRVUVTVF9BU1NFTUJMRVJfTUFD
Uk9TCisKKy8qIE1ha2UgdXNlIG9mIC5zaXplIGRpcmVjdGl2ZS4gICovCisjZGVmaW5lIEFTTV9T
SVpFX0RJUkVDVElWRShuYW1lKSAuc2l6ZSBuYW1lLC4tbmFtZTsKKworLyogRGVmaW5lIGFuIGVu
dHJ5IHBvaW50IHZpc2libGUgZnJvbSBDLiAgKi8KKyNkZWZpbmUgRU5UUlkobmFtZSkgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKKyAg
Lmdsb2JsIENfU1lNQk9MX05BTUUobmFtZSk7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwKKyAgLnR5cGUgQ19TWU1CT0xfTkFNRShuYW1lKSxAZnVuY3Rp
b247ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKKyAgLmFsaWduIDQ7
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKKyAgQ19MQUJFTChuYW1lKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKKyAgY2ZpX3N0YXJ0cHJvYzsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFwKKyAgQ0FMTF9NQ09VTlQKKworI3VuZGVmICBFTkQKKyNkZWZpbmUgRU5EKG5hbWUpICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwK
KyAgY2ZpX2VuZHByb2M7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKKyAgQVNNX1NJWkVfRElSRUNUSVZFKG5hbWUpCisKKy8q
IFNpbmNlIEMgaWRlbnRpZmllcnMgYXJlIG5vdCBub3JtYWxseSBwcmVmaXhlZCB3aXRoIGFuIHVu
ZGVyc2NvcmUKKyAgIG9uIHRoaXMgc3lzdGVtLCB0aGUgYXNtIGlkZW50aWZpZXIgYHN5c2NhbGxf
ZXJyb3InIGludHJ1ZGVzIG9uIHRoZQorICAgQyBuYW1lIHNwYWNlLiAgTWFrZSBzdXJlIHdlIHVz
ZSBhbiBpbm5vY3VvdXMgbmFtZS4gICovCisjZGVmaW5lIHN5c2NhbGxfZXJyb3IgICBfX3N5c2Nh
bGxfZXJyb3IKKworLyogSWYgY29tcGlsZWQgZm9yIHByb2ZpbGluZywgY2FsbCBgbWNvdW50JyBh
dCB0aGUgc3RhcnQgb2YgZWFjaCBmdW5jdGlvbi4gICovCisjaWZkZWYgIFBST0YKKyMgaWZkZWYg
X19QSUNfXworIyAgZGVmaW5lIENBTExfTUNPVU5UCQkJCQkJXAorCWwuYWRkaQlyMSwgcjEsIC04
OwkJCQkJXAorCWwuc3cJMChyMSksIHI5OwkJCQkJXAorCWwuc3cJNChyMSksIHIzOwkJCQkJXAor
CWwub3JpCXIzLCByOSwgMDsJCQkJCVwKKwlsLmoJcGx0KF9tY291bnQpOwkJCQkJXAorCSBsLm5v
cDsJCQkJCQkJXAorCWwubHd6CXI5LCAwKHIxKTsJCQkJCVwKKwlsLmx3eglyMywgNChyMSk7CQkJ
CQlcCisJbC5hZGRpCXIxLCByMSwgODsKKyMgZWxzZQorIyAgZGVmaW5lIENBTExfTUNPVU5UCQkJ
CQkJXAorCWwuYWRkaQlyMSwgcjEsIC04OwkJCQkJXAorCWwuc3cJMChyMSksIHI5OwkJCQkJXAor
CWwuc3cJNChyMSksIHIzOwkJCQkJXAorCWwub3JpCXIzLCByOSwgMDsJCQkJCVwKKwlsLm1vdmhp
IHIxNSwgaGkoX21jb3VudCk7CQkJCVwKKwlsLm9yaQlyMTUsIHIxNSwgbG8oX21jb3VudCk7CQkJ
CVwKKwlsLmpyCXIxNTsJCQkJCQlcCisJIGwubm9wOwkJCQkJCQlcCisJbC5sd3oJcjksIDAocjEp
OwkJCQkJXAorCWwubHd6CXIzLCA0KHIxKTsJCQkJCVwKKwlsLmFkZGkJcjEsIHIxLCA4OworIyBl
bmRpZgorI2Vsc2UKKyMgZGVmaW5lIENBTExfTUNPVU5UICAgICAgICAgICAgIC8qIERvIG5vdGhp
bmcuICAqLworI2VuZGlmCisKKy8qIExvY2FsIGxhYmVsIG5hbWUgZm9yIGFzbSBjb2RlLiAqLwor
I2RlZmluZSBMKG5hbWUpICAgICAgICAgLkwjI25hbWUKKworLyogU3BlY2lmeSB0aGUgc2l6ZSBp
biBieXRlcyBvZiBhIG1hY2hpbmUgcmVnaXN0ZXIuICAqLworI2RlZmluZSBSRUdTSVpFICAgICAg
ICAgNAorCisjZW5kaWYgLyogX19BU1NFTUJMRVJfXyAqLwotLSAKMi4zMS4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxp
c3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVz
Lm9yZy9saXN0aW5mby9vcGVucmlzYwo=
