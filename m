Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E2A3D42707
	for <lists+openrisc@lfdr.de>; Wed, 12 Jun 2019 15:09:38 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9EC7320274;
	Wed, 12 Jun 2019 15:09:38 +0200 (CEST)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by mail.librecores.org (Postfix) with ESMTPS id 09C452013F
 for <openrisc@lists.librecores.org>; Wed, 12 Jun 2019 15:09:37 +0200 (CEST)
Received: by mail-pf1-f195.google.com with SMTP id i189so9633701pfg.10
 for <openrisc@lists.librecores.org>; Wed, 12 Jun 2019 06:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YKrXb0FImMFr8ECNDcQaG78GecrM5BuAIZ2zbC5Bqo4=;
 b=V3oTr+rBMV2UgckMboS0X30lfi88pk/5qJy1MCwLGwNYnt4m2vCigCAf8lUqw1mONa
 +kE+OGqbD0hTOQ1P1apcrmvnCNlnuIZj2PntdctWSfivcRab4affz5D4l0o0ZniO1fp7
 +V9u1Stq59pq91U+pSA1BBspyB32oWdML5RFDaQK6Ka/aP0YY3s46tPuhXa0e50eLQy2
 rH7X54LW+QQiLJ1DfXxxPSGikIUyS+altMRtSSh1GstFefA49tyapl41SBfE4pnUHuG0
 DTaON0fDpRO81/Owhkt4rfL/5KCOBMlD3zi2JnLrXpY1NYR8lCZgrCDEf4s5vcuMbo9z
 p0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YKrXb0FImMFr8ECNDcQaG78GecrM5BuAIZ2zbC5Bqo4=;
 b=FYn2EvG79I8D6Szb4fWRmqChHGquRJ87EcgvidXBG1yF2m1s1E/7aZW1SbzNHPGY7s
 ENQVw0AEjLgWyRQOoHRa0tso8DhjFnmKWZzrL9rRYzcS5TXD3k/sF36GDuyjpt7C1a4l
 w7VuBqtBTigBsLDiw195021SDE1MGOmDTVlKZp5OjTwYDW37cJGZ7BQmV/WFAiIXkosi
 38gmQwve4A4yLFcDGTWIGAiyIJrpX7Hge7N5JXL6XPBeiZ6gJiVrnuOYZ3qlUTvGmCn2
 fcSpHYmrQDyG/9B4fptM0AFW8+/FTE7QnBT3/E9f2hx/EXtOL6P3yKoq1fDIihaf0EdG
 ypvQ==
X-Gm-Message-State: APjAAAX12HYSyIo9hpDhyFznK7VArpdGXWHUwnEnn18ANI6aaPyd94ow
 MkeX3zFofUhgbKNcDiK6cH4=
X-Google-Smtp-Source: APXvYqy87ROKYJmHvnG7mbhBSWTBz0FBtQNYh8ZE3DEs7KlhM9yL/L+Z8h6lk52bKHABmSS7hOGJBw==
X-Received: by 2002:a62:ed0a:: with SMTP id u10mr53204299pfh.243.1560344975561; 
 Wed, 12 Jun 2019 06:09:35 -0700 (PDT)
Received: from localhost (g30.211-19-85.ppp.wakwak.ne.jp. [211.19.85.30])
 by smtp.gmail.com with ESMTPSA id b17sm21728469pfb.18.2019.06.12.06.09.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 12 Jun 2019 06:09:34 -0700 (PDT)
Date: Wed, 12 Jun 2019 22:09:32 +0900
From: Stafford Horne <shorne@gmail.com>
To: Andrew Burgess <andrew.burgess@embecosm.com>
Message-ID: <20190612130932.GB2358@lianli.shorne-pla.net>
References: <20190610204940.3846-1-shorne@gmail.com>
 <20190611214811.GS23204@embecosm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190611214811.GS23204@embecosm.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [OpenRISC] [PATCH v3 10/11] sim/testsuite/or1k: Add test case
 for l.adrp instruction
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
Cc: Nick Clifton <nickc@redhat.com>, Openrisc <openrisc@lists.librecores.org>,
 GNU Binutils <binutils@sourceware.org>, Andrey Bacherov <bandvig@mail.ru>,
 GDB patches <gdb-patches@sourceware.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMTA6NDg6MTFQTSArMDEwMCwgQW5kcmV3IEJ1cmdlc3Mg
d3JvdGU6Cj4gKiBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4gWzIwMTktMDYtMTEg
MDU6NDk6MzkgKzA5MDBdOgo+IAo+ID4gVGhpcyBpcyBhIHNpbXBsZSB0ZXN0IHRvIGVuc3VyZSB0
aGF0IHRoZSBsLmFkcnAgaW5zdHJ1Y3Rpb24gY2FuIGJlIGFzc2VtYmxlZCBhbmQKPiA+IHNpbXVs
YXRlZCBjb3JyZWN0bHkuCj4gPiAKPiA+IHNpbS90ZXN0c3VpdGUvc2ltL29yMWsvQ2hhbmdlTG9n
Ogo+ID4gCj4gPiB5eXl5LW1tLWRkICBTdGFmZm9yZCBIb3JuZSAgPHNob3JuZUBnbWFpbC5jb20+
Cj4gPiAKPiA+IAkqIGFkcnAuUzogTmV3IGZpbGUuCj4gCj4gVGhpcyBpcyBmaW5lIHdpdGggb25l
IG5pdCBiZWxvdy4KPiAKPiBUaGFua3MsCj4gQW5kcmV3Cj4gCj4gCj4gPiAtLS0KPiA+IENoYW5n
ZXMgc2luY2UgdjI6Cj4gPiAgLSBuZXcgcGF0Y2gKPiA+IAo+ID4gIHNpbS90ZXN0c3VpdGUvc2lt
L29yMWsvYWRycC5TIHwgNzMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+
ICAxIGZpbGUgY2hhbmdlZCwgNzMgaW5zZXJ0aW9ucygrKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBzaW0vdGVzdHN1aXRlL3NpbS9vcjFrL2FkcnAuUwo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvc2lt
L3Rlc3RzdWl0ZS9zaW0vb3Ixay9hZHJwLlMgYi9zaW0vdGVzdHN1aXRlL3NpbS9vcjFrL2FkcnAu
Uwo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAuLmJhMzg0Y2Nj
ODQKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL3NpbS90ZXN0c3VpdGUvc2ltL29yMWsvYWRy
cC5TCj4gPiBAQCAtMCwwICsxLDczIEBACj4gPiArLyogVGVzdHMgdGhlIGxvYWQgcGFnZSBhZGRy
ZXNzIGluc3RydWN0aW9uLgo+ID4gKwo+ID4gKyAgIENvcHlyaWdodCAoQykgMjAxNy0yMDE5IEZy
ZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgSW5jLgo+IAo+IFRoaXMgZGF0ZSByYW5nZSBzaG91bGQg
anVzdCBiZSAnMjAxOScuCgpPaCwgb2YgY291cnNlLCBiYWQgY29weSBmcm9tIG1lLiAKCi1TdGFm
Zm9yZCAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3Bl
blJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8v
bGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
