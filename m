Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 508423708FB
	for <lists+openrisc@lfdr.de>; Sat,  1 May 2021 23:02:43 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 17B2C2137C;
	Sat,  1 May 2021 23:02:43 +0200 (CEST)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mail.librecores.org (Postfix) with ESMTPS id 9648921378
 for <openrisc@lists.librecores.org>; Sat,  1 May 2021 23:02:40 +0200 (CEST)
Received: by mail-pl1-f173.google.com with SMTP id s15so769261plg.6
 for <openrisc@lists.librecores.org>; Sat, 01 May 2021 14:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dTl45Q9ZUMZUfqf5KppW4E3cmmrO7QdhhRHyx/TqEC0=;
 b=G68+bXx/uDptu/GV5W3z1azpPVsmMT90MIC5Y4bGX1RiceBv4LYEOX/FMc8AoRBfuJ
 fG5dCtDmyv6k2gDqy1dXp8TDkmhlxgFwHfL9U2d7JbkSUZ21a2xm4ANWzk2e0Jp6b9pv
 2CmeufCoMLlSJZibisvBu4vi3scg/qyDRSPhew/ZP2nTXalw8guxHmoXESSWHHuISyf8
 VzIFXGJNFQlEvIAd3UEpy3Eaz7SI2BQWyaNjFuVbqbW0KAlNGgENZ0VGN4A5+HITJ98f
 bXygDGTDxEp88HTtKBEEb1Kp9AsA5jAcgvUre8yr1HDqee2WgtW3PHQhq/fZ/c5We1Md
 cAew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dTl45Q9ZUMZUfqf5KppW4E3cmmrO7QdhhRHyx/TqEC0=;
 b=prAS+ua+HQj98RWPbWWwZ9khpBdBfF/pr61Kd9lza8E/Z1FG27YjMB61IFklCH3HOh
 nkcnDfnNpVvN42rL3AovbvvAPoHa4dgQtiwssDMTfUOk0yZB9vjLsgFYOf83rDD5osyW
 8nX/wm4dcFcDS7cre+yNFJPfHd+Z5zV92+vhDdESMFPe0QWH1m+v2e3dZiEpACWA1CWp
 jheQyOLR7zWY55SFsQAnRktcYHcOFs9/fcBHVFv4rpxwA+nVIBnC7w2gZ1lDKMbyOwd4
 J+w33mH0xhMnV+2CukMKLXNsGYFaMh65+BW8GkO58stfWx7lo965rhMf5hdUunyIldSm
 s1Lw==
X-Gm-Message-State: AOAM531taXYl3wEYwYvIIHxI9PLl37N1ljgvixjqICx4Tg80z/J9mTUb
 qCYlBh7L+iNQvICY19OhmpA=
X-Google-Smtp-Source: ABdhPJyzorgiBb8EW/WobxwvoFjdZOp92BnMWo4aoxxbOqIttbGvxwuC3p4a2pR70daCEKC69omstg==
X-Received: by 2002:a17:902:e5c5:b029:ed:23f3:2b10 with SMTP id
 u5-20020a170902e5c5b02900ed23f32b10mr12562113plf.50.1619902959272; 
 Sat, 01 May 2021 14:02:39 -0700 (PDT)
Received: from localhost (g17.222-224-135.ppp.wakwak.ne.jp. [222.224.135.17])
 by smtp.gmail.com with ESMTPSA id
 nh10sm5131694pjb.49.2021.05.01.14.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 14:02:38 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: GNU Binutils <binutils@sourceware.org>
Date: Sun,  2 May 2021 06:02:16 +0900
Message-Id: <20210501210217.2975268-4-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210501210217.2975268-1-shorne@gmail.com>
References: <20210501210217.2975268-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v2 3/4] or1k: Avoid R_OR1K_GOT16 overflow
 failures in presence of R_OR1K_GOT_AHI16
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
Cc: giulio.benetti@benettiengineering.com,
 Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Tm93IHRoYXQgd2Ugc3VwcG9ydCBSX09SMUtfR09UX0FISTE2IHdlIGNhbiByZWxheCB0aGUgUl9P
