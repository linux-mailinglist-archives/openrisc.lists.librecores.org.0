Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B462B2460E7
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:46:52 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 74BAD20E74;
	Mon, 17 Aug 2020 10:46:52 +0200 (CEST)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by mail.librecores.org (Postfix) with ESMTPS id 11E6E20C9D
 for <openrisc@lists.librecores.org>; Thu,  6 Aug 2020 21:04:51 +0200 (CEST)
Received: by mail-ed1-f66.google.com with SMTP id a14so18961442edx.7
 for <openrisc@lists.librecores.org>; Thu, 06 Aug 2020 12:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OAu2FsIdT/Af1bgzbaks/MsaryD2Qq0m1XVOnruTc4Q=;
 b=s9FGsIsduvqKTkJ/8xJSIxfu6td51/sCQXrBUcEK6b7KZh45voFJqxOwxaco8tqxuJ
 LGyFkpMw1gaQfns1E7m7hk1G5TgptBIpXrTo2v8SqH/qxx9R4EvIuoDUkmsBZcY4qoW9
 GPc29A5a5El8jN89jD5jcqi1mZH6onO/0OtyJLdCwyMa96Xi1KYOCp0rll8pF98kJEef
 ZmJKyCTHpT9DLy6rtqH0p1au+h9RTSMkqMasszcnFmCDX6ROd99IRWin00lW45fc3SRA
 4/AB6klEVrNE6uvsO4GsHCX4JEXXVLTX1VIT7SItRpzygKt9gowhCAcI2hI2X2yBSGaQ
 mFvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OAu2FsIdT/Af1bgzbaks/MsaryD2Qq0m1XVOnruTc4Q=;
 b=WQPL12wmwOMtApaqXOmmmk0XXveViIiX52xpa6ZgqSwY1n/84r2qYHH2izHj6Xxz11
 vtIroWiCHRDiKNQReKeG8ZMmQV+AEfD9688Nf/dNg8mxjHZjtk/tpHOETM5q8POOZaL3
 VqDTw9mliVsPQHrs1HbcQKZA4iUB0SaYWp2SZAyMJ0DBtqB6bmUssyGoDy8SihsDOD6w
 E6jyqihAwD3bvF5oDmHEw+1IFdGGsPsP5EisOeri9pY8lGqZaqjBmsB2CPpwu613r9PQ
 LuC0KxxHnAwUqn/R/Q90nWhce5+wj9XD/ES2y+e2jb8p37MNya9/m4EtUFSUPtC1Tcxi
 S1fQ==
X-Gm-Message-State: AOAM532Kwczsgh+yb067gMQ0R9OTLK4NQ3r/6nIdgrFFVaAryobJy9j2
 tWu0RPNSdV06Hw4SsPgBONo=
X-Google-Smtp-Source: ABdhPJyvG7rjAq0tJb1OxgQQcpzr9RyVUbCWSGg7fnFubUO7ZGXeWPUGz9zLfFpf+qPQFmsBbsMAWA==
X-Received: by 2002:a50:f687:: with SMTP id d7mr3210799edn.306.1596740690676; 
 Thu, 06 Aug 2020 12:04:50 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:a7fb:e200:d567:ec52:e0a5:f485])
 by smtp.gmail.com with ESMTPSA id x1sm4309881ejv.11.2020.08.06.12.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 12:04:50 -0700 (PDT)
Date: Thu, 6 Aug 2020 21:04:49 +0200
From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To: Stafford Horne <shorne@gmail.com>
Message-ID: <20200806190449.xqflhmbiiv5btusf@ltop.local>
References: <20200805210725.310301-1-shorne@gmail.com>
 <20200805210725.310301-6-shorne@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200805210725.310301-6-shorne@gmail.com>
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:38 +0200
Subject: Re: [OpenRISC] [PATCH v2 5/6] openrisc: signal: Fix sparse address
 space warnings
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
Cc: Jonas Bonn <jonas@southpole.se>, openrisc@lists.librecores.org,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCBBdWcgMDYsIDIwMjAgYXQgMDY6MDc6MjRBTSArMDkwMCwgU3RhZmZvcmQgSG9ybmUg
d3JvdGU6Cj4gLS0tCj4gIGFyY2gvb3BlbnJpc2Mva2VybmVsL3NpZ25hbC5jIHwgMTQgKysrKysr
Ky0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMo
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9rZXJuZWwvc2lnbmFsLmMgYi9hcmNo
L29wZW5yaXNjL2tlcm5lbC9zaWduYWwuYwo+IGluZGV4IDRmMDc1NDg3NGQ3OC4uN2NlMDcyODQx
MmY2IDEwMDY0NAo+IC0tLSBhL2FyY2gvb3BlbnJpc2Mva2VybmVsL3NpZ25hbC5jCj4gKysrIGIv
YXJjaC9vcGVucmlzYy9rZXJuZWwvc2lnbmFsLmMKPiBAQCAtNzYsNyArNzYsNyBAQCBhc21saW5r
YWdlIGxvbmcgX3N5c19ydF9zaWdyZXR1cm4oc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gIAkgKiB0
aGVuIGZyYW1lIHNob3VsZCBiZSBkd29yZCBhbGlnbmVkIGhlcmUuICBJZiBpdCdzCj4gIAkgKiBu
b3QsIHRoZW4gdGhlIHVzZXIgaXMgdHJ5aW5nIHRvIG1lc3Mgd2l0aCB1cy4KPiAgCSAqLwo+IC0J
aWYgKCgobG9uZylmcmFtZSkgJiAzKQo+ICsJaWYgKCgoX19mb3JjZSB1bnNpZ25lZCBsb25nKWZy
YW1lKSAmIDMpCj4gIAkJZ290byBiYWRmcmFtZTsKClNhbWUgYXMgcGF0Y2ggNiwgdGhlIF9fZm9y
Y2UgaXMgbm90IG5lZWRlZC4KICAKLS0gTHVjCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5s
aWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5y
aXNjCg==
