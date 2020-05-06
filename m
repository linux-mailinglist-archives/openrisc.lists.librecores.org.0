Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 4B2001C7CFD
	for <lists+openrisc@lfdr.de>; Thu,  7 May 2020 00:03:32 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B1CE420AD6;
	Thu,  7 May 2020 00:03:31 +0200 (CEST)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mail.librecores.org (Postfix) with ESMTPS id 1607D205F5
 for <openrisc@lists.librecores.org>; Thu,  7 May 2020 00:03:30 +0200 (CEST)
Received: by mail-pj1-f41.google.com with SMTP id mq3so1678477pjb.1
 for <openrisc@lists.librecores.org>; Wed, 06 May 2020 15:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=nJP4OY+XpQjdk6tcYOvD77JwdZZjm/J01X2qdD6AaY4=;
 b=FFuxl51O7K7iRKHtX6mKMkpP+6w4IXn5jyH8pruxvHbJ3ksW29QC2PUtXmpUykveZM
 2F6F8bRf9ArsTPfPq8TLV6PVi0yfR9ftfHVZ9Y9Wi6ijQZlbpdxI6NLXcefiZc0bGaLC
 eu/L+1x1zFHvENbHIdfLhxNveXwCYozOlBOOwV/GnbilCnsEuTanI4u0rChNfOg1iUnd
 9lvu6biePSioRWGVZgbLm8GsmK4+ZFdAI8d0Zw7oqE36/ZQGu0o8Pa57DefYQOq25mkX
 tPihwSjiPOP2XNnD3C19M3QWDJ55Pbl0AO/QXIdpnslVDp9uNIwstNTWkXpOhHNbfuyK
 H/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=nJP4OY+XpQjdk6tcYOvD77JwdZZjm/J01X2qdD6AaY4=;
 b=WPB/pETYgsATqos3WPADJm9v83JitIiOKyg7meqmP90QGLgfX54Viz4h51kBHsh2sI
 khf8I6cVGtv+q5Wxq8pHucwIV4RSb/2Lh4V/GkohLc+TNx+t7/wBYIAPcvucqvxS7CXh
 sc0rUfCbjRhk2974CaGeJzwhkPnypCLIMMJFcSruO555aFyqlBdVE+TRTUMyb9xnkos6
 C0rhsGNkP7ELNe1j16tD/lZ5WOkGxzQyaVVVQUlDPgpTm6PXJTuIZSZHOIehDBdtHlIC
 4p82A/6dlaUYSPBJuVAcPgSfWbNDwJkV2+OjMHiRjkcEmGDSOP5hpnK6jQ+0yoMG+2ss
 ClMQ==
X-Gm-Message-State: AGi0PuZvgFRxX9WKK/tl5x0HUJiWJ11Br/wTsaCVSkR6ozuxs7xr8XfU
 Br7aSSRhDcUxuJHlIyvZnc/b7Swv
X-Google-Smtp-Source: APiQypIwdsFXRnoQPhrtU4xXJEdqLIpxXz3arXHQd3SKhdy+bSmaqr08c3gZwDm5sw0cab5WKcIUCg==
X-Received: by 2002:a17:90a:db53:: with SMTP id
 u19mr11745233pjx.41.1588802606513; 
 Wed, 06 May 2020 15:03:26 -0700 (PDT)
Received: from localhost (g220.222-224-186.ppp.wakwak.ne.jp. [222.224.186.220])
 by smtp.gmail.com with ESMTPSA id s9sm2883918pfc.179.2020.05.06.15.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 15:03:25 -0700 (PDT)
