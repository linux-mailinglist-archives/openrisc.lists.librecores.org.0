Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 40C9331A11
	for <lists+openrisc@lfdr.de>; Sat,  1 Jun 2019 09:26:56 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 280C72015F;
	Sat,  1 Jun 2019 09:26:56 +0200 (CEST)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by mail.librecores.org (Postfix) with ESMTPS id A65D6200DC
 for <openrisc@lists.librecores.org>; Sat,  1 Jun 2019 09:26:54 +0200 (CEST)
Received: by mail-pg1-f193.google.com with SMTP id t1so1779436pgc.2
 for <openrisc@lists.librecores.org>; Sat, 01 Jun 2019 00:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nl7erPS9kzpIk+VYx8bsyRf8O6chg/koE2GDiUjyfak=;
 b=bepdrFZjv2zUGfzZHbf8YYSO1YqSjeNoli5i6unA8GMZZWbaCVCgZRFrp6pynFhH1D
 QkX1y/W73zKXhb0qsp7LpMWfsPsNlce9afp5b/HVf+d1N4aW++2gGjohQQE+ZjkVkmd8
 UkTRjIDOCD/0z7dMgh0kUyVj4apWffkGVIvwsNBQL5AN7gUmAWopb+7oAf+aWTEcxF5Q
 FvedBkw4gb/UBaxMAOsliw+0kiUJHgJhusv4iASyjf9LkLYMOkOSXtNIN0Q/TESWtDGM
 qrb07PKehALp8yFIYgJpJ/pfnsO7bLyiiiPDKKDxYV+fF8bbK3yuUsT8Jl/jetLbmGBP
 MsZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nl7erPS9kzpIk+VYx8bsyRf8O6chg/koE2GDiUjyfak=;
 b=Y7iLDchnf541TMJumiP8cT0ZdtF1Y8kJuO4gAbMge3htof/V3VGMBIOe80T6xVZXba
 FrTm0Vgf0sP6MdqEYYZelGkJbW3xA1AtYpSFjtiEZU0xNcjn+IRCNYJfAPCDv8/EjhKs
 3d9BNrnb7ZphW8lXQg7LaVQ8BlDJqCT5My2KJXFOkVXm6aM82oA4QP6k0/uqrHeDvZ/b
 flLFaerIIy34nVfGe/4qlW7CQKyv5uDOtjoZ/5FCmGGeq+rDiPS+pffUfZTnpZz4WE2D
 u3aquTR8eNbTl7c8q/dPtiw/6cVQsZ/5+R22TWgXCuqlx+Cbqwp9cJbEqGHbnz787/wi
 61wA==
X-Gm-Message-State: APjAAAW++lqhrMS3jlG7khzVJa6LVbA6u6xTfguPVfvd/8M+DIHROVqo
 Oj5TC4ePJUDL7uGdWYNGHKbU84tf
X-Google-Smtp-Source: APXvYqxXeKNHDGhls+biDc3q4tYJGx7q1+twLBzhFUHjoT8Ws+8dk4Fjs98bwhvEIKWl/ysy30RjbA==
X-Received: by 2002:a62:5103:: with SMTP id f3mr15156330pfb.146.1559374012652; 
 Sat, 01 Jun 2019 00:26:52 -0700 (PDT)
Received: from localhost (g30.211-19-85.ppp.wakwak.ne.jp. [211.19.85.30])
 by smtp.gmail.com with ESMTPSA id ds15sm6243368pjb.9.2019.06.01.00.26.51
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 01 Jun 2019 00:26:51 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: cgen@sourceware.org
Date: Sat,  1 Jun 2019 16:26:28 +0900
Message-Id: <20190601072629.4070-2-shorne@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190601072629.4070-1-shorne@gmail.com>
References: <20190601072629.4070-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 1/2] cgen: Add unordered compare operation
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

