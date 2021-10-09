Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 88D564277D3
	for <lists+openrisc@lfdr.de>; Sat,  9 Oct 2021 09:03:34 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 333D8213CC;
	Sat,  9 Oct 2021 09:03:34 +0200 (CEST)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mail.librecores.org (Postfix) with ESMTPS id 7871A2414D
 for <openrisc@lists.librecores.org>; Sat,  9 Oct 2021 09:03:32 +0200 (CEST)
Received: by mail-ed1-f45.google.com with SMTP id d3so17163809edp.3
 for <openrisc@lists.librecores.org>; Sat, 09 Oct 2021 00:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=WlPq7wCpbCOl9rBZRBfNdjY/I4gh+HvxF7w+SFdL9d4=;
 b=hAkcXsMiNBDNeJ9qIBFEM+POw1pGt78N/ewXPoSX7UGMhbuaTqkrW87/BFhdV2jxLn
 xXSFXQb+oTv26UIjjGDdRHPlVrr1JU+M/6+51ZqTKXsDTkx8iZxTUhc67YSaNnFQzSdY
 EIx5+Ztg0bn+u0NR4zuEuKhii4xv0xWvMgJguWw88d66kato94cAOxQfkmbuQo7vLcT/
 ep7lxSTInZyIo0mz7mXuN8TMK+dUwjFRJ2KbgEORcRawUdoilHvE43sz3i3hcxPSVbBk
 k8kMUiC07A51jeQcSZU/BsKoAhVPPwtr03NmSB6tR4WpHJYI4v+zHnEcalcYlgi9dXUp
 Bt+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=WlPq7wCpbCOl9rBZRBfNdjY/I4gh+HvxF7w+SFdL9d4=;
 b=k5hD7CGrI2pKsY23XkyCO8HpG9f2kYEfpsE0nmIZMbRiH0Lfb6bzPqIVVxsftNDlGt
 myk9q5j8zbIXV24CR/3FbCoGSfrUUfYoE3chYhr2gCpS1x8aeA5XeHw1PdXmXfvfu2Oq
 njZNiIwwNIdw5cqFkGM/UzlRfVJ5EwSuFwMXrOZ+49nldF6xReKX4DJC4WJX17tkhCBJ
 Irhu60G4Ww/oqhL7TtWg8hmIJolzOPCFA27q4giOsbUL7SMaOryVpMDQUG9JLl3xkfr0
 ACWE599BsfPY/sJcUKH9o13/Wp5toWvmlpqEzmW4NilQc6C8Y2VDlk4UC/um2KXzNwJx
 K/ug==
X-Gm-Message-State: AOAM530Gz/6N68OJBtAf4VHHCPf6IxmB/hI9mj31wM0rTrZjosF1Z+8b
 U7pZbEu/uhJmnZuSQkP8koeR2HCXLFnUDbOjYhkSZinrRHQ=
X-Google-Smtp-Source: ABdhPJyl5SsghOoMsnJQumrKYHv4JNqGIfxN+HJ1WLf3ub0wyPz5a1piXrVh/HAcLZP7O/bxVEajV0qCeIXOp1g9yTg=
X-Received: by 2002:aa7:db17:: with SMTP id t23mr21048095eds.75.1633763011722; 
 Sat, 09 Oct 2021 00:03:31 -0700 (PDT)
