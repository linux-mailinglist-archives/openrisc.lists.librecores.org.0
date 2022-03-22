Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 66A964E47C9
	for <lists+openrisc@lfdr.de>; Tue, 22 Mar 2022 21:53:07 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C4A6F242D3;
	Tue, 22 Mar 2022 21:53:06 +0100 (CET)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mail.librecores.org (Postfix) with ESMTPS id C633124857
 for <openrisc@lists.librecores.org>; Tue, 22 Mar 2022 19:18:21 +0100 (CET)
Received: by mail-wr1-f50.google.com with SMTP id u16so23612264wru.4
 for <openrisc@lists.librecores.org>; Tue, 22 Mar 2022 11:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Au0wuGbmyZQRc3YRooDi+lrIszQt6rNnlcrfEDXqtwM=;
 b=mXhuIMjn3uChtCcb9K8CZhFjjPYtbSBGn8NMsUNFxDideafXuSwJUpedM6R5NkuD41
 FWodwy/Zvv2BSJCJ6e32JpS18fFx7FY0lvk37TkItGCwdtB+yU5idyhXuiemVKE18V0C
 l0QquQJW2o06l3mJTYCKgD3MpzmwURJInuRHOM7HTvRdIxV6/dKbwY9BEuIJdlyqLswQ
 yu7D6bN6COkQhTMw+tRbDgkQycyMvHZLHG/AH8r/GHfE9g148SbWHA7YERGAvqYSLwn3
 v0FU5xXPaWOTSku+mt5Szj0T2gQQXoVEKOnOWDR7bAukdFSUyKm3n3XOLAHcO2q3zcsw
 dfoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Au0wuGbmyZQRc3YRooDi+lrIszQt6rNnlcrfEDXqtwM=;
 b=z52u+aMhDWgZjCzellkseJ8bCXQZapl/dkEL2DdscEfFJ5yPNxbrE4ZEOJh5llW3/B
 C8SwEzmSQkU9P+sGj1afVtj8geylRIjLvWXVZqTe/GHO25nVg85u6r4KIEmCOGx/M28y
 /thxj5GVE039WVH7OhVWCh/qNQjHVcoHDBCLVl7MzU3PP8dPP2vxD60yMHIdsBkNAhmV
 oexZ61aL1F7rK3+bn202VImAzHGocw7PEbrye+uriCkUqAZWzo2UcU8+sijYvSol8kKi
 LXA/EwlFtYAKZ/SJTOq4COzL2f5/2wV8qCoO012YeFg4Z2pfFxc84KvK3MEDwqe0Ihl6
 7HcQ==
X-Gm-Message-State: AOAM530WSbN8iYGTNZeKRX3g0sW6FloEKkd7JA6wojaZDqC0lmB08dyU
 FnR/MKK8Dby+IQ2eeB+xBN30eQ==
X-Google-Smtp-Source: ABdhPJzo+v251N7F/kHeIIlbL9L7OkMaXL6JiW+aiVCl9WMXHup3N+5Shv6bcH5nGjpVfy+o5CVcdw==
X-Received: by 2002:adf:fe8d:0:b0:203:e02e:c6c7 with SMTP id
 l13-20020adffe8d000000b00203e02ec6c7mr23986364wrr.37.1647973101291; 
 Tue, 22 Mar 2022 11:18:21 -0700 (PDT)
Received: from [192.168.2.116] ([109.76.4.19])
 by smtp.gmail.com with ESMTPSA id
 z13-20020a5d440d000000b00203f2b010b1sm11796069wrq.44.2022.03.22.11.18.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 11:18:20 -0700 (PDT)
Message-ID: <c0328672-6dd1-b65b-1e2f-6f2562084f2d@conchuod.ie>
Date: Tue, 22 Mar 2022 18:18:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org
References: <20220316232600.20419-1-palmer@rivosinc.com>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <20220316232600.20419-1-palmer@rivosinc.com>
X-Mailman-Approved-At: Tue, 22 Mar 2022 21:53:05 +0100
Subject: Re: [OpenRISC] [PATCH 0/5] Generic Ticket Spinlocks
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
Cc: jonas@southpole.se, linux-arch@vger.kernel.org, wangkefeng.wang@huawei.com,
 aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>, peterz@infradead.org,
 boqun.feng@gmail.com, linux-kernel@vger.kernel.org, mingo@redhat.com,
 Palmer Dabbelt <palmer@dabbelt.com>, jszhang@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, longman@redhat.com,
 Will Deacon <will@kernel.org>, openrisc@lists.librecores.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gMTYvMDMvMjAyMiAyMzoyNSwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4gUGV0ZXIgc2VudCBh
