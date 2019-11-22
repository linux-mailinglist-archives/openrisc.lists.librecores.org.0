Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E0466107189
	for <lists+openrisc@lfdr.de>; Fri, 22 Nov 2019 12:39:52 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 82D2E20787;
	Fri, 22 Nov 2019 12:39:52 +0100 (CET)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by mail.librecores.org (Postfix) with ESMTPS id 97F6F2074A
 for <openrisc@lists.librecores.org>; Fri, 22 Nov 2019 12:39:50 +0100 (CET)
Received: by mail-pf1-f195.google.com with SMTP id n13so3385593pff.1
 for <openrisc@lists.librecores.org>; Fri, 22 Nov 2019 03:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YUGJKVrycnJTlGVKAo+rQ9RRZBSMb8QTIRmNqH2bNwI=;
 b=BQQWRgqowYXJKMkQvn45vZTga2rmiDy03er8pX6KXj/45IWh8+gQ32A0SiRVut4Tpn
 smRhcNpZ1rCFmUOYZWRS4LUnkPBcPYS8yYvH0HwE2M9P2f+D0sKZE8KdhdK9fBcu0+Sv
 9g0BykkVPsFI/txDTfxnbXAKJpNmT+ggjMOuSTgt9eHHGLBg+Xj1cpFmxIaYgr1bsXIs
 qDsDCYEir3HM5CtJC60bhivL1wSvnpFbtfXlEznlS41TDbpjDCa9jloT3Tf/6k3RPlvF
 lQ42SBVbuq+un3Oy116l+5fIwLRwpeBBauWqk+8i5mXSdKSQ7n0SaLa6I8EP5HVKo2eU
 6pgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YUGJKVrycnJTlGVKAo+rQ9RRZBSMb8QTIRmNqH2bNwI=;
 b=m/Phlx26WHIIuWBhwZU+mWzOaRaJKD8cYWJPtmGnMF1KZaGn8+wyCpORAf9KWMrdwD
 8uGcETiuL8Cs+jI3TkyqzEukWnDA1WU0zVuaxxhcEyAlQMhQJTu7yqz1sWmBVITnk0qM
 0WHXCVDEhu3//fpbx6toCPv7hBdOlwJrYniLgceMnlLAy63H2MkMh2WXdIMydmPTNjcT
 oGbwModfPXQSLJvnEb47joSDyoy2FmDdZy/TZrHdZ0XQb1gc2UU7lK6oxybx+kJc54vI
 nxYPN4vDfto7X5KHgZZNidQNaV/3TS2YbfsyDc83BLMzVJVYzo31Fr4Bzo4wtngkMwDU
 J3sQ==
X-Gm-Message-State: APjAAAXNfqH5IXzEYORHWekSRAouWdb3WyoB0NfEzSzmwAFjVDAnyEp3
 +jglnCjnGCNR+OBoBQMEcos=
X-Google-Smtp-Source: APXvYqwdNHIlJNS7n1P1nOUqGYy2fQ+PEoU+AxoFvydk8nziOOuPaW79miW0+sSOm6bmSQpCqZAkSQ==
X-Received: by 2002:a63:190a:: with SMTP id z10mr11025834pgl.153.1574422788779; 
 Fri, 22 Nov 2019 03:39:48 -0800 (PST)
Received: from localhost (g143.222-224-150.ppp.wakwak.ne.jp. [222.224.150.143])
 by smtp.gmail.com with ESMTPSA id z10sm7432600pfr.139.2019.11.22.03.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2019 03:39:48 -0800 (PST)
