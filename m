Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 035F74BAB8D
	for <lists+openrisc@lfdr.de>; Thu, 17 Feb 2022 22:10:04 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9AF902482E;
	Thu, 17 Feb 2022 22:10:04 +0100 (CET)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by mail.librecores.org (Postfix) with ESMTPS id 266EA2481E
 for <openrisc@lists.librecores.org>; Thu, 17 Feb 2022 20:15:23 +0100 (CET)
Received: by mail-ej1-f43.google.com with SMTP id lw4so9517538ejb.12
 for <openrisc@lists.librecores.org>; Thu, 17 Feb 2022 11:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amacapital-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+RZ8CAgnGa1bk5gBxds4oezzFjZLQMV+wOvrmesI1Hw=;
 b=aC4vKGs+W+TwIvfSuol31sXb0DdwmBd+7ynpizLCKhXxCJFdEAZpxJvcWGa/FztIyE
 kaM//DxAJXCDh5aNx4GSOgCqArnp/pPXpeZOwL6NCOz09LePB9aHf9rLmhVNdEQhmOfG
 zcHXwBp2FYlRXI6tXnhZ/KCBgXws1BhNZED9tFrHvUNz3V476fnXQSLMeM+Shpqaev6m
 W07DvhrokY4sorGqrqwhi0S/cnzs7UTqO0cIGR6WWEAN8VmZadQ9VO/+zsTblOwHPeWg
 SsUN3Cw66rH7ga20AFYG5KTR6BdWsnByVkv9VANJJ9bhC1jZcqQ2NhN41BgDZLcdhMyk
 TY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+RZ8CAgnGa1bk5gBxds4oezzFjZLQMV+wOvrmesI1Hw=;
 b=Iq7hvbGg9AW7WjaCgmWIZ2m7/vnYwz6mmIaxMFoUvsxNMGo+HOMy4tuyxKMQDygts8
 c8Lh2nRPpOzE5ZJj7wBmZvinsfA55n88O93PmXX4MbB8xmv5S6iyrL5iWikr0OSreRyH
 EMvC9fydn/tTIP2NaDjDTnQljEK+ua1vR/+r5luPQI5aeOHex1RXFQugXZY9mWsdyYhF
 2rzAlTtzULm7tq4d3u6zG9IJ5hneOoxnjMnplQXzAtH1HdoK11RNa06AcEYKBy6dTxCI
 Q/YuKFkNbhLemsY3xmtOLFxC1x9VISSaXAXpWf2h2+VlxSg0EiAOCKkJ0aZvxIHUEmZn
 +4cw==
X-Gm-Message-State: AOAM531jUc7A0jnul1b5PuF2qpOFmNHCSuKUfTqsr2mCSOiRyx7HTdFF
 LN8SpsrgYKGCQkp9segefJdkW5QsTHKu71TlFhuWog==
X-Google-Smtp-Source: ABdhPJw48Oadf8QR2zY/o5TdRU0UiMjXS1n08+Rvo/jef0cepMooOXBMnDr3m4SH0a9wsDyMLo89s3cuvktj12QRONA=
X-Received: by 2002:a17:906:4b52:b0:6cd:3863:b35e with SMTP id
 j18-20020a1709064b5200b006cd3863b35emr3488094ejv.415.1645125322737; Thu, 17
 Feb 2022 11:15:22 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-14-arnd@kernel.org>
In-Reply-To: <20220216131332.1489939-14-arnd@kernel.org>
From: Andy Lutomirski <luto@amacapital.net>
Date: Thu, 17 Feb 2022 11:15:11 -0800
Message-ID: <CALCETrVOvYPN4_6hS8wpm2v9bGZupZ5x4=vZAseG57OUgvLGfw@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
X-Mailman-Approved-At: Thu, 17 Feb 2022 22:10:02 +0100
Subject: Re: [OpenRISC] [PATCH v2 13/18] uaccess: generalize access_ok()
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
Cc: mark.rutland@arm.com, dalias@libc.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, peterz@infradead.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, guoren@kernel.org, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 will@kernel.org, Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, bcain@codeaurora.org, mpe@ellerman.id.au,
 deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk,
 linux-csky@vger.kernel.org, ardb@kernel.org, mingo@redhat.com,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 arnd@arndb.de, hca@linux.ibm.com, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 viro@zeniv.linux.org.uk, monstr@monstr.eu, tsbogend@alpha.franken.de,
 linux-parisc@vger.kernel.org, nickhu@andestech.com, jcmvbkbc@gmail.com,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org, dinguyen@kernel.org,
 ebiederm@xmission.com, richard@nod.at, akpm@linux-foundation.org,
 Linus Torvalds <torvalds@linux-foundation.org>, davem@davemloft.net,
 green.hu@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBGZWIgMTYsIDIwMjIgYXQgNToxOSBBTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gRnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPgo+
