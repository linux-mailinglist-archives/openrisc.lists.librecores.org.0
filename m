Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 25BB334BF39
	for <lists+openrisc@lfdr.de>; Sun, 28 Mar 2021 23:15:02 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9B13920FEF;
	Sun, 28 Mar 2021 23:14:59 +0200 (CEST)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by mail.librecores.org (Postfix) with ESMTPS id 5856D21247
 for <openrisc@lists.librecores.org>; Sun, 28 Mar 2021 13:14:31 +0200 (CEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F7Y521DWmz9tyJZ;
 Sun, 28 Mar 2021 13:14:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Vbw5Z44eDhdj; Sun, 28 Mar 2021 13:14:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F7Y516Sdvz9v03k;
 Sun, 28 Mar 2021 13:14:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8C8A48B782;
 Sun, 28 Mar 2021 13:14:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id N7crepemd7QU; Sun, 28 Mar 2021 13:14:30 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EA0E48B75F;
 Sun, 28 Mar 2021 13:14:29 +0200 (CEST)
To: guoren@kernel.org
References: <1616913028-83376-1-git-send-email-guoren@kernel.org>
 <1616913028-83376-5-git-send-email-guoren@kernel.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <e27af5e0-a462-cb75-6311-1b5a6b4ee4f1@csgroup.eu>
Date: Sun, 28 Mar 2021 13:14:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <1616913028-83376-5-git-send-email-guoren@kernel.org>
Content-Language: fr
X-Mailman-Approved-At: Sun, 28 Mar 2021 23:14:51 +0200
Subject: Re: [OpenRISC] [PATCH v5 4/7] powerpc/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
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
Cc: linux-arch@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Guo Ren <guoren@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, openrisc@lists.librecores.org,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

CgpMZSAyOC8wMy8yMDIxIMOgIDA4OjMwLCBndW9yZW5Aa2VybmVsLm9yZyBhIMOpY3JpdMKgOgo+
IEZyb206IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiAKPiBXZSBkb24ndCBo
YXZlIG5hdGl2ZSBodyB4Y2hnMTYgaW5zdHJ1Y3Rpb24sIHNvIGxldCBxc3BpbmxvY2sKPiBnZW5l
cmljIGNvZGUgdG8gZGVhbCB3aXRoIGl0LgoKV2UgaGF2ZSBsaGFyeC9zdGhjeCBwYWlyIG9uIHNv
bWUgdmVyc2lvbnMgb2YgcG93ZXJwYy4KClNlZSBodHRwczovL3BhdGNod29yay5vemxhYnMub3Jn
L3Byb2plY3QvbGludXhwcGMtZGV2L3BhdGNoLzIwMjAxMTA3MDMyMzI4LjI0NTQ1ODItMS1ucGln
Z2luQGdtYWlsLmNvbS8KCkNocmlzdG9waGUKCj4gCj4gVXNpbmcgdGhlIGZ1bGwtd29yZCBhdG9t
aWMgeGNoZyBpbnN0cnVjdGlvbnMgaW1wbGVtZW50IHhjaGcxNiBoYXMKPiB0aGUgc2VtYW50aWMg
cmlzayBmb3IgYXRvbWljIG9wZXJhdGlvbnMuCj4gCj4gVGhpcyBwYXRjaCBjYW5jZWxzIHRoZSBk
ZXBlbmRlbmN5IG9mIG9uIHFzcGlubG9jayBnZW5lcmljIGNvZGUgb24KPiBhcmNoaXRlY3R1cmUn
cyB4Y2hnMTYuCj4gCj4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJh
YmEuY29tPgo+IENjOiBNaWNoYWVsIEVsbGVybWFuIDxtcGVAZWxsZXJtYW4uaWQuYXU+Cj4gQ2M6
IEJlbmphbWluIEhlcnJlbnNjaG1pZHQgPGJlbmhAa2VybmVsLmNyYXNoaW5nLm9yZz4KPiBDYzog
UGF1bCBNYWNrZXJyYXMgPHBhdWx1c0BzYW1iYS5vcmc+Cj4gLS0tCj4gICBhcmNoL3Bvd2VycGMv
S2NvbmZpZyB8IDEgKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9LY29uZmlnIGIvYXJjaC9wb3dlcnBjL0tjb25maWcKPiBp
bmRleCAzODZhZTEyZDg1MjMuLjY5ZWM0YWRlNjUyMSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Bvd2Vy
cGMvS2NvbmZpZwo+ICsrKyBiL2FyY2gvcG93ZXJwYy9LY29uZmlnCj4gQEAgLTE1MSw2ICsxNTEs
NyBAQCBjb25maWcgUFBDCj4gICAJc2VsZWN0IEFSQ0hfVVNFX0NNUFhDSEdfTE9DS1JFRgkJaWYg
UFBDNjQKPiAgIAlzZWxlY3QgQVJDSF9VU0VfUVVFVUVEX1JXTE9DS1MJCWlmIFBQQ19RVUVVRURf
U1BJTkxPQ0tTCj4gICAJc2VsZWN0IEFSQ0hfVVNFX1FVRVVFRF9TUElOTE9DS1MJaWYgUFBDX1FV
RVVFRF9TUElOTE9DS1MKPiArCXNlbGVjdCBBUkNIX1VTRV9RVUVVRURfU1BJTkxPQ0tTX1hDSEcz
MglpZiBQUENfUVVFVUVEX1NQSU5MT0NLUwo+ICAgCXNlbGVjdCBBUkNIX1dBTlRfSVBDX1BBUlNF
X1ZFUlNJT04KPiAgIAlzZWxlY3QgQVJDSF9XQU5UX0lSUVNfT0ZGX0FDVElWQVRFX01NCj4gICAJ
c2VsZWN0IEFSQ0hfV0FOVF9MRF9PUlBIQU5fV0FSTgo+IApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NA
bGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5m
by9vcGVucmlzYwo=
