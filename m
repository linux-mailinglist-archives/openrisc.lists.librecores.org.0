Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 52B4E4D7996
	for <lists+openrisc@lfdr.de>; Mon, 14 Mar 2022 04:10:51 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D2CBA2489E;
	Mon, 14 Mar 2022 04:10:50 +0100 (CET)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by mail.librecores.org (Postfix) with ESMTPS id E3873247F5
 for <openrisc@lists.librecores.org>; Mon, 14 Mar 2022 04:10:49 +0100 (CET)
Received: by mail-ej1-f48.google.com with SMTP id a8so30929832ejc.8
 for <openrisc@lists.librecores.org>; Sun, 13 Mar 2022 20:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=J4AHHKBd7DvO8AGGCdXqlWEQAX4Khxnusdm3RewQOLg=;
 b=Q2VBge5vntK5PMNaFtkHE9zqJGmKmGBfOHtdHasFAfpXt+mWBQYo9XB7cDN/8hNrVI
 PSFjMww0ZPTz3b703KFlmnZWZt7h/tBUXyC7Rzjt03gupeO2hRZF2zjE85VQCUQJGZ1Z
 TE+S5WKbe4YKueMb4VibFsf2caZSPewPJQhm6KuX0NIVWU15wBL3ny6BNxX7XAQIs4co
 8mqg5t3+ozx17PskeznGjFkvXO8gN+3nd2wWT1NR7ar87E+7r0rr9v44FHGRd/gmOKev
 TU/NY3eeTHyMJZX7futO1icZA+NNvK2ZLxwYym0vrgUJbnuzimuZKkThypwlSZKRn2A3
 BeSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=J4AHHKBd7DvO8AGGCdXqlWEQAX4Khxnusdm3RewQOLg=;
 b=x6jjbhw1oz1akwf3a1J6SuTU57lj0jlmAWfYs5obhMB0tRZLqv7X4EBGvCe1fnL3dp
 6PHI/0sz/VKcL7lS7F2r1mFHmWMDclw786BdarQnkD4En0tCioHWvDB9Lfyki3Hj4pZs
 PUJ2CMbBttFFudl9yR1IxIaEcJveIbu9cc8WMdJAaq3R02zQ5GHZT19vFHJPqrIrR+Qq
 Op5xVgfrdTqme2jINunFnTBHTa/rXjZwrr+BH2sVU5Ke3JIqlR9RebBRGq/8jbBu8qvj
 i+MldVK9ReMqn+eMffXwmNo+RIUUzxlNju65dUtuRN9sh4fN0UAJ7/2kiNLl9Xq+zy9z
 lRZg==
X-Gm-Message-State: AOAM533qhIaQWcBFzEu3om0lvb5A8AWRWORk18v4sPwrEx3lVVgRPkZ2
 X/OI5ch5k1EPhlLxXJWFFRSmqUkE88d4dxVIWDY=
X-Google-Smtp-Source: ABdhPJxiaYmJNftMyjUY45ii38YRZpHCTG/fpGLPaRFvmNtwEKQKqNMcPdOfOG82qnnCLhJPb6GUfJ873DywPnR6XHo=
X-Received: by 2002:a17:907:3f17:b0:6da:68b6:7876 with SMTP id
 hq23-20020a1709073f1700b006da68b67876mr17190097ejc.740.1647227449426; Sun, 13
 Mar 2022 20:10:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAAfxs75Q+fkiagFc2hvMcJmudmAEL6y+-otObmr6ArBX9uOTbQ@mail.gmail.com>
 <d5dba66f-9da9-4eb9-be50-b6a333d9475c@mail.ru>
In-Reply-To: <d5dba66f-9da9-4eb9-be50-b6a333d9475c@mail.ru>
From: Stafford Horne <shorne@gmail.com>
Date: Mon, 14 Mar 2022 12:10:38 +0900
Message-ID: <CAAfxs75+3vMfcvfRkRCPRL1OuefY+piEA4q+ZAZ__AjemutEJQ@mail.gmail.com>
To: Andrey Bacherov <bandvig@mail.ru>
Subject: Re: [OpenRISC] Call for help - OpenRISC D-Cache issue
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
Cc: Stefan Wallentowitz <stefan.wallentowitz@gmail.com>,
 Julius Baxter <juliusbaxter@gmail.com>,
 Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU2F0LCBNYXIgMTIsIDIwMjIgYXQgMzo0OSBBTSBBbmRyZXkgQmFjaGVyb3YgPGJhbmR2aWdA
bWFpbC5ydT4gd3JvdGU6Cj4KPgo+Cj4gID4gMDcuMDMuMjAyMiA3OjM3LCBTdGFmZm9yZCBIb3Ju
ZSDQv9C40YjQtdGCOgo+ID4gSSB3aWxsIGNvbnRpbnVlIHRvIGxvb2sgYXQgdGhpcyBhbmQgdHJ5
IHRvIGZpZ3VyZSBvdXQgdGhlIGJlc3Qgd2F5IHRvCj4gPiBhZGQgc29tZSBkLWNhY2hlIHdyaXRl
IGZlZWRiYWNrIHRvIHRoZSBMU1U8LT5EQ0FDSEUgaW50ZXJmYWNlLiAgQnV0Cj4gPiBzb21lIGdl
bmVyYWwgcXVlc3Rpb25zOgo+ID4KPiA+ICAgICogRG8gYW55IG9mIHlvdSByZW1lbWJlciB0aGlz
IHZlcnkgd2VsbCBjYW4gcHJvdmlkZSBzb21lIHBvaW50ZXJzPwo+ID4gICAgKiBBcmUgdGhlc2Ug
Y29tcGxpY2F0ZWQgY29uZGl0aW9ucyBub3JtYWw/ICBBbnkgdGlwcyBvbiB0cnlpbmcgdG8KPiA+
IHVuZGVyc3RhbmQgdGhlbSBiZXR0ZXI/Cj4gPgo+Cj4gSSdtIGFmcmFpZCBJIGNvdWxkbid0IGhl
bHAuCj4gU2V2ZXJhbCB5ZWFycyBhZ28gSSByZS13cm90ZSBDQVBQVUNDSU5PJ3MgbW9kdWxlcyBm
b3IgTUFST0NDSElOTwo+IHN0ZXAtYmF5LXN0ZXAgYW5kIHJlc3VsdGluZyBNQVJPQ0NISU5PJ3Mg
aW50ZXJuYWxzIGJlY29tZSBmYXIgZnJvbQo+IG9yaWdpbmFsLiBQZXJoYXBzIEkgZml4ZWQgdGhl
IGlzc3VlIGluIE1BUk9DQ0hJTk8gaW5kaXJlY3RseS4KPgoKTm8gd29ycmllcywgSSBhbSBtYWtp
bmcgcHJvZ3Jlc3MuICBBIGJpdCBzbG93IGJ1dCBJIHRoaW5rIEkgd2lsbCBnZXQKdGhlcmUgYW5k
IEkgc2hvdWxkIGhhdmUgYSBnb29kIHdyaXRlIHVwIHRvIGRvY3VtZW50IHdoZW4gaXQgaXMgZG9u
ZS4KCi1TdGFmZm9yZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcK
aHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
