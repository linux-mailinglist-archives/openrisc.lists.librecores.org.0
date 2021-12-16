Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC30477C99
	for <lists+openrisc@lfdr.de>; Thu, 16 Dec 2021 20:33:43 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 04C55242EB;
	Thu, 16 Dec 2021 20:33:43 +0100 (CET)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by mail.librecores.org (Postfix) with ESMTPS id 65DCF242E3
 for <openrisc@lists.librecores.org>; Thu, 16 Dec 2021 20:33:41 +0100 (CET)
Received: by mail-qv1-f50.google.com with SMTP id o10so269080qvc.5
 for <openrisc@lists.librecores.org>; Thu, 16 Dec 2021 11:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WuXdLM9N3iEvloRdmc2shvjOid4dFieyffEUCqKo2eM=;
 b=bhEaFFjGULsGmTJ57RLhXnESdpGRnQxKFT27wFTvp8zECT50haOduAu2GVbTKnMkej
 e6573X/3geoSduufDqdTtPCHYVhbYCAJmzJIjCecW0beQwtnEtEBBmwRTYZlIAoFzVst
 Yluk8XE0JN2TCNfmeOFeNG0MPTG0AicD+x975ZvoVpixA1lmNUV2sZzLCdUAoPEsZDBt
 /c44f7hoRCj95vyv5XDQOVyTaoIIiGxm/izy5VvBGZg/FhWF1siNmcvolpLbsk03FsK3
 Lz43XOpoTSCTlMKUsfSIDcv50cwMiVy66BAWaKeNwFFU1CyOPUc+Ce45eHpTWe2mzNoJ
 +lIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WuXdLM9N3iEvloRdmc2shvjOid4dFieyffEUCqKo2eM=;
 b=JirJqIBNewjWh7FHCKtyS8w3cg3g2E3ggHinOxETkUYTPethiPu9uOaQmIDfdMoA/F
 YP370W0+xWMm7p+xsAaqqGsVuzbS2NuH5neu/xQ0eOcjpImmMQ3bD9RL2GbLwohy9rUu
 JQwAK20ddJ93hoZXHl8kaRKvqKsk/ZD+plavGZm8lqU9NEt/qctHmTxPGbY6q+6lnzZv
 g9r4DvzvFL/s65bodDwwPSnuPa1mTVOdmNwABfri5yxlN3dxFlDuNx/6y3keMbrAsDn3
 9juX+vsAA8hSOfEC7VY+7awRLE/w58FEpARI2RnnPxNPzT/lOtz4hd0eT8MaqewC9DQt
 IVmQ==
X-Gm-Message-State: AOAM530eoPsS/IAy7peY+vI5fTLIscg+O9J/6c3/bH3mBI8dbu3bcAV0
 bk32x9ReYhLI6Xe3Ucdrx9YANg==
X-Google-Smtp-Source: ABdhPJyGBTsan7ToJ9JOetJ9ufQQo6Wsg4+v0NYIIGVy+DvU4VFx06Dicp7NfM3TVZNRtHIa5t6NCQ==
X-Received: by 2002:a05:6214:1cc5:: with SMTP id
 g5mr17436672qvd.119.1639683220229; 
 Thu, 16 Dec 2021 11:33:40 -0800 (PST)
Received: from ?IPV6:2804:431:c7ca:103f:96e9:fe91:2aff:a44d?
 ([2804:431:c7ca:103f:96e9:fe91:2aff:a44d])
 by smtp.gmail.com with ESMTPSA id bs7sm3330618qkb.79.2021.12.16.11.33.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 11:33:39 -0800 (PST)
Message-ID: <b0cf349f-4ff5-0cd0-58a6-8337961ece1b@linaro.org>
Date: Thu, 16 Dec 2021 16:33:37 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: Joseph Myers <joseph@codesourcery.com>
References: <20211210233456.4146479-1-shorne@gmail.com>
 <20211210233456.4146479-6-shorne@gmail.com>
 <2e024bfa-b5c2-2444-1b64-ca8f63e932b6@linaro.org>
 <alpine.DEB.2.22.394.2112161921110.1715763@digraph.polyomino.org.uk>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
In-Reply-To: <alpine.DEB.2.22.394.2112161921110.1715763@digraph.polyomino.org.uk>
Subject: Re: [OpenRISC] [PATCH v3 05/13] or1k: Thread Local Storage support
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

CgpPbiAxNi8xMi8yMDIxIDE2OjI2LCBKb3NlcGggTXllcnMgd3JvdGU6Cj4gT24gVGh1LCAxNiBE
ZWMgMjAyMSwgQWRoZW1lcnZhbCBaYW5lbGxhIHZpYSBMaWJjLWFscGhhIHdyb3RlOgo+IAo+Pj4g
Ky8qIERlZmF1bHQgdG8gYW4gZXhlY3V0YWJsZSBzdGFjay4gIFBGX1ggY2FuIGJlIG92ZXJyaWRk
ZW4gaWYgUFRfR05VX1NUQUNLIGlzCj4+PiArICAgcHJlc2VudCwgYnV0IGl0IGlzIHByZXN1bWVk
IGFic2VudC4gICovCj4+PiArI2RlZmluZSBERUZBVUxUX1NUQUNLX1BFUk1TIChQRl9SIHwgUEZf
VyB8IFBGX1gpCj4+Cj4+IERvIHlvdSByZWFsbHkgYSBkZWZhdWx0IHN0YWNrIGV4ZWN1dGFibGU/
IEl0IGlzIG9ubHkgZG9uZSBmb3Igb2xkZXIgQUJJcyAKPj4gYW5kIHRoYXQncyB3aHkgUFRfR05V
X1NUQUNLIHdhcyBjcmVhdGVkLiBOZXdlciBwb3J0cywgbGlrZSBhcmMgYW5kIGNza3kgCj4+IGFz
c3VtZXMgb3RoZXJ3aXNlLgo+IAo+IEkgdGhpbmsgdGhpcyByZWZsZWN0cyB3aGF0IHRoZSBrZXJu
ZWwgZG9lcyAodGhlIHJlbGV2YW50IGRlZmluaXRpb25zIGJlaW5nIAo+IGVsZl9yZWFkX2ltcGxp
ZXNfZXhlYyBhbmQgVk1fU1RBQ0tfREVGQVVMVF9GTEFHUyAvIFZNX0RBVEFfREVGQVVMVF9GTEFH
UywgCj4gbm9uZSBvZiB3aGljaCBhcmUgb3ZlcnJpZGRlbiBmb3Igb3BlbnJpc2MsIHNvIHRoZSBk
ZWZhdWx0IAo+IFZNX0RBVEFfREVGQVVMVF9GTEFHUyBkZWZpbml0aW9uIG9mIFZNX0RBVEFfRkxB
R1NfRVhFQyBhcHBsaWVzKS4KPiAKCkZhaXIgZW5vdWdoLCB0aGlzIHBhcnQgaXMgY29ycmVjdCB0
aGVuLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVu
UklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9s
aXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
