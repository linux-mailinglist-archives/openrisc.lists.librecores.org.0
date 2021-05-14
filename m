Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E00823806AC
	for <lists+openrisc@lfdr.de>; Fri, 14 May 2021 12:03:07 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 999CD213B5;
	Fri, 14 May 2021 12:03:07 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 6B018211E1
 for <openrisc@lists.librecores.org>; Fri, 14 May 2021 12:03:05 +0200 (CEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5018F6101D;
 Fri, 14 May 2021 10:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620986584;
 bh=FPNQwU1Fl73aJ4Stz3Ksja+PDp3+qBwHTreqoor7ZMc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dkTxjMxP8BS6aWEGKFs2dGOjRAmMG0QxKwcyb5GR/9tAehdLz0QhB3WZ08W9vzGdy
 PuJXKBQX3/no3Syh5eHDcGa0y9Tfb61Exj2nQREY3PzKQsRaglTxHRI3OhPAvhnGwM
 kNz32ifd5QdQ+cIF1l7u7UPTFeV++igS9QglAdBEkH7ETJQB9HeB4kM9BofSjbrqL3
 sauUqQUPzcV5IMwaD6iBdhpLGavlq6EXnfVJhvB+r5U3qMTc75PZXLZJuvI8XbZAvM
 JP7UPxy2wwlwV6GHCUF8HT38cvckdKtoaSdtkT8DqZUn4ONNb54oCb1H1exssqbka6
 ikhtfGsB0CTSA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arch@vger.kernel.org
Date: Fri, 14 May 2021 12:00:50 +0200
Message-Id: <20210514100106.3404011-3-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210514100106.3404011-1-arnd@kernel.org>
References: <20210514100106.3404011-1-arnd@kernel.org>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v2 02/13] openrisc: always use unaligned-struct
 header
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
Cc: Jonas Bonn <jonas@southpole.se>, Arnd Bergmann <arnd@arndb.de>,
 Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org,
 openrisc@lists.librecores.org, Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KCm9wZW5yaXNjIGlzIHRoZSBvbmx5
