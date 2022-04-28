Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 6680E513238
	for <lists+openrisc@lfdr.de>; Thu, 28 Apr 2022 13:15:26 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 01439248C3;
	Thu, 28 Apr 2022 13:15:26 +0200 (CEST)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id 4E2F724165
 for <openrisc@lists.librecores.org>; Thu, 28 Apr 2022 13:15:24 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3254861F14
 for <openrisc@lists.librecores.org>; Thu, 28 Apr 2022 11:15:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6508AC385A0
 for <openrisc@lists.librecores.org>; Thu, 28 Apr 2022 11:15:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Npy7Cpth"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1651144520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=CLXycns7gowJ49sjLbCxz/iHQNIKwh8lX/OmTB83/NQ=;
 b=Npy7Cpth8Hw0jtco5aVomNhsSrDwnsx/yTfmxM1Lu1QMQscG3gXfupMg5guk3JuAtABlHf
 NEosfIk2zpKmlhunN8v66OWtPdayIsj5WFgkDksxWj+5CWcv4hCdYdEcLR4bC5y69ZTzy9
 Zb6o7hvTsjwc6J80b1nSNJBFMlU3f8g=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c4ae0d1e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <openrisc@lists.librecores.org>;
 Thu, 28 Apr 2022 11:15:20 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-2f7d7e3b5bfso48998617b3.5
 for <openrisc@lists.librecores.org>; Thu, 28 Apr 2022 04:15:20 -0700 (PDT)
X-Gm-Message-State: AOAM531xQsl/qkfxc02V6ht/s0HxjXMj19BEUijSQfQ1d1KtHA3TE44Z
 D+1vZXoZJF98ZgnUm9FEhl9p7H0XipzaDsI6BJ0=
X-Google-Smtp-Source: ABdhPJwNRUP2rpZVkmrwXxcvzc/Q+syy9dSjyDRxcw6gRRAVP5xz8LJO7IyPMinpkRHZC1iApbACjqLjCmOa6w/BeA8=
X-Received: by 2002:a0d:c005:0:b0:2eb:d29d:8bf5 with SMTP id
 b5-20020a0dc005000000b002ebd29d8bf5mr34406027ywd.404.1651144519639; Thu, 28
 Apr 2022 04:15:19 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 28 Apr 2022 13:15:09 +0200
X-Gmail-Original-Message-ID: <CAHmME9ooFW5unm1AOWU5738_GHkYqVZ0whEgfKn6RH6k=SCm5g@mail.gmail.com>
Message-ID: <CAHmME9ooFW5unm1AOWU5738_GHkYqVZ0whEgfKn6RH6k=SCm5g@mail.gmail.com>
To: openrisc@lists.librecores.org
Subject: [OpenRISC] Add openrisc@lists.librecores.org to lore.kernel.org
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
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgZm9sa3MsCgpBbnkgaW50ZXJlc3QgaW4gZ2V0dGluZyB0aGlzIG1haWxpbmcgbGlzdCB1cCBv
biBsb3JlLmtlcm5lbC5vcmc/IFRoaXMKd291bGQgbWFrZSBzZW5zZSBzaW5jZSBpdCdzIHRoZSBt
YWlsaW5nIGxpc3Qgc3BlY2lmaWVkIGluIHRoZSBMaW51eApNQUlOVEFJTkVSUyBmaWxlIGZvciBP
cGVuUklTQyBkZXZlbG9wbWVudC4gSXQnZCByZXF1aXJlIHRoZSBsaXN0CmFkbWluaXN0cmF0b3Ig
dG8gc2VuZCB0aGUgY3VycmVudCBsaXN0IGFyY2hpdmVzIHRvIEtvbnN0YW50aW4gYW5kIHRoZW4K
YWRkIHNvbWUgYXJjaGl2ZXIgYXMgYSBzdWJzY3JpYmVyLiBHaXZlbiB0aGlzIGlzIGEgZmFpcmx5
IG5vcm1hbAptYWlsbWFuIGxpc3QsIHRoYXQgZG9lc24ndCBzZWVtIHRvbyBoYXJkLgoKSmFzb24K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
