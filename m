Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D1432174FF5
	for <lists+openrisc@lfdr.de>; Sun,  1 Mar 2020 22:39:08 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B2BFA2099C;
	Sun,  1 Mar 2020 22:39:08 +0100 (CET)
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by mail.librecores.org (Postfix) with ESMTPS id 0D4EA20911
 for <openrisc@lists.librecores.org>; Sun,  1 Mar 2020 22:39:07 +0100 (CET)
Received: by mail-pj1-f65.google.com with SMTP id cx7so362580pjb.3
 for <openrisc@lists.librecores.org>; Sun, 01 Mar 2020 13:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f3Ble6iA1rj1SewO8T/W6hk1dFYEXHz8p6afe2PQVOE=;
 b=Baez6k8SMiky2op1OrkEDatdJ9BJ67VWqxNDvvyam6izr4oVEPVeweJobVzNKt9vFV
 NRsm2mbD0VbFq/6HHKD4HBjezKw5v2P7jeLaXvxzeKq5gilbjSNsbVieTSdaufgMKUyx
 8eysv542D7sS+p0HdXc1okTh6NsxnnqWzXtD6JGokHEAOaI9skC+kq1roejWDOti7Bd6
 qYJJj416nolw6ELpxw08iwZa0SVh8zyDPh2a2glGp1fn8AVgmuTfD/NEKFmPNlOzCVCW
 W/HHXQmQxuUNR9KcW8RYzFZgoPPFAU3jQAMji0ZcnbnLGtW/K6FBk2zHKRxNtQR9Aokm
 no4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f3Ble6iA1rj1SewO8T/W6hk1dFYEXHz8p6afe2PQVOE=;
 b=mM6Sqtvpn/BHo8ILP4K/YlTHVp3LpkLed9jmxiX74o+kmeilyPBw7g4Om+3Sh8GK8k
 7J0o1YJrk7Ocj5KyDrnHMBTcl83L79j4RwN2hMQ9wvmUxslz3Vyiuoei4t4m7mJ/41XF
 KSz+zcuSUD85Kem1tDTg6KO+WSxCNCnFFh06jz6ZuJT+peldPrKdBzzvnrzTOuwHvVaO
 4lOM185cpVCZ+Xkh/op6J66LFAkxpvU9aCZX3CBMAjP4kZIWTHezw9bI35evYlIY8caN
 Lfm1hgYEmoLwIqfxAxuUGNUsFNoXjm0vtzNP+g9qp/JB4/SaC3KzvXbaURMTqWVzvdjh
 1cTQ==
X-Gm-Message-State: APjAAAU4qyow1y4AKF29kvqWd/yWufwBaIT4GvhslrNkrdzQlLstKP/w
 tILqpDtnwAPJeylplnjyVC8=
X-Google-Smtp-Source: APXvYqwGTAkEpETbgLz3hnEVmINerLlAPbtLLmIFzAh3x5V/WWjI5zyFwqlVUrTFz2LUk4dnCBPkXw==
X-Received: by 2002:a17:902:b611:: with SMTP id
 b17mr14793523pls.23.1583098745201; 
 Sun, 01 Mar 2020 13:39:05 -0800 (PST)
Received: from localhost (g183.222-224-185.ppp.wakwak.ne.jp. [222.224.185.183])
 by smtp.gmail.com with ESMTPSA id b18sm18628378pfd.63.2020.03.01.13.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Mar 2020 13:39:04 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Mon,  2 Mar 2020 06:38:49 +0900
Message-Id: <20200301213851.8096-2-shorne@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200301213851.8096-1-shorne@gmail.com>
References: <20200301213851.8096-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v2 1/3] openrisc: Convert copy_thread to
 copy_thread_tls
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
 Openrisc <openrisc@lists.librecores.org>, Allison Randal <allison@lohutok.net>,
 Thomas Gleixner <tglx@linutronix.de>, Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VGhpcyBpcyByZXF1aXJlZCBmb3IgY2xvbmUzIHdoaWNoIHBhc3NlcyB0aGUgVExTIHZhbHVlIHRo
