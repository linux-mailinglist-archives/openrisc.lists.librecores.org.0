Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 8D1333734F7
	for <lists+openrisc@lfdr.de>; Wed,  5 May 2021 08:30:12 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E53A22116B;
	Wed,  5 May 2021 08:30:11 +0200 (CEST)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mail.librecores.org (Postfix) with ESMTPS id 4A86420162
 for <openrisc@lists.librecores.org>; Wed,  5 May 2021 08:30:10 +0200 (CEST)
Received: by mail-pj1-f54.google.com with SMTP id
 fa21-20020a17090af0d5b0290157eb6b590fso284302pjb.5
 for <openrisc@lists.librecores.org>; Tue, 04 May 2021 23:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2RhN1BSJSMfF/JdtqLnXCeZ+2gb1ze3QRDoO47uBVi4=;
 b=SSsj4uJ674wkFd2bPIfUMVg12pdIXTtpGUVCEVS9Yfm4bZeCwxNtVl5dUgjy5WNd9S
 xCcyEXIa8rXVuJ29tqUhDx8O9yaFeCjphMCQLRUjWYYuLOkKjbtMQ3rQe3SqxaQ/bG/9
 3sPDDYqTXE8FgWkJwf5O004shy9aUSaBfslsL4WKSZZLffJxuW+/saFtuvIEMIIjwmr3
 wYKwFmhagtSJm5vwrSU6BI/yxcofqUR72O3g+fodlKeNNJeu4a1HNt0nNLg7pOj34MC4
 NW/Ydl07RTDEqFQAPeCUnrwuPNhTpAMPXMN7Eg+4TjvY7exC790axVBVw6UTGn3kX2Lv
 BbIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2RhN1BSJSMfF/JdtqLnXCeZ+2gb1ze3QRDoO47uBVi4=;
 b=i1mMl7MdDgnyvTTVejn49OK7UouOkIfIHOzSouO8cxx9VVKFqOa3k+zstGlqXGjpkg
 /Bqltgtd3Hr7Gw0ZCTbu8lVM2W18O3MNMh9PnBktFtssXCC1xmr2vWAYG0g6bvDFdaD1
 wPMVwaVKbp+jAw8UA4m0sytpCyr6nVgRTAZ2vCTRF5V971hV0f62sJHsMmaHhHnc20h1
 bLpgdqfLqSf56CMJGs0eC55yMA1M9sB8Y5/vLDHcXrL8vXvQt+rz/zgIVdvexJebW+sX
 xHyNjUfn/OQBYaF6kkDB6sB7rNfZoiHzTfVuJREbPDYdbvJ4m3n+pB/L13hTqvEz42TG
 t03A==
X-Gm-Message-State: AOAM531Ggnffxf9obTY6xeRRA30toFhRf5Zq/HxM/agDCJjAmYTJYSOl
 NAudO/yA15aoxrnSFbOnj7U=
X-Google-Smtp-Source: ABdhPJzNQosq25l/j1J94A2SB9p6Y1++jztjP9GvJtmleFPSuIPo/GNCkewgUoqUnzURmJxn9+JGwQ==
X-Received: by 2002:a17:90b:184:: with SMTP id
 t4mr9809714pjs.223.1620196208465; 
 Tue, 04 May 2021 23:30:08 -0700 (PDT)
Received: from localhost (g17.222-224-135.ppp.wakwak.ne.jp. [222.224.135.17])
 by smtp.gmail.com with ESMTPSA id
 66sm10664945pfg.181.2021.05.04.23.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 23:30:07 -0700 (PDT)
Date: Wed, 5 May 2021 15:30:04 +0900
From: Stafford Horne <shorne@gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20210505063004.GT3288043@lianli.shorne-pla.net>
References: <20210501211145.2980164-1-shorne@gmail.com>
 <9a2977bb-b9a3-73e7-2cc8-4705fb6bc30f@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9a2977bb-b9a3-73e7-2cc8-4705fb6bc30f@benettiengineering.com>
Subject: Re: [OpenRISC] [PATCH v2 0/2] OpenRISC support for cmodel=large
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
 GCC patches <gcc-patches@gcc.gnu.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBNYXkgMDMsIDIwMjEgYXQgMTI6MzQ6MjJQTSArMDIwMCwgR2l1bGlvIEJlbmV0dGkg
