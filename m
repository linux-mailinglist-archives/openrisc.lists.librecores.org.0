Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB014839F2
	for <lists+openrisc@lfdr.de>; Tue,  4 Jan 2022 02:43:30 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 317B824325;
	Tue,  4 Jan 2022 02:43:30 +0100 (CET)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mail.librecores.org (Postfix) with ESMTPS id 09B3A235E9
 for <openrisc@lists.librecores.org>; Tue,  4 Jan 2022 02:43:28 +0100 (CET)
Received: by mail-pj1-f53.google.com with SMTP id
 n30-20020a17090a5aa100b001b2b6509685so1475893pji.3
 for <openrisc@lists.librecores.org>; Mon, 03 Jan 2022 17:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0cfxFr7XEK3F9ENYlEhni9V3s3m3JoJ75KPxGutcLDU=;
 b=nBWiXr3rl+5PN2xXFCtu9+sfdz8+ehDkvPRrVmQqmZ6TfBV0MiLrq9c8h7YKlY29X7
 7evMh2cI95LuiFccWMeAoklAeyORXlsVEk/HifXuJnLKtFsFCYuoeKFprvlp7vUacFmQ
 LJRLGuaZhKK0yys1ZJhNcbtcSpK90BPO12AaWhO3NCx1GqW+jJwLzGCooZIkWma54DLO
 MBSkUTPr9FXojWFFo9hZ5W5LfB+b+abDxApZTAHT0CgDg/GDjpN5z21j46rdJU/iZfMQ
 nEgUB+o7jb7M/1GBWHI/RtYyU/zoDldo14BDm0bdA0KLV4Uod8fGpP10eJu5hf/A8oWY
 6lmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0cfxFr7XEK3F9ENYlEhni9V3s3m3JoJ75KPxGutcLDU=;
 b=S5j28aUZ3uvI71P4ncIhaszEE/xcP4PgA+VkR3aNUo5EqIufOgPQQ+BRxlkGnai+Ua
 jQqn3ODWraXBiWZYORSwTUeZvkWF/E4wZ6M+N+li7+KhU6pT/sh4RlGrHB8hxsDpCXc4
 T9/WK5EdZaB/MQ5Du4ldVyg/hCPvobSepX1zyWsdOXMZDchQXaKdg2GCB6Gf2/AWsW55
 Zx6wraXxcI412B7mUndSjgMlMpCasQKn86cNx2Lk/Y2C3uI9rePyhuZvRWCQuQs9d12q
 DqzDQJhiWhK6wADwhqDVFdvmwuLkjK1DIdjDG3QuEYb6qCgnPWZhr4JwmN9YOefCIW2r
 Phtg==
X-Gm-Message-State: AOAM530aQrYfIcgI9X8uBC9KWfAdVIwwXzZkvcqhqQ3etGxzlhGfU+/C
 eQrqOnaX7FKDm/8j4C+AB/I=
X-Google-Smtp-Source: ABdhPJygiZqCTCdft+CVGn1R0KF9BpVmyfaZdB9tLwXZ8ygFaEbxX+lsgcI8P61gjPA5vVYWOAVQGw==
X-Received: by 2002:a17:903:2307:b0:149:ba56:ff83 with SMTP id
 d7-20020a170903230700b00149ba56ff83mr9180368plh.7.1641260606670; 
 Mon, 03 Jan 2022 17:43:26 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id i11sm39628384pfq.206.2022.01.03.17.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 17:43:25 -0800 (PST)
Date: Tue, 4 Jan 2022 10:43:24 +0900
From: Stafford Horne <shorne@gmail.com>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Message-ID: <YdOmPB8dSrXfE2rl@antec>
References: <20211229044251.2203653-1-shorne@gmail.com>
 <20211229044251.2203653-13-shorne@gmail.com>
 <a853a130-09c9-68a0-0029-74b859a7af35@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a853a130-09c9-68a0-0029-74b859a7af35@linaro.org>
