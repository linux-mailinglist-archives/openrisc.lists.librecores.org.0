Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2BAB62AFA4D
	for <lists+openrisc@lfdr.de>; Wed, 11 Nov 2020 22:24:45 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C19EC20F71;
	Wed, 11 Nov 2020 22:24:44 +0100 (CET)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by mail.librecores.org (Postfix) with ESMTPS id 90CCE20332
 for <openrisc@lists.librecores.org>; Wed, 11 Nov 2020 22:24:43 +0100 (CET)
Received: by mail-pg1-f196.google.com with SMTP id f18so2273976pgi.8
 for <openrisc@lists.librecores.org>; Wed, 11 Nov 2020 13:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+ZdzFgqA8sxrUpX7gVn9r2eV7QfWMvgZImm8xeBJjNw=;
 b=jmWSHXtvnQBRxFR48lEfks49M80O3/lExClIB567MFfaBYF2hw42dycH9nYEtFrg2V
 WM6jB/IQLWgER0ffeYQurXQVukkzhSB2I9yo+oD72x69I39wQoUiGp4KbGTakKfpc6eK
 zio4YqVvpfYAgJYmyXhM9tHM8uWs8c0NhORaWyBPB7S1abIMBq1QKBJVy1PvxhiSnkF7
 IkhOkIaP8w45K29ei5E/zPbIY2U4zrL4V8SFz1ijs52W5mwXlS8XvInWT96XGzO5xosX
 YAN9KOybrhkbf810Ppm8Qr3hN133XuCuSv/z0ug7vaE9J1oNGH6qBL735Czv7zV/2sB8
 sZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+ZdzFgqA8sxrUpX7gVn9r2eV7QfWMvgZImm8xeBJjNw=;
 b=jp/EN+0J+pjsmrOcIM++D+Z4K4qS/da8Z3c212E6/PuepO3Hou1Vyq3QUQGocMVhmj
 byxN4kUlmTTvremqzuztvjCeWv9ByfhhP6rLD0UAoehZoxXoSzfxANh/6VTyO2T6y9j3
 x9O01RPv1Efr3o3beboaYZg5BTXHKKz/lq7RaMasLToXXlkYbhbwlUDuGu0v/hBVTx0G
 xgSJOv8WXENyrKWb7rx7kwLT18BF5KryGM9GwkjoYK1sRl5OGcJ9cM8NnsnbrL5djsr1
 XxIGFyN/79bNeGpmSXhgIsib9rDbScjD6hqA6ILg/zRVXy0o6mKXaTtiOMuIAFF/mji+
 yFiQ==
X-Gm-Message-State: AOAM531HXQzaznPa7/wRKr3c98UTe8FowW0Ab70G8U/vtyEsMEM/2CJ+
 ULFZbPnuUq6I8aRRL4xrf+k=
X-Google-Smtp-Source: ABdhPJxzXEmB0RyBRXWyO6HWPLWB9xHslpmICFp+qhbgCq1mW25wGQEbvbFfZ7eTgubqS/hXXwUbpw==
X-Received: by 2002:a17:90b:310e:: with SMTP id
 gc14mr5844194pjb.147.1605129881791; 
 Wed, 11 Nov 2020 13:24:41 -0800 (PST)
Received: from localhost (g133.220-213-56.ppp.wakwak.ne.jp. [220.213.56.133])
 by smtp.gmail.com with ESMTPSA id
 v24sm3286986pjh.19.2020.11.11.13.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 13:24:40 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Thu, 12 Nov 2020 06:23:46 +0900
Message-Id: <20201111212347.1504298-1-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH] openrisc: fix trap for debugger breakpoint
 signalling
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
Cc: Jonas Bonn <jonas@southpole.se>, Dmitry Safonov <0x7f454c46@gmail.com>,
 openrisc@lists.librecores.org, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SSBoYXZlIGJlZW4gd29ya2luZyBvbiBnZXR0aW5nIG5hdGl2ZSBMaW51eCBHREIgc3VwcG9ydCB3
b3JraW5nIGZvciB0aGUKT3BlblJJU0MgcG9ydC4gIFRoZSB0cmFwIHNpZ25hbCBoYW5kbGVyIGhl
cmUgd2FzIHdyb25nIGluIGEgZmV3IHdheXMuCkR1cmluZyB0cmFwIGhhbmRsaW5nIGFkZHJlc3Mg
KGZyb20gdGhlIEVFQVIgcmVnaXN0ZXIpIGlzIG5vdCBzZXQgYnkgdGhlCkNQVSwgc28gaXQgaXMg
bm90IGNvcnJlY3QgdG8gdXNlIGhlcmUuICBXZSB3YW50IHRvIHVzZSB0cmFwIGFzIGEKYnJlYWst
cG9pbnQgc28gdXNlIFRSQVBfQlJLUFQuICBBZGRpbmcgNCB0byB0aGUgcGMgd2FzIGluY29ycmVj
dCBhbmQKY2F1c2luZyBHREIgdG8gdGhpbmsgdGhlIGJyZWFrcG9pbnQgd2FzIG5vdCBoaXQuCgpG
aXhpbmcgdGhlc2UgYWxsb3dzIEdEQiB0byB3b3JrIG5vdy4KClNpZ25lZC1vZmYtYnk6IFN0YWZm
b3JkIEhvcm5lIDxzaG9ybmVAZ21haWwuY29tPgotLS0KIGFyY2gvb3BlbnJpc2Mva2VybmVsL3Ry
YXBzLmMgfCA0ICstLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL29wZW5yaXNjL2tlcm5lbC90cmFwcy5jIGIvYXJjaC9v
cGVucmlzYy9rZXJuZWwvdHJhcHMuYwppbmRleCAyMDZlNTMyNWU2MWIuLjRkNjEzMzNjMjYyMyAx
MDA2NDQKLS0tIGEvYXJjaC9vcGVucmlzYy9rZXJuZWwvdHJhcHMuYworKysgYi9hcmNoL29wZW5y
aXNjL2tlcm5lbC90cmFwcy5jCkBAIC0yMzgsOSArMjM4LDcgQEAgdm9pZCBfX2luaXQgdHJhcF9p
bml0KHZvaWQpCiAKIGFzbWxpbmthZ2Ugdm9pZCBkb190cmFwKHN0cnVjdCBwdF9yZWdzICpyZWdz
LCB1bnNpZ25lZCBsb25nIGFkZHJlc3MpCiB7Ci0JZm9yY2Vfc2lnX2ZhdWx0KFNJR1RSQVAsIFRS
QVBfVFJBQ0UsICh2b2lkIF9fdXNlciAqKWFkZHJlc3MpOwotCi0JcmVncy0+cGMgKz0gNDsKKwlm
b3JjZV9zaWdfZmF1bHQoU0lHVFJBUCwgVFJBUF9CUktQVCwgKHZvaWQgX191c2VyICopcmVncy0+
cGMpOwogfQogCiBhc21saW5rYWdlIHZvaWQgZG9fdW5hbGlnbmVkX2FjY2VzcyhzdHJ1Y3QgcHRf
cmVncyAqcmVncywgdW5zaWduZWQgbG9uZyBhZGRyZXNzKQotLSAKMi4yNi4yCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxp
c3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVz
Lm9yZy9saXN0aW5mby9vcGVucmlzYwo=
