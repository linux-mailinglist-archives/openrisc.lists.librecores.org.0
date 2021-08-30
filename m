Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id BF50D3FAF25
	for <lists+openrisc@lfdr.de>; Mon, 30 Aug 2021 02:17:38 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 625242410D;
	Mon, 30 Aug 2021 02:17:33 +0200 (CEST)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mail.librecores.org (Postfix) with ESMTPS id D085C23F47
 for <openrisc@lists.librecores.org>; Mon, 30 Aug 2021 02:17:31 +0200 (CEST)
Received: by mail-pj1-f45.google.com with SMTP id
 u13-20020a17090abb0db0290177e1d9b3f7so12644912pjr.1
 for <openrisc@lists.librecores.org>; Sun, 29 Aug 2021 17:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1C8C+Dt0oLk10qRVIxYYtd66IFLf4/1C2glrdJ31MD8=;
 b=iFH0zbbdgUX2fEKG40Tl+c93tjzRvQflDnMNFMogzcSQ5re8lTiOnuuxXs8820saj9
 vUgsN1xBYOkhLZgm9pwfVEQrcvmb8lGgkJ+x3ZP5Bo/Ni7AWKXmweLVwH0J5+U3mmUCJ
 MqPEFQLuvrRaKDb1mbOnjNdQWVPKI1kNmaLiR6qrj/IT/kFf3k86Ia69srwOkpJPafUk
 +qupUduV4chBiwtdMGlkeoOITp7ltszFvkOYsWOC5xWMpb2pDEvxgH47I1N2Avf30CUd
 BeXo8ybEFOS9q4/DgDjMSZalnjhkokjMG9b8/l/IpTnBciXFbqyyI5ANOpoa5OeltE92
 NoXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1C8C+Dt0oLk10qRVIxYYtd66IFLf4/1C2glrdJ31MD8=;
 b=AL8Dn5dOABtVIY7Y0PjIjHg+rXCDBEhIrsbd4Rurtllfb6N3IqOleImPGTt9C6ciXa
 EUEvLAW/yD3ca5nvW7uwl/FZum5mytFFQBcP1i5UPMc/3qKBKarprFig+P71WYdKuW/N
 7m8cds4meYu6y+lweVa8i+I7yoA/ydN+gOh/yZuCgEkJq7yJuQfXAdqPOET3kVIBA24r
 8AKoV0hoRD4WtlT7Mh0JxSH93oV3A/uYNWqkFw4DyUtzEH16LmtIAINQkLr00csRIJa/
 4bhR6xrKIS3uj9OnjJTh9FzWJ2RdHOa27clDN97QpcbzvJM/lncPvZ+T951mO9BM4cSy
 fARQ==
X-Gm-Message-State: AOAM532QzyuhBm40B4oW87fWsa8vRzZSP48VfvKOVK+r4A3RkGcwnztj
 C1X9LS2Mc9tvcXZaY3UHdd4=
X-Google-Smtp-Source: ABdhPJxW8hyMQxdYktUmqt/HledhXbUgfROqJ+CjKuW3GUK1y/DmNdOjCcBgckVsLIf9YPRjWpa64w==
X-Received: by 2002:a17:90a:428f:: with SMTP id
 p15mr36525779pjg.75.1630282650265; 
 Sun, 29 Aug 2021 17:17:30 -0700 (PDT)
Received: from localhost (g163.222-224-165.ppp.wakwak.ne.jp. [222.224.165.163])
 by smtp.gmail.com with ESMTPSA id s15sm8708332pfu.67.2021.08.29.17.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 17:17:29 -0700 (PDT)
