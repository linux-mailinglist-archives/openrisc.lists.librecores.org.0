Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id EE7C221E9F7
	for <lists+openrisc@lfdr.de>; Tue, 14 Jul 2020 09:22:53 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A20AA20CAD;
	Tue, 14 Jul 2020 09:22:53 +0200 (CEST)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by mail.librecores.org (Postfix) with ESMTPS id C3F512090C
 for <openrisc@lists.librecores.org>; Tue, 14 Jul 2020 09:22:51 +0200 (CEST)
Received: by mail-ot1-f68.google.com with SMTP id g37so12300351otb.9
 for <openrisc@lists.librecores.org>; Tue, 14 Jul 2020 00:22:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zQc3b3cEG4qoV3UIOktn0Ijwe/EIk3WLKFZosqYyBVs=;
 b=ctIIAjkpdA+oa7atv9tfEz0oa3Gc8yk1d8wo/iloBPvgNDdyHS0Qp+Fx+90pGFRV7S
 TwZWPfkohj3G+mznqt1A5kQOe/gWtmxxbJmvz/+/eNso/4zK4kFgnPYu0++5FdXUDWdA
 dL3XcUp5tcB9YGfQFChV6OXfJTpr+if0Y2Ni27lPOvU0BTU/iRCCP6MlVBJVVdJyVoHg
 xCa/u6bc8dUh8rlaSK6Rx6BmrMIpFHhQ9eo9VPl/kXDWH6cErTH7LhEAb/hVd+RyoQmP
 yo6EmfAxo5pvL/riU1Lh8/TjRde7GPIW+y7Lw31OMjjls7M/teg1XODWAJfyGxIxvd+F
 xF+A==
X-Gm-Message-State: AOAM533Vk4yQ53N67v8Dhqtx3Gxmy7c9+saxcc+OX1geMCBvMiVVD0RU
 x76+YCxbzjuriHFBq3rLokFjolTj0SFCLLuFE44=
X-Google-Smtp-Source: ABdhPJz1sAOdS6D9PESw3CKqn8GGA2iUl9nNfnBianI8jxVmwEadGYyk0M5nb2M82d5LxVc36lQQSerNhEHLzoOzfSM=
X-Received: by 2002:a9d:1b0d:: with SMTP id l13mr2887577otl.145.1594711370357; 
 Tue, 14 Jul 2020 00:22:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200710062019.28755-1-grandmaster@al2klimov.de>
 <20200713113430.1c1777bb@lwn.net>
In-Reply-To: <20200713113430.1c1777bb@lwn.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Jul 2020 09:22:39 +0200
Message-ID: <CAMuHMdXoUME_dCOZP1N0tXyMv61edfNECM4-n4NPa56YbBCncw@mail.gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Subject: Re: [OpenRISC] [PATCH] OPENRISC ARCHITECTURE: Replace HTTP links
 with HTTPS ones
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
Cc: Jonas Bonn <jonas@southpole.se>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Openrisc <openrisc@lists.librecores.org>,
 "Alexander A. Klimov" <grandmaster@al2klimov.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBKdWwgMTMsIDIwMjAgYXQgNzozNyBQTSBKb25hdGhhbiBDb3JiZXQgPGNvcmJldEBs
d24ubmV0PiB3cm90ZToKPiBPbiBGcmksIDEwIEp1bCAyMDIwIDA4OjIwOjE5ICswMjAwCj4gIkFs
ZXhhbmRlciBBLiBLbGltb3YiIDxncmFuZG1hc3RlckBhbDJrbGltb3YuZGU+IHdyb3RlOgo+ID4g
IERvY3VtZW50YXRpb24vb3BlbnJpc2Mvb3BlbnJpc2NfcG9ydC5yc3QgfCAyICstCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vb3BlbnJpc2Mvb3BlbnJpc2NfcG9ydC5yc3QgYi9Eb2N1bWVu
dGF0aW9uL29wZW5yaXNjL29wZW5yaXNjX3BvcnQucnN0Cj4gPiBpbmRleCA0YjJjNDM3OTQyYTAu
LjY1N2FjNGFmN2JlNiAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vb3BlbnJpc2Mvb3Bl
bnJpc2NfcG9ydC5yc3QKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vb3BlbnJpc2Mvb3BlbnJpc2Nf
cG9ydC5yc3QKPiA+IEBAIC04LDcgKzgsNyBAQCB0YXJnZXQgYXJjaGl0ZWN0dXJlLCBzcGVjaWZp
Y2FsbHksIGlzIHRoZSAzMi1iaXQgT3BlblJJU0MgMTAwMCBmYW1pbHkgKG9yMWspLgo+ID4gIEZv
ciBpbmZvcm1hdGlvbiBhYm91dCBPcGVuUklTQyBwcm9jZXNzb3JzIGFuZCBvbmdvaW5nIGRldmVs
b3BtZW50Ogo+ID4KPiA+ICAgICAgID09PT09PT0gICAgICAgICA9PT09PT09PT09PT09PT09PT09
PT09PT09PT09PQo+ID4gLSAgICAgd2Vic2l0ZSAgICAgICAgIGh0dHA6Ly9vcGVucmlzYy5pbwo+
ID4gKyAgICAgd2Vic2l0ZSAgICAgICAgIGh0dHBzOi8vb3BlbnJpc2MuaW8KPiA+ICAgICAgIGVt
YWlsICAgICAgICAgICBvcGVucmlzY0BsaXN0cy5saWJyZWNvcmVzLm9yZwo+ID4gICAgICAgPT09
PT09PSAgICAgICAgID09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4KPiBBcHBsaWVkLCB0
aGFua3MuCgpJcyB0aGF0IHNpdGUgYWNjZXNzaWJsZSBmb3IgYW55b25lPyBJdCB0aW1lcyBvdXQg
Zm9yIG1lLgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVy
dAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25k
IGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMg
d2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJ
J20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21l
dGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVz
IFRvcnZhbGRzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Ck9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRw
czovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
