Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D218F3E3DEB
	for <lists+openrisc@lfdr.de>; Mon,  9 Aug 2021 04:30:10 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8A258213CC;
	Mon,  9 Aug 2021 04:30:10 +0200 (CEST)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by mail.librecores.org (Postfix) with ESMTPS id 6050C213CC
 for <openrisc@lists.librecores.org>; Mon,  9 Aug 2021 04:30:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=bZYo8E3NoPCdQsD1K8epoiMvW0tENbZpp7jmQByQbzE=; b=V0y7Uk5ZnkDlA5jxT4+U9agg+U
 DGUsIrFPHMeHHPWmK79y/v0kxo2o+K5746ApR1c3sSkKc6IDn6Sqi7eyRVlqt5v+NjBtktL3CusoK
 shzlfGov1ATLs928lfeatp+8m7Bpts2VospHMkT4M5tgINs+mB0I4+hwuM9g+zkWSmHlCosLIP19N
 Tpbw8pF6jP2WSIFK8s7jrWomvOyB9ji/cBg1e6NGFWQ1JFfDAGiXuQCj0jNF1VZdYH0aX8vpcLZZS
 S67gTmRVQ18WqjJMNBf+Nr6oUjkuvOEl6HOkv7PakgGYFtTYZ9DALejovf0kDcgZ9J31KFX6n4Kvj
 Pr/5N6Qg==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCv1w-00AXWB-BY; Mon, 09 Aug 2021 02:28:55 +0000
To: Guenter Roeck <linux@roeck-us.net>, Stafford Horne <shorne@gmail.com>
References: <20210805030035.2994973-1-shorne@gmail.com>
 <20210809013128.GA3698029@roeck-us.net>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <0a3de28d-17d5-ec22-0ffb-97f5ca11c127@infradead.org>
Date: Sun, 8 Aug 2021 19:28:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210809013128.GA3698029@roeck-us.net>
Content-Language: en-US
Subject: Re: [OpenRISC] [PATCH] openrisc: Fix compiler warnings in setup
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
Cc: Jonas Bonn <jonas@southpole.se>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 kernel test robot <lkp@intel.com>, LKML <linux-kernel@vger.kernel.org>,
 Openrisc <openrisc@lists.librecores.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gOC84LzIxIDY6MzEgUE0sIEd1ZW50ZXIgUm9lY2sgd3JvdGU6Cj4gT24gVGh1LCBBdWcgMDUs
