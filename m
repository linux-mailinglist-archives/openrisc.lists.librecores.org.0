Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 5A9B42E8767
	for <lists+openrisc@lfdr.de>; Sat,  2 Jan 2021 14:10:14 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D59B220E1C;
	Sat,  2 Jan 2021 14:10:13 +0100 (CET)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 by mail.librecores.org (Postfix) with ESMTPS id 197D7200E4
 for <openrisc@lists.librecores.org>; Sat,  2 Jan 2021 14:10:12 +0100 (CET)
Received: by mail-oi1-f171.google.com with SMTP id d189so26753410oig.11
 for <openrisc@lists.librecores.org>; Sat, 02 Jan 2021 05:10:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fOBlA4nmgbYcLbjWcHo5UvnezZZmpodZaYFnX7DjUAo=;
 b=qd8eKfR5cxuOPSJY0Kxy6KSTmD5jkSiiBzwDz+XBetA2n5A4yeGHLfRbJLx6jpqDgO
 xVKPcSKe4WBBD8Tq8rtNDLPmViZLYdfhULX+IaSQYP/yeqdH5GmM4J3DgR0dj/kkxLpH
 E6/j8TxNFswIHNbLtPJlHV7OupDpM+zCZ0Q15AuCEv/2ku7VeIdQxlirtTqu2kQIFbv0
 PRZonn9XyNZQ9HVilggS9Bv5+0tAaHIxZYobyk3E8cjrk/QN9kpp+c/5Nr+Q5H8r2Bku
 jMrf9eNISBU8A1HcV9jpmXGCx6qszP+bx0MzElHFALrQFynjiln9cmTSL94NbNs6R1wV
 FCBQ==
X-Gm-Message-State: AOAM530So0a38Mo6c5xlrVLll69VbIJL/USaiwUSWtYHlzYFE6xM4daj
 a+c398Ag6lSvg8DALhvuHMktkJTZ5BJzriai9P4=
X-Google-Smtp-Source: ABdhPJzIQy2IpjbeAmLMMeFfB2dnfzRU7PxLTkW66Rjpyl+AhXr6UNO9Ef4yyU2CPgP/t0ZqPa4Ug349X0LTJTi4zz8=
X-Received: by 2002:aca:ec09:: with SMTP id k9mr13074888oih.153.1609593010883; 
 Sat, 02 Jan 2021 05:10:10 -0800 (PST)
MIME-Version: 1.0
References: <20201227091446.118437-1-joel@jms.id.au>
 <20210101061135.GA3106870@lianli.shorne-pla.net>
In-Reply-To: <20210101061135.GA3106870@lianli.shorne-pla.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 2 Jan 2021 14:10:00 +0100
Message-ID: <CAMuHMdU0HKLnmRdBqpfpZpse=SUFCSOS8TnZRgRSmqV0zEMBzQ@mail.gmail.com>
To: Stafford Horne <shorne@gmail.com>
Subject: Re: [OpenRISC] [PATCH] openrisc: restart: Call common handlers
 before hanging
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgU3RhZmZvcmQsCgpPbiBGcmksIEphbiAxLCAyMDIxIGF0IDc6MTEgQU0gU3RhZmZvcmQgSG9y
bmUgPHNob3JuZUBnbWFpbC5jb20+IHdyb3RlOgo+IE9uIFN1biwgRGVjIDI3LCAyMDIwIGF0IDA3
OjQ0OjQ2UE0gKzEwMzAsIEpvZWwgU3RhbmxleSB3cm90ZToKPiA+IEN1cnJlbnRseSBvcGVucmlz
YyB3aWxsIHByaW50IGEgbWVzc2FnZSBhbmQgdGhlbiBoYW5nIGluIGFuIGluZmluaXRlCj4gPiBs
b29wIHdoZW4gcmVib290aW5nLgo+ID4KPiA+IFRoaXMgcGF0Y2ggYWRvcHRzIHNvbWUgY29kZSBm
cm9tIEFSTSwgd2hpY2ggY2FsbHMgdGhlIGNvbW1vbiByZXN0YXJ0Cj4gPiBpbmZyYXN0cnVjdHVy
ZSBhbmQgaGFuZ3MgYWZ0ZXIgYSBzbWFsbCBkZWxheSBpZiB0aGUgcmVzdGFydCBpbmZyYQo+ID4g
ZG9lc24ndCBkbyBhbnl0aGluZy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKb2VsIFN0YW5sZXkg
PGpvZWxAam1zLmlkLmF1Pgo+ID4gLS0tCj4gPiBHZWVydCBoYXMgYSBwYXRjaFsxXSBmb3IgdGhl
IGxpdGV4IHNvYyBjb2RlIHRoYXQgYWRkcyBhIHJlc3RhcnQgaGFuZGVyLgo+ID4gT3BlbnJpc2Mg
ZG9lc24ndCBoaXQgdGhhdCBjb2RlIHBhdGgsIHRoaXMgcGF0Y2ggZml4ZXMgdGhhdC4KPiA+Cj4g
PiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL2dlZXJ0dS9saW51eC9jb21taXQvN2QwOWRjMDc5N2E4
MjA4YTExZWI3YzBjMjE1NmMxYTRjMTIwMTgwZgoKPiA+ICsgICAgIGRvX2tlcm5lbF9yZXN0YXJ0
KGNtZCk7Cj4gQXMgeW91IG1lbnRpb25lZCB0aGlzIGRlcGVuZHMgb24gR2VlcnQncyBwYXRjaC4g
IERvZXMgaGUgcGxhbiB0byBzdWJtaXQgaXQgc29vbj8KCldpbGwgZG8sIG9uY2UgSSBoYXZlIG1h
bmFnZWQgdG8gZXNjYXBlIGZyb20gWG1hcy1hbmQtTlkgbW9kZSA7LSkKCkdye29ldGplLGVldGlu
Z31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2
ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02
OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwg
SSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlz
dHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QK
T3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9y
Zy9saXN0aW5mby9vcGVucmlzYwo=
