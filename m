Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 5C93147E078
	for <lists+openrisc@lfdr.de>; Thu, 23 Dec 2021 09:36:56 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 00EFB242E5;
	Thu, 23 Dec 2021 09:36:55 +0100 (CET)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mail.librecores.org (Postfix) with ESMTPS id 9092E24274
 for <openrisc@lists.librecores.org>; Thu, 23 Dec 2021 09:36:53 +0100 (CET)
Received: by mail-pf1-f179.google.com with SMTP id k64so4642265pfd.11
 for <openrisc@lists.librecores.org>; Thu, 23 Dec 2021 00:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kw8kevVioLtztZeIUJmFjIHRjom+xDWvHLQNc+8YHHI=;
 b=Uvaz9YO8D/mwfAXqWR4qqMHrYCGl/kBUlWKuS0q3D+mgymEhsUcakWngtnkDQvdNll
 fb6eNxlUajb+brpW9BID7yQ83+2aiYMRJ1V4RowwawdH4i3qPj9aP/ftpprz0uKG9aV1
 F+w5uwg014ZHpZkQzqZlM+iOOf2eP8NrlNPF+Cx04Ma9PTf0Yk5IUb9BKhz/aH3ncKvY
 zpDoNK6oV+I6ViHExhfFhC3n5LtvNbYhNXD//0NAEhpht72hvpKc+W0Lw4t6bjqoreXE
 jKlnUa++BWcYFqRfqFJpkk05HzLpo8fRPFlXPZ1c5dlQBref1yX6O4X6+yY6eYpvPJRA
 /s/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kw8kevVioLtztZeIUJmFjIHRjom+xDWvHLQNc+8YHHI=;
 b=K8fWdSKJaor9GHKsy7XUddHw8HWlnk5+TPT2ipCYZpikQ+Y6BWsuUYLQhiQD2ZvjnX
 6RH9vxMr+h4t8I7pibrM7ZE0bSQSlGNWZCfuRU0hpXgNie+pRVpx14u2sNOVHCcyiYcM
 8BNWZN1qQ/bByMTserxMQTk3jmqaiC4nsgVDKP7RvxeUKz78CDSf3CDn62gPQY52cpWF
 2Pk/wvtXJwDMQW1PoN398Ymx2iQABgV4hFmDl2xH/QAjbI7d4AD6VDIpkHZfcuXEjjht
 v0llbOS5cPw8PFJaibpS+FrQ8ucfz5Nn54CR/C4nO+8S0MRlLkebunyauY4FvsDgghbM
 PcIg==
X-Gm-Message-State: AOAM533cOB40EKMVbHmEaBnaLC9adsu9OZQzDAZ2Sse4aKx+RblRPU56
 UsvHRfTDGxNx6xf7Kt5EA9Q=
X-Google-Smtp-Source: ABdhPJyyucjIjbj220QSAxoMmdjTqSB7LfxJXw66XCr7ZKIaVFAnOYALBrn/PP7mAWf6VczV0Hne9Q==
X-Received: by 2002:a05:6a00:1a03:b0:4ba:c23e:df67 with SMTP id
 g3-20020a056a001a0300b004bac23edf67mr1363956pfv.63.1640248612088; 
 Thu, 23 Dec 2021 00:36:52 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id n34sm4763747pfv.129.2021.12.23.00.36.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 00:36:51 -0800 (PST)
Date: Thu, 23 Dec 2021 17:36:49 +0900
From: Stafford Horne <shorne@gmail.com>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Message-ID: <YcQ1IXV81T8xuFJd@antec>
References: <20211210233456.4146479-1-shorne@gmail.com>
 <20211210233456.4146479-11-shorne@gmail.com>
 <1a46b8a6-87dd-b811-fd82-0292ea575935@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1a46b8a6-87dd-b811-fd82-0292ea575935@linaro.org>
Subject: Re: [OpenRISC] [PATCH v3 10/13] or1k: ABI lists
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
Cc: Florian Weimer <fweimer@redhat.com>,
 Openrisc <openrisc@lists.librecores.org>,
 GLIBC patches <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBEZWMgMjIsIDIwMjEgYXQgMDU6MjA6MTBQTSAtMDMwMCwgQWRoZW1lcnZhbCBaYW5l
