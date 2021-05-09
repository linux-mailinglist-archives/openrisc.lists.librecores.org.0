Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A8D763778A4
	for <lists+openrisc@lfdr.de>; Sun,  9 May 2021 23:17:19 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id EA2EF2139D;
	Sun,  9 May 2021 23:17:18 +0200 (CEST)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mail.librecores.org (Postfix) with ESMTPS id 53A6420132
 for <openrisc@lists.librecores.org>; Sun,  9 May 2021 23:17:17 +0200 (CEST)
Received: by mail-pf1-f182.google.com with SMTP id c17so12235124pfn.6
 for <openrisc@lists.librecores.org>; Sun, 09 May 2021 14:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6shXq3lguQ3/lmI/1zOEwQpY1lYG83HevdlxUdGp6B4=;
 b=urrXzvOLg5/BsYoTh3as+hPn1xC55f7KTNxPj7L//gy81mymM6vdN8+CagpCaoEQmA
 NW5c7jlFWcul9pUSGxFdp8hH0TqWeDuxlvqAa0poFjo/x1Tu0tZfQWElXuVHHklpsjN3
 Kh68CUXj5tJN7pw89l9l+JK0RB2KxGt+1UKoMbLAbIH6nO5QSZ/SqRRyCnTfZLAPkOmt
 UzllGmCozj0mmWR5OBI8kkZL9f6QoCA8/5qQF4aRXffPdWjr9ZD/6JYLPQRAQHjcbksK
 W89iudMypFDwK4lCXnNopuxFyf+qF55YG7zndRnLmb660sNd9Att2C/4uACxjI2VWrN3
 ANmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6shXq3lguQ3/lmI/1zOEwQpY1lYG83HevdlxUdGp6B4=;
 b=NGWuuyNeLybhi/tsj84zmxGXi9w5oPkJ5K7q3K3X7o53eu97fXQyxTkSzAlsAstw8E
 EDQvv+S7ZP2FCYGUaB1QoblrhhMPX6/j7vVIAD7a/+yXVyqweoJm57oUN8+vG5fWkqvO
 RXHKpauF2BkGOv7qpbLMPI/njXwH/b+yFWrWPr5WZvNZISTk+jYiylXwJ9g10VtB0DA6
 4CbC8s8gfdazl4ti+65XKQoU/jPcIYT4t7EUan8x+1JObJ1BnBiEFjDi+nfQRY1BiTC0
 uamAeF2c1bU8C9Bd/V+cSx3F0koegTcyeWlIq+bvkRMK0eDcWjI62gEUXV+6wrteVbjs
 /F/Q==
X-Gm-Message-State: AOAM533XTcYPGNvHc0sakCO5Gh9LYIeVyaWC9+Z5E7d3YUmXxwIJyvDl
 V2eJ9G4SZjaL5M+Idz3voEE=
X-Google-Smtp-Source: ABdhPJzCExpTFYh3ZxRC7di/xqLLX147xbMP6vTSDXsRQIYBj8WcnnUaNrnIocagjg655MDYAXWBUQ==
X-Received: by 2002:a63:524e:: with SMTP id s14mr15596094pgl.403.1620595035804; 
 Sun, 09 May 2021 14:17:15 -0700 (PDT)
Received: from localhost (g1.222-224-229.ppp.wakwak.ne.jp. [222.224.229.1])
 by smtp.gmail.com with ESMTPSA id a16sm9442473pfc.37.2021.05.09.14.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 May 2021 14:17:15 -0700 (PDT)
Date: Mon, 10 May 2021 06:17:13 +0900
From: Stafford Horne <shorne@gmail.com>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <YJhRWQEy2Cpd1sKy@antec>
References: <20210509091103.7985-1-rppt@kernel.org>
 <20210509091103.7985-2-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210509091103.7985-2-rppt@kernel.org>
Subject: Re: [OpenRISC] [PATCH 1/2] openrisc: mm/init.c: remove unused
 memblock_region variable in map_ram()
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
 linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU3VuLCBNYXkgMDksIDIwMjEgYXQgMTI6MTE6MDJQTSArMDMwMCwgTWlrZSBSYXBvcG9ydCB3
