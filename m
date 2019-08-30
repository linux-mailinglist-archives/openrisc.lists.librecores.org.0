Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id DDACFA3A3A
	for <lists+openrisc@lfdr.de>; Fri, 30 Aug 2019 17:22:04 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 7A44C204D8;
	Fri, 30 Aug 2019 17:22:04 +0200 (CEST)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by mail.librecores.org (Postfix) with ESMTPS id 586FD2010F
 for <openrisc@lists.librecores.org>; Fri, 30 Aug 2019 17:22:02 +0200 (CEST)
Received: by mail-pl1-f195.google.com with SMTP id m9so3510582pls.8
 for <openrisc@lists.librecores.org>; Fri, 30 Aug 2019 08:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:openpgp:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bkNUGAuZeYA182tW/KK6e67dJwnbcEwnX3yap9QrYvI=;
 b=WxoYoFo4Ye4qwmBYDzPy60DQrCybbDbuaXt3eRShNuOTaQGLATNnF6SUWufHcX+9Ix
 GmD3c4GkBD9tzridbQ1dPVKHZZCwRQDcvDQX8PDJdVN2fcEeyJvzMfzqkrtri63Uj/x3
 +xY4e5eIj+GKXl9NmrYYWMLUZL3KSLtFQbFm5ZOgAl2a4j35dYG7FGx/At1uKdZHjfg1
 owpn8iVXfB3oP6Vr9nllsd3jHtJdIacn/0LdR5g1wl56Ib/qLf5IZqfxofrXbbCm+HY3
 GeVg8hMrlItSw3tFvurbgc4W1MDd74RYDZlORKaRlzvMNY8+FtAUVH6+ofQdtklSHinZ
 ybPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=bkNUGAuZeYA182tW/KK6e67dJwnbcEwnX3yap9QrYvI=;
 b=cNnDqcXJ8r7qS4cmpS9QPKYo0lqQ9cBig92mTYyFhUKMxCLo8UgIo03NbsWhLTL6gD
 Ge/cfbr8S2xTir+MaxZn19pzvMTvOgS6Mgd6EZ5xexHdvhCGQVfWmGeYbDHnHkrszoUI
 DqNNqi2AxnI3MIV/SgFkqd875U6av4DUbZF393fxOS0Rwom/lppf8z9yWuBtz61y/wv6
 1z5aK2Exu1FfbLQMBFiIIKsIyRlq3PCD+l7UkQousZVbqypG2qGWr1968Z7EiFpmlnid
 w48yv4n14YAo/sTOWzip+EzuA6Qvde21izWNexzKTwBpfbL9kN43omQA2ydPI+2jHUD/
 0Egg==
X-Gm-Message-State: APjAAAVqASx5w3Wrc6HzgEbSg/niyNdJGYtKJv1iUkMi5cwTLR4TQZfZ
 zhAMmKb1MScsyp9wkdDTK4RVTw7C
X-Google-Smtp-Source: APXvYqw5A2Y/QmcpOz/l0KhInzdTKMNr9uoFbuQHqNYS60QvhRqO1ZFAzfhUpCBx19iWxqvIDAHtZA==
X-Received: by 2002:a17:902:7444:: with SMTP id
 e4mr15709037plt.72.1567178519888; 
 Fri, 30 Aug 2019 08:21:59 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.googlemail.com with ESMTPSA id m37sm14881958pjb.0.2019.08.30.08.21.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 30 Aug 2019 08:21:58 -0700 (PDT)
To: Stafford Horne <shorne@gmail.com>, GCC patches <gcc-patches@gcc.gnu.org>
References: <20190822114404.1318-1-shorne@gmail.com>
 <20190830093101.GU24874@lianli.shorne-pla.net>
From: Richard Henderson <rth@twiddle.net>
Openpgp: preference=signencrypt
Message-ID: <796f2b6f-e81f-6150-0349-d6ee3c884981@twiddle.net>
Date: Fri, 30 Aug 2019 08:21:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190830093101.GU24874@lianli.shorne-pla.net>
Content-Language: en-US
Subject: Re: [OpenRISC] [PATCH] or1k: Fix issue with set_got clobbering r9
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

