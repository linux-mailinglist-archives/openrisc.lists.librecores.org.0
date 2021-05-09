Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2075B3775F9
	for <lists+openrisc@lfdr.de>; Sun,  9 May 2021 11:11:18 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id F1F8B21396;
	Sun,  9 May 2021 11:11:17 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 655A021368
 for <openrisc@lists.librecores.org>; Sun,  9 May 2021 11:11:16 +0200 (CEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2F03D6141D;
 Sun,  9 May 2021 09:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620551475;
 bh=dTPu7qA+xLGeJ/0FDcGhgI4f0XSe/BLwn8owpVQCXU4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BrUZPb9PWta8j618Q2nRKtwWz4Kgme+kHuy2vmxb9IjLL/+5XW0FpJPI9J9W1GLY3
 QozJ3kTd0TbKMyNf6d2L/mVk/RQnQTrC7GPssaT+CclpgC7XGVbO80WkUOcYBAvW+v
 aulBp/ENa7iKuuquLKrsugOJu6NR2qjkJUJMQgClXbNzVz+RRc/kAX4rSfWkFuNoCa
 jtXooiGfc0LBV2Q6fCEJ+getejIiBUY9Q+JpLaJSJ3fLmAcKRoK8ZxEQx/JJUvPKav
 B4U25EWsPRTAUgMHmZ5XeVOEKb4aWI9qtZwnDm/rXRnHQ0r8FWmbw11d7PB8GdCBhZ
 mvU9tPNdUCt2Q==
From: Mike Rapoport <rppt@kernel.org>
To: Stafford Horne <shorne@gmail.com>
Date: Sun,  9 May 2021 12:11:03 +0300
Message-Id: <20210509091103.7985-3-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210509091103.7985-1-rppt@kernel.org>
References: <20210509091103.7985-1-rppt@kernel.org>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 2/2] openrisc: mm/init.c: remove unused variable
 'end' in paging_init()
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
Cc: Jonas Bonn <jonas@southpole.se>, linux-kernel@vger.kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>, openrisc@lists.librecores.org,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKQSBidWlsZCB3aXRoIFc9
MSBlbmFibGVkIHByb2R1Y2VzIHRoZSBmb2xsb3dpbmcgd2FybmluZzoKCiAgQ0MgICAgICBhcmNo
L29wZW5yaXNjL21tL2luaXQubwphcmNoL29wZW5yaXNjL21tL2luaXQuYzogSW4gZnVuY3Rpb24g
J3BhZ2luZ19pbml0JzoKYXJjaC9vcGVucmlzYy9tbS9pbml0LmM6MTMxOjE2OiB3YXJuaW5nOiB2
YXJpYWJsZSAnZW5kJyBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxl
XQogIDEzMSB8ICB1bnNpZ25lZCBsb25nIGVuZDsKICAgICAgfCAgICAgICAgICAgICAgICBefn4K
ClJlbW92ZSB0aGUgdW51c2VkIHZhcmlhYmxlICdlbmQnLgoKU2lnbmVkLW9mZi1ieTogTWlrZSBS
YXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgotLS0KIGFyY2gvb3BlbnJpc2MvbW0vaW5pdC5j
IHwgMyAtLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Fy
Y2gvb3BlbnJpc2MvbW0vaW5pdC5jIGIvYXJjaC9vcGVucmlzYy9tbS9pbml0LmMKaW5kZXggZjNm
YTAyYjg4MzhhLi42ZTM4ZWM5NmNhYjggMTAwNjQ0Ci0tLSBhL2FyY2gvb3BlbnJpc2MvbW0vaW5p
dC5jCisrKyBiL2FyY2gvb3BlbnJpc2MvbW0vaW5pdC5jCkBAIC0xMjgsNyArMTI4LDYgQEAgdm9p
ZCBfX2luaXQgcGFnaW5nX2luaXQodm9pZCkKIHsKIAlleHRlcm4gdm9pZCB0bGJfaW5pdCh2b2lk
KTsKIAotCXVuc2lnbmVkIGxvbmcgZW5kOwogCWludCBpOwogCiAJcHJpbnRrKEtFUk5fSU5GTyAi
U2V0dGluZyB1cCBwYWdpbmcgYW5kIFBURXMuXG4iKTsKQEAgLTE0NCw4ICsxNDMsNiBAQCB2b2lk
IF9faW5pdCBwYWdpbmdfaW5pdCh2b2lkKQogCSAqLwogCWN1cnJlbnRfcGdkW3NtcF9wcm9jZXNz
b3JfaWQoKV0gPSBpbml0X21tLnBnZDsKIAotCWVuZCA9ICh1bnNpZ25lZCBsb25nKV9fdmEobWF4
X2xvd19wZm4gKiBQQUdFX1NJWkUpOwotCiAJbWFwX3JhbSgpOwogCiAJem9uZV9zaXplc19pbml0
KCk7Ci0tIAoyLjI4LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9y
ZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
