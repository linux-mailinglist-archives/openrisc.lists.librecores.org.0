Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D15571DA2FC
	for <lists+openrisc@lfdr.de>; Tue, 19 May 2020 22:43:04 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 434C920B75;
	Tue, 19 May 2020 22:43:04 +0200 (CEST)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by mail.librecores.org (Postfix) with ESMTPS id 89BB620918
 for <openrisc@lists.librecores.org>; Tue, 19 May 2020 22:43:02 +0200 (CEST)
Received: by mail-pf1-f193.google.com with SMTP id x13so439263pfn.11
 for <openrisc@lists.librecores.org>; Tue, 19 May 2020 13:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dYfPhVVLdYFoku/AOrgIPBaUBy3m/WnC6xhTxs25lNo=;
 b=MHijuyMggPXENrkjb04CM1q/UBuLsHNzfYDXrLcbScsf585yf/+tmVV2RcP2USSiZe
 Exerm3oxen/ZaOYFYsoltmXig1vH76lhRWhngVWSPfUPwTNKKMEMqXnLhtZV2dMdL9IH
 9WL7l62w1bi1f5FjrC3/bqHV0fwZ9ymlDUqw2RR4aNK60JdU3vwWVeQUhckC/Tyatx3Q
 DIxYU0XSf/JlASAV9/IlRgY4QPYLO5tS3VA8Q7wR9hmoc4uFrSwFkTF9xZPkSMIVciUq
 NmWp6ESWm9JcihnRhR4+9PyZ0Z/l1TRLQ0d6Levx1JVbP/Srt0ddKJPuAWcIjCmhhe8O
 Ebeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dYfPhVVLdYFoku/AOrgIPBaUBy3m/WnC6xhTxs25lNo=;
 b=S8qjbk9NHgsUJ86IeZj1rSE4u8x0T5oJ+yz/qQ+JHVD+342Qmgt8iBC4ONFPmxdPcu
 AJJ11l7TMK8P05peabQrfng3Ja/LJQNIlvbSrIHZZZ4AKy7bIhh4XuPD6B8gaMc1B4Hd
 aZZ+N13t0xcoMCadDa3ZpUKKmogfEpcRQs99emoaAzpRLa4qUXk/4iRy4si7HDkDvjIK
 fuiMWkraPX5U0C2YNoOWbkyKR+ejq28I9ucHQO3fZ6zom5bhcyh0B7krhqvjpr0NJ1Yc
 DzHJQlQVQ1BpZstBs8RAqTD9Ef1RU57TE34zJut9OKgzJwB5hyrsLO2AwPrfqljLrgXC
 wBIQ==
X-Gm-Message-State: AOAM530pFwgT15W6YmfAsvJulOi8JJtgQoZc2DVWM73kIwlG82p2QVEV
 hnc0L25gOHi2BAOG/WHdBWs=
X-Google-Smtp-Source: ABdhPJwKB8pkrNkxg+oO6vu8BUIa9CC0X2QWb6VdtxCv9IEASEa8vOLuALCQZY9w+Qwq6sASJGWh+Q==
X-Received: by 2002:a63:d547:: with SMTP id v7mr914924pgi.413.1589920981028;
 Tue, 19 May 2020 13:43:01 -0700 (PDT)
Received: from localhost (g216.222-224-245.ppp.wakwak.ne.jp. [222.224.245.216])
 by smtp.gmail.com with ESMTPSA id 3sm325265pfo.27.2020.05.19.13.42.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 13:43:00 -0700 (PDT)
Date: Wed, 20 May 2020 05:42:57 +0900
From: Stafford Horne <shorne@gmail.com>
To: Nick Clifton <nickc@redhat.com>
Message-ID: <20200519204257.GC2553@lianli.shorne-pla.net>
References: <20200514210018.2749462-1-shorne@gmail.com>
 <2c2a4907-bb08-a112-e716-bf6f2cef3642@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2c2a4907-bb08-a112-e716-bf6f2cef3642@redhat.com>
Subject: Re: [OpenRISC] [PATCH 0/8] OpenRISC BFD fixups for Glibc
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
 GNU Binutils <binutils@sourceware.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBNYXkgMTksIDIwMjAgYXQgMDI6MzA6MDZQTSArMDEwMCwgTmljayBDbGlmdG9uIHdy
b3RlOgo+IEhpIFN0YWZmb3JkLAo+IAo+ID4gU3RhZmZvcmQgSG9ybmUgKDgpOgo+ID4gICBvcjFr
OiBGaXggc3RhdGljIGxpbmtpbmcgd2hlbiB3aXRoIC5yZWxhLmdvdCByZWxvY2F0aW9ucwo+ID4g
ICBvcjFrOiBGaXggZHluYW1pYyBUTFMgc3ltYm9sIGZsYWcKPiA+ICAgb3IxazogQWRkIFRMUyBt
YXNrIHRvIGhhbmRsZSBtdWx0aXBsZSBtb2RlbCBhY2Nlc3MKPiA+ICAgb3IxazogRml4IGlzc3Vl
IHdpdGggbXVsdGlwbGUgUENSRUwgcmVsb2NhdGlvbnMKPiA+ICAgb3IxazogVExTIG9mZnNldCB0
byB1c2UgdGNiIHNpemUgYW5kIHNlY3Rpb24gYWxpZ25tZW50Cj4gPiAgIG9yMWs6IHJlZmFjdG9y
OiBSZW5hbWUgcCB0byBzZWNfcmVsb2NzCj4gPiAgIG9yMWs6IHJlZmFjdG9yOiBSZW5hbWUgcyB0
byBzZ290IGFuZCBzcGx0Cj4gPiAgIG9yMWs6IEFkZCBkeW5hbWljIGZsYWcgdG8gdHBvZmYKPiAK
PiBQYXRjaCBzZXJpZXMgYXBwcm92ZWQgYW5kIGFwcGxpZWQuICAoU29ycnkgZm9yIHRoZSBkZWxh
eS4uLikKClRoYW5rIHlvdSwKClRoYXQgd2FzIG5vdCBtdWNoIGRlbGF5IGF0IGFsbC4gICBIb3dl
dmVyLCBJIHdhcyBhYm91dCB0byBqdXN0IGFwcGx5IHRoZSBzZXQgb2YKcGF0Y2hlcyBteXNlbGYu
ICBXb3VsZCB0aGF0IGhhdmUgYmVlbiBhIHByb2JsZW0/CgotU3RhZmZvcmQKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0
Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5v
cmcvbGlzdGluZm8vb3BlbnJpc2MK
