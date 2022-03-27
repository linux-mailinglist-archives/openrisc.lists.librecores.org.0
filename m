Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E55124E8683
	for <lists+openrisc@lfdr.de>; Sun, 27 Mar 2022 09:30:06 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8338224830;
	Sun, 27 Mar 2022 09:30:06 +0200 (CEST)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mail.librecores.org (Postfix) with ESMTPS id 5D95723F8E
 for <openrisc@lists.librecores.org>; Sun, 27 Mar 2022 09:30:04 +0200 (CEST)
Received: by mail-pf1-f174.google.com with SMTP id t5so9932830pfg.4
 for <openrisc@lists.librecores.org>; Sun, 27 Mar 2022 00:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=9lKd8D5vs1bIv3we5bTdIwiI5r0+Ib+NYvoPSo6tiVQ=;
 b=DVwBa9WSKfeJAtPIYpGVU1glDFmKVSYr3UvGi3icEEfIpn5/ThzQu+jQMooM2pl9/7
 QFz5hOlCq/sIw7aGgeXNsMKDUlkor7PRRtjtrO9dq8q9QAKTyEC+JBV3vnPKuSpJ7dQx
 +s6glZZPDGszA9fbmaEPdLoDplve2ZPLR6UW1XMMxPdfIh5KA5H3E1yqnu3RU5VThEi0
 OMk4U/1wQdt5IrXaYA7VL5kr5sNpxBSEBSuEPmjJa+C+47APTSrllVFW9w88RNlP9QF0
 449hrZ4q5Cy4hqucwiXwUmB0y7EnBgsoFnC4P9yK2/D0ZJaOAqPHZ+l33/7lcCCvQwVr
 33iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=9lKd8D5vs1bIv3we5bTdIwiI5r0+Ib+NYvoPSo6tiVQ=;
 b=PKaqPPAKlG76ZuIW5FBMKyG5X76p8Txxs/V+kDOm5WedvV5eGD4bNXn47SCvR0psEm
 /WwuqZ+3voOleSt/wmFpno7qJ2lu8fH7W2UrN2S9H9ZSNodw5bBfTifyB0cr9p59+Ne1
 QNxZ7754dh6w0N30XsGO90vaCtV36iy1/9jb/1B2a3jcR522atuNP3G60pDlTS4FKTXW
 Z9q+wnR3g9ywJhK6knyxL0YONkwUvLmZNEAj4EpAGrVQaY7q0witt7Xs7iaV3VDDt9/1
 yGF+hTU3kqT0UUEcIeXiaI8QM5UDoocJP5LOTjcxTydq35dj5N8JMJOcAHHx1gxh1s+P
 BEXw==
X-Gm-Message-State: AOAM531SxIxO37sUn90uZH/zPTkrvzej/ftxQ8PHMeuhfk9vi6mwPtCm
 nSaZ5fxn4Y1uU/5gNNPEMzk=
X-Google-Smtp-Source: ABdhPJw8M8u1+/Tw6FlpRuq+xn0lYjq4U9MertxQH22ZMRcQye6U9WUbTvPCFLQQo463sNVLz6co2g==
X-Received: by 2002:a63:6fc4:0:b0:393:9567:16dc with SMTP id
 k187-20020a636fc4000000b00393956716dcmr5750446pgc.593.1648366202763; 
 Sun, 27 Mar 2022 00:30:02 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a056a000bd900b004faae43da95sm11362544pfu.138.2022.03.27.00.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 00:30:02 -0700 (PDT)
Date: Sun, 27 Mar 2022 16:30:00 +0900
From: Stafford Horne <shorne@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YkASeMlP+k/OJm3+@antec>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [OpenRISC] [GIT PULL] OpenRISC updates for 5.18
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

SGkgTGludXMsCgpOb3QgbXVjaCBmb3IgT3BlblJJU0MgdGhpcyBtZXJnZSB3aW5kb3csIEkgZG8g
aGF2ZSBzb21lIHRoaW5ncyBvbiB0aGUgYmFjawpidXJuZXIgbGlrZSBzcGFyc2Ugd2FybmluZyBj
bGVhbnVwcyBhbmQgbmV3IGRlZmNvbmZpZ3MuICBCdXQgSSBkaWRuJ3QgZ2V0IHRpbWUKdG8gcG9s
aXNoIHRoZSBwYXRjaGVzIG9mZiBmb3IgdGhpcyByb3VuZC4gIFRoZXJlIGFyZSBPcGVuUklTQyB1
cGRhdGVzIGNvbWluZyBpbgp2aWEgb3RoZXIgcXVldWVzIGxpa2UgcmVtb3ZhbCBvZiBzZXRfZnMo
KSBhbmQgcG9zc2libHkgbmV3IGdlbmVyaWMgdGlja2V0IGxvY2tzLgoKV2l0aCB0aGF0IHNhaWQg
cGxlYXNlIGNvbnNpZGVyIGZvciBwdWxsOgoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNv
bW1pdCBlNzgzMzYyZWI1NGNkOTliMmNhYzhiM2E5YWVhYzk0MmU2ZjZhYzA3OgoKICBMaW51eCA1
LjE3LXJjMSAoMjAyMi0wMS0yMyAxMDoxMjo1MyArMDIwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhl
IEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXRAZ2l0aHViLmNvbTpvcGVucmlzYy9saW51eC5naXQg
dGFncy9mb3ItbGludXMKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA4NjJjZjhkNWZk
OThlZDhlYTg5ODk3MjZlZDVkYTUzNzYxYTllZDc2OgoKICBvcGVucmlzYy9ib290OiBSZW1vdmUg
dW5uZWNlc3NhcnkgaW5pdGlhbGlzYXRpb24gaW4gbWVtY3B5KCkuICgyMDIyLTAxLTMwIDE3OjQ0
OjM0ICswOTAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQpPcGVuUklTQyB1cGRhdGVzIGZvciA1LjE4CgpGaXh1cHMgYW5k
IGVuaGFuY2VtZW50cyBmb3IgT3BlblJJU0M6CiAtIFNtYWxsIGZpeHVwIHRvIHJlbW92ZSBkdXBs
aWNhdGUgaW5pdGlhbGl6ZXIgaW4gbWVtY3B5IGZyb20gS3VuaXl1a2kKICAgSXdhc2hpbWEKCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KS3VuaXl1a2kgSXdhc2hpbWEgKDEpOgogICAgICBvcGVucmlzYy9ib290OiBSZW1vdmUg
dW5uZWNlc3NhcnkgaW5pdGlhbGlzYXRpb24gaW4gbWVtY3B5KCkuCgogYXJjaC9vcGVucmlzYy9s
aWIvbWVtY3B5LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
T3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBz
Oi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
