Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D6CFB4DBBD0
	for <lists+openrisc@lfdr.de>; Thu, 17 Mar 2022 01:34:51 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 674FF2406B;
	Thu, 17 Mar 2022 01:34:51 +0100 (CET)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mail.librecores.org (Postfix) with ESMTPS id 1EDAF248A2
 for <openrisc@lists.librecores.org>; Thu, 17 Mar 2022 00:28:27 +0100 (CET)
Received: by mail-pf1-f174.google.com with SMTP id p8so5362946pfh.8
 for <openrisc@lists.librecores.org>; Wed, 16 Mar 2022 16:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=ofUFlPn1fFr6Pz05IWJLvQM8LyheEnwZgHIcbcC4aPw=;
 b=S5EoqvKolpNViVFVC6Nzsj4aBgAWTlxXUWEEMY7p3wEb0057ehZpzaUnP8f4GDTFJs
 zse0vx0vaol845GXW+EPh58H5hafan3CLwS2NebIMBjef8U0HNWEx3yRz3jPiV3uJlEC
 YXWJrMiwVe+oiaYZPhnxkOPG0gNmZ72sB2JgKC7u3KkkHP6Mrza8LqpBn+wgIhU0+wXO
 eiGMxzeY0dkF1fMYunyzzQlM6whMlxgT8yXppR7Shy3VF4INxmMTGDdTecXUZiBbWpJi
 KxadBRMOObu8VavJ+IpQtZPAu2dQ5o1nwyDfes8oJeqdvEAFgSJuP+TqCD4jDajWtIKl
 w7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=ofUFlPn1fFr6Pz05IWJLvQM8LyheEnwZgHIcbcC4aPw=;
 b=UUiMf0B9dJeJI8XffIhSspub7gjNp6LcW0YSwWEgA1Uw99mNLjpArZ+vHHrF0tQMJM
 r6/t2tE6MZYJ4oTzhNGQkHvwKCPoSCzSHLotPpqspeVWD4JAU0NtLATcSdXHKb/1TPrI
 otkTOWAvSkktMNIl+lbKOdBZVc54z43+ioBBN0X/K39Sv88AXnhHV0Awxl75Rc+8ojTP
 aP+1zvAO9Y+hqEwgAhwK0DEvFIr8lZ8So8eBnMR9CEK/JmmFCtcRjhbBt6bbGbNm6i/M
 28W2R08+nP1L4GCmlHJu1HlEACz0e0neeJkZ1n13H4MYM5+wzfMu8yoonEsOaUnUufFN
 +i7Q==
X-Gm-Message-State: AOAM531B4CP9pRGRfH08tHs7uanUDp4oFjHBXWZzNxIDslB1sXKZVFRM
 fCLJNGqjHsWYFJQ1RcgBaOgDJw==
X-Google-Smtp-Source: ABdhPJxYRrhM5pW5WVasmxAVWyXeEsoX5VSiHkFO1pWtO6NNC1CxKjdOixv6tMKvEgnHK4ZptvG9zQ==
X-Received: by 2002:a63:5855:0:b0:380:a9f7:e373 with SMTP id
 i21-20020a635855000000b00380a9f7e373mr1418979pgm.557.1647473305604; 
 Wed, 16 Mar 2022 16:28:25 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 l186-20020a633ec3000000b003820485172asm145763pga.65.2022.03.16.16.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 16:28:25 -0700 (PDT)
Date: Wed, 16 Mar 2022 16:25:56 -0700
Message-Id: <20220316232600.20419-2-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220316232600.20419-1-palmer@rivosinc.com>
References: <20220316232600.20419-1-palmer@rivosinc.com>
MIME-Version: 1.0
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, peterz@infradead.org
X-Mailman-Approved-At: Thu, 17 Mar 2022 01:34:48 +0100
Subject: [OpenRISC] [PATCH 1/5] asm-generic: qspinlock: Indicate the use of
 mixed-size atomics
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

RnJvbTogUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPgoKVGhlIHFzcGlubG9j
ayBpbXBsZW1lbnRhdGlvbiBkZXBlbmRzIG9uIGhhdmluZyB3ZWxsIGJlaGF2ZWQgbWl4ZWQtc2l6
ZQphdG9taWNzLiAgVGhpcyBpcyB0cnVlIG9uIHRoZSBtb3JlIHdpZGVseS11c2VkIHBsYXRmb3Jt
cywgYnV0IHRoZXNlCnJlcXVpcmVtZW50cyBhcmUgc29tZXdoYXQgc3VidGxlIGFuZCBtYXkgbm90
IGJlIHNhdGlzZmllZCBieSBhbGwgdGhlCnBsYXRmb3JtcyB0aGF0IHFzcGlubG9jayBpcyB1c2Vk
IG9uLgoKRG9jdW1lbnQgdGhlc2UgcmVxdWlyZW1lbnRzLCBzbyBwb3J0cyB0aGF0IHVzZSBxc3Bp
bmxvY2sgY2FuIG1vcmUgZWFzaWx5CmRldGVybWluZSBpZiB0aGV5IG1lZXQgdGhlc2UgcmVxdWly
ZW1lbnRzLgoKU2lnbmVkLW9mZi1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5j
b20+CgotLS0KCkkgaGF2ZSBzcGVjaWZpY2FsbHkgbm90IGluY2x1ZGVkIFBldGVyJ3MgU09CIG9u
IHRoaXMsIGFzIGhlIHNlbnQgaGlzCm9yaWdpbmFsIHBhdGNoCjxodHRwczovL2xvcmUua2VybmVs
Lm9yZy9sa21sL1lIYkJCdVZGTm5JNGtqajNAaGlyZXoucHJvZ3JhbW1pbmcua2lja3MtYXNzLm5l
dC8+CndpdGhvdXQgb25lLgotLS0KIGluY2x1ZGUvYXNtLWdlbmVyaWMvcXNwaW5sb2NrLmggfCAz
MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAzMCBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9hc20tZ2VuZXJpYy9xc3BpbmxvY2suaCBi
L2luY2x1ZGUvYXNtLWdlbmVyaWMvcXNwaW5sb2NrLmgKaW5kZXggZDc0YjEzODI1NTAxLi5hN2Ex
Mjk2YjBiNGQgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvYXNtLWdlbmVyaWMvcXNwaW5sb2NrLmgKKysr
IGIvaW5jbHVkZS9hc20tZ2VuZXJpYy9xc3BpbmxvY2suaApAQCAtMiw2ICsyLDM2IEBACiAvKgog
ICogUXVldWVkIHNwaW5sb2NrCiAgKgorICogQSAnZ2VuZXJpYycgc3BpbmxvY2sgaW1wbGVtZW50
YXRpb24gdGhhdCBpcyBiYXNlZCBvbiBNQ1MgbG9ja3MuIEFuCisgKiBhcmNoaXRlY3R1cmUgdGhh
dCdzIGxvb2tpbmcgZm9yIGEgJ2dlbmVyaWMnIHNwaW5sb2NrLCBwbGVhc2UgZmlyc3QgY29uc2lk
ZXIKKyAqIHRpY2tldC1sb2NrLmggYW5kIG9ubHkgY29tZSBsb29raW5nIGhlcmUgd2hlbiB5b3Un
dmUgY29uc2lkZXJlZCBhbGwgdGhlCisgKiBjb25zdHJhaW50cyBiZWxvdyBhbmQgY2FuIHNob3cg
eW91ciBoYXJkd2FyZSBkb2VzIGFjdHVhbGx5IHBlcmZvcm0gYmV0dGVyCisgKiB3aXRoIHFzcGlu
bG9jay4KKyAqCisgKgorICogSXQgcmVsaWVzIG9uIGF0b21pY18qX3JlbGVhc2UoKS9hdG9taWNf
Kl9hY3F1aXJlKCkgdG8gYmUgUkNzYyAob3Igbm8gd2Vha2VyCisgKiB0aGFuIFJDdHNvIGlmIHlv
dSdyZSBwb3dlciksIHdoZXJlIHJlZ3VsYXIgY29kZSBvbmx5IGV4cGVjdHMgYXRvbWljX3QgdG8g
YmUKKyAqIFJDcGMuCisgKgorICogSXQgcmVsaWVzIG9uIGEgZmFyIGdyZWF0ZXIgKGNvbXBhcmVk
IHRvIHRpY2tldC1sb2NrLmgpIHNldCBvZiBhdG9taWMKKyAqIG9wZXJhdGlvbnMgdG8gYmVoYXZl
IHdlbGwgdG9nZXRoZXIsIHBsZWFzZSBhdWRpdCB0aGVtIGNhcmVmdWxseSB0byBlbnN1cmUKKyAq
IHRoZXkgYWxsIGhhdmUgZm9yd2FyZCBwcm9ncmVzcy4gTWFueSBhdG9taWMgb3BlcmF0aW9ucyBt
YXkgZGVmYXVsdCB0bworICogY21weGNoZygpIGxvb3BzIHdoaWNoIHdpbGwgbm90IGhhdmUgZ29v
ZCBmb3J3YXJkIHByb2dyZXNzIHByb3BlcnRpZXMgb24KKyAqIExML1NDIGFyY2hpdGVjdHVyZXMu
CisgKgorICogT25lIG5vdGFibGUgZXhhbXBsZSBpcyBhdG9taWNfZmV0Y2hfb3JfYWNxdWlyZSgp
LCB3aGljaCB4ODYgY2Fubm90IChjaGVhcGx5KQorICogZG8uIENhcmVmdWxseSByZWFkIHRoZSBw
YXRjaGVzIHRoYXQgaW50cm9kdWNlZCBxdWV1ZWRfZmV0Y2hfc2V0X3BlbmRpbmdfYWNxdWlyZSgp
LgorICoKKyAqIEl0IGFsc28gaGVhdmlseSByZWxpZXMgb24gbWl4ZWQgc2l6ZSBhdG9taWMgb3Bl
cmF0aW9ucywgaW4gc3BlY2lmaWMgaXQKKyAqIHJlcXVpcmVzIGFyY2hpdGVjdHVyZXMgdG8gaGF2
ZSB4Y2hnMTY7IHNvbWV0aGluZyB3aGljaCBtYW55IExML1NDCisgKiBhcmNoaXRlY3R1cmVzIG5l
ZWQgdG8gaW1wbGVtZW50IGFzIGEgMzJiaXQgYW5kK29yIGluIG9yZGVyIHRvIHNhdGlzZnkgdGhl
CisgKiBmb3J3YXJkIHByb2dyZXNzIGd1YXJhbnRlZXMgbWVudGlvbmVkIGFib3ZlLgorICoKKyAq
IEZ1cnRoZXIgcmVhZGluZyBvbiBtaXhlZCBzaXplIGF0b21pY3MgdGhhdCBtaWdodCBiZSByZWxl
dmFudDoKKyAqCisgKiAgIGh0dHA6Ly93d3cuY2wuY2FtLmFjLnVrL35wZXMyMC9wb3BsMTcvbWl4
ZWQtc2l6ZS5wZGYKKyAqCisgKgogICogKEMpIENvcHlyaWdodCAyMDEzLTIwMTUgSGV3bGV0dC1Q
YWNrYXJkIERldmVsb3BtZW50IENvbXBhbnksIEwuUC4KICAqIChDKSBDb3B5cmlnaHQgMjAxNSBI
ZXdsZXR0LVBhY2thcmQgRW50ZXJwcmlzZSBEZXZlbG9wbWVudCBMUAogICoKLS0gCjIuMzQuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
