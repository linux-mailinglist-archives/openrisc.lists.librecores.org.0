Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 467094602FE
	for <lists+openrisc@lfdr.de>; Sun, 28 Nov 2021 03:28:21 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id DF53A24130;
	Sun, 28 Nov 2021 03:28:20 +0100 (CET)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mail.librecores.org (Postfix) with ESMTPS id CDD6620E43
 for <openrisc@lists.librecores.org>; Sun, 28 Nov 2021 03:28:18 +0100 (CET)
Received: by mail-pj1-f54.google.com with SMTP id
 n15-20020a17090a160f00b001a75089daa3so12555998pja.1
 for <openrisc@lists.librecores.org>; Sat, 27 Nov 2021 18:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Si4rOrqX/eJVRfxqg7o9yRvduz/4ozbOvrqHySRirg4=;
 b=Y7/MwRRcyiq8YM4oKNZLlqefpvr6hkSSXw0KUK6+BfW5fDZmzNFPoArL9kSvzWFVKW
 +/7ZhnVNVgNnzM46DA4yH+wxq8k70nNUxAj/rpLDnOLaR2ZoF60Z3jHrUa6hSS2yp14p
 0FL6NCZSYWUv/wsOmIbCL6LMyOnN/P97/1ECDO11rPaLbb14rmP1FrNlYxdQKGyxP+iT
 O5X7Uyosl0N91ZMLOBYydkthRI3B8nKwnEIdGWEXN9fgx4mlsFadJtOHSkvtyl3wPecv
 G0gHq5Nspzady0KnKMt1Ohc6+LX4Pd9RUY5434w81byRdzj16IrZQsRAcTvp7oq4PYL9
 hKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Si4rOrqX/eJVRfxqg7o9yRvduz/4ozbOvrqHySRirg4=;
 b=x+BTUcaHZ5c190518K3euCm7CnW1JdFLF38ruRiVdLa8Svx8RR0+jutTv59tUaXuzY
 ERPwVDg/FB1ISkz3KUJ08O60K3bmaYL6/HjveF1wFQoGSvxoHO0eUVMR01DozDC+gqHl
 UAt/QPz0MMVN8cUYtkhTISaGDI8tSs3z4Z3V5mD1nl02XS+m+R89lynMueZUzNW//u4e
 OfKwptnPrsR+ZLf+mgKq8yIFtZZvnSFxBsg2lxLV5pAor9DnHFFcg/XeMs7VtWk+E3N/
 m5GU30p93kfLQcI8kWBwkDzExzueSNBBRbIYpVZhqKIE7RGYF1HLG79NCnMxt8e0RzVG
 6X5Q==
X-Gm-Message-State: AOAM530AzpNVdjctx1ja2xWZW6qyNpGqUjrGPyQdZJOH2P3JCNfkZ19V
 vmJCD2u3TDWbjTy7adwBAUY=
X-Google-Smtp-Source: ABdhPJya9ElONcpp1kxxXq77pLwRouEs3bzF91Fv95oBDdLGolRxuLDNATmb0HQRj7End3QNMmuZPQ==
X-Received: by 2002:a17:90b:4c02:: with SMTP id
 na2mr27730611pjb.94.1638066497196; 
 Sat, 27 Nov 2021 18:28:17 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id u13sm8742747pgp.27.2021.11.27.18.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Nov 2021 18:28:16 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Sun, 28 Nov 2021 11:28:01 +0900
