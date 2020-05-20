Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C467B1DB06E
	for <lists+openrisc@lfdr.de>; Wed, 20 May 2020 12:41:41 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5376720B77;
	Wed, 20 May 2020 12:41:41 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by mail.librecores.org (Postfix) with ESMTP id 1767020918
 for <openrisc@lists.librecores.org>; Wed, 20 May 2020 12:41:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589971298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=twj9vFnlqUjFqpJv7jQqOI0svo7vf6D1R5MFHh/J8A8=;
 b=LGMrYHaVOqBFj2Nc0MOZ29cxCNRXyN6Jd9F+lVLnxAWT/SahTfGdEYzZl1+olht4Wly+gS
 6ra8Mw4aLHTQpgtxeFdeJpsI7Any53VfZnH1Mkpb2wNZevCyvWA2zZHzzG5NHLJK5FcuzT
 6i7zzk2MJLXYRE5pIK3cjwnEjtoWVSw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-zil5hujuPhS0570E3uqlKQ-1; Wed, 20 May 2020 06:41:35 -0400
X-MC-Unique: zil5hujuPhS0570E3uqlKQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98A99460;
 Wed, 20 May 2020 10:41:33 +0000 (UTC)
Received: from [10.36.114.30] (ovpn-114-30.ams2.redhat.com [10.36.114.30])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B125782E72;
 Wed, 20 May 2020 10:41:30 +0000 (UTC)
To: Stafford Horne <shorne@gmail.com>
References: <20200514210018.2749462-1-shorne@gmail.com>
 <2c2a4907-bb08-a112-e716-bf6f2cef3642@redhat.com>
 <20200519204257.GC2553@lianli.shorne-pla.net>
From: Nick Clifton <nickc@redhat.com>
Autocrypt: addr=nickc@redhat.com; prefer-encrypt=mutual; keydata=
 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
 6susi2ReUyNJEJaSnjO5z13TQ1U=
Organization: Red Hat
Message-ID: <67c98ff5-77bd-d63a-1765-b28b009a81e7@redhat.com>
Date: Wed, 20 May 2020 11:41:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200519204257.GC2553@lianli.shorne-pla.net>
Content-Language: en-GB
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [OpenRISC] [PATCH 0/8] OpenRISC BFD fixups for Glibc
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
 GNU Binutils <binutils@sourceware.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgU3RhZmZvcmQsCgo+IFRoYXQgd2FzIG5vdCBtdWNoIGRlbGF5IGF0IGFsbC4gICBIb3dldmVy
LCBJIHdhcyBhYm91dCB0byBqdXN0IGFwcGx5IHRoZSBzZXQgb2YKPiBwYXRjaGVzIG15c2VsZi4g
IFdvdWxkIHRoYXQgaGF2ZSBiZWVuIGEgcHJvYmxlbT8KCk5vdCBhdCBhbGwuICBCdXQgSSBoYWQg
YXBwbGllZCB0aGUgcGF0Y2hlcyBsb2NhbGx5LCBpbiBvcmRlciB0byBydW4gCnRoZW0gdGhyb3Vn
aCBteSB0ZXN0IGhhcm5lc3MsIHNvIGl0IHdhcyBubyBlZmZvcnQgZm9yIG1lIHRvIGNvbW1pdAp0
aGUgcGF0Y2hlcyBhcyB3ZWxsLgoKQ2hlZXJzCiAgTmljawoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklT
Q0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3Rp
bmZvL29wZW5yaXNjCg==
