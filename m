Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 9C45C497662
	for <lists+openrisc@lfdr.de>; Mon, 24 Jan 2022 01:03:01 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1CB202475F;
	Mon, 24 Jan 2022 01:03:01 +0100 (CET)
Received: from smtp-fw-80006.amazon.com (smtp-fw-80006.amazon.com
 [99.78.197.217])
 by mail.librecores.org (Postfix) with ESMTPS id 3CCF720C4E
 for <openrisc@lists.librecores.org>; Mon, 24 Jan 2022 01:02:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.jp; i=@amazon.co.jp; q=dns/txt;
 s=amazon201209; t=1642982579; x=1674518579;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=884EPx7zeLdONILeLA66h3ygMwUbXySanvZ39llmgO4=;
 b=NnmnYGUKGjcenrnq7QOtElu270C8S4i9Y7D89uv6I+XQVLCvOD/xgpY7
 BopjlY1l4jZ5AyJy1kCvDNG01/hg0dS/en1FgIltHRJ5ZAjrb1aC58PwT
 3M9cdpiL8rQDdP5QHGLUXWMe+fKKC/5XxRa/cALPKUAo2h8LvJv0AoO9K U=;
X-IronPort-AV: E=Sophos;i="5.88,311,1635206400"; d="scan'208";a="57429041"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-pdx-2a-e6c05252.us-west-2.amazon.com) ([10.25.36.214])
 by smtp-border-fw-80006.pdx80.corp.amazon.com with ESMTP;
 24 Jan 2022 00:02:57 +0000
Received: from EX13MTAUWC002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-pdx-2a-e6c05252.us-west-2.amazon.com (Postfix) with
 ESMTPS id EE8794199F; Mon, 24 Jan 2022 00:02:56 +0000 (UTC)
Received: from EX13D04ANC001.ant.amazon.com (10.43.157.89) by
 EX13MTAUWC002.ant.amazon.com (10.43.162.240) with Microsoft SMTP Server (TLS)
 id 15.0.1497.28; Mon, 24 Jan 2022 00:02:56 +0000
Received: from 88665a182662.ant.amazon.com (10.43.160.114) by
 EX13D04ANC001.ant.amazon.com (10.43.157.89) with Microsoft SMTP Server (TLS)
 id 15.0.1497.28; Mon, 24 Jan 2022 00:02:53 +0000
From: Kuniyuki Iwashima <kuniyu@amazon.co.jp>
To: <shorne@gmail.com>
Date: Mon, 24 Jan 2022 09:02:49 +0900
Message-ID: <20220124000249.4295-1-kuniyu@amazon.co.jp>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <Ye3keps4aHhkbYzr@antec>
References: <Ye3keps4aHhkbYzr@antec>
MIME-Version: 1.0
X-Originating-IP: [10.43.160.114]
X-ClientProxiedBy: EX13D03UWC003.ant.amazon.com (10.43.162.79) To
 EX13D04ANC001.ant.amazon.com (10.43.157.89)
Subject: Re: [OpenRISC] [PATCH] openrisc/boot: Remove unnecessary
 initialisation in memcpy().
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
Cc: jonas@southpole.se, benh@amazon.com, linux-kernel@vger.kernel.org,
 openrisc@lists.librecores.org, kuniyu@amazon.co.jp, kuni1840@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogICBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4KRGF0ZTogICBNb24sIDI0
IEphbiAyMDIyIDA4OjI3OjU0ICswOTAwCj4gT24gU3VuLCBKYW4gMjMsIDIwMjIgYXQgMTE6MDE6
MDBBTSArMDkwMCwgS3VuaXl1a2kgSXdhc2hpbWEgd3JvdGU6Cj4gPiAnZCcgYW5kICdzJyBhcmUg
aW5pdGlhbGlzZWQgbGF0ZXIgd2l0aCAnZGVzdF93JyBhbmQgJ3NyY193Jywgc28gd2UgbmVlZCBu
b3QKPiA+IGluaXRpYWxpc2UgdGhlbSBiZWZvcmUgdGhhdC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1i
eTogS3VuaXl1a2kgSXdhc2hpbWEgPGt1bml5dUBhbWF6b24uY28uanA+Cj4gCj4gVGhpcyBsb29r
cyBmaW5lIHRvIG1lLiAgSSB3aWxsIHF1ZXVlIHRoaXMgZm9yIHRoZSBuZXh0IHJlbGVhc2UuCgpU
aGFuayB5b3UuCgoKPiAKPiBKdXN0IGN1cmlvdXMgd2h5IGFyZSB5b3Ugd29ya2luZyBvbiBPcGVu
UklTQz8KCldoaWxlIHJlYWRpbmcgbWVtY3B5KCkgdmFyaWFudHMsIEkgZm91bmQgYSBuaXQgdG8g
Zml4IGluIHg4NiBib290LXRpbWUKbWVtY3B5KCkgWzBdLiAgV2hpbGUgSSdtIGF0IGl0LCBJIGp1
c3Qgc3RhcnRlZCByZWFkaW5nIGFsbCBhcmNoIG9uZXMgOykKClswXTogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGttbC8yMDIyMDEyMzAxNTgwNy40NTAwNS0xLWt1bml5dUBhbWF6b24uY28uanAv
CgoKPiAKPiAtU3RhZmZvcmQKPiAKPiA+IC0tLQo+ID4gIGFyY2gvb3BlbnJpc2MvbGliL21lbWNw
eS5jIHwgMiArLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9saWIvbWVtY3B5LmMgYi9h
cmNoL29wZW5yaXNjL2xpYi9tZW1jcHkuYwo+ID4gaW5kZXggZmUyMTc3NjI4Li5lMmFmOWI1MTAg
MTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL29wZW5yaXNjL2xpYi9tZW1jcHkuYwo+ID4gKysrIGIvYXJj
aC9vcGVucmlzYy9saWIvbWVtY3B5LmMKPiA+IEBAIC0xMDEsNyArMTAxLDcgQEAgdm9pZCAqbWVt
Y3B5KHZvaWQgKmRlc3QsIF9fY29uc3Qgdm9pZCAqc3JjLCBfX2tlcm5lbF9zaXplX3QgbikKPiA+
ICAgKi8KPiA+ICB2b2lkICptZW1jcHkodm9pZCAqZGVzdCwgX19jb25zdCB2b2lkICpzcmMsIF9f
a2VybmVsX3NpemVfdCBuKQo+ID4gIHsKPiA+IC0JdW5zaWduZWQgY2hhciAqZCA9ICh1bnNpZ25l
ZCBjaGFyICopZGVzdCwgKnMgPSAodW5zaWduZWQgY2hhciAqKXNyYzsKPiA+ICsJdW5zaWduZWQg
Y2hhciAqZCwgKnM7Cj4gPiAgCXVpbnQzMl90ICpkZXN0X3cgPSAodWludDMyX3QgKilkZXN0LCAq
c3JjX3cgPSAodWludDMyX3QgKilzcmM7Cj4gPiAgCj4gPiAgCS8qIElmIGJvdGggc291cmNlIGFu
ZCBkZXN0IGFyZSB3b3JkIGFsaWduZWQgY29weSB3b3JkcyAqLwo+ID4gLS0gCj4gPiAyLjMwLjIK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