Subject: Re: [OpenRISC] [PATCH v4 12/13] build-many-glibcs.py: add OpenRISC
 support
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
 GLIBC patches <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBKYW4gMDMsIDIwMjIgYXQgMDM6MjY6MDFQTSAtMDMwMCwgQWRoZW1lcnZhbCBaYW5l
bGxhIHdyb3RlOgo+IAo+IExHVE0sIHRoYW5rcy4KPiAKPiBSZXZpZXdlZC1ieTogQWRoZW1lcnZh
bCBaYW5lbGxhICA8YWRoZW1lcnZhbC56YW5lbGxhQGxpbmFyby5vcmc+CgpUaGFuayB5b3UuCgo+
IE9uIDI5LzEyLzIwMjEgMDE6NDIsIFN0YWZmb3JkIEhvcm5lIHZpYSBMaWJjLWFscGhhIHdyb3Rl
Ogo+ID4gLS0tCj4gPiAgc2NyaXB0cy9idWlsZC1tYW55LWdsaWJjcy5weSB8IDUgKysrKysKPiA+
ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9z
Y3JpcHRzL2J1aWxkLW1hbnktZ2xpYmNzLnB5IGIvc2NyaXB0cy9idWlsZC1tYW55LWdsaWJjcy5w
eQo+ID4gaW5kZXggYjgzYmMxNTlmZC4uYWQ2ZTU5MTNlNCAxMDA3NTUKPiA+IC0tLSBhL3Njcmlw
dHMvYnVpbGQtbWFueS1nbGliY3MucHkKPiA+ICsrKyBiL3NjcmlwdHMvYnVpbGQtbWFueS1nbGli
Y3MucHkKPiA+IEBAIC0zMzUsNiArMzM1LDEwIEBAIGNsYXNzIENvbnRleHQob2JqZWN0KToKPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAnY2NvcHRzJzogJy1tYWJpPTY0J31d
KQo+ID4gICAgICAgICAgc2VsZi5hZGRfY29uZmlnKGFyY2g9J25pb3MyJywKPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICBvc19uYW1lPSdsaW51eC1nbnUnKQo+ID4gKyAgICAgICAgc2VsZi5h
ZGRfY29uZmlnKGFyY2g9J29yMWsnLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIG9zX25h
bWU9J2xpbnV4LWdudScsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgdmFyaWFudD0nc29m
dCcsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgZ2NjX2NmZz1bJy0td2l0aC1tdWx0aWxp
Yi1saXN0PW1jbW92J10pCj4gPiAgICAgICAgICBzZWxmLmFkZF9jb25maWcoYXJjaD0ncG93ZXJw
YycsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgb3NfbmFtZT0nbGludXgtZ251JywKPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICBnY2NfY2ZnPVsnLS1kaXNhYmxlLW11bHRpbGliJywg
Jy0tZW5hYmxlLXNlY3VyZXBsdCddLAo+ID4gQEAgLTEyNzEsNiArMTI3NSw3IEBAIGRlZiBpbnN0
YWxsX2xpbnV4X2hlYWRlcnMocG9saWN5LCBjbWRsaXN0KToKPiA+ICAgICAgICAgICAgICAgICAg
J21pY3JvYmxhemUnOiAnbWljcm9ibGF6ZScsCj4gPiAgICAgICAgICAgICAgICAgICdtaXBzJzog
J21pcHMnLAo+ID4gICAgICAgICAgICAgICAgICAnbmlvczInOiAnbmlvczInLAo+ID4gKyAgICAg
ICAgICAgICAgICAnb3Ixayc6ICdvcGVucmlzYycsCj4gPiAgICAgICAgICAgICAgICAgICdwb3dl
cnBjJzogJ3Bvd2VycGMnLAo+ID4gICAgICAgICAgICAgICAgICAnczM5MCc6ICdzMzkwJywKPiA+
ICAgICAgICAgICAgICAgICAgJ3Jpc2N2MzInOiAncmlzY3YnLApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJ
U0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0
aW5mby9vcGVucmlzYwo=
