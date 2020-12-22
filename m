Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A150F2E2931
	for <lists+openrisc@lfdr.de>; Fri, 25 Dec 2020 00:15:31 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C410D20ED1;
	Fri, 25 Dec 2020 00:15:30 +0100 (CET)
Received: from conssluserg-02.nifty.com (conssluserg-02.nifty.com
 [210.131.2.81])
 by mail.librecores.org (Postfix) with ESMTPS id 508FA20F8E
 for <openrisc@lists.librecores.org>; Tue, 22 Dec 2020 07:34:43 +0100 (CET)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id 0BM6YbZq005334
 for <openrisc@lists.librecores.org>; Tue, 22 Dec 2020 15:34:37 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 0BM6YbZq005334
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1608618877;
 bh=fcWPiycUMYEZvg5xTDlQrU/QzmMQoGbU9q5Hj80KmkE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DjNLHAKtl0GUcyHQMFYpgj7G2I7JahTPveWcelwIOt6w9unHcxMD2uW1LdfQn36Oz
 UuS7eOjTDyZ2nPUe95drK+taPKM7LtgSqi0s9GlW3uJ2OlrW/nRQEmMnmppZnYsw5H
 pi68Bhz5kp6EeGva5zW5jT+a8sWY0G5rZEWIF0xduDCslvq6o37hw6w4Gl+INXSOXy
 8s97/tJiQc5qSjh5XigGuqsY3Nm+Qo+Ytzveq+FqJf9elaEZFpsYJGqZZQKEx1b813
 4UYQfy7FweAODdwFXlaJ7legfIf0e2xY0uHtVld0oQpiQYQmrZoryVhBb5L2n7Kc3u
 WGA5XXm7AKiSw==
X-Nifty-SrcIP: [209.85.214.173]
Received: by mail-pl1-f173.google.com with SMTP id x18so6919314pln.6
 for <openrisc@lists.librecores.org>; Mon, 21 Dec 2020 22:34:37 -0800 (PST)
X-Gm-Message-State: AOAM530SUDzxB7Qmz8rDgkTiufGKaw5FWWtWNE5DSlEBT2A7+RJRAddr
 OX7Yu4A4BurIOwHuSQz22k+PYAfng2+D1Adksq4=
X-Google-Smtp-Source: ABdhPJxmSLvlNRX7lmhEqGm+zyQSpGmhZhXx/5EOUzb2pTZvI0QAFZzlfaKqi1UeQ0+uN4ys1Vd51YkBKjjx31oVLos=
X-Received: by 2002:a17:90a:fa0c:: with SMTP id
 cm12mr21001610pjb.87.1608618876748; 
 Mon, 21 Dec 2020 22:34:36 -0800 (PST)
