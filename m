Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 960D91A0D71
	for <lists+openrisc@lfdr.de>; Tue,  7 Apr 2020 14:20:05 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3334E20928;
	Tue,  7 Apr 2020 14:20:05 +0200 (CEST)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by mail.librecores.org (Postfix) with ESMTPS id 5103720493
 for <openrisc@lists.librecores.org>; Tue,  7 Apr 2020 14:20:03 +0200 (CEST)
Received: by mail-pl1-f194.google.com with SMTP id e1so1181752plt.9
 for <openrisc@lists.librecores.org>; Tue, 07 Apr 2020 05:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=R4hvZR8SPgpRXTOdJt4oRMxXYe8DMEbopd6JEn/rddg=;
 b=NLanvurQ+ZPjNlsHq1Eqo37ceC0rWKMgTTjMn9f1vBeiiXkP24I5O/82bQeGy/l7Eo
 yMKva0N79AFo5oGBvW4HgRB/ROUCognwcHld7nmzH67RzRIUte3JNDxBarqioqw3mtyl
 A70iziS5ofFmI47r0S0PMZI1gDHHUfyABy8iqGsnOzX39utmk6JYQIbsp5ByzXlc2xzY
 KdhYzd0opCH2t8PAZm0H1t9hlGlh5eU4UOL8bylNF7Z4KVwjRZUk3wYQtiuID5WREagO
 vsMhbg0gLx/nAFBg/VY0BgOm2Sod4FFDEGTDJJSZnChEmBw2jxQJeSNv89zs9in8sSn2
 rPcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=R4hvZR8SPgpRXTOdJt4oRMxXYe8DMEbopd6JEn/rddg=;
 b=Itw/4VWfD4i4Rebj1AvVNgCU4dQE30R32dZ2+ws1s797hXEB5CtMd94+MubUE4BWFo
 Hecp4hp3NzLXTamkfqo5qiB1/AX1Iv+kwQ76/U/lHSjzeiV2FaynRCaxoP4R8Y/5dByI
 hy6yoAa1wsTe60hzabbWjSLpp8p133gXwiRNzDjzJFSkJcM+6O9IeAccb/PZFUqdbNek
 xoolx0Ke/UOy8xxPPYH/ePSeNyT2Zk/9ifpjb6+2kIZMkUbGi8oI88hoONzstdQCbuJp
 TwBIw5zILBqXnQ8b6PKaueCJbJyD5LrkMNWWFTN+XHBBgTiRJcQU7uATCrseoppZPZuM
 FkqA==
X-Gm-Message-State: AGi0PuYQZhgvNeI6QfzW/g9LgGKDVHcyTgmT/XDSnpyokgcipXkVteyQ
 95dQAuwn9Ws89J9c53xHuPM=
X-Google-Smtp-Source: APiQypJQMPX3R8hhbCk3y5ITo4/ipXEOgqTDUwx9oTXuJ3PEI8hMJEPkPisA9p4FuU+QC8Ynj93LrQ==
X-Received: by 2002:a17:90a:c392:: with SMTP id
 h18mr2488966pjt.89.1586262001848; 
 Tue, 07 Apr 2020 05:20:01 -0700 (PDT)
Received: from localhost (g54.222-224-167.ppp.wakwak.ne.jp. [222.224.167.54])
 by smtp.gmail.com with ESMTPSA id
 r70sm13926024pfr.116.2020.04.07.05.20.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2020 05:20:01 -0700 (PDT)
