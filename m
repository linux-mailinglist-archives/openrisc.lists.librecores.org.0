Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 012161B20CB
	for <lists+openrisc@lfdr.de>; Tue, 21 Apr 2020 10:02:07 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A812D20B09;
	Tue, 21 Apr 2020 10:02:06 +0200 (CEST)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by mail.librecores.org (Postfix) with ESMTPS id 3DDB42099F
 for <openrisc@lists.librecores.org>; Sat, 18 Apr 2020 22:20:23 +0200 (CEST)
Received: by mail-wm1-f66.google.com with SMTP id x25so6515110wmc.0
 for <openrisc@lists.librecores.org>; Sat, 18 Apr 2020 13:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WC9mNKw2+5FlWy70C2k6LiZDHHegVmgpkuPg2LNTGBE=;
 b=UO2w4Cj3iPpGEhYraPmiWwMT5uPdUROXDJll3KIy+0nF+WxGWWg0rYDy8pfhM1h5N2
 emtYe29zAqphH15dijSwzJKANF4v8bW+VYmlvnETClN6aPBqcADSkjqrBmpDj65LHqFG
 5yAjLKErTCBfC81JtV22IrdOJTCZw/J3unKEG7bs9T8ue4Awd7JEqnf7w5oxjW+XEBU6
 DRYInxBWbi+Uw7/ckjJ/JaCrUyinm2j33Lkpbgiu0ByjY+8VE7FrT4WENtp9wFFZyJRM
 1H0Knd/lRrOYydUd0x2sK9KoMAhiKgLwHQZQpsSjtxLtstfCEwbwpyJa3CJ+VRl72PJi
 w0dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WC9mNKw2+5FlWy70C2k6LiZDHHegVmgpkuPg2LNTGBE=;
 b=WDP2LQaAvZLt0YfyPWGG/wvoaVijIn9Xkwvjkgsdn5f3Zh4WNwsXa13lav4piRg2gt
 GaSg8U2TUmcWLaKiFEfq+3OGT/rzazcwHEGRxytVnMonS3cNKhKLA6RHdl4er8NfhU7c
 okJbb3BoCLSHtX2zShTNgzui/oZrIgdMSFGyryatC/fv5eQoOi+tEh5+4CMkCnbLVpJN
 sPa1o80IIgRujvffIlSrDhUtzAzBdo9cR1l6B8Zl+cm8Gsp+BOlb0ZJCDheW3bACtnJX
 oIsGUSoThqCMVifbwobwCAN09nQO1HO/mOGPyTmp66IHBH89FPYDFuWAR8uHDINDZuj+
 kNNw==
X-Gm-Message-State: AGi0PuYEFCqyn+Tb3Qlgm536eac9NlDBbALGvIFftLQbCxISmyPzC35b
 hzvJYrSPRZW5x8AhhvcoOysc9A==
X-Google-Smtp-Source: APiQypIenAk6V4c55rzjRLn1IYanu1AaBCr6wTQxlJXfLLt9PdK1uvt+9MvtWSymUg8sTEqOZ2iSCA==
X-Received: by 2002:a05:600c:2046:: with SMTP id
 p6mr9573267wmg.177.1587241222874; 
 Sat, 18 Apr 2020 13:20:22 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
 by smtp.gmail.com with ESMTPSA id
 m1sm31735255wro.64.2020.04.18.13.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2020 13:20:22 -0700 (PDT)
From: Dmitry Safonov <dima@arista.com>
To: linux-kernel@vger.kernel.org
Date: Sat, 18 Apr 2020 21:19:18 +0100
Message-Id: <20200418201944.482088-25-dima@arista.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200418201944.482088-1-dima@arista.com>
References: <20200418201944.482088-1-dima@arista.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 21 Apr 2020 10:01:35 +0200
Subject: [OpenRISC] [PATCHv3 24/50] openrisc: Add show_stack_loglvl()
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
Cc: Jonas Bonn <jonas@southpole.se>, Petr Mladek <pmladek@suse.com>,
 Dmitry Safonov <dima@arista.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Safonov <0x7f454c46@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 openrisc@lists.librecores.org, Jiri Slaby <jslaby@suse.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Q3VycmVudGx5LCB0aGUgbG9nLWxldmVsIG9mIHNob3dfc3RhY2soKSBkZXBlbmRzIG9uIGEgcGxh
