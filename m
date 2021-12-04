Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2EAE84681ED
	for <lists+openrisc@lfdr.de>; Sat,  4 Dec 2021 03:19:08 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1425B240F6;
	Sat,  4 Dec 2021 03:19:08 +0100 (CET)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mail.librecores.org (Postfix) with ESMTPS id B4A9E240F6
 for <openrisc@lists.librecores.org>; Sat,  4 Dec 2021 03:19:06 +0100 (CET)
Received: by mail-pg1-f182.google.com with SMTP id r5so4807344pgi.6
 for <openrisc@lists.librecores.org>; Fri, 03 Dec 2021 18:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SgqlE8L002r4rFKN6cOCZIPMWyYH8g/yRVNJw29FxcU=;
 b=TbvNG8EVmm1LVcp4nDgwfK+YHt+jRTjXW8yR+EFsftc7dSp4nc6uWJW0bmsu/0AU6b
 Ugg9X9aOGGpphNP1jombLTUi5lWeQCrJxMP5Si/ge7wZtx7EkDXYuu1tUUaOU69v49Mf
 cVCdeu2ixWVgmwwYEcg2QA3J8+X86r/gQnseXb4xzLol84JSjfeIr4vkkkCCeaIqQ4G4
 eU3qrXDFyxNwm5p2qAOtToEOTTu07JullPXo38G9PaiJ1kyiJNwjozlUyYZcHNqso4Iv
 AKJE5W3bMczYbpbXHM68AOUNh9jV8O7C8/5ainBhCoaEUCMtVZPbkAKypb3zHeAv9e9M
 tTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SgqlE8L002r4rFKN6cOCZIPMWyYH8g/yRVNJw29FxcU=;
 b=FNqK8aRikrs9h3l/kAWiMcRaoW0b2qK6axjHQGjMFEDECsvau1Hn1VBRXUmW/9CdPF
 8HHfNDPbdOspdLq4nXTsQTkzQI6uIBVljlxnLCW7m2zPa3IfwmojQKYXVSZLs70ZC6Zk
 9p2hsJhrncEnZhp1qljLLjhoLr0KF1mlGhlzxP+TCt0oSXHAcCRajmqQQHnSdO4ZNq4U
 BToHzb3GtoBHPDtXpyx9+lo35vg8h/LKlI1EL4S6YEleOMYjJ8vrVti5+CAp18gD3NdW
 tHghxwPBiXsOLNsLiqoWMTvOdsuSelLEi3Apskozhxg2EZT7Ruy1OJqqhZlr9Vtcx89Q
 Md/A==
X-Gm-Message-State: AOAM533VWbi1O2hXEagONMiDXs5LpdvVOJ1A+4Lb8nwnli4n7pF5pSP/
 hmQhaB4A3XphGGQb0FdmmFU=
X-Google-Smtp-Source: ABdhPJxsq9GOpUlxI12eeJEca8zEXwBe2VEoLvTIJw8q1Bn2i/1fE2nN7MYBAJtbMTT1kpLPjyjpBw==
X-Received: by 2002:a63:5b18:: with SMTP id p24mr7404473pgb.589.1638584345402; 
 Fri, 03 Dec 2021 18:19:05 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id f4sm4760828pfj.61.2021.12.03.18.19.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 18:19:04 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Sat,  4 Dec 2021 11:18:40 +0900
Message-Id: <20211204021842.1853549-2-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211204021842.1853549-1-shorne@gmail.com>
References: <20211204021842.1853549-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 1/3] openrisc: Cleanup switch code and comments
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
Cc: Jonas Bonn <jonas@southpole.se>, Petr Mladek <pmladek@suse.com>,
 Chris Down <chris@chrisdown.name>, Mark Rutland <mark.rutland@arm.com>,
 Randy Dunlap <rdunlap@infradead.org>, Openrisc <openrisc@lists.librecores.org>,
 Jessica Yu <jeyu@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VGhlIHNhdmluZyBvZiB0aGUgcjEyIHJlZ2lzdGVyIHdhcyB0aGVyZSBmb3IgYSBjb21waWxlciBi
