Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 7C040515EC2
	for <lists+openrisc@lfdr.de>; Sat, 30 Apr 2022 17:38:02 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 395F4248EB;
	Sat, 30 Apr 2022 17:38:02 +0200 (CEST)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mail.librecores.org (Postfix) with ESMTPS id 0E5C7248F3
 for <openrisc@lists.librecores.org>; Sat, 30 Apr 2022 17:37:59 +0200 (CEST)
Received: by mail-pg1-f173.google.com with SMTP id v10so8634184pgl.11
 for <openrisc@lists.librecores.org>; Sat, 30 Apr 2022 08:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=z3KLQgMj1TGNiy68N/+4cjWSftL0fQ46WdCXDumEo+g=;
 b=OIjS69Rysux2zOuPu+QGyQyEdlRWBp2cAHY90hMkRDcU+740wg96FctIHu6gimhe37
 lz3jiYHZzNFTdx32AfsrWEbeDRWge1y2JeufrIPVxrl4eUYhH7+j85QUjV4yTlpew1Qz
 O/Lwal75dK7+QounVjK9C7dYqAFShV4gJMNyJ1gWPoAIdrZQYBITK18BbXnd0idplft1
 QHNO3WQkZIuBSzo2GgKyrMyVdDvBNibHbD/fYMkpOV4gf5DDYvB1VFIuM6r8Hp6RMADH
 N/4tYcc94hfUa/k8OhPS1Z3ZmLWbtys1gNxrDGeNmBnciOp1mBgdO5PLtUf77tbM7NSE
 nxrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=z3KLQgMj1TGNiy68N/+4cjWSftL0fQ46WdCXDumEo+g=;
 b=zSeJKs5PxC8UsaBdWyvpcIPG5dPzj44AmX1xW5GLDig/FCld+GKLiNuCtKP8oh5PTv
 6X+BGJR98c6KFhU23M2/lXwRVhJ8YKVxG14W0aVNSpLPVYKd5FBh4uttS+H6x4dCYuZx
 Y21nsU7XcchgWPo1bztJAE1rUmW5eenlPJIiFKPjP4Wlnr1KF0zpp95FQ2viod4becKx
 UVjiR1QZVBtFKEDVK2nCqGo2R7EXti0Lpt9Ls1mpELNNjPekYk8umCt77cdfhub/asyc
 igpzjy7BVBazWSqb/+r2Kjd5ZhxAq9TkRbUtm2BKrHeh/1rnUD8JTWTSFhQLctCuSHc5
 /RGw==
X-Gm-Message-State: AOAM5328qSPPbQD65yjufxmDrAS/WQ1Sqq5Dbt77WFMH9eojiCa724ow
 6SE01ybh/zyhCWVzj/5wgy421A==
X-Google-Smtp-Source: ABdhPJwQ5vPL3rfJKlBBkun+N1EkTvaAg1pnc1AebUDuMRn0c3hata7ORS3NhPRk+anvBJZz91htfQ==
X-Received: by 2002:a63:81c8:0:b0:3ab:6025:f43c with SMTP id
 t191-20020a6381c8000000b003ab6025f43cmr3472832pgd.189.1651333077608; 
 Sat, 30 Apr 2022 08:37:57 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 g11-20020a63110b000000b003c14af50614sm8108129pgl.44.2022.04.30.08.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 08:37:57 -0700 (PDT)
Date: Sat, 30 Apr 2022 08:36:23 -0700
Message-Id: <20220430153626.30660-5-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430153626.30660-1-palmer@rivosinc.com>
References: <20220430153626.30660-1-palmer@rivosinc.com>
MIME-Version: 1.0
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: [OpenRISC] [PATCH v4 4/7] openrisc: Move to ticket-spinlock
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
Cc: peterz@infradead.org, Palmer Dabbelt <palmer@rivosinc.com>,
 guoren@kernel.org, jszhang@kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, jonas@southpole.se, linux-csky@vger.kernel.org,
 mingo@redhat.com, longman@redhat.com, linux-arch@vger.kernel.org,
 aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>, boqun.feng@gmail.com,
 openrisc@lists.librecores.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, sudipm.mukherjee@gmail.com,
 macro@orcam.me.uk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPgoKV2UgaGF2ZSBubyBp
