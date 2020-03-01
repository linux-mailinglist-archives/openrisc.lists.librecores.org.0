Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 42FF7174FF9
	for <lists+openrisc@lfdr.de>; Sun,  1 Mar 2020 22:39:16 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 22CD8209A3;
	Sun,  1 Mar 2020 22:39:16 +0100 (CET)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by mail.librecores.org (Postfix) with ESMTPS id 62FD4209A1
 for <openrisc@lists.librecores.org>; Sun,  1 Mar 2020 22:39:14 +0100 (CET)
Received: by mail-pl1-f196.google.com with SMTP id ay11so3391151plb.0
 for <openrisc@lists.librecores.org>; Sun, 01 Mar 2020 13:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YJNHUDzAdLWChqG1N9revlyKtIZEHKpvhkJX7T9UBbE=;
 b=LZ6By73BdbPoU4r2bSGdOY1WV4P79kzob+KJaemZh0Kocoq9IBzXEUB8EMLoHA8d+r
 +fJU7jB6rXoUjuwCQW1ejO7mhiN1R4AzzNaGxaj1oL/gEU+qbP+5hCIqqFG2ZxUhwPsi
 bwQLZBtKpe0qBgQky2613dMqBpP+Ka72x7aAAVhvgpwBD9tB/wmBKqYc6NNaBsfWVdsR
 wEM26x8gzEPOi0yTWprBD1ZKKyOeJKhz/uK65RV45d5GywNLJ+64hXz0h9UpF4a5eQL3
 E2THmIEd0WmZYvJIszGQWG4NMSU6Q9VgvZMN9jRHWM86/DZ7gklZETfu3WhxvxCIqcAC
 CHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YJNHUDzAdLWChqG1N9revlyKtIZEHKpvhkJX7T9UBbE=;
 b=rCGLdkQ/+ju6jpXfBUbSlgveHHbcXwDAbNW3o5HYoQPsCllAzMdKPMfYhvlQWUiJAu
 cu54LHo/LunNwWgtfoYtf2k7T4lHnJ+PjV3pkYT2VCDfswKhZKNkpSUkXQSLXt6R7gU2
 J6gY5tPSXAIv2CXYIqW3XWa1Et2GvaMFVttT73D/pXnqqI+cHp7omImiqj7cQBsa9Iuo
 Qr63gaen8zF4Fm0hhU3weL1Agv4mw8vRuvgJ15wvIx+4RF2xS/GjcL5+SLu7i3C87NFp
 XzniqneCX73bzxh0vaVQvhCCq8Bd0m0rthzvOlI7ItIFPre/CTmJUEhr00mniZBjxwDv
 Z2BQ==
X-Gm-Message-State: ANhLgQ0rVNjaKrmA63lZdw0VwizXErHw504WhIZw/07IZZZsQ+TGCrum
 d+gL9YPdOpF/8nPfUqSXAkc=
X-Google-Smtp-Source: ADFU+vuLrpCWb5J6xm7FDp6xlja4TsDZ/bD3diKdvDp/uq3M20KtjfJTS4LTlJRnpFEHJnCXX+KKUA==
X-Received: by 2002:a17:902:5998:: with SMTP id
 p24mr7056846pli.215.1583098753022; 
 Sun, 01 Mar 2020 13:39:13 -0800 (PST)
Received: from localhost (g183.222-224-185.ppp.wakwak.ne.jp. [222.224.185.183])
 by smtp.gmail.com with ESMTPSA id c15sm17184087pgk.66.2020.03.01.13.39.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Mar 2020 13:39:12 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Mon,  2 Mar 2020 06:38:51 +0900
Message-Id: <20200301213851.8096-4-shorne@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200301213851.8096-1-shorne@gmail.com>
References: <20200301213851.8096-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v2 3/3] openrisc: Cleanup copy_thread_tls docs
 and comments
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
Cc: Jonas Bonn <jonas@southpole.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Openrisc <openrisc@lists.librecores.org>, Thomas Gleixner <tglx@linutronix.de>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

UHJldmlvdXNseSBjb3B5X3RocmVhZF90bHMgd2FzIGNvcHlfdGhyZWFkIGFuZCBiZWZvcmUgdGhh
dCBzb21ldGhpbmcKZWxzZS4gIFJlbW92ZSB0aGUgZG9jdW1lbnRhdGlvbiBhYm91dCB0aGUgcmVn
cyBwYXJhbWV0ZXIgdGhhdCBkaWRuJ3QKZXhpc3QgaW4gZWl0aGVyIHZlcnNpb24uCgpOZXh0LCBm
aXggY29tbWVudCB3cmFwcGluZyBhbmQgZGV0YWlscyBhYm91dCBob3cgVExTIHBvaW50ZXIgZ2V0
cyB0byB0aGUKY29weV90aHJlYWRfdGxzIGZ1bmN0aW9uLgoKU2lnbmVkLW9mZi1ieTogU3RhZmZv
cmQgSG9ybmUgPHNob3JuZUBnbWFpbC5jb20+CkFja2VkLWJ5OiBDaHJpc3RpYW4gQnJhdW5lciA8
Y2hyaXN0aWFuLmJyYXVuZXJAdWJ1bnR1LmNvbT4KLS0tCiBhcmNoL29wZW5yaXNjL2tlcm5lbC9w
cm9jZXNzLmMgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvYXJjaC9vcGVucmlzYy9rZXJuZWwvcHJvY2Vzcy5jIGIvYXJjaC9vcGVucmlzYy9rZXJuZWwv
cHJvY2Vzcy5jCmluZGV4IDVjYWE0N2Y3ZGU0Zi4uNmJjZGNhNDI0ZTExIDEwMDY0NAotLS0gYS9h
cmNoL29wZW5yaXNjL2tlcm5lbC9wcm9jZXNzLmMKKysrIGIvYXJjaC9vcGVucmlzYy9rZXJuZWwv
cHJvY2Vzcy5jCkBAIC0xMjIsNyArMTIyLDYgQEAgZXh0ZXJuIGFzbWxpbmthZ2Ugdm9pZCByZXRf
ZnJvbV9mb3JrKHZvaWQpOwogICogQHVzcDogdXNlciBzdGFjayBwb2ludGVyIG9yIGZuIGZvciBr
ZXJuZWwgdGhyZWFkCiAgKiBAYXJnOiBhcmcgdG8gZm4gZm9yIGtlcm5lbCB0aHJlYWQ7IGFsd2F5
cyBOVUxMIGZvciB1c2Vyc3BhY2UgdGhyZWFkCiAgKiBAcDogdGhlIG5ld2x5IGNyZWF0ZWQgdGFz
awotICogQHJlZ3M6IENQVSBjb250ZXh0IHRvIGNvcHkgZm9yIHVzZXJzcGFjZSB0aHJlYWQ7IGFs
d2F5cyBOVUxMIGZvciBrdGhyZWFkCiAgKiBAdGxzOiB0aGUgVGhyZWFkIExvY2FsIFN0b3JhZ2Ug
cG9pbnRlciBmb3IgdGhlIG5ldyBwcm9jZXNzCiAgKgogICogQXQgdGhlIHRvcCBvZiBhIG5ld2x5
IGluaXRpYWxpemVkIGtlcm5lbCBzdGFjayBhcmUgdHdvIHN0YWNrZWQgcHRfcmVnCi0tIAoyLjIx
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5S
SVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xp
c3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
