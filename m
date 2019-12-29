Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id DCDCD130A0B
	for <lists+openrisc@lfdr.de>; Sun,  5 Jan 2020 22:53:38 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B27CA205FA;
	Sun,  5 Jan 2020 22:53:37 +0100 (CET)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by mail.librecores.org (Postfix) with ESMTPS id 6BDE424ABA
 for <openrisc@lists.librecores.org>; Sun, 29 Dec 2019 17:19:31 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,372,1571695200"; d="scan'208";a="334379019"
Received: from palace.rsr.lip6.fr (HELO palace.lip6.fr) ([132.227.105.202])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/AES128-SHA256;
 29 Dec 2019 17:19:30 +0100
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Jonas Bonn <jonas@southpole.se>
Date: Sun, 29 Dec 2019 16:42:58 +0100
Message-Id: <1577634178-22530-5-git-send-email-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1577634178-22530-1-git-send-email-Julia.Lawall@inria.fr>
References: <1577634178-22530-1-git-send-email-Julia.Lawall@inria.fr>
X-Mailman-Approved-At: Sun, 05 Jan 2020 22:53:35 +0100
Subject: [OpenRISC] [PATCH 4/4] openrisc: use mmgrab
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
Cc: openrisc@lists.librecores.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

TW1ncmFiIHdhcyBpbnRyb2R1Y2VkIGluIGNvbW1pdCBmMWYxMDA3NjQ0ZmYgKCJtbTogYWRkIG5l
dyBtbWdyYWIoKQpoZWxwZXIiKSBhbmQgbW9zdCBvZiB0aGUga2VybmVsIHdhcyB1cGRhdGVkIHRv
IHVzZSBpdC4gVXBkYXRlIGEKcmVtYWluaW5nIGZpbGUuCgpUaGUgc2VtYW50aWMgcGF0Y2ggdGhh
dCBtYWtlcyB0aGlzIGNoYW5nZSBpcyBhcyBmb2xsb3dzOgooaHR0cDovL2NvY2NpbmVsbGUubGlw
Ni5mci8pCgo8c21wbD4KQEAgZXhwcmVzc2lvbiBlOyBAQAotIGF0b21pY19pbmMoJmUtPm1tX2Nv
dW50KTsKKyBtbWdyYWIoZSk7Cjwvc21wbD4KClNpZ25lZC1vZmYtYnk6IEp1bGlhIExhd2FsbCA8
SnVsaWEuTGF3YWxsQGlucmlhLmZyPgoKLS0tCkkgd2FzIG5vdCBhYmxlIHRvIGNvbXBpbGUgdGhp
cyBmaWxlLgoKIGFyY2gvb3BlbnJpc2Mva2VybmVsL3NtcC5jIHwgICAgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9v
cGVucmlzYy9rZXJuZWwvc21wLmMgYi9hcmNoL29wZW5yaXNjL2tlcm5lbC9zbXAuYwppbmRleCA3
ZDUxOGVlOGJkZGMuLjdiZDZlMGZjN2E2ZCAxMDA2NDQKLS0tIGEvYXJjaC9vcGVucmlzYy9rZXJu
ZWwvc21wLmMKKysrIGIvYXJjaC9vcGVucmlzYy9rZXJuZWwvc21wLmMKQEAgLTExMyw3ICsxMTMs
NyBAQCBhc21saW5rYWdlIF9faW5pdCB2b2lkIHNlY29uZGFyeV9zdGFydF9rZXJuZWwodm9pZCkK
IAkgKiBBbGwga2VybmVsIHRocmVhZHMgc2hhcmUgdGhlIHNhbWUgbW0gY29udGV4dDsgZ3JhYiBh
CiAJICogcmVmZXJlbmNlIGFuZCBzd2l0Y2ggdG8gaXQuCiAJICovCi0JYXRvbWljX2luYygmbW0t
Pm1tX2NvdW50KTsKKwltbWdyYWIobW0pOwogCWN1cnJlbnQtPmFjdGl2ZV9tbSA9IG1tOwogCWNw
dW1hc2tfc2V0X2NwdShjcHUsIG1tX2NwdW1hc2sobW0pKTsKIAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5S
SVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlz
dGluZm8vb3BlbnJpc2MK
