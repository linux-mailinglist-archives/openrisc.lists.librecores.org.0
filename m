Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id F301A4565B5
	for <lists+openrisc@lfdr.de>; Thu, 18 Nov 2021 23:28:13 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B468A242BD;
	Thu, 18 Nov 2021 23:28:13 +0100 (CET)
Received: from esa1.mentor.iphmx.com (esa1.mentor.iphmx.com [68.232.129.153])
 by mail.librecores.org (Postfix) with ESMTPS id C952523FA4
 for <openrisc@lists.librecores.org>; Thu, 18 Nov 2021 23:28:10 +0100 (CET)
IronPort-SDR: PJU+6niqr+8oNrjSsZ6eCJnKHt5V3FxzKbS0+oZUlxQNCys7KSTQ/OmLsOixHEpBAgiYkFbg7/
 1LCtkM0YtdAsolsbhx0+7IpbV5714cuUGswUSkRznYYkfZy5R9qWmvceWCfCGuOJR7XoxrU1L9
 /UorYzynij74o/LhpBv+/9gw84DLM9JNUxy5MPAuwS9PGlNVg7Nc3cwmhV9GrL3Yv3emm9Pdam
 2tR0q18RzEe0+8KcOvxjeGfTa/va+TIMxWcdqpdPQ0+xyO2nOxIQH/1P1ap/TMdVRClSS2lQnj
 lmoOjVqXNITBNQb6e4Z6v5FD
X-IronPort-AV: E=Sophos;i="5.87,246,1631606400"; d="scan'208";a="71161081"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa1.mentor.iphmx.com with ESMTP; 18 Nov 2021 14:28:09 -0800
IronPort-SDR: mYf025T1uTlCRVOHpJcW5S4k9TOWIBO7g2CRmVK2dA0ocTdI5ZJ6eqrGMSubgTKPFwvPJ7ZK8q
 LaFwUo3FL73rEJQvEliTsu7CONP8yCXwhweQY+/qqmz9PyRX7ffY0FjL65/rhlz5Ac8ggWqcgw
 rf4IWkm14gTqzXtYhYEezhrWcYxoxR4LdKAEhrcZtsXlFOfgw37HXj+UwEqzQkpHqJQyl0jEoR
 gdSI2lE6BlKiA0oNAmVQbiVNybdIb/VW9Z+Asveyrp0poqjoL05ikmkJfU/JyRWwvsgSComfNI
 rYo=
Date: Thu, 18 Nov 2021 22:28:03 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Stafford Horne <shorne@gmail.com>
In-Reply-To: <20211113031639.2402161-8-shorne@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2111182225310.1393807@digraph.polyomino.org.uk>
References: <20211113031639.2402161-1-shorne@gmail.com>
 <20211113031639.2402161-8-shorne@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
Subject: Re: [OpenRISC] [PATCH v2 07/13] or1k: math soft float support
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
 GLIBC patches <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU2F0LCAxMyBOb3YgMjAyMSwgU3RhZmZvcmQgSG9ybmUgdmlhIExpYmMtYWxwaGEgd3JvdGU6
Cgo+IGRpZmYgLS1naXQgYS9zeXNkZXBzL29yMWsvYml0cy9mZW52LmggYi9zeXNkZXBzL29yMWsv
Yml0cy9mZW52LmgKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjQ5
MTk0YWQ4NTEKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvc3lzZGVwcy9vcjFrL2JpdHMvZmVudi5o
Cj4gQEAgLTAsMCArMSw2OCBAQAo+ICsvKiBDb3B5cmlnaHQgKEMpIDIwMjEgRnJlZSBTb2Z0d2Fy
ZSBGb3VuZGF0aW9uLCBJbmMuCgpNaXNzaW5nIG9uZS1saW5lIGRlc2NyaXB0aW9uIGF0IHN0YXJ0
IG9mIGZpbGUuCgpUaGUgY29uc3RhbnRzIHlvdSdyZSBkZWZpbmluZyBoZXJlIHNlZW0gdG8gYmUg
c3BlY2lmaWMgdG8gaGFyZCBmbG9hdCwgYnV0IAp0aGV5J3JlIGRlZmluZWQgdW5jb25kaXRpb25h
bGx5LiAgSXMgdGhpcyBiZWNhdXNlIHlvdSB1c2UgdGhlIHNhbWUgQUJJIGZvciAKaGFyZCBmbG9h
dCBhbmQgc29mdCBmbG9hdCAod2hpY2ggaXMgZ2VuZXJhbGx5IHRoZSBjYXNlIHdoZW4gc3VjaCBo
YXJkIApmbG9hdCBjb25zdGFudHMgbWlnaHQgYmUgZGVmaW5lZCBmb3Igc29mdCBmbG9hdCBhcyB3
ZWxsIC0gYSBzb2Z0IGZsb2F0IApjb21waWxhdGlvbiBjb3VsZCBiZSB1c2luZyBhIGhhcmQgZmxv
YXQgbGliYyB0aGF0IHN1cHBvcnRzIHRob3NlIApjb25zdGFudHMpPwoKPiArLyogRGVmaW5lIGJp
dHMgcmVwcmVzZW50aW5nIGV4Y2VwdGlvbnMgaW4gdGhlIEZQQ1NSIHN0YXR1cyB3b3JkLiAgKi8K
PiArZW51bQo+ICsgIHsKPiArICAgIEZFX09WRVJGTE9XID0KPiArI2RlZmluZSBGRV9PVkVSRkxP
VwkxIDw8IDMKCk1hY3JvcyBuZWVkIHRvIGJlIHByb3Blcmx5IHN1cnJvdW5kZWQgYnkgcGFyZW50
aGVzZXMgc28gdGhleSBhbHdheXMgZ3JvdXAgCmFzIGEgc2luZ2xlIG9wZXJhbmQgaW4gYW55IGV4
cHJlc3Npb24uCgo+ICsjZGVmaW5lIEZQX0VYX09WRVJGTE9XCQkxIDw8IDMKPiArI2RlZmluZSBG
UF9FWF9VTkRFUkZMT1cJCTEgPDwgNAo+ICsjZGVmaW5lIEZQX0VYX0lORVhBQ1QJCTEgPDwgOAo+
ICsjZGVmaW5lIEZQX0VYX0lOVkFMSUQJCTEgPDwgOQo+ICsjZGVmaW5lIEZQX0VYX0RJVlpFUk8J
CTEgPDwgMTEKCkxpa2V3aXNlIGluIHNmcC1tYWNoaW5lLmguCgotLSAKSm9zZXBoIFMuIE15ZXJz
Cmpvc2VwaEBjb2Rlc291cmNlcnkuY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJy
ZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNj
Cg==
