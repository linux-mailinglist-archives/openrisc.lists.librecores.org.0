Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A4C053EC545
	for <lists+openrisc@lfdr.de>; Sat, 14 Aug 2021 23:01:19 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2787E2407F;
	Sat, 14 Aug 2021 23:01:19 +0200 (CEST)
Received: from smtpcmd0651.aruba.it (smtpcmd0651.aruba.it [62.149.156.51])
 by mail.librecores.org (Postfix) with ESMTP id 73A1520417
 for <openrisc@lists.librecores.org>; Sat, 14 Aug 2021 23:01:18 +0200 (CEST)
Received: from [192.168.47.129] ([141.136.135.234])
 by Aruba Outgoing Smtp  with ESMTPSA
 id F0mKm47wgxC2nF0mKmdrFC; Sat, 14 Aug 2021 23:01:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1628974878; bh=dy0iXp2qz+A8i+VxcxPS8Qj9ibFoV+Q2H6VEhZrdwZ8=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=SYibwq+hPhyjQobcg8rJCcqSeGC60x6Af07N7Mo9OYZZ1JeqISzgxcIvB9MWjT5cg
 RmaIOyo71hF4NYPzfBHJ9jzXjq6aFt3an2zjKLV4RdfqrUh4noFCdkX2LzETvhx0nh
 f85BqzeNqDr9qwPmxtnE+cvxc+wKqBJVFVqKweLrI9b/51VYiF1/T2s2DjUOkv8WXs
 Ud4p7GyGLJEulIEB5TXUNQNTK7KP3eKbEB0DO9KeEeLGzW0mWG+FiOUw7GbeZatRs0
 0D4zaf/lJ/Yv3oSbfhS5CvAd1UP4NocvR7smI4xr//7aaORIDjdEmjJo1boxi6aHUz
 b+6UWWmL39nOg==
To: Stafford Horne <shorne@gmail.com>, GCC patches <gcc-patches@gcc.gnu.org>
References: <20210501211145.2980164-1-shorne@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <da63081f-fe79-32c2-37f1-f17ce62f967b@benettiengineering.com>
Date: Sat, 14 Aug 2021 23:01:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210501211145.2980164-1-shorne@gmail.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfFRjJ6ZXOm+pKYq9Wt2zm8p7TrAPzN1P0xAP/+JrKoH/gioe5hLzKlLvS3uPwZg4Ekj/nPeZBTv+MixEfSiC3VKuNrWIRleDBUnFydH5TX4zsOgPnkrT
 M2ZEsQFitXymcASZVrPsw6E8kbDcn+Lk1cb1i5lf1mcvuQwBqx8I+ahxK3GuxK2QUxwLjEjiBuj07wRXcgTwMwlUX63sN4iqYp/Zipl+epdbBRCKpsDsfuFx
 76+nKEutqHQQ81xi4xBZdYDXSgxiciymB0fqT90nr5OyfD19k/X06IKL8v4oqYFlbZnonO2cc8aph6IqpNgq1w==
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

SGkgQWxsLAoKT24gNS8xLzIxIDExOjExIFBNLCBTdGFmZm9yZCBIb3JuZSB3cm90ZToKPiBDaGFu
Z2VzIGZyb20gdjE6Cj4gICAtIEFkZGVkIHBhdGNoIHRvIGVuYWJsZWQgY21vZGxlPWxhcmdlIG9u
IGNydHN0dWZmCj4gCj4gVGhpcyBzZXJpZXMgZml4ZXMgc29tZSBidWdzIGZvdW5kIHdoZW4gbGlu
a2luZyBsYXJnZSBiaW5hcmllcywgYm90aCBpbiBidWlsZHJvb3QKPiBhbmQgZ2xpYmMgdGVzdGlu
Zy4KPiAKPiBTdGFmZm9yZCBIb3JuZSAoMik6Cj4gICAgb3IxazogQWRkIG1jbW9kZWwgb3B0aW9u
IHRvIGhhbmRsZSBsYXJnZSBHT1RzCj4gICAgb3IxazogVXNlIGNtb2RlbD1sYXJnZSB3aGVuIGJ1
aWxkaW5nIGNydHN0dWZmCj4gCj4gICBnY2MvY29uZmlnL29yMWsvb3Ixay1vcHRzLmggICB8IDMw
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAgZ2NjL2NvbmZpZy9vcjFrL29yMWsu
YyAgICAgICAgfCAxMSArKysrKysrKystLQo+ICAgZ2NjL2NvbmZpZy9vcjFrL29yMWsuaCAgICAg
ICAgfCAgNyArKysrKysrCj4gICBnY2MvY29uZmlnL29yMWsvb3Ixay5vcHQgICAgICB8IDE5ICsr
KysrKysrKysrKysrKysrKysKPiAgIGdjYy9kb2MvaW52b2tlLnRleGkgICAgICAgICAgIHwgMTIg
KysrKysrKysrKystCj4gICBsaWJnY2MvY29uZmlnLmhvc3QgICAgICAgICAgICB8ICA0ICsrLS0K
PiAgIGxpYmdjYy9jb25maWcvb3Ixay90LWNydHN0dWZmIHwgIDIgKysKPiAgIDcgZmlsZXMgY2hh
bmdlZCwgODAgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiAgIGNyZWF0ZSBtb2RlIDEw
MDY0NCBnY2MvY29uZmlnL29yMWsvb3Ixay1vcHRzLmgKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBs
aWJnY2MvY29uZmlnL29yMWsvdC1jcnRzdHVmZgo+IAoKSSd2ZSB0ZXN0ZWQgdGhpcyBwYXRjaHNl
dCBhbmQgd29ya3MgYXMgZXhwZWN0ZWQuCkl0IGZpeGVkIGxpYmdlb3MgYnVpbGQgZmFpbHVyZSBp
biBjb25qdW5jdGlvbiB3aXRoOgpodHRwczovL3NvdXJjZXdhcmUub3JnL2dpdC9naXR3ZWIuY2dp
P3A9YmludXRpbHMtZ2RiLmdpdDtoPTNjM2RlMjliMDQ4YmNhNmI0YWE0MjM1YzY0N2I5MzI4ZTcx
ODAxYjYKCkhvcGUgdGhpcyBoZWxwcyB0byBjb21taXQgaXQgdXBzdHJlYW0gc2luY2UgSSBzdGls
bCBkb24ndCBzZWUgaXQsIG9yIGFtIApJIHdyb25nPwoKQmVzdCByZWdhcmRzCi0tIApHaXVsaW8g
QmVuZXR0aQpCZW5ldHRpIEVuZ2luZWVyaW5nIHNhcwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlz
dHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9v
cGVucmlzYwo=
