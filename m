Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D0C0139172E
	for <lists+openrisc@lfdr.de>; Wed, 26 May 2021 14:15:56 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 4BA3B2360C;
	Wed, 26 May 2021 14:15:56 +0200 (CEST)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mail.librecores.org (Postfix) with ESMTPS id F0EFC2132D
 for <openrisc@lists.librecores.org>; Wed, 26 May 2021 14:15:54 +0200 (CEST)
Received: by mail-pg1-f182.google.com with SMTP id f22so772252pgb.9
 for <openrisc@lists.librecores.org>; Wed, 26 May 2021 05:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=yA3Dw2VFDI8UaiLijXn3IqDwxTqxLHFQfICI4kyYlI8=;
 b=uyPR0M6wZ+SuVVcMAAOwy3V/pyuYVp9dMT7sMS4ObH9ZwB8IIjuCO8nIJkA+sKtd0U
 hg/CtcMIP8394Bp4dPEGc8oN/BaCP75FVmGEv8GcoGAfnlgghvwUvwDsxk4vGCfyCniK
 aLfONJicjqCV9PV6Hw1Omd+VLkiPUH50RZ7kOul8rSNjEb0Pf81KmpCsI2kmfOoag3QH
 /8SxljdDn/Uugli8pcsDTQl+qXMbl83UQftOZrw/sZcT94dszflsPGY9UQ98Fuap7Adw
 VxrMAop4vyFNVDqqjfO29O/YTirc/xlosjG7Y4Q8GUQDzvMcAUTODAzf7HHZGb2lDQ+S
 M/jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yA3Dw2VFDI8UaiLijXn3IqDwxTqxLHFQfICI4kyYlI8=;
 b=bBE9XbetfQV4NheH8fFcb7Gzo7uhYXHwafPXG1bpwaTPJKTLtb+LmNi3h1hDUTwyVZ
 ZVjhPfczrylGQN4DZuwK8TTgdOnKNXwGw5ewraYjUfq2AOtHO3GOtk5qChzSieYMNvfb
 tuDKmGw0u5u8cz0KjiTFnyqVHYX+tJ2/jJvg2/WkWJ0HkLs43qHz6lV032pP3vdAqyMK
 qDLEWYE5ijh6lGlxqqXfjOWjaNXcBvNANsznXR/DKs+/kXJWf5sBwu/wdVwFrpKcxlTS
 FH2nSPowRy8IxKEw7Zm6eYTluSuOreCGpNRc5LO9Rfo9LjhMyuTebxdDee2o9OrJ00DP
 K0qA==
X-Gm-Message-State: AOAM533tA2V/gd/uTKVSq+nwyXMkhN5vN16kJiEwQTh6vbyNXgmm0eW3
 tocua1g9775WH/bZrJyfipE=
X-Google-Smtp-Source: ABdhPJyiUItMvq40QZWOXDdcKjJYBoKW7I9UuQAyvZitJfmMUzoI8KNbS4QXaRlbuvNCrciVFDqoBw==
X-Received: by 2002:a63:d80f:: with SMTP id b15mr24607082pgh.388.1622031353390; 
 Wed, 26 May 2021 05:15:53 -0700 (PDT)
Received: from localhost (g176.222-224-212.ppp.wakwak.ne.jp. [222.224.212.176])
 by smtp.gmail.com with ESMTPSA id q12sm13632912pfg.48.2021.05.26.05.15.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 05:15:52 -0700 (PDT)
Date: Wed, 26 May 2021 21:15:50 +0900
From: Stafford Horne <shorne@gmail.com>
To: Harshitha S <harshithasridhar172000@gmail.com>
Message-ID: <YK479iP+xMY8Nucx@antec>
References: <CADGJwMzHeO13bW0i7JFGGtJRcUpGcPW+WxNzqKXRDWLLPFv-eA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADGJwMzHeO13bW0i7JFGGtJRcUpGcPW+WxNzqKXRDWLLPFv-eA@mail.gmail.com>
Subject: Re: [OpenRISC] Error found in mor1kx cache lru
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
Cc: Openrisc <openrisc@lists.librecores.org>, stefan@fossi-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

