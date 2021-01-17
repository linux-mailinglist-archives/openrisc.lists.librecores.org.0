Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B55472F914C
	for <lists+openrisc@lfdr.de>; Sun, 17 Jan 2021 09:04:27 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3330A20ABE;
	Sun, 17 Jan 2021 09:04:27 +0100 (CET)
Received: from conuserg-11.nifty.com (conuserg-11.nifty.com [210.131.2.78])
 by mail.librecores.org (Postfix) with ESMTPS id 9E0C920E94
 for <openrisc@lists.librecores.org>; Sun, 17 Jan 2021 09:04:24 +0100 (CET)
Received: from oscar.flets-west.jp (softbank126026094251.bbtec.net
 [126.26.94.251]) (authenticated)
 by conuserg-11.nifty.com with ESMTP id 10H83ZJT006716;
 Sun, 17 Jan 2021 17:03:36 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 10H83ZJT006716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1610870616;
 bh=KxxLfsj//Y08AAlVQEh12t7SON+ohmx3H8rw17177Yk=;
 h=From:To:Cc:Subject:Date:From;
 b=iLRoaChdyO3pV3Rz7HT7gR0qLZga5XhwwO8VgHC4O2dx7x+3OEcUmCcFI1y1DVYIF
 HCe9vRsx9ZwVZtUSiQAlxKJhgdlwh+MmJNd5VOVfSkk8xHiJY1C1yBNgc08D68b20+
 eRN46c2Qfq3wwitlfTiDVuXSJCZSqw39sM5batPLCrKEmuvITQR/r4TppiGIkhX3FJ
 OBynvbbw14kb/K5LFhdPLc8ReNVkuxLa2vxn7kAwTDBa1QfAj4UHAz/SFLTq9XOXdr
 cWB3PXjdVUSWnyC12pdUqGWQUrz48DQ2rXaZ0ZeADa9VAzTZnKNaeJZtuKr3pfgGAK
 Zp56ON7DcfHgw==
X-Nifty-SrcIP: [126.26.94.251]
From: Masahiro Yamada <masahiroy@kernel.org>
To: Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, openrisc@lists.librecores.org
Date: Sun, 17 Jan 2021 17:03:32 +0900
Message-Id: <20210117080332.2289077-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH] openrisc: add arch/openrisc/Kbuild
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
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RGVzY3JpYmUgdGhlIHN1YmRpcmVjdG9yaWVzIHVuZGVyIGFyY2gvb3BlbnJpc2MvIGluIGFyY2gv
b3BlbnJpc2MvS2J1aWxkCnNvIHlvdSBjYW4gdXNlIHRoZSBzdGFuZGFyZCBvYmoteSBzeW50YXgu
CgpJIHJlbW92ZWQgdGhlIENPTkZJR19PUEVOUklTQ19CVUlMVElOX0RUQiBjb25kaXRpb25hbCBi
ZWNhdXNlIGl0IGlzCmFscmVhZHkgY29udHJvbGxlZCBieSBhcmNoL29wZW5yaXNjL2Jvb3QvZHRz
L01ha2VmaWxlLgoKU2lnbmVkLW9mZi1ieTogTWFzYWhpcm8gWWFtYWRhIDxtYXNhaGlyb3lAa2Vy
bmVsLm9yZz4KLS0tCgogYXJjaC9vcGVucmlzYy9LYnVpbGQgICB8ICAzICsrKwogYXJjaC9vcGVu
cmlzYy9NYWtlZmlsZSB8IDExICstLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9vcGVucmlz
Yy9LYnVpbGQKCmRpZmYgLS1naXQgYS9hcmNoL29wZW5yaXNjL0tidWlsZCBiL2FyY2gvb3BlbnJp
c2MvS2J1aWxkCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uNDIzNGI0
YzAzZTcyCi0tLSAvZGV2L251bGwKKysrIGIvYXJjaC9vcGVucmlzYy9LYnVpbGQKQEAgLTAsMCAr
MSwzIEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCitvYmoteSArPSBsaWIv
IGtlcm5lbC8gbW0vCitvYmoteSArPSBib290L2R0cy8KZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJp
c2MvTWFrZWZpbGUgYi9hcmNoL29wZW5yaXNjL01ha2VmaWxlCmluZGV4IGJmMTAxNDFjNzQyNi4u
NDRlNjNmYTM1ZTA0IDEwMDY0NAotLS0gYS9hcmNoL29wZW5yaXNjL01ha2VmaWxlCisrKyBiL2Fy
Y2gvb3BlbnJpc2MvTWFrZWZpbGUKQEAgLTM4LDE0ICszOCw1IEBAIGVuZGlmCiAKIGhlYWQteSAJ
CTo9IGFyY2gvb3BlbnJpc2Mva2VybmVsL2hlYWQubwogCi1jb3JlLXkJCSs9IGFyY2gvb3BlbnJp
c2MvbGliLyBcCi0JCSAgIGFyY2gvb3BlbnJpc2Mva2VybmVsLyBcCi0JCSAgIGFyY2gvb3BlbnJp
c2MvbW0vCitjb3JlLXkJCSs9IGFyY2gvb3BlbnJpc2MvCiBsaWJzLXkJCSs9ICQoTElCR0NDKQot
Ci1pZm5lcSAnJChDT05GSUdfT1BFTlJJU0NfQlVJTFRJTl9EVEIpJyAnIiInCi1CVUlMVElOX0RU
QiA6PSB5Ci1lbHNlCi1CVUlMVElOX0RUQiA6PSBuCi1lbmRpZgotY29yZS0kKEJVSUxUSU5fRFRC
KSArPSBhcmNoL29wZW5yaXNjL2Jvb3QvZHRzLwotLSAKMi4yNy4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3Bl
blJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9s
aXN0aW5mby9vcGVucmlzYwo=
