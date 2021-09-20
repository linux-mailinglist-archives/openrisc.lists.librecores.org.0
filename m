Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 8391E411A61
	for <lists+openrisc@lfdr.de>; Mon, 20 Sep 2021 18:48:14 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 0640D241CA;
	Mon, 20 Sep 2021 18:48:14 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 238FD213F3
 for <openrisc@lists.librecores.org>; Mon, 20 Sep 2021 18:48:13 +0200 (CEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D90186128A;
 Mon, 20 Sep 2021 16:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1632156491;
 bh=4M6l8XnkxZIOgOak0YlBiTwRChEPn0n+I4psvZFEQy8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=zmuQ4OdxurwOhtoDZl7fo7A2EMzWCEIJz1Fv34gjcmS9JJ36vKHi9AqL2rmq3EBmQ
 qYgn6BOd/tQH0SKI/KFTXr6AmnaBWdMzxhGTCdwPUK5wbmld/T/bezTgFyOUg6XZlI
 /L727vm53WiNdVU/9eRsPtC8JdWByJ89MQoKQX2E=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Date: Mon, 20 Sep 2021 18:42:41 +0200
Message-Id: <20210920163915.357380022@linuxfoundation.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210920163912.603434365@linuxfoundation.org>
References: <20210920163912.603434365@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 4.4 083/133] openrisc: dont printk()
 unconditionally
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
Cc: Jonas Bonn <jonas@southpole.se>, Sasha Levin <sashal@kernel.org>,
 kernel test robot <lkp@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, stable@vger.kernel.org,
 openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+CgpbIFVwc3RyZWFtIGNv
bW1pdCA5NDZlMTA1MmNkY2M3ZTU4NWVlNWQxZTcyNTI4Y2E0OWZiMjk1MjQzIF0KCkRvbid0IGNh
bGwgcHJpbnRrKCkgd2hlbiBDT05GSUdfUFJJTlRLIGlzIG5vdCBzZXQuCkZpeGVzIHRoZSBmb2xs
b3dpbmcgYnVpbGQgZXJyb3JzOgoKb3Ixay1saW51eC1sZDogYXJjaC9vcGVucmlzYy9rZXJuZWwv
ZW50cnkubzogaW4gZnVuY3Rpb24gYF9leHRlcm5hbF9pcnFfaGFuZGxlcic6CigudGV4dCsweDgw
NCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYHByaW50aycKKC50ZXh0KzB4ODA0KTogcmVsb2Nh
dGlvbiB0cnVuY2F0ZWQgdG8gZml0OiBSX09SMUtfSU5TTl9SRUxfMjYgYWdhaW5zdCB1bmRlZmlu
ZWQgc3ltYm9sIGBwcmludGsnCgpGaXhlczogOWQwMmE0MjgzZTljICgiT3BlblJJU0M6IEJvb3Qg
Y29kZSIpClNpZ25lZC1vZmYtYnk6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3Jn
PgpSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+CkNjOiBKb25h
cyBCb25uIDxqb25hc0Bzb3V0aHBvbGUuc2U+CkNjOiBTdGVmYW4gS3Jpc3RpYW5zc29uIDxzdGVm
YW4ua3Jpc3RpYW5zc29uQHNhdW5hbGFodGkuZmk+CkNjOiBTdGFmZm9yZCBIb3JuZSA8c2hvcm5l
QGdtYWlsLmNvbT4KQ2M6IG9wZW5yaXNjQGxpc3RzLmxpYnJlY29yZXMub3JnClNpZ25lZC1vZmYt
Ynk6IFN0YWZmb3JkIEhvcm5lIDxzaG9ybmVAZ21haWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYXNo
YSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogYXJjaC9vcGVucmlzYy9rZXJuZWwvZW50
cnkuUyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9hcmNoL29wZW5yaXNjL2tlcm5lbC9lbnRyeS5TIGIvYXJjaC9vcGVucmlzYy9rZXJuZWwvZW50
cnkuUwppbmRleCAzZmJlNDIwZjQ5YzQuLjkyY2RjMWU1NmI2MCAxMDA2NDQKLS0tIGEvYXJjaC9v
cGVucmlzYy9rZXJuZWwvZW50cnkuUworKysgYi9hcmNoL29wZW5yaXNjL2tlcm5lbC9lbnRyeS5T
CkBAIC00OTEsNiArNDkxLDcgQEAgRVhDRVBUSU9OX0VOVFJZKF9leHRlcm5hbF9pcnFfaGFuZGxl
cikKIAlsLmJuZgkxZgkJCS8vIGV4dCBpcnEgZW5hYmxlZCwgYWxsIG9rLgogCWwubm9wCiAKKyNp
ZmRlZiBDT05GSUdfUFJJTlRLCiAJbC5hZGRpICByMSxyMSwtMHg4CiAJbC5tb3ZoaSByMyxoaSg0
MmYpCiAJbC5vcmkJcjMscjMsbG8oNDJmKQpAQCAtNTA0LDYgKzUwNSw3IEBAIEVYQ0VQVElPTl9F
TlRSWShfZXh0ZXJuYWxfaXJxX2hhbmRsZXIpCiAJCS5zdHJpbmcgIlxuXHJFU1IgaW50ZXJydXB0
IGJ1ZzogaW4gX2V4dGVybmFsX2lycV9oYW5kbGVyIChFU1IgJXgpXG5cciIKIAkJLmFsaWduIDQK
IAkucHJldmlvdXMKKyNlbmRpZgogCiAJbC5vcmkJcjQscjQsU1BSX1NSX0lFRQkvLyBmaXggdGhl
IGJ1ZwogLy8JbC5zdwlQVF9TUihyMSkscjQKLS0gCjIuMzAuMgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3Bl
blJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9s
aXN0aW5mby9vcGVucmlzYwo=
