Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id EA1F05DD06
	for <lists+openrisc@lfdr.de>; Wed,  3 Jul 2019 05:34:06 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8B17D202AE;
	Wed,  3 Jul 2019 05:34:06 +0200 (CEST)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by mail.librecores.org (Postfix) with ESMTPS id C392120156
 for <openrisc@lists.librecores.org>; Wed,  3 Jul 2019 05:34:04 +0200 (CEST)
Received: by mail-pf1-f195.google.com with SMTP id d126so496057pfd.2
 for <openrisc@lists.librecores.org>; Tue, 02 Jul 2019 20:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cGE06q20sVGMSGdFrQqmqwnxLpdj48odBTHZM9MK0o0=;
 b=rtyVoSl57hpyRfWjdQS4pZrbuS5P8t12TdWo+OwuTGYo8ieuA0f5l1cnCYk8RCFcmu
 9n20P+3uCnpYQDqN6CjC/PKAa60gaDH6VFLILjPPmpYBStmRVEAhT3xogV7HY3Cq24AZ
 ZqadMRyej2Y+u3PPj4iVNfKhMMSmuffWRq9nNc/R75pWd8pM5961FObmT/v0SZ7kjjKr
 MkYu12OSzTw+pej9pr6/7NwUQnMBahCTT7dEDlURNkLJUegV8GTlMD35F/RPEeKBG0X8
 ztL1znhlGtBYAP0Ftz2ylKcYBAGL8vNevMluGtZoZ/vhjUrRwLtU/WhymZINWCfdrtFm
 qHkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cGE06q20sVGMSGdFrQqmqwnxLpdj48odBTHZM9MK0o0=;
 b=fchA1ijO5hbOYAx2hgiTwIPCcWlKHFgaZWyO5Jcxg2tvvlucJ/9M84BxSBHR9xHDP8
 oSjJpauuTVVFbjBg6ut+ZScBlFPHi6A+zaI8O7tEvjET/3rrPCq4ULucdg8BhPyVy4Rh
 B0PJvtMX/7wSlO/e2ZupSNpwtqU2+caI5P2xjnXI5XTcYJSH+Ai9oFz+woUrDoB9SUZA
 6pmvMyn3MNkcY6SpHvFGrcr1f+k5Hj/nG70Anj6Fh4/r/bL5SdbVNW3U2A3kMmeoZUv/
 9cC0Gh+ZlryJFs0ujHw+j+YD4kAGIJaPb/LlZFdZX5DuPFpuKSFUQ8QNA4bXFi7/ZpwB
 VI0A==
X-Gm-Message-State: APjAAAV7mR40FRQNVgiMGY7JhNNrIhPPYI6hHH+Mpwj9ddqnDTbagYZt
 FwE0PpKVL4FtiseFrcCtfos=
X-Google-Smtp-Source: APXvYqwRBU9aEm8BUqp+KGcwSfGWhIOY+Hod6o2vFwGI2mhLXQ+px1esyE77byIUMtAjLi7pkRuMlg==
X-Received: by 2002:a17:90a:9b88:: with SMTP id
 g8mr9789314pjp.100.1562124843269; 
 Tue, 02 Jul 2019 20:34:03 -0700 (PDT)
Received: from localhost (g223.61-115-60.ppp.wakwak.ne.jp. [61.115.60.223])
 by smtp.gmail.com with ESMTPSA id v5sm522937pgq.66.2019.07.02.20.34.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 20:34:02 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: GCC patches <gcc-patches@gcc.gnu.org>
Date: Wed,  3 Jul 2019 12:33:46 +0900
Message-Id: <20190703033351.11924-1-shorne@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v2 0/5] OpenRISC updates for 10 (fpu, fixes)
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
 Openrisc <openrisc@lists.librecores.org>, Jeff Law <law@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGVsbG8sCgpJdCdzIGJlZW4gYWJvdXQgMiBtb250aHMgc2luY2UgSSBsYXN0IHNlbnQgdGhlc2Ug
