Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E26209B0EE
	for <lists+openrisc@lfdr.de>; Fri, 23 Aug 2019 15:28:33 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9AB872049B;
	Fri, 23 Aug 2019 15:28:33 +0200 (CEST)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by mail.librecores.org (Postfix) with ESMTPS id 3A599200FE
 for <openrisc@lists.librecores.org>; Fri, 23 Aug 2019 15:28:32 +0200 (CEST)
Received: by mail-pl1-f195.google.com with SMTP id c2so5590027plz.13
 for <openrisc@lists.librecores.org>; Fri, 23 Aug 2019 06:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=6DlY4yBUDLuYoB3AZnilydsyu0CKflqiIICzr8eCHrE=;
 b=lzbHv0vVuD7jpwPBqHgqb8uDH2bhojVEznWbFSZi+KyzlU5cdd/Lt6oh8o9NQ31f/a
 jk1X3rsJoWQJWaVT4DUFU3V7QLbDzWPU9GWOahBpht+6HJEzNeEvZTZJW3njB0vKki9e
 GyXwjUwBCX1g9Y2A6BxfbAAj1jFRQkhDeBLXJDQ03iQJ89sWz97eKpsZOML1g58jVroJ
 hQ1h0FTbLFLIOUhD7s4r0rxfWqkYDfBq4a4mCDR1ufPFzdzDFBv22vyZudJY+EC7QbKw
 OekPRtLorAHWwpD3G9aeGl+pTve9SJGGShuwzBX/5nTEkAKCdgpoJUSRNxKSSGQWH4Ul
 taGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6DlY4yBUDLuYoB3AZnilydsyu0CKflqiIICzr8eCHrE=;
 b=Kr7EwXrTIGOds1rfMewCKiODEPEhld3BZM5IaOmejy9h8E4Xj5fEY22YJ/oJbiCPCO
 ZLV5RAwoSNN07Ny2oZjsFpWHfmEjpCPiCxX+F8L8bKGxdY0sJjt4h0tLMUrsISMQZ6Lw
 vY1uyUXsSrabbRvmh+qAhc0Qy0JJkLWLfzjzU2LEQP7IT8WFp5GTiWzjaW0z76lgjFB1
 BiMq3zBrPBUfkfU59w9AuQObiHnM6zQRR+nyARGHHTBC1lvq6fNqjhLX2WCnNrcw+CJ7
 RU8RWufkhYJi8xM8X6ft4szGHlok7ZNwyhnqU8AXs8QgEYCN9X8TY0FM4oQ+xF8d22F+
 VAJA==
X-Gm-Message-State: APjAAAXnh6qu7XMfRH5A2pz9QGRZM/n65vu5inwVZtAEEgnTXr/Q2Pja
 hhPD6mtos7cSB19liK6rOTM=
X-Google-Smtp-Source: APXvYqwA7PsasHFAjxd0JtwwuUYZ+Lz8LFXkU72pL+NvCV695fXRM8Z0T8hluDXnEcYD0ZladEqTbg==
X-Received: by 2002:a17:902:346:: with SMTP id
 64mr4849158pld.151.1566566910387; 
 Fri, 23 Aug 2019 06:28:30 -0700 (PDT)
Received: from localhost (g75.222-224-160.ppp.wakwak.ne.jp. [222.224.160.75])
 by smtp.gmail.com with ESMTPSA id
 r61sm2353985pjb.7.2019.08.23.06.28.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2019 06:28:29 -0700 (PDT)
Date: Fri, 23 Aug 2019 22:28:26 +0900
From: Stafford Horne <shorne@gmail.com>
To: Nick Clifton <nickc@redhat.com>
Message-ID: <20190823132826.GA24874@lianli.shorne-pla.net>
References: <20190822112757.32751-1-shorne@gmail.com>
 <9117019e-3b9c-447e-749d-1200d5b61a12@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9117019e-3b9c-447e-749d-1200d5b61a12@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [OpenRISC] [PATCH] or1k: Fix incorrect value in PLT GOT entries,
 causing infinite loop
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
 GNU Binutils <binutils@sourceware.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgMTA6NTA6MTdBTSArMDEwMCwgTmljayBDbGlmdG9uIHdy
b3RlOgo+IEhpIFN0YWZmb3JkLAo+IAo+ID4gYmZkL0NoYW5nZUxvZzoKPiA+IAo+ID4gCSogZWxm
MzItb3Ixay5jIChvcjFrX2VsZl9maW5pc2hfZHluYW1pY19zeW1ib2wpOiBVc2UgY29ycmVjdCB2
YWx1ZSBmb3IKPiA+IAlQTFQgR09UIGVudHJpZXMuCj4gCj4gQXBwcm92ZWQgLSBwbGVhc2UgYXBw
bHkuCgpEb25lIG5vdy4KClRoYW5rcywKCi1TdGFmZm9yZApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NA
bGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5m
by9vcGVucmlzYwo=
