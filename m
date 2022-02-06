Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 56DEE4AAEA0
	for <lists+openrisc@lfdr.de>; Sun,  6 Feb 2022 10:43:02 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D6DA22431F;
	Sun,  6 Feb 2022 10:43:01 +0100 (CET)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47])
 by mail.librecores.org (Postfix) with ESMTPS id EAA2A242CD
 for <openrisc@lists.librecores.org>; Sun,  6 Feb 2022 10:42:59 +0100 (CET)
Received: by mail-ua1-f47.google.com with SMTP id c36so18154198uae.13
 for <openrisc@lists.librecores.org>; Sun, 06 Feb 2022 01:42:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n5FeNV6IoX1x8bGptsyCBCGGVwBQsutgr12XFlQJxbY=;
 b=7ZSvO+ULlZzLutE+1+gvpbK6LirnyVD/c3oPpQN5/AUc+W2Ved4N+sFI4AD4YGbddo
 KLkSlIfizRGO/Wr2zP+A9QOWeFCf07aAAHdT6jiJbYW+KSgTUGaLEH1kBGtvx8FGKliR
 BmUUG1bzwVPoJj9McCGELVVuDmczpBgskJEsSv/zkAFlDzLIMqBJL4C1E24IKDUrEQMP
 VYnhy/rwkwzPZTmtZJPRBTbNRXwHV6ZACIQK7l95PlixVU9bWnE6dGm8DXogY2GkJlOB
 x+lqF3TaJDXKNkh8vGqiXdby9K30/pn95d7XHhi+Go7dR+SVzQ0iwgDsoAo1Ve816NYZ
 fHqw==
X-Gm-Message-State: AOAM532Jo+pU7bcSy4gaZw01N83/lSedLBEfvVzqvojQyP4grFRr6RLj
 YTFwls9/KjRFQX7QFbQbfX5Pk9C8IFKlcA==
X-Google-Smtp-Source: ABdhPJz8ffZvyRPXMm0X54E3sj+A5eNJv7ZycaDDX6A66Lr7CiZ4Cx7QHyhrRML2ardIqOdSYcOcpQ==
X-Received: by 2002:a67:c09e:: with SMTP id x30mr2947274vsi.55.1644140578637; 
 Sun, 06 Feb 2022 01:42:58 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com.
 [209.85.222.53])
 by smtp.gmail.com with ESMTPSA id w6sm2152995uap.12.2022.02.06.01.42.58
 for <openrisc@lists.librecores.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Feb 2022 01:42:58 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id f13so5902176uab.10
 for <openrisc@lists.librecores.org>; Sun, 06 Feb 2022 01:42:58 -0800 (PST)
X-Received: by 2002:a67:5f83:: with SMTP id t125mr3001774vsb.68.1644140577849; 
 Sun, 06 Feb 2022 01:42:57 -0800 (PST)
MIME-Version: 1.0
References: <20220206013648.3491865-1-shorne@gmail.com>
In-Reply-To: <20220206013648.3491865-1-shorne@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 6 Feb 2022 10:42:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW2bxEtaYaLN28xk2uc=OV0ecUy-N_+Ay193gZq4nH0jw@mail.gmail.com>
Message-ID: <CAMuHMdW2bxEtaYaLN28xk2uc=OV0ecUy-N_+Ay193gZq4nH0jw@mail.gmail.com>
To: Stafford Horne <shorne@gmail.com>
Subject: Re: [OpenRISC] [PATCH] openrisc: remove CONFIG_SET_FS
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
Cc: Jonas Bonn <jonas@southpole.se>, Arnd Bergmann <arnd@arndb.de>,
 Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>,
 Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgU3RhZmZvcmQsCgpUaGFua3MgZm9yIHlvdXIgcGF0Y2ghCgpPbiBTdW4sIEZlYiA2LCAyMDIy
IGF0IDI6MzcgQU0gU3RhZmZvcmQgSG9ybmUgPHNob3JuZUBnbWFpbC5jb20+IHdyb3RlOgo+IFJl
bW92ZSB0aGUgYWRkcmVzcyBzcGFjZSBvdmVycmlkZSBBUEkgc2V0X2ZzKCkgdXNlZCBmb3IgVXNl
ciBNb2RlIExpbnV4LgoKTm90ZTogdGhpcyBkb2Vzbid0IGhhdmUgYW55dGhpbmcgdG8gZG8gd2l0
aCBVTUwuLi4KCj4gVXNlciBhZGRyZXNzIHNwYWNlIGlzIG5vdyBsaW1pdGVkIHRvIFRBU0tfU0la
RS4KPgo+IFRvIHN1cHBvcnQgdGhpcyB3ZSBpbXBsZW1lbnQgYW5kIHdpcmUgaW4gX19nZXRfa2Vy
bmVsX25vZmF1bHQgYW5kCj4gX19zZXRfa2VybmVsX25vZmF1bHQuCj4KPiBUaGUgZnVuY3Rpb24g
dXNlcl9hZGRyX21heCBpcyByZW1vdmVkIGFzIHRoZXJlIGlzIGEgZGVmYXVsdCBkZWZpbml0aW9u
Cj4gcHJvdmlkZWQgd2hlbiBDT05GSUdfU0VUX0ZTIGlzIG5vdCB1c2VkLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogU3RhZmZvcmQgSG9ybmUgPHNob3JuZUBnbWFpbC5jb20+CgpHcntvZXRqZSxlZXRpbmd9
cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLQpHZWVydCBVeXR0ZXJob2V2ZW4g
LS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsu
b3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBj
YWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMg
SSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3Bl
blJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9s
aXN0aW5mby9vcGVucmlzYwo=
