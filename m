Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B915F4AB59C
	for <lists+openrisc@lfdr.de>; Mon,  7 Feb 2022 08:24:04 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 58D942420E;
	Mon,  7 Feb 2022 08:24:04 +0100 (CET)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mail.librecores.org (Postfix) with ESMTPS id 2E9BF20CF9
 for <openrisc@lists.librecores.org>; Mon,  7 Feb 2022 08:24:03 +0100 (CET)
Received: by mail-pf1-f170.google.com with SMTP id g8so1630530pfq.9
 for <openrisc@lists.librecores.org>; Sun, 06 Feb 2022 23:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mXSlfVDKwMF6om0Lh75ktdNJu0SBDC/xJ2BOT9KSvbk=;
 b=IiY88wbW2bT/FKAhO9Q8+pXHoM8+Dm0ujhhZ7LHC7ZD3usBEdT4zDn2jtqSa0lk7Xv
 OtuYgOHMaOUcDsRnosOy/m7eE13l9AHe5wi/LtmOJwIELfkZnOCYXHCe41RFppwRGQKa
 oWdOcrlq9Bal6R8rnmj84oRYXVyv9OhR1potY2CBx6QsYD89IHuDbkwpFrIN8lbeWKyR
 jv9ALex9BZ65VHyqtNrg+q1/vBF0CGpcOWv9lJuLFW8w72W296lCZfEXk4k16fhTWAhD
 8QGEWAXg2tE0fLDpXEPXnISzSt9BHzpXiHKmkAgZeAZ+02CFG1JN+ddQwMfwzlluGz+5
 xszg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mXSlfVDKwMF6om0Lh75ktdNJu0SBDC/xJ2BOT9KSvbk=;
 b=Z85BmmgSIDfdu9078EyHfZQ8OFzBXUfyQNFnavYVbr8vMMKQPHSxPf6DLjNS2pSFx9
 EhXQXXzEAJyqVRufRyc/VIqmWRapQ/mRNMewbdSdndbv6/Be+4lJOZXZhEWrLzrVEw5p
 xWADMr3pGfqLwGt3om5bdxSAHcdZipsTbA0gGE1S8nFw6C0BvKr55jmVtQ1BM7tlkAaY
 L5/fgYBbGgkGUxs/RVAmpDrZW5YJ3ZXNG1JbED55dogCHxilCrFyBioT3onynPbfg0g1
 /sblMIYKT5GDfCSwOzF5sCCp6lqTJNS9yAFWUeOH7Tg7/wo0ujwUIRe215ii3b+WYetE
 Oomw==
X-Gm-Message-State: AOAM532bqrYVSZzpQReE/LaRHKSH/jWzbWHt7jJCRfZSWRojL90Ja2MW
 fLBGtke8Iz6m72qjmnHnFcw=
X-Google-Smtp-Source: ABdhPJx4yZeZ0Ph+3g4I1Y5TX7BY5YJn3N60mofH9h2it4LUr2NriDhiawvWGFDK+vaEhvRUpjEISA==
X-Received: by 2002:a63:6c84:: with SMTP id h126mr8363072pgc.456.1644218641581; 
 Sun, 06 Feb 2022 23:24:01 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id s17sm10258932pfk.156.2022.02.06.23.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 23:24:00 -0800 (PST)
Date: Mon, 7 Feb 2022 16:23:59 +0900
From: Stafford Horne <shorne@gmail.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <YgDJD4jEA+f2hsHg@antec>
References: <20220206013648.3491865-1-shorne@gmail.com>
 <YgC/8ng5WX6Nt104@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YgC/8ng5WX6Nt104@infradead.org>
Subject: Re: [OpenRISC] [PATCH] openrisc: remove CONFIG_SET_FS
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
Cc: Jonas Bonn <jonas@southpole.se>, Arnd Bergmann <arnd@arndb.de>,
 Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU3VuLCBGZWIgMDYsIDIwMjIgYXQgMTA6NDU6MDZQTSAtMDgwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gU3VuLCBGZWIgMDYsIDIwMjIgYXQgMTA6MzY6NDdBTSArMDkwMCwgU3Rh
ZmZvcmQgSG9ybmUgd3JvdGU6Cj4gPiBSZW1vdmUgdGhlIGFkZHJlc3Mgc3BhY2Ugb3ZlcnJpZGUg
QVBJIHNldF9mcygpIHVzZWQgZm9yIFVzZXIgTW9kZSBMaW51eC4KPiAKPiBUaGlzIGFpbid0IFVN
TCA6KQoKWWVzLCBHZWVydCBhbHNvIGJyb3VnaHQgdGhhdCB1cC4gIEFzIEkgbWVudGlvbmVkIHRo
ZXJlIEkgdG9vayB0aGUgdGV4dCBmcm9tIHlvdXIKY29tbWl0IG1lc3NhZ2UgaW4gY29tbWl0IDhi
YjIyN2FjMzRjMCAoInVtOiByZW1vdmUgc2V0X2ZzIikuCgpJIGRpZG4ndCByZWFsaXplIGFyY2gv
dW0gaXMgZm9yIFVzZXIgTW9kZWwgTGludXgsIEkgYWx3YXlzIHRob3VnaHQgdW0gd2FzIGp1c3QK
c29tZSBvdGhlciBwcm9jZXNzb3IhICBOZXh0LCBJIHRob3VnaHQgeW91ciBjb21tZW50ICd1c2Vk
IGZvciBVc2VyIE1vZGUgTGludXgnCndhcyBqdXN0IHJlZmVycmluZyB0byB1c2VycHNhY2UuCgpO
b3cgSSBnZXQgaXQhCgpJIHdpbGwgZml4IHRoaXMgdXAgaW4gdjIuCgo+ID4gKwlyZXR1cm4gc2l6
ZSA8PSBUQVNLX1NJWkUgJiYgYWRkciA8PSAoVEFTS19TSVpFIC0gc2l6ZSk7Cj4gCj4gTm8gbmVl
ZCBmb3IgdGhlIGlubmVyIGJyYWNlcy4KCllvdSBtZWFuIHRvIGp1c3Qgd3JpdGUgYXM6CgoJcmV0
dXJuIHNpemUgPD0gVEFTS19TSVpFICYmIGFkZHIgPD0gVEFTS19TSVpFIC0gc2l6ZTsKCkkgcHJl
ZmVyIGtlZXBpbmcgdGhlIGJyYWNlcyBhcm91bmQgKFRBU0tfU0laRSAtIHNpemUpLgoKLVN0YWZm
b3JkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5S
SVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xp
c3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
