Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 06BC422B81B
	for <lists+openrisc@lfdr.de>; Thu, 23 Jul 2020 22:49:49 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D327C2079B;
	Thu, 23 Jul 2020 22:49:47 +0200 (CEST)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by mail.librecores.org (Postfix) with ESMTPS id CB8472049C
 for <openrisc@lists.librecores.org>; Sat,  4 Jul 2020 23:11:48 +0200 (CEST)
Received: by mail-pl1-f194.google.com with SMTP id w19so3159067ply.9
 for <openrisc@lists.librecores.org>; Sat, 04 Jul 2020 14:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J6EJlawjImDE63imtxxJcgcytWPaMqFso/hm17V2M4g=;
 b=otua9GyRB3AOXdss6qXm7gsiZ44Nja4IiddEnzSevFVuPTBUx7L8uQlwWyWBpnzk6L
 i5UNY+Mko6Cb8M3jivPN4n9GOK28L3NkBHQtimB1C+MkqZ1rI+KUjSjLToDG9HkVLHjc
 nzX8n0SegZufIB5fEfYkOPQkJ2Y6YcbYgwHNKTk/kyBQx64d3b1+4E/yXeHy56mgrtUF
 pjKMbgAYXVFfevwciWSsb1CIJZBk+y9W37avzqOVnpkao2et3K7JbsvtURmf/6Fq+wfB
 DscczvyMGhhLixNFzWO33bwbGxYDSt2B2A0ysQAEJv8qi68qHpBRimFkC+PnSz4CfUnT
 hMjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J6EJlawjImDE63imtxxJcgcytWPaMqFso/hm17V2M4g=;
 b=kLk+vR2zNiSL6GGAhVcpgcjDj46bRRezSQBergZER+pBkAtyUc8hsoUoz/XFE+7UyO
 SCUJHahLnF2BljcSAyfKH5Z5P/sbVYaKOrhjoNfVjQpwf/Ct1CQAR4sg4u+ndGsVK4ps
 W7HCb1HEj1HMVwiAdAUCMXDw5WpNMH0ch/AfWMYVr8mpRBpldRtQej+RqEfo/YnozZEz
 FzC/7lI0v8DfDLSfelk2F0wld8nUEkbgIk6Kr3JYGK9ORCTIqxLHJccXPHmVma0BROEv
 bBAVgi0lJkTvOjVOEJAMZDnr7BoOGZSnmwvwatNHi2KgNtcDciJskg28zkae8HGjIjTM
 haoQ==
X-Gm-Message-State: AOAM531GUhoCxtbrTP057vhnRUsza/KMlbEluYTTcYRkxZTZJevY1xa9
 XawmGT5JhsPPNkCLM21YlL4=
X-Google-Smtp-Source: ABdhPJypCNMagu9ONuK7HxU5+66uo/7c98pozb1tC1erONTN6pfRGt9sGcQlGwcV0bI5KXXFYCqkgQ==
X-Received: by 2002:a17:902:7b89:: with SMTP id
 w9mr24274087pll.175.1593897106786; 
 Sat, 04 Jul 2020 14:11:46 -0700 (PDT)
Received: from localhost (g2.222-224-226.ppp.wakwak.ne.jp. [222.224.226.2])
 by smtp.gmail.com with ESMTPSA id t1sm14905119pje.55.2020.07.04.14.11.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 14:11:46 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Sun,  5 Jul 2020 06:11:34 +0900
Message-Id: <20200704211136.601768-1-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 23 Jul 2020 22:49:44 +0200
Subject: [OpenRISC] [PATCH] openrisc: Add support for external initrd images
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
Cc: Jonas Bonn <jonas@southpole.se>, Borislav Petkov <bp@suse.de>,
 Kees Cook <keescook@chromium.org>, Mateusz Holenko <mholenko@antmicro.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Arvind Sankar <nivedita@alum.mit.edu>, openrisc@lists.librecores.org,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SW4gT3BlblJJU0Mgd2Ugc2V0IHRoZSBpbml0cmRfc3RhcnQgYW5kIGluaXRyZF9lbmQgYmFzZWQg
