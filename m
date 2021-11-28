Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 63CC4460366
	for <lists+openrisc@lfdr.de>; Sun, 28 Nov 2021 04:39:15 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1E8F922D3C;
	Sun, 28 Nov 2021 04:39:15 +0100 (CET)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by mail.librecores.org (Postfix) with ESMTPS id 20A9722D3C
 for <openrisc@lists.librecores.org>; Sun, 28 Nov 2021 04:39:13 +0100 (CET)
Received: by mail-ua1-f54.google.com with SMTP id l24so26813030uak.2
 for <openrisc@lists.librecores.org>; Sat, 27 Nov 2021 19:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sLqu1CeRQ/bZfywC4OllR5wRzGuo9AIQqtqxZ8hGTSk=;
 b=jUvpf7qX4080/wkB+WV5tXALKunDZNPUIyRC7lqcEFYe9Ch4c4Qx3d6uG5YreSLYhZ
 ab9aGx4MjW4Fo0IxUtJWQtf4eBPDP7XXOs3C1p76fNFVUj4biqBW82IMRjbMamAoO7r+
 BQeshx00AvXSImqgo5DbTbq75k1rjO/HRuE0Y+bUmFQXZNa0vWY5FhIcGm8d5/zqTgCS
 6GCopT6uQR+MOM5PCIkwmGO2FVYZuS8/b59p3mn6dntQxXEmOHHsxRXu3uMiMG/rXPaZ
 TiqQ25J+mJg7WN/crHWiGqwTY9cXMJWFEO0yOeHLGb1Q75sHDdlLr6L4snG1HyJM+OCx
 Rr+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sLqu1CeRQ/bZfywC4OllR5wRzGuo9AIQqtqxZ8hGTSk=;
 b=VnbFNvOkwDi9ghUo2kewJCiOIrIXWHoFsG1B+Rk+obPTbhVCZ/ZpONshyLGc/CLQZB
 SfiNXckRgGvIIoEcBfVnOftitSGLl2LptSOzjtI3FLBHoIoFsA4BDc9Y73ntxhC746np
 LM42RZjuL1aPD09Z07BKi+1DguSRZzxYakNtyEvedFRKs9BCmecnHMMEuX2w9KTjc1ul
 yEu9pS4fDNkRqWCYi6vDSCikySeQMTASGi1To7M/3asYDEt8eilSZg6Rnp4NiPu/xUpT
 XTx3o7u2/L4l2kSpVpM79nuCimDeBdnAhU0/4ePCmd1utkusuXyed0UkeOIjX/jTN/hu
 w25A==
X-Gm-Message-State: AOAM532tLFxENLEzfw6jKRtE8Xzm2zcpGgFrI+U6INYR7j+GzMx7TenT
 v8ZSGXt0H7s8w39mcQCaadoVlPQboKhIWY2SA30=
X-Google-Smtp-Source: ABdhPJx676Dokw86lzztkIX98mDFMOJ3s+fjX3F/PRL2IPXwn6yEYaWWHXm50q94b3QLLSY3N0PVONdp4pmbdJFUBbI=
X-Received: by 2002:ab0:6883:: with SMTP id t3mr42767648uar.66.1638070752093; 
 Sat, 27 Nov 2021 19:39:12 -0800 (PST)
