Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id ABFF31D3F71
	for <lists+openrisc@lfdr.de>; Thu, 14 May 2020 23:00:28 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6189C20AF2;
	Thu, 14 May 2020 23:00:28 +0200 (CEST)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by mail.librecores.org (Postfix) with ESMTPS id DB15520937
 for <openrisc@lists.librecores.org>; Thu, 14 May 2020 23:00:25 +0200 (CEST)
Received: by mail-pg1-f195.google.com with SMTP id t11so1801200pgg.2
 for <openrisc@lists.librecores.org>; Thu, 14 May 2020 14:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K7WDGBoBnbJ8NB/YQA4u46n0+ZA7kuD/5b/88zGa9hM=;
 b=FD7oBM2chIjHLicxyft8pmX5IRzCt5idhEB0OVqwdso7hDVs7BS3xkhEtB4opl/dZ0
 e3ay4ZE87MGmHTgjU/5OtRl2zRmsLDbKGCY9gpyapZ0TPGFDF0kxL59bmy5I//Qz/MFJ
 y8isIJ4NF9M8O4KMMAM8bX/iaCVNyfT6qDl7VO8tOiXh1bqu2IC06FS6v7Yxunw5TC2N
 tdueXnopidY0J+cF8vqe6PttHwPa3vCEuTQ4cfijHFD4qi12W3Ji8/RaCwG18l/L91yO
 266b4hyJQkf9dqjg9u+WMIVAVZXgdBZipaJbbgXxjPNWR52UHAQsVC/ZEZKFWhgjsSTW
 Dp2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K7WDGBoBnbJ8NB/YQA4u46n0+ZA7kuD/5b/88zGa9hM=;
 b=nzerG2FXlHynkEFxlV00/MBNbN92rcXPCdQcKisLbaVJTHNQnpm+aXT2kNg7CU3uGS
 J4Rk5CS8CJsRcJ9wa+hPtlbz2KM0/tR4MwESZFKqp1lVxZMzQnDpdBI2h32uoNMRw7zy
 QSzy1yQcKyJM5j9DRxtODen7jtHO61sHCDTe/rHJCb00YyY8ziCRJrHrE6r9eXgaxcpI
 THNGtJyibZbOBz2eo8+/VTivvwhUOUVNBwIsrkSzXB/NC6qFbIdaxV1cp/dIkQifDsC/
 8PRL92Ukq6dFdbZwQtI5FpD5YuA0ZOhrDpvZUlMTYXBFrqF7CppY8IwY5hcxnG+3FKm6
 zKOg==
X-Gm-Message-State: AOAM5331O4IbtY1QlgrA1Hr7FqVZyCKX52/68JiulWjZ5fDW2YlXqSzV
 Xr5xd0Bh5JLY1qUSRlgr3A0=
X-Google-Smtp-Source: ABdhPJxPAFCGg6he8b+dLhNzTkVj7qxs4V1eEOzkVsU441YJpNHnftX4+dgbJgk70jniO+eUjo88dQ==
X-Received: by 2002:a62:1657:: with SMTP id 84mr402581pfw.51.1589490023936;
 Thu, 14 May 2020 14:00:23 -0700 (PDT)
Received: from localhost (g216.222-224-245.ppp.wakwak.ne.jp. [222.224.245.216])
 by smtp.gmail.com with ESMTPSA id cx11sm2837667pjb.36.2020.05.14.14.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 14:00:22 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: GNU Binutils <binutils@sourceware.org>
Date: Fri, 15 May 2020 06:00:10 +0900
Message-Id: <20200514210018.2749462-1-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 0/8] OpenRISC BFD fixups for Glibc
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

SGVsbG8sCgpJIGFtIGN1cnJlbnRseSB3b3JraW5nIG9uIHRoZSBnbGliYyBwb3J0IGZvciBvcGVu
cmlzYyBhbmQgZHVyaW5nIHRlc3RpbmcKdGhlIGdsaWJjIHRlc3RzdWl0ZSB3ZSB1bmNvdmVyZWQg
c2V2ZXJhbCBpc3N1ZXMgd2l0aCB0aGUgT3BlblJJU0MgYmZkCmltcGxlbWVudGF0aW9uIHJlbGF0
aW5nIHRvIFRMUyByZWxvY2F0aW9ucy4gIFRoaXMgc2VyaWVzIGZpeGVzIHRoZW0gYWxsLgoKLVN0
YWZmb3JkCgpTdGFmZm9yZCBIb3JuZSAoOCk6CiAgb3IxazogRml4IHN0YXRpYyBsaW5raW5nIHdo
ZW4gd2l0aCAucmVsYS5nb3QgcmVsb2NhdGlvbnMKICBvcjFrOiBGaXggZHluYW1pYyBUTFMgc3lt
Ym9sIGZsYWcKICBvcjFrOiBBZGQgVExTIG1hc2sgdG8gaGFuZGxlIG11bHRpcGxlIG1vZGVsIGFj
Y2VzcwogIG9yMWs6IEZpeCBpc3N1ZSB3aXRoIG11bHRpcGxlIFBDUkVMIHJlbG9jYXRpb25zCiAg
b3IxazogVExTIG9mZnNldCB0byB1c2UgdGNiIHNpemUgYW5kIHNlY3Rpb24gYWxpZ25tZW50CiAg
b3IxazogcmVmYWN0b3I6IFJlbmFtZSBwIHRvIHNlY19yZWxvY3MKICBvcjFrOiByZWZhY3Rvcjog
UmVuYW1lIHMgdG8gc2dvdCBhbmQgc3BsdAogIG9yMWs6IEFkZCBkeW5hbWljIGZsYWcgdG8gdHBv
ZmYKCiBiZmQvZWxmMzItb3Ixay5jIHwgMzY4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjM2IGluc2VydGlvbnMoKyksIDEz
MiBkZWxldGlvbnMoLSkKCi0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5s
aWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5y
aXNjCg==
