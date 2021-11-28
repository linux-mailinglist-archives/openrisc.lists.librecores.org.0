Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 5424D460A81
	for <lists+openrisc@lfdr.de>; Sun, 28 Nov 2021 23:01:06 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id F16AC209D6;
	Sun, 28 Nov 2021 23:01:05 +0100 (CET)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by mail.librecores.org (Postfix) with ESMTPS id DD21222D3C
 for <openrisc@lists.librecores.org>; Sun, 28 Nov 2021 15:46:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1638110817;
 bh=+bY6TYcPFwDMZQ0Lrid1hXzHUZDSPEndiXOu83d2o8A=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=UISesdJhATNYWodu23qjWrUJsc2LKC5R5uYXIczysfuWaEDupLxc/g6r+aLN54umc
 HuSHOFneQMFFESs6fcEpu10oqBD/hR1GYh/3IEeDFjHDhJL2wKPjYSlOzDK2spP4n5
 ebv8VSlphoC+TXf8COf/OGYeAVAO1eTjtIiFnkWc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.178.46] ([94.134.100.160]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MiaYJ-1mMf8o35yJ-00fl3b; Sun, 28
 Nov 2021 15:46:57 +0100
To: Julius Baxter <juliusbaxter@gmail.com>
References: <CAF6YiZ5=4+bGKipC0-cScNsd2s+4PGwTchXAJTtETF47AukpLQ@mail.gmail.com>
 <CAF6YiZ5f=LsBeMTF1+8q9697qNHbE57rjdftAQ4H0ackpt-u2Q@mail.gmail.com>
From: Jidan Al-Eryani <jidan@gmx.net>
Message-ID: <6122161a-80ea-7fbe-4fb1-4763410dbdcc@gmx.net>
Date: Sun, 28 Nov 2021 15:46:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAF6YiZ5f=LsBeMTF1+8q9697qNHbE57rjdftAQ4H0ackpt-u2Q@mail.gmail.com>
Content-Language: en-US
X-Provags-ID: V03:K1:uiv9jMeq86BladAgJCJc1Wj/doEssT6DYyk0qBtAJkK79UVARkp
 MFjhJ2WACNQRSt8DaFfIl6vQZr/ULgfLNTIgS4ZVgnaR6z73PydriDvsgppFHUuxE7pP9xl
 RUx1U0T8Cs4z7Gy77Jn28BY/9kIhuKUn+hbf/DOrGRJF/YUJPWYlbt5itCGdtzySdTsD/Mj
 RsvmrFVGtSCGJAcEkRFwQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Qkcim0Owi5M=:x5vneaYCDymKrNh4N0u4yC
 1+1icGd+u2aEETy+fptieVtP8IGmzmaVSsTBvT9l1DE2VcCrKG5xyEQAjeSmXQhYxkO+qOPc7
 Jm0CGGFYz59rnmsXAG+djeZUJ0/XUC2+VpdCwgr1EG8DxHPg/NRhwrWPwDDn+AcGZSOr3fwv7
 1TqNVZcqfzmeH5IpMd9caJMTyKbcC9vaPD4e/l2cGsZ3HgRxOx2HbuWNzxYpCUmI3+2iVbOV7
 rZoTTQ+6o6ZHBvKZc8s9XUF+FrYxomAMhDpwUQLRrN6geW4KOd4qbWqqy4luXq0lX9YAX8w52
 SHKh00TPO1oeLBwFXBJvju4Ji2lKY5p4mwjXNOtMtRSVYWSHm7zWBKuxIMXkUbSyacZg/idku
 LJtZuS4f4NoAaWdz5amrSJft6lyOmNPallkUbp99SPGCb3PKd1n3aJMXT+Zu1uLATLdjjbxZw
 5kuH1ozQ3T8+gQuV15ilj+dGCDMSAtQtHXzzfpWGfBWQ4a20jsfB40e9kIk3QkWUQnUS0UPc8
 bIf64WcmH0ployzdxhFn+9BxmNzsYhdLowlGUjjazg48bGwbUyyOxwpnjEeUGN8cgBSRcrTUX
 xnOPGiLfQ3eE+m2HjQjsqP96L7r/VmyearvGJ9wf242ggsbRuicxUGybsbTXYcbF47Sn9I/kw
 Z8mY0KwOlMm9wlU1qFm1zJ8sVClJmQM6/+Q8XeCymSEnimBNAH+dRa1DjU7MXDeqLQiSck0S+
 2OjH6Wtg1qLMA+qGKKK83LDbdEaItGIqL6i0ZlyHueUDtgp8S/fp3F1Xll5YB6D+IvM8RX9a8
 /iIMiY3c+zHVhSgt+kxPLSOoHQlLOEnzkxkZi26AWjN1BmQ4qtHEn0pmsS4P8is8l6ZkfLbsA
 F6c07RJAPD5aLq8AslCX+zqmgtZh8ggaFdhADkrDnkXRYjg2p6tDb7mQ82hoGsVN2voJeiaPd
 guPL3FyE3hCEDDAhjdPqorBDAMxd2i3BKBUN6qxTEHixtdm4ry+yL3lKIg/FHtVZS4lmzWMMA
 nkGsAZLSaJbGmuVcv55UXrHDlRvoZqvetKEEcx/h2//DmIF3DvlvcWPyUTU9bREDDsrpXBTBq
 45smjjKB64pkVY=
X-Mailman-Approved-At: Sun, 28 Nov 2021 23:01:04 +0100
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgSnVsaXVzLAoKSSBkb24ndCB0aGluayB5b3UgbmVlZCBteSBwZXJtaXNzaW9uIGZvciB0aGlz
LCBidXQgdGhhbmtzIGFueXdheSBmb3IKYXNraW5nLiBQbGVhc2UgZG8gYXMgeW91IHdpc2guCkl0
J3MgYW1hemluZyBob3cgPjEwIHllYXJzIHBhc3Mgc28gZmFzdC4uLgoKV2lzaCB5b3UgYWxsIHRo
ZSBiZXN0IGFuZCB0YWtlIGNhcmUhCkppZGFuCgpPbiAyOC8xMS8yMDIxIDA0OjM5LCBKdWxpdXMg
QmF4dGVyIHdyb3RlOgo+IE9uIFN1biwgMjggTm92IDIwMjEgYXQgMTQ6MjUsIEp1bGl1cyBCYXh0
ZXIgPGp1bGl1c2JheHRlckBnbWFpbC5jb20+IHdyb3RlOgo+PiBIaSBKaWRhbiwKPj4KPj4gSSdt
IGdldHRpbmcgaW4gdG91Y2ggYmVjYXVzZSBJIHdhbnQgdG8gYXNrIHlvdXIgcGVybWlzc2lvbiB0
bwo+PiByZWxpY2Vuc2Ugc29tZSBvZiB5b3VyIEZQVSBjb2RlLgo+Pgo+PiBJIHBvcnRlZCB5b3Vy
IFZIREwgRlBVIGRlc2lnbiB0byBWZXJpbG9nIG1hbnkgeWVhcnMgYWdvICgyMDEwIEkgdGhpbmsp
Cj4+IGFuZCBpdCdzIHNpbmNlIGJlZW4gaW5jbHVkZWQgaW4gdGhlIG1vcjFreCBPcGVuUklTQyBD
UFUgcHJvamVjdCBieQo+PiBBbmRyZXkgQmFjaGVyb3YgKENDJ2VkKS4KPj4KPj4gRXhhbXBsZTog
aHR0cHM6Ly9naXRodWIuY29tL29wZW5yaXNjL21vcjFreC9ibG9iL21hc3Rlci9ydGwvdmVyaWxv
Zy9wZnB1MzIvcGZwdTMyX2FkZHN1Yi52Cj4+Cj4+IEl0J3MgY3VycmVudGx5IGdvdCB3aGF0IGxv
b2tzIGxpa2UgYSBwZXJtaXNzaXZlIGxpY2VuY2UgKGFzIHlvdSBjYW4KPj4gc2VlIGluIHRoZSBs
aW5rIGFib3ZlKSBidXQgSSB3b3VsZCBsaWtlIHRvIGFzayBpZiB3ZSBjYW4gcmVsaWNlbnNlIHRo
ZQo+PiBjb2RlIHVuZGVyIHRoZSBDRVJOIE9ITCBWMiB3ZWFrbHkgcGVybWlzc2l2ZSBsaWNlbmNl
Lgo+IENvcnJlY3Rpb246IHJlbGljZW5zZSB0aGUgY29kZSB1bmRlciB0aGUgQ0VSTiBPSEwgdjIg
d2Vha2x5Cj4gX3JlY2lwcm9jYWxfIGxpY2VuY2UuCj4KPj4gSW4gc3VtbWFyeSwgdGhpcyBsaWNl
bmNlIGlzIGEgZmlsZS1sZXZlbCBjb3B5cmlnaHQgZm9yIGhhcmR3YXJlCj4+IGRlc2lnbnMuIFRo
ZSBGQVEgb24gQ0VSTidzIHNpdGUgYWJvdXQgdGhlIE9ITCBpcyBncmVhdCBmb3IgZXhwbGFuaW5n
Cj4+IHdoYXQgdGhlIE9ITCB2MiBpcyB3aGF0IHRoZSBXIHZhcmlhbnQgbWVhbnM6Cj4+IGh0dHBz
Oi8vb2h3ci5vcmcvcHJvamVjdC9jZXJub2hsL3dpa2lzL2ZhcSNxLXdoYXQtYXJlLWFsbC10aGVz
ZS1zdWZmaXhlcwo+Pgo+PiBUaGlzIHdvdWxkIG9ubHkgYXBwbHkgdG8gdGhpcyBjb3B5IG9mIHRo
ZSBzb3VyY2UuIEl0IGRvZXMgbm90IGFmZmVjdAo+PiB0aGUgb3RoZXIgY29waWVzIHdoaWNoIGFy
ZSBvdXQgdGhlcmUgb24gdGhlIGludGVybmV0LiBJIG9ubHkgYXNrIHRoaXMKPj4gZm9yIGNvbnNp
c3RlbmN5IGFjcm9zcyB0aGUgbW9yMWt4IENQVSBwcm9qZWN0Lgo+Pgo+PiBZb3VyIHBlcm1pc3Np
b24gdG8gZG8gdGhpcyB3b3VsZCBiZSBncmVhdGx5IGFwcHJlY2lhdGVkLgo+Pgo+PiBIYXBweSB0
byBhbnN3ZXIgYW55IG90aGVyIHF1ZXN0aW9ucyB5b3UgaGF2ZS4KPj4KPj4gQ2hlZXJzLAo+PiBK
dWxpdXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9w
ZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczov
L2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
