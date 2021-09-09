Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 1F80A405EC4
	for <lists+openrisc@lfdr.de>; Thu,  9 Sep 2021 23:29:12 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9216524149;
	Thu,  9 Sep 2021 23:29:11 +0200 (CEST)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mail.librecores.org (Postfix) with ESMTPS id 052B523F5C
 for <openrisc@lists.librecores.org>; Thu,  9 Sep 2021 14:04:26 +0200 (CEST)
Received: by mail-wr1-f53.google.com with SMTP id n5so2186566wro.12
 for <openrisc@lists.librecores.org>; Thu, 09 Sep 2021 05:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TGhvxcJ5e0tWwjSJNqM6XCMaaGd6Uf1B/o2F+QC2P2E=;
 b=G9Aqk2QIyaP4NStdJlI2W+jYyFf2cxdEkKsatz7oGDFsfmYZi9tBWCduPA4+jE5p7U
 BOuY6gqJjmyV8v5QQKYxDwuzwKGa/5XhOO/tgHUHlhmUEBmh3zMhoy6pH4jz/X3mqm+B
 aiFLyQdZrtcHXPQq/wBywud/Lta/EdrBpbrZgbARYUg/fOO/ZsAxLyZc7yqfUK2jqcg3
 720naMUmXaJh+2jyYDvtsgc7dQDFDjt/gHNTBax++79zSiiVG4xnl5N2SAU6gkjrhJJm
 w9rVyMGtlv9iW1cuSRn5jzCsOgqZnJRO0L04W/ii+Is7cQG1OlyTaPAzvogxQD1BYjMN
 IkgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TGhvxcJ5e0tWwjSJNqM6XCMaaGd6Uf1B/o2F+QC2P2E=;
 b=c7El6n2GxiH/5WHXayKNela6AjMfllXKTQlQ1RlV1VCyzV/bUvekV3ozwHI64iRoaG
 PUKy64WYupvtslu0F4r5JTt0IFxml2xaTIvlxE3trUnAQsAwnx1bhKZQvWYxyxoL90cF
 5xquAiqW2pyjdz9TRjw8ZT1gt6gOkKQqf6jzxYLfUsC2WoGg0Oy8SBaNVVE8rP8KY8iP
 LcfAY7aDs+MwP0YfOJB1bpK4gKr7AdaavS1wq/d6I7bVrTjwmc//NAtjbbv7LPbuc3Fq
 +rCXAhIFOIPhbvSIN8AyxqzriXl2zZviFCc2ufY35UIHRMrvLPnel76ddWBvIDCAGwha
 c/KA==
X-Gm-Message-State: AOAM532yjlcwe8Popj77fa/AQuxQ4l2+6K1GOH5Qk4FhFcx8p8ALXcfG
 Dglo3bRdUKtTGXt5UOsi3HeqeA==
X-Google-Smtp-Source: ABdhPJwXFzB1KuSRyctCLMeToyBav6moCwvyVSJSQ2wA2Una7A66/qiHNzLd3gX+GGFxN1qUveWbMQ==
X-Received: by 2002:adf:de8a:: with SMTP id w10mr3133483wrl.413.1631189065464; 
 Thu, 09 Sep 2021 05:04:25 -0700 (PDT)
Received: from localhost.localdomain ([95.148.6.201])
 by smtp.gmail.com with ESMTPSA id n66sm1437498wmn.2.2021.09.09.05.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 05:04:24 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Thu,  9 Sep 2021 13:04:18 +0100
Message-Id: <20210909120421.1313908-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Sep 2021 23:29:09 +0200
Subject: [OpenRISC] [PATCH v2 0/3] power: reset: Convert Power-Off driver to
 tristate
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
 Paul Walmsley <paul.walmsley@sifive.com>, linux-mips@vger.kernel.org,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org,
 Brian Cain <bcain@codeaurora.org>, linux-hexagon@vger.kernel.org,
 Helge Deller <deller@gmx.de>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 linux-snps-arc@lists.infradead.org, Jeff Dike <jdike@addtoit.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, linux-um@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 John Crispin <john@phrozen.org>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-parisc@vger.kernel.org,
 Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