K0NDIGxpc3QKCkhpIEhhcnNoaXRhLAoKVGhhbmtzIGZvciByZXBvcnRpbmcsIGNvdWxkIHlvdSBh
bHNvIG9wZW4gYSBnaXRodWIgaXNzdWUgd2l0aCB0aGUKc2FtZSBkZXRhaWxzIGF0OgoKIGh0dHBz
Oi8vZ2l0aHViLmNvbS9vcGVucmlzYy9tb3Ixa3gvaXNzdWVzCgotU3RhZmZvcmQKCk9uIFdlZCwg
TWF5IDI2LCAyMDIxIGF0IDAyOjUyOjExUE0gKzA1MzAsIEhhcnNoaXRoYSBTIHdyb3RlOgoKPiAK
PiAgICAgIE5VTVdBWVMgPSA0Cj4gICAgICBjdXJyZW50ID0gNidiMTEwMTAwOwo+ICAgICAgYWNj
ZXNzICA9IDQnYjAwMTA7Cj4gICAgCj4gICAgIFRoaXMgY3VycmVudCBoaXN0b3J5IGlzOgo+ICAg
IAo+ICAgICAgIDA8MSAwPDIgMDwzIDE8MiAxPDMgMjwzCj4gICAgICAgMCAgIDAgICAxICAgMCAg
IDEgICAxCj4gICAgIAo+ICAgICAgSGlzdG9yeSBvZiBhY2Nlc3MgPT4gMz4wPjE+Mgo+ICAgICAg
QWNjZXNzIHJlcXVlc3QgaXMgZm9yIDEsIHRoZW4gZXhwZWN0ZWQgb3JkZXIgaXMgMT4zPjA+Mi4K
PiAgICAgIEV4cGVjdGVkIHZhbHVlcyBvZiBscnVfcG9zdCA9IDEgYW5kIGxydV9wcmUgPSAyCj4g
IAo+IEluaXRpYWwgZXhwYW5kIG1hdHJpeCBiYXNlZCBvbiBjdXJyZW50IGhpc3RvcnkKPiAKPiAg
ICAgICAgIDAgICAgIDEgICAgICAyICAgICAgMyAgICAgICAgIDAgMSAyIDMKPiAgICAwICAgIDEg
ICAgKDA8MSkgICgwPDIpICAoMDwzKSAgICAwIDEgMCAwIDEKPiAgICAxICAoMTwwKSAgICAxICAg
ICgxPDIpICAoMTwzKSA9PiAxIDEgMSAwIDEKPiAgICAyICAoMjwwKSAgKDI8MSkgICAgMSAgICAo
MjwzKSAgICAyIDEgMSAxIDEKPiAgICAzICAoMzwwKSAgKDM8MSkgICgzPDIpICAgIDEgICAgICAz
IDAgMCAwIDEKPiAKPiBscnVfcHJlIGlzIEFORCBvZiBiaXRzIGluIGEgcm93Cj4gCj4gV2hlbiBy
ZXF1ZXN0IGFjY2Vzcz00J2IwMDEwIHRoZW4gMXN0IHJvdyBvZiBleHBhbmQgbWF0cml4IGlzIAo+
IHJlcGxhY2VkIHdpdGggemVyb3MgYW5kIDFzdCBjb2x1bW4gb2YgZXhwYW5kIG1hdHJpeCBpcyBy
ZXBsYWNlZCAKPiB3aXRoIDEuCj4gCj4gICAgICAKPiAgICAgIAo+IFRoZSBtYXRyaXggY2hhbmdl
cyBhY2NvcmRpbmdseQo+ICAgICAgIAo+ICAgICAgICAgIDAgMSAyIDMgICAgICAwIDEgMiAzCj4g
ICAgICAgIDAgMSAwIDAgMSAgICAwIDEgMSAwIDEKPiAgICAgICAgMSAxIDEgMCAxID0+IDEgMCAx
IDAgMAo+ICAgICAgICAyIDEgMSAxIDEgICAgMiAxIDEgMSAxCj4gICAgICAgIDMgMCAwIDAgMSAg
ICAzIDAgMSAwIDEKPiAKPiBscnVfcG9zdCBpcyBwcm9kdWN0IG9mIGJpdHMgaW4gYSBjb2x1bW4K
PiAKPiB1cGRhdGUgPSA2J2IxMDAxMDEKPiAKPiBUaGlzIG1lYW5zIHVwZGF0ZWQgaGlzdG9yeSBp
cwo+IAo+ICAwPDEgMDwyIDA8MyAxPDIgMTwzIDI8Mwo+ICAgMSAgIDAgICAxICAgMCAgIDAgICAx
Cj4gCj4gVGhpcyBpcyB3aGF0IHdlIGludGVycHJldCBmcm9tIG91dHB1dCAxPjM+MD4yIGFuZCBp
dHMgc2FtZSBhcyBvdXIgZXhwZWN0YXRpb24uCj4gCj4gICAgCgoKCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9w
ZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcv
bGlzdGluZm8vb3BlbnJpc2MK
