Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id AEFE1267C90
	for <lists+openrisc@lfdr.de>; Sat, 12 Sep 2020 23:22:12 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 38E372026E;
	Sat, 12 Sep 2020 23:22:11 +0200 (CEST)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by mail.librecores.org (Postfix) with ESMTPS id 7973620D76
 for <openrisc@lists.librecores.org>; Sun,  6 Sep 2020 02:22:30 +0200 (CEST)
Received: by mail-ed1-f67.google.com with SMTP id w1so9352912edr.3
 for <openrisc@lists.librecores.org>; Sat, 05 Sep 2020 17:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=91sWkciFrUJmi/H5FwTYMFE8E2HIci8DUELtGp4EpwE=;
 b=LWqGmXvARkX5RTHNV9r1uC5oQZZPjvIthrPBs6oVQrXX6CsUmVUaXgTP6I7JHdbjoi
 f0uxzUaGfWQHAZ+PhrHlMZ+g+0mojIKw6/ePr+y6nhvrYdMAWtqi+UFuJXYJFJwofZKc
 u4gYZGN8w+0kUhM7YouMpCHk5Ucvd8osrj0Uk1LQoXM9jjmh4XpDmqatcciolDfhAv1d
 ckCVOKdKXaoMf7wBMlUcNt+gQDw+8u3BL1DltAgQUeNrdvUtUjsKgrpek41/VWg0VSAt
 2AapsO/sBAvpGqmGMqiJ757ug5ZszD4wVlFF5ho0mYPN13FIyG/86TaMaLJMi0uim4Ta
 jHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=91sWkciFrUJmi/H5FwTYMFE8E2HIci8DUELtGp4EpwE=;
 b=IHVxQUdxvoFjAHQcaSE06KyuEX6hUK2B7FxR52oYwP9/LmLI0gqxLf2snbsulU23xv
 vqiPUq48/SHbMLatUbjpbeELHEzCILU6FJKRx8+aNB5DKyQtN6UHSpcQHeC0EquvKwzK
 l7mvL8yoEUgHD4UKDRFNBBVKx0dc36x9gA6GZgC/7+etjHH1RpOwof0pQcqCKVeWEVgD
 KsNtMjNM13JBVvFQ64m51AK8hPgIQVW63l3MPnSOIbdAZe+JHUof/kzY6N7EqSlG3IbA
 liTrKQxEXEg8yHmw6wQxwDZlahuXQiHSfMUfrBfdptSKG6iwSfFUVwIR2VSaZeIJD7Gn
 OSVg==
X-Gm-Message-State: AOAM531gisIblgLLmkCrCF9GyNv3iM3UI744tqVIkRDZAw+hRRPnvuhl
 1PAk6RbW/Gaw7Ho5ntyXn1w=
X-Google-Smtp-Source: ABdhPJxAZftUXMfxY45wOylfk2f0F6De8orRMIywDwDHappe7z4+o+TSm4SShNlRzV92faTfIPBzAQ==
X-Received: by 2002:a50:c182:: with SMTP id m2mr15088033edf.70.1599351750123; 
 Sat, 05 Sep 2020 17:22:30 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:a7fb:e200:ac6e:dd2f:2483:32c4])
 by smtp.gmail.com with ESMTPSA id qu9sm10387823ejb.24.2020.09.05.17.22.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2020 17:22:29 -0700 (PDT)
Date: Sun, 6 Sep 2020 02:22:28 +0200
From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To: Stafford Horne <shorne@gmail.com>
Message-ID: <20200906002228.mrbs7pdyrf5ooi3c@ltop.local>
References: <20200905131935.972386-1-shorne@gmail.com>
 <20200905131935.972386-4-shorne@gmail.com>
 <20200905135714.74bsr5h423k7guw4@ltop.local>
 <20200905213408.GI3562056@lianli.shorne-pla.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200905213408.GI3562056@lianli.shorne-pla.net>
X-Mailman-Approved-At: Sat, 12 Sep 2020 23:22:07 +0200
Subject: Re: [OpenRISC] [PATCH v2 3/3] openrisc: Fix issue with get_user for
 64-bit values
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
Cc: Jonas Bonn <jonas@southpole.se>, Andrew Morton <akpm@linux-foundation.org>,
 openrisc@lists.librecores.org, LKML <linux-kernel@vger.kernel.org>,
 Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU3VuLCBTZXAgMDYsIDIwMjAgYXQgMDY6MzQ6MDhBTSArMDkwMCwgU3RhZmZvcmQgSG9ybmUg
