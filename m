Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C01B547522C
	for <lists+openrisc@lfdr.de>; Wed, 15 Dec 2021 06:34:30 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 37457242C7;
	Wed, 15 Dec 2021 06:34:30 +0100 (CET)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mail.librecores.org (Postfix) with ESMTPS id 118AE21535
 for <openrisc@lists.librecores.org>; Wed, 15 Dec 2021 06:34:28 +0100 (CET)
Received: by mail-pl1-f178.google.com with SMTP id m24so15442335pls.10
 for <openrisc@lists.librecores.org>; Tue, 14 Dec 2021 21:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IRGsPmDuuJX1TOoCxT1Buj1iBbieoHB/+YYf/dIXHGI=;
 b=ZxlVF2wUH8ZZbRvqQYT1hU1En49xog9B2aZYmh9nhfF4cV9ALjLG4Sw/1Q56Zl8EBc
 XlxHC4H9GMxz7cjGUlXUgu2ef7W0gilbGph2xLOWlQFqsaJvRB7fsfCZl4AHYTiCVYjI
 Cl/2R88086azNQc6qhLTcaARtqZJbjgRf/0mKg5tDqqezO84U0BMMFp8pFsD4jOF2wwd
 fvxnCg901I9u4vywF4tnBy+SZl6aF8bIljQiVOwvZUgOq8JD1oxfOyPu9sJ+U4ioaIpu
 qTs65dldc1Y/9SaP067O5JCkHWa0NMkeuSZEx90fV2o4T+naBr9kTjPXZq1+lQR3sByB
 56YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IRGsPmDuuJX1TOoCxT1Buj1iBbieoHB/+YYf/dIXHGI=;
 b=7GH0jQMguT8mBUEjik0QJR6sC3h2jzydKWJ+/hyLKBq02Ddk9RRzQY21qDCwkN/GBz
 wNI5Uwrs0b6Abv5xdM2RBC3cgPdqkNmIMSMb+9CaIRqCqAHBl2p1Y90ZXyVhHUKBy9fl
 e05yqClnpJ1uZc+AW9VSqpdhlV968RWVteM/f2I2zqPY6GTOgRyMyvgVHUiU5cMvykSQ
 5GaCMHWjKMi2O2pEPXY1fJzSGxus8yyejN4iwpbypLv0EGmAGBUOknvY3M3FUxpIV5Sk
 sXnEGd7df2hTiCzQRDNKDd7kYVmQx8HGEnw+0TE3vTM57VQQzzDfDrKRVzTKtw/Pe46e
 7Y2g==
X-Gm-Message-State: AOAM531JLSHo/Q+E3SEfgpqCB/tnjOkZTU354ySEnxwYmtK8nwzTxCQ+
 f1vLgpAZvYZ7M9ZoHSee/pA=
X-Google-Smtp-Source: ABdhPJxn7BsSTfypnSVKTQAwN4jg50H17SfqCNowBkRdIH4uBrzgCMyuRXqswa2rtzyuXWLyn9S/EQ==
X-Received: by 2002:a17:902:f2c2:b0:141:9ce8:930f with SMTP id
 h2-20020a170902f2c200b001419ce8930fmr9336971plc.68.1639546466465; 
 Tue, 14 Dec 2021 21:34:26 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id h5sm864557pfc.113.2021.12.14.21.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 21:34:25 -0800 (PST)
Date: Wed, 15 Dec 2021 14:34:23 +0900
From: Stafford Horne <shorne@gmail.com>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Message-ID: <Ybl+XwglUy84hFd6@antec>
References: <20211210233456.4146479-1-shorne@gmail.com>
 <cedcb34e-36e3-3bb8-07b7-8412c052b81d@linaro.org>
 <ff7628e1-152e-10a0-d58b-9eabca4fbe12@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ff7628e1-152e-10a0-d58b-9eabca4fbe12@linaro.org>
