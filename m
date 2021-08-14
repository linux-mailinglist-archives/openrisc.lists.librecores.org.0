Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 9EB373EC5D0
	for <lists+openrisc@lfdr.de>; Sun, 15 Aug 2021 00:32:16 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3B6F924081;
	Sun, 15 Aug 2021 00:32:16 +0200 (CEST)
Received: from smtpcmd0651.aruba.it (smtpcmd0651.aruba.it [62.149.156.51])
 by mail.librecores.org (Postfix) with ESMTP id AFFCC22C28
 for <openrisc@lists.librecores.org>; Sun, 15 Aug 2021 00:32:15 +0200 (CEST)
Received: from [192.168.47.129] ([141.136.135.234])
 by Aruba Outgoing Smtp  with ESMTPSA
 id F2CMm5TNTxC2nF2CNmeC0G; Sun, 15 Aug 2021 00:32:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1628980335; bh=R2fShEeiGGa/T08OkSpvMYHDEdrCYWcATVeTGHFp6aE=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=J+HAk6t9L8Enu+bqDi+i1ztmrf9b6bfr5DeAxi+fL2/d01yBWE3HxXXquO6mletwS
 CLDHR8c5VVmVa0G7zO38Pr3LCZ7W8DjRyHWMO46G2Q2B/S/bakpmT1dIJTNhzqD6fs
 WpNAPnNky26Clst7YxOWUhp09FRjqdjVOtTLFty9zD2tei/uPXB4aif6GexaOnd6i9
 4QFAACJGgq2IYCtq9FGiltlLyhsHUhtGSjDM/OYkaV12FYpZa2RRV7tbk6AU/AjA57
 EL0LXLWjf/Sbxof0S4+0Hqh6m/NE/Dlr/mVPZwLCc2b6ISOwaMiFo3zN/iM5I5aks4
 5I+eejTvyh9oA==
To: Stafford Horne <shorne@gmail.com>
References: <20210501211145.2980164-1-shorne@gmail.com>
 <da63081f-fe79-32c2-37f1-f17ce62f967b@benettiengineering.com>
 <YRg9yfcMeP6X3zhu@antec>
 <9e4b2d98-5ba1-c35f-b419-3df2d84a5dab@benettiengineering.com>
 <YRhCwQPveo8+lnGH@antec>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <91cc29d6-f578-d1c3-9626-28f0b5f47c97@benettiengineering.com>
Date: Sun, 15 Aug 2021 00:32:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRhCwQPveo8+lnGH@antec>
Content-Language: en-US
X-CMAE-Envelope: MS4wfCKncEjachBCOpaZY36g892Ofs7+T3Bg9HDpgF41YN8oxLtriYmnvedtoz2cqi59HP1Q+07GN1Z8M3KPW9QnaMGbprTRzxWT6dgnzXppGAUZ3Wn8ddQC
 NzERvpOGBDCLDnho9URYtV/Hih+hjKowLTAQoupCqBE/8y43Ge3AW2mvHGJFacToZO7C3PGMV/qfGGBqlOJMSeh1PHh74GdkBubqOgCpqzXxRflxCiFIJ4J7
 4tStcY7lAhdiky19HUzgJCXFpl1cNT+sqmRnr0V/n/0XzWSxWNQujc70nJmlXGazG4roR6q/+h0aiVmsvLPAfA==
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

