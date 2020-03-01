Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id EEF64174FF4
	for <lists+openrisc@lfdr.de>; Sun,  1 Mar 2020 22:39:04 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8A6B72099D;
	Sun,  1 Mar 2020 22:39:04 +0100 (CET)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by mail.librecores.org (Postfix) with ESMTPS id 08E592089B
 for <openrisc@lists.librecores.org>; Sun,  1 Mar 2020 22:39:03 +0100 (CET)
Received: by mail-pg1-f195.google.com with SMTP id d9so4390553pgu.3
 for <openrisc@lists.librecores.org>; Sun, 01 Mar 2020 13:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O6rBcEU/hFHZ/nVMjMstNChyJKPo0QHS5wUjjviEgtw=;
 b=UZp+ZjEs92XsTaviuP18FzsJR+VZ112lgNxLw2CWe6X5MOTmpucNyLP3bC8FUdF/vC
 teiz0nwKugmASxfHEGV8Gbioho6+Uc5cV/CrLrvHvqbcH/eLp3rlCGChffbwcSBLUZy7
 Xi5aYBzc3If6cXi7WY77UkNq2gwymv1euA6wKKnpF7DVVPnMkZKyUmxZ24cLIhpmcvKn
 ZQhEp0hOPacY5Ww+jzDuXX//nlZYFhaxB9/66v5XEKhfyKvQKFxDcmEJyBee93+vwhbC
 ZmemkGDIbkPl5rU8ni8I1hkoXI0mg974rhNuGzp8wGZRraaDxFLM7um+wReKr48mMiKn
 G/IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O6rBcEU/hFHZ/nVMjMstNChyJKPo0QHS5wUjjviEgtw=;
 b=WFkm8Jr4vvjXatH6eu/UxfwssAXrL+ZeDUd5Hko4t+Vf6K61MKnkf1YhE2gES98yIa
 tHAaR7UJa+m/F/GVsc1pdzCElyl1wLSdkuxioBy5s4QX3kcxap9ZBuF/EXuuJ2iUyqFD
 t7+PPLmSxIh8og3HWAAbvOT/2ly8iYfC4PWjSSrr8+EJkJI7Rp2THDVyuvLKLDZJRLzC
 UA32s23J7t0p9jlg2puV1q8bAK2qGW6pG5zKDVgfRSHFmbXYafbROrXbxKShhSW0vJj+
 UZfmEet/82CCLKh1hO5qCcMLh7K1eiuKE1bqN1rhuYp+2wyBIbCzh2OWOcvxXgI3BY+A
 oPOQ==
X-Gm-Message-State: APjAAAUH3Vcye2X6k7jSvdBoNkH+CEXZThEVEyK2YQ6DZawg7ezdY+oV
 iihZVVK8MczV0ECy0HUaDpI=
X-Google-Smtp-Source: APXvYqxzBeecIJ7TyrW8VqK0wUx5HBpQoCJ4E8Sgc1F4GZVHHBW75XU7SCjoxpPmaDFqOkFHoGNB+A==
X-Received: by 2002:a63:7b18:: with SMTP id w24mr13002741pgc.22.1583098741224; 
 Sun, 01 Mar 2020 13:39:01 -0800 (PST)
Received: from localhost (g183.222-224-185.ppp.wakwak.ne.jp. [222.224.185.183])
 by smtp.gmail.com with ESMTPSA id h10sm18181632pfo.181.2020.03.01.13.38.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Mar 2020 13:39:00 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Mon,  2 Mar 2020 06:38:48 +0900
Message-Id: <20200301213851.8096-1-shorne@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v2 0/3] OpenRISC clone3 support
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
Cc: Openrisc <openrisc@lists.librecores.org>,
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VGhpcyBzZXJpZXMgZml4ZXMgdGhlIGNsb25lMyBub3QgaW1wbGVtZW50ZWQgd2FybmluZ3MgSSBo
YXZlIGJlZW4gc2VlaW5nCmR1cmluZyByZWNlbnQgYnVpbGRzLiAgSXQgd2FzIGEgc2ltcGxlIGNh
c2Ugb2YgaW1wbGVtZW50aW5nIGNvcHlfdGhyZWFkX3RscwphbmQgdHVybmluZyBvbiBjbG9uZTMg
Z2VuZXJpYyBzdXBwb3J0LiAgVGVzdGluZyBzaG93cyBubyBpc3N1ZXMuCgpDaGFuZ2VzIHNpbmNl
IHYxOgoKIC0gRml4IHNvbWUgY29tbWVudHMgcG9pbnRlZCBvdXQgaW4gcmV2aWV3cwogLSBBZGQg
QWNrcyB0byAyLzMgYW5kIDMvMyBmcm9tIENocmlzdGlhbiBCcmF1bmVyCgpTdGFmZm9yZCBIb3Ju
ZSAoMyk6CiAgb3BlbnJpc2M6IENvbnZlcnQgY29weV90aHJlYWQgdG8gY29weV90aHJlYWRfdGxz
CiAgb3BlbnJpc2M6IEVuYWJsZSB0aGUgY2xvbmUzIHN5c2NhbGwKICBvcGVucmlzYzogQ2xlYW51
cCBjb3B5X3RocmVhZF90bHMgZG9jcyBhbmQgY29tbWVudHMKCiBhcmNoL29wZW5yaXNjL0tjb25m
aWcgICAgICAgICAgICAgICAgICAgfCAgMSArCiBhcmNoL29wZW5yaXNjL2luY2x1ZGUvdWFwaS9h
c20vdW5pc3RkLmggfCAgMSArCiBhcmNoL29wZW5yaXNjL2tlcm5lbC9wcm9jZXNzLmMgICAgICAg
ICAgfCAxOCArKysrKystLS0tLS0tLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25z
KCspLCAxMiBkZWxldGlvbnMoLSkKCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0Bs
aXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZv
L29wZW5yaXNjCg==
