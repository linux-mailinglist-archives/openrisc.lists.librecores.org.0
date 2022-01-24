Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E78184980F5
	for <lists+openrisc@lfdr.de>; Mon, 24 Jan 2022 14:23:17 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 986A324309;
	Mon, 24 Jan 2022 14:23:17 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by mail.librecores.org (Postfix) with ESMTP id 2337B2062E
 for <openrisc@lists.librecores.org>; Mon, 24 Jan 2022 14:23:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643030594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=piYkvvZnbFJ5CdsuMIkl3SvKoIdlBqD/kSPkxS3TrvI=;
 b=eUlBJlO4uU27bcKGC2rlfTdqFBCvFnxZuVxvQNntO424GEGCCNhd4+KEHieignQkIdKVlW
 SqulaA0dY0igsoorwnGfKPFSf13x1bSugT8oN+yfoVcngaf+XJqsz6vVHKb5dm0lA+CwM8
 b7WYpOYe6I2JaIGYcDCc5cWUGa30XOA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-a7XsuetWOXKuaE0YoLBEhw-1; Mon, 24 Jan 2022 08:23:11 -0500
X-MC-Unique: a7XsuetWOXKuaE0YoLBEhw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70E771091DA1;
 Mon, 24 Jan 2022 13:23:10 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.39.192.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7480878AA6;
 Mon, 24 Jan 2022 13:23:09 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Stafford Horne <shorne@gmail.com>
References: <20220104031414.2416928-1-shorne@gmail.com>
Date: Mon, 24 Jan 2022 14:23:07 +0100
In-Reply-To: <20220104031414.2416928-1-shorne@gmail.com> (Stafford Horne's
 message of "Tue, 4 Jan 2022 12:14:01 +0900")
Message-ID: <87tudt2rpg.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=fweimer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [OpenRISC] [PATCH v5 00/13] Glibc OpenRISC port
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
 GLIBC patches <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

KiBTdGFmZm9yZCBIb3JuZToKCj4gVGhpcyBpcyB0aGUgT3BlblJJU0MgcG9ydCBmb3IgZ2xpYmMg
dGhhdCBJIGhhdmUgYmVlbiB3b3JraW5nIG9uLgoKVGhlIHBvcnQgZG9lcyBub3QgZGVmaW5lIFBJ
X1NUQVRJQ19BTkRfSElEREVOLiAgSXMgdGhpcyByZWFsbHkKbmVjZXNzYXJ5LCBvciBqdXN0IGFu
IG92ZXJzaWdodCBkdWUgdG8gdGhlIHdheSB0aGUgcG9ydCB3YXMgY29uc3RydWN0ZWQKKHByZXN1
bWFibHkgd2l0aCBNSVBTIGFzIHRoZSB0ZW1wbGF0ZSk/CgpQSV9TVEFUSUNfQU5EX0hJRERFTiBt
ZWFucyB0aGF0IHJlZmVyZW5jZXMgdG8gc3RhdGljIGZ1bmN0aW9ucyBhbmQgZGF0YQphbmQgc3lt
Ym9scyB3aXRoIGhpZGRlbiB2aXNpYmlsaXR5IGRvIG5vdCBuZWVkIGFueSBydW4tdGltZSByZWxv
Y2F0aW9ucwphZnRlciB0aGUgZmluYWwgbGluaywgd2l0aCB0aGUgYnVpbGQgZmxhZ3MgdXNlZCBi
eSBnbGliYy4KClRoYW5rcywKRmxvcmlhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxp
YnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJp
c2MK
