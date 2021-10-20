Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 8F62543552B
	for <lists+openrisc@lfdr.de>; Wed, 20 Oct 2021 23:15:14 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 40C4C24218;
	Wed, 20 Oct 2021 23:15:14 +0200 (CEST)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mail.librecores.org (Postfix) with ESMTPS id 2592E2410F
 for <openrisc@lists.librecores.org>; Wed, 20 Oct 2021 23:15:13 +0200 (CEST)
Received: by mail-pl1-f171.google.com with SMTP id t21so8985042plr.6
 for <openrisc@lists.librecores.org>; Wed, 20 Oct 2021 14:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VmyayghHBg6tIEVLL0c4Urgdn8cTT3ai2DDLtC/WPNA=;
 b=HoYPyu7nglzdW7N3LAmogah/0zR2I72m4POCTBGSzp1bQNmAE4PAXko5nNv9QQ360i
 /XrDaDR8552038nuOXgOTUTS+dYQHr97tlUiZEFjbjjgm4UTp6tl+1Kx6ejGCY+9uBEM
 +bI+VURN3kBMKSBkwYSD4kTdt8fAQ5JqhXhErO5x/xXjypeWCna0A/kMZNn6i2pDC89e
 WK4Tk6gBQwIGvQDcHwBSgfeE2R0jLgJBVQEMoOV5AzJ2nbhuZnMxZRtMp5FHwPueUlOD
 YETxNnr8/l+rM/m8M4cVs4XQ8EpYTQUCWolGb+gH82Tgrv2MpPcIRPawTTCf8M5PGWz8
 SVwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VmyayghHBg6tIEVLL0c4Urgdn8cTT3ai2DDLtC/WPNA=;
 b=X6Pwl3OrrQYhfzoTOww9NuIfuP3NnFn8nr6kdwxgbfAcphMQWjhs1So3JgC8g2knQN
 3vXEYgcLDxPYgogQ5as2w8U5tyXM8ga3FyCGlImFz429mWRfTSjDJcquSRleRq4fJewe
 PeJl4CHDRiG5TTUltqncY0bzA/RMYC9mqmeIdEjJOlQ7Jzq84q6d2q3C/rtVg7Yri1G0
 23PNFHWoZxX49t6VtBPAyoXr/iPjgGfON1dfWolPEsky7zQ/ODuvWwtCTQbM8Qt9UWzF
 kkQe4qDgLxYnlH29hZO2TTFsKZoiBt7BVY70BAt86ZrXEMUUUKiXex3Z3uVrqR9HXiah
 np4w==
X-Gm-Message-State: AOAM53029pzpcgjwZVOF0jR7Sau+D6GhYpJ5CF7MMSI9HX8un2vEEm1Z
 7V5E853OMzZI9EDva/dt6YIk7a0xu1U=
X-Google-Smtp-Source: ABdhPJxNlvfgtrEjzDQjLXvaYFDlZJWnoZG4O9gPGAYI0/6q1U6bRxb9UCtwpSLg3UBNZvnQusl0Hw==
X-Received: by 2002:a17:902:d488:b0:13f:165e:f491 with SMTP id
 c8-20020a170902d48800b0013f165ef491mr1519997plg.12.1634764511580; 
 Wed, 20 Oct 2021 14:15:11 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id r19sm3598942pfh.14.2021.10.20.14.15.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 14:15:10 -0700 (PDT)
Date: Thu, 21 Oct 2021 06:15:09 +0900
From: Stafford Horne <shorne@gmail.com>
To: Tom Tromey <tom@tromey.com>
Message-ID: <YXCG3VDoltpV7i5t@antec>
References: <20210913124800.471680-1-shorne@gmail.com>
 <87ee8fv9ql.fsf@tromey.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87ee8fv9ql.fsf@tromey.com>
Subject: Re: [OpenRISC] [PATCH 0/5] OpenRISC Linux Native and GDBServer
 Support
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
 Stafford Horne via Gdb-patches <gdb-patches@sourceware.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBPY3QgMjAsIDIwMjEgYXQgMTI6MjA6MzRQTSAtMDYwMCwgVG9tIFRyb21leSB3cm90
ZToKPiA+Pj4+PiAiPiIgPT0gU3RhZmZvcmQgSG9ybmUgdmlhIEdkYi1wYXRjaGVzIDxnZGItcGF0
Y2hlc0Bzb3VyY2V3YXJlLm9yZz4gd3JpdGVzOgo+IAo+ID4+IEhlbGxvLAo+ID4+IEFzIEkgaGF2
ZSBiZWVuIHdvcmtpbmcgb24gdGhlIE9wZW5SSVNDIGdsaWJjIHBvcnQgb3ZlciB0aGUgbGFzdCBm
ZXcgeWVhcnMgbm93IEkKPiA+PiBoYXZlIGhhZCB0aGUgbmVlZCB0byBoYXZlIExpbnV4IG5hdGl2
ZSBkZWJ1Z2dpbmcuICBBdCBmaXJzdCBJIHN0YXJ0ZWQgd2l0aCB0aGUKPiA+PiBnZGJzZXJ2ZXIs
IGJ1dCBxdWlja2x5IGdyZXcgb3V0IG9mIHRoYXQgYW5kIGp1c3Qgc2V0dGxlZCBvbiBydW5uaW5n
IGdkYiBuYXRpdmUKPiA+PiBvbiB0aGUgcGxhdGZvcm0uCj4gCj4gSSByZWFkIHRocm91Z2ggdGhl
c2UgYW5kIGl0IHNlZW1lZCBiYXNpY2FsbHkgb2sgdG8gbWUuICBJIHNlbnQgb25lCj4gbGl0dGxl
IG5pdC4gIEkgZG9uJ3QgdGhpbmsgaXQgbmVlZHMgcmUtcmV2aWV3IGlmIHlvdSB3YW50IHRvIGZp
eCB0aGF0LgoKVGhhbmtzIGZvciByZXZpZXdpbmcuICBJIHdpbGwgZ2l2ZSBpdCBhIGRheSBvciB0
d28gZm9yIG1vcmUgY29tbWVudHMgYmVmb3JlCnB1c2hpbmcgdXBzdHJlYW0uCgotU3RhZmZvcmQK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
