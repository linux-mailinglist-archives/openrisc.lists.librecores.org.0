Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 7F86B2678EB
	for <lists+openrisc@lfdr.de>; Sat, 12 Sep 2020 10:43:03 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 0241020DEB;
	Sat, 12 Sep 2020 10:43:03 +0200 (CEST)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mail.librecores.org (Postfix) with ESMTPS id 60D5E20C7C
 for <openrisc@lists.librecores.org>; Sat, 12 Sep 2020 10:43:00 +0200 (CEST)
Received: by mail-pj1-f50.google.com with SMTP id gf14so2812973pjb.5
 for <openrisc@lists.librecores.org>; Sat, 12 Sep 2020 01:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=RBf+r4Wfjftyu2UytGO9PrWyfgrAo6pDRCv214Qme1g=;
 b=TI4NGEGr8/nZqhpPSVmw1qdnUjjGAgA3IQQ9fGdOzRjiwn3udsZia7vTzsQZeTlA0N
 9hXPB4GJuWX2Ve8Kyi+ufmwQLwtn+vx3cdVDcQxBIdozDA3g/BcVWH6SarGLEbOtbyh5
 UNZt569I43Aa0sQwcz1KmzvP1mw1eN+zP7O4OtFDSnFPrsvas8UoUA+RxqY69HXdgLjf
 VPrc07dhZZ8J4Bk0ULavxl5u716XCDcdJ2+RAQ21QgjDYOeBlM88TkclQEPuArg1XE/f
 8PViAark2nGIsE8Mf6D0l0DqSGVocNfsDfRViXVvLiirA+fS4w9bF4rX6p88OhmLYPBG
 MKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=RBf+r4Wfjftyu2UytGO9PrWyfgrAo6pDRCv214Qme1g=;
 b=kv4Lo4XLQmV8yARrpDY3jqIBYAThhI79kVskmrqe7Tvzpf743QNbFGpXvpCzsg0R5T
 sfzO4uZ/6EcZZXurKt5Z5x1jQzcVHWjvifucoHDtZZSBAeHviMnXA1SeSikPmyelEyqv
 W6QrcqeLddHRbf8FXhf8AbpnS4Fi12ixM+tiMALY00mD8inFzPBua/7l/4SscR9Hl9G4
 VQn+yqZONDeO7cbF1IOo2Cz2CSckLGA6QRuDl4R4s3KGtdalWHbA8kysuLasr7Hbk1DZ
 jeLnd5MPr+tKrw/hYJF6NoZ2pc08m7j5nej33BGNWPXj+fSIccVWMYPmprRApE/+VXq+
 eacA==
X-Gm-Message-State: AOAM531hDq7A7Btr0ciqTfth6K8EqdHL/CdRXdpSBKa4ZimG9SDGmP2F
 L/0Gr6LHPknLayTcxn7gkB1VyqlEpmE=
X-Google-Smtp-Source: ABdhPJw4Ps2U8pKBxwyTEXqVvNsHKtnICl1kfCyf9FnV+j4mpoqjnGazMdRVprMnQyBDXZEmZ/QMXA==
X-Received: by 2002:a17:90a:fb4d:: with SMTP id
 iq13mr5521786pjb.179.1599900179017; 
 Sat, 12 Sep 2020 01:42:59 -0700 (PDT)
Received: from localhost (g168.115-65-169.ppp.wakwak.ne.jp. [115.65.169.168])
 by smtp.gmail.com with ESMTPSA id
 j35sm3501073pgi.91.2020.09.12.01.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Sep 2020 01:42:58 -0700 (PDT)
Date: Sat, 12 Sep 2020 17:42:55 +0900
From: Stafford Horne <shorne@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20200912084255.GR3562056@lianli.shorne-pla.net>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [OpenRISC] [GIT PULL] OpenRISC fixes for v5.9-rc4
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

SGkgTGludXMsCgpQbGVhc2UgY29uc2lkZXIgZm9yIHB1bGwuCgpUaGUgZm9sbG93aW5nIGNoYW5n
ZXMgc2luY2UgY29tbWl0IGQwMTJhNzE5MGZjMWZkNzJlZDQ4OTExZTc3Y2E5N2JhNDUyMWJjY2Q6
CgogIExpbnV4IDUuOS1yYzIgKDIwMjAtMDgtMjMgMTQ6MDg6NDMgLTA3MDApCgphcmUgYXZhaWxh
YmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAgZ2l0Oi8vZ2l0aHViLmNvbS9vcGVucmlz
Yy9saW51eC5naXQgdGFncy9mb3ItbGludXMKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0
byBkODc3MzIyYmMxYWRjYWI5ODUwNzMyMjc1NjcwNDA5ZThiY2NhNGM0OgoKICBvcGVucmlzYzog
Rml4IGlzc3VlIHdpdGggZ2V0X3VzZXIgZm9yIDY0LWJpdCB2YWx1ZXMgKDIwMjAtMDktMTIgMTc6
MjY6MDAgKzA5MDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCk9wZW5SSVNDIGZpeGVzIGZvciA1LjktcmM0CgpGaXhlcyBm
b3IgY29tcGlsZSBpc3N1ZXMgcG9pbnRlZCBvdXQgYnkga2J1aWxkIGFuZCBvbmUgYnVnIEkgZm91
bmQgaW4KaW50ZXJkIHdpdGggdGhlIDUuOSBwYXRjaGVzLgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpTdGFmZm9yZCBIb3Ju
ZSAoMyk6CiAgICAgIG9wZW5yaXNjOiBSZXNlcnZlIG1lbWJsb2NrIGZvciBpbml0cmQKICAgICAg
b3BlbnJpc2M6IEZpeCBjYWNoZSBBUEkgY29tcGlsZSBpc3N1ZSB3aGVuIG5vdCBpbmxpbmluZwog
ICAgICBvcGVucmlzYzogRml4IGlzc3VlIHdpdGggZ2V0X3VzZXIgZm9yIDY0LWJpdCB2YWx1ZXMK
CiBhcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCB8IDMzICsrKysrKysrKysrKysr
KysrKysrKy0tLS0tLS0tLS0tLQogYXJjaC9vcGVucmlzYy9rZXJuZWwvc2V0dXAuYyAgICAgICAg
fCAxMCArKysrKysrKysrCiBhcmNoL29wZW5yaXNjL21tL2NhY2hlLmMgICAgICAgICAgICB8ICAy
ICstCiAzIGZpbGVzIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBt
YWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5s
aWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
