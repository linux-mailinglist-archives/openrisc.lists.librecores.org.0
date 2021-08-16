Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id EB6C63EDF86
	for <lists+openrisc@lfdr.de>; Mon, 16 Aug 2021 23:54:43 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 900FF2409F;
	Mon, 16 Aug 2021 23:54:43 +0200 (CEST)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mail.librecores.org (Postfix) with ESMTPS id B5F4A211D5
 for <openrisc@lists.librecores.org>; Mon, 16 Aug 2021 23:54:41 +0200 (CEST)
Received: by mail-pj1-f45.google.com with SMTP id j1so28657585pjv.3
 for <openrisc@lists.librecores.org>; Mon, 16 Aug 2021 14:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ma2XM54AN3WajG+k32xASSOma7IlWHnpwx4KtUTcP3U=;
 b=T6rXz/oVq+pzCo8KG7I21zEVrR8SSY3AfmiHCn06dMONcM2fTA4xAljnG4CwSHPQ/l
 3+z2974kt77fGhFBF5X+4V9NNE8Ebz24eBkpqImxulLKPCgfo3jgAw25/E03/yKDRq1Y
 jIrcqPZ7YgL6gvH+BHhIoTM9OVaadeukE70PCXi36RMXySlTsC1aOTIZEj/8IrZKC3tf
 lsPt10NRltMziC0XVi48RqacFJOfdfYTCzYN9l3wl30tpPd6VDXYtlhhPl866x3GmJ8S
 Wvh4lgORc2qboty+5cm8TtOZrJXh2Nb0xgqhWG9Ikm2JpkpuV2Q+px833+G2iHHaxshI
 +21A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ma2XM54AN3WajG+k32xASSOma7IlWHnpwx4KtUTcP3U=;
 b=oQ75ehujYLheD51/HcgWkrM31lNI+aNi+hE/cITmDiaBn+rsXrM4TuKKY26z3F20zr
 RW9aPFwUGnDe316e3KjqqC+8YKKvD2EKiqUtvJLRBHU7MChkIuv7G7oJuecPI8Z8jZcN
 g8M4R3x2iKPRCE3dWUFCX5mnNwoPRZ2Y0RsiE4HPP4hJOjytunz6yXmquxD40nI3+Pv0
 d/caAGHdjfOGOU5OeA1ZQsb7X9xqts7w4PjLvnEFV4odsG7ucDZv+/ZNUYd1uTDHzcBZ
 M0SsPp7bEPLD2Qe0HLbpFcXO5oplkrid7gIxAqyLu9TLkqMzZ3Mj9sLQKWQA5wLEcoRq
 Fh1w==
X-Gm-Message-State: AOAM530VcuwcktWXYvbyjrWfICpueQJGQklE9JO10wCX+sPUrdzOpQSb
 pbhMSndtDvzY++lroXHJ/0E=
X-Google-Smtp-Source: ABdhPJyDagtB1ACZEB0ycXLsMAmsic3k7qXCJIMOLb0dUG7AsauyibFs53p/jky7BdL5PcXflI8S2g==
X-Received: by 2002:a63:556:: with SMTP id 83mr181343pgf.1.1629150879913;
 Mon, 16 Aug 2021 14:54:39 -0700 (PDT)
Received: from localhost (g194.219-121-107.ppp.wakwak.ne.jp. [219.121.107.194])
 by smtp.gmail.com with ESMTPSA id in12sm114991pjb.5.2021.08.16.14.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 14:54:38 -0700 (PDT)
Date: Tue, 17 Aug 2021 06:54:37 +0900
From: Stafford Horne <shorne@gmail.com>
To: Joseph Myers <joseph@codesourcery.com>
Message-ID: <YRrenWZeh103h3zX@antec>
References: <20210806094217.3227877-1-shorne@gmail.com>
 <0f577bc8-bef8-6c06-aaa9-57bf16d8443b@linaro.org>
 <YRhCqNWB1MC++TAO@antec>
 <alpine.DEB.2.22.394.2108161710590.136350@digraph.polyomino.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2108161710590.136350@digraph.polyomino.org.uk>
