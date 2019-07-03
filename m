Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 080335EF07
	for <lists+openrisc@lfdr.de>; Thu,  4 Jul 2019 00:09:32 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B948B20357;
	Thu,  4 Jul 2019 00:09:31 +0200 (CEST)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by mail.librecores.org (Postfix) with ESMTPS id E6DB320014
 for <openrisc@lists.librecores.org>; Thu,  4 Jul 2019 00:09:29 +0200 (CEST)
Received: by mail-pg1-f193.google.com with SMTP id p10so1898953pgn.1
 for <openrisc@lists.librecores.org>; Wed, 03 Jul 2019 15:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YjVriwlkHYmnbMQm2NKhS/VpL5HaL7r1i8Rvv5GtTzA=;
 b=T/i29f9hVqp38hnmv/hEDrebnpSnZHilBErBeZ5nx0V9jqS7moYcNab4yNG8aFSMZm
 VbPMeiOwi93e27dJsCj7IdM5/rGcUNWNk7Tk9DGB3z6PAPLf+C2vj+QFpiDosdnkUOYr
 cNSrNl0nP4tPk6CyE0ka3Ofb2wUUpqEOIo7nYuQWDHe9nd77O7SdFIhTfi7NALBvGjkh
 t3tFkfFkLXbhPdvcFljduBEJxUDYDG9aexIIGFyc0ogSNCwXNM1NJBmqgEy0sA/dVktM
 Fz8KDBI0hhrGziKwvDdjDpY7wmkiI0YX30qOAiv/59o+aqcgBj8rnOck1QXhrih338nN
 GEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YjVriwlkHYmnbMQm2NKhS/VpL5HaL7r1i8Rvv5GtTzA=;
 b=qdPXk2h56fxFWrjd7d3awfRQFRl82s2eEtipl1v7GUwOQVbBfb66/jfB9/dWLER9A5
 VWDhEgUk1GJevoCta7AvM1ISSXZW8likp3a3gg6WNCuqFY5pWTBAVZTDlXrrSoXD592X
 PTCuqnOZpO7yV0egxrqDxcy1nrjoboT2eCoBInJXt25h4JvdPAwe5d+w5owYZMyyxC2x
 I1jkJgxYdyxjEl2DqCtvG1DdLOVEj32Fi+9//auQVkMD1OGAZdjKv2nYPK93H1JreHsf
 BMt3z+iw61XnSuFJZ4Bi1Z+xjtiE0eYgS71HefSFItiLQygO/mWZEfznLebwyB+MpE83
 RxkQ==
X-Gm-Message-State: APjAAAW1yJxIon8+JjKgmVmxGTxfjZaRXysyaeYHpMrqMkzbv1WPa1b8
 YwZPApdkd//Sb0PqvbNy98E=
X-Google-Smtp-Source: APXvYqwuliB22m+XKjPYIYqPM0MvD6nUF0j4YniarbQJ/FlcikLeLO3vxhUyfQnJLDm+cJutYIrlbQ==
X-Received: by 2002:a17:90a:2627:: with SMTP id
 l36mr15785363pje.71.1562191768532; 
 Wed, 03 Jul 2019 15:09:28 -0700 (PDT)
Received: from localhost (g223.61-115-60.ppp.wakwak.ne.jp. [61.115.60.223])
 by smtp.gmail.com with ESMTPSA id y12sm4571531pfn.187.2019.07.03.15.09.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 15:09:28 -0700 (PDT)
Date: Thu, 4 Jul 2019 07:09:26 +0900
From: Stafford Horne <shorne@gmail.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Message-ID: <20190703220926.GD2601@lianli.shorne-pla.net>
References: <20190703033351.11924-1-shorne@gmail.com>
 <20190703033351.11924-5-shorne@gmail.com>
 <20190703154301.GY18316@gate.crashing.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190703154301.GY18316@gate.crashing.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [OpenRISC] [PATCH v2 4/5] or1k: Initial support for FPU
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
Cc: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>,
 Openrisc <openrisc@lists.librecores.org>,
 GCC patches <gcc-patches@gcc.gnu.org>, Jeff Law <law@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMTA6NDM6MDFBTSAtMDUwMCwgU2VnaGVyIEJvZXNzZW5r
