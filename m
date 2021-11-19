Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 48ADA45794E
	for <lists+openrisc@lfdr.de>; Sat, 20 Nov 2021 00:07:34 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E7867242B4;
	Sat, 20 Nov 2021 00:07:33 +0100 (CET)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mail.librecores.org (Postfix) with ESMTPS id 7F27F24221
 for <openrisc@lists.librecores.org>; Sat, 20 Nov 2021 00:07:32 +0100 (CET)
Received: by mail-pl1-f180.google.com with SMTP id u17so9249388plg.9
 for <openrisc@lists.librecores.org>; Fri, 19 Nov 2021 15:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=a3QIVls/cN+mZ+EWtF+ki4qzcCZH6MewXbTIyMlbaNI=;
 b=Dbc2FN9SUoJmPMRWsnLaZcCKoelhyHn9j2+P7iMMxbWS0dafCnzVy1FalAt6CZMbjz
 8d4u3cZAB2PvOp83h+BKkqNoxs4Lz5Jy4PXmu40CWvL0l/npjxZIOlxWsI79Q08esR/w
 Y73QruxjAPfhU1A7EUehVUyAT89bB3n6gkQOO+UAV+A8iXrvvJG6rT7JbbRLxZUdhVoQ
 9Pn5rlgYnCR0JcmwD6rC20ehqR4k6pYhOJCv3gT+5rwgtuxY5UJsaoM1O8KnHFwyWTPa
 Odo4OOJlLsmttSIWSrZbL53nLf/Z4reZTRTNtAJxo2+rUicgFrGTIrrtI7Fvk0qnk+mu
 LNHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=a3QIVls/cN+mZ+EWtF+ki4qzcCZH6MewXbTIyMlbaNI=;
 b=VCQQDK8THnRykel+Zc+vnlL+9fnPxJjejtgHFSAa2cNw7dDuaAJDqdcZpqBcsqpmS2
 tcJUaBGYnlsQIR0/h6J7P1153O6kQ+V00gOav6QEGK+qmK0B8M29nSG1H4VQvyA3625P
 N2OhAPPSvP0cvkpJNmDzM+qb9+/xDzY4AYbFY45HjPtiRJol+4YcY3tXnIQrfxooVveD
 hlpviyDTsBffgbViFAMwWFJ9MiA85WSYyssbBFSlLj9fuJ9ig5w2pUzN42lQOaRYcCcR
 Tr0f7YmMfYyqHdABgZ29EwF8Sqnlhsu03S72ZxFTGGBnnq0k3ysRWvnqJ208DPCsxpjp
 obPA==
X-Gm-Message-State: AOAM531kdXc4+cqAdAtAoK7kSVP1MR5DhZegAyWfj7DAFAobzZVKm4oW
 e4KrmAB1ROLhX4jFUeqzlSK3q6zS9WQ=
X-Google-Smtp-Source: ABdhPJy6Ys9TWKy5mTZzwxoqnf5vRszU5vYztnyHsmb+URahpUETLpeXLog0Vuk6pHiVm0IogDaLMA==
X-Received: by 2002:a17:902:b097:b0:141:ec7d:a055 with SMTP id
 p23-20020a170902b09700b00141ec7da055mr81092432plr.3.1637363250917; 
 Fri, 19 Nov 2021 15:07:30 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id v1sm620254pfg.169.2021.11.19.15.07.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 15:07:30 -0800 (PST)
Date: Sat, 20 Nov 2021 08:07:28 +0900
From: Stafford Horne <shorne@gmail.com>
To: Joseph Myers <joseph@codesourcery.com>
Message-ID: <YZguMGX4mbvqTK9R@antec>
References: <20211113031639.2402161-1-shorne@gmail.com>
 <20211113031639.2402161-8-shorne@gmail.com>
 <alpine.DEB.2.22.394.2111182225310.1393807@digraph.polyomino.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2111182225310.1393807@digraph.polyomino.org.uk>
Subject: Re: [OpenRISC] [PATCH v2 07/13] or1k: math soft float support
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
 GLIBC patches <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCBOb3YgMTgsIDIwMjEgYXQgMTA6Mjg6MDNQTSArMDAwMCwgSm9zZXBoIE15ZXJzIHdy