Date: Tue, 7 Apr 2020 21:19:58 +0900
From: Stafford Horne <shorne@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20200407121958.GQ7926@lianli.shorne-pla.net>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [OpenRISC] [GIT PULL] OpenRISC updates for v5.6
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
Cc: Openrisc <openrisc@lists.librecores.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RXIsIFNvcnJ5LCB0aGlzIHNob3VsZCBiZSBmb3IgNS43LgoKSSB3YXMgYSBiaXQgY29uZnVzZWQg
YmVjYXVzZSBvZiBvdGhlciB0aGluZ3MgZ29pbmcgb24uICBMZXQgbWUga25vdyBpZiB5b3UgYXJl
Cm9rIHdpdGggdGhpcyBvciBuZWVkIGEgbmV3IHRhZy4gIEl0IHNob3VsZCBhcHBseSBqdXN0IGZp
bmUgZm9yIDUuNy4KCi1TdGFmZm9yZAoKT24gVHVlLCBBcHIgMDcsIDIwMjAgYXQgMDk6MTY6MTVQ
TSArMDkwMCwgU3RhZmZvcmQgSG9ybmUgd3JvdGU6Cj4gSGkgTGludXMsCj4gCj4gUGxlYXNlIGNv
bnNpZGVyIHB1bGxpbmcuLi4KPiAKPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0
IGQ1MjI2ZmE2ZGJhZTA1NjllZTQzZWNmYzA4YmRjZDY3NzBmYzQ3NTU6Cj4gCj4gICBMaW51eCA1
LjUgKDIwMjAtMDEtMjYgMTY6MjM6MDMgLTA4MDApCj4gCj4gYXJlIGF2YWlsYWJsZSBpbiB0aGUg
R2l0IHJlcG9zaXRvcnkgYXQ6Cj4gCj4gICBnaXQ6Ly9naXRodWIuY29tL29wZW5yaXNjL2xpbnV4
LmdpdCB0YWdzL2Zvci1saW51cwo+IAo+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA5
NzM3ZTJjNWYwYmM3NjhiNTg0MTZlYzA3MGJkOTZjOTFjNTJhMTUzOgo+IAo+ICAgb3BlbnJpc2M6
IFJlbW92ZSBvYnNvbGV0ZSBzaG93X3RyYWNlX3Rhc2sgZnVuY3Rpb24gKDIwMjAtMDMtMTggMjI6
MTA6NDQgKzA5MDApCj4gCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IE9wZW5SSVNDIHVwZGF0ZXMgZm9yIDUuNgo+IAo+
IEEgZmV3IGNsZWFudXBzIGFsbCBvdmVyIHRoZSBwbGFjZSwgdGhpbmdzIG9mIG5vdGU6Cj4gIC0g
RW5hYmxlIHRoZSBjbG9uZTMgc3lzY2FsbAo+ICAtIFJlbW92ZSBDT05GSUdfQ1JPU1NfQ09NUElM
RSBmcm9tIEtyenlzenRvZiBLb3psb3dza2kKPiAgLSBVcGRhdGUgdG8gdXNlIG1tZ3JhYiBmcm9t
IEp1bGlhIExhd2FsbAo+IAo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBKdWxpYSBMYXdhbGwgKDEpOgo+ICAgICAgIG9w
ZW5yaXNjOiB1c2UgbW1ncmFiCj4gCj4gS3J6eXN6dG9mIEtvemxvd3NraSAoMSk6Cj4gICAgICAg
b3BlbnJpc2M6IGNvbmZpZ3M6IENsZWFudXAgQ09ORklHX0NST1NTX0NPTVBJTEUKPiAKPiBTdGFm
Zm9yZCBIb3JuZSAoNCk6Cj4gICAgICAgb3BlbnJpc2M6IENvbnZlcnQgY29weV90aHJlYWQgdG8g
Y29weV90aHJlYWRfdGxzCj4gICAgICAgb3BlbnJpc2M6IEVuYWJsZSB0aGUgY2xvbmUzIHN5c2Nh
bGwKPiAgICAgICBvcGVucmlzYzogQ2xlYW51cCBjb3B5X3RocmVhZF90bHMgZG9jcyBhbmQgY29t
bWVudHMKPiAgICAgICBvcGVucmlzYzogUmVtb3ZlIG9ic29sZXRlIHNob3dfdHJhY2VfdGFzayBm
dW5jdGlvbgo+IAo+ICBEb2N1bWVudGF0aW9uL29wZW5yaXNjL29wZW5yaXNjX3BvcnQucnN0ICAg
fCAgNCArKy0tCj4gIGFyY2gvb3BlbnJpc2MvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICB8
ICAxICsKPiAgYXJjaC9vcGVucmlzYy9jb25maWdzL29yMWtzaW1fZGVmY29uZmlnICAgIHwgIDEg
LQo+ICBhcmNoL29wZW5yaXNjL2NvbmZpZ3Mvc2ltcGxlX3NtcF9kZWZjb25maWcgfCAgMSAtCj4g
IGFyY2gvb3BlbnJpc2MvaW5jbHVkZS91YXBpL2FzbS91bmlzdGQuaCAgICB8ICAxICsKPiAgYXJj
aC9vcGVucmlzYy9rZXJuZWwvcHJvY2Vzcy5jICAgICAgICAgICAgIHwgMTggKysrKysrLS0tLS0t
LS0tLS0tCj4gIGFyY2gvb3BlbnJpc2Mva2VybmVsL3NtcC5jICAgICAgICAgICAgICAgICB8ICAz
ICsrLQo+ICBhcmNoL29wZW5yaXNjL2tlcm5lbC90cmFwcy5jICAgICAgICAgICAgICAgfCAgNyAt
LS0tLS0tCj4gIDggZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMjQgZGVsZXRpb25z
KC0pCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5S
SVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xp
c3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
