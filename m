Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 1090734F41B
	for <lists+openrisc@lfdr.de>; Wed, 31 Mar 2021 00:17:50 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E6F68204E2;
	Wed, 31 Mar 2021 00:17:47 +0200 (CEST)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mail.librecores.org (Postfix) with ESMTPS id D0F9621162
 for <openrisc@lists.librecores.org>; Tue, 30 Mar 2021 19:27:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=1640; q=dns/txt; s=iport;
 t=1617125241; x=1618334841;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DLlq6Eg2HUUvE9Fdg0Ebob6Tw5pX5R4uRXQoNV4sDwc=;
 b=j/y3PNVoVTnLpPuafUgszjk5Onv+jlKn/2nLZ8HA2SWez2YRqWF4zO14
 jlWC2lp5lN40J+zqhSEpImd4DAkfldwIzh/cAMg3KR6xfIUCLfTWRKmaM
 HCC+jFfsKBDcyKkROYei564/gTCGtscm+pz39c/aNgHKhT2Rzo0a+vc6T E=;
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AoTmckqE8NgKcaaN3pLqEVceALOonbusQ8z?=
 =?us-ascii?q?AX/mp6ICY7TuWzkceykPMHkTL1ki8WQnE8mdaGUZPwJE/035hz/IUXIPOeTB?=
 =?us-ascii?q?Dr0VHYTr1KwIP+z1TbcRHW2fVa0c5bHpRWKNq1NlRiiNa/3Q/QKadF/PCi0I?=
 =?us-ascii?q?SFwdjT1G1sSwYCUdAC0y5cBhyAGkN7AClqbKBZKLOm6sBKpyWtdB0sB6zROl?=
 =?us-ascii?q?A/U+fOvNHNnp79CCRnOzcc9AKMgTm0gYSVLzGk2H4lPw9n8PMF7XXPlRD/6+?=
 =?us-ascii?q?GFtfy2oyWssVP73tBxhMbrzMdFCYi3rvUtbh/oigquee1aKtq/gAw=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BhAABKXmNg/4UNJK1aHAEBAQEBAQc?=
 =?us-ascii?q?BARIBAQQEAQFAgTwHAQELAYIqgUwBOTGMZYkukAgWikWBfAsBAQENAQE0BAE?=
 =?us-ascii?q?BhFACgXoCJTQJDgIDAQEMAQEFAQEBAgEGBHGFboZFAQU6PxALGC48GwYThXi?=
 =?us-ascii?q?rInWBNIkLgUQigRcBjUkmHIFJQoESgm4uPoo2BIJHgQ6CMCyeTZwigxGBI5s?=
 =?us-ascii?q?2MRCkQrgSAgQGBQIWgVQ6gVkzGggbFYMkUBkNnQchAy84AgYKAQEDCYkfAQE?=
X-IronPort-AV: E=Sophos;i="5.81,291,1610409600"; d="scan'208";a="880406225"
Received: from alln-core-11.cisco.com ([173.36.13.133])
 by rcdn-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 30 Mar 2021 17:27:19 +0000
Received: from zorba ([10.24.8.123])
 by alln-core-11.cisco.com (8.15.2/8.15.2) with ESMTPS id 12UHREPN013894
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 30 Mar 2021 17:27:16 GMT
Date: Tue, 30 Mar 2021 10:27:14 -0700
From: Daniel Walker <danielwa@cisco.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <20210330172714.GR109100@zorba>
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
 <878228ad88df38f8914c7aa25dede3ed05c50f48.1616765869.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <878228ad88df38f8914c7aa25dede3ed05c50f48.1616765869.git.christophe.leroy@csgroup.eu>
X-Outbound-SMTP-Client: 10.24.8.123, [10.24.8.123]
X-Outbound-Node: alln-core-11.cisco.com
X-Mailman-Approved-At: Wed, 31 Mar 2021 00:17:44 +0200
Subject: Re: [OpenRISC] [PATCH v3 01/17] cmdline: Add generic function to
 build command line.
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
Cc: linux-arch@vger.kernel.org, robh@kernel.org, microblaze <monstr@monstr.eu>,
 daniel@gimpelevich.san-francisco.ca.us, devicetree@vger.kernel.org,
 linux-sh@vger.kernel.org, will@kernel.org, linux-xtensa@linux-xtensa.org,
 x86@kernel.org, linux-kernel@vger.kernel.org, nios2 <ley.foon.tan@intel.com>,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-hexagon@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gRnJpLCBNYXIgMjYsIDIwMjEgYXQgMDE6NDQ6NDhQTSArMDAwMCwgQ2hyaXN0b3BoZSBMZXJv
