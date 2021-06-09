Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 4B0993A1F6A
	for <lists+openrisc@lfdr.de>; Wed,  9 Jun 2021 23:52:37 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id F38EE235BB;
	Wed,  9 Jun 2021 23:52:36 +0200 (CEST)
Received: from smtpcmd13146.aruba.it (smtpcmd13146.aruba.it [62.149.156.146])
 by mail.librecores.org (Postfix) with ESMTP id AB07E200E4
 for <openrisc@lists.librecores.org>; Wed,  9 Jun 2021 23:52:35 +0200 (CEST)
Received: from ubuntu.localdomain ([146.241.205.41])
 by Aruba Outgoing Smtp  with ESMTPSA
 id r67mltrQ6Wlaqr67mlxDHi; Wed, 09 Jun 2021 23:52:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1623275555; bh=BP0FrOP+BvOb4yYf709gN7DfHl6I1v0FA95ima7yv3o=;
 h=From:To:Subject:Date:MIME-Version;
 b=ZwKHUnpeZDtyHC11mDrDILDJuLYYaqY8wQQ+sjUaigWX6X+nqAa6S7kkMCZ1uzcrp
 t0FFprc5W6CnJzrKKFc0pvhpGgvwBFvrsEiedjZX1YavfM21DMDTVAqXF86jrb6S39
 KG8aahFS87tLi4C59iyZbZ7eiBLiLbAkD7juOI7Xr9E2EHYO7dQx153bmIVLnICy1k
 XQK4CLpN0LN/Jq2Ufe0pXQVhaZjX10ttTv2eDTLt42Hzc3ctzpsDxecqHplBNZfoeG
 8WG8Vy7A+TT68XM8WMa89OuA1B0/MLjwKlZjx7W2/6Xj7nNHOxoGQFjbmsLw0hg0R4
 4zASvPOVP5PLw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Stafford Horne <shorne@gmail.com>
Date: Wed,  9 Jun 2021 23:52:33 +0200
Message-Id: <20210609215233.1611478-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <YME2SzQdpj/AVz/2@antec>
References: <YME2SzQdpj/AVz/2@antec>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfHjoq3NYg4GTaS9ULPOk7I4h6oHkYbi/IbmpoW1U7baUZ9DwVZYJtFN1sZFysDwwVN8GGxDdmmWeeUoUei7FAUIUny08emqbofOlsnZ/tkwh3nt5nRN1
 T3Q/dxHedZSmMBm+FQ7U6OgODGyPlIqfi9S7hqvPna+iI7F4Lf2q8LFEnjBGdPBTUMPnGOVI2ZLR3rkFZxj1S2alvCooPC/XspxKAijzgjkXRZjimijitrTS
 8t02pDrr6wc/Tm+IzlrunuxZL9AgAXXGAG+Fh7DWq0iVAH/iyLewLd2l0niGUDX812gfh2Nfvkm+EjxyNzdEu3s3WAB/+pq/4vqFWDCjdsNqkTd81UFfjc8o
 LbJUOQED
Subject: [OpenRISC] [PATCH v2] bfd/elf32-or1k: fix building with gcc version
 < 5
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
c2lkZQpmb3IgbG9vcC4KCmJmZC9DaGFuZ2VMb2c6CgoJKiBlbGYzMi1vcjFrLmMgKG9yMWtfd3Jp
dGVfcGx0X2VudHJ5KTogTW92ZSBpIGRlY2xhcmF0aW9uIHRvIHRvcAoJb2YgZnVuY3Rpb24uCgpT
aWduZWQtb2ZmLWJ5OiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2lu
ZWVyaW5nLmNvbT4KLS0tCiBiZmQvZWxmMzItb3Ixay5jIHwgNSArKystLQogMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9iZmQvZWxm
MzItb3Ixay5jIGIvYmZkL2VsZjMyLW9yMWsuYwppbmRleCA0YWU3ZjMyNGQzMy4uMzIwNjNhYjAy
ODkgMTAwNjQ0Ci0tLSBhL2JmZC9lbGYzMi1vcjFrLmMKKysrIGIvYmZkL2VsZjMyLW9yMWsuYwpA
QCAtMjI0NCw5ICsyMjQ0LDEwIEBAIG9yMWtfd3JpdGVfcGx0X2VudHJ5IChiZmQgKm91dHB1dF9i
ZmQsIGJmZF9ieXRlICpjb250ZW50cywgdW5zaWduZWQgaW5zbmosCiB7CiAgIHVuc2lnbmVkIG5v
ZGVsYXkgPSBlbGZfZWxmaGVhZGVyIChvdXRwdXRfYmZkKS0+ZV9mbGFncyAmIEVGX09SMUtfTk9E
RUxBWTsKICAgdW5zaWduZWQgb3V0cHV0X2luc25zW1BMVF9NQVhfSU5TTl9DT1VOVF07CisgIHNp
emVfdCBpOwogCiAgIC8qIENvcHkgaW5zdHJ1Y3Rpb25zIGludG8gdGhlIG91dHB1dCBidWZmZXIu
ICAqLwotICBmb3IgKHNpemVfdCBpID0gMDsgaSA8IGluc25fY291bnQ7IGkrKykKKyAgZm9yIChp
ID0gMDsgaSA8IGluc25fY291bnQ7IGkrKykKICAgICBvdXRwdXRfaW5zbnNbaV0gPSBpbnNuc1tp
XTsKIAogICAvKiBIb25vciB0aGUgbm8tZGVsYXktc2xvdCBzZXR0aW5nLiAgKi8KQEAgLTIyNzcs
NyArMjI3OCw3IEBAIG9yMWtfd3JpdGVfcGx0X2VudHJ5IChiZmQgKm91dHB1dF9iZmQsIGJmZF9i
eXRlICpjb250ZW50cywgdW5zaWduZWQgaW5zbmosCiAgICAgfQogCiAgIC8qIFdyaXRlIG91dCB0
aGUgb3V0cHV0IGJ1ZmZlci4gICovCi0gIGZvciAoc2l6ZV90IGkgPSAwOyBpIDwgKGluc25fY291
bnQrMSk7IGkrKykKKyAgZm9yIChpID0gMDsgaSA8IChpbnNuX2NvdW50KzEpOyBpKyspCiAgICAg
YmZkX3B1dF8zMiAob3V0cHV0X2JmZCwgb3V0cHV0X2luc25zW2ldLCBjb250ZW50cyArIChpKjQp
KTsKIH0KIAotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jl
cy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
