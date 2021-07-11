Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 564CE3C3D10
	for <lists+openrisc@lfdr.de>; Sun, 11 Jul 2021 15:41:19 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8A55D213F3;
	Sun, 11 Jul 2021 15:41:17 +0200 (CEST)
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by mail.librecores.org (Postfix) with ESMTP id D089D213F3
 for <openrisc@lists.librecores.org>; Sun, 11 Jul 2021 15:41:15 +0200 (CEST)
Received: from smtpclient.apple ([151.34.36.116])
 by Aruba Outgoing Smtp  with ESMTPA
 id 2ZhqmSR6ylMvA2Zhqm0hEy; Sun, 11 Jul 2021 15:41:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1626010875; bh=rAcoL5IKHE0Y/u3MyZ00VkU2/uCv7Dncqttu+8PtbaI=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=BRBAnAxTntD/g+OeGHdsfynn488ay9nqg3aq1Yjnvb4HBZdFIVY0XY3kihiag/HKC
 zeqOCEU85jE+zN4uUQ371DpRAfaR43NQvnd4Z6XyCOJngxZvzOKvTykLsx5s+nS66n
 331L31DBbLE51BpdI1TTC5JrSy0ecz8DrD4tdHibKg8fTL5SSnxkZ12328vF0zMOGn
 qA3H+oL8bkvzu9mC8YwbSL57/xDS/e9l28Xbyh4Fr5VrWqM+/GQFbW2rNopgm357Mb
 Ihmscb8t+1WIfm8IJAIWUczCPycReB0AW09bqz3YGIaU51oG+5JaNqDyPGCFyDVPyb
 J7RI+HsD1tHVQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sun, 11 Jul 2021 15:41:12 +0200
Message-Id: <6B8D2091-E973-4F7D-A4FE-41D03FAB2970@benettiengineering.com>
References: <16b3a02d-f749-0806-ed0f-df3ad7050bb3@linaro.org>
In-Reply-To: <16b3a02d-f749-0806-ed0f-df3ad7050bb3@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
X-Mailer: iPhone Mail (18F72)
X-CMAE-Envelope: MS4wfNw0KPbYSbakY98HhH6KL/aM5TKFdXYCJ9j+W8UQ9gmqw1pbtZgo2PlJognfF7zA4R9zGC5ThVP5oXbXD01WknhaGc9ocT6Zwg8kA8eDH8bGbyx7wyAT
 NnmBXXVeswCeHcSaXyhSgPURbnVrSf0Z2IMwnpZ/lNYaihQEjs7X+QZcLBMoiJXru1igSee3HdXALRyR3mJSRkH8Qrle2bgTv6zIaYjbS5Ex3LhZMGMajTHC
 uW8TgY9BW/enZ1k8eX4UBjyexWesDEVtjOZX98xJhQW9MmhAZ8R8xL0kqL9s6kJjjgd96FXFgnOqrvh/4mfgT2dBydTfE81VdDOqMtTQ5Ss=
Subject: Re: [OpenRISC] Maybe another or1k bug
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
 GNU Binutils <binutils@sourceware.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Cj4gSWwgZ2lvcm5vIDExIGx1ZyAyMDIxLCBhbGxlIG9yZSAxNToyNCwgUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+IGhhIHNjcml0dG86Cj4gCj4g77u/T24g
Ny8xMS8yMSAxOjM2IEFNLCBHaXVsaW8gQmVuZXR0aSB3cm90ZToKPj4gU3Vic3RpdHV0aW5nIFNZ
TUJPTF9SRUZFUkVOQ0VTX0xPQ0FMIHdpdGggU1lNQk9MX0NBTExTX0xPQ0FMIGZpeGVzIHRoZSBw
cm9ibGVtLgo+PiBPbmx5IG9uZSB0aGluZywgaXMgaXQgdmFsaWQgZm9yIGV2ZXJ5IGNhc2UgaW4g
dGhhdCBzd2l0Y2ggb3IgbXVzdCBpdCBiZSBvbmx5IGZvciBSX09SMUtfSU5TTl9SRUxfMjY/Cj4g
Cj4gT25seSBmb3IgSU5TTl9SRUxfMjYuCgpQZXJmZWN0LCBJ4oCZbSBnb2luZyB0byBtb2RpZnkg
YW5kIHN1Ym1pdCBzb29uLgoKVGhhbmsgeW91CkdpdWxpbwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NA
bGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5m
by9vcGVucmlzYwo=
