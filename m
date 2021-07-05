Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 3C6553BC396
	for <lists+openrisc@lfdr.de>; Mon,  5 Jul 2021 23:21:15 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id EE5AC20169;
	Mon,  5 Jul 2021 23:21:14 +0200 (CEST)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mail.librecores.org (Postfix) with ESMTPS id 3334120169
 for <openrisc@lists.librecores.org>; Mon,  5 Jul 2021 23:21:13 +0200 (CEST)
Received: by mail-pg1-f175.google.com with SMTP id o18so18816202pgu.10
 for <openrisc@lists.librecores.org>; Mon, 05 Jul 2021 14:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lZAZiGQ8yM2IQ6WgZx9hkNdsMQpfZ9RTTHCSXLg+XLA=;
 b=KPRNb6m+mNuF2aTlF0Hd7evhVnPqSPkTNLgcYegWb5NIgppX0YrKsxcIN7DAPFPMZq
 M+Fg7sWh+E/KWOnrFlAQXd9ytL40N4YFVnvtrnjpyZlelFdcvJgeEm7w0/dq7K81Sjic
 lkoj7k5fYNBmDwt6fMG6plEmUosw8UOFuwdgz+oeCNISGgBvk0wY6NfQwuHAoFQmShXu
 re7m+yy4TjCX22mglSAfpKkkMB6zVEWHC0/Q9tShcxVBFqrPOf26wyPgLa9+9fYXqUXp
 8AffEtIUDd9r9wCwgl8fkhPZhGw8kYnbh0D7z402YYWfksJHbDjLYBWYggmpaUg6OT8v
 aBTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lZAZiGQ8yM2IQ6WgZx9hkNdsMQpfZ9RTTHCSXLg+XLA=;
 b=CWi12QAXTIlMgpuTzwlc9zoOpNSLWXox22Aa4sJmlN/xxIwK6T8kXPh3qVpsU3ujRG
 td65xuiXTZLrXONe5NOm9ufoszfhhJeEoDT+hB7GP7bYxDuEzH/ftX5K8ueyj/C/U3Ac
 U3iQx3dH26B71XFqMwLblj7ZYsEGy7QIs3B2wxtcROJy2qVPn5obmSWML8hUU0UfAzfZ
 DFbaRB+9lIgrLE+u0Z26Tb3V8YPzfXgLXEbheEyCGM8KXmLxLK6nfuHUYdN4LcdfBPA9
 JWEqFOL6Yl1SehGjaicJOK3gLaQ2AWGWBz1JuzDzjucPu1QL8WfOlo91VpdrT1KIekQU
 2/Ig==
X-Gm-Message-State: AOAM533StzwbZgF/UK2I5yCgQv/IXmM6zQEYquxw6eCj0w2UpbU+EwCO
 wMiNK+LOJOVCajAK8hp3Hpg=
X-Google-Smtp-Source: ABdhPJyGK1ssXb4D88qVNjiLiUp8l+0nqXlIAyqsVaTWRNnzpiAuOphF6XPbEMBJ2J8JSEQ4EcnxCA==
X-Received: by 2002:a63:e948:: with SMTP id q8mr17809617pgj.52.1625520071638; 
 Mon, 05 Jul 2021 14:21:11 -0700 (PDT)
Received: from localhost (g164.115-65-218.ppp.wakwak.ne.jp. [115.65.218.164])
 by smtp.gmail.com with ESMTPSA id
 n56sm9909956pfv.65.2021.07.05.14.21.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 14:21:10 -0700 (PDT)
Date: Tue, 6 Jul 2021 06:21:03 +0900
From: Stafford Horne <shorne@gmail.com>
To: Jeff Johnston <jjohnstn@redhat.com>
Message-ID: <YON3v1bM0J4r9AzE@antec>
References: <20210701231748.1098623-1-shorne@gmail.com>
 <CAOox84vC8qfYVufYN+9yCiQtt=hJRfhz=Q_xczF8W5zvGq4Z+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="UY3USK03gWlID6SC"
Content-Disposition: inline
In-Reply-To: <CAOox84vC8qfYVufYN+9yCiQtt=hJRfhz=Q_xczF8W5zvGq4Z+A@mail.gmail.com>
Subject: Re: [OpenRISC] [PATCH] libgloss/or1k: Correct the IMMU SXE and UXE
 flags
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
Cc: Newlib <newlib@sourceware.org>, Openrisc <openrisc@lists.librecores.org>
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>


