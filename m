Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id EA067408B51
	for <lists+openrisc@lfdr.de>; Mon, 13 Sep 2021 14:48:40 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D12DB24183;
	Mon, 13 Sep 2021 14:48:40 +0200 (CEST)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mail.librecores.org (Postfix) with ESMTPS id 302C021016
 for <openrisc@lists.librecores.org>; Mon, 13 Sep 2021 14:48:39 +0200 (CEST)
Received: by mail-pg1-f179.google.com with SMTP id f129so9354664pgc.1
 for <openrisc@lists.librecores.org>; Mon, 13 Sep 2021 05:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vSq8R34tQ+zIyqGIe+r5nu+terplmtnoknsbAkSd/Ks=;
 b=bJFc4wF/Xybn1kDgVwq1vNvviszZcSsupx1U8qFSrL5KcU2C9Z/z3pVVHULO8Ax5lM
 MVys4cspcoKbyuKhxkoCQQJ/gOpDc3JwPm0Y02w8Gx8YO8bXQmgI2qnBZRKYHqBhEDtd
 SDcKeGlx4atWMfYd3/vWDAyxFaezyhDiarv9MbKywpLFAfalbj9yijtC/98wBOkJscgW
 orbkQASDBosZgr9Fb3J/0p5zY0gpDECIj/UnzwCAdquvAMrdZBJowPl6xFIIQca7N9G0
 7u7ffQZOmYoQB2DQmFrWAM1ypPTexwxwiYaB0sRYQohUAvBEyeue7Er10Os14gpK5Yoh
 wwyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vSq8R34tQ+zIyqGIe+r5nu+terplmtnoknsbAkSd/Ks=;
 b=DSI10yp/p496cHMFL4+vjVWV+1+9cYuNP2T+5tcrUYZ6+KLj56CYM80uX5ZpEyFJXN
 NSpHotE2dHnbbX+FcnXl40+YywONYuR7HWsJ89Pc/tydox/5YIKZr3eTYh9lQwiyFekg
 7VImenRBOVCA9LxVWCRpUQi+CuDau2sx07aH/9VD+kNr3Q2yGffnuuBn92VPlVCWqFkt
 XhLIq9j/J3AutoOcDYIygnSS3F3sdfk7e7Kc2zSDVrZ24C7n+9BVxOaWenKV/CvWsPyc
 L83E5K8PWer0II71jYw9zEYsh9E6GkY6yByRBtvv4aDaGtosUUO0e+vFIMIHkiFArKDb
 d79g==
X-Gm-Message-State: AOAM530LFS3oOE/cwo5pMR36khAh76rHtkuqYMrY2Hb5HssMG+hkCp+1
 Z1c9MSJao+KUYmuuKe7qJfk=
X-Google-Smtp-Source: ABdhPJyyxZWqw5B1NsliMIsyTlNab3u9jyyF3/yykgDaDD0HxIn3d+Qns5xsp4+B3hgELNGH6uYzuw==
X-Received: by 2002:a63:ea58:: with SMTP id l24mr11149214pgk.334.1631537317738; 
 Mon, 13 Sep 2021 05:48:37 -0700 (PDT)
Received: from localhost (g245.61-45-50.ppp.wakwak.ne.jp. [61.45.50.245])
 by smtp.gmail.com with ESMTPSA id h24sm7319115pfn.180.2021.09.13.05.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 05:48:37 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: GDB patches <gdb-patches@sourceware.org>
Date: Mon, 13 Sep 2021 21:48:00 +0900
Message-Id: <20210913124800.471680-6-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210913124800.471680-1-shorne@gmail.com>
References: <20210913124800.471680-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 5/5] gdb: or1k: add single step for linux native
 debugging
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

