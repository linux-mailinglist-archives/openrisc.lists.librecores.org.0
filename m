Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 5C8C8405EC5
	for <lists+openrisc@lfdr.de>; Thu,  9 Sep 2021 23:29:12 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id CCAF524183;
	Thu,  9 Sep 2021 23:29:11 +0200 (CEST)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mail.librecores.org (Postfix) with ESMTPS id 27BC7240C9
 for <openrisc@lists.librecores.org>; Thu,  9 Sep 2021 14:04:28 +0200 (CEST)
Received: by mail-wm1-f49.google.com with SMTP id
 u19-20020a7bc053000000b002f8d045b2caso1208004wmc.1
 for <openrisc@lists.librecores.org>; Thu, 09 Sep 2021 05:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K3vDDlqm04DaMwsoFUUJnAu6JgMCtAyVT1spCpUheAo=;
 b=sDD09AQopSiJ3AtxBztVP873sDOz/Dm0FAdJM+v1ON/192NsLFcT7+8c5fkhkTgGRi
 0Nd8zGb4B3fXELEQgOEbJKuJQrLwjie5Kl5kt/905SbdUrOuujw7TFNiWIzoW8hmDJuI
 /B0ZvV08VGU+EeQkhZLkbYcsNb9Zi3VPDX5NBmeKIx4NHaRZNeLehKe5LrdsDEHygrW4
 GrwVpG7zlf7ACbIZ+0ttCLiAuSA2XjfZfYzM/Q1uvzvIAR/XUa76+1HWzURzkqK3ZKm3
 jfhgVXaA/Cr4zJc4Dkvy01s+QMYr3vWpbS8vixpLf7TPigpzhiFOFksKy2njYYyJiT4U
 KKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K3vDDlqm04DaMwsoFUUJnAu6JgMCtAyVT1spCpUheAo=;
 b=Eo75x7DDKq2Hl6BZG/CEnolvC/f/enXWWnHX54fdFpxlXBjb1vHVQdtsQJUmqNykfM
 y01xqkj+sdL0GsS72gzWcpkkfOIDtvq6XlOBwT6YiS71+wGGhL+vSVFUY24972Oi6cz5
 ZN7DK/ANYIMRYRiUqqYXJIwDqcYtxQ0PzbZ55iMniEa4+7UbB6JMxIm9mZokrJWVjY8p
 lGKRQlscZI9yg7Ubz9/DDSnNirFXbQWQjsBFKYXXYSW2Yr3l5WMrdNJSvzv6SUsigUJl
 gqYw03fF5M/FP5lg98Zy4ET14XU/wLZIacY4L4eDSLvUrpkfxkKF4Er8ibwgcWhPDhLA
 SSkw==
X-Gm-Message-State: AOAM531pJp2MytYYNBRcowy0hC4Df58DtyqsuFOtIs9I9z/PCr/TGQ0m
 7LRfiS2WKUc+OHsLPZtLmjyilA==
X-Google-Smtp-Source: ABdhPJz0PFpr/wZU2BJPWEvtutySCqYGxgLOifcfTS5MAcWKT7qquZYWa46Z0XYFxy5mcPeu8yVcJQ==
X-Received: by 2002:a1c:1d42:: with SMTP id d63mr1301620wmd.55.1631189067647; 
 Thu, 09 Sep 2021 05:04:27 -0700 (PDT)
Received: from localhost.localdomain ([95.148.6.201])
 by smtp.gmail.com with ESMTPSA id n66sm1437498wmn.2.2021.09.09.05.04.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 05:04:27 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Thu,  9 Sep 2021 13:04:19 +0100
Message-Id: <20210909120421.1313908-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
In-Reply-To: <20210909120421.1313908-1-lee.jones@linaro.org>
References: <20210909120421.1313908-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Sep 2021 23:29:09 +0200
Subject: [OpenRISC] [PATCH v2 1/3] arch: Export machine_restart() instances
 so they can be called from modules
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, John Crispin <john@phrozen.org>,
 linux-mips@vger.kernel.org,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 linux-snps-arc@lists.infradead.org, Jeff Dike <jdike@addtoit.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Brian Cain <bcain@codeaurora.org>, linux-parisc@vger.kernel.org,
 Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Richard Weinberger <richard@nod.at>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