T24gT3BlblJJU0Mgd2UgaGF2ZSBhZGRlZCBGUFUgdW5vcmRlcmVkIGNvbXBhcmlzb24gb3BlcmF0
aW9ucyAoTmFOCmRldGVjdGlvbikuICBUaGlzIHBhdGNoIGFkZHMgdGhlIHVub3JkZXJlZCBvcGVy
YXRpb24gd2hpY2ggd2lsbCBnZW5lcmF0ZQpjIGhvb2tzIHRvIGJlIGltcGxlbWVudGVkIGluIHNp
bXVsYXRvcnMuCgpBbiB1bm9yZGVyZWQgY29tcGFyaXNvbiBjYW4gbm93IGJlIGRlZmluZWQgYXM6
CgogIDsgQ29tcGFyZSB1bm9yZGVyZWQgKHNldCBmbGFnIGlmIGVpdGhlciByMSBvciByMiBpcyBO
YU4pCiAgKHNldCBCSSBmbGFnICh1bm9yZGVyZWQgV0kgcjEgcjIpKQoKICA7IENvbXBhcmUgdW5v
cmRlcmVkLCBncmVhdGVyIHRoYW4gb3IgZXF1YWwKICAoc2V0IEJJIGZsYWcgKG9yICh1bm9yZGVy
ZWQgV0kgcjEgcjIpCgkJICAgKGdlIFdJIHIxIHIyKSkpCgpDaGFuZ2VMb2c6Cgp5eXl5LW1tLWRk
ICBTdGFmZm9yZCBIb3JuZSAgPHNob3JuZUBnbWFpbC5jb20+CgoJKiBydGwtYy5zY20gKHVub3Jk
ZXJlZCk6IE5ldyBjb21wYXJpc29uIG9wZXJhdGlvbi4KCSogcnR4LWZ1bmNzLnNjbSAodW5vcmRl
cmVkKTogTmV3IHJ0eCBub2RlLgotLS0KIHJ0bC1jLnNjbSAgICAgfCA0ICsrKysKIHJ0eC1mdW5j
cy5zY20gfCA3ICsrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL3J0bC1jLnNjbSBiL3J0bC1jLnNjbQppbmRleCAxYTRiOGIwLi40ZDRkNjcxIDEw
MDY0NAotLS0gYS9ydGwtYy5zY20KKysrIGIvcnRsLWMuc2NtCkBAIC0xODk3LDYgKzE4OTcsMTAg
QEAKIChkZWZpbmUtZm4gZ2V1ICgqZXN0YXRlKiBvcHRpb25zIG1vZGUgczEgczIpCiAgIChzLWNt
cG9wICplc3RhdGUqICdnZXUgIj49IiBtb2RlIHMxIHMyKQogKQorKGRlZmluZS1mbiB1bm9yZGVy
ZWQgKCplc3RhdGUqIG9wdGlvbnMgbW9kZSBzMSBzMikKKyAgKHMtY21wb3AgKmVzdGF0ZSogJ3Vu
b3JkZXJlZCAjZiBtb2RlIHMxIHMyKQorKQorCiAKIChkZWZpbmUtZm4gbWVtYmVyICgqZXN0YXRl
KiBvcHRpb25zIG1vZGUgdmFsdWUgc2V0KQogICA7OyBOT1RFOiBUaGVyZSBhcmUgbXVsdGlwbGUg
ZXZhbHV0aW9ucyBvZiBWQUxVRSBpbiB0aGUgZ2VuZXJhdGVkIGNvZGUuCmRpZmYgLS1naXQgYS9y
dHgtZnVuY3Muc2NtIGIvcnR4LWZ1bmNzLnNjbQppbmRleCA2YzI4NzM1Li5mMTY4NjRhIDEwMDY0
NAotLS0gYS9ydHgtZnVuY3Muc2NtCisrKyBiL3J0eC1mdW5jcy5zY20KQEAgLTEwODYsNiArMTA4
NiwxMyBAQAogICAgICBDT01QQVJFCiAgICAgICNmCiApCis7IERldGVjdCBOYU5zCisoZHJuICh1
bm9yZGVyZWQgJm9wdGlvbnMgJm1vZGUgczEgczIpCisgICAgIEJJCisgICAgIChPUFRJT05TIEFO
WU5VTU1PREUgUlRYIFJUWCkgKE5BIE5BIE1BVENIRVhQUiBNQVRDSDIpCisgICAgIENPTVBBUkUK
KyAgICAgI2YKKykKIAwKIDsgU2V0IG1lbWJlcnNoaXAuCiA7IFVzZWZ1bCBpbiBpZmllbGQgYXNz
ZXJ0aW9ucy4KLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29y
ZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
