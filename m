Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B602241FBCC
	for <lists+openrisc@lfdr.de>; Sat,  2 Oct 2021 14:38:22 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2F66A24198;
	Sat,  2 Oct 2021 14:38:22 +0200 (CEST)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mail.librecores.org (Postfix) with ESMTPS id 1122323F5F
 for <openrisc@lists.librecores.org>; Sat,  2 Oct 2021 14:38:21 +0200 (CEST)
Received: by mail-pj1-f46.google.com with SMTP id
 d13-20020a17090ad3cd00b0019e746f7bd4so607229pjw.0
 for <openrisc@lists.librecores.org>; Sat, 02 Oct 2021 05:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=P6qFBggDbUbYVolP3u2ZDXe489MEX4kV8HKAIWuNb9Q=;
 b=LArsdtKCRVn3qXwzRpX3ns9MPpOkKw/M9whS5PtOH2bbHqfvWy/jGztHzCCU3dsW3V
 u01XXbGa2PqSUN5C8hviQD6OPRrSfReTqtKSqPOSjQV8IxlKbpeHu83OAIu91b5V/mDe
 kT/lXP/r5z0gWnNrKgNS+0KmoQJokQuhHmhRF9uPzHYkf6iRl6N+R9dlFyCpHSFbTnPQ
 oaId6C4BdMuBr1ejJhCFdHJ69iqNJJnmpgwFctdnCaLzMm1Zg8L5wmfrKp9JusJ1p80O
 HgpbR64Zn0TV2dlRiLUdUP65O1psuoljP36ScI8aieptd8dkPxyoVl5E588LZ0gsoiGS
 pGYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=P6qFBggDbUbYVolP3u2ZDXe489MEX4kV8HKAIWuNb9Q=;
 b=FRpTA/cOEms4FD5ibdWXRu/mmubFpLZ058MerM2Btmc0LybjCYTS4gaVrGjr3tbbhZ
 4GFi8tr4CWWnVdwCcGpKtPJxf3VpkBJqCTC4j/Dz5sLLZAOMTZqcX1/HSRD9kkrRwCKM
 vnAtIocBB3LaQksNgzotOCiDMdp47TqmAIroiTgPdrsjniwZfdnh9IDlIbpswjzXCf0p
 6hJT89YF/RSC8Q+hlAW0cwdg0n8ucn52wBfq4Ma8rnlAyCZHxVCc36Z1D75Ra8weUZdP
 I7YyK+7F4UyPNDn0FvX/Ev6qFn71SfcelxZrzI5p4wU9SD+QyyLNRPHwD6vQxeQaQqOU
 +IvQ==
X-Gm-Message-State: AOAM530Z4WjB2u/MeUGSnPCTrstoCHgEKYb5iETWzdmJRfLtLdY6IL3/
 qb2mrguEok4hr/i9IeAY5tw=
X-Google-Smtp-Source: ABdhPJyzOShZpfenGoc/Ai07w5jAUABN8v2uRvEI7/QpnmEqT5fEhLHFOePYPoe9/4yIJ3zx7CRpew==
X-Received: by 2002:a17:90b:3ec3:: with SMTP id
 rm3mr17943544pjb.93.1633178299288; 
 Sat, 02 Oct 2021 05:38:19 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id on9sm8725333pjb.3.2021.10.02.05.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 05:38:18 -0700 (PDT)
Date: Sat, 2 Oct 2021 21:38:16 +0900
From: Stafford Horne <shorne@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <YVhSuFFMnlQm+x+8@antec>
References: <20211001021101.18225-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211001021101.18225-1-rdunlap@infradead.org>
Subject: Re: [OpenRISC] [PATCH] openrisc: time: don't mark comment as
 kernel-doc
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
Cc: Jonas Bonn <jonas@southpole.se>, linux-kernel@vger.kernel.org,
 openrisc@lists.librecores.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCBTZXAgMzAsIDIwMjEgYXQgMDc6MTE6MDFQTSAtMDcwMCwgUmFuZHkgRHVubGFwIHdy
b3RlOgo+IEZpeCBhIGtlcm5lbC1kb2Mgd2FybmluZyBieSB1bm1hcmtpbmcgdGhlIGNvbW1lbnQg
YXMgYmVpbmcgaW4KPiBrZXJuZWwtZG9jIG5vdGF0aW9uLgo+IAo+IEZpeGVzIHRoaXMgd2Fybmlu
ZzoKPiBhcmNoL29wZW5yaXNjL2tlcm5lbC90aW1lLmM6MTM3OiB3YXJuaW5nOiBleHBlY3Rpbmcg
cHJvdG90eXBlIGZvciBDbG9ja3NvdXJjZSgpLiBQcm90b3R5cGUgd2FzIGZvciBvcGVucmlzY190
aW1lcl9yZWFkKCkgaW5zdGVhZAo+IAo+IEZpeGVzOiBiNzMxZmJiZDI0NmUgKCJPcGVuUklTQzog
VGltZWtlZXBpbmciKQo+IFNpZ25lZC1vZmYtYnk6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZy
YWRlYWQub3JnPgo+IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNv
bT4KPiBDYzogSm9uYXMgQm9ubiA8am9uYXNAc291dGhwb2xlLnNlPgo+IENjOiBTdGVmYW4gS3Jp
c3RpYW5zc29uIDxzdGVmYW4ua3Jpc3RpYW5zc29uQHNhdW5hbGFodGkuZmk+Cj4gQ2M6IFN0YWZm
b3JkIEhvcm5lIDxzaG9ybmVAZ21haWwuY29tPgo+IENjOiBvcGVucmlzY0BsaXN0cy5saWJyZWNv
cmVzLm9yZwo+IC0tLQo+ICBhcmNoL29wZW5yaXNjL2tlcm5lbC90aW1lLmMgfCAgICAyICstCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IC0tLSBs
aW51eC1uZXh0LTIwMjEwOTMwLm9yaWcvYXJjaC9vcGVucmlzYy9rZXJuZWwvdGltZS5jCj4gKysr
IGxpbnV4LW5leHQtMjAyMTA5MzAvYXJjaC9vcGVucmlzYy9rZXJuZWwvdGltZS5jCj4gQEAgLTEy
Nyw3ICsxMjcsNyBAQCBpcnFyZXR1cm5fdCBfX2lycV9lbnRyeSB0aW1lcl9pbnRlcnJ1cHQoCj4g
IAlyZXR1cm4gSVJRX0hBTkRMRUQ7Cj4gIH0KPiAgCj4gLS8qKgo+ICsvKgo+ICAgKiBDbG9ja3Nv
dXJjZTogQmFzZWQgb24gT3BlblJJU0MgdGltZXIvY291bnRlcgo+ICAgKgo+ICAgKiBUaGlzIHNl
dHMgdXAgdGhlIE9wZW5SSVNDIFRpY2sgVGltZXIgYXMgYSBjbG9jayBzb3VyY2UuICBUaGUgdGlj
ayB0aW1lcgoKSGkgUmFuZHksCgpUaGlzIGxvb2tzIGdvb2QgdG8gbWUsIHRoYW5rIHlvdS4gIEkg
YW0gcXVldWluZyBpdC4KCi1TdGFmZm9yZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGli
cmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlz
Ywo=
