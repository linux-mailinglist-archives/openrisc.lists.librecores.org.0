Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 6A63B4A4860
	for <lists+openrisc@lfdr.de>; Mon, 31 Jan 2022 14:38:21 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 0E790247DB;
	Mon, 31 Jan 2022 14:38:21 +0100 (CET)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mail.librecores.org (Postfix) with ESMTPS id 39A0B242E8
 for <openrisc@lists.librecores.org>; Mon, 31 Jan 2022 14:38:20 +0100 (CET)
Received: by mail-pj1-f49.google.com with SMTP id r59so14065648pjg.4
 for <openrisc@lists.librecores.org>; Mon, 31 Jan 2022 05:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x/K+F52w2BErx+IjTpBaAmIyz1YSpEe2UQiKHBDQPGs=;
 b=NSIJ8deuZfF4STKDyHYwaMRN0k2QlvRla7qojqV2HmhicpnlPIm+cRy4Gm0AUGA/FZ
 kNALLJvzNeeLBdvJZKET5NpFV0FF3hmACUO4tlHDFjLRZH0zM4/kWSeGqvxzrZUcdeIC
 9I/Zm6iWPQIeJ1A3j19icVz2h7maeaf/9rM4QrZGm1akAB6AsmcqCqSFmIQjueJWyRTs
 MsxvPoEvGgqEWHcgRoffyfIcn71wXV4H8Rw2v4RhaUKrbLSnNw8yqWvp8+iHu/HkD/GH
 ZKXRvta9qex7uD0W/gxRNA0ldIKAK3P7RYfLw744/M9Msz4dzSCKXB76s12D813xJAIX
 9M+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x/K+F52w2BErx+IjTpBaAmIyz1YSpEe2UQiKHBDQPGs=;
 b=gumpMdDQOL+VR5mpJ+7Gs78tTpX9mL3YootIZKi5s0DJH62wOG7+NQKjYoIEM72avU
 w5nyxJGbCtynG5clf8/jcUDUj56ginIAGO6WEVBpmth5CXTJCudHau43o4wvdICrqlKp
 Rd0PWmp37BHyYvulM9b9h+XQWnp7y8yuTaqyxxzf4d3esbKBpmJhgB5HpwQaFgqFXgmA
 j5zEaAwie+jtu8M974cmwSrn4QYBkx0gDJlmej5xnHOR0GMDVfEUbhcZdod3qXBap7rW
 7vVgM45XzSxJODJSa+CFsYfIz3mfA2iL9CL9EUmbMkjZLoCknHdec/IMnp+eQEsnXj2W
 DDSw==
X-Gm-Message-State: AOAM531Xm9B0SIdAd36YZCXSb4/fekVgijWEIW/++OiC/9eK19uzdUsR
 M36rhF39a7ZIls6jaOKp04Y=
X-Google-Smtp-Source: ABdhPJzgIYyF5PgIn6yzVvrGSSmP9Y+EB7uVu8SE/7Name7zPY21j7CtXZ7jiCRSuWojtiG0Aizo2w==
X-Received: by 2002:a17:902:70cb:: with SMTP id
 l11mr20611189plt.128.1643636298398; 
 Mon, 31 Jan 2022 05:38:18 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id q15sm11464306pjj.19.2022.01.31.05.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 05:38:17 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: GCC patches <gcc-patches@gcc.gnu.org>
Date: Mon, 31 Jan 2022 22:38:13 +0900
Message-Id: <20220131133813.1142801-1-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH] gcc: define _REENTRANT for OpenRISC when
 -pthread is passed
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogQmVybmQgS3VobHMgPGJlcm5kLmt1aGxzQHQtb25saW5lLmRlPgoKVGhlIGRldGVjdGlv
biBvZiBwdGhyZWFkIHN1cHBvcnQgZmFpbHMgb24gT3BlblJJU0MgdW5sZXNzIF9SRUVOVFJBTlQK
aXMgZGVmaW5lZC4gQWRkZWQgdGhlIENQUF9TUEVDIGRlZmluaXRpb24gdG8gY29ycmVjdCB0aGlz
LgoKZ2NjL0NoYW5nZUxvZzoKCglQUiB0YXJnZXQvOTQzNzIKCSogY29uZmlnL29yMWsvbGludXgu
aCAoQ1BQX1NQRUMpOiBEZWZpbmUuCgpTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmQu
a3VobHNAdC1vbmxpbmUuZGU+Ci0tLQpUaGlzIHdhcyBicm91Z2h0IHVwIG9uIHRoZSBidWlsZHJv
b3QgbGlzdCBhbmQgc29tZWhvdyBJIG1pc3NlZCBpdC4gIFNlbmRpbmcgaXQKbm93LiAgSSBwbGFu
IHRvIGNvbW1pdCBzb29uLgoKIGdjYy9jb25maWcvb3Ixay9saW51eC5oIHwgMiArKwogMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2djYy9jb25maWcvb3Ixay9s
aW51eC5oIGIvZ2NjL2NvbmZpZy9vcjFrL2xpbnV4LmgKaW5kZXggNTI5MDlhZjQxYTYuLjgwZjc3
YzcyMjMyIDEwMDY0NAotLS0gYS9nY2MvY29uZmlnL29yMWsvbGludXguaAorKysgYi9nY2MvY29u
ZmlnL29yMWsvbGludXguaApAQCAtMzIsNiArMzIsOCBAQAogI3VuZGVmIE1VU0xfRFlOQU1JQ19M
SU5LRVIKICNkZWZpbmUgTVVTTF9EWU5BTUlDX0xJTktFUiAgIi9saWIvbGQtbXVzbC1vcjFrLnNv
LjEiCiAKKyNkZWZpbmUgQ1BQX1NQRUMgIiV7cHRocmVhZDotRF9SRUVOVFJBTlR9IgorCiAjdW5k
ZWYgTElOS19TUEVDCiAjZGVmaW5lIExJTktfU1BFQyAiJXtoKn0JCQlcCiAgICAle3N0YXRpYzot
QnN0YXRpY30JCQkJXAotLSAKMi4zMS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGli
cmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlz
Ywo=