UHJvdmlkZSBzdXBwb3J0IHRvIGNvbXBpbGUgdGhlIFBvd2VyLU9mZiBkcml2ZXIgYXMgYSBtb2R1
bGUuCgp2MSA9PiB2MjoKIC0gcy9FWFBPUlRfU1lNQk9ML0VYUE9SVF9TWU1CT0xfR1BMLwogCkVs
bGlvdCBCZXJtYW4gKDIpOgogIHJlYm9vdDogRXhwb3J0IHJlYm9vdF9tb2RlCiAgcG93ZXI6IHJl
c2V0OiBFbmFibGUgdHJpc3RhdGUgb24gcmVzdGFydCBwb3dlci1vZmYgZHJpdmVyCgpMZWUgSm9u
ZXMgKDEpOgogIGFyY2g6IEV4cG9ydCBtYWNoaW5lX3Jlc3RhcnQoKSBpbnN0YW5jZXMgc28gdGhl
eSBjYW4gYmUgY2FsbGVkIGZyb20KICAgIG1vZHVsZXMKCiBhcmNoL2FyYy9rZXJuZWwvcmVzZXQu
YyAgICAgICAgICAgIHwgMSArCiBhcmNoL2FybS9rZXJuZWwvcmVib290LmMgICAgICAgICAgIHwg
MSArCiBhcmNoL2FybTY0L2tlcm5lbC9wcm9jZXNzLmMgICAgICAgIHwgMSArCiBhcmNoL2Nza3kv
a2VybmVsL3Bvd2VyLmMgICAgICAgICAgIHwgMSArCiBhcmNoL2g4MzAwL2tlcm5lbC9wcm9jZXNz
LmMgICAgICAgIHwgMSArCiBhcmNoL2hleGFnb24va2VybmVsL3Jlc2V0LmMgICAgICAgIHwgMSAr
CiBhcmNoL202OGsva2VybmVsL3Byb2Nlc3MuYyAgICAgICAgIHwgMSArCiBhcmNoL21pY3JvYmxh
emUva2VybmVsL3Jlc2V0LmMgICAgIHwgMSArCiBhcmNoL21pcHMva2VybmVsL3Jlc2V0LmMgICAg
ICAgICAgIHwgMSArCiBhcmNoL21pcHMvbGFudGlxL2ZhbGNvbi9yZXNldC5jICAgIHwgMSArCiBh
cmNoL21pcHMvc2dpLWlwMjcvaXAyNy1yZXNldC5jICAgIHwgMSArCiBhcmNoL25kczMyL2tlcm5l
bC9wcm9jZXNzLmMgICAgICAgIHwgMiArLQogYXJjaC9uaW9zMi9rZXJuZWwvcHJvY2Vzcy5jICAg
ICAgICB8IDEgKwogYXJjaC9vcGVucmlzYy9rZXJuZWwvcHJvY2Vzcy5jICAgICB8IDEgKwogYXJj
aC9wYXJpc2Mva2VybmVsL3Byb2Nlc3MuYyAgICAgICB8IDEgKwogYXJjaC9wb3dlcnBjL2tlcm5l
bC9zZXR1cC1jb21tb24uYyB8IDEgKwogYXJjaC9yaXNjdi9rZXJuZWwvcmVzZXQuYyAgICAgICAg
ICB8IDEgKwogYXJjaC9zMzkwL2tlcm5lbC9zZXR1cC5jICAgICAgICAgICB8IDEgKwogYXJjaC9z
aC9rZXJuZWwvcmVib290LmMgICAgICAgICAgICB8IDEgKwogYXJjaC9zcGFyYy9rZXJuZWwvcHJv
Y2Vzc18zMi5jICAgICB8IDEgKwogYXJjaC9zcGFyYy9rZXJuZWwvcmVib290LmMgICAgICAgICB8
IDEgKwogYXJjaC91bS9rZXJuZWwvcmVib290LmMgICAgICAgICAgICB8IDEgKwogYXJjaC94ODYv
a2VybmVsL3JlYm9vdC5jICAgICAgICAgICB8IDEgKwogYXJjaC94dGVuc2Eva2VybmVsL3NldHVw
LmMgICAgICAgICB8IDEgKwogZHJpdmVycy9wb3dlci9yZXNldC9LY29uZmlnICAgICAgICB8IDIg
Ky0KIGtlcm5lbC9yZWJvb3QuYyAgICAgICAgICAgICAgICAgICAgfCAyICsrCiAyNiBmaWxlcyBj
aGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKQ2M6IEFsYmVydCBPdSA8
YW91QGVlY3MuYmVya2VsZXkuZWR1PgpDYzogQW50b24gSXZhbm92IDxhbnRvbi5pdmFub3ZAY2Ft
YnJpZGdlZ3JleXMuY29tPgpDYzogQm9yaXNsYXYgUGV0a292IDxicEBhbGllbjguZGU+CkNjOiBC
cmlhbiBDYWluIDxiY2FpbkBjb2RlYXVyb3JhLm9yZz4KQ2M6IENocmlzdGlhbiBCb3JudHJhZWdl
ciA8Ym9ybnRyYWVnZXJAZGUuaWJtLmNvbT4KQ2M6IENocmlzIFphbmtlbCA8Y2hyaXNAemFua2Vs
Lm5ldD4KQ2M6IERhdmlkIFMuIE1pbGxlciA8ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldD4KQ2M6IEd1byBS
ZW4gPGd1b3JlbkBrZXJuZWwub3JnPgpDYzogSGVpa28gQ2Fyc3RlbnMgPGhjYUBsaW51eC5pYm0u
Y29tPgpDYzogSGVsZ2UgRGVsbGVyIDxkZWxsZXJAZ214LmRlPgpDYzogSW5nbyBNb2xuYXIgPG1p
bmdvQHJlZGhhdC5jb20+CkNjOiBKYW1lcyBFLkouIEJvdHRvbWxleSA8SmFtZXMuQm90dG9tbGV5
QEhhbnNlblBhcnRuZXJzaGlwLmNvbT4KQ2M6IEplZmYgRGlrZSA8amRpa2VAYWRkdG9pdC5jb20+
CkNjOiBKb2huIENyaXNwaW4gPGpvaG5AcGhyb3plbi5vcmc+CkNjOiBKb25hcyBCb25uIDxqb25h
c0Bzb3V0aHBvbGUuc2U+CkNjOiBMZXkgRm9vbiBUYW4gPGxleS5mb29uLnRhbkBpbnRlbC5jb20+
CkNjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKQ2M6IGxpbnV4LWNza3lA
dmdlci5rZXJuZWwub3JnCkNjOiBsaW51eC1oZXhhZ29uQHZnZXIua2VybmVsLm9yZwpDYzogbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZwpDYzogbGludXgtbTY4a0BsaXN0cy5saW51eC1tNjhr
Lm9yZwpDYzogbGludXgtbWlwc0B2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbnV4LXBhcmlzY0B2Z2Vy
Lmtlcm5lbC5vcmcKQ2M6IGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnCkNjOiBsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1zMzkwQHZnZXIua2VybmVsLm9yZwpD
YzogbGludXgtc2hAdmdlci5rZXJuZWwub3JnCkNjOiBsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZy
YWRlYWQub3JnCkNjOiBsaW51eC11bUBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC14dGVu
c2FAbGludXgteHRlbnNhLm9yZwpDYzogTWF4IEZpbGlwcG92IDxqY212YmtiY0BnbWFpbC5jb20+
CkNjOiBNaWNoYWVsIEVsbGVybWFuIDxtcGVAZWxsZXJtYW4uaWQuYXU+CkNjOiBNaWNoYWwgU2lt
ZWsgPG1vbnN0ckBtb25zdHIuZXU+CkNjOiBvcGVucmlzY0BsaXN0cy5saWJyZWNvcmVzLm9yZwpD
YzogUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4KQ2M6IFBhdWwgV2FsbXNsZXkg
PHBhdWwud2FsbXNsZXlAc2lmaXZlLmNvbT4KQ2M6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFy
ZEBub2QuYXQ+CkNjOiBSaWNoIEZlbGtlciA8ZGFsaWFzQGxpYmMub3JnPgpDYzogc3BhcmNsaW51
eEB2Z2VyLmtlcm5lbC5vcmcKQ2M6IFN0YWZmb3JkIEhvcm5lIDxzaG9ybmVAZ21haWwuY29tPgpD
YzogU3RlZmFuIEtyaXN0aWFuc3NvbiA8c3RlZmFuLmtyaXN0aWFuc3NvbkBzYXVuYWxhaHRpLmZp
PgpDYzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+CkNjOiB1Y2xpbnV4LWg4
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLmpwCkNjOiBWYXNpbHkgR29yYmlrIDxnb3JAbGludXgu
aWJtLmNvbT4KQ2M6IFZpbmVldCBHdXB0YSA8dmd1cHRhQHN5bm9wc3lzLmNvbT4KQ2M6IFdpbGwg
RGVhY29uIDx3aWxsQGtlcm5lbC5vcmc+CkNjOiBZb3NoaW5vcmkgU2F0byA8eXNhdG9AdXNlcnMu
c291cmNlZm9yZ2UuanA+Ci0tIAoyLjMzLjAuMTUzLmdiYTUwYzhmYTI0LWdvb2cKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcg
bGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29y
ZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