biBSRkMgb3V0IGFib3V0IGEgeWVhciBhZ28KPiA8aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGtt
bC9ZSGJCQnVWRk5uSTRramozQGhpcmV6LnByb2dyYW1taW5nLmtpY2tzLWFzcy5uZXQvPiwKPiBi
dXQgYWZ0ZXIgYSBzcGlyaXRlZCBkaXNjdXNzaW9uIGl0IGxvb2tzIGxpa2Ugd2UgbG9zdCB0cmFj
ayBvZiB0aGluZ3MuCj4gSUlSQyB0aGVyZSB3YXMgYnJvYWQgY29uc2Vuc3VzIG9uIHRoaXMgYmVp
bmcgdGhlIHdheSB0byBnbywgYnV0IHRoZXJlCj4gd2FzIGEgbG90IG9mIGRpc2N1c3Npb24gc28g
SSB3YXNuJ3Qgc3VyZS4gIEdpdmVuIHRoYXQgaXQncyBiZWVuIGEgeWVhciwKPiBJIGZpZ3VyZWQg
aXQnZCBiZSBiZXN0IHRvIGp1c3Qgc2VuZCB0aGlzIG91dCBhZ2FpbiBmb3JtYXR0ZWQgYSBiaXQg
bW9yZQo+IGV4cGxpY2l0bHkgYXMgYSBwYXRjaC4KPiAKPiBUaGlzIGhhcyBoYWQgYWxtb3N0IG5v
IHRlc3RpbmcgKGp1c3QgYSBidWlsZCB0ZXN0IG9uIFJJU0MtViBkZWZjb25maWcpLAo+IGJ1dCBJ
IHdhbnRlZCB0byBzZW5kIGl0IG91dCBsYXJnZWx5IGFzLWlzIGJlY2F1c2UgSSBkaWRuJ3QgaGF2
ZSBhIFNPQgo+IGZyb20gUGV0ZXIgb24gdGhlIGNvZGUuICBJIGhhZCBzZW50IGFyb3VuZCBzb21l
dGhpbmcgc29ydCBvZiBzaW1pbGFyIGluCj4gc3Bpcml0LCBidXQgdGhpcyBsb29rcyBjb21wbGV0
ZWx5IHJlLXdyaXR0ZW4uICBKdXN0IHRvIHBsYXkgaXQgc2FmZSBJCj4gd2FudGVkIHRvIHNlbmQg
b3V0IGFsbW9zdCBleGFjdGx5IGFzIGl0IHdhcyBwb3N0ZWQuICBJJ2QgcHJvYmFibHkgcmVuYW1l
Cj4gdGhpcyB0c3BpbmxvY2sgYW5kIHRzcGlubG9ja190eXBlcywgYXMgdGhlIG1pcy1tYXRjaCBr
aW5kIG9mIG1ha2VzIG15Cj4gZXllcyBnbyBmdW5ueSwgYnV0IEkgZG9uJ3QgcmVhbGx5IGNhcmUg
dGhhdCBtdWNoLiAgSSdsbCBhbHNvIGdvIHRocm91Z2gKPiB0aGUgb3RoZXIgcG9ydHMgYW5kIHNl
ZSBpZiB0aGVyZSdzIGFueSBtb3JlIGNhbmRpZGF0ZXMsIEkgc2VlbSB0bwo+IHJlbWVtYmVyIHRo
ZXJlIGhhdmluZyBiZWVuIG1vcmUgdGhhbiBqdXN0IE9wZW5SSVNDIGJ1dCBpdCdzIGJlZW4gYQo+
IHdoaWxlLgo+IAo+IEknbSBpbiBubyBiaWcgcnVzaCBmb3IgdGhpcyBhbmQgZ2l2ZW4gdGhlIGNv
bXBsZXggSFcgZGVwZW5kZW5jaWVzIEkKPiB0aGluayBpdCdzIGJlc3QgdG8gdGFyZ2V0IGl0IGZv
ciA1LjE5LCB0aGF0J2QgZ2l2ZSB1cyBhIGZ1bGwgbWVyZ2UKPiB3aW5kb3cgZm9yIGZvbGtzIHRv
IHRlc3QvYmVuY2htYXJrIGl0IG9uIHRoZWlyIHN5c3RlbXMgdG8gbWFrZSBzdXJlIGl0J3MKPiBP
Sy4KCklzIHRoZXJlIGEgc3BlY2lmaWMgd2F5IHlvdSBoYXZlIGJlZW4gdGVzdGluZy9iZW5jaGlu
ZyB0aGluZ3MsIG9yIGlzIGl0IApqdXN0IGEgY2FzZSBvZiB0ZXN0IHdoYXQgd2Ugb3Vyc2VsdmVz
IGNhcmUgYWJvdXQ/CgpUaGFua3MsCkNvbm9yLgoKPiBSSVNDLVYgaGFzIGEgZm9yd2FyZCBwcm9n
cmVzcyBndWFyYW50ZWUgc28gd2Ugc2hvdWxkIGJlIHNhZmUsIGJ1dAo+IHRoZXNlIGNhbiBhbHdh
eXMgdHJpcCB0aGluZ3MgdXAuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVz
Lm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
