Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2115B3140F5
	for <lists+openrisc@lfdr.de>; Mon,  8 Feb 2021 21:53:32 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 85EA821121;
	Mon,  8 Feb 2021 21:53:31 +0100 (CET)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mail.librecores.org (Postfix) with ESMTPS id 8F46E20EDB
 for <openrisc@lists.librecores.org>; Mon,  8 Feb 2021 21:53:29 +0100 (CET)
Received: by mail-pg1-f181.google.com with SMTP id z21so11051458pgj.4
 for <openrisc@lists.librecores.org>; Mon, 08 Feb 2021 12:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aUVp9y2kbcCD3w0xMPNOVcdPDPsJuo8ux3a0lIWVKEM=;
 b=p14p7HLTvwUQxkszIWy1D0jXzdQ7Jv/1M8//23UsBMWdxYmR8W9Oa9pFEeUQ/pN+c8
 FC73ALf4od9D9ewMLxOqDXH0e5s/GOvT1ecqSLjB2jJO6RKpDS7cLq8NfA4z3gu9/PIM
 izuXziI0Z0oNgWW4Q5J+uAGEYS6kIAGldZnGec1okq+S5dvNYwn2Lu42MO1cudNquxgi
 02J18w2m/NajoLm0QcPqTAbnu+JOJEE7F1Q5wL1QeMcdMHpqpFRWsFliZhWhPWQpibyu
 L4t0+MIIY36yCPd/rhg1tRY3zUk/pvtsfHYmffGfHC5jAeTPi4qf1tTNZrPubbnSxQG7
 AwWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aUVp9y2kbcCD3w0xMPNOVcdPDPsJuo8ux3a0lIWVKEM=;
 b=iTkMxPeSE8IfP9K7ohTKXJ8Zqo8zq8kxgl9iUEQ1uHghrTv5k7YMMWocJPM8OfiaxP
 bOGhTwUYRnPBT6YZ881aBle2/J2CIUY18FRpL5BOdbAVcdGImbeiAXZYZFTiuzxG7Hvn
 hiQvFQxVuJsON4QzHNgQJDF80dEh9Uq+2+8uxHdjkDMRKo6CKLhXY8tsJ5wg1YcTXUSs
 C7O3NiFMAojZGvuEYP9Y+nAbX5VATEbHucald99bGOdeaedfrdRbSg8lqQ+Fa6F0aNL3
 wqDklaDasN2UGlvBHVq3ecsiNxqNWOk9OZHElDN7P2Y6zteqmUJ/zCwFvNRx8UCF6BQx
 riWQ==
X-Gm-Message-State: AOAM5313g9HHGQ8jcZ5o2R9TwZo5B/Jh4VWQQfGoXDat7jeGmUeOzXuE
 phvajWY/OOKBGWsmdqnO1Gg=
X-Google-Smtp-Source: ABdhPJwtcdW1MR2LxB05C2ZmVapCPAleU1aPDxNKcwrWU8hTfYn7f5zcw2HSw/Yw/HXvBDI/5ZfZGQ==
X-Received: by 2002:a65:4c43:: with SMTP id l3mr18529836pgr.327.1612817604629; 
 Mon, 08 Feb 2021 12:53:24 -0800 (PST)
Received: from localhost (g186.222-224-165.ppp.wakwak.ne.jp. [222.224.165.186])
 by smtp.gmail.com with ESMTPSA id d1sm3018455pgl.17.2021.02.08.12.53.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 12:53:23 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Tue,  9 Feb 2021 05:53:05 +0900
Message-Id: <20210208205307.4169579-1-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v3] openrisc: Use devicetree to determine present
 cpus
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
Cc: Jonas Bonn <jonas@southpole.se>, openrisc@lists.librecores.org,
 Jan Henrik Weinstock <jan.weinstock@rwth-aachen.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogSmFuIEhlbnJpayBXZWluc3RvY2sgPGphbi53ZWluc3RvY2tAcnd0aC1hYWNoZW4uZGU+
