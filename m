Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 772EF460361
	for <lists+openrisc@lfdr.de>; Sun, 28 Nov 2021 04:25:21 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2B7F724243;
	Sun, 28 Nov 2021 04:25:21 +0100 (CET)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com
 [209.85.221.170])
 by mail.librecores.org (Postfix) with ESMTPS id E94B422D3C
 for <openrisc@lists.librecores.org>; Sun, 28 Nov 2021 04:25:18 +0100 (CET)
Received: by mail-vk1-f170.google.com with SMTP id s1so183536vks.9
 for <openrisc@lists.librecores.org>; Sat, 27 Nov 2021 19:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=qFekgJA5nzGoD6wNf7BUcTL78+wW1XUTgncVHZIzGjw=;
 b=hM21RccUzRhYsryQSMdLSjOBAeaass7dd/r0Z82kRFd5pq6sm6RKQAn8go04bAN9YB
 w+nfgGHjlDCOWC2A2mi10cgmzFB0uvCQRsO19UU9oh+aaOsNMyCWb75qbnmxjkZMcnNF
 RupIunNt50mdg5RtdiZjJuHoxi+BKd2DSY5nUdOJCT2YHmOrCn5ERJeWizA8BahwGcI2
 /5/vDnpMRb7FfYlSYwKFVPjQE3fPZZSvbj8XfRAB472dbNugbjh+pdvWr4QwpPE6OXpV
 5hEgV2NIEA3yVYpOWbv4BXayNnOnOggL6YZ9n1K469Y15mMorqvoidhHuK1UMlcXgF40
 Zi1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=qFekgJA5nzGoD6wNf7BUcTL78+wW1XUTgncVHZIzGjw=;
 b=grzoY4TAJ+qu0qdzGoS/YrJ0hnJ5ki1App4D1PTnVqz6EffqdyM/OerwKqU+8smw/x
 s4Tf/FEDFr6cYyhT/Tuw/vDN5NG27wHVi0Hcq/EMOWAdXG51F9pI5VZQb3EE88YNAD62
 AGHbHkImSjR5TEXVm6tvEisX3d1pucwJKp8DqShIqMvKgygy4LWfyhxG98harJPmQIrg
 WTPNHs0qu/Yg7ArDbFrrWmmtNOe8gHts+mvy3p3USyKgO97wN3FIi+EvZxkvq+1EGf8G
 5olj4f5huTl0JlrfNqZwOWkSHcWBAiqNIDrQrhF9TfuLHqwr7QMLBIITmUdcpbOrpkSx
 7UVg==
X-Gm-Message-State: AOAM533pxNi2LlI3vj9AYVC6icm8IxIXMkQ5znUskTIzdAJsn4g5+AeS
 C9rUPliA4l/cIox/5rMeL/MI9s+ak9wCDVTGo2Y=
X-Google-Smtp-Source: ABdhPJw2So5pCUQz3/HI+8sXuIaUSMNOMG0D9MxR2cr/U0iH0QPj/t5pGafFCDSVIWhRIu893o0wc6UoeDHgY2kFrBg=
X-Received: by 2002:a1f:9d47:: with SMTP id g68mr28938867vke.28.1638069917696; 
 Sat, 27 Nov 2021 19:25:17 -0800 (PST)
MIME-Version: 1.0
From: Julius Baxter <juliusbaxter@gmail.com>
Date: Sun, 28 Nov 2021 14:25:06 +1100
Message-ID: <CAF6YiZ5=4+bGKipC0-cScNsd2s+4PGwTchXAJTtETF47AukpLQ@mail.gmail.com>
To: jidan@gmx.net
Subject: [OpenRISC] FPU licensing request
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgSmlkYW4sCgpJJ20gZ2V0dGluZyBpbiB0b3VjaCBiZWNhdXNlIEkgd2FudCB0byBhc2sgeW91
ciBwZXJtaXNzaW9uIHRvCnJlbGljZW5zZSBzb21lIG9mIHlvdXIgRlBVIGNvZGUuCgpJIHBvcnRl
ZCB5b3VyIFZIREwgRlBVIGRlc2lnbiB0byBWZXJpbG9nIG1hbnkgeWVhcnMgYWdvICgyMDEwIEkg
dGhpbmspCmFuZCBpdCdzIHNpbmNlIGJlZW4gaW5jbHVkZWQgaW4gdGhlIG1vcjFreCBPcGVuUklT
QyBDUFUgcHJvamVjdCBieQpBbmRyZXkgQmFjaGVyb3YgKENDJ2VkKS4KCkV4YW1wbGU6IGh0dHBz
Oi8vZ2l0aHViLmNvbS9vcGVucmlzYy9tb3Ixa3gvYmxvYi9tYXN0ZXIvcnRsL3Zlcmlsb2cvcGZw
dTMyL3BmcHUzMl9hZGRzdWIudgoKSXQncyBjdXJyZW50bHkgZ290IHdoYXQgbG9va3MgbGlrZSBh
IHBlcm1pc3NpdmUgbGljZW5jZSAoYXMgeW91IGNhbgpzZWUgaW4gdGhlIGxpbmsgYWJvdmUpIGJ1
dCBJIHdvdWxkIGxpa2UgdG8gYXNrIGlmIHdlIGNhbiByZWxpY2Vuc2UgdGhlCmNvZGUgdW5kZXIg
dGhlIENFUk4gT0hMIFYyIHdlYWtseSBwZXJtaXNzaXZlIGxpY2VuY2UuCgpJbiBzdW1tYXJ5LCB0
aGlzIGxpY2VuY2UgaXMgYSBmaWxlLWxldmVsIGNvcHlyaWdodCBmb3IgaGFyZHdhcmUKZGVzaWdu
cy4gVGhlIEZBUSBvbiBDRVJOJ3Mgc2l0ZSBhYm91dCB0aGUgT0hMIGlzIGdyZWF0IGZvciBleHBs
YW5pbmcKd2hhdCB0aGUgT0hMIHYyIGlzIHdoYXQgdGhlIFcgdmFyaWFudCBtZWFuczoKaHR0cHM6
Ly9vaHdyLm9yZy9wcm9qZWN0L2Nlcm5vaGwvd2lraXMvZmFxI3Etd2hhdC1hcmUtYWxsLXRoZXNl
LXN1ZmZpeGVzCgpUaGlzIHdvdWxkIG9ubHkgYXBwbHkgdG8gdGhpcyBjb3B5IG9mIHRoZSBzb3Vy
Y2UuIEl0IGRvZXMgbm90IGFmZmVjdAp0aGUgb3RoZXIgY29waWVzIHdoaWNoIGFyZSBvdXQgdGhl
cmUgb24gdGhlIGludGVybmV0LiBJIG9ubHkgYXNrIHRoaXMKZm9yIGNvbnNpc3RlbmN5IGFjcm9z
cyB0aGUgbW9yMWt4IENQVSBwcm9qZWN0LgoKWW91ciBwZXJtaXNzaW9uIHRvIGRvIHRoaXMgd291
bGQgYmUgZ3JlYXRseSBhcHByZWNpYXRlZC4KCkhhcHB5IHRvIGFuc3dlciBhbnkgb3RoZXIgcXVl
c3Rpb25zIHlvdSBoYXZlLgoKQ2hlZXJzLApKdWxpdXMKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxp
c3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8v
b3BlbnJpc2MK
