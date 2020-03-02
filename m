Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 171F21754BA
	for <lists+openrisc@lfdr.de>; Mon,  2 Mar 2020 08:43:24 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id BE2D32017F;
	Mon,  2 Mar 2020 08:43:23 +0100 (CET)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by mail.librecores.org (Postfix) with ESMTPS id 6F2C52017F
 for <openrisc@lists.librecores.org>; Mon,  2 Mar 2020 08:43:21 +0100 (CET)
Received: from ip5f5bf7ec.dynamic.kabel-deutschland.de ([95.91.247.236]
 helo=wittgenstein) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <christian.brauner@ubuntu.com>)
 id 1j8fjS-00012G-Sr; Mon, 02 Mar 2020 07:43:19 +0000
Date: Mon, 2 Mar 2020 08:43:18 +0100
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Stafford Horne <shorne@gmail.com>
Message-ID: <20200302074318.oekwyowoej5777cn@wittgenstein>
References: <20200301213851.8096-1-shorne@gmail.com>
 <20200301213851.8096-2-shorne@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200301213851.8096-2-shorne@gmail.com>
Subject: Re: [OpenRISC] [PATCH v2 1/3] openrisc: Convert copy_thread to
 copy_thread_tls
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
Cc: Jonas Bonn <jonas@southpole.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Openrisc <openrisc@lists.librecores.org>,
 Allison Randal <allison@lohutok.net>, Thomas Gleixner <tglx@linutronix.de>,
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBNYXIgMDIsIDIwMjAgYXQgMDY6Mzg6NDlBTSArMDkwMCwgU3RhZmZvcmQgSG9ybmUg
d3JvdGU6Cj4gVGhpcyBpcyByZXF1aXJlZCBmb3IgY2xvbmUzIHdoaWNoIHBhc3NlcyB0aGUgVExT
IHZhbHVlIHRocm91Z2ggYQo+IHN0cnVjdCByYXRoZXIgdGhhbiBhIHJlZ2lzdGVyLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFN0YWZmb3JkIEhvcm5lIDxzaG9ybmVAZ21haWwuY29tPgoKVGhhbmtzIQpB
Y2tlZC1ieTogQ2hyaXN0aWFuIEJyYXVuZXIgPGNocmlzdGlhbi5icmF1bmVyQHVidW50dS5jb20+
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVND
IG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3Rz
LmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