cGF0Y2hlcy4gIFNvcnJ5IGZvciB0aGUgZGVsYXkKSSBlbmRlZCB1cCBnZXR0aW5nIHNpZGUgdHJh
Y2tlZCBmaW5pc2hpbmcgdGhlIG5ldyBPcGVuUklTQyBhcmNoaXRlY3R1cmUgc3BlYwpyZXZpc2lv
bi4KCk5ldyBzaW5jZSB2MToKIC0gQ2hhbmdlZCA2NC1iaXQgRlBVIG9wZXJhdGlvbnMgdG8gdXNl
IGV4cGxpY2l0IHJlZ2lzdGVyIHBhaXJzIGFzIHBlciBzcGVjCiAgIHJldmlzaW9uIHN1Z2dlc3Rl
ZCBieSBSaWNoYXJkIEhlbmRlcnNvbi4KIC0gQWRkZWQgcGF0Y2ggZm9yIG5ldyAtbXJvcmkgb3B0
aW9uCiAtIEFkZGVkIHBhdGNoIGZvciBtc29mdC1kaXYgZml4IGZyb20gb3RoZXIgc2VyaWVzIChu
byBjaGFuZ2VzKQogLSBGaXhlZCB2b2xhdGlsZSBzcGVsbGluZyBwb2ludGVkIG91dCBieSBCZXJu
aGFyZCAKICAgUmV1dG5lci1GaXNjaGVyIDxyZXAuZG90Lm5vcEBnbWFpbC5jb20+CgpUaGlzIGlz
IGEgc2V0IG9mIHBhdGNoZXMgdG8gYnJpbmcgRlBVIHN1cHBvcnQgdG8gdGhlIE9wZW5SSVNDIGJh
Y2tlbmQuICBUaGUKYmFja2VuZCBhbHNvIGFkZCBzdXBwb3J0IGZvciA2NC1iaXQgZmxvYXRpbmcg
cG9pbnQgb3BlcmF0aW9ucyBvbiAzMi1iaXQgY29yZXMKdXNpbmcgcmVnaXN0ZXIgcGFpcnMsIHNl
ZSBvcmZweDY0YTMyIFswXS4KClRoaXMgYmludXRpbHMgcGF0Y2hlcyBhcmUgYWxyZWFkeSB1cHN0
cmVhbS4KClRoZSB0b29sY2hhaW4gaGFzIGJlZW4gdGVzdGVkIHVzaW5nIHRoZSBnY2MgYW5kIGJp
bnV0aWxzIHRlc3RzdWl0ZXMgYXMgd2VsbCBhcwpmbG9hdGluZyBwb2ludCB0ZXN0IHN1aXRlcyBy
dW5uaW5nIG9uIHNpbSBhbmQgYW4gZnBnYSBzb2Z0IGNvcmUgb3Ixa19tYXJvY2NoaW5vLgpbMV0K
CkkgaGF2ZSBhbHNvIGluY2x1ZGVkIGEgZmV3IGZpeGVzIHRvIFBSczoKCiAtIDkwMzYyIG9yMWs6
IFNvZnQgZGl2aWRlIGRvZXMgbm90IHdvcmsgY29ycmVjdGx5CiAtIDkwMzYzIG9yMWs6IEV4dHJh
IG1hc2sgaW5zbiBhZnRlciBsb2FkIGZyb20gbWVtb3J5CgpUaGlzIHdob2xlIHBhdGNoIHNlcmll
cyBjYW4gYmUgZm91bmQgb24gbXkgZ2l0aHViIHJlcG8gWzJdIGFzIHdlbGwuCgpJZiBhbGwgaXMg
T0ssIEkgcGxhbiB0byBjb21taXQgdGhlc2UgdG8gbWFzdGVyIChnY2MgMTApLiAgVGhlbiBiYWNr
IHBvcnQgdGhlIFBSCmZpeGVzIHRvIHRoZSBHQ0MgOSBicmFuY2gsIEkgd2lsbCBhc2sgZm9yIGd1
aWRhbmNlIHdoZW4gSSBzdGFydCB0byBkbyB0aGUKYmFja3BvcnRpbmcuCgotU3RhZmZvcmQKClsw
XSBodHRwczovL29wZW5yaXNjLmlvL3Byb3Bvc2Fscy9vcmZweDY0YTMyClsxXSBodHRwczovL2dp
dGh1Yi5jb20vb3BlbnJpc2Mvb3Ixa19tYXJvY2NoaW5vClsyXSBnaXRAZ2l0aHViLmNvbTpzdGZm
cmRocm4vZ2NjLmdpdCBvcjFrLWZwdS0yCgpTdGFmZm9yZCBIb3JuZSAoNSk6CiAgb3IxazogRml4
IGNvZGUgcXVhbGl0eSBmb3Igdm9sYXRpbGUgbWVtb3J5IGxvYWRzCiAgb3IxazogRml4IGlzc3Vl
cyB3aXRoIG1zb2Z0LWRpdgogIG9yMWs6IEFkZCBtcm9yaSBvcHRpb24sIGZpeCBvcHRpb24gZG9j
cwogIG9yMWs6IEluaXRpYWwgc3VwcG9ydCBmb3IgRlBVCiAgb3Ixazogb25seSBmb3JjZSByZWcg
Zm9yIGltbWVkaWF0ZXMKCiBnY2MvY29uZmlnLmdjYyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAgMiArCiBnY2MvY29uZmlnL29yMWsvY29uc3RyYWludHMubWQgICAgICAgICAgICB8ICAg
NCArCiBnY2MvY29uZmlnL29yMWsvZWxmLm9wdCAgICAgICAgICAgICAgICAgICB8ICAgNiArLQog
Z2NjL2NvbmZpZy9vcjFrL29yMWsuYyAgICAgICAgICAgICAgICAgICAgfCAgNDggKysrKysrLS0K
IGdjYy9jb25maWcvb3Ixay9vcjFrLmggICAgICAgICAgICAgICAgICAgIHwgICAzICsKIGdjYy9j
b25maWcvb3Ixay9vcjFrLm1kICAgICAgICAgICAgICAgICAgIHwgMTI5ICsrKysrKysrKysrKysr
KysrKysrLS0KIGdjYy9jb25maWcvb3Ixay9vcjFrLm9wdCAgICAgICAgICAgICAgICAgIHwgIDc4
ICsrKysrKysrKy0tLS0KIGdjYy9jb25maWcvb3Ixay9wcmVkaWNhdGVzLm1kICAgICAgICAgICAg
IHwgIDIzICsrKysKIGdjYy9kb2MvaW52b2tlLnRleGkgICAgICAgICAgICAgICAgICAgICAgIHwg
IDc3ICsrKysrKysrLS0tLS0KIGdjYy90ZXN0c3VpdGUvZ2NjLnRhcmdldC9vcjFrL2Rpdi1tdWwt
My5jIHwgIDMxICsrKysrKwogZ2NjL3Rlc3RzdWl0ZS9nY2MudGFyZ2V0L29yMWsvcm9yLTQuYyAg
ICAgfCAgIDggKysKIGdjYy90ZXN0c3VpdGUvZ2NjLnRhcmdldC9vcjFrL3NoZnRpbW0tMS5jIHwg
ICA4ICstCiBnY2MvdGVzdHN1aXRlL2djYy50YXJnZXQvb3Ixay9zd2FwLTEuYyAgICB8ICA3MCAr
KysrKysrKysrKysKIGdjYy90ZXN0c3VpdGUvZ2NjLnRhcmdldC9vcjFrL3N3YXAtMi5jICAgIHwg
IDQ3ICsrKysrKysrCiBsaWJnY2MvY29uZmlnL29yMWsvbGliMWZ1bmNzLlMgICAgICAgICAgICB8
ICAgNiArLQogMTUgZmlsZXMgY2hhbmdlZCwgNDY1IGluc2VydGlvbnMoKyksIDc1IGRlbGV0aW9u
cygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGdjYy90ZXN0c3VpdGUvZ2NjLnRhcmdldC9vcjFrL2Rp
di1tdWwtMy5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgZ2NjL3Rlc3RzdWl0ZS9nY2MudGFyZ2V0L29y
MWsvcm9yLTQuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGdjYy90ZXN0c3VpdGUvZ2NjLnRhcmdldC9v
cjFrL3N3YXAtMS5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgZ2NjL3Rlc3RzdWl0ZS9nY2MudGFyZ2V0
L29yMWsvc3dhcC0yLmMKCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5s
aWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5y
aXNjCg==