MIME-Version: 1.0
References: <20201222061805.462460-1-joel@jms.id.au>
In-Reply-To: <20201222061805.462460-1-joel@jms.id.au>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 22 Dec 2020 15:34:00 +0900
X-Gmail-Original-Message-ID: <CAK7LNATHTT2=e0VxxunLhAGP5yDeGcdunxgp2Ne_P1kRAifecg@mail.gmail.com>
Message-ID: <CAK7LNATHTT2=e0VxxunLhAGP5yDeGcdunxgp2Ne_P1kRAifecg@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
X-Mailman-Approved-At: Fri, 25 Dec 2020 00:15:22 +0100
Subject: Re: [OpenRISC] [PATCH] openrisc: Add vmlinux.bin target
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
Cc: Jonas Bonn <jonas@southpole.se>, Mateusz Holenko <mholenko@antmicro.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 openrisc@lists.librecores.org, Karol Gugala <kgugala@antmicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBEZWMgMjIsIDIwMjAgYXQgMzoxOCBQTSBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlk
LmF1PiB3cm90ZToKPgo+IEJ1aWxkIGl0IGJ5IGRlZmF1bHQuIFRoaXMgaXMgY29tbW9ubHkgdXNl
ZCBieSBmcGdhIHRhcmdldHMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKb2VsIFN0YW5sZXkgPGpvZWxA
am1zLmlkLmF1Pgo+IC0tLQo+ICBhcmNoL29wZW5yaXNjL01ha2VmaWxlICAgICAgfCA3ICsrKysr
KysKPiAgYXJjaC9vcGVucmlzYy9ib290L01ha2VmaWxlIHwgOCArKysrKysrKwo+ICAyIGZpbGVz
IGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvb3Bl
bnJpc2MvYm9vdC9NYWtlZmlsZQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJpc2MvTWFrZWZp
bGUgYi9hcmNoL29wZW5yaXNjL01ha2VmaWxlCj4gaW5kZXggYmYxMDE0MWM3NDI2Li4yMzliY2Ey
ZDE5MjUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9vcGVucmlzYy9NYWtlZmlsZQo+ICsrKyBiL2FyY2gv
b3BlbnJpc2MvTWFrZWZpbGUKPiBAQCAtMjQsNiArMjQsMTAgQEAgTElCR0NDICAgICAgICAgICAg
ICAgOj0gJChzaGVsbCAkKENDKSAkKEtCVUlMRF9DRkxBR1MpIC1wcmludC1saWJnY2MtZmlsZS1u
YW1lKQo+Cj4gIEtCVUlMRF9DRkxBR1MgICs9IC1waXBlIC1mZml4ZWQtcjEwIC1EX19saW51eF9f
Cj4KPiArYWxsOiB2bWxpbnV4LmJpbgo+ICsKPiArYm9vdCA6PSBhcmNoLyQoQVJDSCkvYm9vdAo+
ICsKPiAgaWZlcSAoJChDT05GSUdfT1BFTlJJU0NfSEFWRV9JTlNUX01VTCkseSkKPiAgICAgICAg
IEtCVUlMRF9DRkxBR1MgKz0gJChjYWxsIGNjLW9wdGlvbiwtbWhhcmQtbXVsKQo+ICBlbHNlCj4g
QEAgLTQ5LDMgKzUzLDYgQEAgZWxzZQo+ICBCVUlMVElOX0RUQiA6PSBuCj4gIGVuZGlmCj4gIGNv
cmUtJChCVUlMVElOX0RUQikgKz0gYXJjaC9vcGVucmlzYy9ib290L2R0cy8KPiArCgpTaW5jZSB2
bWxpbnV4LmJpbiBpcyBhIHBob255IHRhcmdldCwgeW91IG5lZWQgdGhpczoKClBIT05ZICs9IHZt
bGludXguYmluCgoKPiArdm1saW51eC5iaW46IHZtbGludXgKPiArICAgICAgICQoUSkkKE1BS0Up
ICQoYnVpbGQpPSQoYm9vdCkgJChwYXRzdWJzdCAlLCQoYm9vdCkvJSwkQCkKCgpUaGlzIGlzIHNp
bXBsZXI6CgogICAgICAgICAgJChRKSQoTUFLRSkgJChidWlsZCk9JChib290KSAkKGJvb3QpLyRA
CgoKCkZvciBjbGVhbi11cCwgeW91IG5lZWQgdGhpczoKCmFyY2hjbGVhbjoKICAgICAgICAkKFEp
JChNQUtFKSAkKGNsZWFuKT0kKGJvb3QpCgoKCgoKCj4gZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJp
c2MvYm9vdC9NYWtlZmlsZSBiL2FyY2gvb3BlbnJpc2MvYm9vdC9NYWtlZmlsZQo+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi4wZTcxZThmNzhiYjIKPiAtLS0gL2Rl
di9udWxsCj4gKysrIGIvYXJjaC9vcGVucmlzYy9ib290L01ha2VmaWxlCj4gQEAgLTAsMCArMSw4
IEBACj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiArIwo+ICsjIE1ha2Vm
aWxlIGZvciBib290YWJsZSBrZXJuZWwgaW1hZ2VzCj4gKyMKPiArCj4gK09CSkNPUFlGTEFHU192
bWxpbnV4LmJpbiA6PSAtTyBiaW5hcnkKPiArJChvYmopL3ZtbGludXguYmluOiB2bWxpbnV4IEZP
UkNFCj4gKyAgICAgICAkKGNhbGwgaWZfY2hhbmdlZCxvYmpjb3B5KQoKUGxlYXNlIGFkZAoKdGFy
Z2V0cyArPSB2bWxpbnV4LmJpbgoKCgoKQWxzbywgeW91IG5lZWQgdG8gYWRkIGFyY2gvb3BlbnJp
c2MvYm9vdC8uZ2l0aWdub3JlCgoKCgo+IC0tCj4gMi4yOS4yCj4KCgotLSAKQmVzdCBSZWdhcmRz
Ck1hc2FoaXJvIFlhbWFkYQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5v
cmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