T24gOC8xNS8yMSAxMjoyNSBBTSwgU3RhZmZvcmQgSG9ybmUgd3JvdGU6Cj4gT24gU3VuLCBBdWcg
MTUsIDIwMjEgYXQgMTI6MDU6MzdBTSArMDIwMCwgR2l1bGlvIEJlbmV0dGkgd3JvdGU6Cj4+IE9u
IDgvMTUvMjEgMTI6MDMgQU0sIFN0YWZmb3JkIEhvcm5lIHdyb3RlOgo+Pj4gT24gU2F0LCBBdWcg
MTQsIDIwMjEgYXQgMTE6MDE6MTZQTSArMDIwMCwgR2l1bGlvIEJlbmV0dGkgd3JvdGU6Cj4+Pj4g
SGkgQWxsLAo+Pj4+Cj4+Pj4gT24gNS8xLzIxIDExOjExIFBNLCBTdGFmZm9yZCBIb3JuZSB3cm90
ZToKPj4+Pj4gQ2hhbmdlcyBmcm9tIHYxOgo+Pj4+PiAgICAgLSBBZGRlZCBwYXRjaCB0byBlbmFi
bGVkIGNtb2RsZT1sYXJnZSBvbiBjcnRzdHVmZgo+Pj4+Pgo+Pj4+PiBUaGlzIHNlcmllcyBmaXhl
cyBzb21lIGJ1Z3MgZm91bmQgd2hlbiBsaW5raW5nIGxhcmdlIGJpbmFyaWVzLCBib3RoIGluIGJ1
aWxkcm9vdAo+Pj4+PiBhbmQgZ2xpYmMgdGVzdGluZy4KPj4+Pj4KPj4+Pj4gU3RhZmZvcmQgSG9y
bmUgKDIpOgo+Pj4+PiAgICAgIG9yMWs6IEFkZCBtY21vZGVsIG9wdGlvbiB0byBoYW5kbGUgbGFy
Z2UgR09Ucwo+Pj4+PiAgICAgIG9yMWs6IFVzZSBjbW9kZWw9bGFyZ2Ugd2hlbiBidWlsZGluZyBj
cnRzdHVmZgo+Pj4+Pgo+Pj4+PiAgICAgZ2NjL2NvbmZpZy9vcjFrL29yMWstb3B0cy5oICAgfCAz
MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4+Pj4gICAgIGdjYy9jb25maWcvb3Ix
ay9vcjFrLmMgICAgICAgIHwgMTEgKysrKysrKysrLS0KPj4+Pj4gICAgIGdjYy9jb25maWcvb3Ix
ay9vcjFrLmggICAgICAgIHwgIDcgKysrKysrKwo+Pj4+PiAgICAgZ2NjL2NvbmZpZy9vcjFrL29y
MWsub3B0ICAgICAgfCAxOSArKysrKysrKysrKysrKysrKysrCj4+Pj4+ICAgICBnY2MvZG9jL2lu
dm9rZS50ZXhpICAgICAgICAgICB8IDEyICsrKysrKysrKysrLQo+Pj4+PiAgICAgbGliZ2NjL2Nv
bmZpZy5ob3N0ICAgICAgICAgICAgfCAgNCArKy0tCj4+Pj4+ICAgICBsaWJnY2MvY29uZmlnL29y
MWsvdC1jcnRzdHVmZiB8ICAyICsrCj4+Pj4+ICAgICA3IGZpbGVzIGNoYW5nZWQsIDgwIGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4+Pj4+ICAgICBjcmVhdGUgbW9kZSAxMDA2NDQgZ2Nj
L2NvbmZpZy9vcjFrL29yMWstb3B0cy5oCj4+Pj4+ICAgICBjcmVhdGUgbW9kZSAxMDA2NDQgbGli
Z2NjL2NvbmZpZy9vcjFrL3QtY3J0c3R1ZmYKPj4+Pj4KPj4+Pgo+Pj4+IEkndmUgdGVzdGVkIHRo
aXMgcGF0Y2hzZXQgYW5kIHdvcmtzIGFzIGV4cGVjdGVkLgo+Pj4+IEl0IGZpeGVkIGxpYmdlb3Mg
YnVpbGQgZmFpbHVyZSBpbiBjb25qdW5jdGlvbiB3aXRoOgo+Pj4+IGh0dHBzOi8vc291cmNld2Fy
ZS5vcmcvZ2l0L2dpdHdlYi5jZ2k/cD1iaW51dGlscy1nZGIuZ2l0O2g9M2MzZGUyOWIwNDhiY2E2
YjRhYTQyMzVjNjQ3YjkzMjhlNzE4MDFiNgo+Pj4+Cj4+Pj4gSG9wZSB0aGlzIGhlbHBzIHRvIGNv
bW1pdCBpdCB1cHN0cmVhbSBzaW5jZSBJIHN0aWxsIGRvbid0IHNlZSBpdCwgb3IgYW0gSQo+Pj4+
IHdyb25nPwo+Pj4KPj4+IFlvdSBhcmUgbm90IHdyb25nLCBJIGRpZCBub3QgcHVzaCB0aGUgY2hh
bmdlZCB0byBHQ0MgeWV0LiAgSSB3aWxsIGRvIHNvb24uCj4+Cj4+IEFoIG9rLCB5b3UncmUgdGhl
IG1haW50YWluZXIgOi0pIEkgdGhvdWdodCB0aGVyZSB3YXMgc29tZW9uZSBlbHNlIHdobyBuZWVk
ZWQKPj4gdG8gcHVzaCBpdCA6LSkKPiAKPiBZZWFoLCBJIHB1c2hlZCBpdCBub3cuCgpBd2Vzb21l
LCBqdXN0IHNlZW4gbm93LiBCdWlsZHJvb3QgaXMgYWxyZWFkeSBPcGVucmlzYyB0b29sY2hhaW4g
YnVnIApmcmVlLCBvbmx5IHdlIGhhdmUgdG8gd2FpdCBmb3IgZXh0ZXJuYWwgdG9vbGNoYWluIHRv
IGJlIHJlYnVpbHQgd2l0aCAKc3VjayBwYXRjaGVzLiBTbyB3ZSd2ZSBnb3QgT3BlblJpc2MgYmFj
ayB0byBsaWZlIDotKS4KClRoYW5rIHlvdSEKLS0gCkdpdWxpbyBCZW5ldHRpCkJlbmV0dGkgRW5n
aW5lZXJpbmcgc2FzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpo
dHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
