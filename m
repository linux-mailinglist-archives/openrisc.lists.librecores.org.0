Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B574232DB8A
	for <lists+openrisc@lfdr.de>; Thu,  4 Mar 2021 22:07:58 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 112F720F1B;
	Thu,  4 Mar 2021 22:07:58 +0100 (CET)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mail.librecores.org (Postfix) with ESMTPS id 9EAF1202A8
 for <openrisc@lists.librecores.org>; Thu,  4 Mar 2021 22:07:55 +0100 (CET)
Received: by mail-pf1-f169.google.com with SMTP id r5so19840764pfh.13
 for <openrisc@lists.librecores.org>; Thu, 04 Mar 2021 13:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uWpwsFeTZlyH65avZ7SZctfAq5Qo7PlY77pEY+JXJ0M=;
 b=QL6oBIAiE93CPhZrSRNhRrggev393e4/JxrZETyARV2U5acynFnngoBlB4pbzul9fD
 H2FExHVoO4vT7ouo0+Vf+U9d21PJdLI4vWCuilBPnw/8RMKbF0zwx8EXEU4Mxs5VBNq1
 JCPBkBNTsghybQpkUo4lS0nWHJUmCIxuCTbe0WlWwZ5+LJsH6AM4zF62qTetiEkT1kRD
 XRLRpZ6je85rxIpI2oRzBhKwv5f1go+NOVNS9+dbOnicxxu+Fo5BQtsAUTnx5S4c3Ehe
 63efl+XuaqGuwLxxxhJ/VNtXB/xAG7DKmzNpf0b+6w/Z69Cfx4Ln1bi16xF6+w41g61b
 myDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uWpwsFeTZlyH65avZ7SZctfAq5Qo7PlY77pEY+JXJ0M=;
 b=N5Z7/SbA/60/+IkKnpo3XoDRxsuenJ8TjDGSyFLiklOYKdaCM1UMk6E6Qlyz6VD5i6
 Wt5HeBypn669j0ntd8NpD6HApJcQVkLNqH1M0BTl6hKNp0pXTb08bUnvCf8XkkuJ7N44
 O/w1pdfngHC2lOk8evqN0Tsa0U9cuQmzVir2nFjChbV9d50VAp2GKbWCrEfLero7kxTq
 KrY6FgmBW+x7BWkx2WStHyPzYccfzRxQ0zJ7CA7SdESUGymRVT1n76edtsqPnmW157k/
 IoxBPWRAK1fEjhV4H1rIyv7ptVokTYADkHApcoCmNg70pg0AxkEK8wGVPypsKcHr2pth
 ICoQ==
X-Gm-Message-State: AOAM532H/YbRlVqVcBxeTSSwJAE1WRx2vJiGzDkV3VTWgUkH4IPZ9naX
 K77q9IAOVL1eH2RG5RD39N4=
X-Google-Smtp-Source: ABdhPJyXvOiayNu1ZYOuxub1XoPuXSpylghLzvY7PF3iGnaGJfLSqilojq/e/q19nad9FDYSw3B2Fg==
X-Received: by 2002:a62:3181:0:b029:1df:4f2:16b3 with SMTP id
 x123-20020a6231810000b02901df04f216b3mr5623699pfx.24.1614892074002; 
 Thu, 04 Mar 2021 13:07:54 -0800 (PST)
Received: from localhost (g98.115-65-200.ppp.wakwak.ne.jp. [115.65.200.98])
 by smtp.gmail.com with ESMTPSA id y9sm297453pgc.9.2021.03.04.13.07.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 13:07:53 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: Barebox <barebox@lists.infradead.org>
Date: Fri,  5 Mar 2021 06:07:47 +0900
Message-Id: <20210304210747.3679483-1-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH] Documentation: Add qemu instructions for OpenRISC
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
Cc: s.hauer@pengutronix.de, Openrisc <openrisc@lists.librecores.org>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

