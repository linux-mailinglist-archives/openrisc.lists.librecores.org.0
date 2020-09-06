Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 60CA225F08B
	for <lists+openrisc@lfdr.de>; Sun,  6 Sep 2020 23:00:49 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id BA7C620D72;
	Sun,  6 Sep 2020 23:00:48 +0200 (CEST)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by mail.librecores.org (Postfix) with ESMTPS id 9C686200FF
 for <openrisc@lists.librecores.org>; Sun,  6 Sep 2020 23:00:46 +0200 (CEST)
Received: by mail-pl1-f194.google.com with SMTP id c3so3271598plz.5
 for <openrisc@lists.librecores.org>; Sun, 06 Sep 2020 14:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=T1oB7ySbJzhXfoNWBmNgQXBWcU1mfNfTlC7+qBvtFhg=;
 b=efpaYjdt9SVm2ywPYXlj4yrrEvq8AVqERON4d0w7DHu2Skfekh0oQMMAYAFfCMb8P1
 h2n0esJ4V/5c0rGuu4S1EoQZOtob1qxllezT2Dri2t4Mk2PZGpmzxn5tBuTGMql9iIuh
 axheouI4/HX4AxNdVpHqfDYP/5uaicuN7ApqaZoiaUjle/4kzSFQAUPLJKDEdpa0FgPq
 eTtqyVJA6nrODrackky1vhZxUaA9Ox7LDC6Am2D4Ok4dKcoSzoa7Ns5WaKfnFxEXYmnv
 79exXkd2NlQqq1dncuYZhePJifPjCqvaY+wnZQFNztNxY5lzWSbZBCNN7UmxVTyy50vI
 BQkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=T1oB7ySbJzhXfoNWBmNgQXBWcU1mfNfTlC7+qBvtFhg=;
 b=BX5fvJsJhBv+VjbJeshxNHq9RysN8vErUU97v/nOvUeCPLlopoCHt2ESVhk51E/s2V
 ++BVTJ8xU6hLrupCPujZQ19vKaM6QMWff8bR6GxrPnWphk5iZXs0X4dyuXW80p1FLc1E
 KTXSIEOZwuQIBj0tfePFCrGTvVG0r+2mm2cnhbtjHTbGEFi62JYeEqIfYptJ8F5GFDrz
 W2X9bpgJBiEAxeyJkX5uKT+7dcfZva4yCW0OUz1XIDGhDdZ/mwN20u4nD+0NEZyHf8Nf
 euDMuP3qJjli3o9Je2veGyvVeiMB6Pza940lnPFI9WUpVJY0L63M1CdLyRePJ4RQWXvL
 XUBg==
X-Gm-Message-State: AOAM5326GlKRMCT20xO7ptA2SYn8moxSq3U+YOQPLomITcfRNzYvb2GO
 EmyAqoWCnp26yuZGYE3DC8Y=
X-Google-Smtp-Source: ABdhPJx4kM3dYEiZLcwfjTeboiVQbRKFdi/+sJFneYsrc0TbFIZdPbE2kj7RVvRET0yZkXvCavYHVQ==
X-Received: by 2002:a17:90a:7487:: with SMTP id
 p7mr6789220pjk.189.1599426044575; 
 Sun, 06 Sep 2020 14:00:44 -0700 (PDT)
Received: from localhost (g223.115-65-55.ppp.wakwak.ne.jp. [115.65.55.223])
 by smtp.gmail.com with ESMTPSA id m25sm12735683pfa.32.2020.09.06.14.00.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Sep 2020 14:00:43 -0700 (PDT)
