Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E36D32E3517
	for <lists+openrisc@lfdr.de>; Mon, 28 Dec 2020 09:33:33 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5AB0720FFF;
	Mon, 28 Dec 2020 09:33:33 +0100 (CET)
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
 by mail.librecores.org (Postfix) with ESMTPS id C61C520A73
 for <openrisc@lists.librecores.org>; Mon, 28 Dec 2020 09:33:32 +0100 (CET)
Received: from ramsan.of.borg ([84.195.186.194])
 by laurent.telenet-ops.be with bizsmtp
 id 9kZX2400N4C55Sk01kZXcV; Mon, 28 Dec 2020 09:33:32 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1ktny7-000fco-04; Mon, 28 Dec 2020 09:33:31 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1ktny6-00G2mS-DV; Mon, 28 Dec 2020 09:33:30 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>
Date: Mon, 28 Dec 2020 09:33:28 +0100
Message-Id: <20201228083328.3823431-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH] openrisc: io: Add missing __iomem annotation to
 iounmap()
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
Cc: openrisc@lists.librecores.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

V2l0aCBDPTE6CgogICAgZHJpdmVycy9zb2MvcmVuZXNhcy9ybW9iaWxlLXN5c2MuYzozMzA6MzM6
IHNwYXJzZTogc3BhcnNlOiBpbmNvcnJlY3QgdHlwZSBpbiBhcmd1bWVudCAxIChkaWZmZXJlbnQg
YWRkcmVzcyBzcGFjZXMpIEBAICAgICBleHBlY3RlZCB2b2lkICphZGRyIEBAICAgICBnb3Qgdm9p
ZCBbbm9kZXJlZl0gX19pb21lbSAqW2Fzc2lnbmVkXSBiYXNlIEBACiAgICBkcml2ZXJzL3NvYy9y
ZW5lc2FzL3Jtb2JpbGUtc3lzYy5jOjMzMDozMzogc3BhcnNlOiAgICAgZXhwZWN0ZWQgdm9pZCAq
YWRkcgogICAgZHJpdmVycy9zb2MvcmVuZXNhcy9ybW9iaWxlLXN5c2MuYzozMzA6MzM6IHNwYXJz
ZTogICAgIGdvdCB2b2lkIFtub2RlcmVmXSBfX2lvbWVtICpbYXNzaWduZWRdIGJhc2UKCkZpeCB0
aGlzIGJ5IGFkZGluZyB0aGUgbWlzc2luZyBfX2lvbWVtIGFubm90YXRpb24gdG8gaW91bm1hcCgp
LgoKUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgpTaWduZWQt
b2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgotLS0K
IGFyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vaW8uaCB8IDIgKy0KIGFyY2gvb3BlbnJpc2MvbW0v
aW9yZW1hcC5jICAgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vaW8u
aCBiL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vaW8uaAppbmRleCA3ZDZiNGE3N2IzNzlkOGUy
Li5jMjk4MDYxYzcwYTdlZTJlIDEwMDY0NAotLS0gYS9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNt
L2lvLmgKKysrIGIvYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS9pby5oCkBAIC0zMSw3ICszMSw3
IEBACiB2b2lkIF9faW9tZW0gKmlvcmVtYXAocGh5c19hZGRyX3Qgb2Zmc2V0LCB1bnNpZ25lZCBs
b25nIHNpemUpOwogCiAjZGVmaW5lIGlvdW5tYXAgaW91bm1hcAotZXh0ZXJuIHZvaWQgaW91bm1h
cCh2b2lkICphZGRyKTsKK2V4dGVybiB2b2lkIGlvdW5tYXAodm9pZCBfX2lvbWVtICphZGRyKTsK
IAogI2luY2x1ZGUgPGFzbS1nZW5lcmljL2lvLmg+CiAKZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJp
c2MvbW0vaW9yZW1hcC5jIGIvYXJjaC9vcGVucmlzYy9tbS9pb3JlbWFwLmMKaW5kZXggYTk3ODU5
MGQ4MDJkMGMzYi4uOTU5NWJlNTFiMTAwYzQwZSAxMDA2NDQKLS0tIGEvYXJjaC9vcGVucmlzYy9t
bS9pb3JlbWFwLmMKKysrIGIvYXJjaC9vcGVucmlzYy9tbS9pb3JlbWFwLmMKQEAgLTc4LDcgKzc4
LDcgQEAgdm9pZCBfX2lvbWVtICpfX3JlZiBpb3JlbWFwKHBoeXNfYWRkcl90IGFkZHIsIHVuc2ln
bmVkIGxvbmcgc2l6ZSkKIH0KIEVYUE9SVF9TWU1CT0woaW9yZW1hcCk7CiAKLXZvaWQgaW91bm1h
cCh2b2lkICphZGRyKQordm9pZCBpb3VubWFwKHZvaWQgX19pb21lbSAqYWRkcikKIHsKIAkvKiBJ
ZiB0aGUgcGFnZSBpcyBmcm9tIHRoZSBmaXhtYXAgcG9vbCB0aGVuIHdlIGp1c3QgY2xlYXIgb3V0
CiAJICogdGhlIGZpeG1hcCBtYXBwaW5nLgotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJ
U0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0
aW5mby9vcGVucmlzYwo=
