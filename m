Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id BB81E475059
	for <lists+openrisc@lfdr.de>; Wed, 15 Dec 2021 02:15:10 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6D95A242E6;
	Wed, 15 Dec 2021 02:15:10 +0100 (CET)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by mail.librecores.org (Postfix) with ESMTPS id 1C053241F6
 for <openrisc@lists.librecores.org>; Wed, 15 Dec 2021 02:15:09 +0100 (CET)
Received: by mail-qt1-f174.google.com with SMTP id n15so20334036qta.0
 for <openrisc@lists.librecores.org>; Tue, 14 Dec 2021 17:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=UTwi66xAo8FPnfmcI6wMwRt6I1wy7SRQZcRJ9PuW1uY=;
 b=vye9xqrTTde53Djm+iNhur041JqDziQg+KnSgFoANo0GxHPCh0Uz+UlzYNHRrZsRky
 HsWqZGWC8APVnTUMiIKRVCYAkkOST0CYA0R2ckiNe2c++eoR68AtMK4g56oKddoRE4mf
 UX73O5u4knXfhD0sCgQGHBCH4OePOjLURvRhpSEm4Z+KWug6nfIPRgMmg+H1HogxF0O/
 5Sr/yUgf2CJELa0VdwjFk9UwRcnuJZySMFiLFVyQWy90YZt1XxKe9r8qY0fE9caACMH1
 xtEKoe8UPGfvhKmCkL2rnzGMrpoz+5yMETujYMJkIMbERkK7DQtgU4C86v3g2IiOpSDy
 RE2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UTwi66xAo8FPnfmcI6wMwRt6I1wy7SRQZcRJ9PuW1uY=;
 b=tZcuuYDBY93eOVLzZtH/pucnaaeH/or5T8cuRIXQoMBh7qt0KSd9KenbuqAuTmDggE
 uB5Yk2+AzZRCj+d4AibauJo6QFv2CkZPEBe49GNAbxzxzVg8GU1mKTZLFrmxIX+sJk5C
 QbtOJ3AdXTTFUuO931aNEx8JispGf2/xBI7MwPjLhY272R1pBH2rl31OIvYS7Ds4gP/Z
 5Bn1VeMw0qoz98xrxsQNfXauhMBGRp0riG0j5Oymf95NR63MnU/0AQiLp+e5QRvnFhgQ
 Qd+pzmVii9qmywaqKEnRFuXbApiyAtZC7/E+IBTfXsqx0JbvLsDdr2lF8BIWCDUxR/+S
 evFQ==
X-Gm-Message-State: AOAM532CN5um3IgnurRXk6iIOJnMVRfwyi1e2xX5d7a9521MJGsZ0tSC
 l+/w5kxdtnMcniOnOC8cS6DBcw==
X-Google-Smtp-Source: ABdhPJzt6IaxdwlbVn/YZe+lomKHddWTXc9gc7T0s5t/ygp4thlkEDZsXAC+SaDTh52W84iGZthuSg==
X-Received: by 2002:a05:622a:454:: with SMTP id
 o20mr9991328qtx.217.1639530907808; 
 Tue, 14 Dec 2021 17:15:07 -0800 (PST)
Received: from ?IPV6:2804:431:c7ca:103f:1000:c46d:a2d6:9bed?
 ([2804:431:c7ca:103f:1000:c46d:a2d6:9bed])
 by smtp.gmail.com with ESMTPSA id j22sm279571qko.68.2021.12.14.17.15.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 17:15:07 -0800 (PST)
Message-ID: <86e61afa-ab95-62e1-10a7-3de71db8deb8@linaro.org>
Date: Tue, 14 Dec 2021 22:15:04 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: Joseph Myers <joseph@codesourcery.com>
References: <20211210233456.4146479-1-shorne@gmail.com>
 <20211210233456.4146479-4-shorne@gmail.com>
 <a0644ab7-85a5-e22d-607e-4e6761d87610@linaro.org>
 <alpine.DEB.2.22.394.2112142242120.1558178@digraph.polyomino.org.uk>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
In-Reply-To: <alpine.DEB.2.22.394.2112142242120.1558178@digraph.polyomino.org.uk>
Subject: Re: [OpenRISC] [PATCH v3 03/13] or1k: ABI Implementation
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

CgpPbiAxNC8xMi8yMDIxIDE5OjQzLCBKb3NlcGggTXllcnMgd3JvdGU6Cj4gT24gVHVlLCAxNCBE
ZWMgMjAyMSwgQWRoZW1lcnZhbCBaYW5lbGxhIHZpYSBMaWJjLWFscGhhIHdyb3RlOgo+IAo+PiAr
aWYgdGVzdCAieCRwcm9maWxlIiAhPSB4bm87IHRoZW4KPj4gKyAgaWYgdGVzdCAieCR3aXRoX3By
b2ZpbGUiID09IHhubzsgdGhlbgo+PiArICAgIEFDX01TR19FUlJPUihbQUJJIGRvZXMgbm90IHN1
cHBvcnQgcHJvZmlsaW5nXSkKPiAKPiBVc2luZyA9PSBpbiB0ZXN0IGlzIGEgYmFzaGlzbS4KPiAK
PiBJJ2QgZXhwZWN0IHN1Y2ggYSBjaGFuZ2UgdG8gcmVxdWlyZSB0aGUgYnVpbGQtbWFueS1nbGli
Y3MucHkgY29uZmlndXJhdGlvbiAKPiBmb3IgT3BlblJJU0MgdG8gdXNlIC0tZGlzYWJsZS1wcm9m
aWxlLgo+IAoKSSBlbmRlZCB1cCBtaXhpbmcgdXAgdGhpbmdzIGFuZCB3aGF0IG9yMWsgZG9lcyBu
b3Qgc3VwcG9ydCBpcyBMRF9QUk9GSUxFCmluc3RlYWQgb2YgLS1lbmFibGUtcHJvZmlsZS4gIElu
IHRoaXMgY2FzZSBJIGFtIG5vdCBzdXJlIGlmIGl0IHdvdWxkCmJlIGJldHRlciB0byBqdXN0IG5v
dCBlbmFibGUgaXQgKGJ5IGlnbm9yaW5nIHRoZSBMRF9QUk9GSUxFIGhhbmRsaW5nCmluIHJ0bGQu
YyBvciBkbC1zdXBwb3J0LmMpIGFuZCBlbWl0dGluZyBhIHdhcm5pbmcgb3IgYnkganVzdCBkdW1w
aW5nCmFuZCBlcnJvciBhdCBwcm9jZXNzIGluaXRpYWxpemF0aW9uLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3Bl
blJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9s
aXN0aW5mby9vcGVucmlzYwo=