Date: Fri, 22 Nov 2019 20:39:45 +0900
From: Stafford Horne <shorne@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <20191122113945.GL24874@lianli.shorne-pla.net>
References: <20191120133712.12066-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191120133712.12066-1-krzk@kernel.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [OpenRISC] [PATCH] openrisc: Fix Kconfig indentation
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
Cc: Jonas Bonn <jonas@southpole.se>, openrisc@lists.librecores.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMDk6Mzc6MTJQTSArMDgwMCwgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToKPiBBZGp1c3QgaW5kZW50YXRpb24gZnJvbSBzcGFjZXMgdG8gdGFiICgrb3B0
aW9uYWwgdHdvIHNwYWNlcykgYXMgaW4KPiBjb2Rpbmcgc3R5bGUgd2l0aCBjb21tYW5kIGxpa2U6
Cj4gCSQgc2VkIC1lICdzL14gICAgICAgIC9cdC8nIC1pICovS2NvbmZpZwo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KCkFja2VkLWJ5OiBT
dGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4KClRoYW5rcywgSSBtdXN0IGhhdmUgZm9y
Z290IHRvIGhpdCB0aGUgVEFCIGJ1dHRvbiBvbiBhIGZldyBvZiB0aGVzZS4gIEkgd2lsbApxdWV1
ZSB0aGVzZSB1cCBmb3IgdGhlIG5leHQgcmVsZWFzZSB1bmxlc3MgeW91IGhhdmUgYSBxdWV1ZSB5
b3Ugd2FudCB0byBtZXJnZQp0aGVtIG9uLgoKLVN0YWZmb3JkCgo+IC0tLQo+ICBhcmNoL29wZW5y
aXNjL0tjb25maWcgfCAyNiArKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2FyY2gvb3BlbnJpc2MvS2NvbmZpZyBiL2FyY2gvb3BlbnJpc2MvS2NvbmZpZwo+IGluZGV4IGJm
MzI2ZjBlZGQyZi4uMTkyOGUwNjFmZjk2IDEwMDY0NAo+IC0tLSBhL2FyY2gvb3BlbnJpc2MvS2Nv
bmZpZwo+ICsrKyBiL2FyY2gvb3BlbnJpc2MvS2NvbmZpZwo+IEBAIC0xMyw3ICsxMyw3IEBAIGNv
bmZpZyBPUEVOUklTQwo+ICAJc2VsZWN0IElSUV9ET01BSU4KPiAgCXNlbGVjdCBIQU5ETEVfRE9N
QUlOX0lSUQo+ICAJc2VsZWN0IEdQSU9MSUIKPiAtICAgICAgICBzZWxlY3QgSEFWRV9BUkNIX1RS
QUNFSE9PSwo+ICsJc2VsZWN0IEhBVkVfQVJDSF9UUkFDRUhPT0sKPiAgCXNlbGVjdCBTUEFSU0Vf
SVJRCj4gIAlzZWxlY3QgR0VORVJJQ19JUlFfQ0hJUAo+ICAJc2VsZWN0IEdFTkVSSUNfSVJRX1BS
T0JFCj4gQEAgLTUxLDEyICs1MSwxMiBAQCBjb25maWcgTk9fSU9QT1JUX01BUAo+ICAJZGVmX2Jv
b2wgeQo+ICAKPiAgY29uZmlnIFRSQUNFX0lSUUZMQUdTX1NVUFBPUlQKPiAtICAgICAgICBkZWZf
Ym9vbCB5Cj4gKwlkZWZfYm9vbCB5Cj4gIAo+ICAjIEZvciBub3csIHVzZSBnZW5lcmljIGNoZWNr
c3VtIGZ1bmN0aW9ucwo+ICAjVGhlc2UgY2FuIGJlIHJlaW1wbGVtZW50ZWQgaW4gYXNzZW1ibHkg
bGF0ZXIgaWYgc28gaW5jbGluZWQKPiAgY29uZmlnIEdFTkVSSUNfQ1NVTQo+IC0gICAgICAgIGRl
Zl9ib29sIHkKPiArCWRlZl9ib29sIHkKPiAgCj4gIGNvbmZpZyBTVEFDS1RSQUNFX1NVUFBPUlQK
PiAgCWRlZl9ib29sIHkKPiBAQCAtODksOCArODksOCBAQCBjb25maWcgRENBQ0hFX1dSSVRFVEhS
T1VHSAo+ICAJICBJZiB1bnN1cmUgc2F5IE4gaGVyZQo+ICAKPiAgY29uZmlnIE9QRU5SSVNDX0JV
SUxUSU5fRFRCCj4gLSAgICAgICAgc3RyaW5nICJCdWlsdGluIERUQiIKPiAtICAgICAgICBkZWZh
dWx0ICIiCj4gKwlzdHJpbmcgIkJ1aWx0aW4gRFRCIgo+ICsJZGVmYXVsdCAiIgo+ICAKPiAgbWVu
dSAiQ2xhc3MgSUkgSW5zdHJ1Y3Rpb25zIgo+ICAKPiBAQCAtMTYxLDEzICsxNjEsMTMgQEAgY29u
ZmlnIE9QRU5SSVNDX0hBVkVfU0hBRE9XX0dQUlMKPiAgCSAgT24gYSB1bmljb3JlIHN5c3RlbSBp
dCdzIHNhZmUgdG8gc2F5IE4gaGVyZSBpZiB5b3UgYXJlIHVuc3VyZS4KPiAgCj4gIGNvbmZpZyBD
TURMSU5FCj4gLSAgICAgICAgc3RyaW5nICJEZWZhdWx0IGtlcm5lbCBjb21tYW5kIHN0cmluZyIK
PiAtICAgICAgICBkZWZhdWx0ICIiCj4gLSAgICAgICAgaGVscAo+IC0gICAgICAgICAgT24gc29t
ZSBhcmNoaXRlY3R1cmVzIHRoZXJlIGlzIGN1cnJlbnRseSBubyB3YXkgZm9yIHRoZSBib290IGxv
YWRlcgo+IC0gICAgICAgICAgdG8gcGFzcyBhcmd1bWVudHMgdG8gdGhlIGtlcm5lbC4gRm9yIHRo
ZXNlIGFyY2hpdGVjdHVyZXMsIHlvdSBzaG91bGQKPiAtICAgICAgICAgIHN1cHBseSBzb21lIGNv
bW1hbmQtbGluZSBvcHRpb25zIGF0IGJ1aWxkIHRpbWUgYnkgZW50ZXJpbmcgdGhlbQo+IC0gICAg
ICAgICAgaGVyZS4KPiArCXN0cmluZyAiRGVmYXVsdCBrZXJuZWwgY29tbWFuZCBzdHJpbmciCj4g
KwlkZWZhdWx0ICIiCj4gKwloZWxwCj4gKwkgIE9uIHNvbWUgYXJjaGl0ZWN0dXJlcyB0aGVyZSBp
cyBjdXJyZW50bHkgbm8gd2F5IGZvciB0aGUgYm9vdCBsb2FkZXIKPiArCSAgdG8gcGFzcyBhcmd1
bWVudHMgdG8gdGhlIGtlcm5lbC4gRm9yIHRoZXNlIGFyY2hpdGVjdHVyZXMsIHlvdSBzaG91bGQK
PiArCSAgc3VwcGx5IHNvbWUgY29tbWFuZC1saW5lIG9wdGlvbnMgYXQgYnVpbGQgdGltZSBieSBl
bnRlcmluZyB0aGVtCj4gKwkgIGhlcmUuCj4gIAo+ICBtZW51ICJEZWJ1Z2dpbmcgb3B0aW9ucyIK
PiAgCj4gQEAgLTE4NSw3ICsxODUsNyBAQCBjb25maWcgT1BFTlJJU0NfRVNSX0VYQ0VQVElPTl9C
VUdfQ0hFQ0sKPiAgCWRlZmF1bHQgbgo+ICAJaGVscAo+ICAJICBUaGlzIG9wdGlvbiBlbmFibGVz
IHNvbWUgY2hlY2tzIHRoYXQgbWlnaHQgZXhwb3NlIHNvbWUgcHJvYmxlbXMKPiAtICAgICAgICAg
IGluIGtlcm5lbC4KPiArCSAgaW4ga2VybmVsLgo+ICAKPiAgCSAgU2F5IE4gaWYgeW91IGFyZSB1
bnN1cmUuCj4gIAo+IC0tIAo+IDIuMTcuMQo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMu
bGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVu
cmlzYwo=
