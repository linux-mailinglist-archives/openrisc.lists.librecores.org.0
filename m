Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 018883775F8
	for <lists+openrisc@lfdr.de>; Sun,  9 May 2021 11:11:16 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A25D421395;
	Sun,  9 May 2021 11:11:15 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id ED733210C6
 for <openrisc@lists.librecores.org>; Sun,  9 May 2021 11:11:13 +0200 (CEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 951C06140B;
 Sun,  9 May 2021 09:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620551472;
 bh=4WEVhLSVp2dKbLOmxraeBWdH+1tEbp0pxIaZ2+hE7gI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M2+C0pA1EXBspa8UlnFMm9PT3dx5nP5aJ1ThNRXY+FHNVRZDb1dHErShAy6lqFh57
 BrUESGLEHge/J4sLCcAIgtbbYOJrayu69L0q6PuzPRHANZnaaN8EaO4H6sz+2FwIZ+
 xxntpPWUJ6KTtHtmCdoSNUKFVwBSLhCDD4xTS7CZGTglZZPs+kpb7/zxwgbvH5Zg2w
 JduA7kWTxKrUYoisigCYiX6XMnCyDvvV8V54yVD4hRZ4ww30i/CE9sMJ5uh3olpUZd
 dpWR6z9r3p2GYQby3vxNmEvZie7roeCXG5s4/aVb2sQg6MaC9JVOcxq/ZptHEP5F69
 1yo2uPWLkW/zQ==
From: Mike Rapoport <rppt@kernel.org>
To: Stafford Horne <shorne@gmail.com>
Date: Sun,  9 May 2021 12:11:02 +0300
Message-Id: <20210509091103.7985-2-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210509091103.7985-1-rppt@kernel.org>
References: <20210509091103.7985-1-rppt@kernel.org>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 1/2] openrisc: mm/init.c: remove unused
 memblock_region variable in map_ram()
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
Cc: Jonas Bonn <jonas@southpole.se>, kernel test robot <lkp@intel.com>,
 linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 openrisc@lists.librecores.org, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKS2VybmVsIHRlc3Qgcm9i
b3QgcmVwb3J0czoKCmNwcGNoZWNrIHBvc3NpYmxlIHdhcm5pbmdzOiAobmV3IG9uZXMgcHJlZml4
ZWQgYnkgPj4sIG1heSBub3QgcmVhbCBwcm9ibGVtcykKCj4+IGFyY2gvb3BlbnJpc2MvbW0vaW5p
dC5jOjEyNToxMDogd2FybmluZzogVW5pbml0aWFsaXplZCB2YXJpYWJsZTogcmVnaW9uIFt1bmlu
aXR2YXJdCiAgICAgICAgICAgIHJlZ2lvbi0+YmFzZSwgcmVnaW9uLT5iYXNlICsgcmVnaW9uLT5z
aXplKTsKICAgICAgICAgICAgXgoKUmVwbGFjZSB1c2FnZSBvZiBtZW1ibG9ja19yZWdpb24gZmll
bGRzIHdpdGggJ3N0YXJ0JyBhbmQgJ2VuZCcgdmFyaWFibGVzCnRoYXQgYXJlIGluaXRpYWxpemVk
IGluIGZvcl9lYWNoX21lbV9yYW5nZSgpIGFuZCByZW1vdmUgdGhlIGRlY2xhcmF0aW9uIG9mCnJl
Z2lvbi4KCkZpeGVzOiBiMTBkNmJjYTg3MjAgKCJhcmNoLCBkcml2ZXJzOiByZXBsYWNlIGZvcl9l
YWNoX21lbWJvY2soKSB3aXRoIGZvcl9lYWNoX21lbV9yYW5nZSgpIikKUmVwb3J0ZWQtYnk6IGtl
cm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9w
b3J0IDxycHB0QGxpbnV4LmlibS5jb20+Ci0tLQogYXJjaC9vcGVucmlzYy9tbS9pbml0LmMgfCAz
ICstLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2FyY2gvb3BlbnJpc2MvbW0vaW5pdC5jIGIvYXJjaC9vcGVucmlzYy9tbS9pbml0
LmMKaW5kZXggYmY5YjIzMTBmYzkzLi5mM2ZhMDJiODgzOGEgMTAwNjQ0Ci0tLSBhL2FyY2gvb3Bl
bnJpc2MvbW0vaW5pdC5jCisrKyBiL2FyY2gvb3BlbnJpc2MvbW0vaW5pdC5jCkBAIC03NSw3ICs3
NSw2IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBtYXBfcmFtKHZvaWQpCiAJLyogVGhlc2UgbWFyayBl
eHRlbnRzIG9mIHJlYWQtb25seSBrZXJuZWwgcGFnZXMuLi4KIAkgKiAuLi5mcm9tIHZtbGludXgu
bGRzLlMKIAkgKi8KLQlzdHJ1Y3QgbWVtYmxvY2tfcmVnaW9uICpyZWdpb247CiAKIAl2ID0gUEFH
RV9PRkZTRVQ7CiAKQEAgLTEyMSw3ICsxMjAsNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgbWFwX3Jh
bSh2b2lkKQogCQl9CiAKIAkJcHJpbnRrKEtFUk5fSU5GTyAiJXM6IE1lbW9yeTogMHgleC0weCV4
XG4iLCBfX2Z1bmNfXywKLQkJICAgICAgIHJlZ2lvbi0+YmFzZSwgcmVnaW9uLT5iYXNlICsgcmVn
aW9uLT5zaXplKTsKKwkJICAgICAgIHN0YXJ0LCBlbmQpOwogCX0KIH0KIAotLSAKMi4yOC4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBt
YWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5s
aWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
