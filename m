Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A5E663A2E93
	for <lists+openrisc@lfdr.de>; Thu, 10 Jun 2021 16:49:12 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 4C87221535;
	Thu, 10 Jun 2021 16:49:12 +0200 (CEST)
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by mail.librecores.org (Postfix) with ESMTP id BF1D520D7A
 for <openrisc@lists.librecores.org>; Thu, 10 Jun 2021 16:49:10 +0200 (CEST)
Received: from [192.168.126.129] ([146.241.205.41])
 by Aruba Outgoing Smtp  with ESMTPSA
 id rLzXlNTyLHsEwrLzXlX2rW; Thu, 10 Jun 2021 16:49:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1623336550; bh=5sOKlgqmPqC9lVxcjCjH7CDpSD2HyVly/EoVUzjTdSo=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=GEMO9nGroG0QpbVFLSN+T2GhIptOSmyc/NqZ713h7sT8X11aORU27PjKuxIlHC+9w
 rx1vQTa++Os3C7fWoPbHTmw4mZyytrI7ax8+VZvCN3wc3dXafYAYxfQwuuzKliA9Es
 DqGTBHKAd7+5hzXBHUjgPMwOoMdrY2nIOoQCxmUclrIYadHhzM9rBy3k8qOhYBcOzM
 jbvFAz7iSS6wrsauVJVX4Um5i2Z+57jGnYyNaY2NxKuau5vXwG2kQL7taIg8IvIcjg
 fBEGjRW5CkzU3QhBvkUQtBx+1/03UTfiUeF11cV3KYMFO3X1FqA8OOZ11eFI8SyTw+
 L8PfNDlJIahkQ==
To: Alan Modra <amodra@gmail.com>
References: <YME2SzQdpj/AVz/2@antec>
 <20210609215233.1611478-1-giulio.benetti@benettiengineering.com>
 <YMFosi4vsWnxf9Sj@bubble.grove.modra.org>
 <3ef9acac-9f1a-2aab-1c9e-a0d4aaae6ccd@benettiengineering.com>
 <YMIOVK3h+AooX4DR@bubble.grove.modra.org>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <b84656ba-bbae-b5ea-c61f-08230b324102@benettiengineering.com>
Date: Thu, 10 Jun 2021 16:48:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YMIOVK3h+AooX4DR@bubble.grove.modra.org>
Content-Language: en-US
X-CMAE-Envelope: MS4wfA6oq6DOrikNONkrc45YLksQ/QXrjzSUUNRh3RSgfq2T+8iMOuot3L6bzz4/9nY5vPLW2zls/Ens6DhBUEfnt3CNWAOsPTdlIbGTQrB/lEJykzdAbpml
 kvPzDd92a+WKSCYZu7SLaY1fEbN6OTUxsKjJml+8k76v9tyqqaV0LJYl7zoV7awZrgtJ7BDEv/6PipTJjy0cQHqJmGVrp7opP72vjP4uJ3BaLHNkAu8Qnrw0
 9YZsSx8+d8TirxpvFOb3zxnWvf9XCOpyL5Xrh6v3x4sThRerKUfAB328Ml6opcf/6F+KbIlgPwShimr5dHe8WKKMP/nmgWjiWV+V8A9Rw1I=
