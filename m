Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 5728C3F6F9C
	for <lists+openrisc@lfdr.de>; Wed, 25 Aug 2021 08:35:22 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E62BB213A6;
	Wed, 25 Aug 2021 08:35:21 +0200 (CEST)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mail.librecores.org (Postfix) with ESMTPS id CAF8A240F0
 for <openrisc@lists.librecores.org>; Wed, 25 Aug 2021 05:49:39 +0200 (CEST)
Received: by mail-pl1-f180.google.com with SMTP id m17so6475684plc.6
 for <openrisc@lists.librecores.org>; Tue, 24 Aug 2021 20:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=CbvF3gcMl15CsJvEJlvAwV4jg0kS7/1c0/243X9NmVQ=;
 b=nS8Xfv5Np514ewOr71qM5OVYQ4om375+9iia5AAYDaK3OM+hzJenuJr7dAU5cYremk
 lMJSdk/H6gRuWyoAZ38Dxo4xTOwzwlYBTQ7mHvrJGvY2eRlpd9btrTwCc/T4R+lnp2Oz
 tfjjB9XYA84IA+sxs7E0+0bjR3ImZY/NCblTCqWV1vz8ngiUx+QRlaWbVMisVRWW3rOO
 yK85Pgi7JMY0nVAg9WrPZrM52PG/5lW+DmvVcQIgBTfNfdcKCdUHJCl4J+hHtwrGzLzq
 JQXK/nMftIjnNhxqPt/IHdPMmbV0SixoX/iiQ7rUV+IDNkS5Y0uflbsJwBJg2KghrkLe
 Gahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=CbvF3gcMl15CsJvEJlvAwV4jg0kS7/1c0/243X9NmVQ=;
 b=c1CgTh91MgEYgCz1nP6SxCppaDjYzvHW5uJhyvyB7qQBAz1FmizntMvCnDE1kdpZjF
 oAJOgr2LP4pKLSd8wzDtehEAtnFVWELLqN81NbAtlom9AF7LpNtOyxjWw8Otlylq53a0
 FSziVzpNsqrAw0L4SiFR+ZpLZJHD3kJbcgSUWETr+GVehwltcKieiMqPpjgZJGmWksCU
 BDr5iuhu+IDvShylAUVs3IZ7pDS6JEwrQI6nTkqYDyqVL8a4tTG7A7QuFbhCON5jv6GH
 sfU/vdC2tH6ODWiR5mfojqIZz00w3x6CDChsNH1jvSFIGk6LrMMrB9nBVy6WwL1PmGy6
 POcg==
X-Gm-Message-State: AOAM5311YLJP365SDdGoMij0kS9o5+Xrr4IEak5Zv6umd/3tA+NXjnmY
 0D6ciYF3OFtlEHm02KdnHjF6OQ==
X-Google-Smtp-Source: ABdhPJyuW0xG5fzwlVnm+V74njUWhK4iHoDYuJqptloS8iraqWcj5+LzzcKnLTPVDHS2p7IwfcePKA==
X-Received: by 2002:a17:90a:428f:: with SMTP id
 p15mr8241589pjg.75.1629863378109; 
 Tue, 24 Aug 2021 20:49:38 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id q21sm23393107pgk.71.2021.08.24.20.49.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 20:49:37 -0700 (PDT)
Date: Tue, 24 Aug 2021 20:49:37 -0700 (PDT)
X-Google-Original-Date: Tue, 24 Aug 2021 20:42:18 PDT (-0700)
In-Reply-To: <20210731052233.4703-2-masahiroy@kernel.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: masahiroy@kernel.org
Message-ID: <mhng-fae2ea79-c261-4e5d-8eae-21e60810a957@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-Mailman-Approved-At: Wed, 25 Aug 2021 08:35:20 +0200
Subject: Re: [OpenRISC] [PATCH 2/3] trace: refactor TRACE_IRQFLAGS_SUPPORT
 in Kconfig
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
Cc: mark.rutland@arm.com, dalias@libc.org, benh@kernel.crashing.org,
 mpe@ellerman.id.au, linux-sh@vger.kernel.org, peterz@infradead.org,
 catalin.marinas@arm.com, linus.walleij@linaro.org, viresh.kumar@linaro.org,
 linux-kernel@vger.kernel.org, James.Bottomley@HansenPartnership.com,
 jcmvbkbc@gmail.com, guoren@kernel.org, linux-csky@vger.kernel.org,
 hpa@zytor.com, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 deanbo422@gmail.com, will@kernel.org, ardb@kernel.org, paulus@samba.org,
 anton.ivanov@cambridgegreys.com, jonas@southpole.se,
 linux-s390@vger.kernel.org, gor@linux.ibm.com, ysato@users.sourceforge.jp,
 krzysztof.kozlowski@canonical.com, yifeifz2@illinois.edu, richard@nod.at,
 masahiroy@kernel.org, x86@kernel.org, linux@armlinux.org.uk,
 ley.foon.tan@intel.com, borntraeger@de.ibm.com, mingo@redhat.com,
 linux-parisc@vger.kernel.org, samitolvanen@google.com,
 u.kleine-koenig@pengutronix.de, linux-snps-arc@lists.infradead.org,
 jdike@addtoit.com, linux-xtensa@linux-xtensa.org, aou@eecs.berkeley.edu,
 keescook@chromium.org, Arnd Bergmann <arnd@arndb.de>,
 anshuman.khandual@arm.com, hca@linux.ibm.com, linux-um@lists.infradead.org,
 rostedt@goodmis.org, openrisc@lists.librecores.org, bp@alien8.de,
 green.hu@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>,
 tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, andreyknvl@gmail.com,
 chris@zankel.net, monstr@monstr.eu, tsbogend@alpha.franken.de,
 bcain@codeaurora.org, nickhu@andestech.com, vgupta@synopsys.com,
 npiggin@gmail.com, linux-mips@vger.kernel.org, davem@davemloft.net,
 frederic@kernel.org, linux-hexagon@vger.kernel.org, colin.king@canonical.com,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, deller@gmx.de,
 rppt@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gRnJpLCAzMCBKdWwgMjAyMSAyMjoyMjozMiBQRFQgKC0wNzAwKSwgbWFzYWhpcm95QGtlcm5l
bC5vcmcgd3JvdGU6Cj4gTWFrZSBhcmNoaXRlY3R1cmVzIHNlbGVjdCBUUkFDRV9JUlFGTEFHU19T
VVBQT1JUIGluc3RlYWQgb2YKPiBoYXZpbmcgbWFueSBkZWZpbmVzLgo+Cj4gU2lnbmVkLW9mZi1i
eTogTWFzYWhpcm8gWWFtYWRhIDxtYXNhaGlyb3lAa2VybmVsLm9yZz4KPiAtLS0KPgo+ICBhcmNo
L3Jpc2N2L0tjb25maWcgICAgICAgICAgICB8IDQgKy0tLQoKQWNrZWQtYnk6IFBhbG1lciBEYWJi
ZWx0IDxwYWxtZXJkYWJiZWx0QGdvb2dsZS5jb20+CgpUaGFua3MhCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVu
UklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xp
c3RpbmZvL29wZW5yaXNjCg==
