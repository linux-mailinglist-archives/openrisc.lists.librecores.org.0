Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id DCD2E20A73E
	for <lists+openrisc@lfdr.de>; Thu, 25 Jun 2020 23:11:16 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9BF2F20B8B;
	Thu, 25 Jun 2020 23:11:16 +0200 (CEST)
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by mail.librecores.org (Postfix) with ESMTPS id 17CE0205A7
 for <openrisc@lists.librecores.org>; Thu, 25 Jun 2020 23:11:14 +0200 (CEST)
Received: by mail-pj1-f65.google.com with SMTP id b92so3913632pjc.4
 for <openrisc@lists.librecores.org>; Thu, 25 Jun 2020 14:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=X2Y5t1dKzr/SYf36lPT97sgIrFXEnQgrqfJccb62zp4=;
 b=QcX55Q+XgMXu91WqdPsHUPMZjt7V9aPWd2V9HjPFdibFoCViwpNOJJ/VOV1j1Oy4jl
 Wm0Q7PwLCXx2I/tp+YvmvireijJ2ZXVrHNAu8WlLkEwFaIeHwphV9Sn/vG23dCXqfg/6
 lxWIzqOGTsOP9ACva8vlaAMTtWz7lnEkhEpEDmkcYP+gv4yDhcya4EIfyaxzco7ldWtn
 ZK39YOeNmNRPKToukKT3l/+S1IguHFUDRGKu8gJq8IqJwS+c3jhoMBxpG7hs3EL5zzTv
 UnpUEn6ch9Erv4Wt4tjI7QGiMvL8nVZ5+vHtT3hyG4ca1en6X/JM1ctQrA/ODrQh31FE
 Fq6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=X2Y5t1dKzr/SYf36lPT97sgIrFXEnQgrqfJccb62zp4=;
 b=RLR4wJ8f+hFDdUe0ArQq07uiN6Vkaxf9rf/TFRfLBbLfDJc6So/xMYfTyENGeFUDZY
 x0K8qC2o7yO1rhogPEdHj00MnTuea/ndogswpPl00H8JYxcG5WSHRfAZDYkchJS2cXY9
 obIuIF0q9E24FSUZxPrPxoOUddNxpfYZFCVpoTjKRBALwCyArCXSQ/q0Vg72Zn7o6Xs6
 FOQ5qi8fVOL/ksRhvQdnSqxH4vr1ZtQmym/5BUVyDG+zEhGpOMt6OdVSKKUVGJR8yAc8
 FV3m9iFHGXqn1yMaVRBIs49Ha48C3SWYLrlB8kMNh+Ilx8g38foKl1cRN20qa2QhyfMV
 jx7w==
X-Gm-Message-State: AOAM5309glc3zWehv6Nq31zF1A/fM04gbUazp5J70LRxX4p3Rb2svITP
 3+tqbLstW3+7Gf7QfGGZm8Y=
X-Google-Smtp-Source: ABdhPJxhsyqnkWH+CcEUij/QFTHxVO3QgaiFu0KYrj1SmjF28Ou81cgVD2ZfeCyiw2+7ofSf13lz+w==
X-Received: by 2002:a17:902:fe0b:: with SMTP id
 g11mr8928417plj.269.1593119472022; 
 Thu, 25 Jun 2020 14:11:12 -0700 (PDT)
Received: from localhost (g2.222-224-226.ppp.wakwak.ne.jp. [222.224.226.2])
 by smtp.gmail.com with ESMTPSA id t19sm1374874pgg.19.2020.06.25.14.11.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 14:11:11 -0700 (PDT)
Date: Fri, 26 Jun 2020 06:11:08 +0900
From: Stafford Horne <shorne@gmail.com>
To: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Message-ID: <20200625211108.GG1401039@lianli.shorne-pla.net>
References: <20200622121124.80398-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200622121124.80398-1-luc.vanoostenryck@gmail.com>
Subject: Re: [OpenRISC] [PATCH] openrisc: fix __user in raw_copy_to_user()'s
 prototype
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
Cc: Jonas Bonn <jonas@southpole.se>, kernel test robot <lkp@intel.com>,
 openrisc@lists.librecores.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBKdW4gMjIsIDIwMjAgYXQgMDI6MTE6MjRQTSArMDIwMCwgTHVjIFZhbiBPb3N0ZW5y
eWNrIHdyb3RlOgo+IHJhd19jb3B5X3RvX3VzZXIoKSdzIHByb3RvdHlwZSBzZWVtcyB0byBiZSBh
IGNvcHkgJiBwYXN0ZSBvZgo+IHJhd19jb3B5X2Zyb21fdXNlcigpIGFuZCBhcyBzdWNoIGhhcyB0
aGUgX191c2VyIGFubm90YXRpb24KPiBpbiB0aGUgJ2Zyb20nIGFyZ3VtZW50IGluc3RlYWQgb2Yg
dGhlICd0bycuCj4gCj4gU28sIG1vdmUgdGhlIF9fdXNlciBhbm5vdGF0aW9uIGluIHRoZSBwcm90
b3R5cGUgdG8gdGhlICd0bycuCgpUaGFuayB5b3UsCgpJIGhhdmUgcXVldWVkIHRoaXMgZm9yIDUu
OS4gIElmIHlvdSB0aGluayBpdHMgbW9yZSB1cmdlbnQgbGV0IG1lIGtub3cuCgotU3RhZmZvcmQK
Cj4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+IFNpZ25l
ZC1vZmYtYnk6IEx1YyBWYW4gT29zdGVucnljayA8bHVjLnZhbm9vc3RlbnJ5Y2tAZ21haWwuY29t
Pgo+IC0tLQo+ICBhcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCB8IDIgKy0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vdWFjY2Vzcy5oIGIvYXJjaC9vcGVucmlz
Yy9pbmNsdWRlL2FzbS91YWNjZXNzLmgKPiBpbmRleCAxN2MyNGYxNDYxNWYuLjQ2ZTMxYmI0YTlh
ZCAxMDA2NDQKPiAtLS0gYS9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaAo+ICsr
KyBiL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vdWFjY2Vzcy5oCj4gQEAgLTI0MSw3ICsyNDEs
NyBAQCByYXdfY29weV9mcm9tX3VzZXIodm9pZCAqdG8sIGNvbnN0IHZvaWQgX191c2VyICpmcm9t
LCB1bnNpZ25lZCBsb25nIHNpemUpCj4gIAlyZXR1cm4gX19jb3B5X3RvZnJvbV91c2VyKHRvLCAo
X19mb3JjZSBjb25zdCB2b2lkICopZnJvbSwgc2l6ZSk7Cj4gIH0KPiAgc3RhdGljIGlubGluZSB1
bnNpZ25lZCBsb25nCj4gLXJhd19jb3B5X3RvX3VzZXIodm9pZCAqdG8sIGNvbnN0IHZvaWQgX191
c2VyICpmcm9tLCB1bnNpZ25lZCBsb25nIHNpemUpCj4gK3Jhd19jb3B5X3RvX3VzZXIodm9pZCBf
X3VzZXIgKnRvLCBjb25zdCB2b2lkICpmcm9tLCB1bnNpZ25lZCBsb25nIHNpemUpCj4gIHsKPiAg
CXJldHVybiBfX2NvcHlfdG9mcm9tX3VzZXIoKF9fZm9yY2Ugdm9pZCAqKXRvLCBmcm9tLCBzaXpl
KTsKPiAgfQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpP
cGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6
Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
