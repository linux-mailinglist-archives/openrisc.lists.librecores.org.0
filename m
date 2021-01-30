Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 23D67309487
	for <lists+openrisc@lfdr.de>; Sat, 30 Jan 2021 11:38:12 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B6D8420D75;
	Sat, 30 Jan 2021 11:38:11 +0100 (CET)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by mail.librecores.org (Postfix) with ESMTPS id C860220D75
 for <openrisc@lists.librecores.org>; Sat, 30 Jan 2021 11:38:09 +0100 (CET)
Received: by mail-ot1-f42.google.com with SMTP id i20so11214427otl.7
 for <openrisc@lists.librecores.org>; Sat, 30 Jan 2021 02:38:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Oa1dItTmNYKHh5pZMMxxZ+w/cNjCvp3zbGbPpGitjzI=;
 b=g35JXJVcrpPMNkO1oIm7y8Bci3fzPV9p2cvHH/BxNCmQ/RdjGD4SLCINr/QhJuuOTr
 vFnfyw6PO747nDRA9u6q2FkE9GlW0lNQBybviutOtnsKnt+/uZbVrxSNz0Dgj7frTz0/
 KS+aQRQpn7CRh+l2XaRbSon8hgwVoHFQBOuKyauO66jMICO8ktaEtTEYFuYEMjcuspQ8
 o/kqdi7RX6WWGoPURTozojgyWy2RKTGIEHViQGyQEcBTmNB9O+9WhiCJBPZqEp2aaFmF
 esJiiX7lz3+6Q4H9kfu/UmBstJvKmUETKRKhIdt/YU025GoFEw9L7HV6PdrpGC4aYDGT
 gvDw==
X-Gm-Message-State: AOAM53173Qz9UbJCSb7N5N/zSzumXxuJyBcXF8jZFQ/Vme0U3npyLJ/a
 7glEgdm4k4zwOwrJUB4jq6c7g+tYHZT5jshBFuM=
X-Google-Smtp-Source: ABdhPJw3wzLfopSk6lGbIsIPqDvA4bNPP3OSC7KLiyn2sxLU3oC58ZhxZv/Ts6Jv4aL6XloKpg/pRBDqnZEBnR8fG3g=
X-Received: by 2002:a05:6830:1489:: with SMTP id
 s9mr5600635otq.250.1612003088374; 
 Sat, 30 Jan 2021 02:38:08 -0800 (PST)
MIME-Version: 1.0
References: <0b26eda7-229d-3dc9-f2ae-19b9212fb0ea@rwth-aachen.de>
In-Reply-To: <0b26eda7-229d-3dc9-f2ae-19b9212fb0ea@rwth-aachen.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 30 Jan 2021 11:37:57 +0100
Message-ID: <CAMuHMdWcJuBv94pQ-1Bf7QAb6e3=AjSz7GBFCPLqiCJ0CjXjqA@mail.gmail.com>
To: Jan Henrik Weinstock <jan.weinstock@rwth-aachen.de>
Subject: Re: [OpenRISC] [PATCH] openrisc: use device tree to determine
 present cpus
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
Cc: Jonas Bonn <jonas@southpole.se>, Openrisc <openrisc@lists.librecores.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgSmFuLAoKT24gRnJpLCBKYW4gMjksIDIwMjEgYXQgNzozNCBQTSBKYW4gSGVucmlrIFdlaW5z
dG9jawo8amFuLndlaW5zdG9ja0Byd3RoLWFhY2hlbi5kZT4gd3JvdGU6Cj4gVGhpcyBwYXRjaCBw
cm9wb3NlcyB0byB1c2UgdGhlIGRldmljZSB0cmVlIHRvIGRldGVybWluZSB0aGUgcHJlc2VudCBj
cHVzCj4gaW5zdGVhZCBvZiBhc3N1bWluZyBhbGwgQ09ORklHX05SQ1BVUyBhcmUgYWN0dWFsbHkg
cHJlc2VudCBpbiB0aGUgc3lzdGVtLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEhlbnJpayBXZWlu
c3RvY2sgPGphbi53ZWluc3RvY2tAcnd0aC1hYWNoZW4uZGU+CgpUaGFua3MgZm9yIHlvdXIgcGF0
Y2ghCgo+IC0tLSBhL2FyY2gvb3BlbnJpc2Mva2VybmVsL3NtcC5jCj4gKysrIGIvYXJjaC9vcGVu
cmlzYy9rZXJuZWwvc21wLmMKCj4gQEAgLTY4LDE0ICs2OSwyNSBAQCB2b2lkIF9faW5pdCBzbXBf
aW5pdF9jcHVzKHZvaWQpCj4KPiAgIHZvaWQgX19pbml0IHNtcF9wcmVwYXJlX2NwdXModW5zaWdu
ZWQgaW50IG1heF9jcHVzKQo+ICAgewo+IC0gICAgICAgaW50IGk7Cj4gKyAgICAgICB1MzIgY3B1
X2lkOwo+ICsgICAgICAgc3RydWN0IGRldmljZV9ub2RlICpjcHUsICpjcHVzOwo+Cj4gICAgICAg
ICAvKgo+ICAgICAgICAgICogSW5pdGlhbGlzZSB0aGUgcHJlc2VudCBtYXAsIHdoaWNoIGRlc2Ny
aWJlcyB0aGUgc2V0IG9mIENQVXMKPiAgICAgICAgICAqIGFjdHVhbGx5IHBvcHVsYXRlZCBhdCB0
aGUgcHJlc2VudCB0aW1lLgo+ICAgICAgICAgICovCj4gLSAgICAgICBmb3IgKGkgPSAwOyBpIDwg
bWF4X2NwdXM7IGkrKykKPiAtICAgICAgICAgICAgICAgc2V0X2NwdV9wcmVzZW50KGksIHRydWUp
Owo+ICsgICAgICAgY3B1cyA9IG9mX2ZpbmRfbm9kZV9ieV9wYXRoKCIvY3B1cyIpOwo+ICsgICAg
ICAgZm9yX2VhY2hfY2hpbGRfb2Zfbm9kZShjcHVzLCBjcHUpIHsKCmZvcl9lYWNoX29mX2NwdV9u
b2RlKCk/CgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0
CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQg
aWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3
aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEkn
bSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0
aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMg
VG9ydmFsZHMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
T3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBz
Oi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
