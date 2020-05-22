Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 492561DF0E1
	for <lists+openrisc@lfdr.de>; Fri, 22 May 2020 23:02:03 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id CA39C20BBA;
	Fri, 22 May 2020 23:02:02 +0200 (CEST)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by mail.librecores.org (Postfix) with ESMTPS id 1FA9B20BAB
 for <openrisc@lists.librecores.org>; Fri, 22 May 2020 23:02:00 +0200 (CEST)
Received: by mail-pl1-f194.google.com with SMTP id t7so4886528plr.0
 for <openrisc@lists.librecores.org>; Fri, 22 May 2020 14:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=HV5iQwK8loYZl8vq4nEYu/B0bxCMQzHwJ2eP+tz5hSI=;
 b=lHkuLuSr4Kl6bk2k4ooUO1Ko0V8ne1F5X86GAWqJ9v05806geuLxF52AIHcW7KaFwR
 aRQsYa5Bls3k/LS1UiiiPDYC6NGdhJ+Mk1hAAcsvtHmzCwW9w8xEKT1yHHQGTEvzJJwq
 mB7C/ZSBz3PNctudwOKTbOvIMkgckmp7xNeri2f7UMx2nyDwevtkWLfMHY0HejZYu10K
 tY6tR/g3UtITgbzxWl4g26wjHpWb45i/Rsl0EsuMme6YzgXFIVEMIgznnh1vmQ/UrHSI
 tImg8Iud8mk2QhteKacIOfSyF0m3YbpYjRbS/tAfTnfk4OYfA92zO0wwsZqmeFcyyYTm
 q6Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HV5iQwK8loYZl8vq4nEYu/B0bxCMQzHwJ2eP+tz5hSI=;
 b=l3zyqR10h1GDZY4vsbfZw2UO697nN9TnAH6wQz3S/t1z384qH9jS9meGefJOjD+KA8
 08nHClz5uILN3Y7DXqkfzzXbRtRDIVP2/CCo5iR9zoicvP/qJYeuziJoxIUJhNB6ypTg
 lvy57MGjoWkOyafePvMBcSX+mZvFU98K7Ut544LLxbx1+E6WGVDQggOICQacGCoy+ZP+
 2gGpy04oJircPTclEfm/8P9bR1TMILjg1Yu96QuhTScEbgIXrU2Wz3zBRpLLJ+biicTi
 qUNXDWmQy0b/nX7m+uJMu4XzRAONzQpOS56OLWsLWWYm816BY94YY8ayN5h09JpAshQg
 pXAQ==
X-Gm-Message-State: AOAM530sSYKmyG/SoeHbYMKhTB40T7ALO5wwvv8sycCGZja50yeSrA+9
 cU8Xw3q7gw7ncR7v+yrs7nQ=
X-Google-Smtp-Source: ABdhPJzakhffxiYwpo+B/0kmaY+iiVuZmqaC+U/SkGKNDRHosPaB+6wpwyTyap8CfFNQwbTbldFY1A==
X-Received: by 2002:a17:902:7b89:: with SMTP id
 w9mr15242354pll.252.1590181318050; 
 Fri, 22 May 2020 14:01:58 -0700 (PDT)
Received: from localhost (g228.115-65-196.ppp.wakwak.ne.jp. [115.65.196.228])
 by smtp.gmail.com with ESMTPSA id
 x14sm7337703pfi.60.2020.05.22.14.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 14:01:56 -0700 (PDT)
Date: Sat, 23 May 2020 06:01:54 +0900
From: Stafford Horne <shorne@gmail.com>
To: Joseph Myers <joseph@codesourcery.com>
Message-ID: <20200522210154.GA75760@lianli.shorne-pla.net>
References: <20200522113633.209664-1-shorne@gmail.com>
 <alpine.DEB.2.21.2005221846590.10437@digraph.polyomino.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2005221846590.10437@digraph.polyomino.org.uk>
Subject: Re: [OpenRISC] [PATCH 0/1] OpenRISC port
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
 GLIBC patches <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gRnJpLCBNYXkgMjIsIDIwMjAgYXQgMDY6NTI6MjBQTSArMDAwMCwgSm9zZXBoIE15ZXJzIHdy
