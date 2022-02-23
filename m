Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id BDC5F4C2040
	for <lists+openrisc@lfdr.de>; Thu, 24 Feb 2022 00:51:06 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6CF222414D;
	Thu, 24 Feb 2022 00:51:06 +0100 (CET)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id 20F852414D
 for <openrisc@lists.librecores.org>; Thu, 24 Feb 2022 00:31:03 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B865561A00;
 Wed, 23 Feb 2022 23:31:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62A8BC340E7;
 Wed, 23 Feb 2022 23:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645659061;
 bh=lqCEQ++vi7cgL8SGDqvu6VRtg8aruPJlQBSjPBXBFVM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=sbRe9FkUPCxCGG5QhSpQFHALisL4a0h67bCxhSLbAt1nLiwP1yIOk1Uj7FSa6KCb5
 weBLktMX2iJ1azUVoI5qzyIPsB248hdzJqK4FY8iQs4ijX9ClxGFEG4dPQ2t94Tu+v
 xnm83JKO7FsjVlGtupBZVZ1sGqkMArGtNnLjnEwqgMRRugYsRTn+yfOLhixpTMveFC
 hFyJk7dTbBRw3IsZy86rcTOonVkHxoMQs0BGW96T4vsXyVidvkbPH0uwFh8RFITz5K
 oD3k8dsNBCQPOLOspB8IOHbjF16KCCmPClOP9aOj20bxN2gTg9NdvWcdAxevymW0xQ
 hD4A1zZdc89kw==
Message-ID: <c6f461f1-1dd9-aec1-2c85-a3eda478a1be@kernel.org>
Date: Wed, 23 Feb 2022 17:30:53 -0600
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
 <20220216131332.1489939-8-arnd@kernel.org>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20220216131332.1489939-8-arnd@kernel.org>