b29sIHdyb3RlOgo+IEhpIFN0YWZmb3JkLAo+IAo+IE9uIFdlZCwgSnVsIDAzLCAyMDE5IGF0IDEy
OjMzOjUwUE0gKzA5MDAsIFN0YWZmb3JkIEhvcm5lIHdyb3RlOgo+ID4gKyAgICBjYXNlICdkJzoK
PiA+ICsgICAgICBpZiAoUkVHX1AgKHgpKQo+ID4gKwkgIGlmIChHRVRfTU9ERSAoeCkgPT0gREZt
b2RlIHx8IEdFVF9NT0RFICh4KSA9PSBESW1vZGUpCj4gPiArCSAgICBmcHJpbnRmIChmaWxlLCAi
JXMsJXMiLCByZWdfbmFtZXNbUkVHTk8gKG9wZXJhbmQpXSwKPiA+ICsJCQkJICAgIHJlZ19uYW1l
c1tSRUdOTyAob3BlcmFuZCkgKyAxXSk7Cj4gPiArCSAgZWxzZQo+ID4gKwkgICAgZnByaW50ZiAo
ZmlsZSwgIiVzIiwgcmVnX25hbWVzW1JFR05PIChvcGVyYW5kKV0pOwo+ID4gKyAgICAgIGVsc2UK
PiAKPiBUaGUgY29kaW5nIGNvbnZlbnRpb25zIHNheXMgdG8gdXNlIGJyYWNlcyBhcm91bmQgbmVz
dGVkIGNvbmRpdGlvbmFscy4KClJpZ2h0IEkgd2lsbCBmaXggdGhhdC4gIEludGVyZXN0aW5nbHkg
dGhlIGluZGVudGF0aW9uIGlzIGNvcnJlY3QganVzdCBtaXNzaW5nCnRoZSBicmFjZXMuCiAKPiA+
IEBAIC0yMTIsNiArMjE0LDcgQEAgZW51bSByZWdfY2xhc3MKPiA+ICAjZGVmaW5lIFJFR19DTEFT
U19DT05URU5UUyAgICAgIFwKPiA+ICB7IHsgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCB9LAlcCj4g
PiAgICB7IFNJQkNBTExfUkVHU19NQVNLLCAgIDAgfSwJXAo+ID4gKyAgeyAweDdmZmZmZWZlLCAw
eDAwMDAwMDAwIH0sCVwKPiAKPiBBYm92ZSB5b3Ugc2FpZCByMCwgcjMwLCByMzEgYXJlIGV4Y2x1
ZGVkLCBidXQgdGhpcyBpcyByMCwgcjgsIHIzMCwgb3IKPiBpbiBHQ0MgcmVnaXN0ZXIgbnVtYmVy
cywgMCwgOCwgYW5kIDMxPyAgWW91IHByb2JhYmx5IHNob3VsZCBtZW50aW9uIHI4Cj4gc29tZXdo
ZXJlIChpdCdzIGJlY2F1c2UgaXQgaXMgdGhlIGxhc3QgYXJnLCB0aGlzIGF2b2lkIHByb2JsZW1z
LCBJIGd1ZXNzPyksCj4gYW5kIHRoZSAzMC8zMSB0aGluZyBpcyBjb25mdXNlZCBzb21lIHdheS4g
IE1heWJlIGl0IGlzIGFsbCBqdXN0IHRoYXQgb25lCj4gZG9jdW1lbnRhdGlvbiBsaW5lIDotKQo+
Cj4gPiArOyAgZCAtIGRvdWJsZSBwYWlyIGJhc2UgcmVnaXN0ZXJzIChleGNsdWRlcyByMCwgcjMw
IGFuZCByMzEgd2hpY2ggb3ZlcmZsb3cpCgpIbW0sIG1heWJlIEkgbWVzc2VkIHVwIHRoZSBtYXNr
LiAgSXQgc2hvdWxkIGJlIHIwLCByMzAgYW5kIHIzMS4gIFJlZ2lzdGVyIHBhaXJzCmNhbiBiZSBh
IGJhc2UgcmVnaXN0ZXIgKHJYKSB3aXRoIGEgKzEgb3IgKzIgb2Zmc2V0IHNlY29uZCByZWdpc3Rl
ci4KClJlZ2lzdGVycyBub3QgYWxsb3dlZAogIC0gcjAsIGJlY2F1c2UgaXRzIHJlc2VydmVkIGZv
ciBoYXJkd2lyZWQgemVybyBhbmQgZG9lc24ndCB3b3JrIGFzIGEgZG91YmxlCiAgICB6ZXJvIHdo
ZW4gcGFpcmVkIHdpdGggYSBnZW5lcmFsIHJlZ2lzdGVyLgogIC0gcjMxLCBiZWNhdXNlIGl0IGNh
bnQgcGFpciB3aXRoIHIzMiBvciByMzMgKHRob3NlIGFyZSBvdmVyZmxvd3MpCiAgLSByMzAsIGJl
Y2F1c2UgaXQgY2FudCB3b3JrIHdoZW4gcGFyaWVkIHdpdGggcjMyIChpdHMgYW4gb3ZlcmZsb3cp
LCBpdCB3b3VsZAogICAgd29yayB3aXRoIHIzMSwgYnV0IEdDQyB3aWxsIG5vdCBnZW5lcmF0ZSB0
aGF0IHBhaXIgYW55d2F5LgoKLVN0YWZmb3JkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5s
aWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5y
aXNjCg==