b3RlOgo+IE9uIEZyaSwgMjIgTWF5IDIwMjAsIFN0YWZmb3JkIEhvcm5lIHZpYSBMaWJjLWFscGhh
IHdyb3RlOgo+IAo+ID4gSGkgQWxsLAo+ID4gCj4gPiBUaGlzIGlzIHRoZSBwYXRjaCBmb3IgdGhl
IE9wZW5SSVNDIHBvcnQgb2YgZ2xpYmMuCj4gCj4gUGxlYXNlIHNlZSA8aHR0cHM6Ly9zb3VyY2V3
YXJlLm9yZy9nbGliYy93aWtpL05ld1BvcnRzPiBmb3IgaW5mb3JtYXRpb24gdG8gCj4gaW5jbHVk
ZSBpbiBhIG5ldyBwb3J0IHN1Ym1pc3Npb24uICBUaGF0IGluY2x1ZGVzIHBvaW50aW5nIHRvIGFy
Y2hpdGVjdHVyZSAKPiBhbmQgQUJJIG1hbnVhbHMuCgpUaGFuayB5b3UgZm9yIHRoZSBwb2ludGVy
cywgSSB3aWxsIGluY2x1ZGUgdGhpcyBpbiB2Mi4gIEJ1dCB0aGUgYXJjaGl0ZWN0dXJlCm1hbnVh
bCBpcyBoZXJlOgoKIC0gUGFnZTogaHR0cHM6Ly9vcGVucmlzYy5pby9hcmNoaXRlY3R1cmUKIC0g
UERGOiBodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vb3BlbnJpc2MvZG9jL21hc3Rl
ci9vcGVucmlzYy1hcmNoLTEuMy1yZXYxLnBkZgoKIC0gQXJjaGl0ZWN0dXJlIFJldmlzaW9uIFJl
cXVpcmVkIGZvciBGdWxsIEhhcmQgRmxvYXQgc3VwcG9ydDoKICAtIGh0dHBzOi8vb3BlbnJpc2Mu
aW8vcHJvcG9zYWxzL3AxNy11c2VyLW1vZGUtZnBjc3IKCj4gPiBUaGUgb3JpZ2luYWwgcGF0Y2gg
d2FzIHB1dCB0b2dldGhlciBieSBDaHJpc3RpYW4gU2NlbnNzb24gYSBmZXcgeWVhcnMgYWdvLiAg
SQo+ID4gaGF2ZSB0YWtlbiB0aGUgcGF0Y2ggYW5kIGZpbmlzaGVkIGFsbCBvZiB0aGUgVE9ETyBp
dGVtcyBhbmQgcnVuIGFuZCBmaXhlZCBhbGwgb2YKPiA+IHRoZSB0ZXN0IGZhaWx1cmVzLgo+IAo+
IERvIHlvdSBtZWFuIENocmlzdGlhbiBTdmVuc3Nvbj8gIChUaGVyZSdzIGEgY29weXJpZ2h0IGFz
c2lnbm1lbnQgZnJvbSAKPiBDaHJpc3RpYW4gU3ZlbnNzb24gZm9yIEdDQyBHTElCQyBCSU5VVElM
UyBmcm9tIDIwMTQuKQoKWWVzIENocmlzdGlhbiBTdmVuc3Nvbiwgc29ycnkgZm9yIHRoZSB0eXBv
LiAgSGUgaXMgbGlzdGVkIGluIHRoZSBjaGFuZ2Vsb2cgb24KdGhlIHBhdGNoLgoKPiAKPiA+IFRF
U1QgUkVTVUxUUwo+ID4gCj4gPiBQcmV0dHkgbXVjaCBhbGwgdGVzdHMgYXJlIHBhc3NpbmcgaG93
ZXZlciB0aGVyZSBhcmUgc2V2ZXJhbCBtYXRoIChmcHUpIHRlc3RzCj4gPiB3aGljaCBhcmUgZmFp
bGluZyBkdWUgdG8gaXNzdWVzIHdpdGggc2V0dGluZyB1bmRlcmZsb3cvb3ZlcmZsb3cgZmxhZ3Mu
ICBUaGVzZQo+IAo+IFRoZXJlIHNob3VsZCBub3QgYmUgYW55IHN1Y2ggZmFpbHVyZXMgd2l0aCBh
IGNvcnJlY3QgcG9ydCBhbmQgYXJjaGl0ZWN0dXJlIAo+IGltcGxlbWVudGF0aW9uLgoKT0ssIEkg
d2lsbCBsb29rIGludG8gaXQgYWdhaW4uICBUaGUgbGFzdCBJIHJlbWVtYmVyIHRoZXJlIHdhcyBz
b21ldGhpZ24gc3RyYW5nZQpoYXBwZW5pbmcgd2l0aCB1bmRlcmZsb3cgZXhjZXB0aW9uIG5vdCBi
ZWluZyBzZXQgaW4gdGhlIEdDQyBGUFUgZW11bGF0aW9uIGNvZGUuCgpOb3RlLCB0aGUgT3BlblJJ
U0MgaW1wbGVtZW50YXRpb24gSSB0ZXN0ZWQgd2l0aCBoYXMgb25seSAzMi1iaXQgRlBVIGhhcmQK
c3VwcG9ydC4gIFRoaXMgbWVhbnQgdGhhdCBDIEFQSSBmb3IgbG9nL2Nvcy9zaW4gZXRjIHdoaWNo
IGludGVybmFsbHkgYXJlIGRlZmluZWQKdG8gdXNlIDY0LWJpdCBkb3VibGUncyBhbGwgZW5kIHVw
IHVzaW5nIGVtdWxhdGlvbi4KCj4gPiBJIGNhbiBwcm92aWRlIG1vcmUgZGV0YWlscy4KPiAKPiBG
dWxsIHRlc3QgcmVzdWx0cyBzaG91bGQgYmUgcHJvdmlkZWQgKHNlZSB0aGUgYWJvdmUgbWVudGlv
bmVkIHdpa2kgcGFnZSkuCgpJIHdpbGwgZG8gd2l0aCB0aGUgbmV4dCByb3VuZCBvZiBwYXRjaGVz
LiAgVGhpcyBpcyBhbGwgdmVyeSBoZWxwZnVsLgoKLVN0YWZmb3JkCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVu
UklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xp
c3RpbmZvL29wZW5yaXNjCg==