d3JvdGU6Cj4gT24gU2F0LCBTZXAgMDUsIDIwMjAgYXQgMDM6NTc6MTRQTSArMDIwMCwgTHVjIFZh
biBPb3N0ZW5yeWNrIHdyb3RlOgo+ID4gT24gU2F0LCBTZXAgMDUsIDIwMjAgYXQgMTA6MTk6MzVQ
TSArMDkwMCwgU3RhZmZvcmQgSG9ybmUgd3JvdGU6Cj4gPiAKPiA+IEhpLAo+ID4gCj4gPiBUaGUg
Y2hhbmdlIGZvciA2NC1iaXQgZ2V0X3VzZXIoKSBsb29rcyBnb29kIHRvIG1lLgo+ID4gQnV0IEkg
d29uZGVyLCBnaXZlbiB0aGF0IG9wZW5yaXNjIGlzIGJpZy1lbmRpYW4sIHdoYXQgd2lsbCBoYXBw
ZW4KPiA+IHlvdSBoYXZlIHRoZSBvcHBvc2l0ZSBzaXR1YXRpb246Cj4gPiAJdTMyICpwdHI7Cj4g
PiAJdTY0IHZhbDsKPiA+IAkuLi4KPiA+IAlnZXRfdXNlcih2YWwsIHB0cik7Cj4gPiAKPiA+IFdv
bid0IHlvdSBlbmQgd2l0aCB0aGUgdmFsdWUgaW4gdGhlIG1vc3Qgc2lnbmlmaWNhbnQgcGFydCBv
Zgo+ID4gdGhlIHJlZ2lzdGVyIHBhaXI/Cj4gCj4gSGkgTHVjLAo+IAo+IFRoZSBnZXRfdXNlciBm
dW5jdGlvbiB1c2VzIHRoZSBzaXplIG9mIHRoZSBwdHIgdG8gZGV0ZXJtaW5lIGhvdyB0byBkbyB0
aGUgbG9hZCAsCj4gc28gdGhpcyBjYXNlIHdvdWxkIG5vdCB1c2UgdGhlIDY0LWJpdCBwYWlyIHJl
Z2lzdGVyIGxvZ2ljLiAgSSB0aGluayBpdCBzaG91bGQgYmUKPiBvaywgdGhlIGVuZCByZXN1bHQg
d291bGQgYmUgdGhlIHNhbWUgYXMgYyBjb2RlOgo+IAo+ICAgdmFyID0gKnB0cjsKCkhpLAoKU29y
cnkgdG8gaW5zaXN0IGJ1dCBib3RoIHdvbid0IGdpdmUgdGhlIHNhbWUgcmVzdWx0LgpUaGUgcHJv
YmxlbSBjb21lcyBmcm9tIHRoZSBvdXRwdXQgcGFydCBvZiB0aGUgYXNtOiAiPXIiICh4KS4KClRo
ZSBmb2xsb3dpbmcgY29kZToKCXUzMiBnZXRwKHUzMiAqcHRyKQoJewoJCXU2NCB2YWw7CgkJdmFs
ID0gKnB0cjsKCQlyZXR1cm4gdmFsOwoJfQp3aWxsIGNvbXBpbGUgdG8gc29tZXRoaW5nIGxpa2U6
CglnZXRwOgoJCWwuanIJcjkKCQlsLmx3eglyMTEsIDAocjMpCgpUaGUgbG9hZCBpcyB3cml0dGVu
IHRvIHIxMSwgd2hpY2ggaXMgd2hhdCBpcyByZXR1cm5lZC4gT0suCgpCdXQgdGhlIGdldF91c2Vy
KCkgY29kZSB3aXRoIGEgdTMyIHBvaW50ZXIgKmFuZCogYSB1NjQgZGVzdGluYXRpb24KaXMgZXF1
aXZhbGVudCB0byBzb21ldGhpbmcgbGlrZToKCXUzMiBnZXRsKHUzMiAqcHRyKQoJewoJCXU2NCB2
YWw7CgoJCWFzbSgibC5sd3ogJTAsMCglMSkiIDogIj1yIih2YWwpIDogInIiKHB0cikpOwoJCXJl
dHVybiB2YWw7Cgl9CmFuZCB0aGlzIGNvbXBpbGVzIHRvOgoJZ2V0bDoKCQlsLmx3eglyMTcsMChy
MykKCQlsLmpyCXI5CgkJbC5vcglyMTEsIHIxOSwgcjE5CgpUaGUgbG9hZCBpcyB3cml0dGVuIHRv
IHIxNyBidXQgd2hhdCBpcyByZXR1cm5lZCBpcyB0aGUgY29udGVudCBvZiByMTkuCk5vdCBnb29k
LgoKSSB0aGluayB0aGF0LCBpbiB0aGUgZ2V0X3VzZXIoKSBjb2RlOgoqIGlmIHRoZSBwb2ludGVy
IGlzIGEgcG9pbnRlciB0byBhIDY0LWJpdCBxdWFudGl0eSwgdGhlbiB2YXJpYWJsZQogIHVzZWQg
aW4gYXMgdGhlIG91dHB1dCBpbiB0aGUgYXNtIG5lZWRzIHRvIGJlIGEgNjQtYml0IHZhcmlhYmxl
CiogaWYgdGhlIHBvaW50ZXIgaXMgYSBwb2ludGVyIHRvIGEgMzItYml0IHF1YW50aXR5LCB0aGVu
IHZhcmlhYmxlCiAgdXNlZCBpbiBhcyB0aGUgb3V0cHV0IGluIHRoZSBhc20gbmVlZHMgdG8gYmUg
YSA2NC1iaXQgdmFyaWFibGUKQXQgbGVhc3Qgb25lIHdheSB0byBndWFyYW50ZWUgdGhpcyBpcyB0
byB1c2UgYSB0ZW1wb3JhcnkgdmFyaWFibGUKdGhhdCBtYXRjaGVzIHRoZSBzaXplIG9mIHRoZSBw
b2ludGVyLgoKLS0gTHVjCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9y
ZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
