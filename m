Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B76053E1CC1
	for <lists+openrisc@lfdr.de>; Thu,  5 Aug 2021 21:32:02 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6E5BF211D5;
	Thu,  5 Aug 2021 21:32:02 +0200 (CEST)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
 by mail.librecores.org (Postfix) with ESMTPS id CD21E20E97
 for <openrisc@lists.librecores.org>; Thu,  5 Aug 2021 21:32:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=GbnUV28bxkOp7gCXE/AS1YBxe5QFYfSNYycGqaP8y10=; b=OH0IAeHpUImkTwBEYEVKJ/88ip
 pi2GLuVtwMBuBVg4pLCGAijvR1GC6Xa0X4zc5h9uwcYNJzsA0YGZ2FLOCxxFwsHmspsYuYFS4RX+4
 qqeiHWTLUx/SWGArKspUWhXYS5IbLuBnvVv45iVz03el/CXwGb69HVCbebf8N68Aj/46CI7g0Dg0S
 9EYwvXHaZ1LwXipPw+1Nd84MG1VlrVMIahWOqekza7QcB0YKdS+yFmkoJHW4S+8c2OHPYM3X+N808
 VbEM+3k/orhmjIprEOydp/XXApn/zJIKqJaDIaVvh8P56iYP+c/zbeE8FD+K1y2U2dGi4SM3in4QO
 98r2HgIA==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBj5i-0069hG-Ib; Thu, 05 Aug 2021 19:31:42 +0000
To: Stafford Horne <shorne@gmail.com>, LKML <linux-kernel@vger.kernel.org>
References: <20210805030035.2994973-1-shorne@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <655ef6e0-defb-7467-25df-f9a13ab96694@infradead.org>
Date: Thu, 5 Aug 2021 12:31:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210805030035.2994973-1-shorne@gmail.com>
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
 kernel test robot <lkp@intel.com>, Openrisc <openrisc@lists.librecores.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gOC80LzIxIDg6MDAgUE0sIFN0YWZmb3JkIEhvcm5lIHdyb3RlOgo+IFRoaXMgd2FzIHBvaW50
ZWQgb3V0IHdpdGggdGhlIHJlY2VudCBuYW1lIGNoYW5nZSBvZiBvcjMyX2Vhcmx5X3NldHVwIHRv
Cj4gb3Ixa19lYXJseV9zZXR1cC4gIEludmVzdGlnYXRpbmcgdGhlIGZpbGUgSSBmb3VuZCBhIGZl
dyBvdGhlciB3YXJuaW5ncwo+IHNvIGNsZWFuaW5nIHRoZW0gdXAgaGVyZS4KPiAKPiAgICAgIGFy
Y2gvb3BlbnJpc2Mva2VybmVsL3NldHVwLmM6MjIwOjEzOiB3YXJuaW5nOiBubyBwcmV2aW91cyBw
cm90b3R5cGUgZm9yICdvcjFrX2Vhcmx5X3NldHVwJyBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4g
ICAgICAgIDIyMCB8IHZvaWQgX19pbml0IG9yMWtfZWFybHlfc2V0dXAodm9pZCAqZmR0KQo+IAkg
IHwgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fgo+IAo+IEZpeCB0aGlzIHRoZSBtaXNzaW5n
IG9yMWtfZWFybHlfc2V0dXAgcHJvdG90eXBlIHdhcm5pbmcgYnkgYWRkaW5nIGFuCj4gYXNtL3Nl
dHVwLmggZmlsZSB0byBkZWZpbmUgdGhlIHByb3RvdHlwZS4KPiAKPiAgICAgIGFyY2gvb3BlbnJp
c2Mva2VybmVsL3NldHVwLmM6MjQ2OjEzOiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUg
Zm9yICdkZXRlY3RfdW5pdF9jb25maWcnIFstV21pc3NpbmctcHJvdG90eXBlc10KPiAgICAgICAg
MjQ2IHwgdm9pZCBfX2luaXQgZGV0ZWN0X3VuaXRfY29uZmlnKHVuc2lnbmVkIGxvbmcgdXByLCB1
bnNpZ25lZCBsb25nIG1hc2ssCj4gCSAgfCAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn4K
PiAKPiBUaGUgZnVuY3Rpb24gZGV0ZWN0X3VuaXRfY29uZmlnIGlzIG5vdCB1c2VkLCBqdXN0IHJl
bW92ZSBpdC4KPiAKPiAgICAgIGFyY2gvb3BlbnJpc2Mva2VybmVsL3NldHVwLmM6MjIxOiB3YXJu
aW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdmZHQnIG5vdCBkZXNjcmliZWQgaW4g
J29yMWtfZWFybHlfc2V0dXAnCj4gCj4gQWRkIEBmZHQgZG9jcyB0byB0aGUgZnVuY3Rpb24gY29t
bWVudCB0byBzdXBwcmVzcyB0aGlzIHdhcm5pbmcuCj4gCj4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0
ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFN0YWZmb3JkIEhvcm5l
IDxzaG9ybmVAZ21haWwuY29tPgoKSGkgU3RhZmZvcmQsCgpEb2VzIHRoaXMgcGF0Y2ggYXBwbHkg
dG8geW91ciBvcGVucmlzYyB0cmVlLCBidXQgbm90IHRvCmxpbnV4LW5leHQ/ICBJIGdldCBhIHBh
dGNoIGVycm9yIHdoZW4gdHJ5aW5nIHRvIGFwcGx5IGl0CnRvIGxpbnV4LW5leHQtMjAyMTA4MDUg
YW5kIHRoaXMgd2FybmluZyBpcyBzdGlsbCBwcmVzZW50OgoKLi4vYXJjaC9vcGVucmlzYy9rZXJu
ZWwvc2V0dXAuYzoyMjE6MTM6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3IgJ29y
MzJfZWFybHlfc2V0dXAnIFstV21pc3NpbmctcHJvdG90eXBlc10KICAgMjIxIHwgdm9pZCBfX2lu
aXQgb3IzMl9lYXJseV9zZXR1cCh2b2lkICpmZHQpCiAgICAgICB8ICAgICAgICAgICAgIF5+fn5+
fn5+fn5+fn5+fn4KCnByZXN1bWFibHkgYmVjYXVzZSBzb21lIG9wZW5yaXNjIHBhdGNoZXMgYXJl
IG5vdCB5ZXQgaW4gbGludXgtbmV4dD8/Cgp0aGFua3MuCgo+IC0tLQo+ICAgYXJjaC9vcGVucmlz
Yy9pbmNsdWRlL2FzbS9zZXR1cC5oIHwgMTQgKysrKysrKysrKysrKysKPiAgIGFyY2gvb3BlbnJp
c2Mva2VybmVsL3NldHVwLmMgICAgICB8IDE2ICstLS0tLS0tLS0tLS0tLS0KPiAgIDIgZmlsZXMg
Y2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCj4gICBjcmVhdGUgbW9k
ZSAxMDA2NDQgYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS9zZXR1cC5oCj4gCgoKCi0tIAp+UmFu
ZHkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5S
SVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xp
c3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
