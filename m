Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 0B2B77BEF2
	for <lists+openrisc@lfdr.de>; Wed, 31 Jul 2019 13:09:09 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3934F20256;
	Wed, 31 Jul 2019 13:09:08 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 35C5C20146
 for <openrisc@lists.librecores.org>; Fri, 26 Jul 2019 14:51:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yJvMkY8vnCpDqvUDPjgvqplmFGkw4TfSA8VSHOTr0s0=; b=ea4SyeInbu6lxOEXSxRJcnXoe2
 fBi1+6bh/3oQZ3RLyviHQO5r3FLr/ey0Fw/fRfIphxTfrdiu1VzEjkLQjfyE4WP+uXbl96/NaGNaG
 derTk6bEBWOCBurO+sjHHKKO8Q+1pqkZr6rUzu79UqgDnIsvIKAph/ld2LhAFCNfPgXeqBnDyCQYS
 PTgb4ntEpvUzW+pILveyqKh8tYK644KpaMMDFvSJzdEJc/XeivRnDDVVXDhF8wfowYxPe9IsHUYPm
 GoAr5jwipne/sTfc30PNZL/bgInXECwUJdj5kfwouUR7EKp8u4jtZhlvT4rAQ7WnuI8oTKvN2K7r2
 mkoGd7Tw==;
Received: from [179.95.31.157] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hqzhE-0006AU-8s; Fri, 26 Jul 2019 12:51:40 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
 (envelope-from <mchehab@bombadil.infradead.org>)
 id 1hqzhC-0005az-9F; Fri, 26 Jul 2019 09:51:38 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: 
Date: Fri, 26 Jul 2019 09:51:24 -0300
Message-Id: <02484db055b58d76ef62cb42fd3e9a4e701b49c8.1564145354.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1564145354.git.mchehab+samsung@kernel.org>
References: <cover.1564145354.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 31 Jul 2019 13:09:05 +0200
Subject: [OpenRISC] [PATCH v2 14/26] docs: openrisc: convert to ReST and add
 to documentation body
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
Cc: Jonas Bonn <jonas@southpole.se>, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, openrisc@lists.librecores.org,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

