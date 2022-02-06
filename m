Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A7D2E4AAEC1
	for <lists+openrisc@lfdr.de>; Sun,  6 Feb 2022 11:04:11 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 4FBC9247E3;
	Sun,  6 Feb 2022 11:04:11 +0100 (CET)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mail.librecores.org (Postfix) with ESMTPS id 38595242CD
 for <openrisc@lists.librecores.org>; Sun,  6 Feb 2022 11:04:10 +0100 (CET)
Received: by mail-pj1-f44.google.com with SMTP id
 v15-20020a17090a4ecf00b001b82db48754so10533758pjl.2
 for <openrisc@lists.librecores.org>; Sun, 06 Feb 2022 02:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=MOIoKqwfHQCMUAsHpddTltswukoTQXhDVma7WV/WWoU=;
 b=S80dUuJTsqOc2QQvF3GlfJen379mRYupyFUBopkTCpjxKlb0SUVXwqX2oRcMK6NrZF
 RvEO4KAdj+F0fnwsCkreRqOxYyb9HNCvQvIzR1dyolM4rgVSytO0fbJIEyrlw0WrWuBf
 njpXnC0HuZFS786Rw0YCXD/yCVVrB4f9LqSpi4f0MyXGYLYk6ixjgSm+6k9slwzmzoHh
 qLKAJDoe2xfQonVB4A95lAjA9f//e39VAPlIeFwb0SxEBemwem1KuE5Yv1/1WcXr4p25
 ZVhzHZka/AAaAkW92Vt0bsAvZy3YzzJKi5GDIhNzAek23Rw8kl+LlhnyuWftSOWci9lD
 1fRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MOIoKqwfHQCMUAsHpddTltswukoTQXhDVma7WV/WWoU=;
 b=MeHcNnz32qsyWRR5emlXyNDekaiUO2AeDT5+NKh7/67ci75o0Gns578NAqJWz4DY34
 8lA6hL3aqGREJS3NYN2Q5FsS1gFkTgpctKcruADkwX2lRemoENg+fXBu8qT3SWsnjhXv
 WmjrtXwPAxm1yFP8u275RUH3FmJcxMX6pEX8lb9vtzW67CtwQfCNm5y9kLFpmWw/Uprc
 V2njQmk28GSTxX4B3wAjSIgat8t3Wp+xGS26gIChJj/9m3wHVPUdRjWTUC+XsQNosoq0
 +5zNcEtDrtTc98nv7YPU2dys5+hw4kUnELr/PC8RAZSf9LyatN60SK//iEA3gXoZhHnK
 9z9w==
X-Gm-Message-State: AOAM531zwQsQOEIlRYtqVY4cm3dfggbHiSxeQ5pPvCeRfpiPCTrx5dBw
 LauQsxEI+8CxFbSKBS09BQg=
X-Google-Smtp-Source: ABdhPJxUBk+I+JI6FqBfIvA4asNp+RtU2lrAsz+B9i1ILVg6qC2M7qpOxIkAa10ZMxjP56KLMzZjuA==
X-Received: by 2002:a17:90b:8cd:: with SMTP id
 ds13mr2779885pjb.43.1644141848450; 
 Sun, 06 Feb 2022 02:04:08 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id r11sm8119251pff.81.2022.02.06.02.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 02:04:07 -0800 (PST)
Date: Sun, 6 Feb 2022 19:04:06 +0900
From: Stafford Horne <shorne@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <Yf+dFv1Fj3LFsaot@antec>
References: <20220206013648.3491865-1-shorne@gmail.com>
 <CAMuHMdW2bxEtaYaLN28xk2uc=OV0ecUy-N_+Ay193gZq4nH0jw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdW2bxEtaYaLN28xk2uc=OV0ecUy-N_+Ay193gZq4nH0jw@mail.gmail.com>
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

SCBHZWVydCwKClRoYW5rcyBmb3IgbG9va2luZyBhZnRlciBpdC4KCk9uIFN1biwgRmViIDA2LCAy
MDIyIGF0IDEwOjQyOjQ2QU0gKzAxMDAsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToKPiBIaSBT
dGFmZm9yZCwKPiAKPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghCj4gCj4gT24gU3VuLCBGZWIgNiwg
MjAyMiBhdCAyOjM3IEFNIFN0YWZmb3JkIEhvcm5lIDxzaG9ybmVAZ21haWwuY29tPiB3cm90ZToK
PiA+IFJlbW92ZSB0aGUgYWRkcmVzcyBzcGFjZSBvdmVycmlkZSBBUEkgc2V0X2ZzKCkgdXNlZCBm
b3IgVXNlciBNb2RlIExpbnV4Lgo+IAo+IE5vdGU6IHRoaXMgZG9lc24ndCBoYXZlIGFueXRoaW5n
IHRvIGRvIHdpdGggVU1MLi4uCgpZZXMsIEkgYWdyZWUgZm9yIFVNTCwgSSB3YXMgYWN0dWFsbHkg
Zm9sbG93aW5nIHRoZSB0ZXh0IGZyb20gQ2hyaXN0b3BoJ3MgcGF0Y2gKaGVyZToKCiAgICBodHRw
czovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjExMjE1MTY1NjEyLjU1NDQyNi0xLWhjaEBsc3Qu
ZGUvVC8jbTQzOWUzMmIzZWNjODQwNDQyNGQyZDgxMTVkNDlmYmYyN2M2MzkzZTkKClRoZSB3b3Jk
aW5nICdVc2VyIE1vZGUgTGludXgnIHdhcyBwZXJjdWxpYXIuIE1heWJlIEkgc2hvdWxkIHJlbW92
ZSB0aGUKbWlzbGVhZGluZyB0ZXh0IGFuZCBqdXN0IHNheToKCiAgICBSZW1vdmUgdGhlIGFkZHJl
c3Mgc3BhY2Ugb3ZlcnJpZGUgQVBJIHNldF9mcygpLgoKLVN0YWZmb3JkCgo+ID4gVXNlciBhZGRy
ZXNzIHNwYWNlIGlzIG5vdyBsaW1pdGVkIHRvIFRBU0tfU0laRS4KPiA+Cj4gPiBUbyBzdXBwb3J0
IHRoaXMgd2UgaW1wbGVtZW50IGFuZCB3aXJlIGluIF9fZ2V0X2tlcm5lbF9ub2ZhdWx0IGFuZAo+
ID4gX19zZXRfa2VybmVsX25vZmF1bHQuCj4gPgo+ID4gVGhlIGZ1bmN0aW9uIHVzZXJfYWRkcl9t
YXggaXMgcmVtb3ZlZCBhcyB0aGVyZSBpcyBhIGRlZmF1bHQgZGVmaW5pdGlvbgo+ID4gcHJvdmlk
ZWQgd2hlbiBDT05GSUdfU0VUX0ZTIGlzIG5vdCB1c2VkLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6
IFN0YWZmb3JkIEhvcm5lIDxzaG9ybmVAZ21haWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVND
QGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGlu
Zm8vb3BlbnJpc2MK
