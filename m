Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C87DB3BC391
	for <lists+openrisc@lfdr.de>; Mon,  5 Jul 2021 23:15:59 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8164D2017F;
	Mon,  5 Jul 2021 23:15:59 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by mail.librecores.org (Postfix) with ESMTP id 8BEA621299
 for <openrisc@lists.librecores.org>; Mon,  5 Jul 2021 22:59:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625518782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=foG7OgL6/U5Tvyrr4bv12GjTyfLaeGr5C4a9VhwtyHE=;
 b=CWQn7kLSp1FL/M4aK9SQJqFiG0DZztNZsmuN6M2EK/VqPYkehLA1dsFdZ6i/pRv+SHtVsO
 U6O0pe1bqZCg7Xb0Z5+DkRGmUIJtXUfKWCB0I2g25zITRRbiab+veJbHIaqTCDGvZBHl+x
 MbwAQi+I1QASwZ2sTRO+C60wPtQsMTs=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-TiXBFz-XNHeXbMNElfLIKQ-1; Mon, 05 Jul 2021 16:59:39 -0400
X-MC-Unique: TiXBFz-XNHeXbMNElfLIKQ-1
Received: by mail-pg1-f200.google.com with SMTP id
 y1-20020a655b410000b02902235977d00cso14539193pgr.21
 for <openrisc@lists.librecores.org>; Mon, 05 Jul 2021 13:59:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=foG7OgL6/U5Tvyrr4bv12GjTyfLaeGr5C4a9VhwtyHE=;
 b=unATwKAFU5v46Owo2vwRSHfQX/bJ/tneMhTYMZVrHOLnhQy8ODCYVtuMHvW36LyeVm
 XiAAetgf7D66kq4StlltrPolnAcSQ7j6LHHn5Y2l1qxGfFKWaV/KDi4Ad8IFEamI9Vg4
 qFDz7LPKCmNDveYtlKDRFVZH0RCjWcEk1O+ZmMndLqzDpcAiQ/uFODn3snrRWW94lAI1
 dS+LfUVWPrceX/L/ab0MCkBBnPVVSqiIqS9tRLBOHkpqXSFW5bE9kI8WEzJOmrcCzYmM
 mHekt2q/tQheHdKw2ONyQ8QuJW3posWgcHiNd7Pjygl1Z2rADctEHds7QDyFpFvnPLhc
 qiWg==
X-Gm-Message-State: AOAM530Po+2nAXEQ63+9PHN2qZASxZbsUksYoEiSpA4MBBZRkZGbkCSP
 yK5zQpcl4MpLgDYI9nx8XIYfvvZCwD96vhwsi8Ze+NXEKZo3smu7ZK8ujTl9QWG+WbWZbqFEDTO
 j8x5xkVSDHvjOpKd53lz6pWKd+zWf3WcvCHmijzgnaQ==
X-Received: by 2002:a17:902:8484:b029:101:7016:fb7b with SMTP id
 c4-20020a1709028484b02901017016fb7bmr13747450plo.23.1625518778691; 
 Mon, 05 Jul 2021 13:59:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUc/CNVwRLeXcYltyfney4iCrAj5cOVFLLoyazLi9lfOhc7zjWuxbHMGeDTtRhwbx46QEgVTVPY4aWlM7P4No=
X-Received: by 2002:a17:902:8484:b029:101:7016:fb7b with SMTP id
 c4-20020a1709028484b02901017016fb7bmr13747441plo.23.1625518778425; Mon, 05
 Jul 2021 13:59:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210701231748.1098623-1-shorne@gmail.com>
In-Reply-To: <20210701231748.1098623-1-shorne@gmail.com>
From: Jeff Johnston <jjohnstn@redhat.com>
Date: Mon, 5 Jul 2021 16:59:27 -0400
Message-ID: <CAOox84vC8qfYVufYN+9yCiQtt=hJRfhz=Q_xczF8W5zvGq4Z+A@mail.gmail.com>
To: Stafford Horne <shorne@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jjohnstn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Mailman-Approved-At: Mon, 05 Jul 2021 23:15:57 +0200
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
Content-Type: multipart/mixed; boundary="===============7262994395400208082=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

--===============7262994395400208082==
Content-Type: multipart/alternative; boundary="0000000000005d35a705c6669592"

--0000000000005d35a705c6669592
Content-Type: text/plain; charset="UTF-8"

Hi Stafford,

Please resend with the patch as an attachment.

Thanks,

-- Jeff J.

On Thu, Jul 1, 2021 at 7:18 PM Stafford Horne <shorne@gmail.com> wrote:

