Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 4F2224DBBD1
	for <lists+openrisc@lfdr.de>; Thu, 17 Mar 2022 01:34:52 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 838B6240F3;
	Thu, 17 Mar 2022 01:34:51 +0100 (CET)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mail.librecores.org (Postfix) with ESMTPS id 4791F248BA
 for <openrisc@lists.librecores.org>; Thu, 17 Mar 2022 00:28:28 +0100 (CET)
Received: by mail-pf1-f169.google.com with SMTP id t5so5396990pfg.4
 for <openrisc@lists.librecores.org>; Wed, 16 Mar 2022 16:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=FX0vp498CDh+Q8VYRYD8Az++zOHOkwOZmBFCOJ/MPQk=;
 b=g7RGlpUtsYp0dL6ZURcJ9XqT0FTjuYFUg3R+dEpF965ZohDKCeoeGHfjtjiVSkGxEj
 lANdfMQl9/IBkJ/9UMg+SPHYCtMWSo9c4xaW9U1+sxAE128S6sObkonPfJPoKIzymiIw
 09sK8rm+D+QlLwCSg7j5kwRZZ5Ze8MI5Jek627pUrimcrgKq4K2jJlUa/Pj8a2SElTV9
 xl4ffwNapdts7992kA3feRtQzz/jnL60ZUCdKR4LQ7AoV/Y7AfVaxzeYDr7myiwH00f4
 SRKTk+WG9MddPkkdOopQzO/1xBaFNEzmYY2D9huskq0oyJ4kYPwaGuIBtGRfGZgtAFr0
 gBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=FX0vp498CDh+Q8VYRYD8Az++zOHOkwOZmBFCOJ/MPQk=;
 b=04tsw2MZeGXxgMfOlg7Zsqvk8tVaw+j+d6vFfK5Xp2HTfkWDegGs4LlFXb9xzCQHYE
 1gj88gR2MVP6uevAH2rDI0P0SvKlW/VJVUEqYWmtNcsMXcp6atbpRlxxL9h/noR1Vvg3
 MmZMwPVg8hITaVi92M4RcduEzTQj994ue/VSyME/B2jnR7stfaSTrUe0AdKjJA7eYnPV
 eGJxnT4GwUnbmx8b6DvgkwyVMs9ivunrqu0EKegpDfJIwDg3vDW/jsA7KG6y5JP3KuIN
 9mJvShuMQW60hAaABv2tuuKXTL8f9TourT2kWCqg4iHfKjovbFphqDDTbOeplNGL/CeU
 ClVg==
X-Gm-Message-State: AOAM532kjCutkBF86vn+d8O0IEYlVNqxG2tc0a73gANE+OBTBMv5IaRA
 FOdYCfhqRgnPDky4X3t2+ERC3g==
X-Google-Smtp-Source: ABdhPJxPEnRTV51QRb/xegbfDS8UXc6ttxfzGlax57AVGxnNF0PWp6AH0Fu+hZMGJACkhYsvidNMYQ==
X-Received: by 2002:a05:6a00:729:b0:4f7:77ed:c256 with SMTP id
 9-20020a056a00072900b004f777edc256mr2013933pfm.1.1647473306932; 
 Wed, 16 Mar 2022 16:28:26 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 ce3-20020a17090aff0300b001c51f47840csm3560019pjb.0.2022.03.16.16.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 16:28:26 -0700 (PDT)
Date: Wed, 16 Mar 2022 16:25:57 -0700
Message-Id: <20220316232600.20419-3-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220316232600.20419-1-palmer@rivosinc.com>
References: <20220316232600.20419-1-palmer@rivosinc.com>
MIME-Version: 1.0
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, peterz@infradead.org
X-Mailman-Approved-At: Thu, 17 Mar 2022 01:34:48 +0100
Subject: [OpenRISC] [PATCH 2/5] asm-generic: ticket-lock: New generic
 ticket-based spinlock
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
Cc: jonas@southpole.se, linux-arch@vger.kernel.org, wangkefeng.wang@huawei.com,
 aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>, boqun.feng@gmail.com,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
 mingo@redhat.com, Palmer Dabbelt <palmer@dabbelt.com>, jszhang@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, longman@redhat.com,
 Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org,
 openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPgoKVGhpcyBpcyBhIHNp
bXBsZSwgZmFpciBzcGlubG9jay4gIFNwZWNpZmljYWxseSBpdCBkb2Vzbid0IGhhdmUgYWxsIHRo
ZQpzdWJ0bGUgbWVtb3J5IG1vZGVsIGRlcGVuZGVuY2llcyB0aGF0IHFzcGlubG9jayBoYXMsIHdo
aWNoIG1ha2VzIGl0IG1vcmUKc3VpdGFibGUgZm9yIHNpbXBsZSBzeXN0ZW1zIGFzIGl0IGlzIG1v
cmUgbGlrZWx5IHRvIGJlIGNvcnJlY3QuCgpbUGFsbWVyOiBjb21taXQgdGV4dF0KU2lnbmVkLW9m
Zi1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+CgotLQoKSSBoYXZlIHNw
ZWNpZmljYWxseSBub3QgaW5jbHVkZWQgUGV0ZXIncyBTT0Igb24gdGhpcywgYXMgaGUgc2VudCBo
aXMKb3JpZ2luYWwgcGF0Y2gKPGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvWUhiQkJ1VkZO
bkk0a2pqM0BoaXJlei5wcm9ncmFtbWluZy5raWNrcy1hc3MubmV0Lz4Kd2l0aG91dCBvbmUuCi0t
LQogaW5jbHVkZS9hc20tZ2VuZXJpYy90aWNrZXQtbG9jay10eXBlcy5oIHwgMTEgKysrKwogaW5j
bHVkZS9hc20tZ2VuZXJpYy90aWNrZXQtbG9jay5oICAgICAgIHwgODYgKysrKysrKysrKysrKysr
KysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA5NyBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgaW5jbHVkZS9hc20tZ2VuZXJpYy90aWNrZXQtbG9jay10eXBlcy5oCiBjcmVhdGUg
bW9kZSAxMDA2NDQgaW5jbHVkZS9hc20tZ2VuZXJpYy90aWNrZXQtbG9jay5oCgpkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9hc20tZ2VuZXJpYy90aWNrZXQtbG9jay10eXBlcy5oIGIvaW5jbHVkZS9hc20t
Z2VuZXJpYy90aWNrZXQtbG9jay10eXBlcy5oCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAw
MDAwMDAwMDAwMC4uODI5NzU5YWVkZGE4Ci0tLSAvZGV2L251bGwKKysrIGIvaW5jbHVkZS9hc20t
Z2VuZXJpYy90aWNrZXQtbG9jay10eXBlcy5oCkBAIC0wLDAgKzEsMTEgQEAKKy8qIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovCisKKyNpZm5kZWYgX19BU01fR0VORVJJQ19USUNL
RVRfTE9DS19UWVBFU19ICisjZGVmaW5lIF9fQVNNX0dFTkVSSUNfVElDS0VUX0xPQ0tfVFlQRVNf
SAorCisjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KK3R5cGVkZWYgYXRvbWljX3QgYXJjaF9zcGlu
bG9ja190OworCisjZGVmaW5lIF9fQVJDSF9TUElOX0xPQ0tfVU5MT0NLRUQJQVRPTUlDX0lOSVQo
MCkKKworI2VuZGlmIC8qIF9fQVNNX0dFTkVSSUNfVElDS0VUX0xPQ0tfVFlQRVNfSCAqLwpkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9hc20tZ2VuZXJpYy90aWNrZXQtbG9jay5oIGIvaW5jbHVkZS9hc20t
Z2VuZXJpYy90aWNrZXQtbG9jay5oCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAw
MDAwMC4uM2YwZDUzZTIxYTM3Ci0tLSAvZGV2L251bGwKKysrIGIvaW5jbHVkZS9hc20tZ2VuZXJp
Yy90aWNrZXQtbG9jay5oCkBAIC0wLDAgKzEsODYgQEAKKy8qIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBHUEwtMi4wICovCisKKy8qCisgKiAnR2VuZXJpYycgdGlja2V0LWxvY2sgaW1wbGVtZW50
YXRpb24uCisgKgorICogSXQgcmVsaWVzIG9uIGF0b21pY19mZXRjaF9hZGQoKSBoYXZpbmcgd2Vs
bCBkZWZpbmVkIGZvcndhcmQgcHJvZ3Jlc3MKKyAqIGd1YXJhbnRlZXMgdW5kZXIgY29udGVudGlv
bi4gSWYgeW91ciBhcmNoaXRlY3R1cmUgY2Fubm90IHByb3ZpZGUgdGhpcywgc3RpY2sKKyAqIHRv
IGEgdGVzdC1hbmQtc2V0IGxvY2suCisgKgorICogSXQgYWxzbyByZWxpZXMgb24gYXRvbWljX2Zl
dGNoX2FkZCgpIGJlaW5nIHNhZmUgdnMgc21wX3N0b3JlX3JlbGVhc2UoKSBvbiBhCisgKiBzdWIt
d29yZCBvZiB0aGUgdmFsdWUuIFRoaXMgaXMgZ2VuZXJhbGx5IHRydWUgZm9yIGFueXRoaW5nIExM
L1NDIGFsdGhvdWdoCisgKiB5b3UnZCBiZSBoYXJkIHByZXNzZWQgdG8gZmluZCBhbnl0aGluZyB1
c2VmdWwgaW4gYXJjaGl0ZWN0dXJlIHNwZWNpZmljYXRpb25zCisgKiBhYm91dCB0aGlzLiBJZiB5
b3VyIGFyY2hpdGVjdHVyZSBjYW5ub3QgZG8gdGhpcyB5b3UgbWlnaHQgYmUgYmV0dGVyIG9mZiB3
aXRoCisgKiBhIHRlc3QtYW5kLXNldC4KKyAqCisgKiBJdCBmdXJ0aGVyIGFzc3VtZXMgYXRvbWlj
XypfcmVsZWFzZSgpICsgYXRvbWljXypfYWNxdWlyZSgpIGlzIFJDcGMgYW5kIGhlbmNlCisgKiB1
c2VzIGF0b21pY19mZXRjaF9hZGQoKSB3aGljaCBpcyBTQyB0byBjcmVhdGUgYW4gUkNzYyBsb2Nr
LgorICoKKyAqIFRoZSBpbXBsZW1lbnRhdGlvbiB1c2VzIHNtcF9jb25kX2xvYWRfYWNxdWlyZSgp
IHRvIHNwaW4sIHNvIGlmIHRoZQorICogYXJjaGl0ZWN0dXJlIGhhcyBXRkUgbGlrZSBpbnN0cnVj
dGlvbnMgdG8gc2xlZXAgaW5zdGVhZCBvZiBwb2xsIGZvciB3b3JkCisgKiBtb2RpZmljYXRpb25z
IGJlIHN1cmUgdG8gaW1wbGVtZW50IHRoYXQgKHNlZSBBUk02NCBmb3IgZXhhbXBsZSkuCisgKgor
ICovCisKKyNpZm5kZWYgX19BU01fR0VORVJJQ19USUNLRVRfTE9DS19ICisjZGVmaW5lIF9fQVNN
X0dFTkVSSUNfVElDS0VUX0xPQ0tfSAorCisjaW5jbHVkZSA8bGludXgvYXRvbWljLmg+CisjaW5j
bHVkZSA8YXNtL3RpY2tldC1sb2NrLXR5cGVzLmg+CisKK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUg
dm9pZCB0aWNrZXRfbG9jayhhcmNoX3NwaW5sb2NrX3QgKmxvY2spCit7CisJdTMyIHZhbCA9IGF0
b21pY19mZXRjaF9hZGQoMTw8MTYsIGxvY2spOyAvKiBTQywgZ2l2ZXMgdXMgUkNzYyAqLworCXUx
NiB0aWNrZXQgPSB2YWwgPj4gMTY7CisKKwlpZiAodGlja2V0ID09ICh1MTYpdmFsKQorCQlyZXR1
cm47CisKKwlhdG9taWNfY29uZF9yZWFkX2FjcXVpcmUobG9jaywgdGlja2V0ID09ICh1MTYpVkFM
KTsKK30KKworc3RhdGljIF9fYWx3YXlzX2lubGluZSBib29sIHRpY2tldF90cnlsb2NrKGFyY2hf
c3BpbmxvY2tfdCAqbG9jaykKK3sKKwl1MzIgb2xkID0gYXRvbWljX3JlYWQobG9jayk7CisKKwlp
ZiAoKG9sZCA+PiAxNikgIT0gKG9sZCAmIDB4ZmZmZikpCisJCXJldHVybiBmYWxzZTsKKworCXJl
dHVybiBhdG9taWNfdHJ5X2NtcHhjaGcobG9jaywgJm9sZCwgb2xkICsgKDE8PDE2KSk7IC8qIFND
LCBmb3IgUkNzYyAqLworfQorCitzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQgdGlja2V0X3Vu
bG9jayhhcmNoX3NwaW5sb2NrX3QgKmxvY2spCit7CisJdTE2ICpwdHIgPSAodTE2ICopbG9jayAr
IF9faXNfZGVmaW5lZChfX0JJR19FTkRJQU4pOworCXUzMiB2YWwgPSBhdG9taWNfcmVhZChsb2Nr
KTsKKworCXNtcF9zdG9yZV9yZWxlYXNlKHB0ciwgKHUxNil2YWwgKyAxKTsKK30KKworc3RhdGlj
IF9fYWx3YXlzX2lubGluZSBpbnQgdGlja2V0X2lzX2xvY2tlZChhcmNoX3NwaW5sb2NrX3QgKmxv
Y2spCit7CisJdTMyIHZhbCA9IGF0b21pY19yZWFkKGxvY2spOworCisJcmV0dXJuICgodmFsID4+
IDE2KSAhPSAodmFsICYgMHhmZmZmKSk7Cit9CisKK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgaW50
IHRpY2tldF9pc19jb250ZW5kZWQoYXJjaF9zcGlubG9ja190ICpsb2NrKQoreworCXUzMiB2YWwg
PSBhdG9taWNfcmVhZChsb2NrKTsKKworCXJldHVybiAoczE2KSgodmFsID4+IDE2KSAtICh2YWwg
JiAweGZmZmYpKSA+IDE7Cit9CisKK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgaW50IHRpY2tldF92
YWx1ZV91bmxvY2tlZChhcmNoX3NwaW5sb2NrX3QgbG9jaykKK3sKKwlyZXR1cm4gIXRpY2tldF9p
c19sb2NrZWQoJmxvY2spOworfQorCisjZGVmaW5lIGFyY2hfc3Bpbl9sb2NrKGwpCQl0aWNrZXRf
bG9jayhsKQorI2RlZmluZSBhcmNoX3NwaW5fdHJ5bG9jayhsKQkJdGlja2V0X3RyeWxvY2sobCkK
KyNkZWZpbmUgYXJjaF9zcGluX3VubG9jayhsKQkJdGlja2V0X3VubG9jayhsKQorI2RlZmluZSBh
cmNoX3NwaW5faXNfbG9ja2VkKGwpCQl0aWNrZXRfaXNfbG9ja2VkKGwpCisjZGVmaW5lIGFyY2hf
c3Bpbl9pc19jb250ZW5kZWQobCkJdGlja2V0X2lzX2NvbnRlbmRlZChsKQorI2RlZmluZSBhcmNo
X3NwaW5fdmFsdWVfdW5sb2NrZWQobCkJdGlja2V0X3ZhbHVlX3VubG9ja2VkKGwpCisKKyNlbmRp
ZiAvKiBfX0FTTV9HRU5FUklDX1RJQ0tFVF9MT0NLX0ggKi8KLS0gCjIuMzQuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBs
aXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jl
cy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