X-Mailman-Approved-At: Thu, 24 Feb 2022 00:51:04 +0100
Subject: Re: [OpenRISC] [PATCH v2 07/18] nios2: drop access_ok() check from
 __put_user()
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
Z21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gCj4gVW5saWtlIG90aGVyIGFyY2hpdGVjdHVyZXMsIHRo
ZSBuaW9zMiB2ZXJzaW9uIG9mIF9fcHV0X3VzZXIoKSBoYXMgYW4KPiBleHRyYSBjaGVjayBmb3Ig
YWNjZXNzX29rKCksIHByZXZlbnRpbmcgaXQgZnJvbSBiZWluZyB1c2VkIHRvIGltcGxlbWVudAo+
IF9fcHV0X2tlcm5lbF9ub2ZhdWx0KCkuCj4gCj4gU3BsaXQgdXAgcHV0X3VzZXIoKSBhbG9uZyB0
aGUgc2FtZSBsaW5lcyBhcyBfX2dldF91c2VyKCkvZ2V0X3VzZXIoKQo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gLS0tCj4gICBhcmNoL25pb3MyL2lu
Y2x1ZGUvYXNtL3VhY2Nlc3MuaCB8IDU2ICsrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0t
Cj4gICAxIGZpbGUgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgMjMgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvbmlvczIvaW5jbHVkZS9hc20vdWFjY2Vzcy5oIGIvYXJjaC9u
aW9zMi9pbmNsdWRlL2FzbS91YWNjZXNzLmgKPiBpbmRleCBjYTkyODVhOTE1ZWYuLmE1Y2JlMDdj
ZjBkYSAxMDA2NDQKPiAtLS0gYS9hcmNoL25pb3MyL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaAo+ICsr
KyBiL2FyY2gvbmlvczIvaW5jbHVkZS9hc20vdWFjY2Vzcy5oCj4gQEAgLTE2NywzNCArMTY3LDQ0
IEBAIGRvIHsJCQkJCQkJCQlcCj4gICAJOiAiciIgKHZhbCksICJyIiAocHRyKSwgImkiICgtRUZB
VUxUKSk7CQkJCVwKPiAgIH0KPiAgIAo+IC0jZGVmaW5lIHB1dF91c2VyKHgsIHB0cikJCQkJCQlc
Cj4gKyNkZWZpbmUgX19wdXRfdXNlcl9jb21tb24oX19wdV92YWwsIF9fcHVfcHRyKQkJCQlcCj4g
ICAoewkJCQkJCQkJCVwKPiAgIAlsb25nIF9fcHVfZXJyID0gLUVGQVVMVDsJCQkJCVwKPiAtCV9f
dHlwZW9mX18oKihwdHIpKSBfX3VzZXIgKl9fcHVfcHRyID0gKHB0cik7CQkJXAo+IC0JX190eXBl
b2ZfXygqKHB0cikpIF9fcHVfdmFsID0gKF9fdHlwZW9mKCpwdHIpKSh4KTsJCVwKPiAtCWlmIChh
Y2Nlc3Nfb2soX19wdV9wdHIsIHNpemVvZigqX19wdV9wdHIpKSkgewlcCj4gLQkJc3dpdGNoIChz
aXplb2YoKl9fcHVfcHRyKSkgewkJCQlcCj4gLQkJY2FzZSAxOgkJCQkJCQlcCj4gLQkJCV9fcHV0
X3VzZXJfYXNtKF9fcHVfdmFsLCAic3RiIiwgX19wdV9wdHIsIF9fcHVfZXJyKTsgXAo+IC0JCQli
cmVhazsJCQkJCQlcCj4gLQkJY2FzZSAyOgkJCQkJCQlcCj4gLQkJCV9fcHV0X3VzZXJfYXNtKF9f
cHVfdmFsLCAic3RoIiwgX19wdV9wdHIsIF9fcHVfZXJyKTsgXAo+IC0JCQlicmVhazsJCQkJCQlc
Cj4gLQkJY2FzZSA0OgkJCQkJCQlcCj4gLQkJCV9fcHV0X3VzZXJfYXNtKF9fcHVfdmFsLCAic3R3
IiwgX19wdV9wdHIsIF9fcHVfZXJyKTsgXAo+IC0JCQlicmVhazsJCQkJCQlcCj4gLQkJZGVmYXVs
dDoJCQkJCQlcCj4gLQkJCS8qIFhYWDogVGhpcyBsb29rcyB3cm9uZy4uLiAqLwkJCVwKPiAtCQkJ
X19wdV9lcnIgPSAwOwkJCQkJXAo+IC0JCQlpZiAoY29weV90b191c2VyKF9fcHVfcHRyLCAmKF9f
cHVfdmFsKSwJCVwKPiAtCQkJCXNpemVvZigqX19wdV9wdHIpKSkJCQlcCj4gLQkJCQlfX3B1X2Vy
ciA9IC1FRkFVTFQ7CQkJXAo+IC0JCQlicmVhazsJCQkJCQlcCj4gLQkJfQkJCQkJCQlcCj4gKwlz
d2l0Y2ggKHNpemVvZigqX19wdV9wdHIpKSB7CQkJCQlcCj4gKwljYXNlIDE6CQkJCQkJCQlcCj4g
KwkJX19wdXRfdXNlcl9hc20oX19wdV92YWwsICJzdGIiLCBfX3B1X3B0ciwgX19wdV9lcnIpOwlc
Cj4gKwkJYnJlYWs7CQkJCQkJCVwKPiArCWNhc2UgMjoJCQkJCQkJCVwKPiArCQlfX3B1dF91c2Vy
X2FzbShfX3B1X3ZhbCwgInN0aCIsIF9fcHVfcHRyLCBfX3B1X2Vycik7CVwKPiArCQlicmVhazsJ
CQkJCQkJXAo+ICsJY2FzZSA0OgkJCQkJCQkJXAo+ICsJCV9fcHV0X3VzZXJfYXNtKF9fcHVfdmFs
LCAic3R3IiwgX19wdV9wdHIsIF9fcHVfZXJyKTsJXAo+ICsJCWJyZWFrOwkJCQkJCQlcCj4gKwlk
ZWZhdWx0OgkJCQkJCQlcCj4gKwkJLyogWFhYOiBUaGlzIGxvb2tzIHdyb25nLi4uICovCQkJCVwK
PiArCQlfX3B1X2VyciA9IDA7CQkJCQkJXAo+ICsJCWlmIChfX2NvcHlfdG9fdXNlcihfX3B1X3B0
ciwgJihfX3B1X3ZhbCksCQlcCj4gKwkJCXNpemVvZigqX19wdV9wdHIpKSkJCQkJXAo+ICsJCQlf
X3B1X2VyciA9IC1FRkFVTFQ7CQkJCVwKPiArCQlicmVhazsJCQkJCQkJXAo+ICAgCX0JCQkJCQkJ
CVwKPiAgIAlfX3B1X2VycjsJCQkJCQkJXAo+ICAgfSkKPiAgIAo+IC0jZGVmaW5lIF9fcHV0X3Vz
ZXIoeCwgcHRyKSBwdXRfdXNlcih4LCBwdHIpCj4gKyNkZWZpbmUgX19wdXRfdXNlcih4LCBwdHIp
CQkJCQkJXAo+ICsoewkJCQkJCQkJCVwKPiArCV9fYXV0b190eXBlIF9fcHVfcHRyID0gKHB0cik7
CQkJCQlcCj4gKwl0eXBlb2YoKl9fcHVfcHRyKSBfX3B1X3ZhbCA9ICh0eXBlb2YoKl9fcHVfcHRy
KSkoeCk7CQlcCj4gKwlfX3B1dF91c2VyX2NvbW1vbihfX3B1X3ZhbCwgX19wdV9wdHIpOwkJCQlc
Cj4gK30pCj4gKwo+ICsjZGVmaW5lIHB1dF91c2VyKHgsIHB0cikJCQkJCQlcCj4gKyh7CQkJCQkJ
CQkJXAo+ICsJX19hdXRvX3R5cGUgX19wdV9wdHIgPSAocHRyKTsJCQkJCVwKPiArCXR5cGVvZigq
X19wdV9wdHIpIF9fcHVfdmFsID0gKHR5cGVvZigqX19wdV9wdHIpKSh4KTsJCVwKPiArCWFjY2Vz
c19vayhfX3B1X3B0ciwgc2l6ZW9mKCpfX3B1X3B0cikpID8JCQlcCj4gKwkJX19wdXRfdXNlcl9j
b21tb24oX19wdV92YWwsIF9fcHVfcHRyKSA6CQkJXAo+ICsJCS1FRkFVTFQ7CQkJCQkJXAo+ICt9
KQo+ICAgCj4gICAjZW5kaWYgLyogX0FTTV9OSU9TMl9VQUNDRVNTX0ggKi8KCkFja2VkLWJ5OiBE
aW5oIE5ndXllbiA8ZGluZ3V5ZW5Aa2VybmVsLm9yZz4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxp
c3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8v
b3BlbnJpc2MK
