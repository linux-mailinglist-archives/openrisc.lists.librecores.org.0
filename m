Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B91CB501DF0
	for <lists+openrisc@lfdr.de>; Fri, 15 Apr 2022 00:05:21 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1A4A42489C;
	Fri, 15 Apr 2022 00:05:21 +0200 (CEST)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mail.librecores.org (Postfix) with ESMTPS id 6C6902480E
 for <openrisc@lists.librecores.org>; Fri, 15 Apr 2022 00:05:18 +0200 (CEST)
Received: by mail-pg1-f180.google.com with SMTP id r66so5938907pgr.3
 for <openrisc@lists.librecores.org>; Thu, 14 Apr 2022 15:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=z18FUB9s7KBEskqVTf7aP0q/WSmapl+AGV7tm/Rzx+w=;
 b=4yj8GNYwMFBt5S0TCYDexDsiDgZ+CphToZcr69BGb+YO1dX8XzN0DW+MGc/xCJDeXb
 Hcz0uIdoJnuNbkWJiV2+Fo3CA8vLW0C1IgS1CVVzH9aUg5j68NMCEbjwNgdXnkv7fEqz
 F6CZHlw5j34X9Ls84Zrx86UjvsRc7ZpFw0TYHUhHn1yyKX3+gl4msFSRvBIaTAhSTZdL
 2YApeozR+Yfgpu19kZ4rinoHRC5MkmRhG0bqlbbT5bTMnVca/5C3iwU5CORogN7li9gJ
 eSftO1vHZa891P1ksAqxpAa0QJfvz+pd7dN+ERBzaFvvo1jYWPruym4OXs80BdrcFNBg
 2lPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=z18FUB9s7KBEskqVTf7aP0q/WSmapl+AGV7tm/Rzx+w=;
 b=zJc/E5zMkcG9Hvhy3FY2AsPG5bAGqw8xtEq0GMsj+8BAUm+N3PtQa+RlMmlhUk8U14
 IV2AyF+2aRBZZSK+TJW4KCsvlpD3aJFS+W6H0Ncl0xpabYDEyN6SliVShlzHqu0HUxLo
 yPaHtv9GUnMEPoX4DHGqlx1DzMi2e0ZeA4duYSK2B9bLJvgZPk2vIFt2rxsgFmZTk1VR
 53wlS/7UB52gWovFsrXDhdE7MmHyt1iXGBUIXOQOExBtXHWJH8G2+ejxq1FPpsMo/0rR
 orlJLT7lUR3ugJ0zE9MzJDZUL+dqK+HX4clG1AuGxDl2imiNDaWJpRm0yLqP2DfyZRAm
 p3OQ==
X-Gm-Message-State: AOAM532j+/E+sl4VaQ6BhsdR3bJpcB4nFHdKHIbWte6AwGNGCuY7HjDQ
 IN9tOeV9Ci3x1BS6Z95lvwq1tw==
X-Google-Smtp-Source: ABdhPJy61GZpC7zZcOHBW9CQYGCxUgM5MW1Ir+LhmYjjwp3P+2wGDB1OrlzNEu7uootqzIZd255ezw==
X-Received: by 2002:a05:6a00:1a06:b0:4fc:d6c5:f3d7 with SMTP id
 g6-20020a056a001a0600b004fcd6c5f3d7mr5841959pfv.53.1649973916890; 
 Thu, 14 Apr 2022 15:05:16 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 n19-20020a635c53000000b0039dc2ea9876sm2697213pgm.49.2022.04.14.15.05.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 15:05:16 -0700 (PDT)
Date: Thu, 14 Apr 2022 15:02:09 -0700
Message-Id: <20220414220214.24556-3-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220414220214.24556-1-palmer@rivosinc.com>
References: <20220414220214.24556-1-palmer@rivosinc.com>
MIME-Version: 1.0
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>, heiko@sntech.de, guoren@kernel.org,
 shorne@gmail.com
