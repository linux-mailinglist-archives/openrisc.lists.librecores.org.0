Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id CD350265590
	for <lists+openrisc@lfdr.de>; Fri, 11 Sep 2020 01:40:03 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5665D20DEC;
	Fri, 11 Sep 2020 01:40:03 +0200 (CEST)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by mail.librecores.org (Postfix) with ESMTPS id 228FA20DE8
 for <openrisc@lists.librecores.org>; Fri, 11 Sep 2020 01:40:01 +0200 (CEST)
Received: by mail-pf1-f194.google.com with SMTP id f18so5778330pfa.10
 for <openrisc@lists.librecores.org>; Thu, 10 Sep 2020 16:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RsPqYI0Xk9lZxniNhN2IoKCPFdu2xrsy8oXUS2ehoKA=;
 b=A3xlM0hhvu+68XAlTl2i3uxHCOR7aSTETxAXYuIVXhIYG237ovu0HYlkIQk2YlIUzx
 7P6GCvpW8dzhMVjavAfsN49f245vSfRvQUfGD1H0i8sfQAZsZ6XK61RvGVRCSsah95ko
 wTsH+Nm0vrYbJ8KVOjwu4gqQnVnsP8sVAHYmxXsZ0dY+6LsUvG4pZG0lf+rEyCaohPNq
 jNSySLUk9/S9wRLD3r3Qtplj7tTNM2qyXR/ztAIro0C0jPbt1YHfLxAtPwhpMa9jnnKE
 VH29ila9uOhDvKKWXFq/4RTlrFMSJ4MDPJbMS8a6m9hs+jiC3Y+GX4x0qqQ6iztqDSNR
 TI3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RsPqYI0Xk9lZxniNhN2IoKCPFdu2xrsy8oXUS2ehoKA=;
 b=tnmkvhknIU+qz4lofYHXn2cRiEs6M5nKpUxs9rMaNCfevKKjcJpVtIFSIlZ7WdFJN1
 n8owr6qrlCQIIviFDLXKtHyAaqJ6X96BZFGc6EM0nwWOcx9Hjp0AB17twFs8MZdfkMMD
 9JvBs+n4IaHlCV6cLQmfm/dkCne3dE3ug3FUCp6N8+p0heD51yhwK0vi7ItP9816dqfq
 HXJpmvLSOzl3bVRX8fVjzi73cUQ2I5I5Xv7wq59g9wpANm3o2+w8fYFo07Jg6YsUhUFw
 mc9dMfB5WB/HLRkc+RvOTplw6FZ0k5eyoHBcP3h0K03MFwC82tZ0oMXdQOVfPL7p1JdM
 s8Hg==
X-Gm-Message-State: AOAM532hyOnhF76KGNnue0T2ZCUepM7vAfysy7x5LtQbjcOHAgGiRizn
 DmNoN60D5laJvEPfYb1XLtU=
X-Google-Smtp-Source: ABdhPJyrYZyprK9kh+kshBokh+mrfrvKQPu92CZudd3lxf+J1kTMo+3LwKPipjEcD8uAzvHh9CTMeQ==
X-Received: by 2002:a63:2bd1:: with SMTP id r200mr6413328pgr.20.1599781199541; 
 Thu, 10 Sep 2020 16:39:59 -0700 (PDT)
Received: from localhost (g168.115-65-169.ppp.wakwak.ne.jp. [115.65.169.168])
 by smtp.gmail.com with ESMTPSA id
 c22sm97834pgb.52.2020.09.10.16.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 16:39:58 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Fri, 11 Sep 2020 08:39:39 +0900
