Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 61DAB4362A4
	for <lists+openrisc@lfdr.de>; Thu, 21 Oct 2021 15:19:07 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id F1B14240FB;
	Thu, 21 Oct 2021 15:19:06 +0200 (CEST)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mail.librecores.org (Postfix) with ESMTPS id 692B120DE0
 for <openrisc@lists.librecores.org>; Thu, 21 Oct 2021 15:19:05 +0200 (CEST)
Received: by mail-pj1-f54.google.com with SMTP id np13so480228pjb.4
 for <openrisc@lists.librecores.org>; Thu, 21 Oct 2021 06:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bkzrR4C9D+ptNN1SrBsxzq9Y3/AJg0+RdvF12jOJ3Ps=;
 b=aEYdW8zMzrPYOBfqlfsO3PVKyqnEothMp/19qzhL/78P30eTX6d65gIDKrYtpb6jDT
 27iHwmWLxXfK8acFM4PdaUFn0BBN3Tvlf1razsG+LD/hvUq7WThgZ/kcBn4e/jtccZ19
 CS45T75REjkC7vZrxMogqy+lbrlyg5mXq477R+oNu+IZwxQqYdadqu27n+9JPOMjyxb3
 YIwaLpbScMkBSg+leB7YKTluMRwc8afn7uKRJcsWfG7itgnX87P6nUpvECoO44bGnmSP
 C8HY56N5j5Asws6EcSTUjJXDbq8tEELJQaeTxKRFIKvXspRxe9ccmRU7bkFaAftBP9h4
 +B/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bkzrR4C9D+ptNN1SrBsxzq9Y3/AJg0+RdvF12jOJ3Ps=;
 b=IAAhf1H/qG56Mj4B4ZBYt9eWfRVPTv1oPXoxCc3afVcTB9z4YbqcEz0btLhClpRqPw
 ObrJqkhS196/UYhvGV6ru+ItZZKpTdFQxaorCbBpzR+MmADG1L6vqiw+hqMftupSgbeo
 iH38uhYIVCJlo7CyrUex3RWLHydzvK1G7jtNhT8PTOJDABLY3PBDz6X+q2UxrqNjxFJs
 NenU3uxkV4XHWck/Bth/Cim91acrOZeQoWFeUxI70Zz6DlqlQ7n5osA4/9fisVhFjyvX
 D72UhxUrPTl1rr1eu7AJMcBpkPsVdB8PO49xzHSxR2QUAZTutmzWGa0LeDsTc5Ox+iY6
 xI8w==
X-Gm-Message-State: AOAM533kJrZDtClJGa/6IV6prswVgxdvUzQMYzpqrJOcdTpvmwnpwjPA
 pmcSF/gE+rg+9SLvb63ubsA=
X-Google-Smtp-Source: ABdhPJy3//+xLrMcOI4iWbbJsjZN00yySKdorLRWjo1ghsWWhJghkz+hrdh8Umw/h7R2/YT73mbltg==
X-Received: by 2002:a17:90b:4ac9:: with SMTP id
 mh9mr6736204pjb.173.1634822343736; 
 Thu, 21 Oct 2021 06:19:03 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id o4sm6072689pfb.48.2021.10.21.06.19.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 06:19:03 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: GCC patches <gcc-patches@gcc.gnu.org>
Date: Thu, 21 Oct 2021 22:18:59 +0900
Message-Id: <20211021131859.1065675-1-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH] or1k: Update FPU to specify detect tininess
 before rounding
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

VGhpcyB3YXMgbm90IGRlZmluZWQgaW4gdGhlIHNwZWMgYW5kIG5vdCBjb25zaXN0ZW50IGluIHRo
ZQppbXBsZW1lbnRhdGlvbiBjYXVzaW5nIGluY29zaXN0ZW50IGJlaGF2aW9yLiAgQWZ0ZXIgcmV2
aWV3IHdlIGhhdmUKdXBkYXRlZCB0aGUgQ1BVIGltcGxlbWVudGF0aW9ucyBhbmQgcHJvcG9zZWQg
dGhlIHNwZWMgYmUgdXBkYXRlZCB0bwpzcGVjaWZpYyB0aGF0IEZQVSB0aW5pbmVzcyBjaGVja3Mg
Y2hlY2sgZm9yIHRpbmluZXNzIGJlZm9yZSByb3VkbmluZy4KCkFyY2hpdGVjdHVyZSBjaGFuZ2Ug
ZHJhZnQ6CgoJaHR0cHM6Ly9vcGVucmlzYy5pby9wcm9wb3NhbHMvcDE4LWZwdS10aW5pbmVzcwoK
bGliZ2NjL0NoYW5nZUxvZzoKCgkqIGNvbmZpZy9vcjFrL3NmcC1tYWNoaW5lLmggKF9GUF9USU5J
TkVTU19BRlRFUl9ST1VORElORyk6CglDaGFuZ2UgdG8gMC4KLS0tCiBsaWJnY2MvY29uZmlnL29y
MWsvc2ZwLW1hY2hpbmUuaCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2xpYmdjYy9jb25maWcvb3Ixay9zZnAtbWFjaGlu
ZS5oIGIvbGliZ2NjL2NvbmZpZy9vcjFrL3NmcC1tYWNoaW5lLmgKaW5kZXggZWViZTViMDU3OGUu
LjE2MmM2YmM1MzI2IDEwMDY0NAotLS0gYS9saWJnY2MvY29uZmlnL29yMWsvc2ZwLW1hY2hpbmUu
aAorKysgYi9saWJnY2MvY29uZmlnL29yMWsvc2ZwLW1hY2hpbmUuaApAQCAtODUsNyArODUsNyBA
QCBkbyB7CQkJCQkJCQlcCiAKICNkZWZpbmUgX19CWVRFX09SREVSIF9fQklHX0VORElBTgogCi0j
ZGVmaW5lIF9GUF9USU5JTkVTU19BRlRFUl9ST1VORElORyAxCisjZGVmaW5lIF9GUF9USU5JTkVT
U19BRlRFUl9ST1VORElORyAwCiAKIC8qIERlZmluZSBBTElBU05BTUUgYXMgYSBzdHJvbmcgYWxp
YXMgZm9yIE5BTUUuICAqLwogIyBkZWZpbmUgc3Ryb25nX2FsaWFzKG5hbWUsIGFsaWFzbmFtZSkg
X3N0cm9uZ19hbGlhcyhuYW1lLCBhbGlhc25hbWUpCi0tIAoyLjMxLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApP
cGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3Jn
L2xpc3RpbmZvL29wZW5yaXNjCg==
