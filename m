Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id BCA143EC5BD
	for <lists+openrisc@lfdr.de>; Sun, 15 Aug 2021 00:05:40 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8AEF324080;
	Sun, 15 Aug 2021 00:05:40 +0200 (CEST)
Received: from smtpcmd0651.aruba.it (smtpcmd0651.aruba.it [62.149.156.51])
 by mail.librecores.org (Postfix) with ESMTP id 1463322C28
 for <openrisc@lists.librecores.org>; Sun, 15 Aug 2021 00:05:39 +0200 (CEST)
Received: from [192.168.47.129] ([141.136.135.234])
 by Aruba Outgoing Smtp  with ESMTPSA
 id F1mbm54wLxC2nF1mcme6yo; Sun, 15 Aug 2021 00:05:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1628978738; bh=BvmYJOBvuwVbhViGiYUZQirs+qDYjx3VJ6atiAwzYKE=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=oA/8rIOTJLIOURlqgG2Gux1Gw9EV//NNevTpJYdZ/GgrwzaDRk9i+NhQtRdVgRZzO
 IEkgdRk8IepuPkYWsL1lG1p2aHv6w0HnEcm0+w0OvNntl8hyLks3r7kdeGVCdwll6b
 QXBiawEjxrKi6vylL0kWr5s+FAFefCMzyoLBwsuhCRaeJ36R6DU0swslZpfhiMFjL4
 1q4Q7dqDF9nkkD86vRlWcKgRlnJxqUUjWMWOdwEyGHGoxDkyGYgflrz9DqHPctDCMV
 8pREwlA1zxZ3LOYL1EhxqRbnU2E7ePKoGg0pqoLcTayo/XplQjZvJdroba6RBGxEAn
 33gZtB+Ur4O3w==
To: Stafford Horne <shorne@gmail.com>
References: <20210501211145.2980164-1-shorne@gmail.com>
 <da63081f-fe79-32c2-37f1-f17ce62f967b@benettiengineering.com>
 <YRg9yfcMeP6X3zhu@antec>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <9e4b2d98-5ba1-c35f-b419-3df2d84a5dab@benettiengineering.com>
Date: Sun, 15 Aug 2021 00:05:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRg9yfcMeP6X3zhu@antec>
Content-Language: en-US
X-CMAE-Envelope: MS4wfNJfhC9DPh5ZNEGxY1ta2SFB/6HM3YIXlxloEukF935PXF54fPUNQpd+Eoga18YVSDz1RlJPnX+dLp0TXjhzfmxeZtqMRt5JCCjn/4IlFPjeTug0lahN
 dorjgnaeyerHudJ47uMvPrJCsuk77HHlP1r9tdCRczVYUyTqtHbG1DTMKq2vgcIsDvEmAN+CGE3VV6RxFWydBBclEMpvt2PZVoOXyiLO07HaCXKEokPvm3Ji
 uf45PcgxkbYFOviCDwYcS2XMRccfSE+t+OuST+xm6UsWL99nI1ShpFiFyqAt4lv2xDLMaL1XGxFYzxQ/zoR+pQ==
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
Cc: Openrisc <openrisc@lists.librecores.org>,
 GCC patches <gcc-patches@gcc.gnu.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gOC8xNS8yMSAxMjowMyBBTSwgU3RhZmZvcmQgSG9ybmUgd3JvdGU6Cj4gT24gU2F0LCBBdWcg