d3JvdGU6Cj4gSGkgU3RhZmZvcmQsIEFsbCwKPiAKPiBJJ3ZlIGJhY2twb3J0ZWQgdGhpcyBwYXRj
aHNldCBmb3IgQnVpbGRyb290IHRvIHZlcnNpb25zOgo+IC0gOS4zLjAKPiAtIDEwLjMuMAo+IAo+
IERvZXMgaXQgbWFrZSBzZW5zZSB0byBzZW5kIHRoZW0/IEkgZG9uJ3Qga25vdyBpZiB0aG9zZSB2
ZXJzaW9uIHdpbGwgaGF2ZQo+IG1pbm9yIHZlcnNpb25zIHdoZXJlIHRoZXNlIGJhY2twb3J0ZWQg
cGF0Y2hlcyBjYW4gYmUgYXBwbGllZC4KCkRvIHlvdSBtZWFuIGZvciBtZS95b3UgdG8gc2VuZCB0
aGUgYmFja3BvcnRlZCBHQ0MgcGF0Y2hlcyBmb3IgR0NDIG9yIGJ1aWxkcm9vdD8KCkkgZG9uJ3Qg
bmVlZCBiYWNrcG9ydGVkIHZlcnNpb25zIG9mIHRoZSB0b29sY2hhaW5zIGFuZCB1c3VhbGx5IHdv
cmsgb2ZmIHRoZQpsYXRlc3QgcmVsZWFzZS9tYXN0ZXIuICBJZiBzb21lb25lIHdhbnRzIHRoZW0g
bGV0IG1lIGtub3cuCgotU3RhZmZvcmQKCj4gQmVzdCByZWdhcmRzCj4gLS0gCj4gR2l1bGlvIEJl
bmV0dGkKPiBCZW5ldHRpIEVuZ2luZWVyaW5nIHNhcwo+IAo+IE9uIDUvMS8yMSAxMToxMSBQTSwg
U3RhZmZvcmQgSG9ybmUgd3JvdGU6Cj4gPiBDaGFuZ2VzIGZyb20gdjE6Cj4gPiAgIC0gQWRkZWQg
cGF0Y2ggdG8gZW5hYmxlZCBjbW9kbGU9bGFyZ2Ugb24gY3J0c3R1ZmYKPiA+IAo+ID4gVGhpcyBz
ZXJpZXMgZml4ZXMgc29tZSBidWdzIGZvdW5kIHdoZW4gbGlua2luZyBsYXJnZSBiaW5hcmllcywg
Ym90aCBpbiBidWlsZHJvb3QKPiA+IGFuZCBnbGliYyB0ZXN0aW5nLgo+ID4gCj4gPiBTdGFmZm9y
ZCBIb3JuZSAoMik6Cj4gPiAgICBvcjFrOiBBZGQgbWNtb2RlbCBvcHRpb24gdG8gaGFuZGxlIGxh
cmdlIEdPVHMKPiA+ICAgIG9yMWs6IFVzZSBjbW9kZWw9bGFyZ2Ugd2hlbiBidWlsZGluZyBjcnRz
dHVmZgo+ID4gCj4gPiAgIGdjYy9jb25maWcvb3Ixay9vcjFrLW9wdHMuaCAgIHwgMzAgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgIGdjYy9jb25maWcvb3Ixay9vcjFrLmMgICAg
ICAgIHwgMTEgKysrKysrKysrLS0KPiA+ICAgZ2NjL2NvbmZpZy9vcjFrL29yMWsuaCAgICAgICAg
fCAgNyArKysrKysrCj4gPiAgIGdjYy9jb25maWcvb3Ixay9vcjFrLm9wdCAgICAgIHwgMTkgKysr
KysrKysrKysrKysrKysrKwo+ID4gICBnY2MvZG9jL2ludm9rZS50ZXhpICAgICAgICAgICB8IDEy
ICsrKysrKysrKysrLQo+ID4gICBsaWJnY2MvY29uZmlnLmhvc3QgICAgICAgICAgICB8ICA0ICsr
LS0KPiA+ICAgbGliZ2NjL2NvbmZpZy9vcjFrL3QtY3J0c3R1ZmYgfCAgMiArKwo+ID4gICA3IGZp
bGVzIGNoYW5nZWQsIDgwIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gPiAgIGNyZWF0
ZSBtb2RlIDEwMDY0NCBnY2MvY29uZmlnL29yMWsvb3Ixay1vcHRzLmgKPiA+ICAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGxpYmdjYy9jb25maWcvb3Ixay90LWNydHN0dWZmCj4gPiAKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0
Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5v
cmcvbGlzdGluZm8vb3BlbnJpc2MK
