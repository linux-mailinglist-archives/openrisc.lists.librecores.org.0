Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 453121DA2DB
	for <lists+openrisc@lfdr.de>; Tue, 19 May 2020 22:38:12 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B893120B75;
	Tue, 19 May 2020 22:38:11 +0200 (CEST)
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by mail.librecores.org (Postfix) with ESMTPS id 92D6820B6C
 for <openrisc@lists.librecores.org>; Tue, 19 May 2020 22:38:09 +0200 (CEST)
Received: by mail-pl1-f193.google.com with SMTP id m7so368129plt.5
 for <openrisc@lists.librecores.org>; Tue, 19 May 2020 13:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gfxGPEjr34vpm5X1M6ie/viSgxG/9Iw/OIcNon4bB7s=;
 b=ROBoU7NmFKPDAU1Hv/+F5yQaHXk9OgdibCwkByX6wnrxxCj/BwTaJiB+JwzVYwfZh0
 mKQtmNUXZXts28g89gUDA/CeIfuzYPkc5oYIxZyWepnpyDSHfct4FDqVXiwdQDX4RF0J
 Tr5ZJ6MtdAobJ6guGmwWAtaR0HPLAUhJg4jYt95is6JI2RFrd8s/uvZ1vnRhGUlSRzVr
 Vc7Qy60PROxF2BmjDvXT2A9HImiHZ5pCOeyUxG/eCF6iBsr9Fra+6pB1ifrqxsZNdNPr
 ktfTIJoI5xTgfyQVWAmZ9q1+B7dHdaShXbiLnUNM88cO6SRcZh1986A4qzawRtVPX+QS
 s92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gfxGPEjr34vpm5X1M6ie/viSgxG/9Iw/OIcNon4bB7s=;
 b=H2wJ/EyFWwHtVGwEo8HHCZL9hyezpffyjiodkGjdn6OW+jUKrGyYU8n3Fp3uBCj30h
 421a7tkWsyyEVcfRJw8oVpFjzK+qol4dooxh3LACX1CyJdn6K8Kwd3uCoB6tI+k+D+gm
 Sq8+7JGqevynHurgE+5eKzm8PGhXyk7zW7KOMCPN/nOTr+6D19yQyn+mPsgMx7FcEPj2
 5Ne/GknsPccO+cqfKiF+QW2lPyqpim/9iyqTKtXX6amnRGEPgT6IEz2hP+6VoWs4ERO4
 D1XhdpBFlPw3NcLbaBTAt/DuvOzo5u77uAYBpB2ADHdp1mR4fFlV+4qjCOPhLe9ucgnu
 hRVQ==
X-Gm-Message-State: AOAM532Wotm+xRW8iGgvTCx7f9u4+GK3oxhUNvOjlzKuHbvxgbAUnm/6
 gI3gdrFJp7BF1IFQAiD7HSE=
X-Google-Smtp-Source: ABdhPJyncBqEcyX2cmDTle00a2kU4gapEMazBJP8b4kPOu/o9HWsxJtUU1d5EkI5npOw2/sJ4fQknQ==
X-Received: by 2002:a17:902:c214:: with SMTP id
 20mr454997pll.205.1589920687514; 
 Tue, 19 May 2020 13:38:07 -0700 (PDT)
Received: from localhost (g216.222-224-245.ppp.wakwak.ne.jp. [222.224.245.216])
 by smtp.gmail.com with ESMTPSA id o190sm276334pfb.178.2020.05.19.13.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 13:38:06 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: GCC patches <gcc-patches@gcc.gnu.org>
Date: Wed, 20 May 2020 05:37:45 +0900
Message-Id: <20200519203750.401593-1-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 0/5] OpenRISC GCC Fixes for Glibc Support
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
Cc: Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGVsbG8sCgpJIGFtIGN1cnJlbnRseSB3b3JraW5nIG9uIHRoZSBnbGliYyBwb3J0IGZvciBPcGVu
UklTQy4gIFRoaXMgaXMgYSBzZXJpZXMgb2YKcGF0Y2hlcyB0aGF0IGZpeCBpc3N1ZXMgYW5kIGFk
ZCBmZWF0dXJlcyB0aGF0IHdlcmUgbWlzc2luZyBpbiBHQ0MgY2F1c2luZyBnbGliYwp0ZXN0c3Vp
dGUgZmFpbHVyZXMuCgpQcmV0dHkgbXVjaCBhbGwgb2YgdGhlc2UgY2hhbmdlcyBhcmUganVzdCBh
ZGRpbmcgbWFjcm9zLgoKVGhlc2UgY2hhbmdlcyBoYXZlIGJlZW4gdGVzdGVkIHZpYSB0aGUgZ2xp
YmMgdGVzdCBzdWl0ZS4KCi1TdGFmZm9yZAoKU3RhZmZvcmQgSG9ybmUgKDUpOgogIG9yMWs6IElt
cGxlbWVudCBwcm9maWxlIGhvb2sgY2FsbGluZyBfbWNvdW50CiAgb3IxazogQWRkIGJ1aWx0aW4g
ZGVmaW5lIHRvIGRldGVjdCBoYXJkIGZsb2F0CiAgb3IxazogU3VwcG9ydCBmb3Igc29mdGZsb2F0
IHRvIGVtdWxhdGUgaHcgZXhjZXB0aW9ucwogIG9yMWs6IEFkZCBub3RlIHRvIGluZGljYXRlIGV4
ZWNzdGFjawogIG9yMWs6IEZpeHVwIGV4Y2VwdGlvbiBoZWFkZXIgZGF0YSBlbmNvZGluZ3MKCiBn
Y2MvY29uZmlnL29yMWsvbGludXguaCAgICAgICAgICB8ICAyICsrCiBnY2MvY29uZmlnL29yMWsv
b3Ixay5oICAgICAgICAgICB8IDIxICsrKysrKysrKysrKysrLS0KIGxpYmdjYy9jb25maWcvb3Ix
ay9zZnAtbWFjaGluZS5oIHwgNDEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KIDMg
ZmlsZXMgY2hhbmdlZCwgNjEgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCi0tIAoyLjI2
LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5S
SVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xp
c3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
