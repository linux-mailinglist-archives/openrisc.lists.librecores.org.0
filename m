Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id F0D713E8A3C
	for <lists+openrisc@lfdr.de>; Wed, 11 Aug 2021 08:33:03 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C899F210E3;
	Wed, 11 Aug 2021 08:33:03 +0200 (CEST)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mail.librecores.org (Postfix) with ESMTPS id 3621820417
 for <openrisc@lists.librecores.org>; Wed, 11 Aug 2021 08:33:02 +0200 (CEST)
Received: by mail-ed1-f46.google.com with SMTP id y7so2083298eda.5
 for <openrisc@lists.librecores.org>; Tue, 10 Aug 2021 23:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6upX3c4rkiJQ38ofbQvxB3Hg5hz1wv0UVaotk1/B8OI=;
 b=ACaPJOyltGbiIIthH+KVBmNhmV5Ev51cazmvrwUTyI3+bdZYBzGVVZ0vk725zkQokY
 EmLkfK2w2fX5dPsqKYITycFrzeeASV8O2FPo6Sdxh8eRN9f9RopiLWmuDGZzh3BT/knH
 UiqyG16dvNpD7fBJFiwCCgKTEUDVXn8L2KdtLDQDfxS7IlVv76BaYidV07E53Yp5RJKb
 mFn2hdxsvEITeeLKz0+UuPtfxCUXMRhOa0RuZlj9x2iCD+jTsx8ydJ+L0GYEUW3YntCC
 OLvPT2kKkqVqEkks0tBptLzHtx+NizqHtX62ErLGuf/7XspgzYCMIP2/sZp1eziiH9yu
 haBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6upX3c4rkiJQ38ofbQvxB3Hg5hz1wv0UVaotk1/B8OI=;
 b=sT9QWyof7+9HhE+XStjq3Hb8st0qp+3Q9ut9rj//cTts1dxWIymt2zV9nYP5BALcXr
 iZOPneKPFn7sxp90sn3qfucahcYbbes+7EOeAmf0maZEiGZsNfbPZd6NM7mnwRNY1xQB
 bPxLbJl3IeDqdMRKiRydewz6E5gI4P+Fyg1YIRS0Pk9MlSHwTLPtdgtK5l92vcj5u7MN
 /Wg/qKejR2oFZZb5XuJ3XMDRNIAfuhjiKrXSsyi58LAYCM6O45t6TM2bT2nbWPaqcjXa
 Ox76bT8y7zjHvOXlGgJuOOIxBp5QJEcKZt94Mvm4fSWot6MAkcFIXnb/uq3m+6Poens1
 TLOA==
X-Gm-Message-State: AOAM5314izKvfb4kZGTuc2ZnQAHRTepWc4b7lQ+vrkLnF0TtVMmVKWwQ
 c/7CvmBqxuJMkbA8eOEDvY9ux+AFj2/QaT89u2I=
X-Google-Smtp-Source: ABdhPJwxT8ewyCe4oBaTa7vxJc6vaJ6fbFIcrqch5ZDsYQYVvDWl49zS5VeFqDBph+wZvMF3MBQCK5LyTSwE3Kr+yAo=
X-Received: by 2002:a05:6402:49a:: with SMTP id
 k26mr9488083edv.279.1628663581934; 
 Tue, 10 Aug 2021 23:33:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAFdMc-3=EpEfW+in+-SWuiaKqyQ_3r6Qb08SvWD9GiEsRFCYpg@mail.gmail.com>
In-Reply-To: <CAFdMc-3=EpEfW+in+-SWuiaKqyQ_3r6Qb08SvWD9GiEsRFCYpg@mail.gmail.com>
From: Stafford Horne <shorne@gmail.com>
Date: Wed, 11 Aug 2021 15:32:50 +0900
Message-ID: <CAAfxs76dbC5aGWUK6F4y0TDQ8MRWfbPgMA=M02D2t9m3om_R9w@mail.gmail.com>
To: Daniel Gutson <danielgutson@gmail.com>
Subject: Re: [OpenRISC] Damjan Lampret
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

SSB3aWxsIHJlcGx5IHRvIHlvdSBvZmZsaW5lIHdpdGggdGhlIG1haWwuCgpPbiBXZWQsIEF1ZyAx
MSwgMjAyMSBhdCAzOjMxIFBNIERhbmllbCBHdXRzb24gPGRhbmllbGd1dHNvbkBnbWFpbC5jb20+
IHdyb3RlOgo+Cj4gSGksCj4KPiAgICAgU29ycnkgdG8gcG9zdCB0aGlzIGhlcmUsIEknbSBsb29r
aW5nIGZvciBEYW1qYW4gTGFtcHJldCB0byBpbnZpdGUgaGltIHRvIGFuIGFjYWRlbWljIHRhbGss
IGJ1dCBJIGNhbid0IGZpbmQKPiBhbnkgZW1haWwgb3IgcHJvZmlsZS4gSWYgc29tZWJvZHkgaGVy
ZSBrbm93cyBoaW0sIGNvdWxkIHlvdSBwbGVhc2UgaGVscCBtZSB0byBjb250YWN0IGhpbT8KPgo+
IFRoYW5rcywKPgo+ICAgICBEYW5pZWwuCj4KPiAtLQo+IFdob+KAmXMgZ290IHRoZSBzd2VldGVz
dCBkaXNwb3NpdGlvbj8KPiBPbmUgZ3Vlc3MsIHRoYXTigJlzIHdobz8KPiBXaG/igJlkIG5ldmVy
LCBldmVyIHN0YXJ0IGFuIGFyZ3VtZW50Pwo+IFdobyBuZXZlciBzaG93cyBhIGJpdCBvZiB0ZW1w
ZXJhbWVudD8KPiBXaG8ncyBuZXZlciB3cm9uZyBidXQgYWx3YXlzIHJpZ2h0Pwo+IFdobydkIG5l
dmVyIGRyZWFtIG9mIHN0YXJ0aW5nIGEgZmlnaHQ/Cj4gV2hvIGdldCBzdHVjayB3aXRoIGFsbCB0
aGUgYmFkIGx1Y2s/Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBPcGVuUklTQyBtYWlsaW5nIGxpc3QKPiBPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVz
Lm9yZwo+IGh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFp
bGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGli
cmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
