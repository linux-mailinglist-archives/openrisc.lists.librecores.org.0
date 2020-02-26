Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id BEDFE170BFE
	for <lists+openrisc@lfdr.de>; Wed, 26 Feb 2020 23:56:42 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 642952097A;
	Wed, 26 Feb 2020 23:56:42 +0100 (CET)
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by mail.librecores.org (Postfix) with ESMTPS id 2A4A020746
 for <openrisc@lists.librecores.org>; Wed, 26 Feb 2020 23:56:41 +0100 (CET)
Received: by mail-pj1-f67.google.com with SMTP id a18so267328pjs.5
 for <openrisc@lists.librecores.org>; Wed, 26 Feb 2020 14:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YiLNzuKoNpmSSMsekoBiTZOvmxk/Fk1cSyWxPDes24k=;
 b=PkAS2LibF8nGBE7kOw/nIg5UIC/FXMPczwVekRIvfhB7rUBWGMRSlZlf7AO23V/srR
 KljEl2JIt1cw5MbmVoTgOvWNqV1H4wGwWybYAVLukAt0dRTjpY69SQWDJZRJKt5QYcRe
 yNilz1ceMYGPvAjMCyT3+ymLRwiWReWmTinIkLda5XtRsyPgTTCx0Ytp5zPPL8P7yv2m
 HRr86gbdh2Z+08ohUTLaWQo7M7BGAmUjFejZ+SSU7jqYnnHGoUtSyVCsRfSCh4Xz9xe6
 5Jk2ziTv7lFhGJupEv+xeI/IfE7TQld3SWaCZCBiNzRDjoatJS9vtmWpzjAQnZEQCMJz
 Yjeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YiLNzuKoNpmSSMsekoBiTZOvmxk/Fk1cSyWxPDes24k=;
 b=cCaPbwB5Mw7LprdmBpiez1YhvBEkVVYxDHYCiJWfYwvn4KqcV/xw1xbUAZSXKBTvb9
 Rt+zehxJ87cSM+Fvow09dYsFLLMzXwBf2oObjdsxq6UtUqJCdb0eMKfx607zcohYqcTb
 ouxQfiPHtoq0aT4TJaB3uFKb3ciLRBV37hidvIuWRrpSmUtHgba1Jxtu3co/dKAM0OD6
 8hWf7/jggeIt+fYROeQAXQb9yftqgwiMW6hp+Wg9Sa0kKnGbwyPCtXL2vxUgowOg8Y0z
 43ZCMgKMljvt4RuZrUt8ftANcHawkw5w77oB7AkQsNhJGmOvijM0fOlyPhDP55XMt2Dy
 RkGg==
X-Gm-Message-State: APjAAAU6zwj9umJEZxz0qwGiyw/PJEjOZ1Gl2SxbjlJkCjVFI9TU51bp
 K6OMy6YA0N4ScNXTW6kn89w=
X-Google-Smtp-Source: APXvYqxRTsSns9M+laGOofu/n2ZniTZtPLbcngj+wyAad/4XN9eJO6exghhjHFYZNNbFEuAiaKoCEA==
X-Received: by 2002:a17:902:7c88:: with SMTP id
 y8mr1566253pll.321.1582757799580; 
 Wed, 26 Feb 2020 14:56:39 -0800 (PST)
Received: from localhost (g183.222-224-185.ppp.wakwak.ne.jp. [222.224.185.183])
 by smtp.gmail.com with ESMTPSA id m12sm3838889pjf.25.2020.02.26.14.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 14:56:38 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>,
 Openrisc <openrisc@lists.librecores.org>
Date: Thu, 27 Feb 2020 07:56:22 +0900
Message-Id: <20200226225625.28935-1-shorne@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 0/3] OpenRISC clone3 support
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
Cc: Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VGhpcyBzZXJpZXMgZml4ZXMgdGhlIGNsb25lMyBub3QgaW1wbGVtZW50ZWQgd2FybmluZ3MgSSBo
YXZlIGJlZW4gc2VlaW5nCmR1cmluZyByZWNlbnQgYnVpbGRzLiAgSXQgd2FzIGEgc2ltcGxlIGNh
c2Ugb2YgaW1wbGVtZW50aW5nIGNvcHlfdGhyZWFkX3RscwphbmQgdHVybmluZyBvbiBjbG9uZTMg
Z2VuZXJpYyBzdXBwb3J0LiAgVGVzdGluZyBzaG93cyBubyBpc3N1ZXMuCgpTdGFmZm9yZCBIb3Ju
ZSAoMyk6CiAgb3BlbnJpc2M6IENvbnZlcnQgY29weV90aHJlYWQgdG8gY29weV90aHJlYWRfdGxz
CiAgb3BlbnJpc2M6IEVuYWJsZSB0aGUgY2xvbmUzIHN5c2NhbGwKICBvcGVucmlzYzogQ2xlYW51
cCBjb3B5X3RocmVhZF90bHMgZG9jcyBhbmQgY29tbWVudHMKCiBhcmNoL29wZW5yaXNjL0tjb25m
aWcgICAgICAgICAgICAgICAgICAgfCAgMSArCiBhcmNoL29wZW5yaXNjL2luY2x1ZGUvdWFwaS9h
c20vdW5pc3RkLmggfCAgMSArCiBhcmNoL29wZW5yaXNjL2tlcm5lbC9wcm9jZXNzLmMgICAgICAg
ICAgfCAxOSArKysrKysrLS0tLS0tLS0tLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9u
cygrKSwgMTIgZGVsZXRpb25zKC0pCgotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NA
bGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5m
by9vcGVucmlzYwo=
