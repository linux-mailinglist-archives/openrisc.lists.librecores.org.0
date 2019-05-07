Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2EEA216CE2
	for <lists+openrisc@lfdr.de>; Tue,  7 May 2019 23:13:00 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E224128462;
	Tue,  7 May 2019 23:12:59 +0200 (CEST)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mail.librecores.org (Postfix) with ESMTPS id D5864279DA
 for <openrisc@lists.librecores.org>; Tue,  7 May 2019 23:12:58 +0200 (CEST)
Received: by mail-pl1-f173.google.com with SMTP id y3so8798584plp.0
 for <openrisc@lists.librecores.org>; Tue, 07 May 2019 14:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=UXlpVQnzwhHsF6Q9rPA/NvXINYZUeTn2oAzAKDUXrRk=;
 b=tUyceymob/dnJJe2tCEVl2g2i5yRnfSedj95oFswfHzMlhHjFOn2pquKIe7IR6uzD8
 HbS3iuW2/huBKP4lNAYyu5LFfnvNcYCRPNuVLrHQc3tKFZht19lwPU3JPyOTyj7MSb9a
 yOQaNa1RKoO2xtFeazC9BEhXhDt4Pb/IFnb5Z/yo4jvj0uZh1BTLBETv+V9Bt8fFuuvx
 7Gvu+6G2POJ1iytU6Q9uKGL3n+r9dVjQ/8zlzOhrlt4jkz82v5hP2u8emy9nQ2LdBh0k
 MJbHqCcOMfwtqO4upavMvWSNcoYS0h5TPRIFC/W5WBrXTCDElvjPE8iWdNULCURM9PRF
 7pPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=UXlpVQnzwhHsF6Q9rPA/NvXINYZUeTn2oAzAKDUXrRk=;
 b=rmkdbhXAM1XAFqzmLxsurElFeYHuuMj+kPXX41IdpPV+Z5xGTM/pFXs6A7AE3KoMlZ
 YNzB9YA9QMjz8eeTEbgTvddVrGDZussojDHbjhwTYgazmM5IKd3avZdJI0HSCyrYb+Fg
 MSImMswLfz8wdDV/foFaTv5d7UKO6pWZ9ADt44BHHHJMfeO46AjhQHOkL6znBS5tZT2S
 iXyf2GAeHgxqgZ3Pu3fFl/0bsioYGp1M0TQNuL2acHE8JwS36fY/QZAxBLTb/5paAdVK
 TCYT5mhiWgdbL1vDxTcS94jKgqYJXh0xa8/UadVcwyg44jD/CHvbx/72xKlFxq+E8I0i
 mCRA==
X-Gm-Message-State: APjAAAWoRekd7pj2eNdFGAoYEpWO/3Yp1fOuBSSW7a2vSCifAuhxKgLj
 HwQR9hMHjID8QrmtphRPksI=
X-Google-Smtp-Source: APXvYqyPfzUtOVeR61wCMt1akG0PEY0gCnMnAY2dkTNXEZ0BQMfK8gXYjZN0aph7Ez5TY4hB0fBoiQ==
X-Received: by 2002:a17:902:4281:: with SMTP id
 h1mr43478800pld.288.1557263577082; 
 Tue, 07 May 2019 14:12:57 -0700 (PDT)
