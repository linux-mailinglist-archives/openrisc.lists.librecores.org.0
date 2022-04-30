Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 3CF09515EBF
	for <lists+openrisc@lfdr.de>; Sat, 30 Apr 2022 17:37:59 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1B2E6248F4;
	Sat, 30 Apr 2022 17:37:59 +0200 (CEST)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mail.librecores.org (Postfix) with ESMTPS id DC84424811
 for <openrisc@lists.librecores.org>; Sat, 30 Apr 2022 17:37:56 +0200 (CEST)
Received: by mail-pj1-f45.google.com with SMTP id
 gj17-20020a17090b109100b001d8b390f77bso12922590pjb.1
 for <openrisc@lists.librecores.org>; Sat, 30 Apr 2022 08:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=z18FUB9s7KBEskqVTf7aP0q/WSmapl+AGV7tm/Rzx+w=;
 b=FFgRoVbZwMv/agjgfBQeiD4RduxnvL5RXSepip5M3kO2MagsWbSqQqxN8cL5qUbeSF
 BYxou0ljjXmk//t8pH9P0AP/HLxtAE0BLwIcoy+Ou0Lpi2MlCzGQ6f682gOG6CuxBpM2
 nwCLJBaCh5RV2r+qT1H5KRlCTIZUXo7CJ4l12KZINBErQtyavfgirI9l4JGBZus3gpLe
 R/LbIsa9B1VFw3791kqpL2EF7PWqMzHmRevq+xETQxk+DF6ipj782xSdFBUvyauIwqQ5
 aCr8I9PL5iINM/w5oq+qM/NT//BBL45/kvYgK8Ddw1j+NpxzLAepCkGEW3FID5OiPVqO
 qAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=z18FUB9s7KBEskqVTf7aP0q/WSmapl+AGV7tm/Rzx+w=;
 b=5CBpmA8rqyIb2hpExcTPN2uUChFCyESUJ1JhJunzHwSjbXagz6o7AFelF3C+5fSeFH
 YIapRWSxApuN5fIeTyzhlF87s5gcdJiKC4h3K65Whd/PRfTzvEOztnJTNPkei5XWl1iv
 CxcZ8RMeL2nCcraAXhxrSKPdLcZG2VLd/gWTjs+1BeduKumQVXHX8d3l+2zcIA1uoHM6
 Y+ZHLfdmXzLEgdWSL3CnNhkl5g+WKd8FriZGj3t1hb21+6G2Yoo3cFyvhoUfTNnPVh/A
 uiOIcwn1GRbHlfVYglnqDF/dAWDSRNtThvJ1JkP89ArYYBlpobvRKpZPFo6bCRJVYWxy
 n51w==
X-Gm-Message-State: AOAM531P7D2p9TnB3SCkRotsI6MaSIDk5EI7onzjurjXmUDhB6BD3U5T
 gbAJNZChUANpaOYNBj/5jdhscA==
X-Google-Smtp-Source: ABdhPJzOcQtcQr8kDnX5vfoKXrEejVF7HXmixwlBQw/BjGtWP2W5ppTBL/zygWmxy79MN6V3JkKj7Q==
X-Received: by 2002:a17:90b:688:b0:1d9:9ddd:1f71 with SMTP id
 m8-20020a17090b068800b001d99ddd1f71mr9480283pjz.207.1651333075503; 
 Sat, 30 Apr 2022 08:37:55 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 y14-20020a62b50e000000b0050dc7628165sm1669724pfe.63.2022.04.30.08.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 08:37:55 -0700 (PDT)
Date: Sat, 30 Apr 2022 08:36:21 -0700
Message-Id: <20220430153626.30660-3-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430153626.30660-1-palmer@rivosinc.com>
References: <20220430153626.30660-1-palmer@rivosinc.com>
MIME-Version: 1.0
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: [OpenRISC] [PATCH v4 2/7] asm-generic: qspinlock: Indicate the use
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
