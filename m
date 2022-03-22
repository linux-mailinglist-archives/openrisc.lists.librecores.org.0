Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 5AB0B4E391D
	for <lists+openrisc@lfdr.de>; Tue, 22 Mar 2022 07:46:15 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E41D424869;
	Tue, 22 Mar 2022 07:46:14 +0100 (CET)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id A1E0124847
 for <openrisc@lists.librecores.org>; Tue, 22 Mar 2022 07:46:12 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7B3A66148B
 for <openrisc@lists.librecores.org>; Tue, 22 Mar 2022 06:46:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 646DEC340F9
 for <openrisc@lists.librecores.org>; Tue, 22 Mar 2022 06:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647931570;
 bh=hhAPCoaMSvMdBpBGQUL4AfiQiPsS12xmMjwJk64lVwA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mTM0o6i/TnOE5bjF9tnScVcRYE5SEfzZvk98MEJMIbvS6xAyHeaxae/iYLVA7qVoL
 y9gnflHGbsnEIrgNQaidlrWeCsQvu4UH8qF5tGEnPvIhDm0bUkbSMOUGULiJvi8QFB
 0cJcQUC0WVmBHtd3ZWO4AdhceTlntVMAUcyS4b2itap/JZGhPywl0TQ8pNhJQVbpop
 38kPysWdn0XE4g2LDDZPKjtutxQAqHcIdCQVur839yRxirldUtOz9czkaeC+fKMKRh
 qm/7CrO6b6gmY2k/8pWxprJHj2m/wu8e6W/YvQqPER8dgmFyZ+wKMgfOSJwX5u9DqA
 rTkxWbl/8oDEA==
Received: by mail-vs1-f41.google.com with SMTP id m184so5601776vsm.12
 for <openrisc@lists.librecores.org>; Mon, 21 Mar 2022 23:46:10 -0700 (PDT)
X-Gm-Message-State: AOAM532B/7xVqZVp2q9PTc1GuWLNlSKuZZve9owgCYr+xG64GwxOTIEe
 d0EnMU1OWlHftf4MNJ+IW4fo7dPpDtCn9QWCWJk=
X-Google-Smtp-Source: ABdhPJy5NXfAIso2F2+24UJmT6jDU2XX7NsQdluZergkSkOFjyDuh2G4iyJgCgicmkVQYM+5Is7fWIuWhEamegVW4JQ=
X-Received: by 2002:a67:bc05:0:b0:324:eed0:ec29 with SMTP id
 t5-20020a67bc05000000b00324eed0ec29mr5402967vsn.2.1647931569197; Mon, 21 Mar
 2022 23:46:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220316232600.20419-1-palmer@rivosinc.com>
 <20220316232600.20419-4-palmer@rivosinc.com>
 <YjjuOZMzQlnqfLDJ@antec>
 <CAJF2gTSFh0NKLys7kr=UdQWHDyYgg3XmgTJtVaL37Re7QdZ8uw@mail.gmail.com>
 <YjlMIGKgYaLLpp5T@antec>
