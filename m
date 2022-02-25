Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A45764C3D46
	for <lists+openrisc@lfdr.de>; Fri, 25 Feb 2022 05:33:58 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6777F24827;
	Fri, 25 Feb 2022 05:33:58 +0100 (CET)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by mail.librecores.org (Postfix) with ESMTPS id B9E9824821
 for <openrisc@lists.librecores.org>; Fri, 25 Feb 2022 05:33:56 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2D636B829CF;
 Fri, 25 Feb 2022 04:33:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF2F6C340E7;
 Fri, 25 Feb 2022 04:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645763634;
 bh=uh4UnFdDR53Ujc6m18f6ctjt+AIyhJXv2xufWpNaVhA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Uvtrsu50Hf9ISgTqjw2cZIY/fdalMvrStTdfqoQM3mdhWwRTlcM+di3Mlxj2LfRYC
 sL2lOFI5CCKzGB0MNHSMJUWPqE4dtIOpz2JXIrS4+Xkvjw7ulJEnCWAELTi2BsI79T
 +YcmqfASppeT6+G8sHwqPvTdqA+0hk873k0laznUkKMLOPw4ZEEscH10+2t1L5fKp+
 8BfsQshsS4Im5IcgpwMXaxmFYPmHS4QO6tZE5Cu6VT+1C4lCHB7iNpJZvNEdHwtoNJ
 zTpbMfhiIoucAZFTRmPZuLhWqy/lBlhaelfx8iUJ+lK7d4LQiirbG9AaOIPIgpnmXG
 aNgH1u0nAoM1w==
Message-ID: <3927b6f5-c8d0-1421-407d-850ede02dd0f@kernel.org>
Date: Thu, 24 Feb 2022 22:33:46 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-19-arnd@kernel.org>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20220216131332.1489939-19-arnd@kernel.org>
Subject: Re: [OpenRISC] [PATCH v2 18/18] uaccess: drop maining CONFIG_SET_FS
 users
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
Cc: mark.rutland@arm.com, dalias@libc.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, peterz@infradead.org, jcmvbkbc@gmail.com,
 guoren@kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, will@kernel.org, ardb@kernel.org,
 linux-s390@vger.kernel.org, bcain@codeaurora.org, mpe@ellerman.id.au,
 deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk,
 linux-csky@vger.kernel.org, mingo@redhat.com,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 hca@linux.ibm.com, linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 green.hu@gmail.com, monstr@monstr.eu, tsbogend@alpha.franken.de,
 linux-parisc@vger.kernel.org, nickhu@andestech.com, linux-mips@vger.kernel.org,
 ebiederm@xmission.com, richard@nod.at, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