TWFudWFsbHkgY29udmVydCB0aGUgdHdvIG9wZW5SaXNjIGRvY3VtZW50cyB0byBSZVNULCBhZGRp
bmcgdGhlbQp0byB0aGUgTGludXggZG9jdW1lbnRhdGlvbiBib2R5LgoKU2lnbmVkLW9mZi1ieTog
TWF1cm8gQ2FydmFsaG8gQ2hlaGFiIDxtY2hlaGFiK3NhbXN1bmdAa2VybmVsLm9yZz4KQWNrZWQt
Ynk6IFN0YWZmb3JkIEhvcm5lIDxzaG9ybmVAZ21haWwuY29tPgotLS0KIERvY3VtZW50YXRpb24v
aW5kZXgucnN0ICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKIERvY3VtZW50YXRpb24vb3Bl
bnJpc2MvaW5kZXgucnN0ICAgICAgICAgICAgICB8IDE4ICsrKysrKysrKysrKysKIC4uLi9vcGVu
cmlzYy97UkVBRE1FID0+IG9wZW5yaXNjX3BvcnQucnN0fSAgICB8IDI1ICsrKysrKysrKysrKyst
LS0tLS0KIERvY3VtZW50YXRpb24vb3BlbnJpc2Mve1RPRE8gPT4gdG9kby5yc3R9ICAgICB8ICA5
ICsrKystLS0KIDQgZmlsZXMgY2hhbmdlZCwgNDMgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25z
KC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9vcGVucmlzYy9pbmRleC5yc3QK
IHJlbmFtZSBEb2N1bWVudGF0aW9uL29wZW5yaXNjL3tSRUFETUUgPT4gb3BlbnJpc2NfcG9ydC5y
c3R9ICg4MCUpCiByZW5hbWUgRG9jdW1lbnRhdGlvbi9vcGVucmlzYy97VE9ETyA9PiB0b2RvLnJz
dH0gKDc4JSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2luZGV4LnJzdCBiL0RvY3VtZW50
YXRpb24vaW5kZXgucnN0CmluZGV4IDI1ZTA4MDY2NDA1MC4uNjQwMmY2MmFjOTBmIDEwMDY0NAot
LS0gYS9Eb2N1bWVudGF0aW9uL2luZGV4LnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL2luZGV4LnJz
dApAQCAtMTQ4LDYgKzE0OCw3IEBAIGltcGxlbWVudGF0aW9uLgogICAgaWE2NC9pbmRleAogICAg
bTY4ay9pbmRleAogICAgcG93ZXJwYy9pbmRleAorICAgb3BlbnJpc2MvaW5kZXgKICAgIHBhcmlz
Yy9pbmRleAogICAgcmlzY3YvaW5kZXgKICAgIHMzOTAvaW5kZXgKZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vb3BlbnJpc2MvaW5kZXgucnN0IGIvRG9jdW1lbnRhdGlvbi9vcGVucmlzYy9pbmRl
eC5yc3QKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi43NDhiM2VlYTE3
MDcKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL29wZW5yaXNjL2luZGV4LnJzdApA
QCAtMCwwICsxLDE4IEBACisuLiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAorCis9
PT09PT09PT09PT09PT09PT09PT0KK09wZW5SSVNDIEFyY2hpdGVjdHVyZQorPT09PT09PT09PT09
PT09PT09PT09CisKKy4uIHRvY3RyZWU6OgorICAgOm1heGRlcHRoOiAyCisKKyAgIG9wZW5yaXNj
X3BvcnQKKyAgIHRvZG8KKworLi4gb25seTo6ICBzdWJwcm9qZWN0IGFuZCBodG1sCisKKyAgIElu
ZGljZXMKKyAgID09PT09PT0KKworICAgKiA6cmVmOmBnZW5pbmRleGAKZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vb3BlbnJpc2MvUkVBRE1FIGIvRG9jdW1lbnRhdGlvbi9vcGVucmlzYy9vcGVu
cmlzY19wb3J0LnJzdApzaW1pbGFyaXR5IGluZGV4IDgwJQpyZW5hbWUgZnJvbSBEb2N1bWVudGF0
aW9uL29wZW5yaXNjL1JFQURNRQpyZW5hbWUgdG8gRG9jdW1lbnRhdGlvbi9vcGVucmlzYy9vcGVu
cmlzY19wb3J0LnJzdAppbmRleCA3NzdhODkzZDUzM2QuLmExODc0N2E4ZDE5MSAxMDA2NDQKLS0t
IGEvRG9jdW1lbnRhdGlvbi9vcGVucmlzYy9SRUFETUUKKysrIGIvRG9jdW1lbnRhdGlvbi9vcGVu
cmlzYy9vcGVucmlzY19wb3J0LnJzdApAQCAtMSwzICsxLDQgQEAKKz09PT09PT09PT09PT09CiBP
cGVuUklTQyBMaW51eAogPT09PT09PT09PT09PT0KIApAQCAtNiw4ICs3LDEwIEBAIHRhcmdldCBh
cmNoaXRlY3R1cmUsIHNwZWNpZmljYWxseSwgaXMgdGhlIDMyLWJpdCBPcGVuUklTQyAxMDAwIGZh
bWlseSAob3IxaykuCiAKIEZvciBpbmZvcm1hdGlvbiBhYm91dCBPcGVuUklTQyBwcm9jZXNzb3Jz
IGFuZCBvbmdvaW5nIGRldmVsb3BtZW50OgogCisJPT09PT09PQkJPT09PT09PT09PT09PT09PT09
PT09PT09PT09PT0KIAl3ZWJzaXRlCQlodHRwOi8vb3BlbnJpc2MuaW8KIAllbWFpbAkJb3BlbnJp
c2NAbGlzdHMubGlicmVjb3Jlcy5vcmcKKwk9PT09PT09CQk9PT09PT09PT09PT09PT09PT09PT09
PT09PT09PQogCiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIApAQCAtMjQsMTMgKzI3LDE1IEBAIFRvb2xjaGFpbiBi
aW5hcmllcyBjYW4gYmUgb2J0YWluZWQgZnJvbSBvcGVucmlzYy5pbyBvciBvdXIgZ2l0aHViIHJl
bGVhc2VzIHBhZ2UuCiBJbnN0cnVjdGlvbnMgZm9yIGJ1aWxkaW5nIHRoZSBkaWZmZXJlbnQgdG9v
bGNoYWlucyBjYW4gYmUgZm91bmQgb24gb3BlbnJpc2MuaW8KIG9yIFN0YWZmb3JkJ3MgdG9vbGNo
YWluIGJ1aWxkIGFuZCByZWxlYXNlIHNjcmlwdHMuCiAKKwk9PT09PT09PT09CT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KIAliaW5hcmllcwlodHRwczov
L2dpdGh1Yi5jb20vb3BlbnJpc2Mvb3Ixay1nY2MvcmVsZWFzZXMKIAl0b29sY2hhaW5zCWh0dHBz
Oi8vb3BlbnJpc2MuaW8vc29mdHdhcmUKIAlidWlsZGluZwlodHRwczovL2dpdGh1Yi5jb20vc3Rm
ZnJkaHJuL29yMWstdG9vbGNoYWluLWJ1aWxkCisJPT09PT09PT09PQk9PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CiAKIDIpIEJ1aWxkaW5nCiAKLUJ1aWxk
IHRoZSBMaW51eCBrZXJuZWwgYXMgdXN1YWwKK0J1aWxkIHRoZSBMaW51eCBrZXJuZWwgYXMgdXN1
YWw6OgogCiAJbWFrZSBBUkNIPW9wZW5yaXNjIGRlZmNvbmZpZwogCW1ha2UgQVJDSD1vcGVucmlz
YwpAQCAtNDMsNiArNDgsOCBAQCBkZXZlbG9wbWVudCBib2FyZCB3aXRoIHRoZSBPcGVuUklTQyBT
b0MuICBEdXJpbmcgdGhlIGJ1aWxkIEZQR0EgUlRMIGlzIGNvZGUKIGRvd25sb2FkZWQgZnJvbSB0
aGUgRnVzZVNvQyBJUCBjb3JlcyByZXBvc2l0b3J5IGFuZCBidWlsdCB1c2luZyB0aGUgRlBHQSB2
ZW5kb3IKIHRvb2xzLiAgQmluYXJpZXMgYXJlIGxvYWRlZCBvbnRvIHRoZSBib2FyZCB3aXRoIG9w
ZW5vY2QuCiAKKzo6CisKIAlnaXQgY2xvbmUgaHR0cHM6Ly9naXRodWIuY29tL29sb2ZrL2Z1c2Vz
b2MKIAljZCBmdXNlc29jCiAJc3VkbyBwaXAgaW5zdGFsbCAtZSAuCkBAIC02NSw3ICs3Miw5IEBA
IHBsYXRmb3JtLiAgUGxlYXNlIGZvbGxvdyB0aGUgT3BlblJJU0MgaW5zdHJ1Y3Rpb25zIG9uIHRo
ZSBRRU1VIHdlYnNpdGUgdG8gZ2V0CiBMaW51eCBydW5uaW5nIG9uIFFFTVUuICBZb3UgY2FuIGJ1
aWxkIFFFTVUgeW91cnNlbGYsIGJ1dCB5b3VyIExpbnV4IGRpc3RyaWJ1dGlvbgogbGlrZWx5IHBy
b3ZpZGVzIGJpbmFyeSBwYWNrYWdlcyB0byBzdXBwb3J0IE9wZW5SSVNDLgogCisJPT09PT09PT09
PT09PQk9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT0KIAlxZW11IG9wZW5yaXNjCWh0dHBzOi8vd2lraS5xZW11Lm9yZy9Eb2N1bWVudGF0aW9uL1Bs
YXRmb3Jtcy9PcGVuUklTQworCT09PT09PT09PT09PT0JPT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CiAKIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogCkBAIC03NSwz
NiArODQsMzggQEAgVGVybWlub2xvZ3kKIEluIHRoZSBjb2RlLCB0aGUgZm9sbG93aW5nIHBhcnRp
Y2xlcyBhcmUgdXNlZCBvbiBzeW1ib2xzIHRvIGxpbWl0IHRoZSBzY29wZQogdG8gbW9yZSBvciBs
ZXNzIHNwZWNpZmljIHByb2Nlc3NvciBpbXBsZW1lbnRhdGlvbnM6CiAKKz09PT09PT09PSA9PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KIG9wZW5yaXNjOiB0aGUgT3BlblJJ
U0MgY2xhc3Mgb2YgcHJvY2Vzc29ycwogb3IxazogICAgIHRoZSBPcGVuUklTQyAxMDAwIGZhbWls
eSBvZiBwcm9jZXNzb3JzCiBvcjEyMDA6ICAgdGhlIE9wZW5SSVNDIDEyMDAgcHJvY2Vzc29yCis9
PT09PT09PT0gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CiAKIC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQogCiBIaXN0b3J5CiA9PT09PT09PQogCi0xOC4gMTEuIDIwMDMJTWF0amF6IEJyZXNr
dmFyIChwaG9lbml4QGJzZW1pLmNvbSkKKzE4LTExLTIwMDMJTWF0amF6IEJyZXNrdmFyIChwaG9l
bml4QGJzZW1pLmNvbSkKIAlpbml0aWFsIHBvcnQgb2YgbGludXggdG8gT3BlblJJU0Mvb3IzMiBh
cmNoaXRlY3R1cmUuCiAgICAgICAgIGFsbCB0aGUgY29yZSBzdHVmZiBpcyBpbXBsZW1lbnRlZCBh
bmQgc2VhbXMgdXNhYmxlLgogCi0wOC4gMTIuIDIwMDMJTWF0amF6IEJyZXNrdmFyIChwaG9lbml4
QGJzZW1pLmNvbSkKKzA4LTEyLTIwMDMJTWF0amF6IEJyZXNrdmFyIChwaG9lbml4QGJzZW1pLmNv
bSkKIAljb21wbGV0ZSBjaGFuZ2Ugb2YgVExCIG1pc3MgaGFuZGxpbmcuCiAJcmV3cml0ZSBvZiBl
eGNlcHRpb25zIGhhbmRsaW5nLgogCWZ1bGx5IGZ1bmN0aW9uYWwgc2FzaC0zLjYgaW4gZGVmYXVs
dCBpbml0cmQuCiAJYSBtdWNoIGltcHJvdmVkIHZlcnNpb24gd2l0aCBjaGFuZ2VzIGFsbCBhcm91
bmQuCiAKLTEwLiAwNC4gMjAwNAlNYXRqYXogQnJlc2t2YXIgKHBob2VuaXhAYnNlbWkuY29tKQor
MTAtMDQtMjAwNAlNYXRqYXogQnJlc2t2YXIgKHBob2VuaXhAYnNlbWkuY29tKQogCWFsb3Qgb2Yg
YnVnZml4ZXMgYWxsIG92ZXIuCiAJZXRoZXJuZXQgc3VwcG9ydCwgZnVuY3Rpb25hbCBodHRwIGFu
ZCB0ZWxuZXQgc2VydmVycy4KIAlydW5uaW5nIG1hbnkgc3RhbmRhcmQgbGludXggYXBwcy4KIAot
MjYuIDA2LiAyMDA0CU1hdGpheiBCcmVza3ZhciAocGhvZW5peEBic2VtaS5jb20pCisyNi0wNi0y
MDA0CU1hdGpheiBCcmVza3ZhciAocGhvZW5peEBic2VtaS5jb20pCiAJcG9ydCB0byAyLjYueAog
Ci0zMC4gMTEuIDIwMDQJTWF0amF6IEJyZXNrdmFyIChwaG9lbml4QGJzZW1pLmNvbSkKKzMwLTEx
LTIwMDQJTWF0amF6IEJyZXNrdmFyIChwaG9lbml4QGJzZW1pLmNvbSkKIAlsb3RzIG9mIGJ1Z2Zp
eGVzIGFuZCBlbmhhbmNtZW50cy4KIAlhZGRlZCBvcGVuY29yZXMgZnJhbWVidWZmZXIgZHJpdmVy
LgogCi0wOS4gMTAuIDIwMTAgICAgSm9uYXMgQm9ubiAoam9uYXNAc291dGhwb2xlLnNlKQorMDkt
MTAtMjAxMCAgICBKb25hcyBCb25uIChqb25hc0Bzb3V0aHBvbGUuc2UpCiAJbWFqb3IgcmV3cml0
ZSB0byBicmluZyB1cCB0byBwYXIgd2l0aCB1cHN0cmVhbSBMaW51eCAyLjYuMzYKZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vb3BlbnJpc2MvVE9ETyBiL0RvY3VtZW50YXRpb24vb3BlbnJpc2Mv
dG9kby5yc3QKc2ltaWxhcml0eSBpbmRleCA3OCUKcmVuYW1lIGZyb20gRG9jdW1lbnRhdGlvbi9v
cGVucmlzYy9UT0RPCnJlbmFtZSB0byBEb2N1bWVudGF0aW9uL29wZW5yaXNjL3RvZG8ucnN0Cmlu
ZGV4IGM0M2Q0ZTFkMTRlYi4uNDIwYjE4Yjg3ZWRhIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9u
L29wZW5yaXNjL1RPRE8KKysrIGIvRG9jdW1lbnRhdGlvbi9vcGVucmlzYy90b2RvLnJzdApAQCAt
MSwxMiArMSwxNSBAQAorPT09PQorVE9ETworPT09PQorCiBUaGUgT3BlblJJU0MgTGludXggcG9y
dCBpcyBmdWxseSBmdW5jdGlvbmFsIGFuZCBoYXMgYmVlbiB0cmFja2luZyB1cHN0cmVhbQogc2lu
Y2UgMi42LjM1LiAgVGhlcmUgYXJlLCBob3dldmVyLCByZW1haW5pbmcgaXRlbXMgdG8gYmUgY29t
cGxldGVkIHdpdGhpbgogdGhlIGNvbWluZyBtb250aHMuICBIZXJlJ3MgYSBsaXN0IG9mIGtub3du
LXRvLWJlLWxlc3MtdGhhbi1zdGVsbGFyIGl0ZW1zCiB0aGF0IGFyZSBkdWUgZm9yIGludmVzdGln
YXRpb24gc2hvcnRseSwgaS5lLiBvdXIgVE9ETyBsaXN0OgogCi0tLSBJbXBsZW1lbnQgdGhlIHJl
c3Qgb2YgdGhlIERNQSBBUEkuLi4gZG1hX21hcF9zZywgZXRjLgorLSAgSW1wbGVtZW50IHRoZSBy
ZXN0IG9mIHRoZSBETUEgQVBJLi4uIGRtYV9tYXBfc2csIGV0Yy4KIAotLS0gRmluaXNoIHRoZSBy
ZW5hbWluZyBjbGVhbnVwLi4uIHRoZXJlIGFyZSByZWZlcmVuY2VzIHRvIG9yMzIgaW4gdGhlIGNv
ZGUKKy0gIEZpbmlzaCB0aGUgcmVuYW1pbmcgY2xlYW51cC4uLiB0aGVyZSBhcmUgcmVmZXJlbmNl
cyB0byBvcjMyIGluIHRoZSBjb2RlCiAgICB3aGljaCB3YXMgYW4gb2xkZXIgbmFtZSBmb3IgdGhl
IGFyY2hpdGVjdHVyZS4gIFRoZSBuYW1lIHdlJ3ZlIHNldHRsZWQgb24gaXMKICAgIG9yMWsgYW5k
IHRoaXMgY2hhbmdlIGlzIHNsb3dseSB0cmlja2xpbmcgdGhyb3VnaCB0aGUgc3RhY2suICBGb3Ig
dGhlIHRpbWUKICAgIGJlaW5nLCBvcjMyIGlzIGVxdWl2YWxlbnQgdG8gb3Ixay4KLQotLSAKMi4y
MS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVu
UklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9s
aXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