TW9zdCBkZXZlbG9wZXJzIGhhdmUgcWVtdSBhbmQgcmF0aGVyIG5vdCBkb3dubG9hZCBhbmQgaW5z
dGFsbCB0aGUKb3Ixa3NpbS4gIEFsc28sIHRoaXMgYWRkcyBkZXRhaWxzIG9uIGhvdyB0byBnZXQg
YSBvcGVucmlzYyB0b29sY2hhaW4uCgpTaWduZWQtb2ZmLWJ5OiBTdGFmZm9yZCBIb3JuZSA8c2hv
cm5lQGdtYWlsLmNvbT4KLS0tCiBEb2N1bWVudGF0aW9uL2JvYXJkcy9vcGVucmlzYy5yc3QgfCA2
OCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNjggaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vYm9hcmRzL29wZW5yaXNjLnJz
dCBiL0RvY3VtZW50YXRpb24vYm9hcmRzL29wZW5yaXNjLnJzdAppbmRleCBmOWQ2N2Y5NjUuLjM0
NTg2YjRhNyAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9ib2FyZHMvb3BlbnJpc2MucnN0Cisr
KyBiL0RvY3VtZW50YXRpb24vYm9hcmRzL29wZW5yaXNjLnJzdApAQCAtMSw2ICsxLDc0IEBACiBP
cGVuUklTQwogPT09PT09PT0KIAorT3B0YWluaW5nIGFuIE9wZW5SSVNDIHRvb2xjaGFpbgorLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorCitUb29sY2hhaW4gYmluYXJpZXMgY2FuIGJl
IG9idGFpbmVkIGZyb20gb3BlbnJpc2MuaW8gb3Igb3VyIGdpdGh1YiByZWxlYXNlcyBwYWdlLgor
SW5zdHJ1Y3Rpb25zIGZvciBidWlsZGluZyB0aGUgZGlmZmVyZW50IHRvb2xjaGFpbnMgY2FuIGJl
IGZvdW5kIG9uIG9wZW5yaXNjLmlvCitvciBTdGFmZm9yZCdzIHRvb2xjaGFpbiBidWlsZCBhbmQg
cmVsZWFzZSBzY3JpcHRzLgorCitTZWU6CisKKyAgKiBodHRwczovL2dpdGh1Yi5jb20vc3RmZnJk
aHJuL2djYy9yZWxlYXNlcworICAqIGh0dHBzOi8vZ2l0aHViLmNvbS9zdGZmcmRocm4vb3Ixay10
b29sY2hhaW4tYnVpbGQKKyAgKiBodHRwczovL29wZW5yaXNjLmlvL3NvZnR3YXJlCisKK0V4YW1w
bGUgb2YgZG93bmxvYWRpbmcgYW5kIGluc3RhbGxpbmcgYSB0b29sY2hhaW46OgorCisgICQgY3Vy
bCAtLXJlbW90ZS1uYW1lIC0tbG9jYXRpb24gXAorICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9zdGZm
cmRocm4vZ2NjL3JlbGVhc2VzL2Rvd25sb2FkL29yMWstMTAuMC4wLTIwMTkwNzIzL29yMWstZWxm
LTEwLjAuMC0yMDE5MDcyMy50YXIueHoKKyAgJCB0YXIgLXhmIG9yMWstZWxmLTEwLjAuMC0yMDE5
MDcyMy50YXIueHoKKyAgJCBleHBvcnQgUEFUSD0kUEFUSDokUFdEL29yMWstZWxmL2JpbgorCitS
dW5uaW5nIE9wZW5SSVNDIGJhcmVib3ggb24gcWVtdQorLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCisKK1J1bm5pbmcgYmFyZWJveCBvbiBxZW11IGlzIHNpbWlsYXIgdG8gcnVubmluZyBs
aW51eCBvbiBxZW11IHNlZSBtb3JlIGRldGFpbHMgb24KK3RoZSBxZW11IHdpa2kgc2l0ZSBhdCBo
dHRwczovL3dpa2kucWVtdS5vcmcvRG9jdW1lbnRhdGlvbi9QbGF0Zm9ybXMvT3BlblJJU0MKKwor
Q29tcGlsZSB0aGUgcWVtdSBlbXVsYXRvcjo6CisKKyAgJCBnaXQgY2xvbmUgaHR0cHM6Ly9naXRs
YWIuY29tL3FlbXUtcHJvamVjdC9xZW11LmdpdAorICAkIGNkIHFlbXUKKyAgJCBta2RpciBidWls
ZCA7IGNkIGJ1aWxkCisgICQgLi4vY29uZmlndXJlIFwKKyAgICAtLXRhcmdldC1saXN0PSJvcjFr
LXNvZnRtbXUiIFwKKyAgICAtLWVuYWJsZS1mZHQgXAorICAgIC0tZGlzYWJsZS1rdm0gXAorICAg
IC0tZGlzYWJsZS14ZW4gXAorICAgIC0tZGlzYWJsZS14a2Jjb21tb24gXAorICAgIC0tZW5hYmxl
LWRlYnVnIFwKKyAgICAtLWVuYWJsZS1kZWJ1Zy1pbmZvCisgICQgbWFrZQorCitOZXh0IGNvbXBp
bGUgYmFyZWJveDo6CisKKyAgJCBtYWtlIEFSQ0g9b3BlbnJpc2MgZGVmY29uZmlnCisgIC4uLgor
ICAkIG1ha2UgQVJDSD1vcGVucmlzYyBDUk9TU19DT01QSUxFPW9yMWstZWxmLQorCitSdW4gYmFy
ZWJveDo6CisKKyAgJCA8cGF0aCB0byBxZW11IHNvdXJjZT4vYnVpbGQvb3Ixay1zb2Z0bW11L3Fl
bXUtc3lzdGVtLW9yMWsgXAorICAgIC1jcHUgb3IxMjAwIFwKKyAgICAtTSBvcjFrLXNpbSBcCisg
ICAgLWtlcm5lbCAvaG9tZS9zaG9ybmUvd29yay9vcGVucmlzYy9iYXJlYm94L2JhcmVib3ggXAor
ICAgIC1uZXQgbmljIC1uZXQgdGFwLGlmbmFtZT10YXAwLHNjcmlwdD1ubyxkb3duc2NyaXB0PW5v
IFwKKyAgICAtc2VyaWFsIG1vbjpzdGRpbyAtbm9ncmFwaGljIC1nZGIgdGNwOjoxMDAwMSBcCisg
ICAgLW0gMzIKKworCisgIGJhcmVib3ggMjAyMS4wMi4wLTAwMTIwLWc3NjNjNmZlZTctZGlydHkg
IzE0IFRodSBNYXIgNCAwNToxMzo1MSBKU1QgMjAyMQorCisKKyAgQm9hcmQ6IG9yMWtzaW0KKyAg
bWRpb19idXM6IG1paWJ1czA6IHByb2JlZAorICBtYWxsb2Mgc3BhY2U6IDB4MDFiODAwMDAgLT4g
MHgwMWY3ZmZmZiAoc2l6ZSA0IE1pQikKKworICBIaXQgYW55IHRvIHN0b3AgYXV0b2Jvb3Q6ICAg
IDMKKyAgYmFyZWJveEBvcjFrc2ltOi8KKwogb3Ixa3NpbQogLS0tLS0tLQogCi0tIAoyLjI2LjIK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVND
IG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3Rz
LmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