TmVlZGVkIGZvciBzaW5nbGUgc3RlcHBpbmcgaW4gTGludXgsIHRoaXMgYWRkcyB0aGUgb3IxayBp
bXBsZW1lbnRhdGlvbgpvZiBvcjFrX3NvZnR3YXJlX3NpbmdsZV9zdGVwLiAgTW9zdCBvZiB0aGUg
aW1wbGVtZW50YXRpb24gaXMgYm9ycm93ZWQKZnJvbSB0aGUgYmFyZSBtZXRhbCBzaW5nbGUgc3Rl
cCBjb2RlIGZyb20gb3Ixa19zaW5nbGVfc3RlcF90aHJvdWdoX2RlbGF5CndoaWNoIGhhcyBiZWVu
IGV4dHJhY3RlZCBhbmQgc2hhcmVkIGluIGhlbHBlciBmdW5jdGlvbgpvcjFrX2RlbGF5X3Nsb3Rf
cC4KLS0tCiBnZGIvb3Ixay1saW51eC10ZGVwLmMgfCAgMiArKwogZ2RiL29yMWstdGRlcC5jICAg
ICAgIHwgNjYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQogZ2Ri
L29yMWstdGRlcC5oICAgICAgIHwgIDUgKysrKwogMyBmaWxlcyBjaGFuZ2VkLCA1NCBpbnNlcnRp
b25zKCspLCAxOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9nZGIvb3Ixay1saW51eC10ZGVw
LmMgYi9nZGIvb3Ixay1saW51eC10ZGVwLmMKaW5kZXggYTcxYTgyMDJiMWUuLjYzYzQxNzFlMjk1
IDEwMDY0NAotLS0gYS9nZGIvb3Ixay1saW51eC10ZGVwLmMKKysrIGIvZ2RiL29yMWstbGludXgt
dGRlcC5jCkBAIC0xNTQsNiArMTU0LDggQEAgb3Ixa19saW51eF9pbml0X2FiaSAoc3RydWN0IGdk
YmFyY2hfaW5mbyBpbmZvLCBzdHJ1Y3QgZ2RiYXJjaCAqZ2RiYXJjaCkKICAgLyogR05VL0xpbnV4
IHVzZXMgdGhlIGR5bmFtaWMgbGlua2VyIGluY2x1ZGVkIGluIHRoZSBHTlUgQyBMaWJyYXJ5LiAg
Ki8KICAgc2V0X2dkYmFyY2hfc2tpcF9zb2xpYl9yZXNvbHZlciAoZ2RiYXJjaCwgZ2xpYmNfc2tp
cF9zb2xpYl9yZXNvbHZlcik7CiAKKyAgc2V0X2dkYmFyY2hfc29mdHdhcmVfc2luZ2xlX3N0ZXAg
KGdkYmFyY2gsIG9yMWtfc29mdHdhcmVfc2luZ2xlX3N0ZXApOworCiAgIC8qIEVuYWJsZSBUTFMg
c3VwcG9ydC4gICovCiAgIHNldF9nZGJhcmNoX2ZldGNoX3Rsc19sb2FkX21vZHVsZV9hZGRyZXNz
IChnZGJhcmNoLAogCQkJCQkgICAgIHN2cjRfZmV0Y2hfb2JqZmlsZV9saW5rX21hcCk7CmRpZmYg
LS1naXQgYS9nZGIvb3Ixay10ZGVwLmMgYi9nZGIvb3Ixay10ZGVwLmMKaW5kZXggOTFmMjE1NzZi
ZDUuLjViZjYxN2U3OGM0IDEwMDY0NAotLS0gYS9nZGIvb3Ixay10ZGVwLmMKKysrIGIvZ2RiL29y
MWstdGRlcC5jCkBAIC0zNDYsNiArMzQ2LDMzIEBAIGNvbnN0ZXhwciBnZGJfYnl0ZSBvcjFrX2Jy
ZWFrX2luc25bXSA9IHsweDIxLCAweDAwLCAweDAwLCAweDAxfTsKIAogdHlwZWRlZiBCUF9NQU5J
UFVMQVRJT04gKG9yMWtfYnJlYWtfaW5zbikgb3Ixa19icmVha3BvaW50OwogCitzdGF0aWMgaW50
CitvcjFrX2RlbGF5X3Nsb3RfcCAoc3RydWN0IGdkYmFyY2ggKmdkYmFyY2gsIENPUkVfQUREUiBw
YykKK3sKKyAgY29uc3QgQ0dFTl9JTlNOICppbnNuOworICBDR0VOX0ZJRUxEUyB0bXBfZmllbGRz
OworICBzdHJ1Y3QgZ2RiYXJjaF90ZGVwICp0ZGVwID0gZ2RiYXJjaF90ZGVwIChnZGJhcmNoKTsK
KworICBpbnNuID0gY2dlbl9sb29rdXBfaW5zbiAodGRlcC0+Z2RiX2NnZW5fY3B1X2Rlc2MsCisJ
CQkgICBOVUxMLAorCQkJICAgb3Ixa19mZXRjaF9pbnN0cnVjdGlvbiAoZ2RiYXJjaCwgcGMpLAor
CQkJICAgTlVMTCwgMzIsICZ0bXBfZmllbGRzLCAwKTsKKworICAvKiBOVUxMIGhlcmUgd291bGQg
bWVhbiB0aGUgbGFzdCBpbnN0cnVjdGlvbiB3YXMgbm90IHVuZGVyc3Rvb2QgYnkgY2dlbi4KKyAg
ICAgVGhpcyBzaG91bGQgbm90IHVzdWFsbHkgaGFwcGVuLCBidXQgaWYgZG9lcyBpdHMgbm90IGEg
ZGVsYXkgc2xvdC4gICovCisgIGlmIChpbnNuID09IE5VTEwpCisgICAgcmV0dXJuIDA7CisKKyAg
LyogVE9ETzogd2Ugc2hvdWxkIGFkZCBhIGRlbGF5IHNsb3QgZmxhZyB0byB0aGUgQ0dFTl9JTlNO
IGFuZCByZW1vdmUKKyAgICAgdGhpcyBoYXJkIGNvZGVkIHRlc3QuICAqLworICByZXR1cm4gKChD
R0VOX0lOU05fTlVNIChpbnNuKSA9PSBPUjFLX0lOU05fTF9KKQorCSAgfHwgKENHRU5fSU5TTl9O
VU0gKGluc24pID09IE9SMUtfSU5TTl9MX0pBTCkKKwkgIHx8IChDR0VOX0lOU05fTlVNIChpbnNu
KSA9PSBPUjFLX0lOU05fTF9KUikKKwkgIHx8IChDR0VOX0lOU05fTlVNIChpbnNuKSA9PSBPUjFL
X0lOU05fTF9KQUxSKQorCSAgfHwgKENHRU5fSU5TTl9OVU0gKGluc24pID09IE9SMUtfSU5TTl9M
X0JORikKKwkgIHx8IChDR0VOX0lOU05fTlVNIChpbnNuKSA9PSBPUjFLX0lOU05fTF9CRikpOwor
fQorCiAvKiBJbXBsZW1lbnQgdGhlIHNpbmdsZV9zdGVwX3Rocm91Z2hfZGVsYXkgZ2RiYXJjaCBt
ZXRob2QuICAqLwogCiBzdGF0aWMgaW50CkBAIC0zNTUsMTAgKzM4Miw3IEBAIG9yMWtfc2luZ2xl
X3N0ZXBfdGhyb3VnaF9kZWxheSAoc3RydWN0IGdkYmFyY2ggKmdkYmFyY2gsCiAgIFVMT05HRVNU
IHZhbDsKICAgQ09SRV9BRERSIHBwYzsKICAgQ09SRV9BRERSIG5wYzsKLSAgQ0dFTl9GSUVMRFMg
dG1wX2ZpZWxkczsKLSAgY29uc3QgQ0dFTl9JTlNOICppbnNuOwogICBzdHJ1Y3QgcmVnY2FjaGUg
KnJlZ2NhY2hlID0gZ2V0X2N1cnJlbnRfcmVnY2FjaGUgKCk7Ci0gIHN0cnVjdCBnZGJhcmNoX3Rk
ZXAgKnRkZXAgPSBnZGJhcmNoX3RkZXAgKGdkYmFyY2gpOwogCiAgIC8qIEdldCB0aGUgcHJldmlv
dXMgYW5kIGN1cnJlbnQgaW5zdHJ1Y3Rpb24gYWRkcmVzc2VzLiAgSWYgdGhleSBhcmUgbm90CiAg
ICAgYWRqYWNlbnQsIHdlIGNhbm5vdCBiZSBpbiBhIGRlbGF5IHNsb3QuICAqLwpAQCAtMzcwLDI0
ICszOTQsMjggQEAgb3Ixa19zaW5nbGVfc3RlcF90aHJvdWdoX2RlbGF5IChzdHJ1Y3QgZ2RiYXJj
aCAqZ2RiYXJjaCwKICAgaWYgKDB4NCAhPSAobnBjIC0gcHBjKSkKICAgICByZXR1cm4gMDsKIAot
ICBpbnNuID0gY2dlbl9sb29rdXBfaW5zbiAodGRlcC0+Z2RiX2NnZW5fY3B1X2Rlc2MsCi0JCQkg
ICBOVUxMLAotCQkJICAgb3Ixa19mZXRjaF9pbnN0cnVjdGlvbiAoZ2RiYXJjaCwgcHBjKSwKLQkJ
CSAgIE5VTEwsIDMyLCAmdG1wX2ZpZWxkcywgMCk7CisgIHJldHVybiBvcjFrX2RlbGF5X3Nsb3Rf
cCAoZ2RiYXJjaCwgcHBjKTsKK30KIAotICAvKiBOVUxMIGhlcmUgd291bGQgbWVhbiB0aGUgbGFz
dCBpbnN0cnVjdGlvbiB3YXMgbm90IHVuZGVyc3Rvb2QgYnkgY2dlbi4KLSAgICAgVGhpcyBzaG91
bGQgbm90IHVzdWFsbHkgaGFwcGVuLCBidXQgaWYgZG9lcyBpdHMgbm90IGEgZGVsYXkgc2xvdC4g
ICovCi0gIGlmIChpbnNuID09IE5VTEwpCi0gICAgcmV0dXJuIDA7CisvKiBvcjFrX3NvZnR3YXJl
X3NpbmdsZV9zdGVwKCkgaXMgY2FsbGVkIGp1c3QgYmVmb3JlIHdlIHdhbnQgdG8gcmVzdW1lCisg
ICB0aGUgaW5mZXJpb3IsIGlmIHdlIHdhbnQgdG8gc2luZ2xlLXN0ZXAgaXQgYnV0IHRoZXJlIGlz
IG5vIGhhcmR3YXJlCisgICBvciBrZXJuZWwgc2luZ2xlLXN0ZXAgc3VwcG9ydCAoT3BlblJJU0Mg
b24gR05VL0xpbnV4IGZvciBleGFtcGxlKS4gIFdlCisgICBmaW5kIHRoZSB0YXJnZXQgb2YgdGhl
IGNvbWluZyBpbnN0cnVjdGlvbiBza2lwcGluZyBvdmVyIGRlbGF5IHNsb3RzCisgICBhbmQgYnJl
YWtwb2ludCBpdC4gICovCiAKLSAgLyogVE9ETzogd2Ugc2hvdWxkIGFkZCBhIGRlbGF5IHNsb3Qg
ZmxhZyB0byB0aGUgQ0dFTl9JTlNOIGFuZCByZW1vdmUKLSAgICAgdGhpcyBoYXJkIGNvZGVkIHRl
c3QuICAqLwotICByZXR1cm4gKChDR0VOX0lOU05fTlVNIChpbnNuKSA9PSBPUjFLX0lOU05fTF9K
KQotCSAgfHwgKENHRU5fSU5TTl9OVU0gKGluc24pID09IE9SMUtfSU5TTl9MX0pBTCkKLQkgIHx8
IChDR0VOX0lOU05fTlVNIChpbnNuKSA9PSBPUjFLX0lOU05fTF9KUikKLQkgIHx8IChDR0VOX0lO
U05fTlVNIChpbnNuKSA9PSBPUjFLX0lOU05fTF9KQUxSKQotCSAgfHwgKENHRU5fSU5TTl9OVU0g
KGluc24pID09IE9SMUtfSU5TTl9MX0JORikKLQkgIHx8IChDR0VOX0lOU05fTlVNIChpbnNuKSA9
PSBPUjFLX0lOU05fTF9CRikpOworc3RkOjp2ZWN0b3I8Q09SRV9BRERSPgorb3Ixa19zb2Z0d2Fy
ZV9zaW5nbGVfc3RlcCAoc3RydWN0IHJlZ2NhY2hlICpyZWdjYWNoZSkKK3sKKyAgc3RydWN0IGdk
YmFyY2ggKmdkYmFyY2ggPSByZWdjYWNoZS0+YXJjaCAoKTsKKyAgQ09SRV9BRERSIHBjLCBuZXh0
X3BjOworCisgIHBjID0gcmVnY2FjaGVfcmVhZF9wYyAocmVnY2FjaGUpOworICBuZXh0X3BjID0g
cGMgKyA0OworCisgIGlmIChvcjFrX2RlbGF5X3Nsb3RfcCAoZ2RiYXJjaCwgcGMpKQorICAgIG5l
eHRfcGMgKz0gNDsKKworICByZXR1cm4ge25leHRfcGN9OwogfQogCiAvKiBOYW1lIGZvciBvcjFr
IGdlbmVyYWwgcmVnaXN0ZXJzLiAgKi8KZGlmZiAtLWdpdCBhL2dkYi9vcjFrLXRkZXAuaCBiL2dk
Yi9vcjFrLXRkZXAuaAppbmRleCBkOWRjMWFjYTNjMy4uODFkOTAyYWU0OWUgMTAwNjQ0Ci0tLSBh
L2dkYi9vcjFrLXRkZXAuaAorKysgYi9nZGIvb3Ixay10ZGVwLmgKQEAgLTUyLDQgKzUyLDkgQEAK
ICNkZWZpbmUgT1IxS19OVU1fVEFQX1JFQ09SRFMgICAgICAgICA4CiAjZGVmaW5lIE9SMUtfRlJB
TUVfUkVEX1pPTkVfU0laRSAgICAgMjUzNgogCisvKiBTaW5nbGUgc3RlcCBiYXNlZCBvbiB3aGVy
ZSB0aGUgY3VycmVudCBpbnN0cnVjdGlvbiB3aWxsIHRha2UgdXMuICAqLworZXh0ZXJuIHN0ZDo6
dmVjdG9yPENPUkVfQUREUj4gb3Ixa19zb2Z0d2FyZV9zaW5nbGVfc3RlcAorICAoc3RydWN0IHJl
Z2NhY2hlICpyZWdjYWNoZSk7CisKKwogI2VuZGlmIC8qIE9SMUtfVERFUF9IICovCi0tIAoyLjMx
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5S
SVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xp
c3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