b3RlOgo+IE9uIFNhdCwgMTMgTm92IDIwMjEsIFN0YWZmb3JkIEhvcm5lIHZpYSBMaWJjLWFscGhh
IHdyb3RlOgo+IAo+ID4gZGlmZiAtLWdpdCBhL3N5c2RlcHMvb3Ixay9iaXRzL2ZlbnYuaCBiL3N5
c2RlcHMvb3Ixay9iaXRzL2ZlbnYuaAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4
IDAwMDAwMDAwMDAuLjQ5MTk0YWQ4NTEKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL3N5c2Rl
cHMvb3Ixay9iaXRzL2ZlbnYuaAo+ID4gQEAgLTAsMCArMSw2OCBAQAo+ID4gKy8qIENvcHlyaWdo
dCAoQykgMjAyMSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIEluYy4KPiAKPiBNaXNzaW5nIG9u
ZS1saW5lIGRlc2NyaXB0aW9uIGF0IHN0YXJ0IG9mIGZpbGUuCgpPSyBBZGRlZCBmb3IgdjMuCiAK
PiBUaGUgY29uc3RhbnRzIHlvdSdyZSBkZWZpbmluZyBoZXJlIHNlZW0gdG8gYmUgc3BlY2lmaWMg
dG8gaGFyZCBmbG9hdCwgYnV0IAo+IHRoZXkncmUgZGVmaW5lZCB1bmNvbmRpdGlvbmFsbHkuICBJ
cyB0aGlzIGJlY2F1c2UgeW91IHVzZSB0aGUgc2FtZSBBQkkgZm9yIAo+IGhhcmQgZmxvYXQgYW5k
IHNvZnQgZmxvYXQgKHdoaWNoIGlzIGdlbmVyYWxseSB0aGUgY2FzZSB3aGVuIHN1Y2ggaGFyZCAK
PiBmbG9hdCBjb25zdGFudHMgbWlnaHQgYmUgZGVmaW5lZCBmb3Igc29mdCBmbG9hdCBhcyB3ZWxs
IC0gYSBzb2Z0IGZsb2F0IAo+IGNvbXBpbGF0aW9uIGNvdWxkIGJlIHVzaW5nIGEgaGFyZCBmbG9h
dCBsaWJjIHRoYXQgc3VwcG9ydHMgdGhvc2UgCj4gY29uc3RhbnRzKT8KClllcywgaXQncyB0aGUg
c2FtZSBBQkkuICBJIGhhdmUgcGF0Y2hlcyBmb3IgaGFyZCBmbG9hdCBidXQgYW0gbm90IHN1Ym1p
dHRpbmcKdW50aWwgdGhlIExpbnV4IHNpZGUgaXMgc29ydGVkIG91dCBhcyBtZW50aW9uZWQgaW4g
dGhlIGNvbW1lbnQuICBJdCBzZWVtcwpkZWxjYWlyaW5nIHRoZXNlIGNvbmRpdGlvbmFsbHkgd2Fz
IG5vcm1hbCwgaGVuY2UgSSBkaWRuJ3QgbWVudGlvbiBhbnl0aGluZyBhYm91dAppdC4KCkkgZGlk
bid0IHRoaW5rIGFzIGZhciBhcyBhbGxvd2luZyBmb3Igc2hhcmVkIGxpYmMgdXNhZ2UgYmV0d2Vl
biBzb2Z0L2Zsb2F0CmZsb2F0LCBidXQgSSB0aGluayB0aGF0IHdvdWxkIHdvcmsuCgo+ID4gKy8q
IERlZmluZSBiaXRzIHJlcHJlc2VudGluZyBleGNlcHRpb25zIGluIHRoZSBGUENTUiBzdGF0dXMg
d29yZC4gICovCj4gPiArZW51bQo+ID4gKyAgewo+ID4gKyAgICBGRV9PVkVSRkxPVyA9Cj4gPiAr
I2RlZmluZSBGRV9PVkVSRkxPVwkxIDw8IDMKPiAKPiBNYWNyb3MgbmVlZCB0byBiZSBwcm9wZXJs
eSBzdXJyb3VuZGVkIGJ5IHBhcmVudGhlc2VzIHNvIHRoZXkgYWx3YXlzIGdyb3VwIAo+IGFzIGEg
c2luZ2xlIG9wZXJhbmQgaW4gYW55IGV4cHJlc3Npb24uCj4gCj4gPiArI2RlZmluZSBGUF9FWF9P
VkVSRkxPVwkJMSA8PCAzCj4gPiArI2RlZmluZSBGUF9FWF9VTkRFUkZMT1cJCTEgPDwgNAo+ID4g
KyNkZWZpbmUgRlBfRVhfSU5FWEFDVAkJMSA8PCA4Cj4gPiArI2RlZmluZSBGUF9FWF9JTlZBTElE
CQkxIDw8IDkKPiA+ICsjZGVmaW5lIEZQX0VYX0RJVlpFUk8JCTEgPDwgMTEKPiAKPiBMaWtld2lz
ZSBpbiBzZnAtbWFjaGluZS5oLgoKT0ssIEkgaGF2ZSBjbGVhbmVkIHRob3NlIHVwLgoKPiAtLSAK
PiBKb3NlcGggUy4gTXllcnMKPiBqb3NlcGhAY29kZXNvdXJjZXJ5LmNvbQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QK
T3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9y
Zy9saXN0aW5mby9vcGVucmlzYwo=