Date: Thu, 7 May 2020 07:03:23 +0900
From: Stafford Horne <shorne@gmail.com>
To: Openrisc <openrisc@lists.librecores.org>
Message-ID: <20200506220323.GB2550@lianli.shorne-pla.net>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: [OpenRISC] OpenRISC: User mode writing to FPCSR
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
Cc: Andrey Bacherov <bandvig@mail.ru>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGVsbG8sCgpOb3cgdGhhdCBJIGFtIHdyaXRpbmcgdGhpcyBlbWFpbCwgSSBwcm9iYWJseSBzaG91
bGQgYmUgd3JpdGluZyBhIHNwZWMKY2hhbmdlIHByb3Bvc2FsIChodHRwczovL29wZW5yaXNjLmlv
L2FyY2hpdGVjdHVyZSkuCgpBbnl3YXksICB3aGlsZSB3b3JraW5nIG9uIHRoZSBnbGliYyBwb3J0
IGZvciBPcGVuUklTQyBJIGZpbmQgdGhhdCBwcmV0dHkgbXVjaApldmVyeSBhcmNoaXRlY3R1cmUg
YWxsb3dzIHJlYWRpbmcgYW5kIHdyaXRpbmcgdG8gdGhlIGZsb2F0aW5nIHBvaW50IGNvbnRyb2wK
cmVnaXN0ZXIgKGluIG9wZW5SSVNDIEZQQ1NSKSBpbiB1c2VybGFuZC4gIFRoaXMgaXMgdXNlZCBi
eSB1c2VybGFuZCB0byBjb250cm9sCnRoZSByb3VuZGluZyBtb2RlIGFuZCBleGNlcHRpb24gcmVh
ZGluZyBhbmQgY29udHJvbGxpbmcgb2YgdGhlIEZQVS4KCkhvd2V2ZXIsIG9uIE9wZW5SSVNDIHRo
aXMgaXMgb25seSB3cml0YWJsZSBpbiBzdXBlcnZpc29yIG1vZGUuICBXZSBjYW4gcmVhZCBpdApi
eSBlbmFibGluZyBhIGZsYWcgaW4gdGhlIFNSLiAgQnV0IG5vdCB3cml0ZSB0byBpdC4KCkkgcHJv
cG9zZSB0aGF0IHdlIGVpdGhlcjoKCiAgMS4gQWxsb3cgYm90aCByZWFkIGFuZCB3cml0ZSB0byBG
UENTUiBpcyBTUltTVU1SQV0gaXMgc2V0LiAocHJlZmVycmVkKQogIDIuIENyZWF0ZSBhIG5ldyBm
bGFnIGluIFNSIHRvIGVuYWJsZSBGUENTUiB3cml0aW5nLgoKVGhpcyB3aWxsIHJlcXVpcmUgY2hh
bmdlcyB0bzoKCiAtIFRoZSBTUEVDCiAtIExpbnV4IEtlcm5lbCBwcmVzZXJ2ZSBGUENTUiBkdXJp
bmcgY29udGV4dCBzd2l0Y2hlcwogLSBRZW11IHRvIGFsbG93IHdyaXRlcyB0byBGUENTUiAoSSBo
YXZlIGRvbmUgcGFydCBvZiB0aGlzIGFscmVhZHksIGFzIGl0cwogICBuZWVkZWQgZm9yIGdsaWJj
IHRlc3RpbmcpCiAtIE90aGVyIHNpbXVsYXRvcnMuCiAtIE1vcjFreCBhbmQgTWFyb2NjaGlubyB2
ZXJpbG9nIGNvcmVzCgpEb2VzIHRoaXMgc291bmQgcmVhc29uYWJsZT8KCnAucy4gYW5vdGhlciBh
cHByb2FjaCB3b3VsZCBiZSB0byBhZGQgYSBzeXNjYWxsIGZvciBzZXR0aW5nIHRoZSBmcGNzciwg
YnV0IEkKZG9uJ3QgdGhpbmsgdGhhdCBpcyB2ZXJ5IGdvb2QsIGFzIHdlIHdvdWxkIHN0aWxsIG5l
ZWQgdG8gc3VwcG9ydCBzYXZpbmcgZnBjc3IKZHVyaW5nIGNvbnRleHQgc3dpdGNoZXMgZm9yIGl0
IHRvIHdvcmsuCgotU3RhZmZvcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29y
ZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