cm91Z2ggYQpzdHJ1Y3QgcmF0aGVyIHRoYW4gYSByZWdpc3Rlci4KClNpZ25lZC1vZmYtYnk6IFN0
YWZmb3JkIEhvcm5lIDxzaG9ybmVAZ21haWwuY29tPgotLS0KIGFyY2gvb3BlbnJpc2MvS2NvbmZp
ZyAgICAgICAgICB8ICAxICsKIGFyY2gvb3BlbnJpc2Mva2VybmVsL3Byb2Nlc3MuYyB8IDE3ICsr
KysrKy0tLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMTEgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9LY29uZmlnIGIvYXJjaC9vcGVu
cmlzYy9LY29uZmlnCmluZGV4IDE5MjhlMDYxZmY5Ni4uNWRlYmRiZTZmYzM1IDEwMDY0NAotLS0g
YS9hcmNoL29wZW5yaXNjL0tjb25maWcKKysrIGIvYXJjaC9vcGVucmlzYy9LY29uZmlnCkBAIC0x
NCw2ICsxNCw3IEBAIGNvbmZpZyBPUEVOUklTQwogCXNlbGVjdCBIQU5ETEVfRE9NQUlOX0lSUQog
CXNlbGVjdCBHUElPTElCCiAJc2VsZWN0IEhBVkVfQVJDSF9UUkFDRUhPT0sKKwlzZWxlY3QgSEFW
RV9DT1BZX1RIUkVBRF9UTFMKIAlzZWxlY3QgU1BBUlNFX0lSUQogCXNlbGVjdCBHRU5FUklDX0lS
UV9DSElQCiAJc2VsZWN0IEdFTkVSSUNfSVJRX1BST0JFCmRpZmYgLS1naXQgYS9hcmNoL29wZW5y
aXNjL2tlcm5lbC9wcm9jZXNzLmMgYi9hcmNoL29wZW5yaXNjL2tlcm5lbC9wcm9jZXNzLmMKaW5k
ZXggYjA2Zjg0ZjY2NzZmLi41Y2FhNDdmN2RlNGYgMTAwNjQ0Ci0tLSBhL2FyY2gvb3BlbnJpc2Mv
a2VybmVsL3Byb2Nlc3MuYworKysgYi9hcmNoL29wZW5yaXNjL2tlcm5lbC9wcm9jZXNzLmMKQEAg
LTExNywxMiArMTE3LDEzIEBAIHZvaWQgcmVsZWFzZV90aHJlYWQoc3RydWN0IHRhc2tfc3RydWN0
ICpkZWFkX3Rhc2spCiBleHRlcm4gYXNtbGlua2FnZSB2b2lkIHJldF9mcm9tX2Zvcmsodm9pZCk7
CiAKIC8qCi0gKiBjb3B5X3RocmVhZAorICogY29weV90aHJlYWRfdGxzCiAgKiBAY2xvbmVfZmxh
Z3M6IGZsYWdzCiAgKiBAdXNwOiB1c2VyIHN0YWNrIHBvaW50ZXIgb3IgZm4gZm9yIGtlcm5lbCB0
aHJlYWQKICAqIEBhcmc6IGFyZyB0byBmbiBmb3Iga2VybmVsIHRocmVhZDsgYWx3YXlzIE5VTEwg
Zm9yIHVzZXJzcGFjZSB0aHJlYWQKICAqIEBwOiB0aGUgbmV3bHkgY3JlYXRlZCB0YXNrCiAgKiBA
cmVnczogQ1BVIGNvbnRleHQgdG8gY29weSBmb3IgdXNlcnNwYWNlIHRocmVhZDsgYWx3YXlzIE5V
TEwgZm9yIGt0aHJlYWQKKyAqIEB0bHM6IHRoZSBUaHJlYWQgTG9jYWwgU3RvcmFnZSBwb2ludGVy
IGZvciB0aGUgbmV3IHByb2Nlc3MKICAqCiAgKiBBdCB0aGUgdG9wIG9mIGEgbmV3bHkgaW5pdGlh
bGl6ZWQga2VybmVsIHN0YWNrIGFyZSB0d28gc3RhY2tlZCBwdF9yZWcKICAqIHN0cnVjdHVyZXMu
ICBUaGUgZmlyc3QgKHRvcG1vc3QpIGlzIHRoZSB1c2Vyc3BhY2UgY29udGV4dCBvZiB0aGUgdGhy
ZWFkLgpAQCAtMTQ4LDggKzE0OSw4IEBAIGV4dGVybiBhc21saW5rYWdlIHZvaWQgcmV0X2Zyb21f
Zm9yayh2b2lkKTsKICAqLwogCiBpbnQKLWNvcHlfdGhyZWFkKHVuc2lnbmVkIGxvbmcgY2xvbmVf
ZmxhZ3MsIHVuc2lnbmVkIGxvbmcgdXNwLAotCSAgICB1bnNpZ25lZCBsb25nIGFyZywgc3RydWN0
IHRhc2tfc3RydWN0ICpwKQorY29weV90aHJlYWRfdGxzKHVuc2lnbmVkIGxvbmcgY2xvbmVfZmxh
Z3MsIHVuc2lnbmVkIGxvbmcgdXNwLAorCQl1bnNpZ25lZCBsb25nIGFyZywgc3RydWN0IHRhc2tf
c3RydWN0ICpwLCB1bnNpZ25lZCBsb25nIHRscykKIHsKIAlzdHJ1Y3QgcHRfcmVncyAqdXNlcnJl
Z3M7CiAJc3RydWN0IHB0X3JlZ3MgKmtyZWdzOwpAQCAtMTc5LDE2ICsxODAsMTAgQEAgY29weV90
aHJlYWQodW5zaWduZWQgbG9uZyBjbG9uZV9mbGFncywgdW5zaWduZWQgbG9uZyB1c3AsCiAJCQl1
c2VycmVncy0+c3AgPSB1c3A7CiAKIAkJLyoKLQkJICogRm9yIENMT05FX1NFVFRMUyBzZXQgInRw
IiAocjEwKSB0byB0aGUgVExTIHBvaW50ZXIgcGFzc2VkIHRvIHN5c19jbG9uZS4KLQkJICoKLQkJ
ICogVGhlIGtlcm5lbCBlbnRyeSBpczoKLQkJICoJaW50IGNsb25lIChsb25nIGZsYWdzLCB2b2lk
ICpjaGlsZF9zdGFjaywgaW50ICpwYXJlbnRfdGlkLAotCQkgKgkJaW50ICpjaGlsZF90aWQsIHN0
cnVjdCB2b2lkICp0bHMpCi0JCSAqCi0JCSAqIFRoaXMgbWFrZXMgdGhlIHNvdXJjZSByNyBpbiB0
aGUga2VybmVsIHJlZ2lzdGVycy4KKwkJICogRm9yIENMT05FX1NFVFRMUyBzZXQgInRwIiAocjEw
KSB0byB0aGUgVExTIHBvaW50ZXIuCiAJCSAqLwogCQlpZiAoY2xvbmVfZmxhZ3MgJiBDTE9ORV9T
RVRUTFMpCi0JCQl1c2VycmVncy0+Z3ByWzEwXSA9IHVzZXJyZWdzLT5ncHJbN107CisJCQl1c2Vy
cmVncy0+Z3ByWzEwXSA9IHRsczsKIAogCQl1c2VycmVncy0+Z3ByWzExXSA9IDA7CS8qIFJlc3Vs
dCBmcm9tIGZvcmsoKSAqLwogCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0
cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29w
ZW5yaXNjCg==