cm90ZToKPiBGcm9tOiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gCj4gS2Vy
bmVsIHRlc3Qgcm9ib3QgcmVwb3J0czoKPiAKPiBjcHBjaGVjayBwb3NzaWJsZSB3YXJuaW5nczog
KG5ldyBvbmVzIHByZWZpeGVkIGJ5ID4+LCBtYXkgbm90IHJlYWwgcHJvYmxlbXMpCj4gCj4gPj4g
YXJjaC9vcGVucmlzYy9tbS9pbml0LmM6MTI1OjEwOiB3YXJuaW5nOiBVbmluaXRpYWxpemVkIHZh
cmlhYmxlOiByZWdpb24gW3VuaW5pdHZhcl0KPiAgICAgICAgICAgICByZWdpb24tPmJhc2UsIHJl
Z2lvbi0+YmFzZSArIHJlZ2lvbi0+c2l6ZSk7Cj4gICAgICAgICAgICAgXgo+IAo+IFJlcGxhY2Ug
dXNhZ2Ugb2YgbWVtYmxvY2tfcmVnaW9uIGZpZWxkcyB3aXRoICdzdGFydCcgYW5kICdlbmQnIHZh
cmlhYmxlcwo+IHRoYXQgYXJlIGluaXRpYWxpemVkIGluIGZvcl9lYWNoX21lbV9yYW5nZSgpIGFu
ZCByZW1vdmUgdGhlIGRlY2xhcmF0aW9uIG9mCj4gcmVnaW9uLgo+IAo+IEZpeGVzOiBiMTBkNmJj
YTg3MjAgKCJhcmNoLCBkcml2ZXJzOiByZXBsYWNlIGZvcl9lYWNoX21lbWJvY2soKSB3aXRoIGZv
cl9lYWNoX21lbV9yYW5nZSgpIikKPiBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxr
cEBpbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5p
Ym0uY29tPgo+IC0tLQo+ICBhcmNoL29wZW5yaXNjL21tL2luaXQuYyB8IDMgKy0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvYXJjaC9vcGVucmlzYy9tbS9pbml0LmMgYi9hcmNoL29wZW5yaXNjL21tL2luaXQuYwo+IGlu
ZGV4IGJmOWIyMzEwZmM5My4uZjNmYTAyYjg4MzhhIDEwMDY0NAo+IC0tLSBhL2FyY2gvb3BlbnJp
c2MvbW0vaW5pdC5jCj4gKysrIGIvYXJjaC9vcGVucmlzYy9tbS9pbml0LmMKPiBAQCAtNzUsNyAr
NzUsNiBAQCBzdGF0aWMgdm9pZCBfX2luaXQgbWFwX3JhbSh2b2lkKQo+ICAJLyogVGhlc2UgbWFy
ayBleHRlbnRzIG9mIHJlYWQtb25seSBrZXJuZWwgcGFnZXMuLi4KPiAgCSAqIC4uLmZyb20gdm1s
aW51eC5sZHMuUwo+ICAJICovCj4gLQlzdHJ1Y3QgbWVtYmxvY2tfcmVnaW9uICpyZWdpb247Cj4g
IAo+ICAJdiA9IFBBR0VfT0ZGU0VUOwo+ICAKPiBAQCAtMTIxLDcgKzEyMCw3IEBAIHN0YXRpYyB2
b2lkIF9faW5pdCBtYXBfcmFtKHZvaWQpCj4gIAkJfQo+ICAKPiAgCQlwcmludGsoS0VSTl9JTkZP
ICIlczogTWVtb3J5OiAweCV4LTB4JXhcbiIsIF9fZnVuY19fLAo+IC0JCSAgICAgICByZWdpb24t
PmJhc2UsIHJlZ2lvbi0+YmFzZSArIHJlZ2lvbi0+c2l6ZSk7Cj4gKwkJICAgICAgIHN0YXJ0LCBl
bmQpOwo+ICAJfQo+ICB9CgpUaGFua3MgSSB3aWxsIHF1ZXVlIHRoaXMuCgotU3RhZmZvcmQKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFp
bGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGli
cmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