MTQsIDIwMjEgYXQgMTE6MDE6MTZQTSArMDIwMCwgR2l1bGlvIEJlbmV0dGkgd3JvdGU6Cj4+IEhp
IEFsbCwKPj4KPj4gT24gNS8xLzIxIDExOjExIFBNLCBTdGFmZm9yZCBIb3JuZSB3cm90ZToKPj4+
IENoYW5nZXMgZnJvbSB2MToKPj4+ICAgIC0gQWRkZWQgcGF0Y2ggdG8gZW5hYmxlZCBjbW9kbGU9
bGFyZ2Ugb24gY3J0c3R1ZmYKPj4+Cj4+PiBUaGlzIHNlcmllcyBmaXhlcyBzb21lIGJ1Z3MgZm91
bmQgd2hlbiBsaW5raW5nIGxhcmdlIGJpbmFyaWVzLCBib3RoIGluIGJ1aWxkcm9vdAo+Pj4gYW5k
IGdsaWJjIHRlc3RpbmcuCj4+Pgo+Pj4gU3RhZmZvcmQgSG9ybmUgKDIpOgo+Pj4gICAgIG9yMWs6
IEFkZCBtY21vZGVsIG9wdGlvbiB0byBoYW5kbGUgbGFyZ2UgR09Ucwo+Pj4gICAgIG9yMWs6IFVz
ZSBjbW9kZWw9bGFyZ2Ugd2hlbiBidWlsZGluZyBjcnRzdHVmZgo+Pj4KPj4+ICAgIGdjYy9jb25m
aWcvb3Ixay9vcjFrLW9wdHMuaCAgIHwgMzAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Cj4+PiAgICBnY2MvY29uZmlnL29yMWsvb3Ixay5jICAgICAgICB8IDExICsrKysrKysrKy0tCj4+
PiAgICBnY2MvY29uZmlnL29yMWsvb3Ixay5oICAgICAgICB8ICA3ICsrKysrKysKPj4+ICAgIGdj
Yy9jb25maWcvb3Ixay9vcjFrLm9wdCAgICAgIHwgMTkgKysrKysrKysrKysrKysrKysrKwo+Pj4g
ICAgZ2NjL2RvYy9pbnZva2UudGV4aSAgICAgICAgICAgfCAxMiArKysrKysrKysrKy0KPj4+ICAg
IGxpYmdjYy9jb25maWcuaG9zdCAgICAgICAgICAgIHwgIDQgKystLQo+Pj4gICAgbGliZ2NjL2Nv
bmZpZy9vcjFrL3QtY3J0c3R1ZmYgfCAgMiArKwo+Pj4gICAgNyBmaWxlcyBjaGFuZ2VkLCA4MCBp
bnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Pj4gICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGdj
Yy9jb25maWcvb3Ixay9vcjFrLW9wdHMuaAo+Pj4gICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGxpYmdj
Yy9jb25maWcvb3Ixay90LWNydHN0dWZmCj4+Pgo+Pgo+PiBJJ3ZlIHRlc3RlZCB0aGlzIHBhdGNo
c2V0IGFuZCB3b3JrcyBhcyBleHBlY3RlZC4KPj4gSXQgZml4ZWQgbGliZ2VvcyBidWlsZCBmYWls
dXJlIGluIGNvbmp1bmN0aW9uIHdpdGg6Cj4+IGh0dHBzOi8vc291cmNld2FyZS5vcmcvZ2l0L2dp
dHdlYi5jZ2k/cD1iaW51dGlscy1nZGIuZ2l0O2g9M2MzZGUyOWIwNDhiY2E2YjRhYTQyMzVjNjQ3
YjkzMjhlNzE4MDFiNgo+Pgo+PiBIb3BlIHRoaXMgaGVscHMgdG8gY29tbWl0IGl0IHVwc3RyZWFt
IHNpbmNlIEkgc3RpbGwgZG9uJ3Qgc2VlIGl0LCBvciBhbSBJCj4+IHdyb25nPwo+IAo+IFlvdSBh
cmUgbm90IHdyb25nLCBJIGRpZCBub3QgcHVzaCB0aGUgY2hhbmdlZCB0byBHQ0MgeWV0LiAgSSB3
aWxsIGRvIHNvb24uCgpBaCBvaywgeW91J3JlIHRoZSBtYWludGFpbmVyIDotKSBJIHRob3VnaHQg
dGhlcmUgd2FzIHNvbWVvbmUgZWxzZSB3aG8gCm5lZWRlZCB0byBwdXNoIGl0IDotKQoKQmVzdCBy
ZWdhcmRzCi0tIApHaXVsaW8gQmVuZXR0aQpCZW5ldHRpIEVuZ2luZWVyaW5nIHNhcwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5n
IGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNv
cmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