eSB3cm90ZToKPiBUaGlzIGNvZGUgcHJvdmlkZXMgYXJjaGl0ZWN0dXJlcyB3aXRoIGEgd2F5IHRv
IGJ1aWxkIGNvbW1hbmQgbGluZQo+IGJhc2VkIG9uIHdoYXQgaXMgYnVpbHQgaW4gdGhlIGtlcm5l
bCBhbmQgd2hhdCBpcyBoYW5kZWQgb3ZlciBieSB0aGUKPiBib290bG9hZGVyLCBiYXNlZCBvbiBz
ZWxlY3RlZCBjb21waWxlLXRpbWUgb3B0aW9ucy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3Rv
cGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+Cj4gLS0tCj4gdjM6Cj4gLSBB
ZGRyZXNzZWQgY29tbWVudHMgZnJvbSBXaWxsCj4gLSBBZGRlZCBjYXBhYmlsaXR5IHRvIGhhdmUg
c3JjID09IGRzdAo+IC0tLQo+ICBpbmNsdWRlL2xpbnV4L2NtZGxpbmUuaCB8IDU3ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA1NyBp
bnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L2NtZGxpbmUu
aAo+IAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2NtZGxpbmUuaCBiL2luY2x1ZGUvbGlu
dXgvY21kbGluZS5oCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAu
LmRlYTg3ZWRkNDFiZQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9pbmNsdWRlL2xpbnV4L2NtZGxp
bmUuaAo+IEBAIC0wLDAgKzEsNTcgQEAKPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjAgKi8KPiArI2lmbmRlZiBfTElOVVhfQ01ETElORV9ICj4gKyNkZWZpbmUgX0xJTlVYX0NN
RExJTkVfSAo+ICsKPiArI2luY2x1ZGUgPGxpbnV4L3N0cmluZy5oPgo+ICsKPiArLyogQWxsb3cg
YXJjaGl0ZWN0dXJlcyB0byBvdmVycmlkZSBzdHJsY2F0LCBwb3dlcnBjIGNhbid0IHVzZSBzdHJp
bmdzIHNvIGVhcmx5ICovCj4gKyNpZm5kZWYgY21kbGluZV9zdHJsY2F0Cj4gKyNkZWZpbmUgY21k
bGluZV9zdHJsY2F0IHN0cmxjYXQKPiArI2VuZGlmCj4gKwo+ICsvKgo+ICsgKiBUaGlzIGZ1bmN0
aW9uIHdpbGwgYXBwZW5kIG9yIHByZXBlbmQgYSBidWlsdGluIGNvbW1hbmQgbGluZSB0byB0aGUg
Y29tbWFuZAo+ICsgKiBsaW5lIHByb3ZpZGVkIGJ5IHRoZSBib290bG9hZGVyLiBLY29uZmlnIG9w
dGlvbnMgY2FuIGJlIHVzZWQgdG8gYWx0ZXIKPiArICogdGhlIGJlaGF2aW9yIG9mIHRoaXMgYnVp
bHRpbiBjb21tYW5kIGxpbmUuCj4gKyAqIEBkc3Q6IFRoZSBkZXN0aW5hdGlvbiBvZiB0aGUgZmlu
YWwgYXBwZW5kZWQvcHJlcGVuZGVkIHN0cmluZy4KPiArICogQHNyYzogVGhlIHN0YXJ0aW5nIHN0
cmluZyBvciBOVUxMIGlmIHRoZXJlIGlzbid0IG9uZS4KPiArICogQGxlbjogdGhlIGxlbmd0aCBv
ZiBkZXN0IGJ1ZmZlci4KPiArICovCgpBcHBlbmQgb3IgcHJlcGVuZCA/IENpc2NvIHJlcXVpcmVz
IGJvdGggYXQgdGhlIHNhbWUgdGltZS4gVGhpcyBpcyB3aHkgbXkKaW1wbGVtZW50YXRpb24gcHJv
dmlkZXMgYm90aC4gSSBjYW4ndCB1c2UgdGhpcyB3aXRoIGJvdGggYXQgb25jZS4KCkRhbmllbApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBt
YWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5s
aWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
