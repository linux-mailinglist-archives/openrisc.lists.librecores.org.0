Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2B01C38C087
	for <lists+openrisc@lfdr.de>; Fri, 21 May 2021 09:16:58 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id ACE582301C;
	Fri, 21 May 2021 09:16:57 +0200 (CEST)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mail.librecores.org (Postfix) with ESMTPS id C6A10214F9
 for <openrisc@lists.librecores.org>; Fri, 21 May 2021 09:16:55 +0200 (CEST)
Received: by mail-pg1-f170.google.com with SMTP id l70so13557133pga.1
 for <openrisc@lists.librecores.org>; Fri, 21 May 2021 00:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=v8o79yJvUV9XNLlx99r5MWL3uESjn0TyS1fm7mwk/Po=;
 b=S+AwRhJWNxcbOisGQ50V0vydf9YkmUbFoTej+maYSerXugONCEuBeIEK1tnFjWumS9
 1nFn/+fa1g3kLNm0pM8W8ndMiISnDZDU4rjJ49qDtcv/EYdpPf1IWX9SsiFSJ7tJG4sc
 b2hJGkVmR3XKysYvrXlPa6mZGf2yRr6FmES/6DKXw4ZBGGWRanlWTaDqUqhiGCvMoExL
 6m/JJJor4H8jvC27is01w13YADq5VqQM19J8SoSFmpTarYxvBymeG4IIo8ZMfnnPIjEq
 FWMqmAKmvhVe5Sa9aYuDRRrhcynnHFp/652VN7dn+9Gc9A3nTXPOOej8jq2ses9kIvF9
 46uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=v8o79yJvUV9XNLlx99r5MWL3uESjn0TyS1fm7mwk/Po=;
 b=sVluALPQrgOdsXevdIka1MZOaDbuCvmv2k7jMFsLUHJFifBmGkIf+09IHXDrNFCzSY
 UYPti36iCorPPBRi73vybTQlTtaLLawipWgi7OauhyC9prqUSWK+8XADFTIae6XwQV//
 qRy3wBGxvHAXB5/3RklpNSQiJdYJ/mH+cxX8URDZyGiQoQzCO5gkFVF+n6DY+qYJkKjf
 TuA9YPa59Z89nOfPuiS6j8zc0KJBQWF1eOUDPAYKm9JJoFKaClM48OyKCUSMwnz617r0
 sU5qauooiPqCM67peHI24Yc0oGh8uNGooAbFKAG7c17wP72dDD6nTdv1XfR+g4Y2HUEu
 KFug==
X-Gm-Message-State: AOAM530Jd6PaLR5Mj5+5PAspxIJqhUQCzUULfVzmdHFaTUQInwzQAKPX
 6rRb8mwuuPFtaJAJn3t7mlU=
X-Google-Smtp-Source: ABdhPJzZ5Ci4gxfutn4gXM4i2QIiviYDf09w5qw3xezUZIAvwep4j7nb+2ARA/c5KGgmp5oEmoxyZg==
X-Received: by 2002:a65:4887:: with SMTP id n7mr8453834pgs.284.1621581414315; 
 Fri, 21 May 2021 00:16:54 -0700 (PDT)
Received: from localhost (g1.222-224-229.ppp.wakwak.ne.jp. [222.224.229.1])
 by smtp.gmail.com with ESMTPSA id b15sm3588098pfi.100.2021.05.21.00.16.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 00:16:54 -0700 (PDT)
Date: Fri, 21 May 2021 16:16:52 +0900
From: Stafford Horne <shorne@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YKdeZFKthTY31705@antec>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [OpenRISC] [GIT PULL] OpenRISC fixes for 5.13
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
Cc: Openrisc <openrisc@lists.librecores.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgTGludXMsCgpQbGVhc2UgY29uc2lkZXIgZm9yIHB1bGwKClRoZSBmb2xsb3dpbmcgY2hhbmdl
cyBzaW5jZSBjb21taXQgOWY0YWQ5ZTQyNWExZDNiNmEzNDYxN2I4ZWEyMjZkNTZhMTE5YTcxNzoK
CiAgTGludXggNS4xMiAoMjAyMS0wNC0yNSAxMzo0OTowOCAtMDcwMCkKCmFyZSBhdmFpbGFibGUg
aW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6Ly9naXRodWIuY29tL29wZW5yaXNjL2xp
bnV4LmdpdCB0YWdzL2Zvci1saW51cwoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDhi
NTQ5YzE4YWU4MWRiYzM2ZmIxMWU0YWEwOGI4Mzc4YzU5OWNhOTU6CgogIG9wZW5yaXNjOiBEZWZp
bmUgbWVtb3J5IGJhcnJpZXIgbWIgKDIwMjEtMDUtMTUgMTY6MDA6MTAgKzA5MDApCgotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Ck9wZW5SSVNDIGZpeGVzIGZvciA1LjEzCgpBIGZldyBmaXhlcyB0aGF0IGNhbWUgaW4gYXJvdW5k
IHRoZSB0aW1lIG9mIHRoZSBtZXJnZQp3aW5kb3cuCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkNocmlzdG9waGUgSkFJTExF
VCAoMSk6CiAgICAgIG9wZW5yaXNjOiBGaXggYSBtZW1vcnkgbGVhawoKTWlrZSBSYXBvcG9ydCAo
Mik6CiAgICAgIG9wZW5yaXNjOiBtbS9pbml0LmM6IHJlbW92ZSB1bnVzZWQgbWVtYmxvY2tfcmVn
aW9uIHZhcmlhYmxlIGluIG1hcF9yYW0oKQogICAgICBvcGVucmlzYzogbW0vaW5pdC5jOiByZW1v
dmUgdW51c2VkIHZhcmlhYmxlICdlbmQnIGluIHBhZ2luZ19pbml0KCkKClBldGVyIFppamxzdHJh
ICgxKToKICAgICAgb3BlbnJpc2M6IERlZmluZSBtZW1vcnkgYmFycmllciBtYgoKIGFyY2gvb3Bl
bnJpc2MvaW5jbHVkZS9hc20vYmFycmllci5oIHwgOSArKysrKysrKysKIGFyY2gvb3BlbnJpc2Mv
a2VybmVsL3NldHVwLmMgICAgICAgIHwgMiArKwogYXJjaC9vcGVucmlzYy9tbS9pbml0LmMgICAg
ICAgICAgICAgfCA2ICstLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA1
IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvb3BlbnJpc2MvaW5jbHVkZS9h
c20vYmFycmllci5oCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpo
dHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