dGZvcm0KcmVhbGl6YXRpb24uIEl0IGNyZWF0ZXMgc2l0dWF0aW9ucyB3aGVyZSB0aGUgaGVhZGVy
cyBhcmUgcHJpbnRlZCB3aXRoCmxvd2VyIGxvZyBsZXZlbCBvciBoaWdoZXIgdGhhbiB0aGUgc3Rh
Y2t0cmFjZSAoZGVwZW5kaW5nIG9uCmEgcGxhdGZvcm0gb3IgdXNlcikuCgpGdXJ0aGVybW9yZSwg
aXQgZm9yY2VzIHRoZSBsb2dpYyBkZWNpc2lvbiBmcm9tIHVzZXIgdG8gYW4gYXJjaGl0ZWN0dXJl
CnNpZGUuIEluIHJlc3VsdCwgc29tZSB1c2VycyBhcyBzeXNycS9rZGIvZXRjIGFyZSBkb2luZyB0
cmlja3Mgd2l0aAp0ZW1wb3JhcnkgcmlzaW5nIGNvbnNvbGVfbG9nbGV2ZWwgd2hpbGUgcHJpbnRp
bmcgdGhlaXIgbWVzc2FnZXMuCkFuZCBpbiByZXN1bHQgaXQgbm90IG9ubHkgbWF5IHByaW50IHVu
d2FudGVkIG1lc3NhZ2VzIGZyb20gb3RoZXIgQ1BVcywKYnV0IGFsc28gb21pdCBwcmludGluZyBh
dCBhbGwgaW4gdGhlIHVubHVja3kgY2FzZSB3aGVyZSB0aGUgcHJpbnRrKCkKd2FzIGRlZmVycmVk
LgoKSW50cm9kdWNpbmcgbG9nLWxldmVsIHBhcmFtZXRlciBhbmQgS0VSTl9VTlNVUFBSRVNTRUQg
WzFdIHNlZW1zCmFuIGVhc2llciBhcHByb2FjaCB0aGFuIGludHJvZHVjaW5nIG1vcmUgcHJpbnRr
IGJ1ZmZlcnMuCkFsc28sIGl0IHdpbGwgY29uc29saWRhdGUgcHJpbnRpbmdzIHdpdGggaGVhZGVy
cy4KCkludHJvZHVjZSBzaG93X3N0YWNrX2xvZ2x2bCgpLCB0aGF0IGV2ZW50dWFsbHkgd2lsbCBz
dWJzdGl0dXRlCnNob3dfc3RhY2soKS4KCkNjOiBKb25hcyBCb25uIDxqb25hc0Bzb3V0aHBvbGUu
c2U+CkNjOiBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4KQ2M6IFN0ZWZhbiBLcmlz
dGlhbnNzb24gPHN0ZWZhbi5rcmlzdGlhbnNzb25Ac2F1bmFsYWh0aS5maT4KQ2M6IG9wZW5yaXNj
QGxpc3RzLmxpYnJlY29yZXMub3JnClsxXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8y
MDE5MDUyODAwMjQxMi4xNjI1LTEtZGltYUBhcmlzdGEuY29tL1QvI3UKU2lnbmVkLW9mZi1ieTog
RG1pdHJ5IFNhZm9ub3YgPGRpbWFAYXJpc3RhLmNvbT4KLS0tCiBhcmNoL29wZW5yaXNjL2tlcm5l
bC90cmFwcy5jIHwgMTYgKysrKysrKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9rZXJu
ZWwvdHJhcHMuYyBiL2FyY2gvb3BlbnJpc2Mva2VybmVsL3RyYXBzLmMKaW5kZXggYzExYWEyZTE3
Y2UwLi4zYjc5NzhhMjJkNjggMTAwNjQ0Ci0tLSBhL2FyY2gvb3BlbnJpc2Mva2VybmVsL3RyYXBz
LmMKKysrIGIvYXJjaC9vcGVucmlzYy9rZXJuZWwvdHJhcHMuYwpAQCAtNDEsMTggKzQxLDI2IEBA
IHVuc2lnbmVkIGxvbmcgX191c2VyICpsd2FfYWRkcjsKIAogdm9pZCBwcmludF90cmFjZSh2b2lk
ICpkYXRhLCB1bnNpZ25lZCBsb25nIGFkZHIsIGludCByZWxpYWJsZSkKIHsKLQlwcl9lbWVyZygi
WzwlcD5dICVzJXBTXG4iLCAodm9pZCAqKSBhZGRyLCByZWxpYWJsZSA/ICIiIDogIj8gIiwKKwlj
b25zdCBjaGFyICpsb2dsdmwgPSBkYXRhOworCisJcHJpbnRrKCIlc1s8JXA+XSAlcyVwU1xuIiwg
bG9nbHZsLCAodm9pZCAqKSBhZGRyLCByZWxpYWJsZSA/ICIiIDogIj8gIiwKIAkgICAgICAgKHZv
aWQgKikgYWRkcik7CiB9CiAKIC8qIGRpc3BsYXlzIGEgc2hvcnQgc3RhY2sgdHJhY2UgKi8KLXZv
aWQgc2hvd19zdGFjayhzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2ssIHVuc2lnbmVkIGxvbmcgKmVz
cCkKK3ZvaWQgc2hvd19zdGFja19sb2dsdmwoc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrLCB1bnNp
Z25lZCBsb25nICplc3AsCisJCWNvbnN0IGNoYXIgKmxvZ2x2bCkKIHsKIAlpZiAoZXNwID09IE5V
TEwpCiAJCWVzcCA9ICh1bnNpZ25lZCBsb25nICopJmVzcDsKIAotCXByX2VtZXJnKCJDYWxsIHRy
YWNlOlxuIik7Ci0JdW53aW5kX3N0YWNrKE5VTEwsIGVzcCwgcHJpbnRfdHJhY2UpOworCXByaW50
aygiJXNDYWxsIHRyYWNlOlxuIiwgbG9nbHZsKTsKKwl1bndpbmRfc3RhY2soKHZvaWQgKilsb2ds
dmwsIGVzcCwgcHJpbnRfdHJhY2UpOworfQorCit2b2lkIHNob3dfc3RhY2soc3RydWN0IHRhc2tf
c3RydWN0ICp0YXNrLCB1bnNpZ25lZCBsb25nICplc3ApCit7CisJc2hvd19zdGFja19sb2dsdmwo
dGFzaywgZXNwLCBLRVJOX0VNRVJHKTsKIH0KIAogdm9pZCBzaG93X3JlZ2lzdGVycyhzdHJ1Y3Qg
cHRfcmVncyAqcmVncykKLS0gCjIuMjYuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxp
YnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJp
c2MK