Received: from localhost (g191.61-115-60.ppp.wakwak.ne.jp. [61.115.60.191])
 by smtp.gmail.com with ESMTPSA id v12sm17894925pfm.186.2019.05.07.14.12.56
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 07 May 2019 14:12:56 -0700 (PDT)
Date: Wed, 8 May 2019 06:12:54 +0900
From: Stafford Horne <shorne@gmail.com>
To: Richard Henderson <rth@twiddle.net>
Message-ID: <20190507211254.GD11006@lianli.shorne-pla.net>
References: <CAAfxs77GkWenpN0s1pM_YeVgNZabBx55fCqLfxoMffTSa-E=cw@mail.gmail.com>
 <afc760d8-0e01-6470-c8d2-6ddc366f3d10@twiddle.net>
 <20190412214843.GB32284@lianli.shorne-pla.net>
 <05413d8c-395c-de51-95f6-cdaa85c834dd@twiddle.net>
 <20190413084708.GC32284@lianli.shorne-pla.net>
 <3D70BAC7A5B64C0E977D84EC118F146E@BAndViG>
 <20190425211702.GG32284@lianli.shorne-pla.net>
 <e441bb74-5cea-6002-c33e-4822f082265b@twiddle.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e441bb74-5cea-6002-c33e-4822f082265b@twiddle.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [OpenRISC] OpenRISC 1.3 spec
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
Cc: BAndViG <bandvig@mail.ru>, Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBNYXkgMDcsIDIwMTkgYXQgMDg6Mjg6NDVBTSAtMDcwMCwgUmljaGFyZCBIZW5kZXJz
b24gd3JvdGU6Cj4gT24gNC8yNS8xOSAyOjE3IFBNLCBTdGFmZm9yZCBIb3JuZSB3cm90ZToKPiA+
IFRoaXMgaXMgaW1wbGVtZW50ZWQgaW4gYmludXRpbHMgbm93LiBTZWUgbXkgcGF0Y2hlcyBoZXJl
Ogo+ID4gCj4gPiAgIC0gaHR0cHM6Ly9naXRodWIuY29tL3N0ZmZyZGhybi9iaW51dGlscy1nZGIv
Y29tbWl0cy9vcmZweDY0YTMyLTMKPiA+IAo+ID4gSSBoYXZlIG5vdCBzcXVhc2hlZCB0aGUgY29t
bWl0cyBiZWNhdXNlIGl0IG1ha2VzIGl0IGEgYml0IGVhc2llciBmb3IgcmV2aWV3aW5nCj4gPiB3
aGF0IEkgZGlkIHRvIGdldCB0aGVzZSBmbGFncyB3b3JraW5nLgo+IAo+IEkndmUgaW1wbGVtZW50
ZWQgdGhpcyBmb3IgcWVtdSwKPiAKPiAgIGh0dHBzOi8vZ2l0aHViLmNvbS9ydGg3NjgwL3FlbXUv
Y29tbWl0cy90Z3Qtb3Ixawo+IAo+IGFsdGhvdWdoIHVudGVzdGVkIHNvIGZhci4gIEkgbmVlZCB0
byByZWdlbmVyYXRlIG15Cj4gY3Jvc3MtdGVzdGluZyBlbnZpcm9ubWVudCBmb3Igb3Ixay4uLgoK
VGhpcyBsb29rcyBnb29kLCBJIGxpa2UgaG93IHlvdSBkbyAockQxICsgckQxT2Zmc2V0ICsgMSkg
aW5zdGVhZCBvZiB3aGF0IEkgd2FzCmRvaW5nIChyRDEgKyAockQxT2Zmc2V0ID8gMiA6IDEgKSku
ICBJIHdpbGwgZml4IG15IG1hdGNoZXMgdG8gdXNlIHlvdXIgbWV0aG9kLgoKQWxzbywganVzdCBh
IHJlbWluZGVyLCB0aGUgbGF0ZXN0IHBhdGNoZXMgZm9yIEdDQyBGUFUgc3VwcG9ydCBhcmUgdXAg
aGVyZS4gIEkKaGF2ZSByZWJhc2VkIHRvIHRoZSA5LjEuMCByZWxlYXNlLiAgQWxzbywgYWRkZWQg
YSBuZXcgUkVHIENMQVNTIGZvciBSRUcgUEFJUlMgdG8KZml4IGFuIGlzc3VlIGZvciB3aGVuIChy
RDEgKyByRDFPZmZzZXQgKyAxKSBvdmVyZmxvd3MuCgogIGh0dHBzOi8vZ2l0aHViLmNvbS9zdGZm
cmRocm4vZ2NjL2NvbW1pdHMvb3Ixay1mcHUtMgoKLVN0YWZmb3JkCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVu
UklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xp
c3RpbmZvL29wZW5yaXNjCg==
