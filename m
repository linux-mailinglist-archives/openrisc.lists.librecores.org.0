Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 5E7852BB8B4
	for <lists+openrisc@lfdr.de>; Fri, 20 Nov 2020 23:15:13 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id BB7142103E;
	Fri, 20 Nov 2020 23:15:12 +0100 (CET)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by mail.librecores.org (Postfix) with ESMTPS id 954B820EC9
 for <openrisc@lists.librecores.org>; Fri, 20 Nov 2020 23:15:11 +0100 (CET)
Received: by mail-pg1-f196.google.com with SMTP id v21so8519888pgi.2
 for <openrisc@lists.librecores.org>; Fri, 20 Nov 2020 14:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=prvg8B1KrWWe0HEsg9Zq+0hq/o/+oUphxhhcU5YZPAc=;
 b=JjVQvz53y0sUe4tDbun89hJwEgwjFoRzlFj6sxzrLA6Fxhs2My/ERhuiMFHtKX/tJ9
 GG9vqqYcQVJFr/Jj2kHdIDT6fB70TC7kTUFL+LXqwDowbfnJsnwPpqAYzPBZ9/LbP1CF
 qlpTBXZdy0aGXTrjBS3DL5dGfwlBQMWCD8EDTuugqJWvIXt5lszkpDnGpxfNHlOgr4Mj
 FToUB5RR3jx5WHcgh+o4LPGHZNC9eSoprOjtartzv+Wrk5vVInJ5I7fYywX+z615mGVs
 Qgyt7P7KwY9do/9DzhQTO6t4LFf2C74XxWqONzVGzHi6/vqdCTsuZL+76Flym3mqwOVc
 40xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=prvg8B1KrWWe0HEsg9Zq+0hq/o/+oUphxhhcU5YZPAc=;
 b=BkB+NnAHzFTaqISDTDFGHsBWQNto2cOvbNf4s+vPQbnW6lRa0l9zrcYeQDNDw+nmD+
 fo94kPfkdqxCTl8uYPqoAbdU5TUNj/ohvljFsu1j5f1tijPEGZNlvYciNagNmfpbhbWv
 9ft2FcWZiHci39Ak5cBAyn7d27qcACDPjGUo7N1FkmHcGq5IUf0+FQv+jOhF6uKXQCqm
 ffKvBoSJunjtA08/8zYnPc5Y5M03cADdqXtNpO1YDR1GNm7zyE1ZWL0P1CqUxdQ/18wv
 AlF7cBklmD5fGBqwlpT5I72vtfeaG5SXrhUuOj9e9HHGu+GNPZwNdQrZAjrElEOZXWQY
 bKFw==
X-Gm-Message-State: AOAM531nlqKpEUjrdq8ThzyRY6HH+WBVhYW9ZGClMfdhxWk38jLm/1Bw
 1NHDdmN8BaK8IkoavYDrn+I=
X-Google-Smtp-Source: ABdhPJz69AbNH3kD/vjJGU0KicZy7bG9TzXlbQcQLLB5PEQgRaLHieKXEUfYuogR05wuKTPQG/6MJw==
X-Received: by 2002:a63:d357:: with SMTP id u23mr19387230pgi.106.1605910509948; 
 Fri, 20 Nov 2020 14:15:09 -0800 (PST)
Received: from localhost (g133.220-213-56.ppp.wakwak.ne.jp. [220.213.56.133])
 by smtp.gmail.com with ESMTPSA id
 t8sm4704085pfe.65.2020.11.20.14.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 14:15:09 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Sat, 21 Nov 2020 07:14:58 +0900
Message-Id: <20201120221500.3097841-1-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH] openrisc: add local64.h to fix blk-iocost build
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
Cc: Jonas Bonn <jonas@southpole.se>, Masahiro Yamada <masahiroy@kernel.org>,
 openrisc@lists.librecores.org, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

QXMgb2YgNS4xMCBPcGVuUklTQyBhbGx5ZXNjb25maWcgYnVpbGRzIGZhaWwgd2l0aCB0aGUgZm9s
bG93aW5nIGVycm9yLgoKICAgICQgbWFrZSBBUkNIPW9wZW5yaXNjIENST1NTX0NPTVBJTEU9b3Ix
ay1lbGYtIGJsb2NrL2Jsay1pb2Nvc3QubwogICAgICBDQUxMICAgIHNjcmlwdHMvY2hlY2tzeXNj
YWxscy5zaAogICAgICBDQUxMICAgIHNjcmlwdHMvYXRvbWljL2NoZWNrLWF0b21pY3Muc2gKICAg
ICAgQ0MgICAgICBibG9jay9ibGstaW9jb3N0Lm8KICAgIGJsb2NrL2Jsay1pb2Nvc3QuYzoxODM6
MTA6IGZhdGFsIGVycm9yOiBhc20vbG9jYWw2NC5oOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5
CiAgICAgIDE4MyB8ICNpbmNsdWRlIDxhc20vbG9jYWw2NC5oPgoJICB8ICAgICAgICAgIF5+fn5+
fn5+fn5+fn5+fgogICAgY29tcGlsYXRpb24gdGVybWluYXRlZC4KClRoZSBuZXcgaW5jbHVkZSBv
ZiBsb2NhbDY0Lmggd2FzIGFkZGVkIGluIGNvbW1pdCA1ZTEyNGY3NDMyNWQKKCJibGstaW9jb3N0
OiB1c2UgbG9jYWxbNjRdX3QgZm9yIHBlcmNwdSBzdGF0IikgYnkgVGVqdW4uCgpBZGRpbmcgdGhl
IGdlbmVyaWMgdmVyc2lvbiBvZiBsb2NhbDY0LmggdG8gT3BlblJJU0MgZml4ZXMgdGhlIGJ1aWxk
Cmlzc3VlLgoKQ2M6IFRlanVuIEhlbyA8dGpAa2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTogU3Rh
ZmZvcmQgSG9ybmUgPHNob3JuZUBnbWFpbC5jb20+Ci0tLQogYXJjaC9vcGVucmlzYy9pbmNsdWRl
L2FzbS9LYnVpbGQgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAt
LWdpdCBhL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vS2J1aWxkIGIvYXJjaC9vcGVucmlzYy9p
bmNsdWRlL2FzbS9LYnVpbGQKaW5kZXggY2E1OTg3ZTExMDUzLi40NDJmM2QzYmNkOTAgMTAwNjQ0
Ci0tLSBhL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vS2J1aWxkCisrKyBiL2FyY2gvb3BlbnJp
c2MvaW5jbHVkZS9hc20vS2J1aWxkCkBAIC0xLDYgKzEsNyBAQAogIyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogR1BMLTIuMAogZ2VuZXJpYy15ICs9IGV4dGFibGUuaAogZ2VuZXJpYy15ICs9IGt2
bV9wYXJhLmgKK2dlbmVyaWMteSArPSBsb2NhbDY0LmgKIGdlbmVyaWMteSArPSBtY3Nfc3Bpbmxv
Y2suaAogZ2VuZXJpYy15ICs9IHFzcGlubG9ja190eXBlcy5oCiBnZW5lcmljLXkgKz0gcXNwaW5s
b2NrLmgKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMu
b3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
