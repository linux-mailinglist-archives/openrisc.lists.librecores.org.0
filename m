Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 4C43F4BCB17
	for <lists+openrisc@lfdr.de>; Sun, 20 Feb 2022 00:05:09 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A834A2489A;
	Sun, 20 Feb 2022 00:05:08 +0100 (CET)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mail.librecores.org (Postfix) with ESMTPS id 33FC424881
 for <openrisc@lists.librecores.org>; Sun, 20 Feb 2022 00:05:07 +0100 (CET)
Received: by mail-ej1-f54.google.com with SMTP id r13so501970ejd.5
 for <openrisc@lists.librecores.org>; Sat, 19 Feb 2022 15:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=kyujE7l18V0fKKA2OKx570ZoBsyDNJi+rcGq0bHl3TI=;
 b=Mt75LBrBnaoCVOSiCQiRId/kkIURRIT3uHgDC5AENTzL4AIL01UQniPXLivYbW2tsf
 pBXVENrRHNWMe+uZCu1/99Lm05PaSErHYIS7kQ4k4dZEjmySwMNm+RuLjO8jorxoot5d
 w1ChiE+i9T3Kq4PenrGU7r5IEjGtGkHXrNuX10tDsNd1RCil/YDJHNJPU5S2ZI3PePAi
 v9CtUy0GWtj9900dn7e/yZpVQ+H2MUqm+aZMrtdgtjnh1sw2kwMj8sNNVVwxJPD944v8
 157pVNb07jGQwFus5QnNTe04iMLLyDZcxfTBAWwXQPKxtSitIy/RrwLd/ZNccBUnwMad
 vKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=kyujE7l18V0fKKA2OKx570ZoBsyDNJi+rcGq0bHl3TI=;
 b=zAOiGBnteAFfCpd8cT4i/iJbGjfQaprh6pb0LAbw2QFumy4Y4srl+IEvntG/w3gNpK
 ZzCt/yf7sJyc+DEf1Q9dkuQB+gCB+Oy7wh30D+Glc0t3GVRo/XmUsSrdFZwGqixPutqs
 BfgDtT7N468gAc5IMCb77KW7Xxk0lCEGnJK06S0ht1F2NPgI2FXAbG+LVj05VyQtN9dx
 VIOJB6ZEsQZarK2ewV7CJyBQ7rgpXnSS8I3E3Pkk4BqGyYJWgy8QjwGjNIqwxasT3Qj0
 YorlWVXW+9PWfl/SsDmih7HHl4YH4tVenZQL725jh5BlMq28F6zoIqHxSTSmrxaAToaD
 h3UA==
X-Gm-Message-State: AOAM531hhXp04g+L74VCZPW6YzwFy4zVNPpeskO81/cDrSLQy/9oZ5+m
 ZBuf5SM+nTp1dJjosCx97GbIikTALkUvQgSJ6Ve9ZiOrd1DIxw==
X-Google-Smtp-Source: ABdhPJzi7w9zDk7B7SVkoYq2DHefYK5hivqAF0+/50LKJyuhjnU9NST8+/DEfimGX/w/IdAL6/Imxx3VwA7I6DvbgW4=
X-Received: by 2002:a17:906:ce52:b0:6cf:54e5:df6 with SMTP id
 se18-20020a170906ce5200b006cf54e50df6mr10934381ejb.740.1645311906476; Sat, 19
 Feb 2022 15:05:06 -0800 (PST)
