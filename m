Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C787F515EBB
	for <lists+openrisc@lfdr.de>; Sat, 30 Apr 2022 17:37:56 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6E5E5248EC;
	Sat, 30 Apr 2022 17:37:56 +0200 (CEST)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mail.librecores.org (Postfix) with ESMTPS id 971BE24827
 for <openrisc@lists.librecores.org>; Sat, 30 Apr 2022 17:37:54 +0200 (CEST)
Received: by mail-pf1-f178.google.com with SMTP id y38so9216806pfa.6
 for <openrisc@lists.librecores.org>; Sat, 30 Apr 2022 08:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=np4HtbwGSB6iapeRruj8GZIUHuBuKuckcGYZnwyb7bo=;
 b=InNn+tkdTs6CYKbpqgE/Kt+T2kH9K4dNAnuziT6CNc1awAKVpLsBeXBEdSF55QM/8k
 udH4gEcsFOVPawephKUVFL/54PfXCMPmAorXXpszoBfjsIKvSI3jL3yHoCz/uqq1IJn+
 kVWFjf9c9lRBSJV5yXZBkvE8w4q0dL/oOu8lTnq28UsvEJQY0CH45LEYkuv+wRNYsTLP
 Eyvd+DTwR/Od3TwiXZX3NEqkZmEX32Za9+ZkVKeQEHjNlAk+KM4nrwQUJ54ndJvbu69L
 pGF/VGp+Zznm318sUZMvZlp/aR/nsxWR0vlR5TvJIrQjJvM+dt17gI1NbWJzGbD5zNqR
 3vVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=np4HtbwGSB6iapeRruj8GZIUHuBuKuckcGYZnwyb7bo=;
 b=eIFK6pZJ2ZbntElSGxQKsRbBWISyDzOTfCr5XnSWM7JNL1NRwgBk+BPOprwwpjQ+JC
 Aq8NuxMtJ15CRmHDXVXuIxFVwIMfj/4mRTYwN4D5hyGXH/zp/sjiKe5TgQfMeee7Ctjg
 X5q9H+zS3EysTzDdYKaEqPt9o6VYH3VeI+QEwDv4K5vO22Kr16cx015E55tRBtIcaVDp
 MZGkbiKX2r/vs6T12Dnnm/rknz7GiTCUp8MKX7fL0w3DNSokvEypW1lpz2bTleXzBLuQ
 suwgAn7cJnSFZBIUirud8o88PA3k/AQzh/v5L0k3kL0XFBI2Kg5a26OPsR+jg/8WfbdG
 ePvw==
X-Gm-Message-State: AOAM530kp7z33/P2VJWC4xLUtjksq5JvBslvbZ10Spwo7hHZ20Sn7WSC
 X9pWL24fnO1jKxUMGF0+yx3CWw==
X-Google-Smtp-Source: ABdhPJyY6PFEoD09nOYm4tiKmrVzmrmKd1omAejHwAiMVanwvGm+TKpg7gHnHCqyfyt/42onKskybA==
X-Received: by 2002:a63:5606:0:b0:3ab:84d3:cfbe with SMTP id
 k6-20020a635606000000b003ab84d3cfbemr3521738pgb.191.1651333072975; 
 Sat, 30 Apr 2022 08:37:52 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 p2-20020a17090ad30200b001cd4989feb7sm17264343pju.3.2022.04.30.08.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 08:37:52 -0700 (PDT)
Date: Sat, 30 Apr 2022 08:36:19 -0700
Message-Id: <20220430153626.30660-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: [OpenRISC] [PATCH v4 0/7] Generic Ticket Spinlocks
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
Cc: peterz@infradead.org, guoren@kernel.org, jszhang@kernel.org,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 jonas@southpole.se, linux-csky@vger.kernel.org, mingo@redhat.com,
 longman@redhat.com, linux-arch@vger.kernel.org, aou@eecs.berkeley.edu,
 Arnd Bergmann <arnd@arndb.de>, boqun.feng@gmail.com,
 openrisc@lists.librecores.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, sudipm.mukherjee@gmail.com,
 macro@orcam.me.uk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Q29tbWVudHMgb24gdGhlIHYzIGxvb2tlZCBwcmV0dHkgc3RyYWlnaHQtZm9yd2FyZCwgZXNzZW50
