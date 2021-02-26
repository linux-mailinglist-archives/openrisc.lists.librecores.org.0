Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA203269BD
	for <lists+openrisc@lfdr.de>; Fri, 26 Feb 2021 22:56:27 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 150F7211CB;
	Fri, 26 Feb 2021 22:56:27 +0100 (CET)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mail.librecores.org (Postfix) with ESMTPS id ED14F20E61
 for <openrisc@lists.librecores.org>; Fri, 26 Feb 2021 22:56:23 +0100 (CET)
Received: by mail-pf1-f180.google.com with SMTP id m6so7168425pfk.1
 for <openrisc@lists.librecores.org>; Fri, 26 Feb 2021 13:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=TOgfz0riGvw5VOf7q3sDXBxBiqhLDvuVsPPmymjAGUM=;
 b=WzGywr/MD4O5LnuRwrOgDak6irups+h9PTBHytDpvIJaY+UG+y7KB+qhEjflOR997n
 G3Xcpb8P9nWyGfExhyJJWMM47qulCQHpQBVfBNQlXJBFmcS18ywvIN/xu2sse0PmZ2QE
 4/9xC3FfguVVlCZszmhI8eMja66lJyjzK1bSeq6sZoeyBeYL5qG0bfja25K3J+4A4dqg
 PG3t+Gn9j9Ga5wnUhw/HRuZCokYP2oY9dZE089tRWYb/6JK/lLmaK9Pobam0QAwuVFTF
 iqiyDz367Hfy8oNo3qiEZcywCI/P+Y28DCzQwKor0p/X7qjUokKqiSGYgYSoBukLqDov
 koVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=TOgfz0riGvw5VOf7q3sDXBxBiqhLDvuVsPPmymjAGUM=;
 b=hoYJLhy+zSL4TRfhZwbBMSc5OMfHMHfSol1mTqKSpOeKuczeMMH1fIXFfgVNXtOZQK
 R8uW6PTv664FtOQFhQK1/6W8GK/QbI9xDGAqasDg17/50rcqtWPjATQC/zcO+U+cKCWi
 SGCh1MzQ7YTfoPe7j7M1kqEZgtP/CK/aOqgj4CmJA3QRtXYy9B6wBxCGp/swkFSWZM+q
 vjyDFiKmVxhSGUAJuzVm/36m+cdI+GZ3UZxmPH05cNMoCB1QPBsaB/Rpx/UbfWGwjwFf
 xJGKK66C4e1X3bkXguVT2RboaXuRv4B3HAInX7j/8oyflnxXt7+oCkNGOaPNmBIl2mIA
 tDBA==
X-Gm-Message-State: AOAM533aueSbOD4f2fM4yJIAHkagmUOaYiSb4k5dvdOD+HAntqXZZBw9
 /p5Y/vjDEBsBLB4AbyBudoI=
X-Google-Smtp-Source: ABdhPJxHZyERE4Ps9beeGxhXgs8x7TRRZ4L43bxD+rAwCR/DTOwe81+39rorJVCda7+GqUDsW8yt2Q==
X-Received: by 2002:a62:2:0:b029:1ed:6304:17d7 with SMTP id
 2-20020a6200020000b02901ed630417d7mr5171855pfa.58.1614376582324; 
 Fri, 26 Feb 2021 13:56:22 -0800 (PST)
Received: from localhost (g98.115-65-200.ppp.wakwak.ne.jp. [115.65.200.98])
 by smtp.gmail.com with ESMTPSA id c4sm3302315pfo.2.2021.02.26.13.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 13:56:21 -0800 (PST)
