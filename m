Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id DF35855919
	for <lists+openrisc@lfdr.de>; Tue, 25 Jun 2019 22:41:45 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 512B3202BB;
	Tue, 25 Jun 2019 22:41:45 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by mail.librecores.org (Postfix) with ESMTPS id 8E00420110
 for <openrisc@lists.librecores.org>; Wed, 12 Jun 2019 17:04:53 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A1C9830F1BCC;
 Wed, 12 Jun 2019 15:04:43 +0000 (UTC)
Received: from redhat.com (ovpn-116-49.phx2.redhat.com [10.3.116.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A321665F1;
 Wed, 12 Jun 2019 15:04:42 +0000 (UTC)
Received: from fche by redhat.com with local (Exim 4.92)
 (envelope-from <fche@redhat.com>)
 id 1hb4no-00089G-LF; Wed, 12 Jun 2019 11:04:40 -0400
Date: Wed, 12 Jun 2019 11:04:40 -0400
From: "Frank Ch. Eigler" <fche@redhat.com>
To: Stafford Horne <shorne@gmail.com>
Message-ID: <20190612150440.GA31262@redhat.com>
References: <20190601072629.4070-1-shorne@gmail.com>
 <20190612131403.GE2358@lianli.shorne-pla.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190612131403.GE2358@lianli.shorne-pla.net>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Wed, 12 Jun 2019 15:04:48 +0000 (UTC)
X-Mailman-Approved-At: Tue, 25 Jun 2019 22:41:44 +0200
Subject: Re: [OpenRISC] [PATCH 0/2] CGEN unordered fpu compares + fixes
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
Cc: cgen@sourceware.org, Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgLQoKPiBEaWQgYW55b25lIGhhdmUgYSBjaGFuY2UgdG8gbG9vayBhdCB0aGlzPyAgVGhlIGJp
bnV0aWxzIHBhdGNoZXMgdGhhdCByZXF1aXJlCj4gdGhpcyBhcmUgYXBwcm92ZWQsIGJ1dCBJIHJh
dGhlciBub3QgY29tbWl0IHRoZW0gdW5sZXNzIHRoaXMgSSBnZXQgT0sgb24gdGhlc2UKPiBwYXRj
aGVzIGFuZCBwdXNoIHRoZW0uCgpUaGVzZSBhcmUgbWVyZ2VkLCB0aGFua3MuCgotIEZDaEUKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFp
bGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGli
cmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