UjFLX0dPVDE2Cm92ZXJmbG93IHZhbGlkYXRpb24gY2hlY2sgaWYgdGhlIHNlY3Rpb24gaGFzIFJf
T1IxS19HT1RfQUhJMTYuCgpXZSBjYW5ub3Qgc2ltcGxlIGRpc2FibGUgUl9PUjFLX0dPVDE2IG92
ZXJmbG93IHZhbGlkYXRpb24gYXMgdGhlcmUgd2lsbApzdGlsbCBiZSBiaW5hcmllcyB0aGF0IHdp
bGwgaGF2ZSBvbmx5IFJfT1IxS19HT1QxNi4gIFRoZQpSX09SMUtfR09UX0FISTE2IHJlbG9jYXRp
b24gd2lsbCBvbmx5IGJlIGFkZGVkIGJ5IEdDQyB3aGVuIGJ1aWxkaW5nIHdpdGgKdGhlIG9wdGlv
biAtbWNtb2RlbD1sYXJnZS4KClRoaXMgYXNzdW1lcyB0aGF0IFJfT1IxS19HT1RfQUhJMTYgd2ls
bCBjb21lIGJlZm9yZSBSX09SMUtfR09UMTYsIHdoaWNoCmlzIHRoZSBjb2RlIHBhdHRlcm4gdGhh
dCB3aWxsIGJlIGVtaXR0ZWQgYnkgR0NDLgoKYmZkL0NoYW5nZUxvZzoKCglQUiAyMTQ2NAoJKiBl
bGYzMi1vcjFrLmMgKG9yMWtfZWxmX3JlbG9jYXRlX3NlY3Rpb24pOiBSZWxheCBSX09SMUtfR09U
MTYKCW92ZXJmbG93IGNoZWNrIGlmIHdlIGhhdmUgUl9PUjFLX0dPVF9BSEkxNiBmb2xsb3dlZCBi
eQoJUl9PUjFLX0dPVDE2LgotLS0KIGJmZC9lbGYzMi1vcjFrLmMgfCAxMSArKysrKysrKysrKwog
MSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9iZmQvZWxmMzIt
b3Ixay5jIGIvYmZkL2VsZjMyLW9yMWsuYwppbmRleCAxYjg5MzhkZjM3Zi4uNWVjYTQzMDBjNDUg
MTAwNjQ0Ci0tLSBhL2JmZC9lbGYzMi1vcjFrLmMKKysrIGIvYmZkL2VsZjMyLW9yMWsuYwpAQCAt
MTI3OCw2ICsxMjc4LDcgQEAgb3Ixa19lbGZfcmVsb2NhdGVfc2VjdGlvbiAoYmZkICpvdXRwdXRf
YmZkLAogICBhc2VjdGlvbiAqc2dvdCwgKnNwbHQ7CiAgIGJmZF92bWEgcGx0X2Jhc2UsIGdvdF9i
YXNlLCBnb3Rfc3ltX3ZhbHVlOwogICBib29sIHJldF92YWwgPSB0cnVlOworICBib29sIHNhd19n
b3RoYSA9IGZhbHNlOwogCiAgIGlmIChodGFiID09IE5VTEwpCiAgICAgcmV0dXJuIGZhbHNlOwpA
QCAtMTQ4NSw2ICsxNDg2LDE2IEBAIG9yMWtfZWxmX3JlbG9jYXRlX3NlY3Rpb24gKGJmZCAqb3V0
cHV0X2JmZCwKIAkJfHwgcl90eXBlID09IFJfT1IxS19HT1RfQUhJMTYpCiAJICAgICAgcmVsb2Nh
dGlvbiAtPSBnb3Rfc3ltX3ZhbHVlOwogCisJICAgIGlmIChyX3R5cGUgPT0gUl9PUjFLX0dPVF9B
SEkxNikKKwkgICAgICBzYXdfZ290aGEgPSB0cnVlOworCisJICAgIC8qIElmIHdlIGhhdmUgYSBS
X09SMUtfR09UMTYgZm9sbG93ZWQgYnkgYSBSX09SMUtfR09UX0FISTE2CisJICAgICAgIHJlbG9j
YXRpb24gd2UgYXNzdW1lIHRoZSBjb2RlIGlzIGRvaW5nIHRoZSByaWdodCB0aGluZyB0byBhdm9p
ZAorCSAgICAgICBvdmVyZmxvd3MuICBIZXJlIHdlIG1hc2sgdGhlIGxvd2VyIDE2LWJpdCBvZiB0
aGUgcmVsb2NhdGlvbiB0bworCSAgICAgICBhdm9pZCBvdmVyZmxvdyB2YWxpZGF0aW9uIGZhaWx1
cmVzLiAgKi8KKwkgICAgaWYgKHJfdHlwZSA9PSBSX09SMUtfR09UMTYgJiYgc2F3X2dvdGhhKQor
CSAgICAgIHJlbG9jYXRpb24gJj0gMHhmZmZmOworCiAJICAvKiBBZGRlbmQgc2hvdWxkIGJlIHpl
cm8uICAqLwogCSAgaWYgKHJlbC0+cl9hZGRlbmQgIT0gMCkKIAkgICAgewotLSAKMi4yNi4yCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBt
YWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5s
aWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
