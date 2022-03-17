Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 1A7FA4DC34A
	for <lists+openrisc@lfdr.de>; Thu, 17 Mar 2022 10:47:54 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 08E0E247D7;
	Thu, 17 Mar 2022 10:47:54 +0100 (CET)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
 by mail.librecores.org (Postfix) with ESMTPS id 7AC4B247D7
 for <openrisc@lists.librecores.org>; Thu, 17 Mar 2022 10:47:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=yicCny8nHaglYevrNfwan/4wAlISyppq00h0F352WzQ=; b=ZP/S7WXk4z47FcQpOt16Es+QV/
 mHBHwX5fKFAqB8OgbZx6AiTNt2RxYoE7tq5GQMY90fLYxK6/+nm9tykIoDW6vqVP4G2ukcTEADEBt
 xTLqFxudQwo2nW6cZU+XiilIkB+IDfwTxFFUn6Mt4IkcHz/l2pEAptD8I3aZS29muBfzLygCcMLX3
 1Kb+fFyLIhNjMo0ZetK9ycqowu+OHIRYtXuPYuf9udj0ItwyLBisExr02IE0e3JrCp1LalMULVDbJ
 ZTWlZtcgsXUjWkVG8EH0OFTk1/yBNApnj5Ov6khXYYCURE8gsJPglhG4z8rbwVPPubCILUaopumkh
 t7Zr+Wsw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUmjJ-001qtK-La; Thu, 17 Mar 2022 09:47:37 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id CC7883001EA;
 Thu, 17 Mar 2022 10:47:35 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id BD191201CD1C3; Thu, 17 Mar 2022 10:47:35 +0100 (CET)
Date: Thu, 17 Mar 2022 10:47:35 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Message-ID: <YjMDt8BgtIZZH8IY@hirez.programming.kicks-ass.net>
References: <20220316232600.20419-1-palmer@rivosinc.com>
 <20220316232600.20419-6-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220316232600.20419-6-palmer@rivosinc.com>
Subject: Re: [OpenRISC] [PATCH 5/5] RISC-V: Move to queued RW locks
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
Cc: jonas@southpole.se, linux-arch@vger.kernel.org, wangkefeng.wang@huawei.com,
 aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>, boqun.feng@gmail.com,
 linux-kernel@vger.kernel.org, mingo@redhat.com,
 Palmer Dabbelt <palmer@dabbelt.com>, jszhang@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, longman@redhat.com,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBNYXIgMTYsIDIwMjIgYXQgMDQ6MjY6MDBQTSAtMDcwMCwgUGFsbWVyIERhYmJlbHQg
d3JvdGU6Cj4gRnJvbTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+Cj4gCj4g
V2l0aCB0aGUgbW92ZSB0byBmYWlyIHNwaW5sb2Nrcywgd2UgbWlnaHQgYXMgd2VsbCBtb3ZlIHRv
IGZhaXIgcndsb2Nrcy4KCnMvbWlnaHQgYXMgd2VsbC9jYW4vID8KCk5vdGUgdGhhdCBxcndsb2Nr
IHJlbGllcyBvbiBzcGlubG9jayB0byBiZS9wcm92aWRlIGZhaXJuZXNzLgoKPiBTaWduZWQtb2Zm
LWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9w
ZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcv
bGlzdGluZm8vb3BlbnJpc2MK