Date: Mon, 30 Aug 2021 09:17:27 +0900
From: Stafford Horne <shorne@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Message-ID: <YSwjlzegL+cKt1hg@antec>
References: <20210826132946.3324593-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210826132946.3324593-1-joel@jms.id.au>
Subject: Re: [OpenRISC] [PATCH 0/3] openrisc/litex: Add liteeth support
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
Cc: openrisc@lists.librecores.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCBBdWcgMjYsIDIwMjEgYXQgMTA6NTk6NDNQTSArMDkzMCwgSm9lbCBTdGFubGV5IHdy
b3RlOgo+IEhlbGxvIFN0YWZmb3JkLAo+IAo+IEhlcmUgYXJlIHNvbWUgY2hhbmdlcyBzbyB0aGF0
IHRoZSBvcGVucmlzYyBrZXJuZWwgY2FuIGJvb3Qgd2l0aCBldGhlcm5ldAo+IHN1cHBvcnQgd2l0
aCB0aGUgaW4tdHJlZSBkZXZpY2UgdHJlZS4KPiAKPiBJIGhhdmUgYWxzbyB1cGRhdGVkIHRoZSBh
ZGRyZXNzIG9mIHRoZSBzZXJpYWwgZGV2aWNlIHRvIG1hdGNoIHJlY2VudAo+IGxpdGV4LiBJIHJl
YWxpc2UgdGhpcyBtYXkga2VlcCBjaGFuZ2luZywgYnV0IGl0IGRvZXMgbWFrZSBpdCBlYXNpZXIg
dG8KPiB0ZXN0IHVwc3RyZWFtIGtlcm5lbHMgaWYgdGhlIGJhc2ljcyB3b3JrLgo+IAo+IEpvZWwg
U3RhbmxleSAoMyk6Cj4gICBvcGVucmlzYy9saXRleDogVXBkYXRlIHVhcnQgYWRkcmVzcwo+ICAg
b3BlbnJpc2MvbGl0ZXg6IEFkZCBldGhlcm5ldCBkZXZpY2UKPiAgIG9wZW5yaXNjL2xpdGV4OiBV
cGRhdGUgZGVmY29uZmlnCj4gCj4gIGFyY2gvb3BlbnJpc2MvYm9vdC9kdHMvb3Ixa2xpdGV4LmR0
cyAgICAgIHwgMTMgKysrKysrKysrKy0tCj4gIGFyY2gvb3BlbnJpc2MvY29uZmlncy9vcjFrbGl0
ZXhfZGVmY29uZmlnIHwgMjYgKysrKysrKysrKysrKystLS0tLS0tLS0KPiAgMiBmaWxlcyBjaGFu
Z2VkLCAyNyBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCkhpLAoKVGhlc2UgYWxsIGxv
b2sgZmluZSB0byBtZS4gIE5vdGUsIEkgaGF2ZSBqdXN0IHVzaW5nIHRoZSBhdXRvZ2VuZXJhdGVk
IC5kdHMgZmlsZQpjcmVhdGVkIGJ5IHRoZSBsaXRleCBidWlsZCwgc28gSSBkb24ndCB1c3VhbGx5
IHVzZSB0aGlzIG9uZSBvdGhlciB0aGFuIGZvciBzb21lCmJhc2ljIHRlc3RpbmcuICBJIGtub3cg
YXV0byBnZW5lcmF0ZWQgb25lIGhhcyBpdCdzIHF1aXJrcyBidXQgaXQgZG9lcyB3b3JrLgoKSXQn
cyBnb29kIHRvIGhhdmUgdGhlc2UgaGVyZSB0aG91Z2guCgpJIHdpbGwgcXVldWUgdGhlc2UgYWZ0
ZXIgdGhlIGVodGVybmV0IGRyaXZlciBpcyBxdWV1ZWQuICBBcmUgeW91IHBsYW5uaW5nIG1lIHRv
CnF1ZXVlIHRoZSBldGhlcm5ldCBkcml2ZXI/ICBPciB3aWxsIHNvbWVvbmUgZWxzZSBiZSB0YWtp
bmcgdGhhdCBpbj8KCi1TdGFmZm9yZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVj
b3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