bmRpY2F0aW9ucyB0aGF0IG9wZW5yaXNjIG1lZXRzIHRoZSBxc3BpbmxvY2sgcmVxdWlyZW1lbnRz
LApzbyBtb3ZlIHRvIHRpY2tldC1zcGlubG9jayBhcyB0aGF0IGlzIG1vcmUgbGlrZXkgdG8gYmUg
Y29ycmVjdC4KClNpZ25lZC1vZmYtYnk6IFBldGVyIFppamxzdHJhIChJbnRlbCkgPHBldGVyekBp
bmZyYWRlYWQub3JnPgpBY2tlZC1ieTogU3RhZmZvcmQgSG9ybmUgPHNob3JuZUBnbWFpbC5jb20+
ClNpZ25lZC1vZmYtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgotLS0K
IGFyY2gvb3BlbnJpc2MvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICB8ICAxIC0KIGFyY2gv
b3BlbnJpc2MvaW5jbHVkZS9hc20vS2J1aWxkICAgICAgICAgICB8ICA1ICsrLS0KIGFyY2gvb3Bl
bnJpc2MvaW5jbHVkZS9hc20vc3BpbmxvY2suaCAgICAgICB8IDI3IC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KIGFyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vc3BpbmxvY2tfdHlwZXMuaCB8ICA3IC0t
LS0tLQogNCBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDM4IGRlbGV0aW9ucygtKQog
ZGVsZXRlIG1vZGUgMTAwNjQ0IGFyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vc3BpbmxvY2suaAog
ZGVsZXRlIG1vZGUgMTAwNjQ0IGFyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vc3BpbmxvY2tfdHlw
ZXMuaAoKZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJpc2MvS2NvbmZpZyBiL2FyY2gvb3BlbnJpc2Mv
S2NvbmZpZwppbmRleCAwZDY4YWRmNmUwMmIuLjk5ZjBlNGE0Y2JiZCAxMDA2NDQKLS0tIGEvYXJj
aC9vcGVucmlzYy9LY29uZmlnCisrKyBiL2FyY2gvb3BlbnJpc2MvS2NvbmZpZwpAQCAtMzAsNyAr
MzAsNiBAQCBjb25maWcgT1BFTlJJU0MKIAlzZWxlY3QgSEFWRV9ERUJVR19TVEFDS09WRVJGTE9X
CiAJc2VsZWN0IE9SMUtfUElDCiAJc2VsZWN0IENQVV9OT19FRkZJQ0lFTlRfRkZTIGlmICFPUEVO
UklTQ19IQVZFX0lOU1RfRkYxCi0Jc2VsZWN0IEFSQ0hfVVNFX1FVRVVFRF9TUElOTE9DS1MKIAlz
ZWxlY3QgQVJDSF9VU0VfUVVFVUVEX1JXTE9DS1MKIAlzZWxlY3QgT01QSUMgaWYgU01QCiAJc2Vs
ZWN0IEFSQ0hfV0FOVF9GUkFNRV9QT0lOVEVSUwpkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9p
bmNsdWRlL2FzbS9LYnVpbGQgYi9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL0tidWlsZAppbmRl
eCBjYTU5ODdlMTEwNTMuLjMzODZiOWMxYzA3MyAxMDA2NDQKLS0tIGEvYXJjaC9vcGVucmlzYy9p
bmNsdWRlL2FzbS9LYnVpbGQKKysrIGIvYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS9LYnVpbGQK
QEAgLTEsOSArMSw4IEBACiAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCiBnZW5l
cmljLXkgKz0gZXh0YWJsZS5oCiBnZW5lcmljLXkgKz0ga3ZtX3BhcmEuaAotZ2VuZXJpYy15ICs9
IG1jc19zcGlubG9jay5oCi1nZW5lcmljLXkgKz0gcXNwaW5sb2NrX3R5cGVzLmgKLWdlbmVyaWMt
eSArPSBxc3BpbmxvY2suaAorZ2VuZXJpYy15ICs9IHNwaW5sb2NrX3R5cGVzLmgKK2dlbmVyaWMt
eSArPSBzcGlubG9jay5oCiBnZW5lcmljLXkgKz0gcXJ3bG9ja190eXBlcy5oCiBnZW5lcmljLXkg
Kz0gcXJ3bG9jay5oCiBnZW5lcmljLXkgKz0gdXNlci5oCmRpZmYgLS1naXQgYS9hcmNoL29wZW5y
aXNjL2luY2x1ZGUvYXNtL3NwaW5sb2NrLmggYi9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL3Nw
aW5sb2NrLmgKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDI2NDk0NGE3MTUzNS4uMDAw
MDAwMDAwMDAwCi0tLSBhL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vc3BpbmxvY2suaAorKysg
L2Rldi9udWxsCkBAIC0xLDI3ICswLDAgQEAKLS8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBH
UEwtMi4wLW9yLWxhdGVyICovCi0vKgotICogT3BlblJJU0MgTGludXgKLSAqCi0gKiBMaW51eCBh
cmNoaXRlY3R1cmFsIHBvcnQgYm9ycm93aW5nIGxpYmVyYWxseSBmcm9tIHNpbWlsYXIgd29ya3Mg
b2YKLSAqIG90aGVycy4gIEFsbCBvcmlnaW5hbCBjb3B5cmlnaHRzIGFwcGx5IGFzIHBlciB0aGUg
b3JpZ2luYWwgc291cmNlCi0gKiBkZWNsYXJhdGlvbi4KLSAqCi0gKiBPcGVuUklTQyBpbXBsZW1l
bnRhdGlvbjoKLSAqIENvcHlyaWdodCAoQykgMjAwMyBNYXRqYXogQnJlc2t2YXIgPHBob2VuaXhA
YnNlbWkuY29tPgotICogQ29weXJpZ2h0IChDKSAyMDEwLTIwMTEgSm9uYXMgQm9ubiA8am9uYXNA
c291dGhwb2xlLnNlPgotICogZXQgYWwuCi0gKi8KLQotI2lmbmRlZiBfX0FTTV9PUEVOUklTQ19T
UElOTE9DS19ICi0jZGVmaW5lIF9fQVNNX09QRU5SSVNDX1NQSU5MT0NLX0gKLQotI2luY2x1ZGUg
PGFzbS9xc3BpbmxvY2suaD4KLQotI2luY2x1ZGUgPGFzbS9xcndsb2NrLmg+Ci0KLSNkZWZpbmUg
YXJjaF9zcGluX3JlbGF4KGxvY2spCWNwdV9yZWxheCgpCi0jZGVmaW5lIGFyY2hfcmVhZF9yZWxh
eChsb2NrKQljcHVfcmVsYXgoKQotI2RlZmluZSBhcmNoX3dyaXRlX3JlbGF4KGxvY2spCWNwdV9y
ZWxheCgpCi0KLQotI2VuZGlmCmRpZmYgLS1naXQgYS9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNt
L3NwaW5sb2NrX3R5cGVzLmggYi9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL3NwaW5sb2NrX3R5
cGVzLmgKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDdjNmZiMTIwOGM4OC4uMDAwMDAw
MDAwMDAwCi0tLSBhL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vc3BpbmxvY2tfdHlwZXMuaAor
KysgL2Rldi9udWxsCkBAIC0xLDcgKzAsMCBAQAotI2lmbmRlZiBfQVNNX09QRU5SSVNDX1NQSU5M
T0NLX1RZUEVTX0gKLSNkZWZpbmUgX0FTTV9PUEVOUklTQ19TUElOTE9DS19UWVBFU19ICi0KLSNp
bmNsdWRlIDxhc20vcXNwaW5sb2NrX3R5cGVzLmg+Ci0jaW5jbHVkZSA8YXNtL3Fyd2xvY2tfdHlw
ZXMuaD4KLQotI2VuZGlmIC8qIF9BU01fT1BFTlJJU0NfU1BJTkxPQ0tfVFlQRVNfSCAqLwotLSAK
Mi4zNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpP
cGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6
Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
