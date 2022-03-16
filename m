Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id ABE0E4DBBD2
	for <lists+openrisc@lfdr.de>; Thu, 17 Mar 2022 01:34:52 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A33BB24106;
	Thu, 17 Mar 2022 01:34:51 +0100 (CET)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mail.librecores.org (Postfix) with ESMTPS id 77C36248C9
 for <openrisc@lists.librecores.org>; Thu, 17 Mar 2022 00:28:30 +0100 (CET)
Received: by mail-pf1-f178.google.com with SMTP id s8so5331718pfk.12
 for <openrisc@lists.librecores.org>; Wed, 16 Mar 2022 16:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=TemgJXj/dxR4o9xjuRPFVAtvCpC+RuCkyAl1o75jaTw=;
 b=5NAASYUylgaEPqqdOEpfJYNUGMgV0gFaeMRax5C5dSSZLOGAdqEJZnhq0wtD7zPoW0
 G5ob4+N2yFpwbpch0DWhTknq6SOGVQuAlyx5O3Q4z+CabPYf0Q0nUxJYIRUm+1UXldia
 CUfn33UFTj/UQ6niZ6ytLeUqcODuQ8vUjiiE5/y4Cga4QKby77CDm6r7N0bPNRi39KC4
 O/zvHvMm0khtUBVhRQ1vvm59igRk3I3+zGiCD9QZkEZ4zSYXLICNZRMaGnxXlOOI5pc8
 96R6MSsMUafEA9jSOCcTsTp6f+fYDXiBsUqlxz1cBR4CM7sz772W9JvY9llYBqeaxTjL
 2xnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=TemgJXj/dxR4o9xjuRPFVAtvCpC+RuCkyAl1o75jaTw=;
 b=7emvukusNkDmvKUM6NBgUfCZUf1OenDShoXf2j3veNknL6HIBqvtqaA/GNhUZR/efV
 xH0CERJpTuCjRuGgZ9SiuygsWlR50aTzMCrI++cyxuYCIodi5WBvhjqgEayKnNz4f4tH
 trAuiHZtifA9olz7GdVFjflKBSROcL9ArmkmQ/c5OaH7tvO/SrRtkALJEN4HAA2Jtm5+
 jR1nsWhObHuf3iOJda0lxMNwXl4NeGuiNRGRf3v4ErJ7oLmIrL4ICj90HLEI3LyoxCvc
 AfnpvzwbJK6J5IRFej3V/7oVcAy9Y3apVlnjGOvwIOUXKF9A08yY0pJ/GCZM/lRmUux9
 UE/g==
X-Gm-Message-State: AOAM532dsHQBIVQSLqXfnw11fzv+WzL651CHigUN3yiT9F+TqnW8AoO5
 7msgnMAtloBFICrSPCp+SowKtA==
X-Google-Smtp-Source: ABdhPJzu2zL3dDL4hiAgSK4z9Dcw0idEICTak8foXBS3lSnxmO9pbBmuyGxzNgKWSyVr5slYVp3eQg==
X-Received: by 2002:a05:6a00:1a89:b0:4f7:b90b:17ee with SMTP id
 e9-20020a056a001a8900b004f7b90b17eemr2233942pfv.46.1647473308139; 
 Wed, 16 Mar 2022 16:28:28 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 d16-20020a056a00245000b004f7728a4346sm4436763pfj.79.2022.03.16.16.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 16:28:27 -0700 (PDT)
Date: Wed, 16 Mar 2022 16:25:58 -0700
Message-Id: <20220316232600.20419-4-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220316232600.20419-1-palmer@rivosinc.com>
References: <20220316232600.20419-1-palmer@rivosinc.com>
MIME-Version: 1.0
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, peterz@infradead.org
X-Mailman-Approved-At: Thu, 17 Mar 2022 01:34:48 +0100
Subject: [OpenRISC] [PATCH 3/5] openrisc: Move to ticket-spinlock
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

RnJvbTogUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPgoKV2UgaGF2ZSBubyBp
bmRpY2F0aW9ucyB0aGF0IG9wZW5yaXNjIG1lZXRzIHRoZSBxc3BpbmxvY2sgcmVxdWlyZW1lbnRz
LApzbyBtb3ZlIHRvIHRpY2tldC1zcGlubG9jayBhcyB0aGF0IGlzIG1vcmUgbGlrZXkgdG8gYmUg
Y29ycmVjdC4KClNpZ25lZC1vZmYtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMu
Y29tPgoKLS0tCgpJIGhhdmUgc3BlY2lmaWNhbGx5IG5vdCBpbmNsdWRlZCBQZXRlcidzIFNPQiBv
biB0aGlzLCBhcyBoZSBzZW50IGhpcwpvcmlnaW5hbCBwYXRjaAo8aHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGttbC9ZSGJCQnVWRk5uSTRramozQGhpcmV6LnByb2dyYW1taW5nLmtpY2tzLWFzcy5u
ZXQvPgp3aXRob3V0IG9uZS4KLS0tCiBhcmNoL29wZW5yaXNjL0tjb25maWcgICAgICAgICAgICAg
ICAgICAgICAgfCAxIC0KIGFyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vS2J1aWxkICAgICAgICAg
ICB8IDUgKystLS0KIGFyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vc3BpbmxvY2suaCAgICAgICB8
IDMgKy0tCiBhcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL3NwaW5sb2NrX3R5cGVzLmggfCAyICst
CiA0IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9hcmNoL29wZW5yaXNjL0tjb25maWcgYi9hcmNoL29wZW5yaXNjL0tjb25maWcKaW5k
ZXggZjcyNGIzZjFhZWVkLi5mNWZhMjI2MzYyZjYgMTAwNjQ0Ci0tLSBhL2FyY2gvb3BlbnJpc2Mv
S2NvbmZpZworKysgYi9hcmNoL29wZW5yaXNjL0tjb25maWcKQEAgLTMwLDcgKzMwLDYgQEAgY29u
ZmlnIE9QRU5SSVNDCiAJc2VsZWN0IEhBVkVfREVCVUdfU1RBQ0tPVkVSRkxPVwogCXNlbGVjdCBP
UjFLX1BJQwogCXNlbGVjdCBDUFVfTk9fRUZGSUNJRU5UX0ZGUyBpZiAhT1BFTlJJU0NfSEFWRV9J
TlNUX0ZGMQotCXNlbGVjdCBBUkNIX1VTRV9RVUVVRURfU1BJTkxPQ0tTCiAJc2VsZWN0IEFSQ0hf
VVNFX1FVRVVFRF9SV0xPQ0tTCiAJc2VsZWN0IE9NUElDIGlmIFNNUAogCXNlbGVjdCBBUkNIX1dB
TlRfRlJBTUVfUE9JTlRFUlMKZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20v
S2J1aWxkIGIvYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS9LYnVpbGQKaW5kZXggY2E1OTg3ZTEx
MDUzLi5jYjI2MGU3ZDczZGIgMTAwNjQ0Ci0tLSBhL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20v
S2J1aWxkCisrKyBiL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vS2J1aWxkCkBAIC0xLDkgKzEs
OCBAQAogIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAogZ2VuZXJpYy15ICs9IGV4
dGFibGUuaAogZ2VuZXJpYy15ICs9IGt2bV9wYXJhLmgKLWdlbmVyaWMteSArPSBtY3Nfc3Bpbmxv
Y2suaAotZ2VuZXJpYy15ICs9IHFzcGlubG9ja190eXBlcy5oCi1nZW5lcmljLXkgKz0gcXNwaW5s
b2NrLmgKK2dlbmVyaWMteSArPSB0aWNrZXQtbG9jay5oCitnZW5lcmljLXkgKz0gdGlja2V0LWxv
Y2stdHlwZXMuaAogZ2VuZXJpYy15ICs9IHFyd2xvY2tfdHlwZXMuaAogZ2VuZXJpYy15ICs9IHFy
d2xvY2suaAogZ2VuZXJpYy15ICs9IHVzZXIuaApkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9p
bmNsdWRlL2FzbS9zcGlubG9jay5oIGIvYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS9zcGlubG9j
ay5oCmluZGV4IDI2NDk0NGE3MTUzNS4uNDBlNGM5ZmRjMzQ5IDEwMDY0NAotLS0gYS9hcmNoL29w
ZW5yaXNjL2luY2x1ZGUvYXNtL3NwaW5sb2NrLmgKKysrIGIvYXJjaC9vcGVucmlzYy9pbmNsdWRl
L2FzbS9zcGlubG9jay5oCkBAIC0xNSw4ICsxNSw3IEBACiAjaWZuZGVmIF9fQVNNX09QRU5SSVND
X1NQSU5MT0NLX0gKICNkZWZpbmUgX19BU01fT1BFTlJJU0NfU1BJTkxPQ0tfSAogCi0jaW5jbHVk
ZSA8YXNtL3FzcGlubG9jay5oPgotCisjaW5jbHVkZSA8YXNtL3RpY2tldC1sb2NrLmg+CiAjaW5j
bHVkZSA8YXNtL3Fyd2xvY2suaD4KIAogI2RlZmluZSBhcmNoX3NwaW5fcmVsYXgobG9jaykJY3B1
X3JlbGF4KCkKZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vc3BpbmxvY2tf
dHlwZXMuaCBiL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vc3BpbmxvY2tfdHlwZXMuaAppbmRl
eCA3YzZmYjEyMDhjODguLjU4ZWEzMWZhNjVjZSAxMDA2NDQKLS0tIGEvYXJjaC9vcGVucmlzYy9p
bmNsdWRlL2FzbS9zcGlubG9ja190eXBlcy5oCisrKyBiL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9h
c20vc3BpbmxvY2tfdHlwZXMuaApAQCAtMSw3ICsxLDcgQEAKICNpZm5kZWYgX0FTTV9PUEVOUklT
Q19TUElOTE9DS19UWVBFU19ICiAjZGVmaW5lIF9BU01fT1BFTlJJU0NfU1BJTkxPQ0tfVFlQRVNf
SAogCi0jaW5jbHVkZSA8YXNtL3FzcGlubG9ja190eXBlcy5oPgorI2luY2x1ZGUgPGFzbS90aWNr
ZXQtbG9jay10eXBlcy5oPgogI2luY2x1ZGUgPGFzbS9xcndsb2NrX3R5cGVzLmg+CiAKICNlbmRp
ZiAvKiBfQVNNX09QRU5SSVNDX1NQSU5MT0NLX1RZUEVTX0ggKi8KLS0gCjIuMzQuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGlu
ZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVj
b3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
