Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 0AA92174FF7
	for <lists+openrisc@lfdr.de>; Sun,  1 Mar 2020 22:39:12 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E63ED209A0;
	Sun,  1 Mar 2020 22:39:11 +0100 (CET)
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by mail.librecores.org (Postfix) with ESMTPS id 8CA012099E
 for <openrisc@lists.librecores.org>; Sun,  1 Mar 2020 22:39:10 +0100 (CET)
Received: by mail-pl1-f193.google.com with SMTP id q4so3384997pls.4
 for <openrisc@lists.librecores.org>; Sun, 01 Mar 2020 13:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ukz24jAlVoK0u9xc7RMDLoYCE0uHvE8+KI4d597Q+pU=;
 b=Z5T0pypMoxMHFK5bluFNozMFA/6CAuR/2UvmG/1qUqwCx3nR4vAfJVzZv6DbEBoqZ7
 Ow7cdOQAmoRdJbNdu6Pd7dFMEiWWbl+duldXVGKi9Sj2B1V/5t0Lvitve6qZGhZ+rEiy
 6eDNqWtC/hj1fJzuMe3RmZ2X28tJD5452PdhrDz8HSwcZ+eARtZLQgAL4Pqu3iL6szfe
 3rXbpo9cZguU1O3S9aWxpjug/SDGKE9+l2tAZVbzn6BZ2EnhbQjMorT+NVcX6NNrv1gk
 fVe+tgaiZmagZqkhrfV8GoxUEsUAnV9rI49VFhMB2gXC/R3hw5GdOh65k5cyASfJIYXI
 H8Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ukz24jAlVoK0u9xc7RMDLoYCE0uHvE8+KI4d597Q+pU=;
 b=TWrxabSUg6qICI2EzXFfY1WAhdi2SD2gV2sC3jcnghpQh17zmU83bw3/zkh8xeSVtC
 fxlp0hbAS5Wz8EPOJTseVQdzhbJhNcVWzfD8e9BFmVfTKD+nFyHkvRnDnswHIw6rEv0y
 1IjEAMD4d06WiZvAVAURKElbGwyqlQC4HcOESLZiQ5+5y7vhbDQruRSzvyDHcU9zefuD
 W2Bh0pXbNqVxKn/1BhSKJB0SS1WNlfphZt9DPgg4lhOFXZyXJWPkF7tYaNuMhk4q44+t
 FMkG9A/0NfiqB84KUR1V/Qp2Zwd+BhcVGKY3CgWXgs46r0BzuDgGJGDPXYh+P1MG5KeM
 5v4w==
X-Gm-Message-State: APjAAAXzAJMrn7rwo7mHt5Jhz4ELXiuC9f8CIl84xdQGf25XA48YBt2l
 vv1Fvy3i/Nvpham0mj6oG1OdJFD4
X-Google-Smtp-Source: APXvYqyI+ZiCb7Ygnrtv0KxNcbuOkdAiN6ZDMxzSZwGMOdAOjFZol9+dbuyAgB13LgKHDa/zNXD9dA==
X-Received: by 2002:a17:902:b7c2:: with SMTP id
 v2mr13821886plz.54.1583098749143; 
 Sun, 01 Mar 2020 13:39:09 -0800 (PST)
Received: from localhost (g183.222-224-185.ppp.wakwak.ne.jp. [222.224.185.183])
 by smtp.gmail.com with ESMTPSA id mr7sm5836640pjb.12.2020.03.01.13.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Mar 2020 13:39:08 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Mon,  2 Mar 2020 06:38:50 +0900
Message-Id: <20200301213851.8096-3-shorne@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200301213851.8096-1-shorne@gmail.com>
References: <20200301213851.8096-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v2 2/3] openrisc: Enable the clone3 syscall
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
Cc: Jonas Bonn <jonas@southpole.se>, Openrisc <openrisc@lists.librecores.org>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RW5hYmxlIHRoZSBjbG9uZTMgc3lzY2FsbCBmb3IgT3BlblJJU0MuICBXZSB1c2UgdGhlIGdlbmVy
aWMgdmVyc2lvbi4KClRoaXMgd2FzIHRlc3RlZCB3aXRoIHRoZSBjbG9uZTMgdGVzdCBmcm9tIHNl
bGZ0ZXN0cy4gIE5vdGUsIGZvciBhbGwKdGVzdHMgdG8gcGFzcyBpdCByZXF1aXJlZCBlbmFibGlu
ZyBDT05GSUdfTkFNRVNQQUNFUyB3aGljaCBpcyBub3QKZW5hYmxlZCBpbiB0aGUgZGVmYXVsdCBP
cGVuUklTQyBrZXJuZWwgY29uZmlnLgoKU2lnbmVkLW9mZi1ieTogU3RhZmZvcmQgSG9ybmUgPHNo
b3JuZUBnbWFpbC5jb20+CkFja2VkLWJ5OiBDaHJpc3RpYW4gQnJhdW5lciA8Y2hyaXN0aWFuLmJy
YXVuZXJAdWJ1bnR1LmNvbT4KLS0tCiBhcmNoL29wZW5yaXNjL2luY2x1ZGUvdWFwaS9hc20vdW5p
c3RkLmggfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBh
L2FyY2gvb3BlbnJpc2MvaW5jbHVkZS91YXBpL2FzbS91bmlzdGQuaCBiL2FyY2gvb3BlbnJpc2Mv
aW5jbHVkZS91YXBpL2FzbS91bmlzdGQuaAppbmRleCA1NjZmOGM0ZjgwNDcuLmZhZTM0YzYwZmE4
OCAxMDA2NDQKLS0tIGEvYXJjaC9vcGVucmlzYy9pbmNsdWRlL3VhcGkvYXNtL3VuaXN0ZC5oCisr
KyBiL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS91YXBpL2FzbS91bmlzdGQuaApAQCAtMjQsNiArMjQs
NyBAQAogI2RlZmluZSBfX0FSQ0hfV0FOVF9TRVRfR0VUX1JMSU1JVAogI2RlZmluZSBfX0FSQ0hf
V0FOVF9TWVNfRk9SSwogI2RlZmluZSBfX0FSQ0hfV0FOVF9TWVNfQ0xPTkUKKyNkZWZpbmUgX19B
UkNIX1dBTlRfU1lTX0NMT05FMwogI2RlZmluZSBfX0FSQ0hfV0FOVF9USU1FMzJfU1lTQ0FMTFMK
IAogI2luY2x1ZGUgPGFzbS1nZW5lcmljL3VuaXN0ZC5oPgotLSAKMi4yMS4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxp
c3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVz
Lm9yZy9saXN0aW5mby9vcGVucmlzYwo=