bGxhIHdyb3RlOgo+IAo+IAo+IE9uIDEwLzEyLzIwMjEgMjA6MzQsIFN0YWZmb3JkIEhvcm5lIHZp
YSBMaWJjLWFscGhhIHdyb3RlOgo+IAo+ID4gZGlmZiAtLWdpdCBhL3N5c2RlcHMvdW5peC9zeXN2
L2xpbnV4L29yMWsvbGQuYWJpbGlzdCBiL3N5c2RlcHMvdW5peC9zeXN2L2xpbnV4L29yMWsvbGQu
YWJpbGlzdAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAuLmM0
Yjg1YzhhMzMKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL3N5c2RlcHMvdW5peC9zeXN2L2xp
bnV4L29yMWsvbGQuYWJpbGlzdAo+ID4gQEAgLTAsMCArMSw1IEBACj4gPiArR0xJQkNfMi4zNSBf
X2xpYmNfc3RhY2tfZW5kIEQgMHg0Cj4gPiArR0xJQkNfMi4zNSBfX3N0YWNrX2Noa19ndWFyZCBE
IDB4NAo+ID4gK0dMSUJDXzIuMzUgX190bHNfZ2V0X2FkZHIgRgo+ID4gK0dMSUJDXzIuMzUgX2Rs
X21jb3VudCBGCj4gPiArR0xJQkNfMi4zNSBfcl9kZWJ1ZyBEIDB4MTQKPiAKPiBZb3Ugd2lsbCBu
ZWVkIHRvIHJlZ2VuZXJhdGUgaXQgdG8gaW5jbHVkZSB0aGUgcnNlcSBzeW1ib2xzOgo+IAo+IEdM
SUJDXzIuMzUgX19yc2VxX2ZsYWdzIEQgMHg0Cj4gR0xJQkNfMi4zNSBfX3JzZXFfb2Zmc2V0IEQg
MHg0Cj4gR0xJQkNfMi4zNSBfX3JzZXFfc2l6ZSBEIDB4NAoKT0ssIEkgd2lsbCByZWdlbmVyYXRl
LCB0aGlzIHBhdGNoIHNlcmllcyB3YXMgZ2VuZXJhdGVkIGZyb20gYmVmb3JlCnRoZXNlIHN5bWJv
bHMgd2VyZSBpbnRyb2R1Y2VkLgoKPiA+IGRpZmYgLS1naXQgYS9zeXNkZXBzL3VuaXgvc3lzdi9s
aW51eC9vcjFrL2xpYkJyb2tlbkxvY2FsZS5hYmlsaXN0IGIvc3lzZGVwcy91bml4L3N5c3YvbGlu
dXgvb3Ixay9saWJCcm9rZW5Mb2NhbGUuYWJpbGlzdAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQK
PiA+IGluZGV4IDAwMDAwMDAwMDAuLjM2NmMzOTMyNzQKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsr
KyBiL3N5c2RlcHMvdW5peC9zeXN2L2xpbnV4L29yMWsvbGliQnJva2VuTG9jYWxlLmFiaWxpc3QK
PiA+IEBAIC0wLDAgKzEgQEAKPiA+ICtHTElCQ18yLjM1IF9fY3R5cGVfZ2V0X21iX2N1cl9tYXgg
Rgo+ID4gZGlmZiAtLWdpdCBhL3N5c2RlcHMvdW5peC9zeXN2L2xpbnV4L29yMWsvbGliYW5sLmFi
aWxpc3QgYi9zeXNkZXBzL3VuaXgvc3lzdi9saW51eC9vcjFrL2xpYmFubC5hYmlsaXN0Cj4gPiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMC4uYzY0Mzc4MDlkYgo+ID4g
LS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvc3lzZGVwcy91bml4L3N5c3YvbGludXgvb3Ixay9saWJh
bmwuYWJpbGlzdAo+ID4gQEAgLTAsMCArMSBAQAo+ID4gK0dMSUJDXzIuMzUgX19saWJhbmxfdmVy
c2lvbl9wbGFjZWhvbGRlciBGCj4gCj4gVGhpcyBkb2VzIHNlZW1zIHJpZ2h0LCBvcjFrIHNob3Vs
ZCBub3QgcmVxdWlyZSB0aGUgcGxhY2Vob2xkZXIuICBJIHRoaW5rCj4gd2UgYXJlIG1pc3Npbmcg
YSBTSExJQl9DT01QQVQgb24gcmVzb2x2L2xpYmFubC1jb21wYXQuYzoKPiAKPiBkaWZmIC0tZ2l0
IGEvcmVzb2x2L2xpYmFubC1jb21wYXQuYyBiL3Jlc29sdi9saWJhbmwtY29tcGF0LmMKPiBpbmRl
eCAyOWRmNzZmMjc4Li4wMmMxOGJkZTkwIDEwMDY0NAo+IC0tLSBhL3Jlc29sdi9saWJhbmwtY29t
cGF0LmMKPiArKysgYi9yZXNvbHYvbGliYW5sLWNvbXBhdC5jCj4gQEAgLTMwLDYgKzMwLDggQEAg
X19saWJhbmxfdmVyc2lvbl9wbGFjZWhvbGRlcl8xICh2b2lkKQo+ICB7Cj4gIH0KPiAgCj4gKyMg
aWYgU0hMSUJfQ09NUEFUIChsaWJhbmwsIEdMSUJDXzJfMl8zLCBHTElCQ18yXzM0KQo+ICBjb21w
YXRfc3ltYm9sIChsaWJhbmwsIF9fbGliYW5sX3ZlcnNpb25fcGxhY2Vob2xkZXJfMSwKPiAgICAg
ICAgICAgICAgICAgX19saWJhbmxfdmVyc2lvbl9wbGFjZWhvbGRlciwgR0xJQkNfMl8yXzMpOwo+
ICsjIGVuZGlmCj4gICNlbmRpZgoKSSBjb25maXJtIHRoaXMgZml4ZXMgdGhlIGlzc3VlLgoKPiA+
IGRpZmYgLS1naXQgYS9zeXNkZXBzL3VuaXgvc3lzdi9saW51eC9vcjFrL2xpYnV0aWwuYWJpbGlz
dCBiL3N5c2RlcHMvdW5peC9zeXN2L2xpbnV4L29yMWsvbGlidXRpbC5hYmlsaXN0Cj4gPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMC4uZjMzYjg0ODEzYgo+ID4gLS0t
IC9kZXYvbnVsbAo+ID4gKysrIGIvc3lzZGVwcy91bml4L3N5c3YvbGludXgvb3Ixay9saWJ1dGls
LmFiaWxpc3QKPiA+IEBAIC0wLDAgKzEgQEAKPiA+ICtHTElCQ18yLjM1IF9fbGlidXRpbF92ZXJz
aW9uX3BsYWNlaG9sZGVyIEYKPiAKPiBUaGlzIGFsc28gZG9lcyBub3Qgc2VlbXMgcmlnaHQsIGxp
YnV0aWwtY29tcGF0IHdpbGwgb25seSBidWlsdCBmb3IKPiBoYXZlLUdMSUJDXzIuMzMsIHdoaWNo
IGlzIG5vdCB0aGUgY2FzZS4KCkkgdGhpbmsgdGhpcyBmaWxlIGlzIGxlZnRvdmVyIG5vdyB0aGF0
IGxpYnV0aWwgaXMganVzdCBhbiBsaWJ1dGlsLmEKdXBkYXRlLWFiaSBnZW5lcmF0ZXMgbm90aGlu
Zy4KCkkgaGF2ZSBqdXN0IGRlbGV0ZWQgdGhlIGZpbGUuICBjaGVjay1hYmkgc2VlbXMgdG8gd29y
ayBvay4KCk5vdGUsIEkgYWxkbyBkZWxldGUgdGhlIG90aGVyIGJsYW5rIGFiaWxpc3QgZmlsZXMu
IFNvOgoKICAgICAgICBkZWxldGVkOiAgICBzeXNkZXBzL3VuaXgvc3lzdi9saW51eC9vcjFrL2xp
YmFubC5hYmlsaXN0CiAgICAgICAgZGVsZXRlZDogICAgc3lzZGVwcy91bml4L3N5c3YvbGludXgv
b3Ixay9saWJkbC5hYmlsaXN0CiAgICAgICAgZGVsZXRlZDogICAgc3lzZGVwcy91bml4L3N5c3Yv
bGludXgvb3Ixay9saWJwdGhyZWFkLmFiaWxpc3QKICAgICAgICBkZWxldGVkOiAgICBzeXNkZXBz
L3VuaXgvc3lzdi9saW51eC9vcjFrL2xpYnJ0LmFiaWxpc3QKICAgICAgICBkZWxldGVkOiAgICBz
eXNkZXBzL3VuaXgvc3lzdi9saW51eC9vcjFrL2xpYnV0aWwuYWJpbGlzdAoKLVN0YWZmb3JkCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1h
aWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxp
YnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
