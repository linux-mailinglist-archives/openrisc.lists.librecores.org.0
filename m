Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 7D413483AE3
	for <lists+openrisc@lfdr.de>; Tue,  4 Jan 2022 04:14:52 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 60C3324335;
	Tue,  4 Jan 2022 04:14:52 +0100 (CET)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mail.librecores.org (Postfix) with ESMTPS id 5B72124330
 for <openrisc@lists.librecores.org>; Tue,  4 Jan 2022 04:14:51 +0100 (CET)
Received: by mail-pj1-f48.google.com with SMTP id
 n30-20020a17090a5aa100b001b2b6509685so1664484pji.3
 for <openrisc@lists.librecores.org>; Mon, 03 Jan 2022 19:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qsu7GCWVUKycdwXshVsaiv4HbXhupx2bB+O/xvVTj8c=;
 b=Yhq3sdTCR3D1KL7FY8IcTEYnwukdLdHjFZGg4mlAp7vKAfWmVyQFBNaj0+gASQzZ0l
 MWhfbKnpIoMUKxw5IP5g3rOb3FPG4qn5UY01UL8hz7pFhElXHPHZpEtwlmYe4k0hksOF
 o/56al3rfB2XLSWcTZMEoZgtM2YJ80X9JKXGXVJXWC078zhlh69eMU1NfKpix/YNz/3l
 DbcJTNtXjOLXuuusyVLXv8VbBtibWvX6djyosUZuFQlglGAqbwEuZgvokB9CsJclwm+R
 E/N7uv6uAD/jhjCp2UXXprBJ8He27pHxcnJDlqXLVODvTC7u7USIEzWwhNjCYoeYzYNG
 uFjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qsu7GCWVUKycdwXshVsaiv4HbXhupx2bB+O/xvVTj8c=;
 b=M0oPkwrXVNBC5/BI67DygJHep7hn7thuasj4YWdUrkq7Tg9/hsUUtAXOa/u49yxXSc
 GXFCxLceDg9M+1Iox3Xv6NN7jvusyql7OjqhYlJ4/XjPz6YgtyD2SE2j536hiT+89Ok8
 3BxEpnCmihTbJkfaT7OKd6nISDDb6gww0+ye+nP0id+lr+/khgfAeqeUbCXctpb3eNTP
 YTQ9FQ2TeugsSq2fM86fkWco3/rdmicWcMh/WEeqPIjWCWjEwmUd/yBLm7yCqxuPSb4D
 ORtDzzrZwiVrHqJpf2yvgdQxn5ybI7hYn8ivCvPfPiabezRADj5a3WQWCwXDayncXDA0
 gmFQ==
X-Gm-Message-State: AOAM5314BZ1ze9dZPEoiFr93TRaaesyZuSwWgpacNq3YD1GW30Ixj63C
 GkZxArz5tLNq+JWpaWFtio4=
X-Google-Smtp-Source: ABdhPJyVhlBvTHap3p1PV526E933IjfSw8lgekjeEphiBvn/NAPy8eS+kzBsjnF3qw7iWH3guekVIw==
X-Received: by 2002:a17:902:f681:b0:148:e8be:3e1 with SMTP id
 l1-20020a170902f68100b00148e8be03e1mr48151891plg.158.1641266090037; 
 Mon, 03 Jan 2022 19:14:50 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id r11sm38875685pff.81.2022.01.03.19.14.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 19:14:49 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: GLIBC patches <libc-alpha@sourceware.org>
