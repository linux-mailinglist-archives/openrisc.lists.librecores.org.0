Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A68B714ECF8
	for <lists+openrisc@lfdr.de>; Fri, 31 Jan 2020 14:10:19 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2A2C7208C6;
	Fri, 31 Jan 2020 14:10:19 +0100 (CET)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by mail.librecores.org (Postfix) with ESMTPS id BF71620689
 for <openrisc@lists.librecores.org>; Fri, 31 Jan 2020 14:10:16 +0100 (CET)
Received: by mail-pg1-f195.google.com with SMTP id b9so3408881pgk.12
 for <openrisc@lists.librecores.org>; Fri, 31 Jan 2020 05:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ABA8Gc/rIwSuk9yNeKLXZQ3+u7dy+VUPkUzWmHal5Bs=;
 b=MlfrjcRijE+sWoWfClWA3D1nCX8dFryivepO9XJXxylRaMg/MeaF4NnIJjrw0sgtpt
 urMc/dDyjFRgRWOfTJ4xV5fbdML/s2YcsrnytGbcUcvX+c0mJ9+SXb02AQtFHregCMGP
 VmFHq34xbEH3X7IkWO4d4uqAOzdgGpkhZXoojN7xOw1SgzVHW9s7epREvfBwwQcehlWo
 1YgEeMS9p6C6dkd2fdj2mJ6s6l6NvbFaRnFNwmAY02QyGzE8CpQOHUPrX3h4UYf8qgr3
 urIlZ21VQB9JPIZbF4Qud3oNNhyZmtyCGmTefiwI2kEZpRyXuTxEYhwC0q4xU2jDRFlb
 gR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ABA8Gc/rIwSuk9yNeKLXZQ3+u7dy+VUPkUzWmHal5Bs=;
 b=DkhMMqW+o2xwqrk9I04Vjlrz+c4c0CPeCNUQ1Fybo8xaUneIMEOm5Wrwmb28k2970r
 GqbDOGjUpLcTmIX8injPwT7S7OuaTJc7rin+HNnaBzFfG9Rd/Va0Pwum67OwF2gwZsEs
 vOpIcGbyqtiHDAi6U7AKwJstUR95c6ITp+GIhtkvREJ2uBAwfBEucJ3NNCURfTG4Jxp5
 a/q/U7HwQhxPCWYyZNyQf5Aakfw79soIRmzeH2y6/g8SOMHwKbEgrXZPTmM7mD9smAQk
 q/3prt1sGbB2Ws4U37jTEpeUbbjdzBb2JWZRZ2GQFPVuvGNgtmOBSnoPrcNLLv0KQgl0
 s4uw==
X-Gm-Message-State: APjAAAVS+Mzho8bgpTr6rvfutrZDva+iBan/OLyBJX0Qv+jY/jPcDNp4
 aU9mTlYhAfGYRCazZIaijbY=
X-Google-Smtp-Source: APXvYqzE9mrpk2rqIoQNk72UknhVj+3SbtoVlh37mw2wUDg+S9OM4d98tNyUUe8l9BMlPwxxKfivog==
X-Received: by 2002:aa7:87c5:: with SMTP id i5mr10632074pfo.114.1580476214691; 
 Fri, 31 Jan 2020 05:10:14 -0800 (PST)
Received: from localhost (g52.222-224-164.ppp.wakwak.ne.jp. [222.224.164.52])
 by smtp.gmail.com with ESMTPSA id
 p24sm10067351pgk.19.2020.01.31.05.10.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2020 05:10:13 -0800 (PST)
Date: Fri, 31 Jan 2020 22:10:11 +0900
From: Stafford Horne <shorne@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <20200131131011.GX24874@lianli.shorne-pla.net>
References: <1580459313-16926-1-git-send-email-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1580459313-16926-1-git-send-email-krzk@kernel.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [OpenRISC] [PATCH v2] openrisc: configs: Cleanup
 CONFIG_CROSS_COMPILE
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
Cc: Jonas Bonn <jonas@southpole.se>, Jonathan Corbet <corbet@lwn.net>,
 Masahiro Yamada <masahiroy@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gRnJpLCBKYW4gMzEsIDIwMjAgYXQgMDk6Mjg6MzNBTSArMDEwMCwgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToKPiBDT05GSUdfQ1JPU1NfQ09NUElMRSBpcyBnb25lIHNpbmNlIGNvbW1pdCBm