In-Reply-To: <YjlMIGKgYaLLpp5T@antec>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 22 Mar 2022 14:45:58 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRGPhhVErmgpvyGuKcwKZERdvmphDTa1n2i5jv--V+tHA@mail.gmail.com>
Message-ID: <CAJF2gTRGPhhVErmgpvyGuKcwKZERdvmphDTa1n2i5jv--V+tHA@mail.gmail.com>
To: Stafford Horne <shorne@gmail.com>
Subject: Re: [OpenRISC] [PATCH 3/5] openrisc: Move to ticket-spinlock
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
Cc: Jonas Bonn <jonas@southpole.se>, linux-arch <linux-arch@vger.kernel.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@rivosinc.com>, Ingo Molnar <mingo@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, jszhang@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Waiman Long <longman@redhat.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBNYXIgMjIsIDIwMjIgYXQgMTI6MTAgUE0gU3RhZmZvcmQgSG9ybmUgPHNob3JuZUBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBNYXIgMjIsIDIwMjIgYXQgMTE6Mjk6MTNBTSAr
MDgwMCwgR3VvIFJlbiB3cm90ZToKPiA+IE9uIFR1ZSwgTWFyIDIyLCAyMDIyIGF0IDc6MjMgQU0g
U3RhZmZvcmQgSG9ybmUgPHNob3JuZUBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBX
ZWQsIE1hciAxNiwgMjAyMiBhdCAwNDoyNTo1OFBNIC0wNzAwLCBQYWxtZXIgRGFiYmVsdCB3cm90
ZToKPiA+ID4gPiBGcm9tOiBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGluZnJhZGVhZC5vcmc+Cj4g
PiA+ID4KPiA+ID4gPiBXZSBoYXZlIG5vIGluZGljYXRpb25zIHRoYXQgb3BlbnJpc2MgbWVldHMg
dGhlIHFzcGlubG9jayByZXF1aXJlbWVudHMsCj4gPiA+ID4gc28gbW92ZSB0byB0aWNrZXQtc3Bp
bmxvY2sgYXMgdGhhdCBpcyBtb3JlIGxpa2V5IHRvIGJlIGNvcnJlY3QuCj4gPiA+ID4KPiA+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KPiA+
ID4gPgo+ID4gPiA+IC0tLQo+ID4gPiA+Cj4gPiA+ID4gSSBoYXZlIHNwZWNpZmljYWxseSBub3Qg
aW5jbHVkZWQgUGV0ZXIncyBTT0Igb24gdGhpcywgYXMgaGUgc2VudCBoaXMKPiA+ID4gPiBvcmln
aW5hbCBwYXRjaAo+ID4gPiA+IDxodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL1lIYkJCdVZG
Tm5JNGtqajNAaGlyZXoucHJvZ3JhbW1pbmcua2lja3MtYXNzLm5ldC8+Cj4gPiA+ID4gd2l0aG91
dCBvbmUuCj4gPiA+ID4gLS0tCj4gPiA+ID4gIGFyY2gvb3BlbnJpc2MvS2NvbmZpZyAgICAgICAg
ICAgICAgICAgICAgICB8IDEgLQo+ID4gPiA+ICBhcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL0ti
dWlsZCAgICAgICAgICAgfCA1ICsrLS0tCj4gPiA+ID4gIGFyY2gvb3BlbnJpc2MvaW5jbHVkZS9h
c20vc3BpbmxvY2suaCAgICAgICB8IDMgKy0tCj4gPiA+ID4gIGFyY2gvb3BlbnJpc2MvaW5jbHVk
ZS9hc20vc3BpbmxvY2tfdHlwZXMuaCB8IDIgKy0KPiA+ID4gPiAgNCBmaWxlcyBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4gPiA+Cj4gPiA+IEhlbGxvLAo+ID4gPgo+
ID4gPiBUaGlzIHNlcmllcyBicmVha3MgU01QIHN1cHBvcnQgb24gT3BlblJJU0MuICBJIGhhdmVu
J3QgdHJhY2VkIGl0IGRvd24geWV0LCBpdAo+ID4gPiBzZWVtcyB0cml2aWFsIGJ1dCBJIGhhdmUg
YSBmZXcgcGxhY2VzIHRvIGNoZWNrLgo+ID4gPgo+ID4gPiBJIHJlcGxpZWQgdG8gdGhpcyBvbiBh
IGtidWlsZCB3YXJuaW5nIHRocmVhZCwgYnV0IGFsc28gZ29pbmcgdG8gcmVwbHkgaGVyZSB3aXRo
Cj4gPiA+IG1vcmUgaW5mb3JtYXRpb24uCj4gPiA+Cj4gPiA+ICBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9sa21sL1lqZVk3Q2ZhRktqcjhJVWNAYW50ZWMvI1IKPiA+ID4KPiA+ID4gU28gZmFyIHRo
aXMgaXMgd2hhdCBJIHNlZToKPiA+ID4KPiA+ID4gICAqIHRpY2tldF9sb2NrIGlzIHN0dWNrIHRy
eWluZyB0byBsb2NrIGNvbnNvbGVfc2VtCj4gPiA+ICAgKiBpdCBpcyBzdHVjayBvbiBhdG9taWNf
Y29uZF9yZWFkX2FjcXVpcmUKPiA+ID4gICAgIHJlYWRpbmcgbG9jayB2YWx1ZTogcmV0dXJucyAw
ICAgICgqbG9jayBpcyAweDEwMDAwKQo+ID4gPiAgICAgdGlja2V0IHZhbHVlOiBpcyAxCj4gPiA+
ICAgKiBwb3NzaWJsZSBpc3N1ZXM6Cj4gPiA+ICAgICAtIE9wZW5SSVNDIGlzIGJpZyBlbmRpYW4s
IHRoYXQgc2VlbXMgdG8gaW1wYWN0IHRpY2tldF91bmxvY2ssIGl0IGxvb2tzCj4gPiBBbGwgY3Nr
eSAmIHJpc2N2IGFyZSBsaXR0bGUtZW5kaWFuLCBpdCBzZWVtcyB0aGUgc2VyaWVzIGhhcyBhIGJ1
ZyB3aXRoCj4gPiBiaWctZW5kaWFuLiBJcyB0aGF0IGFsbCByaWdodCBmb3IgcWVtdT8gKElmIHFl
bXUgd2FzIGFsbCByaWdodCwgYnV0Cj4gPiByZWFsIGhhcmR3YXJlIGZhaWxlZC4pCj4KPiBIaSBH
dW8gUmVuLAo+Cj4gT3BlblJJU0MgcmVhbCBoYXJkd2FyZSBhbmQgUUVNVSBhcmUgYm90aCBiaWct
ZW5kaWFuLiAgSXQgZmFpbHMgb24gYm90aC4KPgo+IEkgcmVwbGllZCBvbiBwYXRjaCAxLzUgd2l0
aCBhIHN1Z2dlc3RlZCBwYXRjaCB3aGljaCBmaXhlcyB0aGUgaXNzdWUgZm9yIG1lLgo+IFBsZWFz
ZSBoYXZlIGEgbG9vay4KR3JlYXQsIEkgc2F3IHRoYXQ6CgpzdGF0aWMgX19hbHdheXNfaW5saW5l
IHZvaWQgdGlja2V0X3VubG9jayhhcmNoX3NwaW5sb2NrX3QgKmxvY2spCnsKICAgICB1MTYgKnB0
ciA9ICh1MTYgKilsb2NrICsgX19pc19kZWZpbmVkKF9fQklHX0VORElBTik7Ci8vX19pc19kZWZp
bmVkKF9fQklHX0VORElBTikgd291bGQgYmUgemVybyBmb3Igb3BlbnJpc2MuCgpVc2luZyBDT05G
SUdfQ1BVX0JJR19FTkRJQU4gaXMgY29ycmVjdCwgQXJuZCBoYXMgYWxzbyBhc2tlZCBtZSB1c2lu
ZwpDT05GSUdfQ1BVX0JJR19FTkRJQU4gaW4gY29tcGF0Lmg6CgpkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9hc20tZ2VuZXJpYy9jb21wYXQuaCBiL2luY2x1ZGUvYXNtLWdlbmVyaWMvY29tcGF0LmgKaW5k
ZXggMTE2NTNkNjg0NmNjLi5kMDYzMDhhMmE3YTggMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvYXNtLWdl
bmVyaWMvY29tcGF0LmgKKysrIGIvaW5jbHVkZS9hc20tZ2VuZXJpYy9jb21wYXQuaApAQCAtMTQs
NiArMTQsMTMgQEAKICNkZWZpbmUgQ09NUEFUX09GRl9UX01BWCAgICAgICAweDdmZmZmZmZmCiAj
ZW5kaWYKCisjaWYgIWRlZmluZWQoY29tcGF0X2FyZ191NjQpICYmICFkZWZpbmVkKENPTkZJR19D
UFVfQklHX0VORElBTikKKyNkZWZpbmUgY29tcGF0X2FyZ191NjQobmFtZSkgICAgICAgICAgIHUz
MiAgbmFtZSMjX2xvLCB1MzIgIG5hbWUjI19oaQorI2RlZmluZSBjb21wYXRfYXJnX3U2NF9kdWFs
KG5hbWUpICAgICAgdTMyLCBuYW1lIyNfbG8sIHUzMiwgbmFtZSMjX2hpCisjZGVmaW5lIGNvbXBh
dF9hcmdfdTY0X2dsdWUobmFtZSkgICAgICAoKCh1NjQpbmFtZSMjX2xvICYgMHhmZmZmZmZmZlVM
KSB8IFwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoKHU2NCluYW1l
IyNfaGkgPDwgMzIpKQorI2VuZGlmCisKIC8qIFRoZXNlIHR5cGVzIGFyZSBjb21tb24gYWNyb3Nz
IGFsbCBjb21wYXQgQUJJcyAqLwogdHlwZWRlZiB1MzIgY29tcGF0X3NpemVfdDsKIHR5cGVkZWYg
czMyIGNvbXBhdF9zc2l6ZV90OwoKCgo+IEJUVy4gbm93IEkgY2FuIGxvb2sgaW50byB0aGUgc3Bh
cnNlIHdhcm5pbmdzLgo+Cj4gLVN0YWZmb3JkCj4KLS0KQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpN
TDogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtY3NreS8KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5S
SVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlz
dGluZm8vb3BlbnJpc2MK