Subject: [OpenRISC] [PATCH v3 2/7] asm-generic: qspinlock: Indicate the use
 of mixed-size atomics
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
Cc: wangkefeng.wang@huawei.com, peterz@infradead.org,
 Palmer Dabbelt <palmer@rivosinc.com>, jszhang@kernel.org,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 jonas@southpole.se, linux-csky@vger.kernel.org, mingo@redhat.com,
 longman@redhat.com, linux-arch@vger.kernel.org, aou@eecs.berkeley.edu,
 Arnd Bergmann <arnd@arndb.de>, boqun.feng@gmail.com,
 openrisc@lists.librecores.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, sudipm.mukherjee@gmail.com,
 macro@orcam.me.uk
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
ZW1lbnRzLgoKU2lnbmVkLW9mZi1ieTogUGV0ZXIgWmlqbHN0cmEgKEludGVsKSA8cGV0ZXJ6QGlu
ZnJhZGVhZC5vcmc+CkFja2VkLWJ5OiBXYWltYW4gTG9uZyA8bG9uZ21hbkByZWRoYXQuY29tPgpT
aWduZWQtb2ZmLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KLS0tCiBp
bmNsdWRlL2FzbS1nZW5lcmljL3FzcGlubG9jay5oIHwgMzEgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9pbmNsdWRlL2FzbS1nZW5lcmljL3FzcGlubG9jay5oIGIvaW5jbHVkZS9hc20tZ2VuZXJpYy9x
c3BpbmxvY2suaAppbmRleCBkNzRiMTM4MjU1MDEuLjk1YmUzZjNjMjhiNSAxMDA2NDQKLS0tIGEv
aW5jbHVkZS9hc20tZ2VuZXJpYy9xc3BpbmxvY2suaAorKysgYi9pbmNsdWRlL2FzbS1nZW5lcmlj
L3FzcGlubG9jay5oCkBAIC0yLDYgKzIsMzcgQEAKIC8qCiAgKiBRdWV1ZWQgc3BpbmxvY2sKICAq
CisgKiBBICdnZW5lcmljJyBzcGlubG9jayBpbXBsZW1lbnRhdGlvbiB0aGF0IGlzIGJhc2VkIG9u
IE1DUyBsb2Nrcy4gQW4KKyAqIGFyY2hpdGVjdHVyZSB0aGF0J3MgbG9va2luZyBmb3IgYSAnZ2Vu
ZXJpYycgc3BpbmxvY2ssIHBsZWFzZSBmaXJzdCBjb25zaWRlcgorICogdGlja2V0LWxvY2suaCBh
bmQgb25seSBjb21lIGxvb2tpbmcgaGVyZSB3aGVuIHlvdSd2ZSBjb25zaWRlcmVkIGFsbCB0aGUK
KyAqIGNvbnN0cmFpbnRzIGJlbG93IGFuZCBjYW4gc2hvdyB5b3VyIGhhcmR3YXJlIGRvZXMgYWN0
dWFsbHkgcGVyZm9ybSBiZXR0ZXIKKyAqIHdpdGggcXNwaW5sb2NrLgorICoKKyAqCisgKiBJdCBy
ZWxpZXMgb24gYXRvbWljXypfcmVsZWFzZSgpL2F0b21pY18qX2FjcXVpcmUoKSB0byBiZSBSQ3Nj
IChvciBubyB3ZWFrZXIKKyAqIHRoYW4gUkN0c28gaWYgeW91J3JlIHBvd2VyKSwgd2hlcmUgcmVn
dWxhciBjb2RlIG9ubHkgZXhwZWN0cyBhdG9taWNfdCB0byBiZQorICogUkNwYy4KKyAqCisgKiBJ
dCByZWxpZXMgb24gYSBmYXIgZ3JlYXRlciAoY29tcGFyZWQgdG8gYXNtLWdlbmVyaWMvc3Bpbmxv
Y2suaCkgc2V0IG9mCisgKiBhdG9taWMgb3BlcmF0aW9ucyB0byBiZWhhdmUgd2VsbCB0b2dldGhl
ciwgcGxlYXNlIGF1ZGl0IHRoZW0gY2FyZWZ1bGx5IHRvCisgKiBlbnN1cmUgdGhleSBhbGwgaGF2
ZSBmb3J3YXJkIHByb2dyZXNzLiBNYW55IGF0b21pYyBvcGVyYXRpb25zIG1heSBkZWZhdWx0IHRv
CisgKiBjbXB4Y2hnKCkgbG9vcHMgd2hpY2ggd2lsbCBub3QgaGF2ZSBnb29kIGZvcndhcmQgcHJv
Z3Jlc3MgcHJvcGVydGllcyBvbgorICogTEwvU0MgYXJjaGl0ZWN0dXJlcy4KKyAqCisgKiBPbmUg
bm90YWJsZSBleGFtcGxlIGlzIGF0b21pY19mZXRjaF9vcl9hY3F1aXJlKCksIHdoaWNoIHg4NiBj
YW5ub3QgKGNoZWFwbHkpCisgKiBkby4gQ2FyZWZ1bGx5IHJlYWQgdGhlIHBhdGNoZXMgdGhhdCBp
bnRyb2R1Y2VkCisgKiBxdWV1ZWRfZmV0Y2hfc2V0X3BlbmRpbmdfYWNxdWlyZSgpLgorICoKKyAq
IEl0IGFsc28gaGVhdmlseSByZWxpZXMgb24gbWl4ZWQgc2l6ZSBhdG9taWMgb3BlcmF0aW9ucywg
aW4gc3BlY2lmaWMgaXQKKyAqIHJlcXVpcmVzIGFyY2hpdGVjdHVyZXMgdG8gaGF2ZSB4Y2hnMTY7
IHNvbWV0aGluZyB3aGljaCBtYW55IExML1NDCisgKiBhcmNoaXRlY3R1cmVzIG5lZWQgdG8gaW1w
bGVtZW50IGFzIGEgMzJiaXQgYW5kK29yIGluIG9yZGVyIHRvIHNhdGlzZnkgdGhlCisgKiBmb3J3
YXJkIHByb2dyZXNzIGd1YXJhbnRlZXMgbWVudGlvbmVkIGFib3ZlLgorICoKKyAqIEZ1cnRoZXIg
cmVhZGluZyBvbiBtaXhlZCBzaXplIGF0b21pY3MgdGhhdCBtaWdodCBiZSByZWxldmFudDoKKyAq
CisgKiAgIGh0dHA6Ly93d3cuY2wuY2FtLmFjLnVrL35wZXMyMC9wb3BsMTcvbWl4ZWQtc2l6ZS5w
ZGYKKyAqCisgKgogICogKEMpIENvcHlyaWdodCAyMDEzLTIwMTUgSGV3bGV0dC1QYWNrYXJkIERl
dmVsb3BtZW50IENvbXBhbnksIEwuUC4KICAqIChDKSBDb3B5cmlnaHQgMjAxNSBIZXdsZXR0LVBh
Y2thcmQgRW50ZXJwcmlzZSBEZXZlbG9wbWVudCBMUAogICoKLS0gCjIuMzQuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBs
aXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jl
cy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
