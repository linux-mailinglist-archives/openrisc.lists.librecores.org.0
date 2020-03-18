Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 740F8189CB2
	for <lists+openrisc@lfdr.de>; Wed, 18 Mar 2020 14:17:12 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1F5A520A49;
	Wed, 18 Mar 2020 14:17:12 +0100 (CET)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by mail.librecores.org (Postfix) with ESMTPS id A3F0B20A57
 for <openrisc@lists.librecores.org>; Wed, 18 Mar 2020 14:17:09 +0100 (CET)
Received: by mail-pg1-f193.google.com with SMTP id m15so13662696pgv.12
 for <openrisc@lists.librecores.org>; Wed, 18 Mar 2020 06:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2+U35ps0aH14e4QA9fUiYELl4BDn2bd+PIQVIun5WPY=;
 b=h0nSr2tSTlQIXvitLaXqVjVhyptb+pIh5uW38ibDY+gEeDJbqjb/cQfml6h4ZIAHD4
 hVC+EwORVwMojzkyIVXx+tZ7/5kaIne4/j5EMLj0Iy8a/WiQbvuhK4QiBnqJZ5k/hE3u
 1nBXP5KVIo+8UyJmEyT9j9rs5xk6v/cm2lLWaklmUJi0yR2gEUkCJ0N90Ulq0taAyLsK
 85nn1cHmsO4JHOfO5A24RK+NPCG+Qb2Pn4pxR43FrlFBJUja2GOAHo6wr35UcbBv0Qvp
 urZlq7OjYIQhF+ipvHtuVpmug77wR3pPODyGaaNV5TKhAR/QOBQwNQyyOLxCnM6OQT1o
 bSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2+U35ps0aH14e4QA9fUiYELl4BDn2bd+PIQVIun5WPY=;
 b=iajLIkaaQ/0CZzjLWppjkp6wMBMOpe4qyt56OWt+EcOpoxKvOnIU+G1P+APzpKTy88
 WmVy10EAkV2PwKwZJ9tXwdiKIQrB8cdXVT7cF8jQJLvTvYjTpXKfQoBdXNtSele9BZ2S
 q9uF2ASNAatHiluV45IRNcGWiELuF5PROo1J4GTVmYK8D6myaOflBpE5oqv3b2Re76GH
 jFbh4obF3yq+oFAwma3udc7OYqAMfPo1rDq9jo77loTqzmm7hKzPIaX4FPOs4a/ASkwY
 7KBFb4oI7le/CY2P/vFzz6KyM9xRLPIms2nmzxTFMClAJUEUsJyCABlrLHlbqtbUtZ6t
 HCGQ==
X-Gm-Message-State: ANhLgQ0MQPizqrAyaJkuHPM28cX+9TGFOTjyUonE5Y+73X5qrqKR71Dw
 A15TD09T3dtiM2EwEW22zCA=
X-Google-Smtp-Source: ADFU+vsTr5Mjb/W9VzG8oSt1VbdU5m6ZOzenwBs8ZuyKA6uu35mje+fFq/dhhtuMH/VVdatIUgYC1g==
X-Received: by 2002:a63:375b:: with SMTP id g27mr4528506pgn.151.1584537428184; 
 Wed, 18 Mar 2020 06:17:08 -0700 (PDT)
Received: from localhost (g44.115-65-203.ppp.wakwak.ne.jp. [115.65.203.44])
 by smtp.gmail.com with ESMTPSA id q20sm6573937pfh.89.2020.03.18.06.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 06:17:07 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Wed, 18 Mar 2020 22:17:02 +0900
Message-Id: <20200318131703.17601-1-shorne@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH] openrisc: Remove obsolete show_trace_task
 function
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openrisc@lists.librecores.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VGhlIGZ1bmN0aW9uIHNob3dfdHJhY2VfdGFzaygpIHdhcyByZW1vdmVkIGR1cmluZyBsaW51eCAy
LjUgZGV2ZWxvcG1lbnQKYW5kIHJlcGxhY2VkIHdpdGggc2hvd19zdGFjaygpLiAgVGhpcyB3YXMg
bmV2ZXIgaW1wZW1lbnRlZCBmb3Igb3BlbnJpc2MKYnV0IG11c3QgaGF2ZSBnb3QgaW4gdmlhIGNv
cHlpbmcgZnJvbSBhbm90aGVyIGFyY2hpdGVjdHVyZS4gIEp1c3QgcmVtb3ZlCml0LgoKU2lnbmVk
LW9mZi1ieTogU3RhZmZvcmQgSG9ybmUgPHNob3JuZUBnbWFpbC5jb20+Ci0tLQogYXJjaC9vcGVu
cmlzYy9rZXJuZWwvdHJhcHMuYyB8IDcgLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDcgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9rZXJuZWwvdHJhcHMuYyBiL2FyY2gv
b3BlbnJpc2Mva2VybmVsL3RyYXBzLmMKaW5kZXggOTMyYThlYzJiNTIwLi5jMTFhYTJlMTdjZTAg
MTAwNjQ0Ci0tLSBhL2FyY2gvb3BlbnJpc2Mva2VybmVsL3RyYXBzLmMKKysrIGIvYXJjaC9vcGVu
cmlzYy9rZXJuZWwvdHJhcHMuYwpAQCAtNTUsMTMgKzU1LDYgQEAgdm9pZCBzaG93X3N0YWNrKHN0
cnVjdCB0YXNrX3N0cnVjdCAqdGFzaywgdW5zaWduZWQgbG9uZyAqZXNwKQogCXVud2luZF9zdGFj
ayhOVUxMLCBlc3AsIHByaW50X3RyYWNlKTsKIH0KIAotdm9pZCBzaG93X3RyYWNlX3Rhc2soc3Ry
dWN0IHRhc2tfc3RydWN0ICp0c2spCi17Ci0JLyoKLQkgKiBUT0RPOiBTeXNScS1UIHRyYWNlIGR1
bXAuLi4KLQkgKi8KLX0KLQogdm9pZCBzaG93X3JlZ2lzdGVycyhzdHJ1Y3QgcHRfcmVncyAqcmVn
cykKIHsKIAlpbnQgaTsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxp
YnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJp
c2MK
