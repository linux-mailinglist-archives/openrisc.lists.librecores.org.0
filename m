Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 46AC01CBA98
	for <lists+openrisc@lfdr.de>; Sat,  9 May 2020 00:18:07 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D07CE20B05;
	Sat,  9 May 2020 00:18:06 +0200 (CEST)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mail.librecores.org (Postfix) with ESMTPS id D92E720AF6
 for <openrisc@lists.librecores.org>; Sat,  9 May 2020 00:18:04 +0200 (CEST)
Received: by mail-pl1-f175.google.com with SMTP id f8so1348932plt.2
 for <openrisc@lists.librecores.org>; Fri, 08 May 2020 15:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=c3D6agMoPct1HiydzneWHxhN+mjy3Mfrb9j2Csdszc0=;
 b=Rb0NPyITMUgaya3IOWduEw6EFvHC4A4rX3nEkhxMEr79VYk+NaoZGUywFmkITIWMW0
 q3q6stPt+6B8Xx+pgsgDz1LPGdfgH2PbR4wyW3EfJYvy2MvvR9glXt2AG37B7m1mSBei
 dQxE6pgRVn7Z9KjsgGHWcmnpatv9ZrO+sJEcSV3VXMZD9KebwR0bCg6x+2mHDA2qrruk
 KqisavUfy4Bb+pDi+jWG0BBug7Qj0y8gLYBryuG/4CTOvZz6iRUtHxx/sBhpE/IbANMc
 RlpPvo+55JnfRXzxT5E8Ao/80ti0LpDYXs/DlrXkr01mruI9qmuz1+oxOTZ2F9ButLPm
 cClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=c3D6agMoPct1HiydzneWHxhN+mjy3Mfrb9j2Csdszc0=;
 b=FDHFW++eRpw08shJXJYMSLAz6UKkszZ6EIL4AK/ylDaKh8Xh7cY5S3FC/Fm4uhsYfe
 LWDGs3cysnD1PRiDp9uvUhWhDY7274MMlLXHp7ngR2c73t2qoVkkllG8icH5MLecqwEX
 Xr97PQ7hIWB5CqlP+YY5HMm1Tn2CcVaSDpYW1qH6IulMr0XpPlUP9ov+PhsgXGEmA5w8
 8baSeC2c3ZuzXwsIYJoY62gXkUFQEs5rw5fSpOKHlOaOk6p/MgwAcxnQrS0fvT2yIipA
 EaCoXDUvxW3me/rceh5xYSrFUdRESQIu4/tCUmnbpmpkPIuQjNBdGVtXF1O0IXxZrUxM
 WTPA==
X-Gm-Message-State: AGi0PuZ6bRPxxFjqoRIQsLsuUkN/xVTA0emCJjYqqYCoMyGS/VpwjCQU
 fjck17m+zq8anpCq3yYFr2s=
X-Google-Smtp-Source: APiQypKWfMCQf2qV5e3WSuUHyUUQEaCCip6vChnuYDATGu9+CxebD0qb0jdyvNZOkeyi/wVKz8/8xA==
X-Received: by 2002:a17:90a:2323:: with SMTP id
 f32mr8263481pje.139.1588976281898; 
 Fri, 08 May 2020 15:18:01 -0700 (PDT)
Received: from localhost (g220.222-224-186.ppp.wakwak.ne.jp. [222.224.186.220])
 by smtp.gmail.com with ESMTPSA id d2sm2752138pfa.164.2020.05.08.15.18.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2020 15:18:01 -0700 (PDT)
Date: Sat, 9 May 2020 07:17:59 +0900
From: Stafford Horne <shorne@gmail.com>
To: Andrey Bacherov <bandvig@mail.ru>
Message-ID: <20200508221759.GB4359@lianli.shorne-pla.net>
References: <20200506220323.GB2550@lianli.shorne-pla.net>
 <652e3bb7-93aa-4310-e798-2258b00300af@mail.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <652e3bb7-93aa-4310-e798-2258b00300af@mail.ru>
Subject: Re: [OpenRISC] OpenRISC: User mode writing to FPCSR
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
Cc: Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gRnJpLCBNYXkgMDgsIDIwMjAgYXQgMTA6NTM6MDVQTSArMDMwMCwgQW5kcmV5IEJhY2hlcm92
IHdyb3RlOgo+IEhlbGxvIFN0YWZmb3JkLAo+IAo+IEkgYWdyZWUgd2l0aCB5b3VyIHByb3Bvc2Fs
ICgxKS4KPiBJdCBsb29rcyByZWFzb25hYmxlLgoKVGhhbmtzIGZvciB5b3VyIHJldmlldy4gIEkg
dGhpbmsgaXQgd2lsbCBiZSBhIGJpdCBvZgp0aW1lIGJlZm9yZSBJIHN0YXJ0IG9uIGFueSBvZiB0
aGlzLgoKLVN0YWZmb3JkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9y
ZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