MIME-Version: 1.0
References: <CAF6YiZ5=4+bGKipC0-cScNsd2s+4PGwTchXAJTtETF47AukpLQ@mail.gmail.com>
In-Reply-To: <CAF6YiZ5=4+bGKipC0-cScNsd2s+4PGwTchXAJTtETF47AukpLQ@mail.gmail.com>
From: Julius Baxter <juliusbaxter@gmail.com>
Date: Sun, 28 Nov 2021 14:39:00 +1100
Message-ID: <CAF6YiZ5f=LsBeMTF1+8q9697qNHbE57rjdftAQ4H0ackpt-u2Q@mail.gmail.com>
To: jidan@gmx.net
Subject: Re: [OpenRISC] FPU licensing request
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
Cc: BAndViG <bandvig@mail.ru>, Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU3VuLCAyOCBOb3YgMjAyMSBhdCAxNDoyNSwgSnVsaXVzIEJheHRlciA8anVsaXVzYmF4dGVy
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSBKaWRhbiwKPgo+IEknbSBnZXR0aW5nIGluIHRvdWNo
IGJlY2F1c2UgSSB3YW50IHRvIGFzayB5b3VyIHBlcm1pc3Npb24gdG8KPiByZWxpY2Vuc2Ugc29t
ZSBvZiB5b3VyIEZQVSBjb2RlLgo+Cj4gSSBwb3J0ZWQgeW91ciBWSERMIEZQVSBkZXNpZ24gdG8g
VmVyaWxvZyBtYW55IHllYXJzIGFnbyAoMjAxMCBJIHRoaW5rKQo+IGFuZCBpdCdzIHNpbmNlIGJl
ZW4gaW5jbHVkZWQgaW4gdGhlIG1vcjFreCBPcGVuUklTQyBDUFUgcHJvamVjdCBieQo+IEFuZHJl
eSBCYWNoZXJvdiAoQ0MnZWQpLgo+Cj4gRXhhbXBsZTogaHR0cHM6Ly9naXRodWIuY29tL29wZW5y
aXNjL21vcjFreC9ibG9iL21hc3Rlci9ydGwvdmVyaWxvZy9wZnB1MzIvcGZwdTMyX2FkZHN1Yi52
Cj4KPiBJdCdzIGN1cnJlbnRseSBnb3Qgd2hhdCBsb29rcyBsaWtlIGEgcGVybWlzc2l2ZSBsaWNl
bmNlIChhcyB5b3UgY2FuCj4gc2VlIGluIHRoZSBsaW5rIGFib3ZlKSBidXQgSSB3b3VsZCBsaWtl
IHRvIGFzayBpZiB3ZSBjYW4gcmVsaWNlbnNlIHRoZQo+IGNvZGUgdW5kZXIgdGhlIENFUk4gT0hM
IFYyIHdlYWtseSBwZXJtaXNzaXZlIGxpY2VuY2UuCgpDb3JyZWN0aW9uOiByZWxpY2Vuc2UgdGhl
IGNvZGUgdW5kZXIgdGhlIENFUk4gT0hMIHYyIHdlYWtseQpfcmVjaXByb2NhbF8gbGljZW5jZS4K
Cj4KPiBJbiBzdW1tYXJ5LCB0aGlzIGxpY2VuY2UgaXMgYSBmaWxlLWxldmVsIGNvcHlyaWdodCBm
b3IgaGFyZHdhcmUKPiBkZXNpZ25zLiBUaGUgRkFRIG9uIENFUk4ncyBzaXRlIGFib3V0IHRoZSBP
SEwgaXMgZ3JlYXQgZm9yIGV4cGxhbmluZwo+IHdoYXQgdGhlIE9ITCB2MiBpcyB3aGF0IHRoZSBX
IHZhcmlhbnQgbWVhbnM6Cj4gaHR0cHM6Ly9vaHdyLm9yZy9wcm9qZWN0L2Nlcm5vaGwvd2lraXMv
ZmFxI3Etd2hhdC1hcmUtYWxsLXRoZXNlLXN1ZmZpeGVzCj4KPiBUaGlzIHdvdWxkIG9ubHkgYXBw
bHkgdG8gdGhpcyBjb3B5IG9mIHRoZSBzb3VyY2UuIEl0IGRvZXMgbm90IGFmZmVjdAo+IHRoZSBv
dGhlciBjb3BpZXMgd2hpY2ggYXJlIG91dCB0aGVyZSBvbiB0aGUgaW50ZXJuZXQuIEkgb25seSBh
c2sgdGhpcwo+IGZvciBjb25zaXN0ZW5jeSBhY3Jvc3MgdGhlIG1vcjFreCBDUFUgcHJvamVjdC4K
Pgo+IFlvdXIgcGVybWlzc2lvbiB0byBkbyB0aGlzIHdvdWxkIGJlIGdyZWF0bHkgYXBwcmVjaWF0
ZWQuCj4KPiBIYXBweSB0byBhbnN3ZXIgYW55IG90aGVyIHF1ZXN0aW9ucyB5b3UgaGF2ZS4KPgo+
IENoZWVycywKPiBKdWxpdXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMu
b3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