CgpPbiAyLzE2LzIyIDA3OjEzLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+IEZyb206IEFybmQgQmVy
Z21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gCj4gVGhlcmUgYXJlIG5vIHJlbWFpbmluZyBjYWxsZXJz
IG9mIHNldF9mcygpLCBzbyBDT05GSUdfU0VUX0ZTCj4gY2FuIGJlIHJlbW92ZWQgZ2xvYmFsbHks
IGFsb25nIHdpdGggdGhlIHRocmVhZF9pbmZvIGZpZWxkIGFuZAo+IGFueSByZWZlcmVuY2VzIHRv
IGl0Lgo+IAo+IFRoaXMgdHVybnMgYWNjZXNzX29rKCkgaW50byBhIGNoZWFwZXIgY2hlY2sgYWdh
aW5zdCBUQVNLX1NJWkVfTUFYLgo+IAo+IFdpdGggQ09ORklHX1NFVF9GUyBnb25lLCBzbyBkcm9w
IGFsbCByZW1haW5pbmcgcmVmZXJlbmNlcyB0bwo+IHNldF9mcygpL2dldF9mcygpLCBtbV9zZWdt
ZW50X3QgYW5kIHVhY2Nlc3Nfa2VybmVsKCkuCj4gCj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJn
bWFubiA8YXJuZEBhcm5kYi5kZT4KPiAtLS0KPiAgIGFyY2gvS2NvbmZpZyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDMgLQo+ICAgYXJjaC9hbHBoYS9LY29uZmlnICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgMSAtCj4gICBhcmNoL2FscGhhL2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5o
ICAgICAgICB8ICA0IC0tCj4gICBhcmNoL2FscGhhL2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmgg
ICAgICB8ICAyIC0KPiAgIGFyY2gvYWxwaGEvaW5jbHVkZS9hc20vdWFjY2Vzcy5oICAgICAgICAg
IHwgMTkgLS0tLS0tCj4gICBhcmNoL2FyYy9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAxIC0KPiAgIGFyY2gvYXJjL2luY2x1ZGUvYXNtL3NlZ21lbnQuaCAgICAgICAgICAgIHwg
MjAgLS0tLS0tLQo+ICAgYXJjaC9hcmMvaW5jbHVkZS9hc20vdGhyZWFkX2luZm8uaCAgICAgICAg
fCAgMyAtCj4gICBhcmNoL2FyYy9pbmNsdWRlL2FzbS91YWNjZXNzLmggICAgICAgICAgICB8ICAx
IC0KPiAgIGFyY2gvYXJtL2xpYi91YWNjZXNzX3dpdGhfbWVtY3B5LmMgICAgICAgIHwgMTAgLS0t
LQo+ICAgYXJjaC9jc2t5L0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSAtCj4g
ICBhcmNoL2Nza3kvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmggICAgICAgICB8ICAyIC0KPiAgIGFy
Y2gvY3NreS9pbmNsdWRlL2FzbS9zZWdtZW50LmggICAgICAgICAgIHwgMTAgLS0tLQo+ICAgYXJj
aC9jc2t5L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmggICAgICAgfCAgMiAtCj4gICBhcmNoL2Nz
a3kvaW5jbHVkZS9hc20vdWFjY2Vzcy5oICAgICAgICAgICB8ICAzIC0KPiAgIGFyY2gvY3NreS9r
ZXJuZWwvYXNtLW9mZnNldHMuYyAgICAgICAgICAgIHwgIDEgLQo+ICAgYXJjaC9oODMwMC9LY29u
ZmlnICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSAtCj4gICBhcmNoL2g4MzAwL2luY2x1ZGUv
YXNtL3Byb2Nlc3Nvci5oICAgICAgICB8ICAxIC0KPiAgIGFyY2gvaDgzMDAvaW5jbHVkZS9hc20v
c2VnbWVudC5oICAgICAgICAgIHwgNDAgLS0tLS0tLS0tLS0tLQo+ICAgYXJjaC9oODMwMC9pbmNs
dWRlL2FzbS90aHJlYWRfaW5mby5oICAgICAgfCAgMyAtCj4gICBhcmNoL2g4MzAwL2tlcm5lbC9l
bnRyeS5TICAgICAgICAgICAgICAgICB8ICAxIC0KPiAgIGFyY2gvaDgzMDAva2VybmVsL2hlYWRf
cmFtLlMgICAgICAgICAgICAgIHwgIDEgLQo+ICAgYXJjaC9oODMwMC9tbS9pbml0LmMgICAgICAg
ICAgICAgICAgICAgICAgfCAgNiAtLQo+ICAgYXJjaC9oODMwMC9tbS9tZW1vcnkuYyAgICAgICAg
ICAgICAgICAgICAgfCAgMSAtCj4gICBhcmNoL2hleGFnb24vS2NvbmZpZyAgICAgICAgICAgICAg
ICAgICAgICB8ICAxIC0KPiAgIGFyY2gvaGV4YWdvbi9pbmNsdWRlL2FzbS90aHJlYWRfaW5mby5o
ICAgIHwgIDYgLS0KPiAgIGFyY2gvaGV4YWdvbi9rZXJuZWwvcHJvY2Vzcy5jICAgICAgICAgICAg
IHwgIDEgLQo+ICAgYXJjaC9taWNyb2JsYXplL0tjb25maWcgICAgICAgICAgICAgICAgICAgfCAg
MSAtCj4gICBhcmNoL21pY3JvYmxhemUvaW5jbHVkZS9hc20vdGhyZWFkX2luZm8uaCB8ICA2IC0t
Cj4gICBhcmNoL21pY3JvYmxhemUvaW5jbHVkZS9hc20vdWFjY2Vzcy5oICAgICB8IDI0IC0tLS0t
LS0tCj4gICBhcmNoL21pY3JvYmxhemUva2VybmVsL2FzbS1vZmZzZXRzLmMgICAgICB8ICAxIC0K
PiAgIGFyY2gvbWljcm9ibGF6ZS9rZXJuZWwvcHJvY2Vzcy5jICAgICAgICAgIHwgIDEgLQo+ICAg
YXJjaC9uZHMzMi9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSAtCj4gICBhcmNo
L25kczMyL2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmggICAgICB8ICA0IC0tCj4gICBhcmNoL25k
czMyL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCAgICAgICAgICB8IDE1ICstLS0tCj4gICBhcmNoL25k
czMyL2tlcm5lbC9wcm9jZXNzLmMgICAgICAgICAgICAgICB8ICA1ICstCj4gICBhcmNoL25kczMy
L21tL2FsaWdubWVudC5jICAgICAgICAgICAgICAgICB8ICAzIC0KPiAgIGFyY2gvbmlvczIvS2Nv
bmZpZyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgLQo+ICAgYXJjaC9uaW9zMi9pbmNsdWRl
L2FzbS90aHJlYWRfaW5mby5oICAgICAgfCAgOSAtLS0KPiAgIGFyY2gvbmlvczIvaW5jbHVkZS9h
c20vdWFjY2Vzcy5oICAgICAgICAgIHwgMTIgLS0tLQoKRm9yIE5JT1MyOgoKQWNrZWQtYnk6IERp
bmggTmd1eWVuIDxkaW5ndXllbkBrZXJuZWwub3JnPgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlz
dHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9v
cGVucmlzYwo=