Date: Mon, 7 Sep 2020 06:00:41 +0900
From: Stafford Horne <shorne@gmail.com>
To: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Message-ID: <20200906210041.GK3562056@lianli.shorne-pla.net>
References: <20200905131935.972386-1-shorne@gmail.com>
 <20200905131935.972386-4-shorne@gmail.com>
 <20200905135714.74bsr5h423k7guw4@ltop.local>
 <20200905213408.GI3562056@lianli.shorne-pla.net>
 <20200906002228.mrbs7pdyrf5ooi3c@ltop.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200906002228.mrbs7pdyrf5ooi3c@ltop.local>
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

T24gU3VuLCBTZXAgMDYsIDIwMjAgYXQgMDI6MjI6MjhBTSArMDIwMCwgTHVjIFZhbiBPb3N0ZW5y
eWNrIHdyb3RlOgo+IE9uIFN1biwgU2VwIDA2LCAyMDIwIGF0IDA2OjM0OjA4QU0gKzA5MDAsIFN0
YWZmb3JkIEhvcm5lIHdyb3RlOgo+ID4gT24gU2F0LCBTZXAgMDUsIDIwMjAgYXQgMDM6NTc6MTRQ
TSArMDIwMCwgTHVjIFZhbiBPb3N0ZW5yeWNrIHdyb3RlOgo+ID4gPiBPbiBTYXQsIFNlcCAwNSwg
MjAyMCBhdCAxMDoxOTozNVBNICswOTAwLCBTdGFmZm9yZCBIb3JuZSB3cm90ZToKPiA+ID4gCj4g
PiA+IEhpLAo+ID4gPiAKPiA+ID4gVGhlIGNoYW5nZSBmb3IgNjQtYml0IGdldF91c2VyKCkgbG9v
a3MgZ29vZCB0byBtZS4KPiA+ID4gQnV0IEkgd29uZGVyLCBnaXZlbiB0aGF0IG9wZW5yaXNjIGlz
IGJpZy1lbmRpYW4sIHdoYXQgd2lsbCBoYXBwZW4KPiA+ID4geW91IGhhdmUgdGhlIG9wcG9zaXRl
IHNpdHVhdGlvbjoKPiA+ID4gCXUzMiAqcHRyOwo+ID4gPiAJdTY0IHZhbDsKPiA+ID4gCS4uLgo+
ID4gPiAJZ2V0X3VzZXIodmFsLCBwdHIpOwo+ID4gPiAKPiA+ID4gV29uJ3QgeW91IGVuZCB3aXRo
IHRoZSB2YWx1ZSBpbiB0aGUgbW9zdCBzaWduaWZpY2FudCBwYXJ0IG9mCj4gPiA+IHRoZSByZWdp
c3RlciBwYWlyPwo+ID4gCj4gPiBIaSBMdWMsCj4gPiAKPiA+IFRoZSBnZXRfdXNlciBmdW5jdGlv
biB1c2VzIHRoZSBzaXplIG9mIHRoZSBwdHIgdG8gZGV0ZXJtaW5lIGhvdyB0byBkbyB0aGUgbG9h
ZCAsCj4gPiBzbyB0aGlzIGNhc2Ugd291bGQgbm90IHVzZSB0aGUgNjQtYml0IHBhaXIgcmVnaXN0
ZXIgbG9naWMuICBJIHRoaW5rIGl0IHNob3VsZCBiZQo+ID4gb2ssIHRoZSBlbmQgcmVzdWx0IHdv
dWxkIGJlIHRoZSBzYW1lIGFzIGMgY29kZToKPiA+IAo+ID4gICB2YXIgPSAqcHRyOwo+IAo+IEhp
LAo+IAo+IFNvcnJ5IHRvIGluc2lzdCBidXQgYm90aCB3b24ndCBnaXZlIHRoZSBzYW1lIHJlc3Vs
dC4KPiBUaGUgcHJvYmxlbSBjb21lcyBmcm9tIHRoZSBvdXRwdXQgcGFydCBvZiB0aGUgYXNtOiAi
PXIiICh4KS4KPiAKPiBUaGUgZm9sbG93aW5nIGNvZGU6Cj4gCXUzMiBnZXRwKHUzMiAqcHRyKQo+
IAl7Cj4gCQl1NjQgdmFsOwo+IAkJdmFsID0gKnB0cjsKPiAJCXJldHVybiB2YWw7Cj4gCX0KPiB3
aWxsIGNvbXBpbGUgdG8gc29tZXRoaW5nIGxpa2U6Cj4gCWdldHA6Cj4gCQlsLmpyCXI5Cj4gCQls
Lmx3eglyMTEsIDAocjMpCj4gCj4gVGhlIGxvYWQgaXMgd3JpdHRlbiB0byByMTEsIHdoaWNoIGlz
IHdoYXQgaXMgcmV0dXJuZWQuIE9LLgo+IAo+IEJ1dCB0aGUgZ2V0X3VzZXIoKSBjb2RlIHdpdGgg
YSB1MzIgcG9pbnRlciAqYW5kKiBhIHU2NCBkZXN0aW5hdGlvbgo+IGlzIGVxdWl2YWxlbnQgdG8g
c29tZXRoaW5nIGxpa2U6Cj4gCXUzMiBnZXRsKHUzMiAqcHRyKQo+IAl7Cj4gCQl1NjQgdmFsOwo+
IAo+IAkJYXNtKCJsLmx3eiAlMCwwKCUxKSIgOiAiPXIiKHZhbCkgOiAiciIocHRyKSk7Cj4gCQly
ZXR1cm4gdmFsOwo+IAl9Cj4gYW5kIHRoaXMgY29tcGlsZXMgdG86Cj4gCWdldGw6Cj4gCQlsLmx3
eglyMTcsMChyMykKPiAJCWwuanIJcjkKPiAJCWwub3IJcjExLCByMTksIHIxOQo+IAo+IFRoZSBs
b2FkIGlzIHdyaXR0ZW4gdG8gcjE3IGJ1dCB3aGF0IGlzIHJldHVybmVkIGlzIHRoZSBjb250ZW50
IG9mIHIxOS4KPiBOb3QgZ29vZC4KPiAKPiBJIHRoaW5rIHRoYXQsIGluIHRoZSBnZXRfdXNlcigp
IGNvZGU6Cj4gKiBpZiB0aGUgcG9pbnRlciBpcyBhIHBvaW50ZXIgdG8gYSA2NC1iaXQgcXVhbnRp
dHksIHRoZW4gdmFyaWFibGUKPiAgIHVzZWQgaW4gYXMgdGhlIG91dHB1dCBpbiB0aGUgYXNtIG5l
ZWRzIHRvIGJlIGEgNjQtYml0IHZhcmlhYmxlCj4gKiBpZiB0aGUgcG9pbnRlciBpcyBhIHBvaW50
ZXIgdG8gYSAzMi1iaXQgcXVhbnRpdHksIHRoZW4gdmFyaWFibGUKPiAgIHVzZWQgaW4gYXMgdGhl
IG91dHB1dCBpbiB0aGUgYXNtIG5lZWRzIHRvIGJlIGEgNjQtYml0IHZhcmlhYmxlCj4gQXQgbGVh
c3Qgb25lIHdheSB0byBndWFyYW50ZWUgdGhpcyBpcyB0byB1c2UgYSB0ZW1wb3JhcnkgdmFyaWFi
bGUKPiB0aGF0IG1hdGNoZXMgdGhlIHNpemUgb2YgdGhlIHBvaW50ZXIuCgpIZWxsbywKClRoYW5r
cyBmb3IgdGFraW5nIHRoZSB0aW1lIHRvIGV4cGxhaW4uICBJIHNlZSB5b3VyIHBvaW50LCBpdCBt
YWtlcyBzZW5zZSBJIHdpbGwKZml4IHRoaXMgdXAuCgotU3RhZmZvcmQKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9w
ZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcv
bGlzdGluZm8vb3BlbnJpc2MK