TEdUTS4KCk9uIDgvMzAvMTkgMjozMSBBTSwgU3RhZmZvcmQgSG9ybmUgd3JvdGU6Cj4gSGVsbG8s
IGFueSBjb21tZW50cyBvbiB0aGlzPwo+IAo+IElmIG5vdGhpbmcgSSB3aWxsIGNvbW1pdCBpbiBh
IGZldyBkYXlzLgo+IAo+IE9uIFRodSwgQXVnIDIyLCAyMDE5IGF0IDA4OjQ0OjA0UE0gKzA5MDAs
IFN0YWZmb3JkIEhvcm5lIHdyb3RlOgo+PiBXaGVuIGNvbXBpbGluZyBnbGliYyB3ZSBmb3VuZCB0
aGF0IHRoZSBHT1QgcmVnaXN0ZXIgd2FzIGJlaW5nIGFsbG9jYXRlZAo+PiByOSB3aGVuIHRoZSBp
bnN0cnVjdGlvbiB3YXMgc3RpbGwgc2V0X2dvdF90bXAuICBUaGF0IGNhdXNlZCBzZXRfZ290IHRv
Cj4+IGNsb2JiZXIgcjkuICBXZSBjYW5ub3Qgc2ltcGx5IHNheSBzZXRfZ290X3RtcCBjbG9iYmVy
cyByOSBhcyB0aGlzIGlzIHRoZQo+PiByZWFzb24gZm9yIGhhdmluZyB0aGUgdGVtcG9yYXJ5IHNl
dF9nb3RfdG1wLgo+Pgo+PiBGaXggYnkgdXNpbmcgYSByZWdpc3RlciBjbGFzcyBjb25zdHJhaW50
IHRoYXQgZG9lcyBub3QgYWxsb3cgcjkgZHVyaW5nCj4+IHJlZ2lzdGVyIGFsbG9jYXRpb24uCj4+
Cj4+IGdjYy9DaGFuZ2VMb2c6Cj4+Cj4+IAkqIGNvbmZpZy9vcjFrL2NvbnN0cmFpbnRzLm1kICh0
KTogTmV3IGNvbnN0cmFpbnQuCj4+IAkqIGNvbmZpZy9vcjFrL29yMWsuaCAoR09UX1JFR1MpOiBO
ZXcgcmVnaXN0ZXIgY2xhc3MuCj4+IAkqIGNvbmZpZy9vcjFrL29yMWsubWQgKHNldF9nb3RfdG1w
LCBzZXRfZ290KTogVXNlIHQgY29udHJhaW50Lgo+PiAtLS0KPj4gIGdjYy9jb25maWcvb3Ixay9j
b25zdHJhaW50cy5tZCB8IDQgKysrKwo+PiAgZ2NjL2NvbmZpZy9vcjFrL29yMWsuaCAgICAgICAg
IHwgMyArKysKPj4gIGdjYy9jb25maWcvb3Ixay9vcjFrLm1kICAgICAgICB8IDQgKystLQo+PiAg
MyBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Cj4+IGRp
ZmYgLS1naXQgYS9nY2MvY29uZmlnL29yMWsvY29uc3RyYWludHMubWQgYi9nY2MvY29uZmlnL29y
MWsvY29uc3RyYWludHMubWQKPj4gaW5kZXggOGNhYzdlYjUzMjkuLmJhMzMwYzZiOGMyIDEwMDY0
NAo+PiAtLS0gYS9nY2MvY29uZmlnL29yMWsvY29uc3RyYWludHMubWQKPj4gKysrIGIvZ2NjL2Nv
bmZpZy9vcjFrL2NvbnN0cmFpbnRzLm1kCj4+IEBAIC0yNSw2ICsyNSw3IEBACj4+ICA7IFdlIHVz
ZToKPj4gIDsgIGMgLSBzaWJjYWxsIHJlZ2lzdGVycwo+PiAgOyAgZCAtIGRvdWJsZSBwYWlyIGJh
c2UgcmVnaXN0ZXJzIChleGNsdWRlcyByMCwgcjMwIGFuZCByMzEgd2hpY2ggb3ZlcmZsb3cpCj4+
ICs7ICB0IC0gZ290IGFkZHJlc3MgcmVnaXN0ZXJzIChleGNsdWRlcyByOSBpcyBjbG9iYmVyZWQg
Ynkgc2V0X2dvdCkKPiAKPiBJIHdpbGwgY2hhbmdlZSB0aGlzIHRvICguLi4gcjkgd2hpY2ggaXMg
Y2xvYmJlcmVkIC4uLikKPiAKPj4gIDsgIEkgLSBjb25zdGFudCBzaWduZWQgMTYtYml0Cj4+ICA7
ICBLIC0gY29uc3RhbnQgdW5zaWduZWQgMTYtYml0Cj4+ICA7ICBNIC0gY29uc3RhbnQgc2lnbmVk
IDE2LWJpdCBzaGlmdGVkIGxlZnQgMTYtYml0cyAobC5tb3ZoaSkKPj4gQEAgLTM2LDYgKzM3LDkg
QEAKPj4gIChkZWZpbmVfcmVnaXN0ZXJfY29uc3RyYWludCAiZCIgIkRPVUJMRV9SRUdTIgo+PiAg
ICAiUmVnaXN0ZXJzIHdoaWNoIGNhbiBiZSB1c2VkIGZvciBkb3VibGUgcmVnIHBhaXJzLiIpCj4+
ICAKPj4gKyhkZWZpbmVfcmVnaXN0ZXJfY29uc3RyYWludCAidCIgIkdPVF9SRUdTIgo+PiArICAi
UmVnaXN0ZXJzIHdoaWNoIGNhbiBiZSB1c2VkIHRvIHN0b3JlIHRoZSBHbG9iYWwgT2Zmc2V0IFRh
YmxlIChHT1QpIGFkZHJlc3MuIikKPj4gKwo+PiAgOzsgSW1tZWRpYXRlcwo+PiAgKGRlZmluZV9j
b25zdHJhaW50ICJJIgo+PiAgICAiQSBzaWduZWQgMTYtYml0IGltbWVkaWF0ZSBpbiB0aGUgcmFu
Z2UgLTMyNzY4IHRvIDMyNzY3LiIKPj4gZGlmZiAtLWdpdCBhL2djYy9jb25maWcvb3Ixay9vcjFr
LmggYi9nY2MvY29uZmlnL29yMWsvb3Ixay5oCj4+IGluZGV4IDJiMjllNjJmZGQzLi40YzMyNjA3
YmFjMSAxMDA2NDQKPj4gLS0tIGEvZ2NjL2NvbmZpZy9vcjFrL29yMWsuaAo+PiArKysgYi9nY2Mv
Y29uZmlnL29yMWsvb3Ixay5oCj4+IEBAIC0xOTAsNiArMTkwLDcgQEAgZW51bSByZWdfY2xhc3MK
Pj4gICAgTk9fUkVHUywKPj4gICAgU0lCQ0FMTF9SRUdTLAo+PiAgICBET1VCTEVfUkVHUywKPj4g
KyAgR09UX1JFR1MsCj4+ICAgIEdFTkVSQUxfUkVHUywKPj4gICAgRkxBR19SRUdTLAo+PiAgICBB
TExfUkVHUywKPj4gQEAgLTIwMiw2ICsyMDMsNyBAQCBlbnVtIHJlZ19jbGFzcwo+PiAgICAiTk9f
UkVHUyIsIAkJCVwKPj4gICAgIlNJQkNBTExfUkVHUyIsCQlcCj4+ICAgICJET1VCTEVfUkVHUyIs
CQlcCj4+ICsgICJHT1RfUkVHUyIsCQkJXAo+PiAgICAiR0VORVJBTF9SRUdTIiwJCVwKPj4gICAg
IkZMQUdfUkVHUyIsCQkJXAo+PiAgICAiQUxMX1JFR1MiIH0KPj4gQEAgLTIxNSw2ICsyMTcsNyBA
QCBlbnVtIHJlZ19jbGFzcwo+PiAgeyB7IDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAgfSwJXAo+PiAg
ICB7IFNJQkNBTExfUkVHU19NQVNLLCAgIDAgfSwJXAo+PiAgICB7IDB4N2Y3ZmZmZmUsIDB4MDAw
MDAwMDAgfSwJXAo+PiArICB7IDB4ZmZmZmZkZmYsIDB4MDAwMDAwMDAgfSwJXAo+PiAgICB7IDB4
ZmZmZmZmZmYsIDB4MDAwMDAwMDMgfSwJXAo+PiAgICB7IDB4MDAwMDAwMDAsIDB4MDAwMDAwMDQg
fSwJXAo+PiAgICB7IDB4ZmZmZmZmZmYsIDB4MDAwMDAwMDcgfQlcCj4+IGRpZmYgLS1naXQgYS9n
Y2MvY29uZmlnL29yMWsvb3Ixay5tZCBiL2djYy9jb25maWcvb3Ixay9vcjFrLm1kCj4+IGluZGV4
IGNlZTExZDA3OGNjLi4zNmJjZWUzMzZhYiAxMDA2NDQKPj4gLS0tIGEvZ2NjL2NvbmZpZy9vcjFr
L29yMWsubWQKPj4gKysrIGIvZ2NjL2NvbmZpZy9vcjFrL29yMWsubWQKPj4gQEAgLTcwNiw3ICs3
MDYsNyBAQAo+PiAgOzsgc2V0X2dvdCBwYXR0ZXJuIGJlbG93LiAgVGhpcyB3b3JrcyBiZWNhdXNl
IHRoZSBzZXRfZ290X3RtcCBpbnNuIGlzIHRoZQo+PiAgOzsgZmlyc3QgaW5zbiBpbiB0aGUgc3Ry
ZWFtIGFuZCB0aGF0IGl0IGlzbid0IG1vdmVkIGR1cmluZyBSQS4KPj4gIChkZWZpbmVfaW5zbiAi
c2V0X2dvdF90bXAiCj4+IC0gIFsoc2V0IChtYXRjaF9vcGVyYW5kOlNJIDAgInJlZ2lzdGVyX29w
ZXJhbmQiICI9ciIpCj4+ICsgIFsoc2V0IChtYXRjaF9vcGVyYW5kOlNJIDAgInJlZ2lzdGVyX29w
ZXJhbmQiICI9dCIpCj4+ICAJKHVuc3BlY192b2xhdGlsZTpTSSBbKGNvbnN0X2ludCAwKV0gVU5T
UEVDVl9TRVRfR09UKSldCj4+ICAgICIiCj4+ICB7Cj4+IEBAIC03MTUsNyArNzE1LDcgQEAKPj4g
IAo+PiAgOzsgVGhlIGluc24gdG8gaW5pdGlhbGl6ZSB0aGUgR09ULgo+PiAgKGRlZmluZV9pbnNu
ICJzZXRfZ290Igo+PiAtICBbKHNldCAobWF0Y2hfb3BlcmFuZDpTSSAwICJyZWdpc3Rlcl9vcGVy
YW5kIiAiPXIiKQo+PiArICBbKHNldCAobWF0Y2hfb3BlcmFuZDpTSSAwICJyZWdpc3Rlcl9vcGVy
YW5kIiAiPXQiKQo+PiAgCSh1bnNwZWM6U0kgWyhjb25zdF9pbnQgMCldIFVOU1BFQ19TRVRfR09U
KSkKPj4gICAgIChjbG9iYmVyIChyZWc6U0kgTFJfUkVHTlVNKSldCj4+ICAgICIiCj4+IC0tIAo+
PiAyLjIxLjAKPj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpo
dHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
