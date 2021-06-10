Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 867343A376F
	for <lists+openrisc@lfdr.de>; Fri, 11 Jun 2021 00:53:51 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 36E59213F3;
	Fri, 11 Jun 2021 00:53:51 +0200 (CEST)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by mail.librecores.org (Postfix) with ESMTPS id 05ADE209D6
 for <openrisc@lists.librecores.org>; Fri, 11 Jun 2021 00:53:49 +0200 (CEST)
Received: by mail-qt1-f179.google.com with SMTP id o20so1193697qtr.8
 for <openrisc@lists.librecores.org>; Thu, 10 Jun 2021 15:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=qhe6fz+nsoQZS4Hjoh416Yt7QamsCoCbP02gy03H5SE=;
 b=ZIW+1hwi49qTZFVkrjN1f2unlkbhGb63v4lmeTGj/QKgG4vl1rmyNsnE9E+ayhqc5L
 O3eZ+Rh4Io4FkNQXAi1hINuQIp9NyL0BFuO6bfXzRuS3cPEkzHnkLQBDx9Yy8zCoqCe7
 Gt2PDQPKuTGlo84FRwfw8OLPU3lV024Jnno9WrLXZqdXUdBUB8vwmhp8W2E1vddO95yR
 Be5TkgrBmcvoavLfZPdLJQC62WuZPjJzz6b1UbWWrCzByVxsTCdCcWDsLpM/K3DPLdIW
 p0AW1XDidq+Oiudfz+LioY4xG62YfM7tTyGF1tHP2HyMxQI1ClhY4u/Z7nCSBNNXjG61
 7gBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=qhe6fz+nsoQZS4Hjoh416Yt7QamsCoCbP02gy03H5SE=;
 b=Y7LFBYIFYSz1x2sCwUsmYZIzUaamB/XGl2jxnbziCq2TypyTs458tIoooj17fnsKKs
 19asqI6Of+0fKQ/TH8fZlJ2saCQsFJ9oRf084CTmVa99c3CE+ro6e0eui66KPAHFB0xE
 8kTVSWfMubVxr6yBpUVfPfXHvqQVMNONqpjFA2VNAD43Uh8djBYnNeNuTRn9U3yIKE0V
 PyOiAJUcPmOv7xOwnstDBIGAI56N317Q0AosFdsfuUnSGxU0WGrrxxGKgkiAa8Cz+uWd
 Bd2rgAJFnHZotcvO8osckNbHj43MeEaXfVds0pbYMywr102H+B8D+O7byiOi3zIAXipz
 2WLA==
X-Gm-Message-State: AOAM532PEsp3rYumnccdHFN2H5By05E5BuYg57xNNMq+DflykMOX8uaj
 wFL1RTv/Xa/V/Be+mN2csKpuUrIUe7dSK1GJMCJSirdNv/I=
X-Google-Smtp-Source: ABdhPJzbssoB8R1YcoO8rvIZpieJxeNl0Q2wF9CLOU5BDKuC5ImUyMd3VNJpUNRj0bRDyMBUBwCVVYuaGjdahbSH2sw=
X-Received: by 2002:aed:30c1:: with SMTP id 59mr1205326qtf.16.1623365627490;
 Thu, 10 Jun 2021 15:53:47 -0700 (PDT)
MIME-Version: 1.0
From: huang guanlong <gl041188@gmail.com>
Date: Thu, 10 Jun 2021 18:53:36 -0400
Message-ID: <CANvKV6b4vozYRmXfUpyfAqSPSnds8_m3OVJYz2vevBLpE3HZZg@mail.gmail.com>
To: openrisc@lists.librecores.org
Subject: Re: [OpenRISC] [PATCH v2 10/15] openrisc: convert to
 setup_initial_init_mm()
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
Content-Type: multipart/mixed; boundary="===============8461355542067776754=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

--===============8461355542067776754==
Content-Type: multipart/alternative; boundary="0000000000009135cd05c4714397"

--0000000000009135cd05c4714397
Content-Type: text/plain; charset="UTF-8"



--0000000000009135cd05c4714397
Content-Type: text/html; charset="UTF-8"

<div dir="auto"></div>

--0000000000009135cd05c4714397--

--===============8461355542067776754==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============8461355542067776754==--
