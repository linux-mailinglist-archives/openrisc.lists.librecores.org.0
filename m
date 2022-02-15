Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 955C04B649F
	for <lists+openrisc@lfdr.de>; Tue, 15 Feb 2022 08:47:39 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 16494242D7;
	Tue, 15 Feb 2022 08:47:39 +0100 (CET)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by mail.librecores.org (Postfix) with ESMTPS id E9F042412D
 for <openrisc@lists.librecores.org>; Tue, 15 Feb 2022 08:47:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644911179;
 bh=Gg0eXtIflg4YSdhde6TPBD88ytt9vELXByFDX1EvH5o=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=cL8nOU4P5zROD6QnSaMf+IFH1JNakyChC41kZoyLmoh4OfhoEdCE5EpqWukFvfrr7
 bbAty2PKJpf0Ivg7eDWbBX9KS9Ervz4FISwmJMXSrYDExxKjWqh9fx5gCxmn7+bcB3
 7iZgNWIrcC7CBfK5HN/OAh9s+XgKDV5Ya7JTmsv0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.185.100]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N8obG-1oOVrh0Ttm-015uP2; Tue, 15
 Feb 2022 08:46:19 +0100
Message-ID: <215c0ddc-54b1-bcb1-c5aa-bd17c6b100a8@gmx.de>
Date: Tue, 15 Feb 2022 08:46:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Al Viro <viro@zeniv.linux.org.uk>, Arnd Bergmann <arnd@kernel.org>
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-15-arnd@kernel.org>
 <YgsYD2nW9GjWJtn5@zeniv-ca.linux.org.uk>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <YgsYD2nW9GjWJtn5@zeniv-ca.linux.org.uk>
X-Provags-ID: V03:K1:YbVX8I9McP/aOoptX/QU6xXsMUxj5l3eWtWKIf3O+jL0xku9qtG
 Zvd7JXlVOTeAkMcrw4ura0jf9AQkk5D8MaemK64qHhWPazHfq3pPTRp36Jgwt+Bz560jUXw
 EnyWRjxioFtmKG1I+4nkiaSRoRlQJJpM92uIMgDane+QxlF3STQpbB16Ci0R4wmVz76au1k
 fLV9rswEGC1K4sHhia8eg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NC2D0g2S/Ac=:jSN2OiozPQ2+o13baar10P
 DJFvuJskDJlqwL6taTUNifHjp6CHOCpvH/lM0r8+MeU/IkrDDHBhH7pRYm+9PYQbT3DikuN8Y
 wf2pthhc9JA07KaIYOCZHITmk9asiC4cauJ+KYyIdugvzYTERUeyCi5tklyg6ddqAnY1mFXMN
 IzsYV9Agn4+eqyWx2YPB+vSH14egrQuc/WXYTR5MDXWYgDRkNEUQHagx0PKYbtEOFZOjTpuL2
 mtoM7yAXNS7drjcOzyM19nnxtKwylBBQYcLPkj218FbcLL2vzhJHiHAWd24/Q9W3s09nHCIE6
 fGumtyqCsMeSqw0mMH4wo+GvEWCCG6H4FoL+qDBFD2sodlwN+X7gfqBSW11rLH+XM3x8YM8NN
 J54e3TA+Vei8jw4LRGe9Ymmqhkiqk6Uc6Wko0CB9iTVPAtnltjRfoYslftpQXOaFdBUYl2aok
 k0g9BBm17D0XENQhlxsLa+WnayrWKt6yhyp1M7UGChhokjicHtvLAIy7ZtiZebwac9KgVxHVd
 AQSmSlQgCo0OBFalh6iMSakk2BLgIjbIZKPGF2lt07iBIKj3hrvythTjqM9Kx9g4Mb9yKKUiR
 3hX3nB3W5yrzrvjAHjmMzLC5EmkRc15EoGpyfTlWnxkgto9eQnU+aUViFusixT5EpyIl2ug8Q
 H4Kk+m6f3GVxVKL2Cx0ClZdpN0Zw+GeYYd7Pke8Y8nEMm549lY9iGBFHXyCw8F2oNiBZVz/4+
 r1+Nz55zL4OErT4gqcqQim8TkBXvrLFJFeMF9Rs2Sr1cbQ0e8NM+TnoZSBjb2f9bWY8kh7F1o
 qu/V8M1FYX5b55nnwZEcROdmSlyYYHcymV+Yhds+gLhP/FS7CDLGp9IQz74c+WtjVrbg1a9ol
 wtrU5pIjiq/IBVYjCGlvJkUiX5qyYdvO48Ut1Tm1RMknPly6TVv5RW4v9ku8Y61mAR2Xi+BzF
 wgnYdYR+Vn0Nzr7bHUXkOqVZlT4a138K2E/bPk4wyFt6d5rh0A1e53c9E5+hNVMfoUb38M8eC
 IpYPs2Cvw5bMlKnUT33aNolZnoMt9Z+67iy8yZqI7/YHnt36EIgrIQMWOt9AaL+QmqLMHPGxA
 Krl57Lr0WyEtCA=