dWcgcmVmZXJyaW5nCnRvIGEgcG9ydCB0aGF0IHdhcyBuZXZlciB1cHN0cmVhbWVkLiAgSXQgc2hv
dWxkIGJlIHNhZmUgdG8gdXNlIHRoaXMKYXMgdGhlIG5ldyBjb21waWxlciBpcyB3aGF0IHdlIHVz
ZSBhbmQgdGhlIG9sZCBkZXByZWNhdGVkLgoKQWxzbywgY2xlYW4gdXAgc29tZSB0eXBvcyBhbmQg
cmVmZXJlbmNlcyB0byBvbGQgbmFtZXMgaW4gdGhlIHN3aXRjaApjb21tZW50cy4KClNpZ25lZC1v
ZmYtYnk6IFN0YWZmb3JkIEhvcm5lIDxzaG9ybmVAZ21haWwuY29tPgotLS0KIGFyY2gvb3BlbnJp
c2Mva2VybmVsL2VudHJ5LlMgfCAxNiArKysrKystLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL29wZW5y
aXNjL2tlcm5lbC9lbnRyeS5TIGIvYXJjaC9vcGVucmlzYy9rZXJuZWwvZW50cnkuUwppbmRleCA1
OWM2ZDNhYTcwODEuLmM2MDhmNzZlNTc1MyAxMDA2NDQKLS0tIGEvYXJjaC9vcGVucmlzYy9rZXJu
ZWwvZW50cnkuUworKysgYi9hcmNoL29wZW5yaXNjL2tlcm5lbC9lbnRyeS5TCkBAIC0xMDAxLDEx
ICsxMDAxLDEwIEBAIEVOVFJZKHJldF9mcm9tX2ZvcmspCiAJbC5sd3oJcjExLFBUX0dQUjExKHIx
KQogCiAJLyogVGhlIHN5c2NhbGwgZmFzdCBwYXRoIHJldHVybiBleHBlY3RzIGNhbGwtc2F2ZWQg
cmVnaXN0ZXJzCi0JICogcjEyLXIyOCB0byBiZSB1bnRvdWNoZWQsIHNvIHdlIHJlc3RvcmUgdGhl
bSBoZXJlIGFzIHRoZXkKKwkgKiByMTQtcjI4IHRvIGJlIHVudG91Y2hlZCwgc28gd2UgcmVzdG9y
ZSB0aGVtIGhlcmUgYXMgdGhleQogCSAqIHdpbGwgaGF2ZSBiZWVuIGVmZmVjdGl2ZWx5IGNsb2Ji
ZXJlZCB3aGVuIGFycml2aW5nIGhlcmUKIAkgKiB2aWEgdGhlIGNhbGwgdG8gc3dpdGNoKCkKIAkg
Ki8KLQlsLmx3eglyMTIsUFRfR1BSMTIocjEpCiAJbC5sd3oJcjE0LFBUX0dQUjE0KHIxKQogCWwu
bHd6CXIxNixQVF9HUFIxNihyMSkKIAlsLmx3eglyMTgsUFRfR1BSMTgocjEpCkBAIC0xMDM3LDEw
ICsxMDM2LDEwIEBAIEVOVFJZKHJldF9mcm9tX2ZvcmspCiAKIC8qIF9zd2l0Y2ggTVVTVCBuZXZl
ciBsYXkgb24gcGFnZSBib3VuZHJ5LCBjYXVzZSBpdCBydW5zIGZyb20KICAqIGVmZmVjdGl2ZSBh
ZGRyZXNzZXMgYW5kIGJlZWluZyBpbnRlcnJ1cHRlZCBieSBpVExCIG1pc3Mgd291bGQga2lsbCBp
dC4KLSAqIGRUTEIgbWlzcyBzZWFtcyB0byBuZXZlciBhY2NvdXIgaW4gdGhlIGJhZCBwbGFjZSBz
aW5jZSBkYXRhIGFjY2Vzc2VzCisgKiBkVExCIG1pc3Mgc2VlbXMgdG8gbmV2ZXIgYWNjb3VyIGlu
IHRoZSBiYWQgcGxhY2Ugc2luY2UgZGF0YSBhY2Nlc3NlcwogICogYXJlIGZyb20gdGFzayBzdHJ1
Y3R1cmVzIHdoaWNoIGFyZSBhbHdheXMgcGFnZSBhbGlnbmVkLgogICoKLSAqIFRoZSBwcm9ibGVt
IGhhcHBlbnMgaW4gUkVTVE9SRV9BTExfTk9fUjExIHdoZXJlIHdlIGZpcnN0IHNldCB0aGUgRVBD
UgorICogVGhlIHByb2JsZW0gaGFwcGVucyBpbiBSRVNUT1JFX0FMTCB3aGVyZSB3ZSBmaXJzdCBz
ZXQgdGhlIEVQQ1IKICAqIHJlZ2lzdGVyLCB0aGVuIGxvYWQgdGhlIHByZXZpb3VzIHJlZ2lzdGVy
IHZhbHVlcyBhbmQgb25seSBhdCB0aGUgZW5kIGNhbGwKICAqIHRoZSBsLnJmZSBpbnN0cnVjdGlv
bi4gSWYgZ2V0IFRMQiBtaXNzIGluIGJlZXR3ZW4gdGhlIEVQQ1IgcmVnaXN0ZXIgZ2V0cwogICog
Z2FyYmxlZCBhbmQgd2UgZW5kIHVwIGNhbGxpbmcgbC5yZmUgd2l0aCB0aGUgd3JvbmcgRVBDUi4g
KHNhbWUgcHJvYmFibHkKQEAgLTEwNjgsOSArMTA2Nyw4IEBAIEVOVFJZKF9zd2l0Y2gpCiAJLyog
Tm8gbmVlZCB0byBzdG9yZSByMS9QVF9TUCBhcyBpdCBnb2VzIGludG8gS1NQIGJlbG93ICovCiAJ
bC5zdyAgICBQVF9HUFIyKHIxKSxyMgogCWwuc3cgICAgUFRfR1BSOShyMSkscjkKLQkvKiBUaGlz
IGlzIHdyb25nLCByMTIgc2hvdWxkbid0IGJlIGhlcmUuLi4gYnV0IEdDQyBpcyBicm9rZW4gZm9y
IHRoZSB0aW1lIGJlaW5nCi0JICogYW5kIGV4cGVjdHMgcjEyIHRvIGJlIGNhbGxlZS1zYXZlZC4u
LiAqLwotCWwuc3cgICAgUFRfR1BSMTIocjEpLHIxMgorCisJLyogU2F2ZSBjYWxsZWUtc2F2ZWQg
cmVnaXN0ZXJzIHRvIHRoZSBuZXcgcHRfcmVncyAqLwogCWwuc3cgICAgUFRfR1BSMTQocjEpLHIx
NAogCWwuc3cgICAgUFRfR1BSMTYocjEpLHIxNgogCWwuc3cgICAgUFRfR1BSMTgocjEpLHIxOApA
QCAtMTExMSw5ICsxMTA5LDcgQEAgRU5UUlkoX3N3aXRjaCkKIAkvKiBObyBuZWVkIHRvIHJlc3Rv
cmUgcjEwICovCiAJLyogLi4uYW5kIGRvIG5vdCByZXN0b3JlIHIxMSAqLwogCi0JLyogVGhpcyBp
cyB3cm9uZywgcjEyIHNob3VsZG4ndCBiZSBoZXJlLi4uIGJ1dCBHQ0MgaXMgYnJva2VuIGZvciB0
aGUgdGltZSBiZWluZwotCSAqIGFuZCBleHBlY3RzIHIxMiB0byBiZSBjYWxsZWUtc2F2ZWQuLi4g
Ki8KLQlsLmx3eiAgIHIxMixQVF9HUFIxMihyMSkKKwkvKiBSZXN0b3JlIGNhbGxlZS1zYXZlZCBy
ZWdpc3RlcnMgKi8KIAlsLmx3eiAgIHIxNCxQVF9HUFIxNChyMSkKIAlsLmx3eiAgIHIxNixQVF9H
UFIxNihyMSkKIAlsLmx3eiAgIHIxOCxQVF9HUFIxOChyMSkKLS0gCjIuMzEuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBs
aXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jl
cy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
