Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 168BF34BF3A
	for <lists+openrisc@lfdr.de>; Sun, 28 Mar 2021 23:15:03 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 0999E212CF;
	Sun, 28 Mar 2021 23:15:00 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id E109B20F26
 for <openrisc@lists.librecores.org>; Sun, 28 Mar 2021 13:37:02 +0200 (CEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9964361972
 for <openrisc@lists.librecores.org>; Sun, 28 Mar 2021 11:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616931420;
 bh=8r+E9jML76H0gCn8zByIpf9ts7froA6i3yzLNHuBvN4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DugdbpT4GDM1HZeaem5soSAi/FHElDFHhmz2xIpsZJUkasWv28ZB3zgK93tR/c1EG
 Wg6UZIL/32OGSKHjIL7I3TejYIFIJatZ2S0hfZTZhMaw3y2P3h3z4TJdRouH33c2P4
 a0vFE4t1YxIuiIc5HdVc8iBz2z/pz1daXtvTbooBxBTN2T1IZ64j2pxee2ABx/u+UN
 R9Tpd5W1OnKdE7r9gQzXgqssvnkZagFrOM0DWS5GTeRlV6XS25xWzL3c0iO1XPbWAb
 sCLOKxIHwnhTcR+YQphOeEdtMjQrjqZYOIz3pgbUdAYY8+PAy495HKeu1P90Dt67iE
 cgL/CGET6Tr6g==
Received: by mail-lf1-f43.google.com with SMTP id o126so14279029lfa.0
 for <openrisc@lists.librecores.org>; Sun, 28 Mar 2021 04:37:00 -0700 (PDT)
X-Gm-Message-State: AOAM533/pjqxSenyHuxG+ruVe4bzipGXSCXVTyOH9lHwWQTBfUM7ozcy
 kSfTps12x+MAej4A1IWTxezgiP9f1dyVcKHHY3c=
X-Google-Smtp-Source: ABdhPJyj9o7D6hGhD+tmVxlzoBXg46BNhDKM+Nvrw+oWgxcsNgQKl214mB8IGaefEjDYpDQx2VSVsVg9V+sA7ebVJIA=
X-Received: by 2002:a19:f501:: with SMTP id j1mr14083138lfb.231.1616931418962; 
 Sun, 28 Mar 2021 04:36:58 -0700 (PDT)
MIME-Version: 1.0
References: <1616913028-83376-1-git-send-email-guoren@kernel.org>
 <1616913028-83376-5-git-send-email-guoren@kernel.org>
 <e27af5e0-a462-cb75-6311-1b5a6b4ee4f1@csgroup.eu>
In-Reply-To: <e27af5e0-a462-cb75-6311-1b5a6b4ee4f1@csgroup.eu>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 28 Mar 2021 19:36:47 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQvPOZ6aWxof66gzOBfia5mAV0=3pxO+QPdW8xpQrz3aA@mail.gmail.com>
Message-ID: <CAJF2gTQvPOZ6aWxof66gzOBfia5mAV0=3pxO+QPdW8xpQrz3aA@mail.gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, linux-xtensa@linux-xtensa.org,
 Guo Ren <guoren@linux.alibaba.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, openrisc@lists.librecores.org,
 Paul Mackerras <paulus@samba.org>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU3VuLCBNYXIgMjgsIDIwMjEgYXQgNzoxNCBQTSBDaHJpc3RvcGhlIExlcm95CjxjaHJpc3Rv
cGhlLmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOgo+Cj4KPgo+IExlIDI4LzAzLzIwMjEgw6AgMDg6
MzAsIGd1b3JlbkBrZXJuZWwub3JnIGEgw6ljcml0IDoKPiA+IEZyb206IEd1byBSZW4gPGd1b3Jl
bkBsaW51eC5hbGliYWJhLmNvbT4KPiA+Cj4gPiBXZSBkb24ndCBoYXZlIG5hdGl2ZSBodyB4Y2hn
MTYgaW5zdHJ1Y3Rpb24sIHNvIGxldCBxc3BpbmxvY2sKPiA+IGdlbmVyaWMgY29kZSB0byBkZWFs
IHdpdGggaXQuCj4KPiBXZSBoYXZlIGxoYXJ4L3N0aGN4IHBhaXIgb24gc29tZSB2ZXJzaW9ucyBv
ZiBwb3dlcnBjLgo+Cj4gU2VlIGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9s
aW51eHBwYy1kZXYvcGF0Y2gvMjAyMDExMDcwMzIzMjguMjQ1NDU4Mi0xLW5waWdnaW5AZ21haWwu
Y29tLwpHb3QgaXQsIHRoeCBmb3IgdGhlIGluZm9ybWF0aW9uLgoKPgo+IENocmlzdG9waGUKPgo+
ID4KPiA+IFVzaW5nIHRoZSBmdWxsLXdvcmQgYXRvbWljIHhjaGcgaW5zdHJ1Y3Rpb25zIGltcGxl
bWVudCB4Y2hnMTYgaGFzCj4gPiB0aGUgc2VtYW50aWMgcmlzayBmb3IgYXRvbWljIG9wZXJhdGlv
bnMuCj4gPgo+ID4gVGhpcyBwYXRjaCBjYW5jZWxzIHRoZSBkZXBlbmRlbmN5IG9mIG9uIHFzcGlu
bG9jayBnZW5lcmljIGNvZGUgb24KPiA+IGFyY2hpdGVjdHVyZSdzIHhjaGcxNi4KPiA+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPiBDYzog
TWljaGFlbCBFbGxlcm1hbiA8bXBlQGVsbGVybWFuLmlkLmF1Pgo+ID4gQ2M6IEJlbmphbWluIEhl
cnJlbnNjaG1pZHQgPGJlbmhAa2VybmVsLmNyYXNoaW5nLm9yZz4KPiA+IENjOiBQYXVsIE1hY2tl
cnJhcyA8cGF1bHVzQHNhbWJhLm9yZz4KPiA+IC0tLQo+ID4gICBhcmNoL3Bvd2VycGMvS2NvbmZp
ZyB8IDEgKwo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiA+Cj4gPiBkaWZm
IC0tZ2l0IGEvYXJjaC9wb3dlcnBjL0tjb25maWcgYi9hcmNoL3Bvd2VycGMvS2NvbmZpZwo+ID4g
aW5kZXggMzg2YWUxMmQ4NTIzLi42OWVjNGFkZTY1MjEgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Bv
d2VycGMvS2NvbmZpZwo+ID4gKysrIGIvYXJjaC9wb3dlcnBjL0tjb25maWcKPiA+IEBAIC0xNTEs
NiArMTUxLDcgQEAgY29uZmlnIFBQQwo+ID4gICAgICAgc2VsZWN0IEFSQ0hfVVNFX0NNUFhDSEdf
TE9DS1JFRiAgICAgICAgIGlmIFBQQzY0Cj4gPiAgICAgICBzZWxlY3QgQVJDSF9VU0VfUVVFVUVE
X1JXTE9DS1MgICAgICAgICAgaWYgUFBDX1FVRVVFRF9TUElOTE9DS1MKPiA+ICAgICAgIHNlbGVj
dCBBUkNIX1VTRV9RVUVVRURfU1BJTkxPQ0tTICAgICAgICBpZiBQUENfUVVFVUVEX1NQSU5MT0NL
Uwo+ID4gKyAgICAgc2VsZWN0IEFSQ0hfVVNFX1FVRVVFRF9TUElOTE9DS1NfWENIRzMyIGlmIFBQ
Q19RVUVVRURfU1BJTkxPQ0tTCj4gPiAgICAgICBzZWxlY3QgQVJDSF9XQU5UX0lQQ19QQVJTRV9W
RVJTSU9OCj4gPiAgICAgICBzZWxlY3QgQVJDSF9XQU5UX0lSUVNfT0ZGX0FDVElWQVRFX01NCj4g
PiAgICAgICBzZWxlY3QgQVJDSF9XQU5UX0xEX09SUEhBTl9XQVJOCj4gPgoKCgotLSAKQmVzdCBS
ZWdhcmRzCiBHdW8gUmVuCgpNTDogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtY3NreS8K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