> These have been defined incorrectly, as per specification and CPU
> implementations SXE is bit 6 and UXE is bit 7.  This was noticed when
> tracking down our test suite mmu test failures.
>
>  Test Suite:
> https://github.com/openrisc/or1k-tests/blob/master/native/or1k/or1k-mmu.c#L68-L72
>  Spec:
> https://raw.githubusercontent.com/openrisc/doc/master/openrisc-arch-1.3-rev1.pdf
>
> See section 8.4.8 Instruction Translation Lookaside Buffer Way y Translate
> Registers where these are defined.
>
> Signed-off-by: Stafford Horne <shorne@gmail.com>
> ---
>  libgloss/or1k/include/or1k-sprs.h | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/libgloss/or1k/include/or1k-sprs.h
> b/libgloss/or1k/include/or1k-sprs.h
> index 8d1fe5ed9..d545fb1d3 100644
> --- a/libgloss/or1k/include/or1k-sprs.h
> +++ b/libgloss/or1k/include/or1k-sprs.h
> @@ -1797,17 +1797,17 @@
>  #define OR1K_SPR_IMMU_ITLBW_TR_D_GET(X) (((X) >> 5) & 0x1)
>  #define OR1K_SPR_IMMU_ITLBW_TR_D_SET(X, Y) (((X) &
> OR1K_UNSIGNED(0xffffffdf)) | ((!!(Y)) << 5))
>
> -/* User Execute Enable */
> -#define OR1K_SPR_IMMU_ITLBW_TR_UXE_OFFSET 6
> -#define OR1K_SPR_IMMU_ITLBW_TR_UXE_MASK   0x00000040
> -#define OR1K_SPR_IMMU_ITLBW_TR_UXE_GET(X) (((X) >> 6) & 0x1)
> -#define OR1K_SPR_IMMU_ITLBW_TR_UXE_SET(X, Y) (((X) &
> OR1K_UNSIGNED(0xffffffbf)) | ((!!(Y)) << 6))
> -
>  /* Supervisor Execute Enable */
> -#define OR1K_SPR_IMMU_ITLBW_TR_SXE_OFFSET 7
> -#define OR1K_SPR_IMMU_ITLBW_TR_SXE_MASK   0x00000080
> -#define OR1K_SPR_IMMU_ITLBW_TR_SXE_GET(X) (((X) >> 7) & 0x1)
> -#define OR1K_SPR_IMMU_ITLBW_TR_SXE_SET(X, Y) (((X) &
> OR1K_UNSIGNED(0xffffff7f)) | ((!!(Y)) << 7))
> +#define OR1K_SPR_IMMU_ITLBW_TR_SXE_OFFSET 6
> +#define OR1K_SPR_IMMU_ITLBW_TR_SXE_MASK   0x00000040
> +#define OR1K_SPR_IMMU_ITLBW_TR_SXE_GET(X) (((X) >> 6) & 0x1)
> +#define OR1K_SPR_IMMU_ITLBW_TR_SXE_SET(X, Y) (((X) &
> OR1K_UNSIGNED(0xffffffbf)) | ((!!(Y)) << 6))
> +
> +/* User Execute Enable */
> +#define OR1K_SPR_IMMU_ITLBW_TR_UXE_OFFSET 7
> +#define OR1K_SPR_IMMU_ITLBW_TR_UXE_MASK   0x00000080
> +#define OR1K_SPR_IMMU_ITLBW_TR_UXE_GET(X) (((X) >> 7) & 0x1)
> +#define OR1K_SPR_IMMU_ITLBW_TR_UXE_SET(X, Y) (((X) &
> OR1K_UNSIGNED(0xffffff7f)) | ((!!(Y)) << 7))
>
>  /* Physical Page Number */
>  #define OR1K_SPR_IMMU_ITLBW_TR_PPN_LSB    13
> --
> 2.31.1
>
>