Date: Tue,  4 Jan 2022 12:14:14 +0900
Message-Id: <20220104031414.2416928-14-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220104031414.2416928-1-shorne@gmail.com>
References: <20220104031414.2416928-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v5 13/13] Documentation for OpenRISC port
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
Cc: Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T3BlblJJU0MgYXJjaGl0ZWN0dXJlIHNwZWNpZmljYXRpb246CgogaHR0cHM6Ly9yYXcuZ2l0aHVi
dXNlcmNvbnRlbnQuY29tL29wZW5yaXNjL2RvYy9tYXN0ZXIvb3BlbnJpc2MtYXJjaC0xLjMtcmV2
MS5wZGYKCkN1cnJlbnRseSB0aGUgcG9ydCBhcyBvZiB0aGUgMjAyMi0wMS0wMyByZWJhc2luZyB0
aGVyZSBhcmUgbm8ga25vd24KYXJjaGl0ZWN0dXJlIHNwZWNpZmljIHRlc3QgZmFpbHVyZXMuCgpX
cml0aW5nIGNyZWRpdHMgZm9yIHRoZSBwb3J0IGFyZToKCiBTdGFmZm9yZCBIb3JuZSAgPHNob3Ju
ZUBnbWFpbC5jb20+CiBDaHJpc3RpYW4gU3ZlbnNzb24gIDxibHVlQGNtZC5udT4KLS0tCiBORVdT
ICAgfCA5ICsrKysrKysrKwogUkVBRE1FIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9ORVdTIGIvTkVXUwppbmRleCA5ZGEyYTc0MGVjLi4xYjdh
NjRkNjU0IDEwMDY0NAotLS0gYS9ORVdTCisrKyBiL05FV1MKQEAgLTEwNiw2ICsxMDYsMTUgQEAg
TWFqb3IgbmV3IGZlYXR1cmVzOgogICBjYW4gdXNlIGl0IHRvIGVmZmljaWVudGx5IGxvY2F0ZSB1
bndpbmRpbmcgaW5mb3JtYXRpb24gZm9yIGEgY29kZQogICBhZGRyZXNzLgogCisqIFN1cHBvcnQg
Zm9yIE9wZW5SSVNDIHJ1bm5pbmcgb24gTGludXggaGFzIGJlZW4gYWRkZWQuICBUaGlzIHBvcnQg
cmVxdWlyZXMKKyAgYXMgbGVhc3QgYmludXRpbHMgMi4zNSwgR0NDIDExLCBhbmQgTGludXggNS40
LiAgQ3VycmVudGx5IG9ubHkgc29mdC1mbG9hdAorICBBQkkgaXMgc3VwcG9ydGVkOgorCisgICAg
LSBvcjFrLWxpbnV4LWdudQorCisgIFRoZSBPcGVuUklTQyBBQkkgaXMgMzItYml0IGJpZy1lbmRp
YW4gYW5kIHVzZXMgNjQtYml0IHRpbWUgKHkyMDM4IHNhZmUpIGFuZAorICA2NC1iaXQgZmlsZSBv
ZmZzZXRzIChMRlMgZGVmYXVsdCkuCisKIERlcHJlY2F0ZWQgYW5kIHJlbW92ZWQgZmVhdHVyZXMs
IGFuZCBvdGhlciBjaGFuZ2VzIGFmZmVjdGluZyBjb21wYXRpYmlsaXR5OgogCiAqIE9uIHg4Ni02
NCwgdGhlIExEX1BSRUZFUl9NQVBfMzJCSVRfRVhFQyBlbnZpcm9ubWVudCB2YXJpYWJsZSBzdXBw
b3J0CmRpZmYgLS1naXQgYS9SRUFETUUgYi9SRUFETUUKaW5kZXggZDBmMGVkYjM5My4uM2Q1YTc4
Y2NmZiAxMDA2NDQKLS0tIGEvUkVBRE1FCisrKyBiL1JFQURNRQpAQCAtMzUsNiArMzUsNyBAQCBU
aGUgR05VIEMgTGlicmFyeSBzdXBwb3J0cyB0aGVzZSBjb25maWd1cmF0aW9ucyBmb3IgdXNpbmcg
TGludXgga2VybmVsczoKIAltaWNyb2JsYXplKi0qLWxpbnV4LWdudQogCW1pcHMtKi1saW51eC1n
bnUKIAltaXBzNjQtKi1saW51eC1nbnUKKwlvcjFrLSotbGludXgtZ251CiAJcG93ZXJwYy0qLWxp
bnV4LWdudQlIYXJkd2FyZSBvciBzb2Z0d2FyZSBmbG9hdGluZyBwb2ludCwgQkUgb25seS4KIAlw
b3dlcnBjNjQqLSotbGludXgtZ251CUJpZy1lbmRpYW4gYW5kIGxpdHRsZS1lbmRpYW4uCiAJczM5
MC0qLWxpbnV4LWdudQotLSAKMi4zMS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGli
cmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlz
Ywo=