MIME-Version: 1.0
From: Stafford Horne <shorne@gmail.com>
Date: Sun, 20 Feb 2022 08:04:55 +0900
Message-ID: <CAAfxs770Shy8Unwo75aXiT135AvBwyr3oxOQZ5hnTeckKBdVoA@mail.gmail.com>
To: Openrisc <openrisc@lists.librecores.org>
Subject: [OpenRISC] Architecture Revision 1.4 - FPCSR access
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
Cc: BAndViG <bandvig@mail.ru>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgQWxsLAoKQSBuZXh0IG1pbGVzdG9uZSBmb3IgT3BlblJJU0MgaXMgdG8gYWRkIExpbnV4IHVz
ZXItc3BhY2UgYWNjZXNzIGZvcgp0aGUgRlBVLiAgT25lIGxpbWl0YXRpb24gaW4gdGhlIE9wZW5S
SVNDIGFyY2hpdGVjdHVyZSBpcyB0aGF0IHRoZQpGUENTUiBpcyBub3QgVXNlci1TcGFjZSBhY2Nl
c3NpYmxlLgoKVGhpcyBpcyByZXF1aXJlZCB0byB1c2UgYWxsIG9mIHRoZSB1c2VyLXNwYWNlIEZQ
VSBmdW5jdGlvbmFsaXR5CmF2YWlsYWJsZSBpbiBDIExpYnJhcmllcyBsaWtlIGdsaWJjIChpLmUu
IHNldHRpbmcgcm91bmRpbmcsIGFuZApjaGVja2luZyBleGNlcHRpb25zKS4gIFRoaXMgd2lsbCBo
ZWxwIEFuZHJleSB3aXRoIE1hcm9jY2hpbm8gRlBVCnRlc3RpbmcgYXMgd2VsbCBhcyBoZWxwIGdl
dCB0aGUgaGFyZC1mbG9hdCBzdXBwb3J0IGZvciBnbGliYwp1cHN0cmVhbWVkLgoKSSBoYXZlIGNy
ZWF0ZWQgYW4gaW5pdGlhbCBQUiBmb3IgdGhlIGFyY2hpdGVjdHVyZSBzcGVjaWZpY2F0aW9uIGNo
YW5nZToKICBodHRwczovL2dpdGh1Yi5jb20vb3BlbnJpc2MvZG9jL3B1bGwvNAoKQ2hhbmdlcyBm
b3IgY29yZXMgdG8gc3VwcG9ydCBGUENTUiBhY2Nlc3MgaGF2ZSBiZWVuIGRvbmUgYnkgQW5kcmV5
OgogIG1vcjFreCAtIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVucmlzYy9tb3Ixa3gvY29tbWl0cy9m
cGNzcl9mcmVlX2FjY2VzcwogIG1hcm9jY2hpbm8gLSBodHRwczovL2dpdGh1Yi5jb20vb3BlbnJp
c2Mvb3Ixa19tYXJvY2NoaW5vL3RyZWUvZnBjc3JfZnJlZV9hY2Nlc3MKCkhhcmQgZmxvYXQgc3Vw
cG9ydCBmb3IgR0xJQkMgaXMgYXZhaWxhYmxlIGhlcmU6CiAgaHR0cHM6Ly9naXRodWIuY29tL29w
ZW5yaXNjL29yMWstZ2xpYmMvY29tbWl0cy9vcjFrLWhhcmQtZmxvYXQKCkNvbmNlcm5zClRoZXJl
IG1heSBiZSBzb21lIGNvbmNlcm4gdGhhdCB0aGlzIG1ha2VzIGEgY2hhbmdlIHRoYXQgbWVhbnMg
aGFyZHdhcmUKZXhwZWN0aW5nIGFjY2VzcyB0byBGUENTUiBjb3VsZCBub3QgcnVuIG9uIG9sZGVy
IENQVXMuICBJIHRoaW5rIHN1Y2gKZnV0dXJlIHNvZnR3YXJlIGNvdWxkIGRldGVjdCB0aGlzIGJ5
IGF0dGVtcHRpbmcgYSByZWFkL3dyaXRlIHRvIHRoZQpGUENTUiB0byBjaGVjayBpZiBhY2Nlc3Mg
aXMgYXZhaWxhYmxlLgoKQXQgdGhpcyBwb2ludCB3ZSBjb3VsZCBhbHNvIGxvb2sgaW50byB0aGUg
cHJvcG9zYWwgdG8gY2hhbmdlIGhvdyBTUFIKYWNjZXNzIGlzIGhhbmRsZWQgYXMgZGVzY3JpYmVk
IGluIFAzLiAgUDMgcHJvcG9zZXMgdGhhdCB3ZSBjb3VsZApjaGFuZ2UgdW5hdXRob3JpemVkIFNQ
UiBhY2Nlc3MgdG8gcmFpc2UgSWxsZWdhbCBJbnN0cnVjdGlvbiBFeGNlcHRpb25zCmFuZCBoYXZl
IGFjY2VzcyBjb250cm9sbGVkIGJ5IHRoZSBPUy4gICBIb3dldmVyIEkgdGhpbmsgdGhhdCB3aWxs
IGhhdmUKbW9yZSBpbXBhY3QgdGhhbiB3ZSBuZWVkIGF0IHRoaXMgdGltZS4KCiAgUDMgaHR0cHM6
Ly9vcGVucmlzYy5pby9wcm9wb3NhbHMvc3ByLWFjY2Vzcy11cGRhdGVzCgotU3RhZmZvcmQKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFp
bGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGli
cmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
