Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 715E521F831
	for <lists+openrisc@lfdr.de>; Tue, 14 Jul 2020 19:30:53 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1398620CF7;
	Tue, 14 Jul 2020 19:30:53 +0200 (CEST)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by mail.librecores.org (Postfix) with ESMTPS id 8563920CEC
 for <openrisc@lists.librecores.org>; Tue, 14 Jul 2020 19:30:51 +0200 (CEST)
Received: by mail-ot1-f68.google.com with SMTP id 5so13588879oty.11
 for <openrisc@lists.librecores.org>; Tue, 14 Jul 2020 10:30:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M/cNHRoFa4ZZjmVaGoyconZpvhXMck6nqNSnofkb4M4=;
 b=X4vIV/cU+aCS3I6FgNZ3S9M3ttFGuKxprrKrpe3B8UVDAqZ9ydPgGN+hmur6NLpgBV
 zM4f3QOC4gbJFJs/r5cejd30bsrhVQaqU8vkvyFQsXD4RRgzO15undA4gO7AACeAJf7f
 6uXOhKVeCPQsJ/D04a25vQ5Sl8qO/ZUtPNaFBZPhXQdd9Q/G0DPrSGRfXFRPo01rFxpK
 387aNK8QWOVF0ekFicESJ2nshf80dOwfGTMOGwxkQS4oF+NOSaKtg4D68DrAjUn53juq
 Iz0f7hg0ehc60TEtuzZbCX0ixyKsQ1RYk4P3FNxI7gA3UTDNfsYGRH81zx/d4mbXvEDO
 HqQA==
X-Gm-Message-State: AOAM533+eHOz2Fj7DvFfwi4UQaYTETo5f+YIAgpxxTFPW3SSrBpqn30F
 iG+Or8yTJs4TjxbAldccLU3nDw+6CdsifITm27M=
X-Google-Smtp-Source: ABdhPJyjtOKVrskn2k0uotMlFr81PpuggxZ+Bi4Vw/Z+yFlzfzcEe35xF2O5iYz07cLAkDBRX5w969ExRVCIDRcAt/8=
X-Received: by 2002:a9d:1b0d:: with SMTP id l13mr4989325otl.145.1594747850060; 
 Tue, 14 Jul 2020 10:30:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200710062019.28755-1-grandmaster@al2klimov.de>
 <20200713113430.1c1777bb@lwn.net>
 <CAMuHMdXoUME_dCOZP1N0tXyMv61edfNECM4-n4NPa56YbBCncw@mail.gmail.com>
 <20200714074022.24481c73@lwn.net>
In-Reply-To: <20200714074022.24481c73@lwn.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Jul 2020 19:30:38 +0200
Message-ID: <CAMuHMdXMumw9CnMHOc_GJGO0MNsLowTv-wE399BMJveXgTXbLQ@mail.gmail.com>
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

T24gVHVlLCBKdWwgMTQsIDIwMjAgYXQgMzo0MCBQTSBKb25hdGhhbiBDb3JiZXQgPGNvcmJldEBs
d24ubmV0PiB3cm90ZToKPiBPbiBUdWUsIDE0IEp1bCAyMDIwIDA5OjIyOjM5ICswMjAwCj4gR2Vl
cnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6Cj4gPiA+ID4gLSAg
ICAgd2Vic2l0ZSAgICAgICAgIGh0dHA6Ly9vcGVucmlzYy5pbwo+ID4gPiA+ICsgICAgIHdlYnNp
dGUgICAgICAgICBodHRwczovL29wZW5yaXNjLmlvCj4gPiA+ID4gICAgICAgZW1haWwgICAgICAg
ICAgIG9wZW5yaXNjQGxpc3RzLmxpYnJlY29yZXMub3JnCj4gPiA+ID4gICAgICAgPT09PT09PSAg
ICAgICAgID09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gPiA+Cj4gPiA+IEFwcGxpZWQs
IHRoYW5rcy4KPiA+Cj4gPiBJcyB0aGF0IHNpdGUgYWNjZXNzaWJsZSBmb3IgYW55b25lPyBJdCB0
aW1lcyBvdXQgZm9yIG1lLgo+Cj4gV29ya3MgZm9yIG1lLgoKTm93IGl0IGluZGVlZCBkb2VzLgoK
R3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdl
ZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0g
Z2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNo
bmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2lu
ZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlr
ZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRz
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVND
IG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3Rz
LmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
