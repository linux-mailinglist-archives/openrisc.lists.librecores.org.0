Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 9621E91116
	for <lists+openrisc@lfdr.de>; Sat, 17 Aug 2019 17:02:44 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6BD93204DC;
	Sat, 17 Aug 2019 17:02:44 +0200 (CEST)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by mail.librecores.org (Postfix) with ESMTPS id A4C65200E0
 for <openrisc@lists.librecores.org>; Sat, 17 Aug 2019 12:34:06 +0200 (CEST)
Received: by mail-wm1-f65.google.com with SMTP id v19so6030134wmj.5
 for <openrisc@lists.librecores.org>; Sat, 17 Aug 2019 03:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=39YvwnXSLPYPPS8HyY6xQ0pEYqQsaSVOcIZxY6QaSy0=;
 b=HaU5j73Xl18SPfWIKR/l5s1id63iaB7lpk2eLE9Cv93RaSr0QygCeb8VtdrjK/DFoH
 BzanBzeDzwH/CfWIayA254C8bK/pzQhAr1B+Cx1TRlWNSkT4XCzZLK+D58uxuJj/Z6c8
 1+jn+z+dU7Ewi0li9IwJ7jmFgqXABsf3p+TxQXzA7fHIgWlPmx739auC7j/bqLC+8NoU
 C3XDYz8eetWLerWT9nDLSd3eyiPofE72zfZEgyCEmcNmd7KEx0oxertXb8lLCukZQpFv
 6wFercfLlPzs2ZP2Iysl6A4A+S9cPkEPkEAEiZMttS1pDBUiq7OyBBL/XEMk2UGfKSWg
 tAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=39YvwnXSLPYPPS8HyY6xQ0pEYqQsaSVOcIZxY6QaSy0=;
 b=hv8QUUkkeJyro8cTkW386bFILV8Z3xA+PecHcilqhhf9MnJ6cv0yMXuuRue4JRCWil
 563v2tBIw7hvlYSNxKHnNQ3yEiowvVwukqmzv2UB9oM5qMKbCBtIAP31qaRclL+Najql
 LMtQJXJq7TzvkfJRztOb/D1QSVD1IWNEF9eVTMLzxATb2t6eqvWaoLDiGk2hdxfbWWyz
 Bg7T5bMSkqY9uTf1piRHaAXFpZdLoHrCjVnaVAocV0pKIrHpnnO0KKhN04dWBz3e6kyI
 ZypiaETTaillYLZ3FKHEa+/SLdLP/6t3aj/oDkmc3RPrr/xdIRxQSh5RznSoWSf/fURd
 uStg==
X-Gm-Message-State: APjAAAVlPG/QS3IVm7c0oxn+LB2+7A90mnxpAAApF4GTMGtIl61bSHN9
 292n2+cE+lhYW0O+zD7UHmA=
X-Google-Smtp-Source: APXvYqx+skxBDSiX8lI2gwUVvrx6yD5s1jqeJ+6VF/JmtojW+ENXyX4cQUxihmaZEwvtXGQA8HaHqg==
X-Received: by 2002:a1c:b342:: with SMTP id c63mr11130163wmf.84.1566038046300; 
 Sat, 17 Aug 2019 03:34:06 -0700 (PDT)
Received: from gmail.com (2E8B0CD5.catv.pool.telekom.hu. [46.139.12.213])
 by smtp.gmail.com with ESMTPSA id 4sm14396946wro.78.2019.08.17.03.34.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Aug 2019 03:34:05 -0700 (PDT)
Date: Sat, 17 Aug 2019 12:34:02 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20190817103402.GA7602@gmail.com>
References: <20190817073253.27819-1-hch@lst.de>
 <20190817073253.27819-13-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190817073253.27819-13-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Sat, 17 Aug 2019 17:02:30 +0200
Subject: Re: [OpenRISC] [PATCH 12/26] x86: clean up ioremap
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Greentime Hu <green.hu@gmail.com>,
 linux-mtd@lists.infradead.org, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-alpha@vger.kernel.org, nios2-dev@lists.rocketboards.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

CiogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+IHdyb3RlOgoKPiBVc2UgaW9yZW1hcCBh
cyB0aGUgbWFpbiBpbXBsZW1lbnRlZCBmdW5jdGlvbiwgYW5kIGRlZmluZWQKPiBpb3JlbWFwX25v
Y2FjaGUgdG8gaXQgYXMgYSBkZXByZWNhdGVkIGFsaWFzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENo
cmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IC0tLQo+ICBhcmNoL3g4Ni9pbmNsdWRlL2Fz
bS9pby5oIHwgOCArKy0tLS0tLQo+ICBhcmNoL3g4Ni9tbS9pb3JlbWFwLmMgICAgIHwgOCArKysr
LS0tLQo+ICBhcmNoL3g4Ni9tbS9wYWdlYXR0ci5jICAgIHwgNCArKy0tCj4gIDMgZmlsZXMgY2hh
bmdlZCwgOCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCkFja2VkLWJ5OiBJbmdvIE1v
bG5hciA8bWluZ29Aa2VybmVsLm9yZz4KClRoYW5rcywKCglJbmdvCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVu
UklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xp
c3RpbmZvL29wZW5yaXNjCg==