Subject: Re: [OpenRISC] [PATCH v2] time: Fix overflow itimer tests on 32-bit
 systems
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
Cc: Openrisc <openrisc@lists.librecores.org>,
 GLIBC patches <libc-alpha@sourceware.org>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBBdWcgMTYsIDIwMjEgYXQgMDU6MTI6MDRQTSArMDAwMCwgSm9zZXBoIE15ZXJzIHdy
b3RlOgo+IEknbSBzZWVpbmcgYSBidWlsZCBmYWlsdXJlIGluIHRoZSBnbGliYyB0ZXN0c3VpdGUg
Zm9yIGk2ODYtZ251Ogo+IAo+IHRzdC1pdGltZXIuYzogSW4gZnVuY3Rpb24gJ2RvX3Rlc3QnOgo+
IHRzdC1pdGltZXIuYzoxMDM6MTE6IGVycm9yOiAnX19LRVJORUxfT0xEX1RJTUVWQUxfTUFUQ0hF
U19USU1FVkFMNjQnIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQo+ICAg
MTAzIHwgICAgICAgaWYgKF9fS0VSTkVMX09MRF9USU1FVkFMX01BVENIRVNfVElNRVZBTDY0KQo+
ICAgICAgIHwgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
Cj4gdHN0LWl0aW1lci5jOjEwMzoxMTogbm90ZTogZWFjaCB1bmRlY2xhcmVkIGlkZW50aWZpZXIg
aXMgcmVwb3J0ZWQgb25seSBvbmNlIGZvciBlYWNoIGZ1bmN0aW9uIGl0IGFwcGVhcnMgaW4KPiAK
PiBodHRwczovL3NvdXJjZXdhcmUub3JnL3BpcGVybWFpbC9saWJjLXRlc3RyZXN1bHRzLzIwMjFx
My8wMDg0MTIuaHRtbAoKUmlnaHQgc29ycnkgYWJvdXQgdGhhdCwgc28gX19LRVJORUxfT0xEX1RJ
TUVWQUxfTUFUQ0hFU19USU1FVkFMNjQgb25seSBleGlzdHMgaW4KbGludXguCgpTbyBpdCBsb29r
cyBsaWtlIGZvciBub24gbGludXggdGhlIG5ldyB0aW1lciB0ZXN0IGNoYW5nZXMgYnJlYWsuCgpT
aG91bGQgd2UgcHJvdmlkZSBfX0tFUk5FTF9PTERfVElNRVZBTF9NQVRDSEVTX1RJTUVWQUw2NCBm
b3Igbm90IGxpbnV4IGJ1aWxkcywKb3IgcmVtb3ZlIF9fS0VSTkVMX09MRF9USU1FVkFMX01BVENI
RVNfVElNRVZBTDY0IGZyb20gdGhlIGl0aW1lciB0ZXN0IGFnYWluPwpUaGUgcmVhc29uIGZvciB1
c2luZyBfX0tFUk5FTF9PTERfVElNRVZBTF9NQVRDSEVTX1RJTUVWQUw2NCBpcyB0byBwaWNrIHVw
IHRoZQp0aW1ldmFsIHNpemUgd2hpY2ggaXMgZGlmZmVyZW50IG9uIGVhY2ggYXJjaGl0ZWN0dXJl
LgoKTWF5YmUgdGhlIGVhc2llc3QgaXMgYWRkaW5nIHNvbWV0aGluZyBsaWtlOgoKI2lmbmRlZiBf
X0tFUk5FTF9PTERfVElNRVZBTF9NQVRDSEVTX1RJTUVWQUw2NAojZGVmaW5lIF9fS0VSTkVMX09M
RF9USU1FVkFMX01BVENIRVNfVElNRVZBTDY0IChzaXplb2YgKF9fdGltZV90KSA9PSA4KQojZW5k
aWYKClRvIHRoZSB0b3Agb2YgdHN0LWl0aW1lci5jLiAgU29ycnkgSSBkb24ndCBoYXZlIHRpbWUg
cmlnaHQgbm93IHRvIHNlbmQgYSBwYXRjaApvciB0ZXN0IHRoaXMuCgotU3RhZmZvcmQgCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxp
bmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJl
Y29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