QSByZWNlbnQgYXR0ZW1wdCB0byBjb252ZXJ0IHRoZSBQb3dlciBSZXNldCBSZXN0YXJ0IGRyaXZl
ciB0byB0cmlzdGF0ZQpmYWlsZWQgYmVjYXVzZSBvZiB0aGUgZm9sbG93aW5nIGNvbXBpbGUgZXJy
b3IgKHJlcG9ydGVkIG9uY2UgbWVyZ2VkIGJ5ClN0ZXBoZW4gUm90aHdlbGwgdmlhIExpbnV4IE5l
eHQpOgoKICBFUlJPUjogIm1hY2hpbmVfcmVzdGFydCIgW2RyaXZlcnMvcG93ZXIvcmVzZXQvcmVz
dGFydC1wb3dlcm9mZi5rb10gdW5kZWZpbmVkIQoKVGhpcyBlcnJvciBvY2N1cnMgc2luY2Ugc29t
ZSBvZiB0aGUgbWFjaGluZV9yZXN0YXJ0KCkgaW5zdGFuY2VzIGFyZQpub3QgY3VycmVudGx5IGV4
cG9ydGVkIGZvciB1c2UgaW4gbW9kdWxlcy4gIFRoaXMgcGF0Y2ggYWltcyB0byByZWN0aWZ5CnRo
YXQuCgpDYzogVmluZWV0IEd1cHRhIDx2Z3VwdGFAc3lub3BzeXMuY29tPgpDYzogV2lsbCBEZWFj
b24gPHdpbGxAa2VybmVsLm9yZz4KQ2M6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgpDYzog
WW9zaGlub3JpIFNhdG8gPHlzYXRvQHVzZXJzLnNvdXJjZWZvcmdlLmpwPgpDYzogQnJpYW4gQ2Fp
biA8YmNhaW5AY29kZWF1cm9yYS5vcmc+CkNjOiBNaWNoYWwgU2ltZWsgPG1vbnN0ckBtb25zdHIu
ZXU+CkNjOiBKb2huIENyaXNwaW4gPGpvaG5AcGhyb3plbi5vcmc+CkNjOiBMZXkgRm9vbiBUYW4g
PGxleS5mb29uLnRhbkBpbnRlbC5jb20+CkNjOiBKb25hcyBCb25uIDxqb25hc0Bzb3V0aHBvbGUu
c2U+CkNjOiBTdGVmYW4gS3Jpc3RpYW5zc29uIDxzdGVmYW4ua3Jpc3RpYW5zc29uQHNhdW5hbGFo
dGkuZmk+CkNjOiBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4KQ2M6IEphbWVzIEUu
Si4gQm90dG9tbGV5IDxKYW1lcy5Cb3R0b21sZXlASGFuc2VuUGFydG5lcnNoaXAuY29tPgpDYzog
SGVsZ2UgRGVsbGVyIDxkZWxsZXJAZ214LmRlPgpDYzogTWljaGFlbCBFbGxlcm1hbiA8bXBlQGVs
bGVybWFuLmlkLmF1PgpDYzogUGF1bCBXYWxtc2xleSA8cGF1bC53YWxtc2xleUBzaWZpdmUuY29t
PgpDYzogUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4KQ2M6IEFsYmVydCBPdSA8
YW91QGVlY3MuYmVya2VsZXkuZWR1PgpDYzogSGVpa28gQ2Fyc3RlbnMgPGhjYUBsaW51eC5pYm0u
Y29tPgpDYzogVmFzaWx5IEdvcmJpayA8Z29yQGxpbnV4LmlibS5jb20+CkNjOiBDaHJpc3RpYW4g
Qm9ybnRyYWVnZXIgPGJvcm50cmFlZ2VyQGRlLmlibS5jb20+CkNjOiBSaWNoIEZlbGtlciA8ZGFs
aWFzQGxpYmMub3JnPgpDYzogRGF2aWQgUy4gTWlsbGVyIDxkYXZlbUBkYXZlbWxvZnQubmV0PgpD
YzogSmVmZiBEaWtlIDxqZGlrZUBhZGR0b2l0LmNvbT4KQ2M6IFJpY2hhcmQgV2VpbmJlcmdlciA8
cmljaGFyZEBub2QuYXQ+CkNjOiBBbnRvbiBJdmFub3YgPGFudG9uLml2YW5vdkBjYW1icmlkZ2Vn
cmV5cy5jb20+CkNjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KQ2M6IElu
Z28gTW9sbmFyIDxtaW5nb0ByZWRoYXQuY29tPgpDYzogQm9yaXNsYXYgUGV0a292IDxicEBhbGll
bjguZGU+CkNjOiBDaHJpcyBaYW5rZWwgPGNocmlzQHphbmtlbC5uZXQ+CkNjOiBNYXggRmlsaXBw
b3YgPGpjbXZia2JjQGdtYWlsLmNvbT4KQ2M6IGxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVh
ZC5vcmcKQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogbGludXgtY3NreUB2Z2VyLmtlcm5lbC5vcmcKQ2M6
IHVjbGludXgtaDgtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UuanAKQ2M6IGxpbnV4LWhleGFnb25A
dmdlci5rZXJuZWwub3JnCkNjOiBsaW51eC1tNjhrQGxpc3RzLmxpbnV4LW02OGsub3JnCkNjOiBs
aW51eC1taXBzQHZnZXIua2VybmVsLm9yZwpDYzogb3BlbnJpc2NAbGlzdHMubGlicmVjb3Jlcy5v
cmcKQ2M6IGxpbnV4LXBhcmlzY0B2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbnV4cHBjLWRldkBsaXN0
cy5vemxhYnMub3JnCkNjOiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51
eC1zMzkwQHZnZXIua2VybmVsLm9yZwpDYzogbGludXgtc2hAdmdlci5rZXJuZWwub3JnCkNjOiBz
cGFyY2xpbnV4QHZnZXIua2VybmVsLm9yZwpDYzogbGludXgtdW1AbGlzdHMuaW5mcmFkZWFkLm9y
ZwpDYzogbGludXgteHRlbnNhQGxpbnV4LXh0ZW5zYS5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpv
bmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KQWNrZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8
Z2VlcnRAbGludXgtbTY4ay5vcmc+CkFja2VkLWJ5OiBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4u
bWFyaW5hc0Bhcm0uY29tPgpBY2tlZC1ieTogVGhvbWFzIEJvZ2VuZG9lcmZlciA8dHNib2dlbmRA
YWxwaGEuZnJhbmtlbi5kZT4KLS0tCiBhcmNoL2FyYy9rZXJuZWwvcmVzZXQuYyAgICAgICAgICAg
IHwgMSArCiBhcmNoL2FybS9rZXJuZWwvcmVib290LmMgICAgICAgICAgIHwgMSArCiBhcmNoL2Fy
bTY0L2tlcm5lbC9wcm9jZXNzLmMgICAgICAgIHwgMSArCiBhcmNoL2Nza3kva2VybmVsL3Bvd2Vy
LmMgICAgICAgICAgIHwgMSArCiBhcmNoL2g4MzAwL2tlcm5lbC9wcm9jZXNzLmMgICAgICAgIHwg
MSArCiBhcmNoL2hleGFnb24va2VybmVsL3Jlc2V0LmMgICAgICAgIHwgMSArCiBhcmNoL202OGsv
a2VybmVsL3Byb2Nlc3MuYyAgICAgICAgIHwgMSArCiBhcmNoL21pY3JvYmxhemUva2VybmVsL3Jl
c2V0LmMgICAgIHwgMSArCiBhcmNoL21pcHMva2VybmVsL3Jlc2V0LmMgICAgICAgICAgIHwgMSAr
CiBhcmNoL21pcHMvbGFudGlxL2ZhbGNvbi9yZXNldC5jICAgIHwgMSArCiBhcmNoL21pcHMvc2dp
LWlwMjcvaXAyNy1yZXNldC5jICAgIHwgMSArCiBhcmNoL25kczMyL2tlcm5lbC9wcm9jZXNzLmMg
ICAgICAgIHwgMiArLQogYXJjaC9uaW9zMi9rZXJuZWwvcHJvY2Vzcy5jICAgICAgICB8IDEgKwog
YXJjaC9vcGVucmlzYy9rZXJuZWwvcHJvY2Vzcy5jICAgICB8IDEgKwogYXJjaC9wYXJpc2Mva2Vy
bmVsL3Byb2Nlc3MuYyAgICAgICB8IDEgKwogYXJjaC9wb3dlcnBjL2tlcm5lbC9zZXR1cC1jb21t
b24uYyB8IDEgKwogYXJjaC9yaXNjdi9rZXJuZWwvcmVzZXQuYyAgICAgICAgICB8IDEgKwogYXJj
aC9zMzkwL2tlcm5lbC9zZXR1cC5jICAgICAgICAgICB8IDEgKwogYXJjaC9zaC9rZXJuZWwvcmVi
b290LmMgICAgICAgICAgICB8IDEgKwogYXJjaC9zcGFyYy9rZXJuZWwvcHJvY2Vzc18zMi5jICAg
ICB8IDEgKwogYXJjaC9zcGFyYy9rZXJuZWwvcmVib290LmMgICAgICAgICB8IDEgKwogYXJjaC91
bS9rZXJuZWwvcmVib290LmMgICAgICAgICAgICB8IDEgKwogYXJjaC94ODYva2VybmVsL3JlYm9v
dC5jICAgICAgICAgICB8IDEgKwogYXJjaC94dGVuc2Eva2VybmVsL3NldHVwLmMgICAgICAgICB8
IDEgKwogMjQgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL2FyY2gvYXJjL2tlcm5lbC9yZXNldC5jIGIvYXJjaC9hcmMva2VybmVsL3Jl
c2V0LmMKaW5kZXggZmQ2YzNlYjkzMGJhZC4uMWY1ZDhjZTUzMmUyZiAxMDA2NDQKLS0tIGEvYXJj
aC9hcmMva2VybmVsL3Jlc2V0LmMKKysrIGIvYXJjaC9hcmMva2VybmVsL3Jlc2V0LmMKQEAgLTIw
LDYgKzIwLDcgQEAgdm9pZCBtYWNoaW5lX3Jlc3RhcnQoY2hhciAqX191bnVzZWQpCiAJcHJfaW5m
bygiUHV0IHlvdXIgcmVzdGFydCBoYW5kbGVyIGhlcmVcbiIpOwogCW1hY2hpbmVfaGFsdCgpOwog
fQorRVhQT1JUX1NZTUJPTF9HUEwobWFjaGluZV9yZXN0YXJ0KTsKIAogdm9pZCBtYWNoaW5lX3Bv
d2VyX29mZih2b2lkKQogewpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0va2VybmVsL3JlYm9vdC5jIGIv
YXJjaC9hcm0va2VybmVsL3JlYm9vdC5jCmluZGV4IDMwNDRmY2I4ZDA3MzYuLjk1Y2RjYjE3MjUx
YWYgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2tlcm5lbC9yZWJvb3QuYworKysgYi9hcmNoL2FybS9r
ZXJuZWwvcmVib290LmMKQEAgLTE0NiwzICsxNDYsNCBAQCB2b2lkIG1hY2hpbmVfcmVzdGFydChj
aGFyICpjbWQpCiAJcHJpbnRrKCJSZWJvb3QgZmFpbGVkIC0tIFN5c3RlbSBoYWx0ZWRcbiIpOwog
CXdoaWxlICgxKTsKIH0KK0VYUE9SVF9TWU1CT0xfR1BMKG1hY2hpbmVfcmVzdGFydCk7CmRpZmYg
LS1naXQgYS9hcmNoL2FybTY0L2tlcm5lbC9wcm9jZXNzLmMgYi9hcmNoL2FybTY0L2tlcm5lbC9w
cm9jZXNzLmMKaW5kZXggYzg5ODliOTk5MjUwZC4uZDc1NTdmNjQ5ZGJkNiAxMDA2NDQKLS0tIGEv
YXJjaC9hcm02NC9rZXJuZWwvcHJvY2Vzcy5jCisrKyBiL2FyY2gvYXJtNjQva2VybmVsL3Byb2Nl
c3MuYwpAQCAtMTQ4LDYgKzE0OCw3IEBAIHZvaWQgbWFjaGluZV9yZXN0YXJ0KGNoYXIgKmNtZCkK
IAlwcmludGsoIlJlYm9vdCBmYWlsZWQgLS0gU3lzdGVtIGhhbHRlZFxuIik7CiAJd2hpbGUgKDEp
OwogfQorRVhQT1JUX1NZTUJPTF9HUEwobWFjaGluZV9yZXN0YXJ0KTsKIAogI2RlZmluZSBic3Ry
KHN1ZmZpeCwgc3RyKSBbUFNSX0JUWVBFXyAjIyBzdWZmaXggPj4gUFNSX0JUWVBFX1NISUZUXSA9
IHN0cgogc3RhdGljIGNvbnN0IGNoYXIgKmNvbnN0IGJ0eXBlc1tdID0gewpkaWZmIC0tZ2l0IGEv
YXJjaC9jc2t5L2tlcm5lbC9wb3dlci5jIGIvYXJjaC9jc2t5L2tlcm5lbC9wb3dlci5jCmluZGV4
IDkyM2VlNGUzODFiODEuLjE3ODdkZTViMTNiYTYgMTAwNjQ0Ci0tLSBhL2FyY2gvY3NreS9rZXJu
ZWwvcG93ZXIuYworKysgYi9hcmNoL2Nza3kva2VybmVsL3Bvd2VyLmMKQEAgLTI4LDMgKzI4LDQg
QEAgdm9pZCBtYWNoaW5lX3Jlc3RhcnQoY2hhciAqY21kKQogCWRvX2tlcm5lbF9yZXN0YXJ0KGNt
ZCk7CiAJYXNtIHZvbGF0aWxlICgiYmtwdCIpOwogfQorRVhQT1JUX1NZTUJPTF9HUEwobWFjaGlu
ZV9yZXN0YXJ0KTsKZGlmZiAtLWdpdCBhL2FyY2gvaDgzMDAva2VybmVsL3Byb2Nlc3MuYyBiL2Fy
Y2gvaDgzMDAva2VybmVsL3Byb2Nlc3MuYwppbmRleCAyYWMyN2U0MjQ4YTQ2Li5mOTJmNDczYTE5
MzRhIDEwMDY0NAotLS0gYS9hcmNoL2g4MzAwL2tlcm5lbC9wcm9jZXNzLmMKKysrIGIvYXJjaC9o
ODMwMC9rZXJuZWwvcHJvY2Vzcy5jCkBAIC02Niw2ICs2Niw3IEBAIHZvaWQgbWFjaGluZV9yZXN0
YXJ0KGNoYXIgKl9fdW51c2VkKQogCWxvY2FsX2lycV9kaXNhYmxlKCk7CiAJX19hc21fXygiam1w
IEBAMCIpOwogfQorRVhQT1JUX1NZTUJPTF9HUEwobWFjaGluZV9yZXN0YXJ0KTsKIAogdm9pZCBt
YWNoaW5lX2hhbHQodm9pZCkKIHsKZGlmZiAtLWdpdCBhL2FyY2gvaGV4YWdvbi9rZXJuZWwvcmVz
ZXQuYyBiL2FyY2gvaGV4YWdvbi9rZXJuZWwvcmVzZXQuYwppbmRleCBkYTM2MTE0ZDkyOGYwLi5l
ZDc5ZTBlNWEwMzE4IDEwMDY0NAotLS0gYS9hcmNoL2hleGFnb24va2VybmVsL3Jlc2V0LmMKKysr
IGIvYXJjaC9oZXhhZ29uL2tlcm5lbC9yZXNldC5jCkBAIC0xOSw2ICsxOSw3IEBAIHZvaWQgbWFj
aGluZV9oYWx0KHZvaWQpCiB2b2lkIG1hY2hpbmVfcmVzdGFydChjaGFyICpjbWQpCiB7CiB9CitF
WFBPUlRfU1lNQk9MX0dQTChtYWNoaW5lX3Jlc3RhcnQpOwogCiB2b2lkICgqcG1fcG93ZXJfb2Zm
KSh2b2lkKSA9IE5VTEw7CiBFWFBPUlRfU1lNQk9MKHBtX3Bvd2VyX29mZik7CmRpZmYgLS1naXQg
YS9hcmNoL202OGsva2VybmVsL3Byb2Nlc3MuYyBiL2FyY2gvbTY4ay9rZXJuZWwvcHJvY2Vzcy5j
CmluZGV4IGRiNDlmOTA5MTcxMTIuLmY4OTFkOWI0YmRmMmYgMTAwNjQ0Ci0tLSBhL2FyY2gvbTY4
ay9rZXJuZWwvcHJvY2Vzcy5jCisrKyBiL2FyY2gvbTY4ay9rZXJuZWwvcHJvY2Vzcy5jCkBAIC01
Nyw2ICs1Nyw3IEBAIHZvaWQgbWFjaGluZV9yZXN0YXJ0KGNoYXIgKiBfX3VudXNlZCkKIAkJbWFj
aF9yZXNldCgpOwogCWZvciAoOzspOwogfQorRVhQT1JUX1NZTUJPTF9HUEwobWFjaGluZV9yZXN0
YXJ0KTsKIAogdm9pZCBtYWNoaW5lX2hhbHQodm9pZCkKIHsKZGlmZiAtLWdpdCBhL2FyY2gvbWlj
cm9ibGF6ZS9rZXJuZWwvcmVzZXQuYyBiL2FyY2gvbWljcm9ibGF6ZS9rZXJuZWwvcmVzZXQuYwpp
bmRleCA1ZjQ3MjI5MDgxNjRkLi43ZjQ3ZTU5OTE0YzBkIDEwMDY0NAotLS0gYS9hcmNoL21pY3Jv
YmxhemUva2VybmVsL3Jlc2V0LmMKKysrIGIvYXJjaC9taWNyb2JsYXplL2tlcm5lbC9yZXNldC5j
CkBAIC00MSwzICs0MSw0IEBAIHZvaWQgbWFjaGluZV9yZXN0YXJ0KGNoYXIgKmNtZCkKIAlwcl9l
bWVyZygiUmVib290IGZhaWxlZCAtLSBTeXN0ZW0gaGFsdGVkXG4iKTsKIAl3aGlsZSAoMSk7CiB9
CitFWFBPUlRfU1lNQk9MX0dQTChtYWNoaW5lX3Jlc3RhcnQpOwpkaWZmIC0tZ2l0IGEvYXJjaC9t
aXBzL2tlcm5lbC9yZXNldC5jIGIvYXJjaC9taXBzL2tlcm5lbC9yZXNldC5jCmluZGV4IDYyODg3
ODBiNzc5ZTcuLjRmZTJlZGMyZDA2ZDYgMTAwNjQ0Ci0tLSBhL2FyY2gvbWlwcy9rZXJuZWwvcmVz
ZXQuYworKysgYi9hcmNoL21pcHMva2VybmVsL3Jlc2V0LmMKQEAgLTk5LDYgKzk5LDcgQEAgdm9p
ZCBtYWNoaW5lX3Jlc3RhcnQoY2hhciAqY29tbWFuZCkKIAlwcl9lbWVyZygiUmVib290IGZhaWxl
ZCAtLSBTeXN0ZW0gaGFsdGVkXG4iKTsKIAltYWNoaW5lX2hhbmcoKTsKIH0KK0VYUE9SVF9TWU1C
T0xfR1BMKG1hY2hpbmVfcmVzdGFydCk7CiAKIHZvaWQgbWFjaGluZV9oYWx0KHZvaWQpCiB7CmRp
ZmYgLS1naXQgYS9hcmNoL21pcHMvbGFudGlxL2ZhbGNvbi9yZXNldC5jIGIvYXJjaC9taXBzL2xh
bnRpcS9mYWxjb24vcmVzZXQuYwppbmRleCAyNjE5OTZjMjMwY2Y2Li43MDI1OWRkMDlhYWVhIDEw
MDY0NAotLS0gYS9hcmNoL21pcHMvbGFudGlxL2ZhbGNvbi9yZXNldC5jCisrKyBiL2FyY2gvbWlw
cy9sYW50aXEvZmFsY29uL3Jlc2V0LmMKQEAgLTUxLDYgKzUxLDcgQEAgc3RhdGljIHZvaWQgbWFj
aGluZV9yZXN0YXJ0KGNoYXIgKmNvbW1hbmQpCiAJCSh2b2lkICopV0RUX1JFR19CQVNFKTsKIAl1
bnJlYWNoYWJsZSgpOwogfQorRVhQT1JUX1NZTUJPTF9HUEwobWFjaGluZV9yZXN0YXJ0KTsKIAog
c3RhdGljIHZvaWQgbWFjaGluZV9oYWx0KHZvaWQpCiB7CmRpZmYgLS1naXQgYS9hcmNoL21pcHMv
c2dpLWlwMjcvaXAyNy1yZXNldC5jIGIvYXJjaC9taXBzL3NnaS1pcDI3L2lwMjctcmVzZXQuYwpp
bmRleCA1YWM1YWQ2Mzg3MzQzLi4zNTA4NDY1MzAyMmVhIDEwMDY0NAotLS0gYS9hcmNoL21pcHMv
c2dpLWlwMjcvaXAyNy1yZXNldC5jCisrKyBiL2FyY2gvbWlwcy9zZ2ktaXAyNy9pcDI3LXJlc2V0
LmMKQEAgLTI5LDYgKzI5LDcgQEAKICNpbmNsdWRlICJpcDI3LWNvbW1vbi5oIgogCiB2b2lkIG1h
Y2hpbmVfcmVzdGFydChjaGFyICpjb21tYW5kKSBfX25vcmV0dXJuOworRVhQT1JUX1NZTUJPTF9H
UEwobWFjaGluZV9yZXN0YXJ0KTsKIHZvaWQgbWFjaGluZV9oYWx0KHZvaWQpIF9fbm9yZXR1cm47
CiB2b2lkIG1hY2hpbmVfcG93ZXJfb2ZmKHZvaWQpIF9fbm9yZXR1cm47CiAKZGlmZiAtLWdpdCBh
L2FyY2gvbmRzMzIva2VybmVsL3Byb2Nlc3MuYyBiL2FyY2gvbmRzMzIva2VybmVsL3Byb2Nlc3Mu
YwppbmRleCAzOTE4OTViNTRkMTNjLi5mNjBiNzBmY2ZhZjNkIDEwMDY0NAotLS0gYS9hcmNoL25k
czMyL2tlcm5lbC9wcm9jZXNzLmMKKysrIGIvYXJjaC9uZHMzMi9rZXJuZWwvcHJvY2Vzcy5jCkBA
IC05MSw3ICs5MSw3IEBAIHZvaWQgbWFjaGluZV9yZXN0YXJ0KGNoYXIgKmNtZCkKIAl3aGlsZSAo
MSkgOwogfQogCi1FWFBPUlRfU1lNQk9MKG1hY2hpbmVfcmVzdGFydCk7CitFWFBPUlRfU1lNQk9M
X0dQTChtYWNoaW5lX3Jlc3RhcnQpOwogCiB2b2lkIHNob3dfcmVncyhzdHJ1Y3QgcHRfcmVncyAq
cmVncykKIHsKZGlmZiAtLWdpdCBhL2FyY2gvbmlvczIva2VybmVsL3Byb2Nlc3MuYyBiL2FyY2gv
bmlvczIva2VybmVsL3Byb2Nlc3MuYwppbmRleCA5ZmYzN2JhMmJiNjAzLi5lYmM0OTQwMDU5ZGU1
IDEwMDY0NAotLS0gYS9hcmNoL25pb3MyL2tlcm5lbC9wcm9jZXNzLmMKKysrIGIvYXJjaC9uaW9z
Mi9rZXJuZWwvcHJvY2Vzcy5jCkBAIC01MSw2ICs1MSw3IEBAIHZvaWQgbWFjaGluZV9yZXN0YXJ0
KGNoYXIgKl9fdW51c2VkKQogCTogInIiIChjcHVpbmZvLnJlc2V0X2FkZHIpCiAJOiAicjQiKTsK
IH0KK0VYUE9SVF9TWU1CT0xfR1BMKG1hY2hpbmVfcmVzdGFydCk7CiAKIHZvaWQgbWFjaGluZV9o
YWx0KHZvaWQpCiB7CmRpZmYgLS1naXQgYS9hcmNoL29wZW5yaXNjL2tlcm5lbC9wcm9jZXNzLmMg
Yi9hcmNoL29wZW5yaXNjL2tlcm5lbC9wcm9jZXNzLmMKaW5kZXggZWI2MjQyOTY4MWZjOC4uZmJh
MmFhNmFlODQ3MCAxMDA2NDQKLS0tIGEvYXJjaC9vcGVucmlzYy9rZXJuZWwvcHJvY2Vzcy5jCisr
KyBiL2FyY2gvb3BlbnJpc2Mva2VybmVsL3Byb2Nlc3MuYwpAQCAtNjEsNiArNjEsNyBAQCB2b2lk
IG1hY2hpbmVfcmVzdGFydChjaGFyICpjbWQpCiAJcHJfZW1lcmcoIlJlYm9vdCBmYWlsZWQgLS0g
U3lzdGVtIGhhbHRlZFxuIik7CiAJd2hpbGUgKDEpOwogfQorRVhQT1JUX1NZTUJPTF9HUEwobWFj
aGluZV9yZXN0YXJ0KTsKIAogLyoKICAqIFNpbWlsYXIgdG8gbWFjaGluZV9wb3dlcl9vZmYsIGJ1
dCBkb24ndCBzaHV0IG9mZiBwb3dlci4gIEFkZCBjb2RlCmRpZmYgLS1naXQgYS9hcmNoL3Bhcmlz
Yy9rZXJuZWwvcHJvY2Vzcy5jIGIvYXJjaC9wYXJpc2Mva2VybmVsL3Byb2Nlc3MuYwppbmRleCAx
ODRlYzNjMWVhZTQ0Li5mMzlmNzYyMGQ3MTVkIDEwMDY0NAotLS0gYS9hcmNoL3BhcmlzYy9rZXJu
ZWwvcHJvY2Vzcy5jCisrKyBiL2FyY2gvcGFyaXNjL2tlcm5lbC9wcm9jZXNzLmMKQEAgLTk2LDYg
Kzk2LDcgQEAgdm9pZCBtYWNoaW5lX3Jlc3RhcnQoY2hhciAqY21kKQogCXdoaWxlICgxKSA7CiAK
IH0KK0VYUE9SVF9TWU1CT0xfR1BMKG1hY2hpbmVfcmVzdGFydCk7CiAKIHZvaWQgKCpjaGFzc2lz
X3Bvd2VyX29mZikodm9pZCk7CiAKZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvc2V0
dXAtY29tbW9uLmMgYi9hcmNoL3Bvd2VycGMva2VybmVsL3NldHVwLWNvbW1vbi5jCmluZGV4IGFh
OWMyZDAxNDI0YWYuLmRmZDg3NWQ0Zjg0NzggMTAwNjQ0Ci0tLSBhL2FyY2gvcG93ZXJwYy9rZXJu
ZWwvc2V0dXAtY29tbW9uLmMKKysrIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9zZXR1cC1jb21tb24u
YwpAQCAtMTU4LDYgKzE1OCw3IEBAIHZvaWQgbWFjaGluZV9yZXN0YXJ0KGNoYXIgKmNtZCkKIAog
CW1hY2hpbmVfaGFuZygpOwogfQorRVhQT1JUX1NZTUJPTF9HUEwobWFjaGluZV9yZXN0YXJ0KTsK
IAogdm9pZCBtYWNoaW5lX3Bvd2VyX29mZih2b2lkKQogewpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rZXJuZWwvcmVzZXQuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3Jlc2V0LmMKaW5kZXggZWU1ODc4
ZDk2OGNjMS4uNWZkMGFhM2UxMjc2NiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcmVz
ZXQuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9yZXNldC5jCkBAIC0yMCw2ICsyMCw3IEBAIHZv
aWQgbWFjaGluZV9yZXN0YXJ0KGNoYXIgKmNtZCkKIAlkb19rZXJuZWxfcmVzdGFydChjbWQpOwog
CXdoaWxlICgxKTsKIH0KK0VYUE9SVF9TWU1CT0xfR1BMKG1hY2hpbmVfcmVzdGFydCk7CiAKIHZv
aWQgbWFjaGluZV9oYWx0KHZvaWQpCiB7CmRpZmYgLS1naXQgYS9hcmNoL3MzOTAva2VybmVsL3Nl
dHVwLmMgYi9hcmNoL3MzOTAva2VybmVsL3NldHVwLmMKaW5kZXggZmYwZjllODM4OTE2Mi4uY2U4
YWZhMWNmODY0NSAxMDA2NDQKLS0tIGEvYXJjaC9zMzkwL2tlcm5lbC9zZXR1cC5jCisrKyBiL2Fy
Y2gvczM5MC9rZXJuZWwvc2V0dXAuYwpAQCAtMjc4LDYgKzI3OCw3IEBAIHZvaWQgbWFjaGluZV9y
ZXN0YXJ0KGNoYXIgKmNvbW1hbmQpCiAJCWNvbnNvbGVfdW5ibGFuaygpOwogCV9tYWNoaW5lX3Jl
c3RhcnQoY29tbWFuZCk7CiB9CitFWFBPUlRfU1lNQk9MX0dQTChtYWNoaW5lX3Jlc3RhcnQpOwog
CiB2b2lkIG1hY2hpbmVfaGFsdCh2b2lkKQogewpkaWZmIC0tZ2l0IGEvYXJjaC9zaC9rZXJuZWwv
cmVib290LmMgYi9hcmNoL3NoL2tlcm5lbC9yZWJvb3QuYwppbmRleCA1YzMzZjAzNjQxOGJlLi5l
YTRiMWJkYWRhNDFhIDEwMDY0NAotLS0gYS9hcmNoL3NoL2tlcm5lbC9yZWJvb3QuYworKysgYi9h
cmNoL3NoL2tlcm5lbC9yZWJvb3QuYwpAQCAtODMsNiArODMsNyBAQCB2b2lkIG1hY2hpbmVfcmVz
dGFydChjaGFyICpjbWQpCiB7CiAJbWFjaGluZV9vcHMucmVzdGFydChjbWQpOwogfQorRVhQT1JU
X1NZTUJPTF9HUEwobWFjaGluZV9yZXN0YXJ0KTsKIAogdm9pZCBtYWNoaW5lX2hhbHQodm9pZCkK
IHsKZGlmZiAtLWdpdCBhL2FyY2gvc3BhcmMva2VybmVsL3Byb2Nlc3NfMzIuYyBiL2FyY2gvc3Bh
cmMva2VybmVsL3Byb2Nlc3NfMzIuYwppbmRleCA5Mzk4M2Q2ZDQzMWRlLi5kZTkxMDZlMzg2OTE5
IDEwMDY0NAotLS0gYS9hcmNoL3NwYXJjL2tlcm5lbC9wcm9jZXNzXzMyLmMKKysrIGIvYXJjaC9z
cGFyYy9rZXJuZWwvcHJvY2Vzc18zMi5jCkBAIC0xMDQsNiArMTA0LDcgQEAgdm9pZCBtYWNoaW5l
X3Jlc3RhcnQoY2hhciAqIGNtZCkKIAlwcm9tX2ZldmFsICgicmVzZXQiKTsKIAlwYW5pYygiUmVi
b290IGZhaWxlZCEiKTsKIH0KK0VYUE9SVF9TWU1CT0xfR1BMKG1hY2hpbmVfcmVzdGFydCk7CiAK
IHZvaWQgbWFjaGluZV9wb3dlcl9vZmYodm9pZCkKIHsKZGlmZiAtLWdpdCBhL2FyY2gvc3BhcmMv
a2VybmVsL3JlYm9vdC5jIGIvYXJjaC9zcGFyYy9rZXJuZWwvcmVib290LmMKaW5kZXggNjljMWI2
YzA0N2Q1My4uZmFlYmY5NThjNGI1YSAxMDA2NDQKLS0tIGEvYXJjaC9zcGFyYy9rZXJuZWwvcmVi
b290LmMKKysrIGIvYXJjaC9zcGFyYy9rZXJuZWwvcmVib290LmMKQEAgLTUyLDQgKzUyLDUgQEAg
dm9pZCBtYWNoaW5lX3Jlc3RhcnQoY2hhciAqY21kKQogCXByb21fcmVib290KCIiKTsKIAlwYW5p
YygiUmVib290IGZhaWxlZCEiKTsKIH0KK0VYUE9SVF9TWU1CT0xfR1BMKG1hY2hpbmVfcmVzdGFy
dCk7CiAKZGlmZiAtLWdpdCBhL2FyY2gvdW0va2VybmVsL3JlYm9vdC5jIGIvYXJjaC91bS9rZXJu
ZWwvcmVib290LmMKaW5kZXggNDhjMDYxMGQ1MDZlMC4uN2NhMTQxY2Y0YTBhZiAxMDA2NDQKLS0t
IGEvYXJjaC91bS9rZXJuZWwvcmVib290LmMKKysrIGIvYXJjaC91bS9rZXJuZWwvcmVib290LmMK
QEAgLTQ3LDYgKzQ3LDcgQEAgdm9pZCBtYWNoaW5lX3Jlc3RhcnQoY2hhciAqIF9fdW51c2VkKQog
CXVtbF9jbGVhbnVwKCk7CiAJcmVib290X3NrYXMoKTsKIH0KK0VYUE9SVF9TWU1CT0xfR1BMKG1h
Y2hpbmVfcmVzdGFydCk7CiAKIHZvaWQgbWFjaGluZV9wb3dlcl9vZmYodm9pZCkKIHsKZGlmZiAt
LWdpdCBhL2FyY2gveDg2L2tlcm5lbC9yZWJvb3QuYyBiL2FyY2gveDg2L2tlcm5lbC9yZWJvb3Qu
YwppbmRleCBlYmZiOTExMDgyMzI2Li5kMzc4ZTgwYTYwYTFiIDEwMDY0NAotLS0gYS9hcmNoL3g4
Ni9rZXJuZWwvcmVib290LmMKKysrIGIvYXJjaC94ODYva2VybmVsL3JlYm9vdC5jCkBAIC03MzMs
NiArNzMzLDcgQEAgc3RhdGljIHZvaWQgbmF0aXZlX21hY2hpbmVfcmVzdGFydChjaGFyICpfX3Vu
dXNlZCkKIAkJbWFjaGluZV9zaHV0ZG93bigpOwogCV9fbWFjaGluZV9lbWVyZ2VuY3lfcmVzdGFy
dCgwKTsKIH0KK0VYUE9SVF9TWU1CT0xfR1BMKG1hY2hpbmVfcmVzdGFydCk7CiAKIHN0YXRpYyB2
b2lkIG5hdGl2ZV9tYWNoaW5lX2hhbHQodm9pZCkKIHsKZGlmZiAtLWdpdCBhL2FyY2gveHRlbnNh
L2tlcm5lbC9zZXR1cC5jIGIvYXJjaC94dGVuc2Eva2VybmVsL3NldHVwLmMKaW5kZXggZWQxODQx
MDZlNGNmOS4uYTcwYzEzNTFjZDU5ZSAxMDA2NDQKLS0tIGEvYXJjaC94dGVuc2Eva2VybmVsL3Nl
dHVwLmMKKysrIGIvYXJjaC94dGVuc2Eva2VybmVsL3NldHVwLmMKQEAgLTU2NCw2ICs1NjQsNyBA
QCB2b2lkIG1hY2hpbmVfcmVzdGFydChjaGFyICogY21kKQogewogCXBsYXRmb3JtX3Jlc3RhcnQo
KTsKIH0KK0VYUE9SVF9TWU1CT0xfR1BMKG1hY2hpbmVfcmVzdGFydCk7CiAKIHZvaWQgbWFjaGlu
ZV9oYWx0KHZvaWQpCiB7Ci0tIAoyLjMzLjAuMTUzLmdiYTUwYzhmYTI0LWdvb2cKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcg
bGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29y
ZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
