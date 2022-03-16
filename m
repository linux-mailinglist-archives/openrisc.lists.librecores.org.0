Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id EE73D4DBBD3
	for <lists+openrisc@lfdr.de>; Thu, 17 Mar 2022 01:34:52 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id BE47E2412C;
	Thu, 17 Mar 2022 01:34:51 +0100 (CET)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mail.librecores.org (Postfix) with ESMTPS id C2960248BA
 for <openrisc@lists.librecores.org>; Thu, 17 Mar 2022 00:28:30 +0100 (CET)
Received: by mail-pj1-f42.google.com with SMTP id
 rm8-20020a17090b3ec800b001c55791fdb1so3954303pjb.1
 for <openrisc@lists.librecores.org>; Wed, 16 Mar 2022 16:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=QjUbWpYW3rVnM/AEVOfQY7Hb1962iPWLkT7GwNacZrs=;
 b=OPswRH2lRihBIfhRfn+/3FQDyS4CIDrFb0a6W/SFptnXwSb197U4E15ipwXAHAI0Ta
 TNyvuSpdp0Dl7Udy9D2GfQMyBJv1EAU0uSev1KuzOjG/5dK0WBhl8Mbqd7ahL1zjtniM
 Y1SqPUOdGayiPKAU6YQE0nUK5pJvsw2r8oicK3P3V5ZhK6gt2WLY4clS8KYMvMnsh/qH
 t1+CgGbeMH5nQ/NzMh338/CKlZC6QrLpB6Ol4xXtu3THVc5XuN017XXitVKtMXD9lQqc
 x1VUjFX+iePIisj0C7WmE0/fu1p8BI2Bk3rrSnzxy2JNeg8GQP2Fx2KEuKzIbkX7wL9d
 r1iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=QjUbWpYW3rVnM/AEVOfQY7Hb1962iPWLkT7GwNacZrs=;
 b=38hsaVBd3+/hO7jGFy9t295/oNf/VjezcWEeSDxtCqcx52O2dqEQB0GX0TsL30KXB5
 Sq8AeaabxoqfkRrjph3IeP9KiIz6Y5wn/Beq5+qe7IHtcqTNEDt3FNSEN36xXmnsLZSc
 cGeS6AjlxJucB4wYYuIakwfuorKnbYEozyJpI8Bq+1n2G9LLASJfhf3PmGv0nga+aejC
 7vyZ80T7cCB73roFXe689oLTMf5e9HnBnyzgjUJHJhWc03ajqwy8FIfWBq6siq0WyKcQ
 qhRSr3bj9gKbBvmTWyvatYg9dST/OlyNQezxql0cyAsRlQb0zaNiG0J1Qxhrt7j8+YaT
 Lsow==
X-Gm-Message-State: AOAM530fDpMToEf73gdBdWJ5AlDqr+/NAIUyyxM30+xwd72EaMQD2+QY
 XR9qYaoCmRMGK4XMrdKLZISUp9iZ+VPVHA==
X-Google-Smtp-Source: ABdhPJx15zZafntzrXc+qFtN7TCKqNirxAH51x/OX1Z7DAEkhf7MHHxu+PKBTGIRQSByMNHXy1V3iA==
X-Received: by 2002:a17:903:1206:b0:151:7d67:2924 with SMTP id
 l6-20020a170903120600b001517d672924mr1783497plh.45.1647473309449; 
 Wed, 16 Mar 2022 16:28:29 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 pj13-20020a17090b4f4d00b001bf2ff56430sm8078615pjb.30.2022.03.16.16.28.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 16:28:29 -0700 (PDT)
Date: Wed, 16 Mar 2022 16:25:59 -0700
Message-Id: <20220316232600.20419-5-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220316232600.20419-1-palmer@rivosinc.com>
References: <20220316232600.20419-1-palmer@rivosinc.com>
MIME-Version: 1.0
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, peterz@infradead.org
X-Mailman-Approved-At: Thu, 17 Mar 2022 01:34:48 +0100
Subject: [OpenRISC] [PATCH 4/5] RISC-V: Move to ticket-spinlocks
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

RnJvbTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+CgpPdXIgZXhpc3Rpbmcg
c3BpbmxvY2tzIGFyZW4ndCBmYWlyIGFuZCByZXBsYWNpbmcgdGhlbSBoYXMgYmVlbiBvbiB0aGUK
VE9ETyBsaXN0IGZvciBhIGxvbmcgdGltZS4gIFRoaXMgbW92ZXMgdG8gdGhlIHJlY2VudGx5LWlu
dHJvZHVjZWQgdGlja2V0CnNwaW5sb2Nrcywgd2hpY2ggYXJlIHNpbXBsZSBlbm91Z2ggdGhhdCB0
aGV5IGFyZSBsaWtlbHkgdG8gYmUgY29ycmVjdAphbmQgZmFzdCBvbiB0aGUgdmFzdCBtYWpvcml0
eSBvZiBleHRhbnQgaW1wbGVtZW50YXRpb25zLgoKU2lnbmVkLW9mZi1ieTogUGFsbWVyIERhYmJl
bHQgPHBhbG1lckByaXZvc2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9LYnVp
bGQgICAgICAgICAgIHwgIDIgKysKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3BpbmxvY2suaCAg
ICAgICB8IDQxICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9h
c20vc3BpbmxvY2tfdHlwZXMuaCB8ICA2ICstLS0KIDMgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCA0NSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL0tidWlsZCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vS2J1aWxkCmluZGV4IDU3Yjg2ZmQ5
OTE2Yy4uNDJiMTk2MWFmMWE2IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL0ti
dWlsZAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL0tidWlsZApAQCAtMiw1ICsyLDcgQEAK
IGdlbmVyaWMteSArPSBlYXJseV9pb3JlbWFwLmgKIGdlbmVyaWMteSArPSBmbGF0LmgKIGdlbmVy
aWMteSArPSBrdm1fcGFyYS5oCitnZW5lcmljLXkgKz0gdGlja2V0LWxvY2suaAorZ2VuZXJpYy15
ICs9IHRpY2tldC1sb2NrLXR5cGVzLmgKIGdlbmVyaWMteSArPSB1c2VyLmgKIGdlbmVyaWMteSAr
PSB2bWxpbnV4Lmxkcy5oCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NwaW5s
b2NrLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NwaW5sb2NrLmgKaW5kZXggZjRmN2ZhMWI3
Y2E4Li4zODA4OWNiZGVhOTIgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3Bp
bmxvY2suaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NwaW5sb2NrLmgKQEAgLTEwLDQ2
ICsxMCw3IEBACiAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+CiAjaW5jbHVkZSA8YXNtL2N1cnJl
bnQuaD4KICNpbmNsdWRlIDxhc20vZmVuY2UuaD4KLQotLyoKLSAqIFNpbXBsZSBzcGluIGxvY2sg
b3BlcmF0aW9ucy4gIFRoZXNlIHByb3ZpZGUgbm8gZmFpcm5lc3MgZ3VhcmFudGVlcy4KLSAqLwot
Ci0vKiBGSVhNRTogUmVwbGFjZSB0aGlzIHdpdGggYSB0aWNrZXQgbG9jaywgbGlrZSBNSVBTLiAq
LwotCi0jZGVmaW5lIGFyY2hfc3Bpbl9pc19sb2NrZWQoeCkJKFJFQURfT05DRSgoeCktPmxvY2sp
ICE9IDApCi0KLXN0YXRpYyBpbmxpbmUgdm9pZCBhcmNoX3NwaW5fdW5sb2NrKGFyY2hfc3Bpbmxv
Y2tfdCAqbG9jaykKLXsKLQlzbXBfc3RvcmVfcmVsZWFzZSgmbG9jay0+bG9jaywgMCk7Ci19Ci0K
LXN0YXRpYyBpbmxpbmUgaW50IGFyY2hfc3Bpbl90cnlsb2NrKGFyY2hfc3BpbmxvY2tfdCAqbG9j
aykKLXsKLQlpbnQgdG1wID0gMSwgYnVzeTsKLQotCV9fYXNtX18gX192b2xhdGlsZV9fICgKLQkJ
IglhbW9zd2FwLncgJTAsICUyLCAlMVxuIgotCQlSSVNDVl9BQ1FVSVJFX0JBUlJJRVIKLQkJOiAi
PXIiIChidXN5KSwgIitBIiAobG9jay0+bG9jaykKLQkJOiAiciIgKHRtcCkKLQkJOiAibWVtb3J5
Iik7Ci0KLQlyZXR1cm4gIWJ1c3k7Ci19Ci0KLXN0YXRpYyBpbmxpbmUgdm9pZCBhcmNoX3NwaW5f
bG9jayhhcmNoX3NwaW5sb2NrX3QgKmxvY2spCi17Ci0Jd2hpbGUgKDEpIHsKLQkJaWYgKGFyY2hf
c3Bpbl9pc19sb2NrZWQobG9jaykpCi0JCQljb250aW51ZTsKLQotCQlpZiAoYXJjaF9zcGluX3Ry
eWxvY2sobG9jaykpCi0JCQlicmVhazsKLQl9Ci19Ci0KLS8qKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKi8KKyNpbmNsdWRlIDxhc20tZ2Vu
ZXJpYy90aWNrZXQtbG9jay5oPgogCiBzdGF0aWMgaW5saW5lIHZvaWQgYXJjaF9yZWFkX2xvY2so
YXJjaF9yd2xvY2tfdCAqbG9jaykKIHsKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vc3BpbmxvY2tfdHlwZXMuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3BpbmxvY2tfdHlw
ZXMuaAppbmRleCA1YTM1YTQ5NTA1ZGEuLjQzMWVlMDhlMjZjNCAxMDA2NDQKLS0tIGEvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9zcGlubG9ja190eXBlcy5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vc3BpbmxvY2tfdHlwZXMuaApAQCAtMTAsMTEgKzEwLDcgQEAKICMgZXJyb3IgInBsZWFz
ZSBkb24ndCBpbmNsdWRlIHRoaXMgZmlsZSBkaXJlY3RseSIKICNlbmRpZgogCi10eXBlZGVmIHN0
cnVjdCB7Ci0Jdm9sYXRpbGUgdW5zaWduZWQgaW50IGxvY2s7Ci19IGFyY2hfc3BpbmxvY2tfdDsK
LQotI2RlZmluZSBfX0FSQ0hfU1BJTl9MT0NLX1VOTE9DS0VECXsgMCB9CisjaW5jbHVkZSA8YXNt
LWdlbmVyaWMvdGlja2V0LWxvY2stdHlwZXMuaD4KIAogdHlwZWRlZiBzdHJ1Y3QgewogCXZvbGF0
aWxlIHVuc2lnbmVkIGludCBsb2NrOwotLSAKMi4zNC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NA
bGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5m
by9vcGVucmlzYwo=