Message-Id: <20211128022803.3828408-1-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH] openrisc: remove wrappers for clone and fork
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
Cc: Jonas Bonn <jonas@southpole.se>, Petr Mladek <pmladek@suse.com>,
 Chris Down <chris@chrisdown.name>, Mark Rutland <mark.rutland@arm.com>,
 Randy Dunlap <rdunlap@infradead.org>, openrisc@lists.librecores.org,
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VGhlIGNvbW1lbnQgaGVyZSBleHBsYWlucyB0aGF0IHRoZSBleHRyYSBzYXZlZCByZWdpc3RlcnMg
YXJlIGNsb2JiZXJlZApieSBfc3dpdGNoLiAgSG93ZXZlciwgbG9va2luZyBhdCBzd2l0Y2ggdGhl
eSBhcmUgZGVmaW5pdGVseSBzYXZlZCwgc28gSQphbSBub3Qgc3VyZSB3aHkgdGhlc2Ugd3JhcHBl
cnMgYXJlIG5lZWRlZC4gIFRoaXMgd2FzIG5vdGljZWQgd2hlbgphdWRpdGluZyB0aGUgY2xvbmUz
IHN5c2NhbGwgcGF0aCB3aGljaCB3b3JrcyBmaW5lIGFuZCBkb2VzIG5vdCBoYXZlIHRoZQpleHRy
YSB3cmFwcGVyIGNvZGUuCgpUaGUgcGF0Y2ggcmVtb3ZlcyB0aGUgd3JhcHBlciBjb2RlIGFzIGEg
Y2xlYW51cC4KClNpZ25lZC1vZmYtYnk6IFN0YWZmb3JkIEhvcm5lIDxzaG9ybmVAZ21haWwuY29t
PgotLS0KIGFyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vc3lzY2FsbHMuaCB8ICA3IC0tLS0tLQog
YXJjaC9vcGVucmlzYy9rZXJuZWwvZW50cnkuUyAgICAgICAgIHwgMzYgKystLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQxIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vc3lzY2FsbHMu
aCBiL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vc3lzY2FsbHMuaAppbmRleCAzYTdlZWFlNmY1
NmEuLmM4YzhhNTA3MmFkOSAxMDA2NDQKLS0tIGEvYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS9z
eXNjYWxscy5oCisrKyBiL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vc3lzY2FsbHMuaApAQCAt
MjAsMTEgKzIwLDQgQEAgYXNtbGlua2FnZSBsb25nIHN5c19vcjFrX2F0b21pYyh1bnNpZ25lZCBs
b25nIHR5cGUsIHVuc2lnbmVkIGxvbmcgKnYxLAogCiAjaW5jbHVkZSA8YXNtLWdlbmVyaWMvc3lz
Y2FsbHMuaD4KIAotYXNtbGlua2FnZSBsb25nIF9fc3lzX2Nsb25lKHVuc2lnbmVkIGxvbmcgY2xv
bmVfZmxhZ3MsIHVuc2lnbmVkIGxvbmcgbmV3c3AsCi0JCQl2b2lkIF9fdXNlciAqcGFyZW50X3Rp
ZCwgdm9pZCBfX3VzZXIgKmNoaWxkX3RpZCwgaW50IHRscyk7Ci1hc21saW5rYWdlIGxvbmcgX19z
eXNfZm9yayh2b2lkKTsKLQotI2RlZmluZSBzeXNfY2xvbmUgX19zeXNfY2xvbmUKLSNkZWZpbmUg
c3lzX2ZvcmsgX19zeXNfZm9yawotCiAjZW5kaWYgLyogX19BU01fT1BFTlJJU0NfU1lTQ0FMTFNf
SCAqLwpkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9rZXJuZWwvZW50cnkuUyBiL2FyY2gvb3Bl
bnJpc2Mva2VybmVsL2VudHJ5LlMKaW5kZXggNTljNmQzYWE3MDgxLi4wNjI5NjdlMDlmYmIgMTAw
NjQ0Ci0tLSBhL2FyY2gvb3BlbnJpc2Mva2VybmVsL2VudHJ5LlMKKysrIGIvYXJjaC9vcGVucmlz
Yy9rZXJuZWwvZW50cnkuUwpAQCAtMTEzOSw0MyArMTEzOSwxMSBAQCBFTlRSWShfc3dpdGNoKQog
CiAvKiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PSAqLwogCi0vKiBUaGVzZSBhbGwgdXNlIHRoZSBkZWxheSBzbG90IGZv
ciBzZXR0aW5nIHRoZSBhcmd1bWVudCByZWdpc3Rlciwgc28gdGhlCisvKgorICogVGhpcyB1c2Vz
IHRoZSBkZWxheSBzbG90IGZvciBzZXR0aW5nIHRoZSBhcmd1bWVudCByZWdpc3Rlciwgc28gdGhl
CiAgKiBqdW1wIGlzIGFsd2F5cyBoYXBwZW5pbmcgYWZ0ZXIgdGhlIGwuYWRkaSBpbnN0cnVjdGlv
bi4KLSAqCi0gKiBUaGVzZSBhcmUgYWxsIGp1c3Qgd3JhcHBlcnMgdGhhdCBkb24ndCB0b3VjaCB0
aGUgbGluay1yZWdpc3RlciByOSwgc28gdGhlCi0gKiByZXR1cm4gZnJvbSB0aGUgInJlYWwiIHN5
c2NhbGwgZnVuY3Rpb24gd2lsbCByZXR1cm4gYmFjayB0byB0aGUgc3lzY2FsbAotICogY29kZSB0
aGF0IGRpZCB0aGUgbC5qYWwgdGhhdCBicm91Z2h0IHVzIGhlcmUuCi0gKi8KLQotLyogZm9yayBy
ZXF1aXJlcyB0aGF0IHdlIHNhdmUgYWxsIHRoZSBjYWxsZWUtc2F2ZWQgcmVnaXN0ZXJzIGJlY2F1
c2UgdGhleQotICogYXJlIGFsbCBlZmZlY3RpdmVseSBjbG9iYmVyZWQgYnkgdGhlIGNhbGwgdG8g
X3N3aXRjaC4gIEhlcmUgd2Ugc3RvcmUKLSAqIGFsbCB0aGUgcmVnaXN0ZXJzIHRoYXQgYXJlbid0
IHRvdWNoZWQgYnkgdGhlIHN5c2NhbGwgZmFzdCBwYXRoIGFuZCB0aHVzCi0gKiB3ZXJlbid0IHNh
dmVkIHRoZXJlLgogICovCiAKLV9mb3JrX3NhdmVfZXh0cmFfcmVnc19hbmRfY2FsbDoKLQlsLnN3
ICAgIFBUX0dQUjE0KHIxKSxyMTQKLQlsLnN3ICAgIFBUX0dQUjE2KHIxKSxyMTYKLQlsLnN3ICAg
IFBUX0dQUjE4KHIxKSxyMTgKLQlsLnN3ICAgIFBUX0dQUjIwKHIxKSxyMjAKLQlsLnN3ICAgIFBU
X0dQUjIyKHIxKSxyMjIKLQlsLnN3ICAgIFBUX0dQUjI0KHIxKSxyMjQKLQlsLnN3ICAgIFBUX0dQ
UjI2KHIxKSxyMjYKLQlsLmpyCXIyOQotCSBsLnN3ICAgIFBUX0dQUjI4KHIxKSxyMjgKLQotRU5U
UlkoX19zeXNfY2xvbmUpCi0JbC5tb3ZoaQlyMjksaGkoc3lzX2Nsb25lKQotCWwub3JpCXIyOSxy
MjksbG8oc3lzX2Nsb25lKQotCWwuaglfZm9ya19zYXZlX2V4dHJhX3JlZ3NfYW5kX2NhbGwKLQkg
bC5ub3AKLQotRU5UUlkoX19zeXNfZm9yaykKLQlsLm1vdmhpCXIyOSxoaShzeXNfZm9yaykKLQls
Lm9yaQlyMjkscjI5LGxvKHN5c19mb3JrKQotCWwuaglfZm9ya19zYXZlX2V4dHJhX3JlZ3NfYW5k
X2NhbGwKLQkgbC5ub3AKLQogRU5UUlkoc3lzX3J0X3NpZ3JldHVybikKIAlsLmphbAlfc3lzX3J0
X3NpZ3JldHVybgogCSBsLmFkZGkJcjMscjEsMAotLSAKMi4zMS4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3Bl
blJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9s
aXN0aW5mby9vcGVucmlzYwo=