MIME-Version: 1.0
From: Stafford Horne <shorne@gmail.com>
Date: Sat, 9 Oct 2021 16:03:20 +0900
Message-ID: <CAAfxs75J8NTsQtOKav1oSYLF2C-QKPbTYE=E=6fbS6hPO=TsOg@mail.gmail.com>
To: Openrisc <openrisc@lists.librecores.org>
Subject: [OpenRISC] OpenRISC Proposal - Tininess Before Rounding
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
Cc: BAndViG <bandvig@mail.ru>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgQWxsLAoKSSBqdXN0IHBvc3RlZCBhIG5ldyBhcmNoaXRlY3R1cmUgcHJvcG9zYWwgZm9yIG9w
ZW5yaXNjIGhlcmUuIFBsZWFzZQpsZXQgbWUga25vdyB0aGVyZSBhcmUgYW55IGNvbmNlcm5zLiAg
SSB3aWxsIGJlIHVwZGF0aW5nIEdDQyB0byBtYXRjaAp0aGUgIlRpbmluZXNzIEJlZm9yZSBSb3Vu
ZGluZyIgYmVoYXZpb3IuCgpodHRwOi8vb3BlbnJpc2MuaW8vcHJvcG9zYWxzL3AxOC1mcHUtdGlu
aW5lc3MKCkNvbnRlbnRzCiBUaW5pbmVzcyBCZWZvcmUgUm91bmRpbmcgKFAxOCkgMjAyMS0xMC0w
OQoKVGhlIElFRUUgc3RhbmRhcmQgYWxsb3dzIHNwZWNpZnlpbmcgaG93IGRldGVjdGluZyBvZiB0
aW5pbmVzcyBvY2N1cnMuClRpbmluZXNzIGRldGVjdGlvbiBpcyBob3cgdW5kZXJmbG93IGV4Y2Vw
dGlvbnMgYXJlIHRyaWdnZXJlZC4gVGhlcmUKYXJlIHR3byBhbGxvd3MgdHdvIG1ldGhvZCBmb3Ig
ZGV0ZWN0aW5nIHRpbmluZXNzIG9uZSBpcyBiZWZvcmUKcm91bmRpbmcgYW5kIHRoZSBvdGhlciBi
ZWluZyBhZnRlciByb3VuZGluZy4KCkFsbCBGUFUgb3BlcmF0aW9ucyBpbiBhbiBpbXBsZW1lbnRh
dGlvbiBiZSBjb25zaXN0ZW50IGluIGhvdyB0aGlzIGlzCmltcGxlbWVudGVkIHRvIGJlIGNvbXBs
aWFudC4KCkFzIEJBbmRWaUcgaGFzIGFscmVhZHkgdXBkYXRlIHRoZSBpbXBsZW1lbnRhdGlvbnMg
b24gTW9yMWt4IGFuZApNYXJvY2NoaW5vIHRvIG1hdGNoIHRoZSBiZWZvcmUgcm91bmRpbmcgYmVo
YXZpb3I7IHdlIHByb3Bvc2UgdGhhdApPcGVuUklTQyBzcGVjaWZpZXM6CiAgIC0gVGluaW5lc3Mg
dG8gYmUgZGV0ZWN0ZWQgYmVmb3JlIHJvdW5kaW5nCgpUaGlzIHdpbGwgcmVxdWlyZSBjaGFuZ2Vz
IHRvOgogIC0gVGhlIFNQRUMKICAgICAgIFNlY3Rpb24gNC4xMiBGbG9hdGluZyBQb2ludCBDb250
cm9sIFN0YXR1cyBSZWdpc3RlciwgZXh0ZW5kIHRvCmV4cGxhaW4gaG93IGZvciB1bmRlcmZsb3cg
T3BlblJJU0MgZm9sbG93cyB0aGUgdGluaW5lc3MgZGV0ZWN0aW9uCmJlZm9yZSByb3VuZGluZyBw
b2xpY3kgZm9yIGFsbCBvcGVyYXRpb25zLi4KCiAgLSBHQ0MgKGN1cnJlbnRseSBzZXQgdG8gdGlu
aW5lc3MgYWZ0ZXIgcm91bmRpbmcpLCBHbGliYyAodXBkYXRlZCB0bwp0aW5pbmVzcyBiZWZvcmUg
cm91bmRpbmcpCiAgLSBRZW11IHRvIHNwZWNpZnkgdGluaW5lc3MgdG8gYmUgZGV0ZWN0ZWQgYmVm
b3JlIHJvdW5kaW5nLgogIC0gT3RoZXIgc2ltdWxhdG9ycyAoc2ltLCBvcjFrc2ltKS4KICAtICpO
b3RlKiBNb3Ixa3ggYW5kIE1hcm9jY2hpbm8gdmVyaWxvZyBjb3JlcyBhcmUgYWxyZWFkeSB1cGRh
dGVkLgoKLVN0YWZmb3JkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9y
ZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