aWFsbHkganVzdCB0aGF0ClJDc2MgaXNzdWUgSSdkIG1pc3NlZCBmcm9tIHRoZSB2MiBhbmQgc29t
ZSBjbGVhbnVwcy4gIEEgcGFydCBvZiB0aGUKZGlzY3Vzc2lvbiBzb21lIGFkZGl0aW9uYWwgcG9z
c2libGUgY2xlYW51cHMgY2FtZSB1cCByZWxhdGVkIHRvIHRoZQpxcndsb2NrIGhlYWRlcnMsIGJ1
dCBJIGhhZG4ndCBsb29rZWQgYXQgdGhvc2UgeWV0IGFuZCBJIGhhZCBhbHJlYWR5CmhhbmRsZWQg
ZXZlcnl0aGluZyBlbHNlLiAgVGhpcyB3ZW50IG9uIHRoZSBiYWNrIGJ1cm5lciwgYnV0IGdpdmVu
IHRoYXQKTG9vbmdBcmNoIGFwcGVhcnMgdG8gd2FudCB0byB1c2UgaXQgZm9yIHRoZWlyIG5ldyBw
b3J0IEkgdGhpbmsgaXQncyBiZXN0CnRvIGp1c3QgcnVuIHdpdGggdGhpcyBhbmQgZGVmZXIgdGhl
IG90aGVyIGNsZWFudXBzIHVudGlsIGxhdGVyLgoKSSd2ZSBwbGFjZWQgdGhlIHdob2xlIHBhdGNo
IHNldCBhdCBwYWxtZXIvdHNwaW5sb2NrLXY0LCBhbmQgYWxzbyB0YWdnZWQKdGhlIGFzbS1nZW5l
cmljIGJpdHMgYXMgZ2VuZXJpYy10aWNrZXQtc3BpbmxvY2tzLXY0LiAgSWRlYWxseSBJJ2QgbGlr
ZQp0byB0YWtlIHRoYXQsIGFsb25nIHdpdGggdGhlIFJJU0MtViBwYXRjaGVzLCBpbnRvIG15IHRy
ZWUgYXMgdGhlcmUncwpzb21lIFJJU0MtViBzcGVjaWZpYyB0ZXN0aW5nIGJlZm9yZSB0aGluZ3Mg
bGFuZCBpbiBsaW51eC1uZXh0LiAgVGhpcwpwYXNzZXMgYWxsIG15IHRlc3RpbmcsIGJ1dCBJJ2xs
IGhvbGQgb2ZmIHVudGlsIG1lcmdpbmcgdGhpbmdzIGFueXdoZXJlCmVsc2UgdG8gbWFrZSBzdXJl
IGV2ZXJ5b25lIGhhcyB0aW1lIHRvIGxvb2suICBUaGVyZSdzIG5vIHJ1c2ggb24gbXkgZW5kCmZv
ciB0aGlzIG9uZSwgYnV0IEkgZG9uJ3Qgd2FudCB0byBibG9jayBMb29uZ0FyY2ggc28gSSdsbCB0
cnkgdG8gc3RheSBhCmJpdCBtb3JlIG9uIHRvcCBvZiB0aGlzIG9uZS4KCkNoYW5nZXMgc2luY2Ug
djMgPDIwMjIwNDE0MjIwMjE0LjI0NTU2LTEtcGFsbWVyQHJpdm9zaW5jLmNvbT46CiogQWRkZWQg
YSBzbXBfbWIoKSBpbiB0aGUgbG9jayBzbG93LXBhdGgsIHRvIG1ha2Ugc3VyZSB0aGF0IGlzIFJD
c2MuCiogRml4ZWQgdGhlIGhlYWRlciBndWFyZHMuCgpDaGFuZ2VzIHNpbmNlIHYyIDwyMDIyMDMx
OTAzNTQ1Ny4yMjE0OTc5LTEtZ3VvcmVuQGtlcm5lbC5vcmc+OgoqIFBpY2tlZCB1cCBQZXRlcidz
IFNPQnMsIHdoaWNoIHdlcmUgcG9zdGVkIG9uIHRoZSB2MS4KKiBSZS1vcmRlcmVkIHRoZSBmaXJz
dCB0d28gcGF0Y2hlcywgYXMgdGhleQoqIFJlLXdvcmRlZCB0aGUgUklTQy1WIHFyd2xvY2sgcGF0
Y2gsIGFzIGl0IHdhcyBhIGJpdCBtdXNoeS4gIEkgYWxzbwogIGFkZGVkIGEgYmx1cmIgaW4gdGhl
IHFyd2xvY2sncyB0b3AgY29tbWVudCBhYm91dCB0aGlzIGRlcGVuZGVuY3kuCiogUGlja2VkIHVw
IFN0YWZmb3JkJ3MgZml4IGZvciBiaWctZW5kaWFuIHN5c3RlbXMsIHdoaWNoIEkgaGF2ZSBub3QK
ICB0ZXN0ZWQgYXMgSSBkb24ndCBoYXZlIG9uZSAoYXQgbGVhc3QgZWFzaWx5IGF2YWlsaWFibGUs
IEkgdGhpbmsgdGhlIEJFCiAgTUlQUyBzeXN0ZW1zIGFyZSBzdGlsbCBpbiB0aGF0IHBpbGUgaW4g
bXkgZ2FyYWdlKS4KKiBDYWxsIHRoZSBnZW5lcmljIHZlcnNpb24gPGFzbS1nZW5lbmljL3NwaW5s
b2Nre190eXBlc30uaD4sIGFzIHRoZXJlJ3MKICByZWFsbHkgbm8gdXRpbGl0eSB0byB0aGUgdmVy
c2lvbiB0aGF0IG9ubHkgZXJyb3JzIG91dC4KCkNoYW5nZXMgc2luY2UgdjEgPDIwMjIwMzE2MjMy
NjAwLjIwNDE5LTEtcGFsbWVyQHJpdm9zaW5jLmNvbT46CiogRm9sbG93IEFybmQgc3VnZ2VzdGlv
biB0byBtYWtlIHRoZSBwYXRjaCBzZXJpZXMgbW9yZSBnZW5lcmljLgoqIEFkZCBjc2t5IGluIHRo
ZSBzZXJpZXMuCiogQ29tYmluZSBSSVNDLVYncyB0d28gcGF0Y2hlcyBpbnRvIG9uZS4KKiBNb2Rp
Znkgb3BlbnJpc2MncyBwYXRjaCB0byBzdWl0IHRoZSBuZXcgZ2VuZXJpYyB2ZXJzaW9uLgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1h
aWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxp
YnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
