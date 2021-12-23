Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B554947E61C
	for <lists+openrisc@lfdr.de>; Thu, 23 Dec 2021 16:57:59 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 4CB02242E7;
	Thu, 23 Dec 2021 16:57:59 +0100 (CET)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by mail.librecores.org (Postfix) with ESMTPS id EAE4F21535
 for <openrisc@lists.librecores.org>; Thu, 23 Dec 2021 16:57:57 +0100 (CET)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4JKZbT5lCzz1r87L;
 Thu, 23 Dec 2021 16:57:57 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4JKZbT5NQrz1qqkB;
 Thu, 23 Dec 2021 16:57:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id RStAOD2izXMF; Thu, 23 Dec 2021 16:57:57 +0100 (CET)
X-Auth-Info: pPEdh0czshnQ9Cvno5IIaazlF+2f1sKp2ix2jMBik65HNimeKHZ6X2PjMTAYElqF
Received: from igel.home (ppp-46-244-170-242.dynamic.mnet-online.de
 [46.244.170.242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 23 Dec 2021 16:57:56 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
 id 5CF752C378C; Thu, 23 Dec 2021 16:57:56 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Stafford Horne via Libc-alpha <libc-alpha@sourceware.org>
References: <20211210233456.4146479-1-shorne@gmail.com>
 <cedcb34e-36e3-3bb8-07b7-8412c052b81d@linaro.org>
 <Ybl/E2BWBGRMwF0G@antec> <YcSZ0iyC6STzh9uP@antec>
X-Yow: Being a BALD HERO is almost as FESTIVE as a TATTOOED KNOCKWURST.
Date: Thu, 23 Dec 2021 16:57:56 +0100
In-Reply-To: <YcSZ0iyC6STzh9uP@antec> (Stafford Horne via Libc-alpha's message
 of "Fri, 24 Dec 2021 00:46:26 +0900")
Message-ID: <87pmpnnwjf.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.90 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [OpenRISC] [PATCH v3 00/13] Glibc OpenRISC port
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
 Adhemerval Zanella <adhemerval.zanella@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gRGV6IDI0IDIwMjEsIFN0YWZmb3JkIEhvcm5lIHZpYSBMaWJjLWFscGhhIHdyb3RlOgoKPiBJ
dCBzZWVtcyB0aGUgd3JpdGUgdG8gdGhlIHRtcCBmaWxlIHdhcyBmYWlsaW5nIGR1ZSB0aGUgcmUt
b3BlbiBub3QgcGFzc2luZwo+IE9fTEFSR0VGSUxFLgoKb3BlbjY0IGltcGxpZXMgT19MQVJHRUZJ
TEUsIHNvIGlmIHRoYXQgaXMgbWFraW5nIGEgZGlmZmVyZW5jZSwgdGhlbiB5b3VyCm9wZW42NCBp
cyBicm9rZW4uCgotLSAKQW5kcmVhcyBTY2h3YWIsIHNjaHdhYkBsaW51eC1tNjhrLm9yZwpHUEcg
S2V5IGZpbmdlcnByaW50ID0gNzU3OCBFQjQ3IEQ0RTUgNEQ2OSAyNTEwICAyNTUyIERGNzMgRTc4
MCBBOURBIEFFQzEKIkFuZCBub3cgZm9yIHNvbWV0aGluZyBjb21wbGV0ZWx5IGRpZmZlcmVudC4i
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVND
IG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3Rz
LmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