Message-Id: <20200910233940.2132107-3-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200910233940.2132107-1-shorne@gmail.com>
References: <20200910233940.2132107-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v3 2/3] openrisc: Fix cache API compile issue
 when not inlining
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
Cc: Jonas Bonn <jonas@southpole.se>, openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SSBmb3VuZCB0aGlzIHdoZW4gY29tcGlsaW5nIGEga2J1aWxkIHJhbmRvbSBjb25maWcgd2l0aCBH
Q0MgMTEuICBUaGUKY29uZmlnIGVuYWJsZXMgQ09ORklHX0RFQlVHX1NFQ1RJT05fTUlTTUFUQ0gs
IHdoaWNoIHNldHMgQ0ZMQUdTCi1mbm8taW5saW5lLWZ1bmN0aW9ucy1jYWxsZWQtb25jZS4gVGhp
cyBjYXVzZXMgdGhlIGNhbGwgdG8gY2FjaGVfbG9vcCBpbgpjYWNoZS5jIHRvIG5vdCBiZSBpbmxp
bmVkIGNhdXNpbmcgdGhlIGJlbG93IGNvbXBpbGUgZXJyb3IuCgogICAgSW4gZmlsZSBpbmNsdWRl
ZCBmcm9tIGFyY2gvb3BlbnJpc2MvbW0vY2FjaGUuYzoxMzoKICAgIGFyY2gvb3BlbnJpc2MvbW0v
Y2FjaGUuYzogSW4gZnVuY3Rpb24gJ2NhY2hlX2xvb3AnOgogICAgLi9hcmNoL29wZW5yaXNjL2lu
Y2x1ZGUvYXNtL3Nwci5oOjE2OjI3OiB3YXJuaW5nOiAnYXNtJyBvcGVyYW5kIDAgcHJvYmFibHkg
ZG9lcyBub3QgbWF0Y2ggY29uc3RyYWludHMKICAgICAgIDE2IHwgI2RlZmluZSBtdHNwcihfc3By
LCBfdmFsKSBfX2FzbV9fIF9fdm9sYXRpbGVfXyAoICBcCgkgIHwgICAgICAgICAgICAgICAgICAg
ICAgICAgICBefn5+fn5+CiAgICBhcmNoL29wZW5yaXNjL21tL2NhY2hlLmM6MjU6Mzogbm90ZTog
aW4gZXhwYW5zaW9uIG9mIG1hY3JvICdtdHNwcicKICAgICAgIDI1IHwgICBtdHNwcihyZWcsIGxp
bmUpOwoJICB8ICAgXn5+fn4KICAgIC4vYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS9zcHIuaDox
NjoyNzogZXJyb3I6IGltcG9zc2libGUgY29uc3RyYWludCBpbiAnYXNtJwogICAgICAgMTYgfCAj
ZGVmaW5lIG10c3ByKF9zcHIsIF92YWwpIF9fYXNtX18gX192b2xhdGlsZV9fICggIFwKCSAgfCAg
ICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn4KICAgIGFyY2gvb3BlbnJpc2MvbW0vY2Fj
aGUuYzoyNTozOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8gJ210c3ByJwogICAgICAgMjUg
fCAgIG10c3ByKHJlZywgbGluZSk7CgkgIHwgICBefn5+fgogICAgbWFrZVsxXTogKioqIFtzY3Jp
cHRzL01ha2VmaWxlLmJ1aWxkOjI4MzogYXJjaC9vcGVucmlzYy9tbS9jYWNoZS5vXSBFcnJvciAx
CgpUaGUgYXNtIGNvbnN0cmFpbnQgIksiIHJlcXVpcmVzIGEgaW1tZWRpYXRlIGNvbnN0YW50IGFy
Z3VtZW50IHRvIG10c3ByLApob3dldmVyIGJlY2F1c2Ugb2Ygbm8gaW5saW5pbmcgYSByZWdpc3Rl
ciBhcmd1bWVudCBpcyBwYXNzZWQgY2F1c2luZyBhCmZhaWx1cmUuICBGaXggdGhpcyBieSB1c2lu
ZyBfX2Fsd2F5c19pbmxpbmUuCgpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIw
MjAwODIwMDQ1My5vaG5ocWtqUSUyNWxrcEBpbnRlbC5jb20vClNpZ25lZC1vZmYtYnk6IFN0YWZm
b3JkIEhvcm5lIDxzaG9ybmVAZ21haWwuY29tPgotLS0KQ2hhbmdlcyBzaW5jZSB2MjoKIC0gTm9u
ZQpDaGFuZ2VzIHNpbmNlIHYxOgogLSBOZXcKCiBhcmNoL29wZW5yaXNjL21tL2NhY2hlLmMgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9hcmNoL29wZW5yaXNjL21tL2NhY2hlLmMgYi9hcmNoL29wZW5yaXNjL21tL2NhY2hl
LmMKaW5kZXggMDhmNTZhZjM4N2FjLi41MzRhNTJlYzVlNjYgMTAwNjQ0Ci0tLSBhL2FyY2gvb3Bl
bnJpc2MvbW0vY2FjaGUuYworKysgYi9hcmNoL29wZW5yaXNjL21tL2NhY2hlLmMKQEAgLTE2LDcg
KzE2LDcgQEAKICNpbmNsdWRlIDxhc20vY2FjaGVmbHVzaC5oPgogI2luY2x1ZGUgPGFzbS90bGJm
bHVzaC5oPgogCi1zdGF0aWMgdm9pZCBjYWNoZV9sb29wKHN0cnVjdCBwYWdlICpwYWdlLCBjb25z
dCB1bnNpZ25lZCBpbnQgcmVnKQorc3RhdGljIF9fYWx3YXlzX2lubGluZSB2b2lkIGNhY2hlX2xv
b3Aoc3RydWN0IHBhZ2UgKnBhZ2UsIGNvbnN0IHVuc2lnbmVkIGludCByZWcpCiB7CiAJdW5zaWdu
ZWQgbG9uZyBwYWRkciA9IHBhZ2VfdG9fcGZuKHBhZ2UpIDw8IFBBR0VfU0hJRlQ7CiAJdW5zaWdu
ZWQgbG9uZyBsaW5lID0gcGFkZHIgJiB+KEwxX0NBQ0hFX0JZVEVTIC0gMSk7Ci0tIAoyLjI2LjIK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVND
IG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3Rz
LmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