CgpVc2UgdGhlIGRldmljZSB0cmVlIHRvIGRldGVybWluZSB0aGUgcHJlc2VudCBjcHVzIGluc3Rl
YWQgb2YgYXNzdW1pbmcKYWxsIENPTkZJR19OUkNQVVMgYXJlIGFjdHVhbGx5IHByZXNlbnQgaW4g
dGhlIHN5c3RlbS4KClNpZ25lZC1vZmYtYnk6IEphbiBIZW5yaWsgV2VpbnN0b2NrIDxqYW4ud2Vp
bnN0b2NrQHJ3dGgtYWFjaGVuLmRlPgpbc2hvcm5lOiBTcXVhc2hlZCAyIGVtYWlsIGNvbW1pdHMg
YW5kIGFkZGVkIHN1bW1hcnkgZnJvbSBlbWFpbF0KQ2M6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2Vl
cnRAbGludXgtbTY4ay5vcmc+ClNpZ25lZC1vZmYtYnk6IFN0YWZmb3JkIEhvcm5lIDxzaG9ybmVA
Z21haWwuY29tPgotLS0KIGFyY2gvb3BlbnJpc2Mva2VybmVsL3NtcC5jIHwgMjMgKysrKysrKysr
KysrKysrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCA2IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJpc2Mva2VybmVsL3NtcC5jIGIvYXJjaC9v
cGVucmlzYy9rZXJuZWwvc21wLmMKaW5kZXggMjljODJlZjJlMjA3Li40OGUxMDkyYTY0ZGUgMTAw
NjQ0Ci0tLSBhL2FyY2gvb3BlbnJpc2Mva2VybmVsL3NtcC5jCisrKyBiL2FyY2gvb3BlbnJpc2Mv
a2VybmVsL3NtcC5jCkBAIC0xNiw2ICsxNiw3IEBACiAjaW5jbHVkZSA8bGludXgvc2NoZWQuaD4K
ICNpbmNsdWRlIDxsaW51eC9zY2hlZC9tbS5oPgogI2luY2x1ZGUgPGxpbnV4L2lycS5oPgorI2lu
Y2x1ZGUgPGxpbnV4L29mLmg+CiAjaW5jbHVkZSA8YXNtL2NwdWluZm8uaD4KICNpbmNsdWRlIDxh
c20vbW11X2NvbnRleHQuaD4KICNpbmNsdWRlIDxhc20vdGxiZmx1c2guaD4KQEAgLTYwLDIyICs2
MSwzMiBAQCB2b2lkIF9faW5pdCBzbXBfcHJlcGFyZV9ib290X2NwdSh2b2lkKQogCiB2b2lkIF9f
aW5pdCBzbXBfaW5pdF9jcHVzKHZvaWQpCiB7Ci0JaW50IGk7CisJc3RydWN0IGRldmljZV9ub2Rl
ICpjcHU7CisJdTMyIGNwdV9pZDsKIAotCWZvciAoaSA9IDA7IGkgPCBOUl9DUFVTOyBpKyspCi0J
CXNldF9jcHVfcG9zc2libGUoaSwgdHJ1ZSk7CisJZm9yX2VhY2hfb2ZfY3B1X25vZGUoY3B1KSB7
CisJCWlmIChvZl9wcm9wZXJ0eV9yZWFkX3UzMihjcHUsICJyZWciLCAmY3B1X2lkKSkgeworCQkJ
cHJfd2FybigiJXMgbWlzc2luZyByZWcgcHJvcGVydHkiLCBjcHUtPmZ1bGxfbmFtZSk7CisJCQlj
b250aW51ZTsKKwkJfQorCisJCWlmIChjcHVfaWQgPCBOUl9DUFVTKQorCQkJc2V0X2NwdV9wb3Nz
aWJsZShjcHVfaWQsIHRydWUpOworCX0KIH0KIAogdm9pZCBfX2luaXQgc21wX3ByZXBhcmVfY3B1
cyh1bnNpZ25lZCBpbnQgbWF4X2NwdXMpCiB7Ci0JaW50IGk7CisJdW5zaWduZWQgaW50IGNwdTsK
IAogCS8qCiAJICogSW5pdGlhbGlzZSB0aGUgcHJlc2VudCBtYXAsIHdoaWNoIGRlc2NyaWJlcyB0
aGUgc2V0IG9mIENQVXMKIAkgKiBhY3R1YWxseSBwb3B1bGF0ZWQgYXQgdGhlIHByZXNlbnQgdGlt
ZS4KIAkgKi8KLQlmb3IgKGkgPSAwOyBpIDwgbWF4X2NwdXM7IGkrKykKLQkJc2V0X2NwdV9wcmVz
ZW50KGksIHRydWUpOworCWZvcl9lYWNoX3Bvc3NpYmxlX2NwdShjcHUpIHsKKwkJaWYgKGNwdSA8
IG1heF9jcHVzKQorCQkJc2V0X2NwdV9wcmVzZW50KGNwdSwgdHJ1ZSk7CisJfQogfQogCiB2b2lk
IF9faW5pdCBzbXBfY3B1c19kb25lKHVuc2lnbmVkIGludCBtYXhfY3B1cykKLS0gCjIuMjYuMgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
