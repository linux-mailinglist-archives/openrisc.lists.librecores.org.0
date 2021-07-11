Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 6D8BE3C3B30
	for <lists+openrisc@lfdr.de>; Sun, 11 Jul 2021 10:36:36 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 25A75213A5;
	Sun, 11 Jul 2021 10:36:36 +0200 (CEST)
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by mail.librecores.org (Postfix) with ESMTP id E826620A71
 for <openrisc@lists.librecores.org>; Sun, 11 Jul 2021 10:36:34 +0200 (CEST)
Received: from smtpclient.apple ([79.52.15.157])
 by Aruba Outgoing Smtp  with ESMTPA
 id 2UwymLdxMlMvA2UwzmxQO3; Sun, 11 Jul 2021 10:36:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1625992594; bh=YYOs+IwJv+/g3YimKWaSfiAmcFMVkLscz1nmGlnamIA=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=FblSpnFtOFmRtRHGNbgAM1XCxFiM3IFa4ZRuVwdGDeBAeqOmGm3qQz2DcyGQ/ipXP
 rMqgp0nhFCDn+xtu7Z0MaO0E8c6Eg4FJgJmGbIuz1vf+IUSdVnuAriUKXOHHgSbZKg
 SSsCoecl94P5YyIqFr8Kx+i/+ZkvTMijtBNSfo8HUkWslqz5N2ZAhEelsNILYXXVQv
 o660xWuByg+mZr8VShqdUOFBCY6lVk+R3JHgUFD5NBMADqYhEmJsP/ErNJCXB+yER0
 3myInA1k00g+WRgO81Z28PgdEcxEMUScFH8tpc58lJOlsqe1lQuMKwUOJ3MkjH35+Z
 kmAKTGaEIzOIA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sun, 11 Jul 2021 10:36:32 +0200
Message-Id: <D68EB4FF-538F-4FF1-ACFC-24AFEB098314@benettiengineering.com>
References: <YOdxwtNeQ2eUr+L3@antec>
In-Reply-To: <YOdxwtNeQ2eUr+L3@antec>
To: Stafford Horne <shorne@gmail.com>
X-Mailer: iPhone Mail (18F72)
X-CMAE-Envelope: MS4wfMXpbuowIrN14MHicVkt8CEq4Y3Hr+TB27ANYh670Fa5n9jH21KuNNcnmivnHk8vM4TZAifeF6alJjVdCkeUb1DdxeC+8ry8J/a852qpzEiJ3/9YrJVq
 A941OroVyYDq3gXAzkPB/VFp4eI5P7j6IjTEY2HNyiw8yrHsL6Zn4puZCeqfZvnOBsHWOVIQJ9RW+jtQ7MfvfW+B03qsyOiTDwK7kWD9n1fcRNHc6S2r9Shn
 IeX/VrMulC8eN2VGcUsmqcbTjpETXVTktO4f6QefQwPGxGmX47DbtfxPjYI3su8g0MHAF17llrFfAcsVKgKVdvfOt3mqszG5RAX7GQxu3KI=
Subject: Re: [OpenRISC] Maybe another or1k bug
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
 Richard Henderson <richard.henderson@linaro.org>,
 GNU Binutils <binutils@sourceware.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgU3RhZmZvcmQsIEFsbCwKCj4gSWwgZ2lvcm5vIDggbHVnIDIwMjEsIGFsbGUgb3JlIDIzOjQ0
LCBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4gaGEgc2NyaXR0bzoKPiAKPiDvu79P
biBXZWQsIEp1bCAwNywgMjAyMSBhdCAwMjoyNTozOVBNIC0wNzAwLCBSaWNoYXJkIEhlbmRlcnNv
biB3cm90ZToKPj4+IE9uIDcvNy8yMSAyOjA2IFBNLCBTdGFmZm9yZCBIb3JuZSB3cm90ZToKPj4+
ICtDQyBSaWNoYXJkcyBvdGhlciBhY2NvdW50Cj4+PiAKPj4+IEhpIFJpY2hhcmQsCj4+PiAKPj4+
IEkgQ2NlZCB0aGlzIHRvIHlvdSB0d2lkZGxlLm5ldCBhY2NvdW50IHlvdSBvbiB0aGlzIG9uZSBv
cmlnaW5hbGx5LiBEbyB5b3UgcmVjYWxsCj4+PiB3aHkgd2UgYWRkZWQgdGhlIGJlbG93IGNoZWNr
IGluIG9yMWsgYmZkPyAgSXQgc2VlbXMgdG8gYmUgb3Zlcmx5IHJlc3RyaWN0aXZlIGFuZAo+Pj4g
Y2F1c2luZyBzb21lIGlzc3VlcyBiZWxvdy4KPj4+IAo+Pj4gIGNhc2UgUl9PUjFLX0lOU05fUkVM
XzI2Ogo+Pj4gICAgaWYgKGJmZF9saW5rX3BpYyAoaW5mbykgJiYgIVNZTUJPTF9SRUZFUkVOQ0VT
X0xPQ0FMIChpbmZvLCBoKSkKPj4+ICAgICAgRVJST1IKPj4gLi4uCj4+Pj4gNC4gVGhlIHN5bWJv
bHMgYXJlIGZyb20gYHJlYWRlbGYgLXNgOgo+Pj4+IAo+Pj4+ICAgIDIyMTogMDAwMDhjZTQgICA3
MTYgRlVOQyAgICBHTE9CQUwgUFJPVEVDVEVEICAgMjQgYWxTb3VyY2VQYXVzZXYKPj4+PiAgICAy
MjI6IDAwMDA4ZmIwICAgIDM2IEZVTkMgICAgR0xPQkFMIFBST1RFQ1RFRCAgIDI0IGFsU291cmNl
UGF1c2UKPj4+PiAgICAyMjM6IDAwMDA4ZmQ0ICAgNzg0IEZVTkMgICAgR0xPQkFMIFBST1RFQ1RF
RCAgIDI0IGFsU291cmNlU3RvcHYKPj4+PiAgICAyMjQ6IDAwMDA5MmU0ICAgIDM2IEZVTkMgICAg
R0xPQkFMIFBST1RFQ1RFRCAgIDI0IGFsU291cmNlU3RvcAo+Pj4+ICAgIDIyNTogMDAwMDkzMDgg
ICA3MjAgRlVOQyAgICBHTE9CQUwgUFJPVEVDVEVEICAgMjQgYWxTb3VyY2VSZXdpbmR2Cj4+Pj4g
ICAgMjI2OiAwMDAwOTVkOCAgICAzNiBGVU5DICAgIEdMT0JBTCBQUk9URUNURUQgICAyNCBhbFNv
dXJjZVJld2luZAo+PiAKPj4gQWgsIFNUVl9QUk9URUNURUQuICBVbnVzdWFsLgo+PiAKPj4gSXQg
bG9va3MgbGlrZSB0aGlzIHNob3VsZCBiZSBTWU1CT0xfQ0FMTFNfTE9DQUwuICBUaGUgb25seSBk
aWZmZXJlbmNlIGZyb20KPj4gU1lNQk9MX1JFRkVSRU5DRVNfTE9DQUwgaXMgdmVyc3VzIHByb3Rl
Y3RlZCBzeW1ib2xzLgo+IAo+IFRoYW5rcyBSaWNoYXJkLgo+IAo+IEkgd2lsbCBwb3N0IGEgcGF0
Y2ggZm9yIHRoaXMgaW4gYSBmZXcgZGF5cy4gIE9yLCBtYXliZSBHaXVsaW8gY2FuIGRvIGl0IGlm
IGhlCj4gaGFzIHRpbWUuCgpTdWJzdGl0dXRpbmcgU1lNQk9MX1JFRkVSRU5DRVNfTE9DQUwgd2l0
aCBTWU1CT0xfQ0FMTFNfTE9DQUwgZml4ZXMgdGhlIHByb2JsZW0uCk9ubHkgb25lIHRoaW5nLCBp
cyBpdCB2YWxpZCBmb3IgZXZlcnkgY2FzZSBpbiB0aGF0IHN3aXRjaCBvciBtdXN0IGl0IGJlIG9u
bHkgZm9yIFJfT1IxS19JTlNOX1JFTF8yNj8KCknigJl2ZSBidWlsdCBhbmQgZW50aXJlIGJ1aWxk
cm9vdCBzeXN0ZW0gd2l0aCBhbGwgY2FzZXMgd2l0aCB0aGF0IG5ldyBjb25kaXRpb24gYW5kIGl0
IGJ1aWxkcyBzdWNjZXNzZnVsbHkuCgpQbGVhc2UgbGV0IG1lIGtub3cgc28gSSBjYW4gc2VuZCBh
IHBhdGNoIGZvciB0aGlzLgoKVGhhbmsgeW91IGFuZApCZXN0IHJlZ2FyZHMKR2l1bGlvIEJlbmV0
dGkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJ
U0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlz
dHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