IDIwMjEgYXQgMTI6MDA6MzNQTSArMDkwMCwgU3RhZmZvcmQgSG9ybmUgd3JvdGU6Cj4+IFRoaXMg
d2FzIHBvaW50ZWQgb3V0IHdpdGggdGhlIHJlY2VudCBuYW1lIGNoYW5nZSBvZiBvcjMyX2Vhcmx5
X3NldHVwIHRvCj4+IG9yMWtfZWFybHlfc2V0dXAuICBJbnZlc3RpZ2F0aW5nIHRoZSBmaWxlIEkg
Zm91bmQgYSBmZXcgb3RoZXIgd2FybmluZ3MKPj4gc28gY2xlYW5pbmcgdGhlbSB1cCBoZXJlLgo+
Pgo+PiAgICAgIGFyY2gvb3BlbnJpc2Mva2VybmVsL3NldHVwLmM6MjIwOjEzOiB3YXJuaW5nOiBu
byBwcmV2aW91cyBwcm90b3R5cGUgZm9yICdvcjFrX2Vhcmx5X3NldHVwJyBbLVdtaXNzaW5nLXBy
b3RvdHlwZXNdCj4+ICAgICAgICAyMjAgfCB2b2lkIF9faW5pdCBvcjFrX2Vhcmx5X3NldHVwKHZv
aWQgKmZkdCkKPj4gCSAgfCAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+Cj4+Cj4+IEZpeCB0
aGlzIHRoZSBtaXNzaW5nIG9yMWtfZWFybHlfc2V0dXAgcHJvdG90eXBlIHdhcm5pbmcgYnkgYWRk
aW5nIGFuCj4+IGFzbS9zZXR1cC5oIGZpbGUgdG8gZGVmaW5lIHRoZSBwcm90b3R5cGUuCj4+Cj4+
ICAgICAgYXJjaC9vcGVucmlzYy9rZXJuZWwvc2V0dXAuYzoyNDY6MTM6IHdhcm5pbmc6IG5vIHBy
ZXZpb3VzIHByb3RvdHlwZSBmb3IgJ2RldGVjdF91bml0X2NvbmZpZycgWy1XbWlzc2luZy1wcm90
b3R5cGVzXQo+PiAgICAgICAgMjQ2IHwgdm9pZCBfX2luaXQgZGV0ZWN0X3VuaXRfY29uZmlnKHVu
c2lnbmVkIGxvbmcgdXByLCB1bnNpZ25lZCBsb25nIG1hc2ssCj4+IAkgIHwgICAgICAgICAgICAg
Xn5+fn5+fn5+fn5+fn5+fn5+Cj4+Cj4+IFRoZSBmdW5jdGlvbiBkZXRlY3RfdW5pdF9jb25maWcg
aXMgbm90IHVzZWQsIGp1c3QgcmVtb3ZlIGl0Lgo+Pgo+PiAgICAgIGFyY2gvb3BlbnJpc2Mva2Vy
bmVsL3NldHVwLmM6MjIxOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdm
ZHQnIG5vdCBkZXNjcmliZWQgaW4gJ29yMWtfZWFybHlfc2V0dXAnCj4+Cj4+IEFkZCBAZmR0IGRv
Y3MgdG8gdGhlIGZ1bmN0aW9uIGNvbW1lbnQgdG8gc3VwcHJlc3MgdGhpcyB3YXJuaW5nLgo+Pgo+
PiBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4+IFNpZ25l
ZC1vZmYtYnk6IFN0YWZmb3JkIEhvcm5lIDxzaG9ybmVAZ21haWwuY29tPgo+IAo+IFB1enpsZWQu
IFRoaXMgcGF0Y2ggZ2l2ZXMgbWU6CgpTdGFmZm9yZCBwb3N0ZWQgYSB2MiBlYXJsaWVyIHRvZGF5
OgpodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjEwODA4MTM1NDM3LjM2NDA1NDktMS1z
aG9ybmVAZ21haWwuY29tLwoKCj4gQnVpbGRpbmcgb3BlbnJpc2M6b3Ixa3NpbV9kZWZjb25maWcg
Li4uIGZhaWxlZAo+IC0tLS0tLS0tLS0tLQo+IEVycm9yIGxvZzoKPiBJbiBmaWxlIGluY2x1ZGVk
IGZyb20gLi9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL3BhZ2UuaDozNSwKPiAgICAgICAgICAg
ICAgICAgICBmcm9tIC4vaW5jbHVkZS9saW51eC9nZW5lcmljLXJhZGl4LXRyZWUuaDozOSwKPiAg
ICAgICAgICAgICAgICAgICBmcm9tIGxpYi9nZW5lcmljLXJhZGl4LXRyZWUuYzozOgo+IC4vYXJj
aC9vcGVucmlzYy9pbmNsdWRlL2FzbS9zZXR1cC5oOjExOjEzOiBlcnJvcjoKPiAJCWV4cGVjdGVk
ICc9JywgJywnLCAnOycsICdhc20nIG9yICdfX2F0dHJpYnV0ZV9fJyBiZWZvcmUgJ29yMWtfZWFy
bHlfc2V0dXAnCj4gICAgIDExIHwgdm9pZCBfX2luaXQgb3Ixa19lYXJseV9zZXR1cCh2b2lkICpm
ZHQpOwo+ICAgICAgICB8ICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn4KPiBtYWtlWzFdOiAq
KiogW3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6MjcyOiBsaWIvZ2VuZXJpYy1yYWRpeC10cmVlLm9d
IEVycm9yIDEKPiAKPiBCaXNlY3QgbG9nIGF0dGFjaGVkIGZvciBjb21wbGV0ZW5lc3MuCgpUaGF0
IG5lZWRzICNpbmNsdWRlIDxsaW51eC9pbml0Lmg+CgotLSAKflJhbmR5CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QK
T3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9y
Zy9saXN0aW5mby9vcGVucmlzYwo=
