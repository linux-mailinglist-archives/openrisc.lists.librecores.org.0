Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B4FFE47D87D
	for <lists+openrisc@lfdr.de>; Wed, 22 Dec 2021 22:04:12 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 93354242E9;
	Wed, 22 Dec 2021 22:04:12 +0100 (CET)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 by mail.librecores.org (Postfix) with ESMTPS id C50B9240ED
 for <openrisc@lists.librecores.org>; Wed, 22 Dec 2021 22:04:10 +0100 (CET)
Received: by mail-ua1-f51.google.com with SMTP id p37so6370174uae.8
 for <openrisc@lists.librecores.org>; Wed, 22 Dec 2021 13:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=gdfl78Hlt2xiPnuuQdk97yOeNr1Fu022AHs4IW1V8p0=;
 b=UrE/fV+CcZtENs6qRiDhThr4S1JepZtBSaZBoTuPDkJyeg4HM1nh5Ap+ARdH8JFKPh
 4/mjBn0EAaXDBpFwU+zsPz13jj86S3DeF7Z8CqR7Mlnfy3XVG+nq88vzEUyw68ruCUur
 AgWDZjd1dj1SKqHvGhNXudD/f8t9rwdJkWLadDhmuTq6T2LCH3luXzx3oUIqy4xEhehM
 Deh7q8Ng3ItcKYFI6Vs+jUloEPZLgMVId1sSBjFAee1V24U8v/zm9/i5oy6tF/+Q5cV/
 aoxMuKbO5nCyDHYi8yGou+Iuihmb+V4jS7huU9z2cVs7XghoFYj9Nwtr4O5fFkOs5Hja
 tLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gdfl78Hlt2xiPnuuQdk97yOeNr1Fu022AHs4IW1V8p0=;
 b=i1kXVpfhZvHxCfWAdi5+huNP24UHMVheyKBF9WgOtw6sxrT0IEMs7lpsfPsTWX7z/1
 U93/RAWXnjvk8byeVGdAGUKbtTErStFl/36xS4M2ubrDbwtYkI26S2vPKDsUqVtkM+Ot
 W5sGbe0qyk+PK5NjBgXydZ0bUd7xCCKw9u3t0XUQBNAlUS+IUWoDCH+4vQydQgulvnH3
 OOkT2jdAk8qvi1Umwl2L0eMvaMkyTlg/jntYruW1OtRNk117QMQ+0JvreHMr7BD3LQe5
 fBNhoYY3Jsbw/jCjWKiVfEH7fkhmLQz5sEcsyZqqf3+ta8P8lKBUeCQf8o/o/y3Sy5Yq
 B2Jw==
X-Gm-Message-State: AOAM5326RM7xEYRPQ31SESwe9lugp9Xb81ucX5J3Tl8uJsto2VkNMNFQ
 zTHhwG4HBt3rNfMq7VhliGWYbA==
X-Google-Smtp-Source: ABdhPJzOY72zO0hMFmDlwTSLcgzcVX5R/lppUNoVnRQyXWMG06e/d7jo+Qnp3AdHUCKEemIb9PE/4g==
X-Received: by 2002:ab0:23c6:: with SMTP id c6mr1553248uan.74.1640207049748;
 Wed, 22 Dec 2021 13:04:09 -0800 (PST)
Received: from ?IPV6:2804:431:c7cb:3b1e:1ba8:c11f:6224:efe1?
 ([2804:431:c7cb:3b1e:1ba8:c11f:6224:efe1])
 by smtp.gmail.com with ESMTPSA id c14sm620932vsl.22.2021.12.22.13.04.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Dec 2021 13:04:09 -0800 (PST)
Message-ID: <8c8ce20c-eea9-10d5-fef6-08543364fb0d@linaro.org>
Date: Wed, 22 Dec 2021 18:04:07 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>,
 GLIBC patches <libc-alpha@sourceware.org>
References: <20211210233456.4146479-1-shorne@gmail.com>
 <20211210233456.4146479-13-shorne@gmail.com>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
In-Reply-To: <20211210233456.4146479-13-shorne@gmail.com>
Subject: Re: [OpenRISC] [PATCH v3 12/13] build-many-glibcs.py: add OpenRISC
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
Cc: Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

CgpPbiAxMC8xMi8yMDIxIDIwOjM0LCBTdGFmZm9yZCBIb3JuZSB2aWEgTGliYy1hbHBoYSB3cm90
ZToKPiAtLS0KPiAgc2NyaXB0cy9idWlsZC1tYW55LWdsaWJjcy5weSB8IDUgKysrKysKPiAgMSBm
aWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9zY3JpcHRzL2J1
aWxkLW1hbnktZ2xpYmNzLnB5IGIvc2NyaXB0cy9idWlsZC1tYW55LWdsaWJjcy5weQo+IGluZGV4
IDZhZTIxNzI5NTYuLjQ3YjJjYWJjOWMgMTAwNzU1Cj4gLS0tIGEvc2NyaXB0cy9idWlsZC1tYW55
LWdsaWJjcy5weQo+ICsrKyBiL3NjcmlwdHMvYnVpbGQtbWFueS1nbGliY3MucHkKPiBAQCAtMzM0
LDYgKzMzNCwxMCBAQCBjbGFzcyBDb250ZXh0KG9iamVjdCk6Cj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICdjY29wdHMnOiAnLW1hYmk9NjQnfV0pCj4gICAgICAgICAgc2VsZi5h
ZGRfY29uZmlnKGFyY2g9J25pb3MyJywKPiAgICAgICAgICAgICAgICAgICAgICAgICAgb3NfbmFt
ZT0nbGludXgtZ251JykKPiArICAgICAgICBzZWxmLmFkZF9jb25maWcoYXJjaD0nb3IxaycsCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgIG9zX25hbWU9J2xpbnV4LWdudScsCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgIHZhcmlhbnQ9J3NvZnQnLAo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICBnY2NfY2ZnPVsnLS13aXRoLW11bHRpbGliLWxpc3Q9bWNtb3YnXSkKCldoeSBpcyB0aGlzIG9w
dGlvbiByZXF1aXJlZD8KCj4gICAgICAgICAgc2VsZi5hZGRfY29uZmlnKGFyY2g9J3Bvd2VycGMn
LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICBvc19uYW1lPSdsaW51eC1nbnUnLAo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICBnY2NfY2ZnPVsnLS1kaXNhYmxlLW11bHRpbGliJywgJy0tZW5h
YmxlLXNlY3VyZXBsdCddLAo+IEBAIC0xMjcwLDYgKzEyNzQsNyBAQCBkZWYgaW5zdGFsbF9saW51
eF9oZWFkZXJzKHBvbGljeSwgY21kbGlzdCk6Cj4gICAgICAgICAgICAgICAgICAnbWljcm9ibGF6
ZSc6ICdtaWNyb2JsYXplJywKPiAgICAgICAgICAgICAgICAgICdtaXBzJzogJ21pcHMnLAo+ICAg
ICAgICAgICAgICAgICAgJ25pb3MyJzogJ25pb3MyJywKPiArICAgICAgICAgICAgICAgICdvcjFr
JzogJ29wZW5yaXNjJywKPiAgICAgICAgICAgICAgICAgICdwb3dlcnBjJzogJ3Bvd2VycGMnLAo+
ICAgICAgICAgICAgICAgICAgJ3MzOTAnOiAnczM5MCcsCj4gICAgICAgICAgICAgICAgICAncmlz
Y3YzMic6ICdyaXNjdicsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9y
ZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