MTA4OWM5MmRhNzkgKCJrYnVpbGQ6IHJlbW92ZQo+IENPTkZJR19DUk9TU19DT01QSUxFIHN1cHBv
cnQiKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5l
bC5vcmc+CiAKU2lnbmVkLW9mZi1ieTogU3RhZmZvcmQgSG9ybmUgPHNob3JuZUBnbWFpbC5jb20+
CgpUaGFua3MsIEkgd2lsbCBxdWV1ZSB0aGlzIGZvciA1LjcuCgo+IC0tLQo+IAo+IENoYW5nZXMg
c2luY2UgdjE6Cj4gMS4gVXBkYXRlIGFsc28gZG9jcy4KPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9v
cGVucmlzYy9vcGVucmlzY19wb3J0LnJzdCAgIHwgNCArKy0tCj4gIGFyY2gvb3BlbnJpc2MvY29u
Zmlncy9vcjFrc2ltX2RlZmNvbmZpZyAgICB8IDEgLQo+ICBhcmNoL29wZW5yaXNjL2NvbmZpZ3Mv
c2ltcGxlX3NtcF9kZWZjb25maWcgfCAxIC0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vb3Bl
bnJpc2Mvb3BlbnJpc2NfcG9ydC5yc3QgYi9Eb2N1bWVudGF0aW9uL29wZW5yaXNjL29wZW5yaXNj
X3BvcnQucnN0Cj4gaW5kZXggYTE4NzQ3YThkMTkxLi40YjJjNDM3OTQyYTAgMTAwNjQ0Cj4gLS0t
IGEvRG9jdW1lbnRhdGlvbi9vcGVucmlzYy9vcGVucmlzY19wb3J0LnJzdAo+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vb3BlbnJpc2Mvb3BlbnJpc2NfcG9ydC5yc3QKPiBAQCAtMzcsOCArMzcsOCBAQCBv
ciBTdGFmZm9yZCdzIHRvb2xjaGFpbiBidWlsZCBhbmQgcmVsZWFzZSBzY3JpcHRzLgo+ICAKPiAg
QnVpbGQgdGhlIExpbnV4IGtlcm5lbCBhcyB1c3VhbDo6Cj4gIAo+IC0JbWFrZSBBUkNIPW9wZW5y
aXNjIGRlZmNvbmZpZwo+IC0JbWFrZSBBUkNIPW9wZW5yaXNjCj4gKwltYWtlIEFSQ0g9b3BlbnJp
c2MgQ1JPU1NfQ09NUElMRT0ib3Ixay1saW51eC0iIGRlZmNvbmZpZwo+ICsJbWFrZSBBUkNIPW9w
ZW5yaXNjIENST1NTX0NPTVBJTEU9Im9yMWstbGludXgtIgo+ICAKPiAgMykgUnVubmluZyBvbiBG
UEdBIChvcHRpb25hbCkKPiAgCj4gZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJpc2MvY29uZmlncy9v
cjFrc2ltX2RlZmNvbmZpZyBiL2FyY2gvb3BlbnJpc2MvY29uZmlncy9vcjFrc2ltX2RlZmNvbmZp
Zwo+IGluZGV4IGQ4ZmY0ZjhmZmI4OC4uNzVmMmRhMzI0ZDBlIDEwMDY0NAo+IC0tLSBhL2FyY2gv
b3BlbnJpc2MvY29uZmlncy9vcjFrc2ltX2RlZmNvbmZpZwo+ICsrKyBiL2FyY2gvb3BlbnJpc2Mv
Y29uZmlncy9vcjFrc2ltX2RlZmNvbmZpZwo+IEBAIC0xLDQgKzEsMyBAQAo+IC1DT05GSUdfQ1JP
U1NfQ09NUElMRT0ib3Ixay1saW51eC0iCj4gIENPTkZJR19OT19IWj15Cj4gIENPTkZJR19MT0df
QlVGX1NISUZUPTE0Cj4gIENPTkZJR19CTEtfREVWX0lOSVRSRD15Cj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvb3BlbnJpc2MvY29uZmlncy9zaW1wbGVfc21wX2RlZmNvbmZpZyBiL2FyY2gvb3BlbnJpc2Mv
Y29uZmlncy9zaW1wbGVfc21wX2RlZmNvbmZpZwo+IGluZGV4IDY0Mjc4OTkyZGY5Yy4uZmY0OWQ4
NjhlMDQwIDEwMDY0NAo+IC0tLSBhL2FyY2gvb3BlbnJpc2MvY29uZmlncy9zaW1wbGVfc21wX2Rl
ZmNvbmZpZwo+ICsrKyBiL2FyY2gvb3BlbnJpc2MvY29uZmlncy9zaW1wbGVfc21wX2RlZmNvbmZp
Zwo+IEBAIC0xLDQgKzEsMyBAQAo+IC1DT05GSUdfQ1JPU1NfQ09NUElMRT0ib3Ixay1saW51eC0i
Cj4gIENPTkZJR19MT0NBTFZFUlNJT049Ii1zaW1wbGUtc21wIgo+ICBDT05GSUdfTk9fSFo9eQo+
ICBDT05GSUdfTE9HX0JVRl9TSElGVD0xNAo+IC0tIAo+IDIuNy40Cj4gCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApP
cGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3Jn
L2xpc3RpbmZvL29wZW5yaXNjCg==
