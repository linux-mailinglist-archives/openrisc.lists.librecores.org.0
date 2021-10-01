Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id BB9C441E5F6
	for <lists+openrisc@lfdr.de>; Fri,  1 Oct 2021 04:11:13 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5C513241A9;
	Fri,  1 Oct 2021 04:11:13 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id C6AD92406B
 for <openrisc@lists.librecores.org>; Fri,  1 Oct 2021 04:11:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=pScaUIvcwJXSXP+4eICISXmiRzcJ7264OZZlpmskJYA=; b=WMCOhfJ8YarzX5qjFxh6iTqDle
 KLBZyVhQkLiBBNymQJfBUU/EiOOmXqEI15f676A3QriflZMmKZKZXKgKZCVT5nMIFCApp7lq2dGdL
 4FHJLnsHhSwwkf6eN3XzqCUYsWGNnyB5GI6uLKmPshnwoTDuPj7SpwGxtU/K/9EtG+R8Bxl0zDoQj
 Ph+O2LhoRA1wMyDmnn0/uM6LLFUNbAYRELzc0762EOj7/q0s/MdMOu2GzHigjvkEMWrgKcHvmbMAO
 5vat1OlqGi4lCswWjQy8KpfDmXuawWAWMW1V44MRmtXp0+voVqEmzOM+R9DdRAaxKnoABoLKFnpGL
 +T7wzXyg==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mW80s-00GRVJ-56; Fri, 01 Oct 2021 02:11:02 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Date: Thu, 30 Sep 2021 19:11:01 -0700
Message-Id: <20211001021101.18225-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH] openrisc: time: don't mark comment as kernel-doc
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
 Randy Dunlap <rdunlap@infradead.org>, openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Rml4IGEga2VybmVsLWRvYyB3YXJuaW5nIGJ5IHVubWFya2luZyB0aGUgY29tbWVudCBhcyBiZWlu
ZyBpbgprZXJuZWwtZG9jIG5vdGF0aW9uLgoKRml4ZXMgdGhpcyB3YXJuaW5nOgphcmNoL29wZW5y
aXNjL2tlcm5lbC90aW1lLmM6MTM3OiB3YXJuaW5nOiBleHBlY3RpbmcgcHJvdG90eXBlIGZvciBD
bG9ja3NvdXJjZSgpLiBQcm90b3R5cGUgd2FzIGZvciBvcGVucmlzY190aW1lcl9yZWFkKCkgaW5z
dGVhZAoKRml4ZXM6IGI3MzFmYmJkMjQ2ZSAoIk9wZW5SSVNDOiBUaW1la2VlcGluZyIpClNpZ25l
ZC1vZmYtYnk6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPgpSZXBvcnRlZC1i
eToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+CkNjOiBKb25hcyBCb25uIDxqb25h
c0Bzb3V0aHBvbGUuc2U+CkNjOiBTdGVmYW4gS3Jpc3RpYW5zc29uIDxzdGVmYW4ua3Jpc3RpYW5z
c29uQHNhdW5hbGFodGkuZmk+CkNjOiBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4K
Q2M6IG9wZW5yaXNjQGxpc3RzLmxpYnJlY29yZXMub3JnCi0tLQogYXJjaC9vcGVucmlzYy9rZXJu
ZWwvdGltZS5jIHwgICAgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgotLS0gbGludXgtbmV4dC0yMDIxMDkzMC5vcmlnL2FyY2gvb3BlbnJpc2Mva2Vy
bmVsL3RpbWUuYworKysgbGludXgtbmV4dC0yMDIxMDkzMC9hcmNoL29wZW5yaXNjL2tlcm5lbC90
aW1lLmMKQEAgLTEyNyw3ICsxMjcsNyBAQCBpcnFyZXR1cm5fdCBfX2lycV9lbnRyeSB0aW1lcl9p
bnRlcnJ1cHQoCiAJcmV0dXJuIElSUV9IQU5ETEVEOwogfQogCi0vKioKKy8qCiAgKiBDbG9ja3Nv
dXJjZTogQmFzZWQgb24gT3BlblJJU0MgdGltZXIvY291bnRlcgogICoKICAqIFRoaXMgc2V0cyB1
cCB0aGUgT3BlblJJU0MgVGljayBUaW1lciBhcyBhIGNsb2NrIHNvdXJjZS4gIFRoZSB0aWNrIHRp
bWVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5S
SVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xp
c3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