IFRoZXJlIGFyZSBtYW55IGRpZmZlcmVudCB3YXlzIHRoYXQgYWNjZXNzX29rKCkgaXMgZGVmaW5l
ZCBhY3Jvc3MKPiBhcmNoaXRlY3R1cmVzLCBidXQgaW4gdGhlIGVuZCwgdGhleSBhbGwganVzdCBj
b21wYXJlIGFnYWluc3QgdGhlCj4gdXNlcl9hZGRyX21heCgpIHZhbHVlIG9yIHRoZXkgYWNjZXB0
IGFueXRoaW5nLgo+Cj4gUHJvdmlkZSBvbmUgZGVmaW5pdGlvbiB0aGF0IHdvcmtzIGZvciBtb3N0
IGFyY2hpdGVjdHVyZXMsIGNoZWNraW5nCj4gYWdhaW5zdCBUQVNLX1NJWkVfTUFYIGZvciB1c2Vy
IHByb2Nlc3NlcyBvciBza2lwcGluZyB0aGUgY2hlY2sgaW5zaWRlCj4gb2YgdWFjY2Vzc19rZXJu
ZWwoKSBzZWN0aW9ucy4KPgo+IEZvciBhcmNoaXRlY3R1cmVzIHdpdGhvdXQgQ09ORklHX1NFVF9G
UygpLCB0aGlzIHNob3VsZCBiZSB0aGUgZmFzdGVzdAo+IGNoZWNrLCBhcyBpdCBjb21lcyBkb3du
IHRvIGEgc2luZ2xlIGNvbXBhcmlzb24gb2YgYSBwb2ludGVyIGFnYWluc3QgYQo+IGNvbXBpbGUt
dGltZSBjb25zdGFudCwgd2hpbGUgdGhlIGFyY2hpdGVjdHVyZSBzcGVjaWZpYyB2ZXJzaW9ucyB0
ZW5kIHRvCj4gZG8gc29tZXRoaW5nIG1vcmUgY29tcGxleCBmb3IgaGlzdG9yaWMgcmVhc29ucyBv
ciBnZXQgc29tZXRoaW5nIHdyb25nLgoKVGhpcyBpc24ndCBhY3R1YWxseSBvcHRpbWFsLiAgT24g
eDg2LCBUQVNLX1NJWkVfTUFYIGlzIGEgYml6YXJyZQpjb25zdGFudCB0aGF0IGhhcyBhIHZlcnkg
c3BlY2lmaWMgdmFsdWUgdG8gd29yayBhcm91bmQgYSBidWdeV2Rlc2lnbgplcnJvcl5XZmVhdHVy
ZSBvZiBJbnRlbCBDUFVzLiAgVEFTS19TSVpFX01BWCBpcyB0aGUgbWF4aW11bSBhZGRyZXNzIGF0
CndoaWNoIHVzZXJzcGFjZSBpcyBwZXJtaXR0ZWQgdG8gYWxsb2NhdGUgbWVtb3J5LCBidXQgdGhl
cmUgaXMgYSBodWdlCmdhcCBiZXR3ZWVuIHVzZXIgYW5kIGtlcm5lbCBhZGRyZXNzZXMsIGFuZCBh
bnkgdmFsdWUgaW4gdGhlIGdhcCB3b3VsZApiZSBhZGVxdWF0ZSBmb3IgdGhlIGNvbXBhcmlzb24u
ICBJZiB3ZSB3YW50ZWQgdG8gb3B0aW1pemUgdGhpcywgc2ltcGx5CmNoZWNraW5nIHRoZSBoaWdo
IGJpdCAod2hpY2ggeDg2IGNhbiBkbyB3aXRob3V0IGFueSBpbW1lZGlhdGUKY29uc3RhbnRzIGF0
IGFsbCkgd291bGQgYmUgc3VmZmljaWVudCBhbmQsIGZvciBhbiBhY2Nlc3Mga25vd24gdG8gZml0
CmluIDMyIGJpdHMsIG9uZSBjb3VsZCBnZXQgZXZlbiBmYW5jaWVyIGFuZCBjb21wbGV0ZWx5IGln
bm9yZSB0aGUgc2l6ZQpvZiB0aGUgYWNjZXNzLiAgKEZvciBhY2Nlc3NlcyBub3Qga25vd24gdG8g
Zml0IGluIDMyIGJpdHMsIEkgc3VzcGVjdApzb21lIGNyZWF0aXZpdHkgY291bGQgc3RpbGwgY29t
ZSB1cCB3aXRoIGEgY29uc3RydWN0aW9uIHRoYXQncwpzdWJzdGFudGlhbGx5IGZhc3RlciB0aGFu
IHRoZSBvbmUgaW4geW91ciBwYXRjaC4pCgpTbyB0aGVyZSdzIHBsZW50eSBvZiByb29tIGZvciBv
cHRpbWl6YXRpb24gaGVyZS4KCihUaGlzIGlzIG5vdCBpbiBhbnkgcmVzcGVjdCBhIE5BSyAtLSBp
dCdzIGp1c3QgYW4gb2JzZXJ2YXRpb24gdGhhdAp0aGlzIGNvdWxkIGJlIGV2ZW4gYmV0dGVyLikK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
