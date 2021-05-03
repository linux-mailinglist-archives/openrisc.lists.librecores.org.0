Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 995293713B0
	for <lists+openrisc@lfdr.de>; Mon,  3 May 2021 12:34:26 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 858CB20EB1;
	Mon,  3 May 2021 12:34:26 +0200 (CEST)
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by mail.librecores.org (Postfix) with ESMTP id 49AC820EB1
 for <openrisc@lists.librecores.org>; Mon,  3 May 2021 12:34:25 +0200 (CEST)
Received: from [192.168.126.129] ([146.241.181.225])
 by Aruba Outgoing Smtp  with ESMTPSA
 id dVuAlxKRNik8wdVuBldhjz; Mon, 03 May 2021 12:34:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1620038064; bh=rSQZLKOhNgFywHMYR7vpoGhNsc3PAZ9rOoqXfRI0SfY=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=Mr6bLjrwO1nGwG05Em8ceN6pK9g1PMf4DQWpd0Omv2srnsXokbtznYYJzCUb4jLyO
 yndnqHi7SlXSoW8QLe2zJHVnjoIlRuYbBWNzu6mJKvjMXYS3EKFjjoMw6pFdwtmaRi
 X01047TO6CY0qX8hKptJGYEaEYEM5pMlpMUJi2HPZ7V515aT0Alt86EcUJIAnapNoA
 cPsBV04zzeC4vvn3aNrWUYLnsB+/no+9ckNRYHSZQEz2iNa3mSET6gWKVg4lGOnWd8
 ifaBj6qv69jO06qh2TcJxSnkmoEDKrbmC57sef9QzOzkaz5PaiHqLuXyDSrK/+WpRj
 ZdL6Qh+ZsiN6Q==
To: Stafford Horne <shorne@gmail.com>, GCC patches <gcc-patches@gcc.gnu.org>
References: <20210501211145.2980164-1-shorne@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <9a2977bb-b9a3-73e7-2cc8-4705fb6bc30f@benettiengineering.com>
Date: Mon, 3 May 2021 12:34:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210501211145.2980164-1-shorne@gmail.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfO1k4k0z6htbZeXX6Lwjro3Ni92inPZ3aUO5RnqXtCdFaGz41LPc64mxS34r/M1+OeOMDosL/t02pvclued1XUUcia6IaPKhEq1NjGGwFosCH/5tXFrX
 V0xnJrEbg3AaKkgAJTB20Fv2mdpPfNx9GuVPjF+brPTrIG9LR1vbmaH0auCNUZ2PDe48hDFOBcVtPzvCMcX9zMrpkwIJM27E9qVcuJIeRGPD+xXshldS8lnP
 tszD0G66noS+T0r93FbTASVtHIRupF5NBrawU9kqv8hV1R9fJCWCTxSwrn5TpFbA01HqMFLLWC/7va7lpuawjA==
Subject: Re: [OpenRISC] [PATCH v2 0/2] OpenRISC support for cmodel=large
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgU3RhZmZvcmQsIEFsbCwKCkkndmUgYmFja3BvcnRlZCB0aGlzIHBhdGNoc2V0IGZvciBCdWls
ZHJvb3QgdG8gdmVyc2lvbnM6Ci0gOS4zLjAKLSAxMC4zLjAKCkRvZXMgaXQgbWFrZSBzZW5zZSB0
byBzZW5kIHRoZW0/IEkgZG9uJ3Qga25vdyBpZiB0aG9zZSB2ZXJzaW9uIHdpbGwgaGF2ZSAKbWlu
b3IgdmVyc2lvbnMgd2hlcmUgdGhlc2UgYmFja3BvcnRlZCBwYXRjaGVzIGNhbiBiZSBhcHBsaWVk
LgoKQmVzdCByZWdhcmRzCi0tIApHaXVsaW8gQmVuZXR0aQpCZW5ldHRpIEVuZ2luZWVyaW5nIHNh
cwoKT24gNS8xLzIxIDExOjExIFBNLCBTdGFmZm9yZCBIb3JuZSB3cm90ZToKPiBDaGFuZ2VzIGZy
b20gdjE6Cj4gICAtIEFkZGVkIHBhdGNoIHRvIGVuYWJsZWQgY21vZGxlPWxhcmdlIG9uIGNydHN0
dWZmCj4gCj4gVGhpcyBzZXJpZXMgZml4ZXMgc29tZSBidWdzIGZvdW5kIHdoZW4gbGlua2luZyBs
YXJnZSBiaW5hcmllcywgYm90aCBpbiBidWlsZHJvb3QKPiBhbmQgZ2xpYmMgdGVzdGluZy4KPiAK
PiBTdGFmZm9yZCBIb3JuZSAoMik6Cj4gICAgb3IxazogQWRkIG1jbW9kZWwgb3B0aW9uIHRvIGhh
bmRsZSBsYXJnZSBHT1RzCj4gICAgb3IxazogVXNlIGNtb2RlbD1sYXJnZSB3aGVuIGJ1aWxkaW5n
IGNydHN0dWZmCj4gCj4gICBnY2MvY29uZmlnL29yMWsvb3Ixay1vcHRzLmggICB8IDMwICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAgZ2NjL2NvbmZpZy9vcjFrL29yMWsuYyAgICAg
ICAgfCAxMSArKysrKysrKystLQo+ICAgZ2NjL2NvbmZpZy9vcjFrL29yMWsuaCAgICAgICAgfCAg
NyArKysrKysrCj4gICBnY2MvY29uZmlnL29yMWsvb3Ixay5vcHQgICAgICB8IDE5ICsrKysrKysr
KysrKysrKysrKysKPiAgIGdjYy9kb2MvaW52b2tlLnRleGkgICAgICAgICAgIHwgMTIgKysrKysr
KysrKystCj4gICBsaWJnY2MvY29uZmlnLmhvc3QgICAgICAgICAgICB8ICA0ICsrLS0KPiAgIGxp
YmdjYy9jb25maWcvb3Ixay90LWNydHN0dWZmIHwgIDIgKysKPiAgIDcgZmlsZXMgY2hhbmdlZCwg
ODAgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBn
Y2MvY29uZmlnL29yMWsvb3Ixay1vcHRzLmgKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBsaWJnY2Mv
Y29uZmlnL29yMWsvdC1jcnRzdHVmZgo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGli
cmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlz
Ywo=
