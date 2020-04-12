Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 12EF61B20AF
	for <lists+openrisc@lfdr.de>; Tue, 21 Apr 2020 10:01:53 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id AFBE720AFE;
	Tue, 21 Apr 2020 10:01:52 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 80D3D20A4A
 for <openrisc@lists.librecores.org>; Sun, 12 Apr 2020 21:54:14 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0707B214AF;
 Sun, 12 Apr 2020 19:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586721253;
 bh=myYkWprg+WWiUHcdd6ZwCH3br4gnq7CtJsGPm4IVpVQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G2zxEyanO6auX9PlgDUIwafXaMtYsug93RcjOLLHmt/Mx4m5WfSWEfSMjB/3vOco8
 HD6WsW6NQOCBPpWxm7mQPG5SxNsta85Ooh54ZaibuDr4VLhx9Kf6+MK770FacD1L+U
 R99Kq+yNI2/XUURnheTplxnGlHscZKCl6IyGM+yo=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Date: Sun, 12 Apr 2020 22:48:58 +0300
Message-Id: <20200412194859.12663-21-rppt@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200412194859.12663-1-rppt@kernel.org>
References: <20200412194859.12663-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 21 Apr 2020 10:01:35 +0200
Subject: [OpenRISC] [PATCH 20/21] mm: simplify
 find_min_pfn_with_active_regions()
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, Mike Rapoport <rppt@linux.ibm.com>,
 Greg Ungerer <gerg@linux-m68k.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Baoquan He <bhe@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-sh@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-arm-kernel@lists.infradead.org, Mark Salter <msalter@redhat.com>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, Tony Luck <tony.luck@intel.com>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Guan Xuetao <gxt@pku.edu.cn>, Hoan Tran <Hoan@os.amperecomputing.com>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Brian Cain <bcain@codeaurora.org>, Nick Hu <nickhu@andestech.com>,
 linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKVGhlIGZpbmRfbWluX3Bm
bl93aXRoX2FjdGl2ZV9yZWdpb25zKCkgY2FsbHMgZmluZF9taW5fcGZuX2Zvcl9ub2RlKCkgd2l0
aApuaWQgcGFyYW1ldGVyIHNldCB0byBNQVhfTlVNTk9ERVMuIFRoaXMgbWFrZXMgdGhlIGZpbmRf
bWluX3Bmbl9mb3Jfbm9kZSgpCnRyYXZlcnNlIGFsbCBtZW1ibG9jayBtZW1vcnkgcmVnaW9ucyBh
bHRob3VnaCB0aGUgZmlyc3QgUEZOIGluIHRoZSBzeXN0ZW0KY2FuIGJlIGVhc2lseSBmb3VuZCB3
aXRoIG1lbWJsb2NrX3N0YXJ0X29mX0RSQU0oKS4KClVzZSBtZW1ibG9ja19zdGFydF9vZl9EUkFN
KCkgaW4gZmluZF9taW5fcGZuX3dpdGhfYWN0aXZlX3JlZ2lvbnMoKSBhbmQgZHJvcApub3cgdW51
c2VkIGZpbmRfbWluX3Bmbl9mb3Jfbm9kZSgpLgoKU2lnbmVkLW9mZi1ieTogTWlrZSBSYXBvcG9y
dCA8cnBwdEBsaW51eC5pYm0uY29tPgotLS0KIG1tL3BhZ2VfYWxsb2MuYyB8IDIwICstLS0tLS0t
LS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDE5IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL21tL3BhZ2VfYWxsb2MuYyBiL21tL3BhZ2VfYWxsb2MuYwppbmRl
eCA5YWYyN2VlNzg0YzcuLmU4M2YyOGQ2MDc0YSAxMDA2NDQKLS0tIGEvbW0vcGFnZV9hbGxvYy5j
CisrKyBiL21tL3BhZ2VfYWxsb2MuYwpAQCAtNzA3MSwyNCArNzA3MSw2IEBAIHVuc2lnbmVkIGxv
bmcgX19pbml0IG5vZGVfbWFwX3Bmbl9hbGlnbm1lbnQodm9pZCkKIAlyZXR1cm4gfmFjY2xfbWFz
ayArIDE7CiB9CiAKLS8qIEZpbmQgdGhlIGxvd2VzdCBwZm4gZm9yIGEgbm9kZSAqLwotc3RhdGlj
IHVuc2lnbmVkIGxvbmcgX19pbml0IGZpbmRfbWluX3Bmbl9mb3Jfbm9kZShpbnQgbmlkKQotewot
CXVuc2lnbmVkIGxvbmcgbWluX3BmbiA9IFVMT05HX01BWDsKLQl1bnNpZ25lZCBsb25nIHN0YXJ0
X3BmbjsKLQlpbnQgaTsKLQotCWZvcl9lYWNoX21lbV9wZm5fcmFuZ2UoaSwgbmlkLCAmc3RhcnRf
cGZuLCBOVUxMLCBOVUxMKQotCQltaW5fcGZuID0gbWluKG1pbl9wZm4sIHN0YXJ0X3Bmbik7Ci0K
LQlpZiAobWluX3BmbiA9PSBVTE9OR19NQVgpIHsKLQkJcHJfd2FybigiQ291bGQgbm90IGZpbmQg
c3RhcnRfcGZuIGZvciBub2RlICVkXG4iLCBuaWQpOwotCQlyZXR1cm4gMDsKLQl9Ci0KLQlyZXR1
cm4gbWluX3BmbjsKLX0KLQogLyoqCiAgKiBmaW5kX21pbl9wZm5fd2l0aF9hY3RpdmVfcmVnaW9u
cyAtIEZpbmQgdGhlIG1pbmltdW0gUEZOIHJlZ2lzdGVyZWQKICAqCkBAIC03MDk3LDcgKzcwNzks
NyBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyBfX2luaXQgZmluZF9taW5fcGZuX2Zvcl9ub2RlKGlu
dCBuaWQpCiAgKi8KIHVuc2lnbmVkIGxvbmcgX19pbml0IGZpbmRfbWluX3Bmbl93aXRoX2FjdGl2
ZV9yZWdpb25zKHZvaWQpCiB7Ci0JcmV0dXJuIGZpbmRfbWluX3Bmbl9mb3Jfbm9kZShNQVhfTlVN
Tk9ERVMpOworCXJldHVybiBQSFlTX1BGTihtZW1ibG9ja19zdGFydF9vZl9EUkFNKCkpOwogfQog
CiAvKgotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5v
cmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