Date: Sat, 27 Feb 2021 06:56:19 +0900
From: Stafford Horne <shorne@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20210226215619.GC365039@lianli.shorne-pla.net>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [OpenRISC] [GIT PULL] OpenRISC updates for 5.12
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
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgTGludXMsCgpQbGVhc2UgY29uc2lkZXIgZm9yIHB1bGwuCgpOb3RlIHRoZSBzdGFydGluZyBw
b2ludCBzaG93cyB1cCBhIGJpdCBzdHJhbmdlIGFzIEkgaGFkIHRvIG1lcmdlIGluIDUuMTEgZml4
ZXMKdG8gcmVzb2x2ZSBzb21lIGNvbmZsaWN0cyBwb2ludGVkIG91dCBieSBsaW51eC1uZXh0LiAg
VGhlIGJlbG93IGFyZSB0aGUgY2hhbmdlcwpzaW5jZSB2NS4xMS4KClRoZSBmb2xsb3dpbmcgY2hh
bmdlcyBzaW5jZSBjb21taXQgMDMxYzdhOGNkNmZjNTY1ZTkwMzIwYmYwOGYyMmVlNmU3MGY5ZDk2
OToKCiAgb3BlbnJpc2M6IGlvOiBBZGQgbWlzc2luZyBfX2lvbWVtIGFubm90YXRpb24gdG8gaW91
bm1hcCgpICgyMDIxLTAxLTIwIDA2OjE0OjI2ICswOTAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUg
R2l0IHJlcG9zaXRvcnkgYXQ6CgogIGdpdEBnaXRodWIuY29tOm9wZW5yaXNjL2xpbnV4LmdpdCB0
YWdzL2Zvci1saW51cwoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDhmNzIyZjY3NDUy
ZjRiMjhjZDhkN2FjZjE2NThkYWE1Nzk2NDM3YzI6CgogIG9wZW5yaXNjOiBVc2UgZGV2aWNldHJl
ZSB0byBkZXRlcm1pbmUgcHJlc2VudCBjcHVzICgyMDIxLTAyLTA5IDA1OjM4OjUwICswOTAwKQoK
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQpPcGVuUklTQyB1cGRhdGVzIGZvciA1LjEyCgpJbmNsdWRlOgogLSBVcGRhdGUgZm9y
IExpdGV4IFNvQyBjb250cm9sbGVyIHRvIHN1cHBvcnQgd2lkZXIgd2lkdGggcmVnaXN0ZXJzIGFz
CiAgIHdlbGwgYXMgcmVzZXQuCiAtIFJlZmFjdG9yIFNNUCBjb2RlIHRvIHVzZSBkZXZpY2UgdHJl
ZSB0byBkZWZpbmUgcG9zc2libGUgY3B1cy4KIC0gVXBkYXRlcyBidWlsZCBpbmNsdWRpbmcgZ2Vu
ZXJhdGluZyB2bWxpbnV4LmJpbgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpHYWJyaWVsIFNvbWxvICg1KToKICAgICAgZHJp
dmVycy9zb2MvbGl0ZXg6IG1vdmUgZ2VuZXJpYyBhY2Nlc3NvcnMgdG8gbGl0ZXguaAogICAgICBk
cml2ZXJzL3NvYy9saXRleDogc2VwYXJhdGUgTU1JTyBmcm9tIHN1YnJlZ2lzdGVyIG9mZnNldCBj
YWxjdWxhdGlvbgogICAgICBkcml2ZXJzL3NvYy9saXRleDogcy9MSVRFWF9SRUdfU0laRS9MSVRF
WF9TVUJSRUdfQUxJR04vZwogICAgICBkcml2ZXJzL3NvYy9saXRleDogc3VwcG9ydCAzMi1iaXQg
c3VicmVnaXN0ZXJzLCA2NC1iaXQgQ1BVcwogICAgICBkcml2ZXJzL3NvYy9saXRleDogbWFrZSAn
bGl0ZXhfW3NldHxnZXRdX3JlZygpJyBtZXRob2RzIHByaXZhdGUKCkdlZXJ0IFV5dHRlcmhvZXZl
biAoMSk6CiAgICAgIGRyaXZlcnMvc29jL2xpdGV4OiBBZGQgcmVzdGFydCBoYW5kbGVyCgpKYW4g
SGVucmlrIFdlaW5zdG9jayAoMSk6CiAgICAgIG9wZW5yaXNjOiBVc2UgZGV2aWNldHJlZSB0byBk
ZXRlcm1pbmUgcHJlc2VudCBjcHVzCgpKb2VsIFN0YW5sZXkgKDIpOgogICAgICBvcGVucmlzYzog
QWRkIHZtbGludXguYmluIHRhcmdldAogICAgICBvcGVucmlzYzogcmVzdGFydDogQ2FsbCBjb21t
b24gaGFuZGxlcnMgYmVmb3JlIGhhbmdpbmcKCk1hc2FoaXJvIFlhbWFkYSAoMSk6CiAgICAgIG9w
ZW5yaXNjOiBhZGQgYXJjaC9vcGVucmlzYy9LYnVpbGQKClN0YWZmb3JkIEhvcm5lICgxKToKICAg
ICAgTWVyZ2UgcmVtb3RlLXRyYWNraW5nIGJyYW5jaCAnb3BlbnJpc2Mvb3Ixay01LjExLWZpeGVz
JyBpbnRvIG9yMWstNS4xMi11cGRhdGVzCgogYXJjaC9vcGVucmlzYy9LYnVpbGQgICAgICAgICAg
ICAgICB8ICAgMyArCiBhcmNoL29wZW5yaXNjL01ha2VmaWxlICAgICAgICAgICAgIHwgIDIxICsr
Ky0tLQogYXJjaC9vcGVucmlzYy9ib290Ly5naXRpZ25vcmUgICAgICB8ICAgMiArCiBhcmNoL29w
ZW5yaXNjL2Jvb3QvTWFrZWZpbGUgICAgICAgIHwgIDEwICsrKwogYXJjaC9vcGVucmlzYy9rZXJu
ZWwvcHJvY2Vzcy5jICAgICB8ICAxMyArKystCiBhcmNoL29wZW5yaXNjL2tlcm5lbC9zbXAuYyAg
ICAgICAgIHwgIDIzICsrKystLQogZHJpdmVycy9zb2MvbGl0ZXgvS2NvbmZpZyAgICAgICAgICB8
ICAxNCArKystCiBkcml2ZXJzL3NvYy9saXRleC9saXRleF9zb2NfY3RybC5jIHwgMTE2ICsrKysr
KysrKysrLS0tLS0tLS0tLS0tLS0tLS0KIGluY2x1ZGUvbGludXgvbGl0ZXguaCAgICAgICAgICAg
ICAgfCAxNTAgKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQogOSBmaWxlcyBj
aGFuZ2VkLCAyMTEgaW5zZXJ0aW9ucygrKSwgMTQxIGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUg
MTAwNjQ0IGFyY2gvb3BlbnJpc2MvS2J1aWxkCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9vcGVu
cmlzYy9ib290Ly5naXRpZ25vcmUKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL29wZW5yaXNjL2Jv
b3QvTWFrZWZpbGUKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0
dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