IGFyY2hpdGVjdHVyZSB1c2luZyB0aGUgbGludXgvdW5hbGlnbmVkLyptZW1tb3ZlCmluZnJhc3Ry
dWN0dXJlLiBUaGVyZSBpcyBhIGNvbW1lbnQgc2F5aW5nIHRoYXQgdGhpcyB2ZXJzaW9uIGlzIG1v
cmUKZWZmaWNpZW50LCBidXQgdGhpcyB3YXMgYWRkZWQgaW4gMjAxMSBiZWZvcmUgdGhlIG9wZW5y
aXNjIGdjYyBwb3J0CndhcyBtZXJnZWQgdXBzdHJlYW0uCgpJIGNoZWNrZWQgYSBjb3VwbGUgb2Yg
ZmlsZXMgdG8gc2VlIHdoYXQgdGhlIGFjdHVhbCBkaWZmZXJlbmNlIGlzIHdpdGgKdGhlIG1haW5s
aW5lIGdjYyAoOS40IGFuZCAxMS4xKSwgYW5kIGZvdW5kIHRoYXQgdGhlIGdlbmVyaWMgaGVhZGVy
CnNlZW1zIHRvIHByb2R1Y2UgYmV0dGVyIGNvZGUgbm93LCByZWdhcmRsZXNzIG9mIHRoZSBnY2Mg
dmVyc2lvbi4KClNwZWNpZmljYWxseSwgdGhlIGJlX21lbW1vdmUgbGVhZHMgdG8gYWxsb2NhdGlu
ZyBhIHN0YWNrIHNsb3QgYW5kCmNvcHlpbmcgdGhlIGRhdGEgb25lIGJ5dGUgYXQgYSB0aW1lLCB0
aGVuIHJlYWRpbmcgdGhlIHdob2xlIHdvcmQKZnJvbSB0aGUgc3RhY2s6CgowMDAwMDAwMCA8dGVz
dF9nZXRfdW5hbGlnbmVkX21lbW1vdmU+OgogICAwOgk5YyAyMSBmZiBmNCAJbC5hZGRpIHIxLHIx
LC0xMgogICA0OglkNCAwMSAxMCAwNCAJbC5zdyA0KHIxKSxyMgogICA4Ogk4ZSA2MyAwMCAwMCAJ
bC5sYnogcjE5LDAocjMpCiAgIGM6CTljIDQxIDAwIDBjIAlsLmFkZGkgcjIscjEsMTIKICAxMDoJ
OGUgMjMgMDAgMDEgCWwubGJ6IHIxNywxKHIzKQogIDE0OglkYiBlMiA5ZiBmNCAJbC5zYiAtMTIo
cjIpLHIxOQogIDE4OglkYiBlMiA4ZiBmNSAJbC5zYiAtMTEocjIpLHIxNwogIDFjOgk4ZSA2MyAw
MCAwMiAJbC5sYnogcjE5LDIocjMpCiAgMjA6CThlIDIzIDAwIDAzIAlsLmxieiByMTcsMyhyMykK
ICAyNDoJZDQgMDEgNDggMDggCWwuc3cgOChyMSkscjkKICAyODoJZGIgZTIgOWYgZjYgCWwuc2Ig
LTEwKHIyKSxyMTkKICAyYzoJZGIgZTIgOGYgZjcgCWwuc2IgLTkocjIpLHIxNwogIDMwOgk4NSA2
MiBmZiBmNCAJbC5sd3ogcjExLC0xMihyMikKICAzNDoJODUgMjEgMDAgMDggCWwubHd6IHI5LDgo
cjEpCiAgMzg6CTg0IDQxIDAwIDA0IAlsLmx3eiByMiw0KHIxKQogIDNjOgk0NCAwMCA0OCAwMCAJ
bC5qciByOQogIDQwOgk5YyAyMSAwMCAwYyAJbC5hZGRpIHIxLHIxLDEyCgp3aGlsZSB0aGUgYmVf
c3RydWN0IHZlcnNpb24gcmVhZHMgZWFjaCBieXRlIGludG8gYSByZWdpc3RlcgphbmQgZG9lcyBh
IHNoaWZ0IHRvIHRoZSByaWdodCBwb3NpdGlvbjoKCjAwMDAwMDAwIDx0ZXN0X2dldF91bmFsaWdu
ZWRfc3RydWN0PjoKICAgMDoJOWMgMjEgZmYgZjggCWwuYWRkaSByMSxyMSwtOAogICA0Ogk4ZSA2
MyAwMCAwMCAJbC5sYnogcjE5LDAocjMpCiAgIDg6CWFhIDIwIDAwIDE4IAlsLm9yaSByMTcscjAs
MHgxOAogICBjOgllMiA3MyA4OCAwOCAJbC5zbGwgcjE5LHIxOSxyMTcKICAxMDoJOGQgNjMgMDAg
MDEgCWwubGJ6IHIxMSwxKHIzKQogIDE0OglhYSAyMCAwMCAxMCAJbC5vcmkgcjE3LHIwLDB4MTAK
ICAxODoJZTEgNmIgODggMDggCWwuc2xsIHIxMSxyMTEscjE3CiAgMWM6CWUxIDZiIDk4IDA0IAls
Lm9yIHIxMSxyMTEscjE5CiAgMjA6CThlIDIzIDAwIDAyIAlsLmxieiByMTcsMihyMykKICAyNDoJ
YWEgNjAgMDAgMDggCWwub3JpIHIxOSxyMCwweDgKICAyODoJZTIgMzEgOTggMDggCWwuc2xsIHIx
NyxyMTcscjE5CiAgMmM6CWQ0IDAxIDEwIDAwIAlsLnN3IDAocjEpLHIyCiAgMzA6CWQ0IDAxIDQ4
IDA0IAlsLnN3IDQocjEpLHI5CiAgMzQ6CTljIDQxIDAwIDA4IAlsLmFkZGkgcjIscjEsOAogIDM4
OgllMiAzMSA1OCAwNCAJbC5vciByMTcscjE3LHIxMQogIDNjOgk4ZCA2MyAwMCAwMyAJbC5sYnog
cjExLDMocjMpCiAgNDA6CWUxIDZiIDg4IDA0IAlsLm9yIHIxMSxyMTEscjE3CiAgNDQ6CTg0IDQx
IDAwIDAwIAlsLmx3eiByMiwwKHIxKQogIDQ4Ogk4NSAyMSAwMCAwNCAJbC5sd3ogcjksNChyMSkK
ICA0YzoJNDQgMDAgNDggMDAgCWwuanIgcjkKICA1MDoJOWMgMjEgMDAgMDggCWwuYWRkaSByMSxy
MSw4CgpBY2NvcmRpbmcgdG8gU3RhZmZvcmQgSG9ybmUsIHRoZSBuZXcgdmVyc2lvbiBzaG91bGQg
aW4gZmFjdCBwZXJmb3JtCmJldHRlci4KCkluIHRoZSB0cml2aWFsIGV4YW1wbGUsIHRoZSBzdHJ1
Y3QgdmVyc2lvbiBpcyBhIGZldyBpbnN0cnVjdGlvbnMgbG9uZ2VyLApidXQgYnVpbGRpbmcgYSB3
aG9sZSBrZXJuZWwgc2hvd3MgYW4gb3ZlcmFsbCByZWR1Y3Rpb24gaW4gY29kZSBzaXplLApwcmVz
dW1hYmx5IGJlY2F1c2UgaXQgbm93IGhhcyB0byBtYW5hZ2UgZmV3ZXIgc3RhY2sgc2xvdHM6Cgog
ICB0ZXh0CSAgIGRhdGEJICAgIGJzcwkgICAgZGVjCSAgICBoZXgJZmlsZW5hbWUKNDc5MjAxMAkg
MTgxNDgwCSAgODIzMjQJNTA1NTgxNAkgNGQyNTQ2CXZtbGludXgtdW5hbGlnbmVkLW1lbW1vdmUK
NDc5MDY0MgkgMTgxNDgwCSAgODIzMjQJNTA1NDQ0NgkgNGQxZmVlCXZtbGludXgtdW5hbGlnbmVk
LXN0cnVjdAoKUmVtb3ZlIHRoZSBtZW1tb3ZlIHZlcnNpb24gY29tcGxldGVseSBhbmQgbGV0IG9w
ZW5yaXNjIHVzZSB0aGUgc2FtZQpjb2RlIGFzIGV2ZXJ5b25lIGVsc2UsIGFzIGEgc2ltcGxpZmlj
YXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgpBY2tl
ZC1ieTogU3RhZmZvcmQgSG9ybmUgPHNob3JuZUBnbWFpbC5jb20+Ci0tLQogYXJjaC9vcGVucmlz
Yy9pbmNsdWRlL2FzbS91bmFsaWduZWQuaCB8IDQ3IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQogaW5jbHVkZS9saW51eC91bmFsaWduZWQvYmVfbWVtbW92ZS5oICB8IDM3IC0tLS0tLS0tLS0t
LS0tLS0tLS0tLQogaW5jbHVkZS9saW51eC91bmFsaWduZWQvbGVfbWVtbW92ZS5oICB8IDM3IC0t
LS0tLS0tLS0tLS0tLS0tLS0tLQogaW5jbHVkZS9saW51eC91bmFsaWduZWQvbWVtbW92ZS5oICAg
ICB8IDQ2IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiA0IGZpbGVzIGNoYW5nZWQsIDE2NyBk
ZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBhcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNt
L3VuYWxpZ25lZC5oCiBkZWxldGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC91bmFsaWduZWQv
YmVfbWVtbW92ZS5oCiBkZWxldGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC91bmFsaWduZWQv
bGVfbWVtbW92ZS5oCiBkZWxldGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC91bmFsaWduZWQv
bWVtbW92ZS5oCgpkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS91bmFsaWdu
ZWQuaCBiL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vdW5hbGlnbmVkLmgKZGVsZXRlZCBmaWxl
IG1vZGUgMTAwNjQ0CmluZGV4IDE0MzUzZjIxMDFmMi4uMDAwMDAwMDAwMDAwCi0tLSBhL2FyY2gv
b3BlbnJpc2MvaW5jbHVkZS9hc20vdW5hbGlnbmVkLmgKKysrIC9kZXYvbnVsbApAQCAtMSw0NyAr
MCwwIEBACi0vKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlciAqLwot
LyoKLSAqIE9wZW5SSVNDIExpbnV4Ci0gKgotICogTGludXggYXJjaGl0ZWN0dXJhbCBwb3J0IGJv
cnJvd2luZyBsaWJlcmFsbHkgZnJvbSBzaW1pbGFyIHdvcmtzIG9mCi0gKiBvdGhlcnMuICBBbGwg
b3JpZ2luYWwgY29weXJpZ2h0cyBhcHBseSBhcyBwZXIgdGhlIG9yaWdpbmFsIHNvdXJjZQotICog
ZGVjbGFyYXRpb24uCi0gKgotICogT3BlblJJU0MgaW1wbGVtZW50YXRpb246Ci0gKiBDb3B5cmln
aHQgKEMpIDIwMDMgTWF0amF6IEJyZXNrdmFyIDxwaG9lbml4QGJzZW1pLmNvbT4KLSAqIENvcHly
aWdodCAoQykgMjAxMC0yMDExIEpvbmFzIEJvbm4gPGpvbmFzQHNvdXRocG9sZS5zZT4KLSAqIGV0
IGFsLgotICovCi0KLSNpZm5kZWYgX19BU01fT1BFTlJJU0NfVU5BTElHTkVEX0gKLSNkZWZpbmUg
X19BU01fT1BFTlJJU0NfVU5BTElHTkVEX0gKLQotLyoKLSAqIFRoaXMgaXMgY29waWVkIGZyb20g
dGhlIGdlbmVyaWMgaW1wbGVtZW50YXRpb24gYW5kIHRoZSBDLXN0cnVjdAotICogdmFyaWFudCBy
ZXBsYWNlZCB3aXRoIHRoZSBtZW1tb3ZlIHZhcmlhbnQuICBUaGUgR0NDIGNvbXBpbGVyCi0gKiBm
b3IgdGhlIE9SMzIgYXJjaCBvcHRpbWl6ZXMgdG9vIGFnZ3Jlc3NpdmVseSBmb3IgdGhlIEMtc3Ry
dWN0Ci0gKiB2YXJpYW50IHRvIHdvcmssIHNvIHVzZSB0aGUgbWVtbW92ZSB2YXJpYW50IGluc3Rl
YWQuCi0gKgotICogSXQgbWF5IGJlIHdvcnRoIGNvbnNpZGVyaW5nIGltcGxlbWVudGluZyB0aGUg
dW5hbGlnbmVkIGFjY2VzcwotICogZXhjZXB0aW9uIGhhbmRsZXIgYW5kIGFsbG93aW5nIHVuYWxp
Z25lZCBhY2Nlc3NlcyAoYWNjZXNzX29rLmgpLi4uCi0gKiBub3Qgc3VyZSBpZiBpdCB3b3VsZCBi
ZSBtdWNoIG9mIGEgcGVyZm9ybWFuY2Ugd2luIHdpdGhvdXQgZnVydGhlcgotICogaW52ZXN0aWdh
dGlvbi4KLSAqLwotI2luY2x1ZGUgPGFzbS9ieXRlb3JkZXIuaD4KLQotI2lmIGRlZmluZWQoX19M
SVRUTEVfRU5ESUFOKQotIyBpbmNsdWRlIDxsaW51eC91bmFsaWduZWQvbGVfbWVtbW92ZS5oPgot
IyBpbmNsdWRlIDxsaW51eC91bmFsaWduZWQvYmVfYnl0ZXNoaWZ0Lmg+Ci0jIGluY2x1ZGUgPGxp
bnV4L3VuYWxpZ25lZC9nZW5lcmljLmg+Ci0jIGRlZmluZSBnZXRfdW5hbGlnbmVkCV9fZ2V0X3Vu
YWxpZ25lZF9sZQotIyBkZWZpbmUgcHV0X3VuYWxpZ25lZAlfX3B1dF91bmFsaWduZWRfbGUKLSNl
bGlmIGRlZmluZWQoX19CSUdfRU5ESUFOKQotIyBpbmNsdWRlIDxsaW51eC91bmFsaWduZWQvYmVf
bWVtbW92ZS5oPgotIyBpbmNsdWRlIDxsaW51eC91bmFsaWduZWQvbGVfYnl0ZXNoaWZ0Lmg+Ci0j
IGluY2x1ZGUgPGxpbnV4L3VuYWxpZ25lZC9nZW5lcmljLmg+Ci0jIGRlZmluZSBnZXRfdW5hbGln
bmVkCV9fZ2V0X3VuYWxpZ25lZF9iZQotIyBkZWZpbmUgcHV0X3VuYWxpZ25lZAlfX3B1dF91bmFs
aWduZWRfYmUKLSNlbHNlCi0jIGVycm9yIG5lZWQgdG8gZGVmaW5lIGVuZGlhbmVzcwotI2VuZGlm
Ci0KLSNlbmRpZiAvKiBfX0FTTV9PUEVOUklTQ19VTkFMSUdORURfSCAqLwpkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9saW51eC91bmFsaWduZWQvYmVfbWVtbW92ZS5oIGIvaW5jbHVkZS9saW51eC91bmFs
aWduZWQvYmVfbWVtbW92ZS5oCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA3MTY0MjE0
YTRiYTEuLjAwMDAwMDAwMDAwMAotLS0gYS9pbmNsdWRlL2xpbnV4L3VuYWxpZ25lZC9iZV9tZW1t
b3ZlLmgKKysrIC9kZXYvbnVsbApAQCAtMSwzNyArMCwwIEBACi0vKiBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogR1BMLTIuMCAqLwotI2lmbmRlZiBfTElOVVhfVU5BTElHTkVEX0JFX01FTU1PVkVf
SAotI2RlZmluZSBfTElOVVhfVU5BTElHTkVEX0JFX01FTU1PVkVfSAotCi0jaW5jbHVkZSA8bGlu
dXgvdW5hbGlnbmVkL21lbW1vdmUuaD4KLQotc3RhdGljIGlubGluZSB1MTYgZ2V0X3VuYWxpZ25l
ZF9iZTE2KGNvbnN0IHZvaWQgKnApCi17Ci0JcmV0dXJuIF9fZ2V0X3VuYWxpZ25lZF9tZW1tb3Zl
MTYoKGNvbnN0IHU4ICopcCk7Ci19Ci0KLXN0YXRpYyBpbmxpbmUgdTMyIGdldF91bmFsaWduZWRf
YmUzMihjb25zdCB2b2lkICpwKQotewotCXJldHVybiBfX2dldF91bmFsaWduZWRfbWVtbW92ZTMy
KChjb25zdCB1OCAqKXApOwotfQotCi1zdGF0aWMgaW5saW5lIHU2NCBnZXRfdW5hbGlnbmVkX2Jl
NjQoY29uc3Qgdm9pZCAqcCkKLXsKLQlyZXR1cm4gX19nZXRfdW5hbGlnbmVkX21lbW1vdmU2NCgo
Y29uc3QgdTggKilwKTsKLX0KLQotc3RhdGljIGlubGluZSB2b2lkIHB1dF91bmFsaWduZWRfYmUx
Nih1MTYgdmFsLCB2b2lkICpwKQotewotCV9fcHV0X3VuYWxpZ25lZF9tZW1tb3ZlMTYodmFsLCBw
KTsKLX0KLQotc3RhdGljIGlubGluZSB2b2lkIHB1dF91bmFsaWduZWRfYmUzMih1MzIgdmFsLCB2
b2lkICpwKQotewotCV9fcHV0X3VuYWxpZ25lZF9tZW1tb3ZlMzIodmFsLCBwKTsKLX0KLQotc3Rh
dGljIGlubGluZSB2b2lkIHB1dF91bmFsaWduZWRfYmU2NCh1NjQgdmFsLCB2b2lkICpwKQotewot
CV9fcHV0X3VuYWxpZ25lZF9tZW1tb3ZlNjQodmFsLCBwKTsKLX0KLQotI2VuZGlmIC8qIF9MSU5V
WF9VTkFMSUdORURfTEVfTUVNTU9WRV9IICovCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3Vu
YWxpZ25lZC9sZV9tZW1tb3ZlLmggYi9pbmNsdWRlL2xpbnV4L3VuYWxpZ25lZC9sZV9tZW1tb3Zl
LmgKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDkyMDJlODY0ZDAyNi4uMDAwMDAwMDAw
MDAwCi0tLSBhL2luY2x1ZGUvbGludXgvdW5hbGlnbmVkL2xlX21lbW1vdmUuaAorKysgL2Rldi9u
dWxsCkBAIC0xLDM3ICswLDAgQEAKLS8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
ICovCi0jaWZuZGVmIF9MSU5VWF9VTkFMSUdORURfTEVfTUVNTU9WRV9ICi0jZGVmaW5lIF9MSU5V
WF9VTkFMSUdORURfTEVfTUVNTU9WRV9ICi0KLSNpbmNsdWRlIDxsaW51eC91bmFsaWduZWQvbWVt
bW92ZS5oPgotCi1zdGF0aWMgaW5saW5lIHUxNiBnZXRfdW5hbGlnbmVkX2xlMTYoY29uc3Qgdm9p
ZCAqcCkKLXsKLQlyZXR1cm4gX19nZXRfdW5hbGlnbmVkX21lbW1vdmUxNigoY29uc3QgdTggKilw
KTsKLX0KLQotc3RhdGljIGlubGluZSB1MzIgZ2V0X3VuYWxpZ25lZF9sZTMyKGNvbnN0IHZvaWQg
KnApCi17Ci0JcmV0dXJuIF9fZ2V0X3VuYWxpZ25lZF9tZW1tb3ZlMzIoKGNvbnN0IHU4ICopcCk7
Ci19Ci0KLXN0YXRpYyBpbmxpbmUgdTY0IGdldF91bmFsaWduZWRfbGU2NChjb25zdCB2b2lkICpw
KQotewotCXJldHVybiBfX2dldF91bmFsaWduZWRfbWVtbW92ZTY0KChjb25zdCB1OCAqKXApOwot
fQotCi1zdGF0aWMgaW5saW5lIHZvaWQgcHV0X3VuYWxpZ25lZF9sZTE2KHUxNiB2YWwsIHZvaWQg
KnApCi17Ci0JX19wdXRfdW5hbGlnbmVkX21lbW1vdmUxNih2YWwsIHApOwotfQotCi1zdGF0aWMg
aW5saW5lIHZvaWQgcHV0X3VuYWxpZ25lZF9sZTMyKHUzMiB2YWwsIHZvaWQgKnApCi17Ci0JX19w
dXRfdW5hbGlnbmVkX21lbW1vdmUzMih2YWwsIHApOwotfQotCi1zdGF0aWMgaW5saW5lIHZvaWQg
cHV0X3VuYWxpZ25lZF9sZTY0KHU2NCB2YWwsIHZvaWQgKnApCi17Ci0JX19wdXRfdW5hbGlnbmVk
X21lbW1vdmU2NCh2YWwsIHApOwotfQotCi0jZW5kaWYgLyogX0xJTlVYX1VOQUxJR05FRF9MRV9N
RU1NT1ZFX0ggKi8KZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvdW5hbGlnbmVkL21lbW1vdmUu
aCBiL2luY2x1ZGUvbGludXgvdW5hbGlnbmVkL21lbW1vdmUuaApkZWxldGVkIGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggYWM3MWI1M2JjNmRjLi4wMDAwMDAwMDAwMDAKLS0tIGEvaW5jbHVkZS9saW51
eC91bmFsaWduZWQvbWVtbW92ZS5oCisrKyAvZGV2L251bGwKQEAgLTEsNDYgKzAsMCBAQAotLyog
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KLSNpZm5kZWYgX0xJTlVYX1VOQUxJ
R05FRF9NRU1NT1ZFX0gKLSNkZWZpbmUgX0xJTlVYX1VOQUxJR05FRF9NRU1NT1ZFX0gKLQotI2lu
Y2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgotI2luY2x1ZGUgPGxpbnV4L3N0cmluZy5oPgotCi0vKiBV
c2UgbWVtbW92ZSBoZXJlLCBzbyBnY2MgZG9lcyBub3QgaW5zZXJ0IGEgX19idWlsdGluX21lbWNw
eS4gKi8KLQotc3RhdGljIGlubGluZSB1MTYgX19nZXRfdW5hbGlnbmVkX21lbW1vdmUxNihjb25z
dCB2b2lkICpwKQotewotCXUxNiB0bXA7Ci0JbWVtbW92ZSgmdG1wLCBwLCAyKTsKLQlyZXR1cm4g
dG1wOwotfQotCi1zdGF0aWMgaW5saW5lIHUzMiBfX2dldF91bmFsaWduZWRfbWVtbW92ZTMyKGNv
bnN0IHZvaWQgKnApCi17Ci0JdTMyIHRtcDsKLQltZW1tb3ZlKCZ0bXAsIHAsIDQpOwotCXJldHVy
biB0bXA7Ci19Ci0KLXN0YXRpYyBpbmxpbmUgdTY0IF9fZ2V0X3VuYWxpZ25lZF9tZW1tb3ZlNjQo
Y29uc3Qgdm9pZCAqcCkKLXsKLQl1NjQgdG1wOwotCW1lbW1vdmUoJnRtcCwgcCwgOCk7Ci0JcmV0
dXJuIHRtcDsKLX0KLQotc3RhdGljIGlubGluZSB2b2lkIF9fcHV0X3VuYWxpZ25lZF9tZW1tb3Zl
MTYodTE2IHZhbCwgdm9pZCAqcCkKLXsKLQltZW1tb3ZlKHAsICZ2YWwsIDIpOwotfQotCi1zdGF0
aWMgaW5saW5lIHZvaWQgX19wdXRfdW5hbGlnbmVkX21lbW1vdmUzMih1MzIgdmFsLCB2b2lkICpw
KQotewotCW1lbW1vdmUocCwgJnZhbCwgNCk7Ci19Ci0KLXN0YXRpYyBpbmxpbmUgdm9pZCBfX3B1
dF91bmFsaWduZWRfbWVtbW92ZTY0KHU2NCB2YWwsIHZvaWQgKnApCi17Ci0JbWVtbW92ZShwLCAm
dmFsLCA4KTsKLX0KLQotI2VuZGlmIC8qIF9MSU5VWF9VTkFMSUdORURfTUVNTU9WRV9IICovCi0t
IAoyLjI5LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Ck9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRw
czovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
