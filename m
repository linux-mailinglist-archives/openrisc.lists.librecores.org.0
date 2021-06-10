Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2C12F3A27C7
	for <lists+openrisc@lfdr.de>; Thu, 10 Jun 2021 11:07:17 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D733820DB6;
	Thu, 10 Jun 2021 11:07:16 +0200 (CEST)
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by mail.librecores.org (Postfix) with ESMTP id A7E0E20DB6
 for <openrisc@lists.librecores.org>; Thu, 10 Jun 2021 11:07:14 +0200 (CEST)
Received: from [192.168.126.129] ([146.241.205.41])
 by Aruba Outgoing Smtp  with ESMTPSA
 id rGeflbHdZjj2KrGeflDqiZ; Thu, 10 Jun 2021 11:07:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1623316034; bh=fhenxc6b7tBG+j/jXbGhBjywf4dXuojAN6or9ID0gwY=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=iDxLnv0FobW93jRkLrMLxDaWJ8Jz1asaQQgkbXHiCaStV/nBGsMTim9Hbwnwvdiwi
 CuRSVSjrVC8e1/GP1+ZhHZqjGPX65a7Sefzl05wAinb1U3vtoiAb8dJBk83d4mHaAN
 M9UVwbdzZRGWaZoHPBcUHd52gJL2vI1NcqoP9jqJN96TkSFyecq4fJTPhcoUQ+7u23
 Pe/YgMpXhD5bSczqnAUKYEMsZL3HZY6/z6M5nM9P8cTh4AxbYzQaiUHaAvLfYExtC2
 MkZLSTei84lQ/AGFmnJvUbg6A0mJ1zM170Xvy1GA2g7sSggB+lv4KCsfC6yUpH2I2H
 wyYxvarRzeIRw==
To: Alan Modra <amodra@gmail.com>
References: <YME2SzQdpj/AVz/2@antec>
 <20210609215233.1611478-1-giulio.benetti@benettiengineering.com>
 <YMFosi4vsWnxf9Sj@bubble.grove.modra.org>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <3ef9acac-9f1a-2aab-1c9e-a0d4aaae6ccd@benettiengineering.com>
Date: Thu, 10 Jun 2021 11:07:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YMFosi4vsWnxf9Sj@bubble.grove.modra.org>
Content-Language: en-US
X-CMAE-Envelope: MS4wfIc03DzC4AX8AlkF/nxMU54/WYJgNM6ACMh9tPQJ3Jdnr7Q2HNgeFU58HIwqvx9ReUiSlsGe66oxc9/6V4VmbG+4MlPccfJeaWPEHwbCe1tXDmguip5i
 X8Vagzi5EwcJy/n2qKXwFGfCUczw3HbDH5DBcdUkYOiYewp6N/YTeIPfQLjEolbecYlT7jPmwUpMAvFj+Lgx6zp5CyGgO9jqYb/acJEf/xZrR4IiPILLQA1V
 jxBfIdS7CQtIR2fTwdscRneuY2uS6LVK+WLRsxTlW7SNRSfwlNljtgsp8PAjX9g/xVOuGzHvZNma0jjVZK+RKYxdabMJOQ9M5PVoNnmqjVg=
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

SGVsbG8gQWxhbiwgQWxsLAoKT24gNi8xMC8yMSAzOjE5IEFNLCBBbGFuIE1vZHJhIHdyb3RlOgo+
IE9uIFdlZCwgSnVuIDA5LCAyMDIxIGF0IDExOjUyOjMzUE0gKzAyMDAsIEdpdWxpbyBCZW5ldHRp
IHdyb3RlOgo+PiBHY2MgdmVyc2lvbiA+PSA1IGhhcyBzdGFuZGFyZCBDIG1vZGUgbm90IHNldCB0
byAtc3RkPWdudTExLCBzbyBpZiB3ZSB1c2UKPj4gYW4gb2xkIGNvbXBpbGVyKGkuZS4gZ2NjIDQu
OSkgYnVpbGQgZmFpbHMgb246Cj4+IGBgYAo+PiBlbGYzMi1vcjFrLmM6MjI1MTozOiBlcnJvcjog
J2ZvcicgbG9vcCBpbml0aWFsIGRlY2xhcmF0aW9ucyBhcmUgb25seSBhbGxvd2VkIGluCj4+IEM5
OSBvciBDMTEgbW9kZQo+PiAgICAgIGZvciAoc2l6ZV90IGkgPSAwOyBpIDwgaW5zbl9jb3VudDsg
aSsrKQo+PiAgICAgIF4KPj4gYGBgCj4gCj4gRGlkIHlvdSBmaW5kIHRoaXMgcHJvYmxlbSBvbiBj
dXJyZW50IG1haW5saW5lIGJpbnV0aWxzPyAgVGhlIGNvbmZpZ3VyZQo+IG1hY2hpbmVyeSBpcyBz
dXBwb3NlZCB0byBzdXBwbHkgdGhlIGFwcHJvcHJpYXRlIC1zdGQ9Yzk5IG9yIC1zdGQ9Z251OTkK
PiB3aGVuIHVzaW5nIG9sZGVyIGNvbXBpbGVycy4gIFRoYXQgaGFwcGVucyBmb3IgbWUgd2hlbiBJ
IGJ1aWxkIHdpdGgKPiBnY2MtNC45LiAgSSBkb24ndCB0aGluayBhbnkgcGF0Y2ggaXMgbmVlZGVk
IGZvciBtYWlubGluZS4KPiAKCk9uIEJ1aWxkcm9vdCB0aGV5IGRvbid0IHBhc3MgLXN0ZD1jOTkv
Zzk5IGFuZCB0aGlzIGlzIHRoZSByZXN1bHQ6Cmh0dHBzOi8vZ2l0bGFiLmNvbS9ib290bGluL3Rv
b2xjaGFpbnMtYnVpbGRlci8tL2pvYnMvMTMyNTY0NjI5OAoKVGhpcyBwYXRjaCBzZWVtcyB0byBm
b2xsb3cgYWxsIHRoZSByZXN0IGNvZGUgc3R5bGUgb2YgYmludXRpbHMgc2luY2Ugbm8gCm90aGVy
IHBhcnQgb2YgaXQgZmFpbHMgYW5kIHRoaXMgaGFwcGVucyBvbmx5IGFmdGVyIHBhdGNoIFsxXSBo
YXMgYmVlbiAKdXBzdHJlYW1lZC4KCkhlcmUgWzJdIHlvdSBjYW4gc2VlIGFsbCB0aGUgb3RoZXIg
dG9vbGNoYWlucyBidWlsdCBzdWNjZXNmdWxseSBhbmQgb25seSAKT3BlbnJpc2MgZmFpbHMgYWZ0
ZXIgdGhlIHBhdGNoIHByb3ZpZGVkIGJ5IFN0YWZmb3JkKFsxXSkuCgpbMV06IGh0dHA6Ly9wYXRj
aGVzLXRjd2cubGluYXJvLm9yZy9wYXRjaC81MzE1MS8KWzJdOiBodHRwczovL2dpdGxhYi5jb20v
Ym9vdGxpbi90b29sY2hhaW5zLWJ1aWxkZXIvLS9qb2JzCgpCZXN0IHJlZ2FyZHMKLS0gCkdpdWxp
byBCZW5ldHRpCkJlbmV0dGkgRW5naW5lZXJpbmcgc2FzCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0Bs
aXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZv
L29wZW5yaXNjCg==