--UY3USK03gWlID6SC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 05, 2021 at 04:59:27PM -0400, Jeff Johnston wrote:
> Hi Stafford,
> 
> Please resend with the patch as an attachment.
> 
> Thanks,

Alright,

I hope it't OK in a reply here.  I usually send patches using git send-email, is
this something new for newlib?

Please find attached

-Stafford

--UY3USK03gWlID6SC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-libgloss-or1k-Correct-the-IMMU-SXE-and-UXE-flags.patch"

From f25c7124bc88627baf532d79c08130f1d2b61efb Mon Sep 17 00:00:00 2001
From: Stafford Horne <shorne@gmail.com>
Date: Fri, 2 Jul 2021 06:24:57 +0900
Subject: [PATCH] libgloss/or1k: Correct the IMMU SXE and UXE flags

These have been defined incorrectly, as per specification and CPU
implementations SXE is bit 6 and UXE is bit 7.  This was noticed when
tracking down our test suite mmu test failures.

 Test Suite: https://github.com/openrisc/or1k-tests/blob/master/native/or1k/or1k-mmu.c#L68-L72
 Spec: https://raw.githubusercontent.com/openrisc/doc/master/openrisc-arch-1.3-rev1.pdf

See section 8.4.8 Instruction Translation Lookaside Buffer Way y Translate
Registers where these are defined.

Signed-off-by: Stafford Horne <shorne@gmail.com>
---
 libgloss/or1k/include/or1k-sprs.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/libgloss/or1k/include/or1k-sprs.h b/libgloss/or1k/include/or1k-sprs.h
index 8d1fe5ed9..d545fb1d3 100644
--- a/libgloss/or1k/include/or1k-sprs.h
+++ b/libgloss/or1k/include/or1k-sprs.h
@@ -1797,17 +1797,17 @@
 #define OR1K_SPR_IMMU_ITLBW_TR_D_GET(X) (((X) >> 5) & 0x1)
 #define OR1K_SPR_IMMU_ITLBW_TR_D_SET(X, Y) (((X) & OR1K_UNSIGNED(0xffffffdf)) | ((!!(Y)) << 5))
 
-/* User Execute Enable */
-#define OR1K_SPR_IMMU_ITLBW_TR_UXE_OFFSET 6
-#define OR1K_SPR_IMMU_ITLBW_TR_UXE_MASK   0x00000040
-#define OR1K_SPR_IMMU_ITLBW_TR_UXE_GET(X) (((X) >> 6) & 0x1)
-#define OR1K_SPR_IMMU_ITLBW_TR_UXE_SET(X, Y) (((X) & OR1K_UNSIGNED(0xffffffbf)) | ((!!(Y)) << 6))
-
 /* Supervisor Execute Enable */
-#define OR1K_SPR_IMMU_ITLBW_TR_SXE_OFFSET 7
-#define OR1K_SPR_IMMU_ITLBW_TR_SXE_MASK   0x00000080
-#define OR1K_SPR_IMMU_ITLBW_TR_SXE_GET(X) (((X) >> 7) & 0x1)
-#define OR1K_SPR_IMMU_ITLBW_TR_SXE_SET(X, Y) (((X) & OR1K_UNSIGNED(0xffffff7f)) | ((!!(Y)) << 7))
+#define OR1K_SPR_IMMU_ITLBW_TR_SXE_OFFSET 6
+#define OR1K_SPR_IMMU_ITLBW_TR_SXE_MASK   0x00000040
+#define OR1K_SPR_IMMU_ITLBW_TR_SXE_GET(X) (((X) >> 6) & 0x1)
+#define OR1K_SPR_IMMU_ITLBW_TR_SXE_SET(X, Y) (((X) & OR1K_UNSIGNED(0xffffffbf)) | ((!!(Y)) << 6))
+
+/* User Execute Enable */
+#define OR1K_SPR_IMMU_ITLBW_TR_UXE_OFFSET 7
+#define OR1K_SPR_IMMU_ITLBW_TR_UXE_MASK   0x00000080
+#define OR1K_SPR_IMMU_ITLBW_TR_UXE_GET(X) (((X) >> 7) & 0x1)
+#define OR1K_SPR_IMMU_ITLBW_TR_UXE_SET(X, Y) (((X) & OR1K_UNSIGNED(0xffffff7f)) | ((!!(Y)) << 7))
 
 /* Physical Page Number */
 #define OR1K_SPR_IMMU_ITLBW_TR_PPN_LSB    13
-- 
2.31.1


--UY3USK03gWlID6SC
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--UY3USK03gWlID6SC--