Subject: Re: [OpenRISC] [PATCH v2] bfd/elf32-or1k: fix building with gcc
 version < 5
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGVsbG8gQWxhbiwgQWxsLAoKT24gNi8xMC8yMSAzOjA2IFBNLCBBbGFuIE1vZHJhIHdyb3RlOgo+
IE9uIFRodSwgSnVuIDEwLCAyMDIxIGF0IDExOjA3OjEzQU0gKzAyMDAsIEdpdWxpbyBCZW5ldHRp
IHdyb3RlOgo+PiBIZWxsbyBBbGFuLCBBbGwsCj4+Cj4+IE9uIDYvMTAvMjEgMzoxOSBBTSwgQWxh
biBNb2RyYSB3cm90ZToKPj4+IE9uIFdlZCwgSnVuIDA5LCAyMDIxIGF0IDExOjUyOjMzUE0gKzAy
MDAsIEdpdWxpbyBCZW5ldHRpIHdyb3RlOgo+Pj4+IEdjYyB2ZXJzaW9uID49IDUgaGFzIHN0YW5k
YXJkIEMgbW9kZSBub3Qgc2V0IHRvIC1zdGQ9Z251MTEsIHNvIGlmIHdlIHVzZQo+Pj4+IGFuIG9s
ZCBjb21waWxlcihpLmUuIGdjYyA0LjkpIGJ1aWxkIGZhaWxzIG9uOgo+Pj4+IGBgYAo+Pj4+IGVs
ZjMyLW9yMWsuYzoyMjUxOjM6IGVycm9yOiAnZm9yJyBsb29wIGluaXRpYWwgZGVjbGFyYXRpb25z
IGFyZSBvbmx5IGFsbG93ZWQgaW4KPj4+PiBDOTkgb3IgQzExIG1vZGUKPj4+PiAgICAgICBmb3Ig
KHNpemVfdCBpID0gMDsgaSA8IGluc25fY291bnQ7IGkrKykKPj4+PiAgICAgICBeCj4+Pj4gYGBg
Cj4+Pgo+Pj4gRGlkIHlvdSBmaW5kIHRoaXMgcHJvYmxlbSBvbiBjdXJyZW50IG1haW5saW5lIGJp
bnV0aWxzPyAgVGhlIGNvbmZpZ3VyZQo+Pj4gbWFjaGluZXJ5IGlzIHN1cHBvc2VkIHRvIHN1cHBs
eSB0aGUgYXBwcm9wcmlhdGUgLXN0ZD1jOTkgb3IgLXN0ZD1nbnU5OQo+Pj4gd2hlbiB1c2luZyBv
bGRlciBjb21waWxlcnMuICBUaGF0IGhhcHBlbnMgZm9yIG1lIHdoZW4gSSBidWlsZCB3aXRoCj4+
PiBnY2MtNC45LiAgSSBkb24ndCB0aGluayBhbnkgcGF0Y2ggaXMgbmVlZGVkIGZvciBtYWlubGlu
ZS4KPj4+Cj4+Cj4+IE9uIEJ1aWxkcm9vdCB0aGV5IGRvbid0IHBhc3MgLXN0ZD1jOTkvZzk5IGFu
ZCB0aGlzIGlzIHRoZSByZXN1bHQ6Cj4+IGh0dHBzOi8vZ2l0bGFiLmNvbS9ib290bGluL3Rvb2xj
aGFpbnMtYnVpbGRlci8tL2pvYnMvMTMyNTY0NjI5OAo+IAo+IFRoYXQgYXBwZWFycyB0byBiZSBi
dWlsZGluZyBiaW51dGlscyAyLjM1LjIKPiAKPj4gVGhpcyBwYXRjaCBzZWVtcyB0byBmb2xsb3cg
YWxsIHRoZSByZXN0IGNvZGUgc3R5bGUgb2YgYmludXRpbHMKPiAKPiBUcnVlLCB3ZSd2ZSBvbmx5
IGp1c3Qgc3dpdGNoZWQgb3ZlciB0byByZXF1aXJpbmcgQzk5LgoKT2sgc28uLi4KCj4+IHNpbmNl
IG5vCj4+IG90aGVyIHBhcnQgb2YgaXQgZmFpbHMgYW5kIHRoaXMgaGFwcGVucyBvbmx5IGFmdGVy
IHBhdGNoIFsxXSBoYXMgYmVlbgo+PiB1cHN0cmVhbWVkLgo+Pgo+PiBIZXJlIFsyXSB5b3UgY2Fu
IHNlZSBhbGwgdGhlIG90aGVyIHRvb2xjaGFpbnMgYnVpbHQgc3VjY2VzZnVsbHkgYW5kIG9ubHkK
Pj4gT3BlbnJpc2MgZmFpbHMgYWZ0ZXIgdGhlIHBhdGNoIHByb3ZpZGVkIGJ5IFN0YWZmb3JkKFsx
XSkuCj4+Cj4+IFsxXTogaHR0cDovL3BhdGNoZXMtdGN3Zy5saW5hcm8ub3JnL3BhdGNoLzUzMTUx
Lwo+PiBbMl06IGh0dHBzOi8vZ2l0bGFiLmNvbS9ib290bGluL3Rvb2xjaGFpbnMtYnVpbGRlci8t
L2pvYnMKPiAKPiBPSywgc28gdGhlIHJlYWwgcHJvYmxlbSBpcyBpbiBhIGJhY2twb3J0LiAgSXQg
aXNuJ3QgY3VycmVudCBtYWlubGluZQo+IGJpbnV0aWxzIGNvbmZpZ3VyZSwgd2hpY2ggaXMgd2hh
dCBJIHdhcyB3b3JyaWVkIGFib3V0LgoKLi4uaXQgaGFwcGVucyBvbiBtYWlubGluZSB0b28gYnV0
IGl0IGNhbiBiZSBzb2x2ZWQgYnkgYWRkaW5nIC1zdGQ9Yzk5IHRvIApDRkxBR1MuCgo+IEJUVywg
dGhhbmsgeW91IGZvciBwb3N0aW5nIGEgZml4IGhlcmUsIGV2ZW4gaWYgaXQgaXNuJ3Qgc3RyaWN0
bHkKPiBuZWNlc3NhcnkgZm9yIG1haW5saW5lLiAgUGxlYXNlIG5vdGUgdGhhdCBJJ20gbm90IGFk
dm9jYXRpbmcgYWdhaW5zdAo+IHlvdXIgcGF0Y2guICBJZiB0YXJnZXQgbWFpbnRhaW5lcnMgd2Fu
dCB0byBrZWVwIHRoZWlyIGNvZGUgY29tcGF0aWJsZQo+IHdpdGggQzg5IHRoYXQncyBmaW5lIGJ5
IG1lLgo+CkkgZGlkbid0IGtub3cgYWJvdXQgdGhpcyBzaW5jZSBubyBvdGhlciBmaWxlIGZhaWxl
ZCBidWlsZGluZyBvbiBDOTkuIApXaGF0IGl0IHNlZW1zIHN0cmFuZ2UgdG8gbWUgaXMgdGhhdCBv
biBidWlsZHJvb3QgYmludXRpbHMgc2VlbSB0byBiZSAKYnVpbHQgd2l0aG91dCAtc3RkPWM5OQoK
QmVzdCByZWdhcmRzCi0tIApHaXVsaW8gQmVuZXR0aQpCZW5ldHRpIEVuZ2luZWVyaW5nIHNhcwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBt
YWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5s
aWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
