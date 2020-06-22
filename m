Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id CAA63204C15
	for <lists+openrisc@lfdr.de>; Tue, 23 Jun 2020 10:19:08 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id BD43720857;
	Tue, 23 Jun 2020 10:19:06 +0200 (CEST)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by mail.librecores.org (Postfix) with ESMTPS id 7582A20B31
 for <openrisc@lists.librecores.org>; Mon, 22 Jun 2020 14:11:37 +0200 (CEST)
Received: by mail-ej1-f66.google.com with SMTP id l12so17744916ejn.10
 for <openrisc@lists.librecores.org>; Mon, 22 Jun 2020 05:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Zwilt9vL4hQVp9xstjNnlSMflEMCndqnATlv+WlgaOk=;
 b=uYNoiKQgiqbIFRXqocXZ0XQ5Sgg9QqfrYhCT/KpGOozaG1eU+xKiwLXUXE1twUgJsO
 FlBlEW/EruQMaIP0kHpFsUJSNIOpgtqZZgOwirV1fHoevKw4M6hhCmL21W5ZyhtPsNAI
 41ZTBm+4FMiPuQgtVy0o9pTqm28rGRwUjVr2UigqUAPJtnbQ2bSseVvrp7YYqMvANMud
 QXCqSpViZciAMF+K6kMpk6FL19gqjV6DNNQFChvkMXlQNVQUsDxoaLR+aTChO8zxaEJ9
 8nX1X+hve2JfYwAQzBtrP45rUmWP7DRlKSkBqpjbl8EgvYVmz1IQr+VeohcVp9sdWYUx
 GZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Zwilt9vL4hQVp9xstjNnlSMflEMCndqnATlv+WlgaOk=;
 b=UwxSqmBDdLDO4AEePGj3GO8hUVjScQAHD8dQN2HTvijAj/Ha8d+8kRFvR0bc8Z/I7M
 NM6V7h535h8uc3JRp84vbdsDd5KC4yuq0hV1NyWPuKCJnZBW1vH4NxhilzO/wmRaIEJR
 eu0t3cTnrEg7pvi/k4q82NwkBqXmrUophMwMR/QCWvUPZIPsH4YHVZscBqkvR2QdOqxM
 U6YS4mTX3LurmQibduWpsZ6mkinVncW2SrAfDVzlGaNZdKlDQ4350GKgVh2FoX5jjBD+
 O8cD9rLX4imh2Z+W67ZI5JQDUpW8J7QKN3hfBpPq1iKXWWyDClKBjz4yfuXwM7EPE5mB
 fWOQ==
X-Gm-Message-State: AOAM532jWzW5B9qfcWDFUPDjSlWg/IfHA9k3vLH1GiNRpeEPDXGbUhhG
 KPH2Fe9G5rfXtvD1SGUmhAM=
X-Google-Smtp-Source: ABdhPJyKLq6DZRNFLtGsYdWfeKFkZ6GDdxLaa/HZvqwh0eh0fHf6gb/gYU8cugP51b87cw2PWYryTA==
X-Received: by 2002:a17:906:fcb1:: with SMTP id
 qw17mr1940194ejb.445.1592827897047; 
 Mon, 22 Jun 2020 05:11:37 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:b7f9:7600:c5d2:e67d:372a:5e48])
 by smtp.gmail.com with ESMTPSA id bs1sm12242112edb.43.2020.06.22.05.11.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 05:11:36 -0700 (PDT)
From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To: Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>
Date: Mon, 22 Jun 2020 14:11:24 +0200
Message-Id: <20200622121124.80398-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 23 Jun 2020 10:19:04 +0200
Subject: [OpenRISC] [PATCH] openrisc: fix __user in raw_copy_to_user()'s
 prototype
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
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

cmF3X2NvcHlfdG9fdXNlcigpJ3MgcHJvdG90eXBlIHNlZW1zIHRvIGJlIGEgY29weSAmIHBhc3Rl
IG9mCnJhd19jb3B5X2Zyb21fdXNlcigpIGFuZCBhcyBzdWNoIGhhcyB0aGUgX191c2VyIGFubm90
YXRpb24KaW4gdGhlICdmcm9tJyBhcmd1bWVudCBpbnN0ZWFkIG9mIHRoZSAndG8nLgoKU28sIG1v
dmUgdGhlIF9fdXNlciBhbm5vdGF0aW9uIGluIHRoZSBwcm90b3R5cGUgdG8gdGhlICd0bycuCgpS
ZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+ClNpZ25lZC1vZmYt
Ynk6IEx1YyBWYW4gT29zdGVucnljayA8bHVjLnZhbm9vc3RlbnJ5Y2tAZ21haWwuY29tPgotLS0K
IGFyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vdWFjY2Vzcy5oIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9vcGVu
cmlzYy9pbmNsdWRlL2FzbS91YWNjZXNzLmggYi9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL3Vh
Y2Nlc3MuaAppbmRleCAxN2MyNGYxNDYxNWYuLjQ2ZTMxYmI0YTlhZCAxMDA2NDQKLS0tIGEvYXJj
aC9vcGVucmlzYy9pbmNsdWRlL2FzbS91YWNjZXNzLmgKKysrIGIvYXJjaC9vcGVucmlzYy9pbmNs
dWRlL2FzbS91YWNjZXNzLmgKQEAgLTI0MSw3ICsyNDEsNyBAQCByYXdfY29weV9mcm9tX3VzZXIo
dm9pZCAqdG8sIGNvbnN0IHZvaWQgX191c2VyICpmcm9tLCB1bnNpZ25lZCBsb25nIHNpemUpCiAJ
cmV0dXJuIF9fY29weV90b2Zyb21fdXNlcih0bywgKF9fZm9yY2UgY29uc3Qgdm9pZCAqKWZyb20s
IHNpemUpOwogfQogc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nCi1yYXdfY29weV90b191c2Vy
KHZvaWQgKnRvLCBjb25zdCB2b2lkIF9fdXNlciAqZnJvbSwgdW5zaWduZWQgbG9uZyBzaXplKQor
cmF3X2NvcHlfdG9fdXNlcih2b2lkIF9fdXNlciAqdG8sIGNvbnN0IHZvaWQgKmZyb20sIHVuc2ln
bmVkIGxvbmcgc2l6ZSkKIHsKIAlyZXR1cm4gX19jb3B5X3RvZnJvbV91c2VyKChfX2ZvcmNlIHZv
aWQgKil0bywgZnJvbSwgc2l6ZSk7CiB9Ci0tIAoyLjI3LjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklT
Q0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3Rp
bmZvL29wZW5yaXNjCg==
