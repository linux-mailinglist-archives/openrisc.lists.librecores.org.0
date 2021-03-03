Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 874D932B858
	for <lists+openrisc@lfdr.de>; Wed,  3 Mar 2021 14:50:49 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 40EB121215;
	Wed,  3 Mar 2021 14:50:49 +0100 (CET)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mail.librecores.org (Postfix) with ESMTPS id C967A21211
 for <openrisc@lists.librecores.org>; Wed,  3 Mar 2021 14:50:47 +0100 (CET)
Received: by mail-pf1-f181.google.com with SMTP id q204so15266162pfq.10
 for <openrisc@lists.librecores.org>; Wed, 03 Mar 2021 05:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EftmGZdjLp3X1b5WI/aqMkWru2/fOhiuSqIREAuvwXM=;
 b=H20IitUyWiUpKW5ZAsnQM1meeyUma5jNr20Y84ib4Z1nw18Hy+2f+64gQUxIgqN7hj
 twrtOfzXQsuiY8PKgXVy/1VCsVuxAzMHIEXdedX2CYFq1wlDKGUwYBUBHgbMa9HggbOy
 Sogfb3BpRyYE2BkdMgYKH4oAeIKPOsl1o1TEjoO0nszGIt6uJYU4Lhe1IIfVEVFjbaZA
 J0qbUfA+gxuV82nIx+iVUk0nxZ/Nvf4KOh72S+EBaQKhUa7/kS4y1hRPpEJl164xDHJa
 Ri3UG0V5nbvOSI+n/ckagGjUeyb1RM1wR61C7lX2jNtIkQl1/mG8KS7h0HQ6JYwUsfTs
 5GWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EftmGZdjLp3X1b5WI/aqMkWru2/fOhiuSqIREAuvwXM=;
 b=S+wK1QWXnCfdPvf6FVopU03c5fkOtc2qt2H8mmuoJ7rhR8sDVC2dQU8meWI1lxU/L6
 rmn4LP4LuDkOjJQTIvNhxQ1l8LHbSsIWH6dIGqZv4adBTKuPrIQb9keKkoqmXYHbNbl0
 AEyq3kgm0Ma2KGRvzvBDzev5fPK7KSWH6x52MSujqAHjwR05p29jSVOB5QNU7Ka1c/L5
 tNWRBH9QPTydxAptvhZ4Iur8+NnG38o32IoLgHSCUV3aNBKr5ILZGyj0djrC4w+R+/QF
 YF/1CMg7TUR63cWBs2Zmt3qswVilN5wBQoYynSN0w81eojOOENHvi90bW3/JffUtQMm/
 ZolQ==
X-Gm-Message-State: AOAM5314M4Qw9X65KBdNQTxtw/wXdUdMjPaQeAgDIvcQWtrDngucWrCJ
 gdfqu/t13Ak1hTKv/M8oS+c=
X-Google-Smtp-Source: ABdhPJwKfVtjxpk16Nj4MGzOgAKgk7J0xUyUIRCrv9L1qr8XcBoKhlWMe169OJLYAdIwsAtSpFL6nw==
X-Received: by 2002:a65:6207:: with SMTP id d7mr24014291pgv.92.1614779446304; 
 Wed, 03 Mar 2021 05:50:46 -0800 (PST)
Received: from localhost (g98.115-65-200.ppp.wakwak.ne.jp. [115.65.200.98])
 by smtp.gmail.com with ESMTPSA id 184sm23257577pgj.93.2021.03.03.05.50.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:50:45 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: Barebox <barebox@lists.infradead.org>
Date: Wed,  3 Mar 2021 22:50:25 +0900
Message-Id: <20210303135026.3450789-4-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303135026.3450789-1-shorne@gmail.com>
References: <20210303135026.3450789-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 3/4] openrisc: Add linkage.h
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
Cc: s.hauer@pengutronix.de, Openrisc <openrisc@lists.librecores.org>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Q29waWVkIGZyb20gZ2xpYmMgbWludXMgYml0cyB3ZSBkb24ndCBuZWVkLgoKU2lnbmVkLW9mZi1i
eTogU3RhZmZvcmQgSG9ybmUgPHNob3JuZUBnbWFpbC5jb20+Ci0tLQogYXJjaC9vcGVucmlzYy9p
bmNsdWRlL2FzbS9saW5rYWdlLmggfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2Vy
dGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL2xp
bmthZ2UuaAoKZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vbGlua2FnZS5o
IGIvYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS9saW5rYWdlLmgKbmV3IGZpbGUgbW9kZSAxMDA2
NDQKaW5kZXggMDAwMDAwMDAwLi5kYmU0YjRlMzEKLS0tIC9kZXYvbnVsbAorKysgYi9hcmNoL29w
ZW5yaXNjL2luY2x1ZGUvYXNtL2xpbmthZ2UuaApAQCAtMCwwICsxLDcgQEAKKyNpZm5kZWYgX19B
U01fTElOS0FHRV9ICisjZGVmaW5lIF9fQVNNX0xJTktBR0VfSAorCisjZGVmaW5lIF9fQUxJR04g
LmFsaWduIDAKKyNkZWZpbmUgX19BTElHTl9TVFIgIi5hbGlnbiAwIgorCisjZW5kaWYKLS0gCjIu
MjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3Bl
blJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8v
bGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