b24gdGhlIHN5bWJvbHMKd2Ugc2V0dXAgaW4gdm1saW51eC5sZHMuUy4gIEhvd2V2ZXIsIHRoaXMg
aXMgbm90IG5lZWRlZCBpZiB3ZSB1c2UgdGhlCmdlbmVyaWMgbGlua2VyIGRlc2NyaXB0aW9uIGlu
IElOSVRfREFUQV9TRUNUSU9OLgoKUmVtb3Zpbmcgb3VyIG93biBpbml0cmQgc2V0dXAgcmVkdWNl
cyBjb2RlLCBidXQgYWxzbyB0aGUgZ2VuZXJpYyBjb2RlCnN1cHBvcnRzIGxvYWRpbmcgZXh0ZXJu
YWwgaW5pdHJkIGltYWdlcy4gIEEgYm9vdGxvYWRlciBjYW4gbG9hZCBhIHJvb3RmcwppbWFnZSBp
bnRvIG1lbW9yeSBhbmQgd2UgY2FuIGNvbmZpZ3VyZSBkZXZpY2V0cmVlIHRvIGxvYWQgaXQgd2l0
aDoKCiAgICAgICAgY2hvc2VuIHsKICAgICAgICAgICAgICAgIGJvb3RhcmdzID0gImVhcmx5Y29u
IjsKICAgICAgICAgICAgICAgIHN0ZG91dC1wYXRoID0gInVhcnQwOjExNTIwMCI7CiAgICAgICAg
ICAgICAgICBsaW51eCxpbml0cmQtc3RhcnQgPSA8IDB4MDgwMDAxMDAgPjsKICAgICAgICAgICAg
ICAgIGxpbnV4LGluaXRyZC1lbmQgPSA8IDB4MDgyMDAwMDAgPjsKICAgICAgICB9OwoKUmVwb3J0
ZWQtYnk6IE1hdGV1c3ogSG9sZW5rbyA8bWhvbGVua29AYW50bWljcm8uY29tPgpTaWduZWQtb2Zm
LWJ5OiBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4KLS0tCiBhcmNoL29wZW5yaXNj
L2tlcm5lbC9zZXR1cC5jICAgICAgIHwgIDggKysrKystLS0KIGFyY2gvb3BlbnJpc2Mva2VybmVs
L3ZtbGludXgubGRzLlMgfCAxMiAtLS0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL29wZW5yaXNjL2tl
cm5lbC9zZXR1cC5jIGIvYXJjaC9vcGVucmlzYy9rZXJuZWwvc2V0dXAuYwppbmRleCA4YWE0Mzhl
MWY1MWYuLmIxOGU3NzVmOGJlMyAxMDA2NDQKLS0tIGEvYXJjaC9vcGVucmlzYy9rZXJuZWwvc2V0
dXAuYworKysgYi9hcmNoL29wZW5yaXNjL2tlcm5lbC9zZXR1cC5jCkBAIC0yOTIsMTMgKzI5Miwx
NSBAQCB2b2lkIF9faW5pdCBzZXR1cF9hcmNoKGNoYXIgKipjbWRsaW5lX3ApCiAJaW5pdF9tbS5i
cmsgPSAodW5zaWduZWQgbG9uZylfZW5kOwogCiAjaWZkZWYgQ09ORklHX0JMS19ERVZfSU5JVFJE
Ci0JaW5pdHJkX3N0YXJ0ID0gKHVuc2lnbmVkIGxvbmcpJl9faW5pdHJkX3N0YXJ0OwotCWluaXRy
ZF9lbmQgPSAodW5zaWduZWQgbG9uZykmX19pbml0cmRfZW5kOwogCWlmIChpbml0cmRfc3RhcnQg
PT0gaW5pdHJkX2VuZCkgeworCQlwcmludGsoS0VSTl9JTkZPICJJbml0aWFsIHJhbWRpc2sgbm90
IGZvdW5kXG4iKTsKIAkJaW5pdHJkX3N0YXJ0ID0gMDsKIAkJaW5pdHJkX2VuZCA9IDA7CisJfSBl
bHNlIHsKKwkJcHJpbnRrKEtFUk5fSU5GTyAiSW5pdGlhbCByYW1kaXNrIGF0OiAweCVwICglbHUg
Ynl0ZXMpXG4iLAorCQkgICAgICAgKHZvaWQgKikoaW5pdHJkX3N0YXJ0KSwgaW5pdHJkX2VuZCAt
IGluaXRyZF9zdGFydCk7CisJCWluaXRyZF9iZWxvd19zdGFydF9vayA9IDE7CiAJfQotCWluaXRy
ZF9iZWxvd19zdGFydF9vayA9IDE7CiAjZW5kaWYKIAogCS8qIHNldHVwIG1lbWJsb2NrIGFsbG9j
YXRvciAqLwpkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9rZXJuZWwvdm1saW51eC5sZHMuUyBi
L2FyY2gvb3BlbnJpc2Mva2VybmVsL3ZtbGludXgubGRzLlMKaW5kZXggNjA0NDlmZDdmMTZmLi4y
MmZiYzVmYjI0YjMgMTAwNjQ0Ci0tLSBhL2FyY2gvb3BlbnJpc2Mva2VybmVsL3ZtbGludXgubGRz
LlMKKysrIGIvYXJjaC9vcGVucmlzYy9rZXJuZWwvdm1saW51eC5sZHMuUwpAQCAtOTYsMTggKzk2
LDYgQEAgU0VDVElPTlMKIAogICAgICAgICBfX2luaXRfZW5kID0gLjsKIAotCS4gPSBBTElHTihQ
QUdFX1NJWkUpOwotCS5pbml0cmQJCQk6IEFUKEFERFIoLmluaXRyZCkgLSBMT0FEX09GRlNFVCkK
LQl7Ci0JCV9faW5pdHJkX3N0YXJ0ID0gLjsKLQkJKiguaW5pdHJkKQotCQlfX2luaXRyZF9lbmQg
PSAuOwotCQlGSUxMICgwKTsKLSAgICAgICAgICAgICAgICAuID0gQUxJR04gKFBBR0VfU0laRSk7
Ci0JfQotCi0gICAgICAgIF9fdm1saW51eF9lbmQgPSAuOyAgICAgICAgICAgIC8qIGxhc3QgYWRk
cmVzcyBvZiB0aGUgcGh5c2ljYWwgZmlsZSAqLwotCiAJQlNTX1NFQ1RJT04oMCwgMCwgMHgyMCkK
IAogICAgICAgICBfZW5kID0gLjsKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxp
c3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8v
b3BlbnJpc2MK