Subject: Re: [OpenRISC] [PATCH 14/14] uaccess: drop set_fs leftovers
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
 linux-sh@vger.kernel.org, peterz@infradead.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, guoren@kernel.org, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 will@kernel.org, Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, bcain@codeaurora.org, mpe@ellerman.id.au,
 x86@kernel.org, linux@armlinux.org.uk, linux-csky@vger.kernel.org,
 ardb@kernel.org, mingo@redhat.com, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, arnd@arndb.de, hca@linux.ibm.com,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, green.hu@gmail.com,
 linux-arm-kernel@lists.infradead.org, monstr@monstr.eu,
 tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, nickhu@andestech.com,
 jcmvbkbc@gmail.com, linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 dinguyen@kernel.org, ebiederm@xmission.com, richard@nod.at,
 akpm@linux-foundation.org, Linus Torvalds <torvalds@linux-foundation.org>,
 davem@davemloft.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gMi8xNS8yMiAwNDowMywgQWwgVmlybyB3cm90ZToKPiBPbiBNb24sIEZlYiAxNCwgMjAyMiBh
dCAwNTozNDo1MlBNICswMTAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+PiBkaWZmIC0tZ2l0IGEv
YXJjaC9wYXJpc2MvaW5jbHVkZS9hc20vZnV0ZXguaCBiL2FyY2gvcGFyaXNjL2luY2x1ZGUvYXNt
L2Z1dGV4LmgKPj4gaW5kZXggYjU4MzUzMjVkNDRiLi4yZjRhMWIxZWYzODcgMTAwNjQ0Cj4+IC0t
LSBhL2FyY2gvcGFyaXNjL2luY2x1ZGUvYXNtL2Z1dGV4LmgKPj4gKysrIGIvYXJjaC9wYXJpc2Mv
aW5jbHVkZS9hc20vZnV0ZXguaAo+PiBAQCAtOTksNyArOTksNyBAQCBmdXRleF9hdG9taWNfY21w
eGNoZ19pbmF0b21pYyh1MzIgKnV2YWwsIHUzMiBfX3VzZXIgKnVhZGRyLAo+PiAgCS8qIGZ1dGV4
LmMgd2FudHMgdG8gZG8gYSBjbXB4Y2hnX2luYXRvbWljIG9uIGtlcm5lbCBOVUxMLCB3aGljaCBp
cwo+PiAgCSAqIG91ciBnYXRld2F5IHBhZ2UsIGFuZCBjYXVzZXMgbm8gZW5kIG9mIHRyb3VibGUu
Li4KPj4gIAkgKi8KPj4gLQlpZiAodWFjY2Vzc19rZXJuZWwoKSAmJiAhdWFkZHIpCj4+ICsJaWYg
KCF1YWRkcikKPj4gIAkJcmV0dXJuIC1FRkFVTFQ7Cj4KPiAJSHVoPyAgdWFjY2Vzc19rZXJuZWwo
KSBpcyByZW1vdmVkIHNpbmNlIGl0IGJlY29tZXMgYWx3YXlzIGZhbHNlIG5vdywKPiBzbyB0aGlz
IGxvb2tzIG9kZC4KPgo+IAlBRkFJQ1MsIHRoZSBjb21tZW50IGFib3ZlIHRoYXQgY2hlY2sgcmVm
ZXJzIHRvIGZ1dGV4X2RldGVjdF9jbXB4Y2hnKCkKPiAtPiBjbXB4Y2hnX2Z1dGV4X3ZhbHVlX2xv
Y2tlZCgpIC0+IGZ1dGV4X2F0b21pY19jbXB4Y2hnX2luYXRvbWljKCkgY2FsbCBjaGFpbi4KPiBX
aGljaCBoYWQgYmVlbiBnb25lIHNpbmNlIGNvbW1pdCAzMjk3NDgxZDY4OGEgKGZ1dGV4OiBSZW1v
dmUgZnV0ZXhfY21weGNoZwo+IGRldGVjdGlvbikuICBUaGUgY29tbWVudCAqYW5kKiB0aGUgY2hl
Y2sgc2hvdWxkJ3ZlIGJlZW4ga2lsbGVkIG9mZiBiYWNrCj4gdGhlbi4KPiAJTGV0J3MgbWFrZSBz
dXJlIHRvIGdldCBib3RoIG5vdy4uLgoKUmlnaHQuIEFybmQsIGNhbiB5b3UgZHJvcCB0aGlzIGlm
KCkgYW5kIHRoZSBjb21tZW50IGFib3ZlIGl0PwoKVGhhbmtzLApIZWxnZQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QK
T3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9y
Zy9saXN0aW5mby9vcGVucmlzYwo=