--0000000000005d35a705c6669592
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Stafford,</div><div><br></div><div>Please resend w=
ith the patch as an attachment.</div><div><br></div><div>Thanks,</div><div>=
<br></div><div>-- Jeff J.<br></div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 1, 2021 at 7:18 PM Stafford =
Horne &lt;<a href=3D"mailto:shorne@gmail.com">shorne@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">These have be=
en defined incorrectly, as per specification and CPU<br>
implementations SXE is bit 6 and UXE is bit 7.=C2=A0 This was noticed when<=
br>
tracking down our test suite mmu test failures.<br>
<br>
=C2=A0Test Suite: <a href=3D"https://github.com/openrisc/or1k-tests/blob/ma=
ster/native/or1k/or1k-mmu.c#L68-L72" rel=3D"noreferrer" target=3D"_blank">h=
ttps://github.com/openrisc/or1k-tests/blob/master/native/or1k/or1k-mmu.c#L6=
8-L72</a><br>
=C2=A0Spec: <a href=3D"https://raw.githubusercontent.com/openrisc/doc/maste=
r/openrisc-arch-1.3-rev1.pdf" rel=3D"noreferrer" target=3D"_blank">https://=
raw.githubusercontent.com/openrisc/doc/master/openrisc-arch-1.3-rev1.pdf</a=
><br>
<br>
See section 8.4.8 Instruction Translation Lookaside Buffer Way y Translate<=
br>
Registers where these are defined.<br>
<br>
Signed-off-by: Stafford Horne &lt;<a href=3D"mailto:shorne@gmail.com" targe=
t=3D"_blank">shorne@gmail.com</a>&gt;<br>
---<br>
=C2=A0libgloss/or1k/include/or1k-sprs.h | 20 ++++++++++----------<br>
=C2=A01 file changed, 10 insertions(+), 10 deletions(-)<br>
<br>
diff --git a/libgloss/or1k/include/or1k-sprs.h b/libgloss/or1k/include/or1k=
-sprs.h<br>
index 8d1fe5ed9..d545fb1d3 100644<br>
--- a/libgloss/or1k/include/or1k-sprs.h<br>
+++ b/libgloss/or1k/include/or1k-sprs.h<br>
@@ -1797,17 +1797,17 @@<br>
=C2=A0#define OR1K_SPR_IMMU_ITLBW_TR_D_GET(X) (((X) &gt;&gt; 5) &amp; 0x1)<=
br>
=C2=A0#define OR1K_SPR_IMMU_ITLBW_TR_D_SET(X, Y) (((X) &amp; OR1K_UNSIGNED(=
0xffffffdf)) | ((!!(Y)) &lt;&lt; 5))<br>
<br>
-/* User Execute Enable */<br>
-#define OR1K_SPR_IMMU_ITLBW_TR_UXE_OFFSET 6<br>
-#define OR1K_SPR_IMMU_ITLBW_TR_UXE_MASK=C2=A0 =C2=A00x00000040<br>
-#define OR1K_SPR_IMMU_ITLBW_TR_UXE_GET(X) (((X) &gt;&gt; 6) &amp; 0x1)<br>
-#define OR1K_SPR_IMMU_ITLBW_TR_UXE_SET(X, Y) (((X) &amp; OR1K_UNSIGNED(0xf=
fffffbf)) | ((!!(Y)) &lt;&lt; 6))<br>
-<br>
=C2=A0/* Supervisor Execute Enable */<br>
-#define OR1K_SPR_IMMU_ITLBW_TR_SXE_OFFSET 7<br>
-#define OR1K_SPR_IMMU_ITLBW_TR_SXE_MASK=C2=A0 =C2=A00x00000080<br>
-#define OR1K_SPR_IMMU_ITLBW_TR_SXE_GET(X) (((X) &gt;&gt; 7) &amp; 0x1)<br>
-#define OR1K_SPR_IMMU_ITLBW_TR_SXE_SET(X, Y) (((X) &amp; OR1K_UNSIGNED(0xf=
fffff7f)) | ((!!(Y)) &lt;&lt; 7))<br>
+#define OR1K_SPR_IMMU_ITLBW_TR_SXE_OFFSET 6<br>
+#define OR1K_SPR_IMMU_ITLBW_TR_SXE_MASK=C2=A0 =C2=A00x00000040<br>
+#define OR1K_SPR_IMMU_ITLBW_TR_SXE_GET(X) (((X) &gt;&gt; 6) &amp; 0x1)<br>
+#define OR1K_SPR_IMMU_ITLBW_TR_SXE_SET(X, Y) (((X) &amp; OR1K_UNSIGNED(0xf=
fffffbf)) | ((!!(Y)) &lt;&lt; 6))<br>
+<br>
+/* User Execute Enable */<br>
+#define OR1K_SPR_IMMU_ITLBW_TR_UXE_OFFSET 7<br>
+#define OR1K_SPR_IMMU_ITLBW_TR_UXE_MASK=C2=A0 =C2=A00x00000080<br>
+#define OR1K_SPR_IMMU_ITLBW_TR_UXE_GET(X) (((X) &gt;&gt; 7) &amp; 0x1)<br>
+#define OR1K_SPR_IMMU_ITLBW_TR_UXE_SET(X, Y) (((X) &amp; OR1K_UNSIGNED(0xf=
fffff7f)) | ((!!(Y)) &lt;&lt; 7))<br>
<br>
=C2=A0/* Physical Page Number */<br>
=C2=A0#define OR1K_SPR_IMMU_ITLBW_TR_PPN_LSB=C2=A0 =C2=A0 13<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div>

--0000000000005d35a705c6669592--


--===============7262994395400208082==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============7262994395400208082==--