Subject: Re: [OpenRISC] [PATCH v3 00/13] Glibc OpenRISC port
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
Cc: Florian Weimer <fweimer@redhat.com>,
 Openrisc <openrisc@lists.librecores.org>,
 GLIBC patches <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBEZWMgMTQsIDIwMjEgYXQgMTA6MTk6MDNQTSAtMDMwMCwgQWRoZW1lcnZhbCBaYW5l
bGxhIHdyb3RlOgo+IAo+IAo+IE9uIDE0LzEyLzIwMjEgMTc6MjUsIEFkaGVtZXJ2YWwgWmFuZWxs
YSB3cm90ZToKPiA+IAo+ID4gCj4gPiBPbiAxMC8xMi8yMDIxIDIwOjM0LCBTdGFmZm9yZCBIb3Ju
ZSB2aWEgTGliYy1hbHBoYSB3cm90ZToKPiA+PiBUaGlzIGlzIHRoZSBPcGVuUklTQyBwb3J0IGZv
ciBnbGliYyB0aGF0IEkgaGF2ZSBiZWVuIHdvcmtpbmcgb24uCj4gPj4KPiA+PiBDaGFuZ2VzIHNp
bmNlIHYyOgo+ID4+ICAtIEZpeGVkIHN1Z2dlc3Rpb25zIGZyb20gSm9zZXBoIE15ZXJzOgo+ID4+
ICAgIC0gRml4IGNvbW1lbnQgc3R5bGUsIGFuZCBkZXNjcmlwdGlvbiBvbiB0b3Agb2YgZWFjaCBm
aWxlCj4gPj4gICAgLSBNYWtlIHN1cmUgbWFjcm9zIGhhdmUgcGFyZW50aGVzZXMgd2hlbiBuZWVk
ZWQsCj4gPj4gICAgLSBCdW1wIHJlcXVpcmVkIGtlcm5lbCBkb3duIHRvIDUuNC4wIGFuZCBkb2N1
bWVudAo+ID4+ICAgIC0gUmVnZW5lcmF0ZSBhcmNoLXN5c2NhbGwuaAo+ID4+ICAtIEZpeGVkIHN1
Z2dlc3Rpb25zIGZyb20gQWRoZW1lcnZhbDoKPiA+PiAgICAtIFJlbW92ZSBrZXJuZWxfc3RhdC5o
Cj4gPj4gICAgLSBKdXN0IHNldCBNTUFQMl9QQUdFX1VOSVQgdG8gOEsKPiA+PiAgICAtIFJlbW92
ZSBpb2N0bC5jIGFuZCBzeXNjYWxsLmMgZmlsZXMKPiA+PiAgLSBVcGRhdGUgVENCIGFsaWdubWVu
dCB0byAzMiBieXRlcwo+ID4+Cj4gPj4gQ2hhbmdlcyBzaW5jZSB2MToKPiA+PiAgLSBVcGRhdGUg
YXBpJ3MgYXMgc3VnZ2VzdGVkIGJ5IEZsb3JpYW4KPiA+PiAgLSBSZW1vdmUgaGFyZCBmbG9hdCBz
dXBwb3J0Cj4gPj4gIC0gVXBkYXRlcyB0byBnZXQgYWxsIHRlc3RzIHBhc3NpbmcKPiA+PiAgLSBT
cGxpdCBwYXRjaCBpbnRvIG1hbmFnYWJsZSBiaXRzIHNpbWlsYXIgdG8gcmVjZW50IEFSQyBwb3J0
Cj4gPj4KPiA+PiBEb2N1bWVudGF0aW9uOgo+ID4+Cj4gPj4gICBBcmNoaXRlY3R1cmUgLyBBQkkg
ZG9jczoKPiA+PiAgICBodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vb3BlbnJpc2Mv
ZG9jL21hc3Rlci9vcGVucmlzYy1hcmNoLTEuMy1yZXYxLnBkZgo+ID4+Cj4gPj4gVGVzdCBSZXN1
bHRzOgo+ID4+Cj4gPj4gICBidWlsZC1tYW55LWdsaWJjcy5weToKPiA+Pgo+ID4+ICAgIFBBU1Mg
d2l0aCBtYWlubGluZSBhbmcgZ2NjLTExLgo+ID4+Cj4gPj4gICBGdWxsIHRlc3Qgc3VpdGU6Cj4g
Pj4KPiA+PiAgICBUaGUgZnVsbCBzdWl0ZSBpcyBydW5uaW5nIHVzaW5nIHRoZSBnY2MtMTEgYnJh
bmNoIG9mIEdDQywgbWFpbmxpbmUgc2hvd3MKPiA+PiAgICBpc3N1ZXMgd2l0aCBtYXRoIHNvZnQt
ZnAuCj4gPj4KPiA+PiAgICBOb3RlLCB0aGVyZSBhcmUgYSBmZXcgbW9yZSBmYWlsdXJlcyBjb21w
YXJlZCB0byBiZWZvcmUsIHRoaXMgaXMgZHVlIHRvIG1lCj4gPj4gICAgcnVubmluZyB3aXRoIGEg
dGltZW91dCBvZiAzMCB2cyB1c3VhbCAzMDAuICBJdCBhbGxvd3MgdGhlIHRlc3RzIHRvIGNvbXBs
ZXRlCj4gPj4gICAgZmFzdGVyLCBidXQgSSBnZXQgYSBmZXcgbW9yZSB0aW1lb3V0cy4gIFRoZXJl
IHdlcmUgMTUgdGltZW91dHMgd2hpY2ggSQo+ID4+ICAgIGNvbmZpcm0gZG8gd29yayBpZiBJIGlu
Y3JlYXNlIHRoZSB0aW1lb3V0ZmFjdG9yLiBUaGUgMiByZWFsIGZhaWx1cmVzIG1hcmtlZAo+ID4+
ICAgIHdpdGggKiBiZWxvdy4KPiA+Pgo+ID4+ICAgICAjIHRlc3Qgc3RhcnQ6ICAgIDIwMjEtMTIt
MDhUMTk6NTk6MDArMDk6MDAKPiA+Pgo+ID4+ICAgICAjIGZhaWx1cmVzCj4gPj4gICAgIEZBSUw6
KmVsZi90c3QtYnoxNTMxMQo+ID4gCj4gPiBUaGlzIHNlZW1zIHRvIGJlIGEgcmVhbCBpc3N1ZSwg
dGhlIG91dHB1dCBzaG93cyB0aGUgbmV3IHNvcnRpbmcgYWxnb3JpdGhtIHNlZW1zIAo+ID4gbm90
IGJlIGVuYWJsZWQgKHRoZSBvdXRwdXQgc2hvd3MgdGhlIGRlc3RydWN0b3Igb3JkZXIgZm9yIGR5
bmFtaWNfc29ydD0xKS4gIFdlIAo+ID4gbmVlZCB0byBmaWd1cmUgb3V0IHdoYXQgaXMgaGFwcGVu
aW5nIGhlcmUuCj4gCj4gSXQgZG9lcyBsaWtlIHRoZSBkZXN0cnVjdG9yIG9yZGVyaW5nICBpc3N1
ZSBGbG9yaWFuIGhhcyBwb3N0ZWQgYSBwYXRjaCBbMV0uCj4gCj4gWzFdIGh0dHBzOi8vc291cmNl
d2FyZS5vcmcvcGlwZXJtYWlsL2xpYmMtYWxwaGEvMjAyMS1EZWNlbWJlci8xMzQxNjUuaHRtbAoK
SSBjb25maXJtIGFwcGx5aW5nIHRoZXNlIDIgcGF0Y2hlcyBmcm9tIEZsb3JpYW4gZG9lcyBmaXgg
ZWxmL3RzdC1iejE1MzExIGZvciBtZS4KVGhhbmtzIGZvciB0aGUgaGVhZHMgdXAuCgotU3RhZmZv
cmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJ
U0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlz
dHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
