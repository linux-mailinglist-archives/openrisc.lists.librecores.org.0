Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 20A753A199C
	for <lists+openrisc@lfdr.de>; Wed,  9 Jun 2021 17:31:05 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id AB1BA2133E;
	Wed,  9 Jun 2021 17:31:04 +0200 (CEST)
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by mail.librecores.org (Postfix) with ESMTP id 8B81E21246
 for <openrisc@lists.librecores.org>; Wed,  9 Jun 2021 17:31:02 +0200 (CEST)
Received: from ubuntu.localdomain ([146.241.205.41])
 by Aruba Outgoing Smtp  with ESMTPSA
 id r0AWllgnnbifkr0AXlLjQc; Wed, 09 Jun 2021 17:31:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1623252662; bh=+sGjt5MWhoD3TzZJ1/3D53L48R7i6+QyOn+rka47riY=;
 h=From:To:Subject:Date:MIME-Version;
 b=P92Qo+luo1vQW+3zrdLLycJbJW2+aast6SPd8t7kyoAzanap2SKPLxodLzcLgtvex
 +9GQm4IJQ8ScmcWbmTcTbRNkbvrqBL4/L7MmDmttXTY4XdaoA7C0ugcIkGYMIqshQk
 hJLRHKWF7GT8pfvLDJ8bbJXwI6/6elSbrll3ZpikDsMubg4jeDZ1giwYaphOLLDeca
 zsQGjLpE+msiY2QWmKfAQmSnccajCHOOE6koG6uSfj3hgWyfOmAmdomdmOJj1khcG6
 XgWvR4+UmPSXbOjFQeBWOZ5c9aBqjCCP0cj3v0yEjF62FakObS0GVD5tshIN5T8SaA
 1hOFaLMz1K+sw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Stafford Horne <shorne@gmail.com>
Date: Wed,  9 Jun 2021 17:30:59 +0200
Message-Id: <20210609153059.191496-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfGo4Ma34tRRufTM5ScAPaYzTXDa7O86ATY+LL1hyZ7U/DBKp1OWNzRzKUicQvxQKqU8kzPhbfVgIaSm1LTV87v2Ditv2heb9LACpd9gPEVnfjWeR6MCQ
 OwlI8qlR5fOuN/j2UX65yylahpyJyI0HqF0Q3r677rsC+uW0Jwis1rKq1cMIA0ssH+UdkoKqgTu+yX0jOPhze/tkhnum2/zHRv8G1BQo3tC0W2Jd1li/lJzN
 fJEgkAeXYD2rStTR23LjFiFtXumLxaSQTChk8+mECx581UuY02+toc7PUKmDiHsgJutdclp1jbVuBGzgClRyJ41FbCtr228c726sFyarZpxVucTW3Wz078jU
 lcUJ9vgh
Subject: [OpenRISC] [PATCH] bfd/elf32-or1k: fix building with gcc version < 5
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Openrisc <openrisc@lists.librecores.org>,
 GNU Binutils <binutils@sourceware.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

R2NjIHZlcnNpb24gPj0gNSBoYXMgc3RhbmRhcmQgQyBtb2RlIG5vdCBzZXQgdG8gLXN0ZD1nbnUx
MSwgc28gaWYgd2UgdXNlCmFuIG9sZCBjb21waWxlcihpLmUuIGdjYyA0LjkpIGJ1aWxkIGZhaWxz
IG9uOgpgYGAKZWxmMzItb3Ixay5jOjIyNTE6MzogZXJyb3I6ICdmb3InIGxvb3AgaW5pdGlhbCBk
ZWNsYXJhdGlvbnMgYXJlIG9ubHkgYWxsb3dlZCBpbgpDOTkgb3IgQzExIG1vZGUKICAgIGZvciAo
c2l6ZV90IGkgPSAwOyBpIDwgaW5zbl9jb3VudDsgaSsrKQogICAgXgpgYGAKClNvIGxldCdzIGRl
Y2xhcmUgYHNpemVfdCBpYCBhdCB0aGUgdG9wIG9mIHRoZSBmdW5jdGlvbiBpbnN0ZWFkIG9mIGlu
c2lkZQpmb3IgbG9vcC4KClNpZ25lZC1vZmYtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVu
ZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgotLS0KIGJmZC9lbGYzMi1vcjFrLmMgfCA1ICsr
Ky0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2JmZC9lbGYzMi1vcjFrLmMgYi9iZmQvZWxmMzItb3Ixay5jCmluZGV4IDRhZTdm
MzI0ZDMzLi4zMjA2M2FiMDI4OSAxMDA2NDQKLS0tIGEvYmZkL2VsZjMyLW9yMWsuYworKysgYi9i
ZmQvZWxmMzItb3Ixay5jCkBAIC0yMjQ0LDkgKzIyNDQsMTAgQEAgb3Ixa193cml0ZV9wbHRfZW50
cnkgKGJmZCAqb3V0cHV0X2JmZCwgYmZkX2J5dGUgKmNvbnRlbnRzLCB1bnNpZ25lZCBpbnNuaiwK
IHsKICAgdW5zaWduZWQgbm9kZWxheSA9IGVsZl9lbGZoZWFkZXIgKG91dHB1dF9iZmQpLT5lX2Zs
YWdzICYgRUZfT1IxS19OT0RFTEFZOwogICB1bnNpZ25lZCBvdXRwdXRfaW5zbnNbUExUX01BWF9J
TlNOX0NPVU5UXTsKKyAgc2l6ZV90IGk7CiAKICAgLyogQ29weSBpbnN0cnVjdGlvbnMgaW50byB0
aGUgb3V0cHV0IGJ1ZmZlci4gICovCi0gIGZvciAoc2l6ZV90IGkgPSAwOyBpIDwgaW5zbl9jb3Vu
dDsgaSsrKQorICBmb3IgKGkgPSAwOyBpIDwgaW5zbl9jb3VudDsgaSsrKQogICAgIG91dHB1dF9p
bnNuc1tpXSA9IGluc25zW2ldOwogCiAgIC8qIEhvbm9yIHRoZSBuby1kZWxheS1zbG90IHNldHRp
bmcuICAqLwpAQCAtMjI3Nyw3ICsyMjc4LDcgQEAgb3Ixa193cml0ZV9wbHRfZW50cnkgKGJmZCAq
b3V0cHV0X2JmZCwgYmZkX2J5dGUgKmNvbnRlbnRzLCB1bnNpZ25lZCBpbnNuaiwKICAgICB9CiAK
ICAgLyogV3JpdGUgb3V0IHRoZSBvdXRwdXQgYnVmZmVyLiAgKi8KLSAgZm9yIChzaXplX3QgaSA9
IDA7IGkgPCAoaW5zbl9jb3VudCsxKTsgaSsrKQorICBmb3IgKGkgPSAwOyBpIDwgKGluc25fY291
bnQrMSk7IGkrKykKICAgICBiZmRfcHV0XzMyIChvdXRwdXRfYmZkLCBvdXRwdXRfaW5zbnNbaV0s
IGNvbnRlbnRzICsgKGkqNCkpOwogfQogCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklT
Q0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3Rp
bmZvL29wZW5yaXNjCg==
