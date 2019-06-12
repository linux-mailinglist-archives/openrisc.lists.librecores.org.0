Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 330C44271B
	for <lists+openrisc@lfdr.de>; Wed, 12 Jun 2019 15:11:37 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id DDF092026E;
	Wed, 12 Jun 2019 15:11:36 +0200 (CEST)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by mail.librecores.org (Postfix) with ESMTPS id 4F24620240
 for <openrisc@lists.librecores.org>; Wed, 12 Jun 2019 15:11:35 +0200 (CEST)
Received: by mail-pl1-f194.google.com with SMTP id i2so6628070plt.1
 for <openrisc@lists.librecores.org>; Wed, 12 Jun 2019 06:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ETjzKHkGSuX3vwKOaddww0aBB6AiCP5kll3MMdJ+Yf8=;
 b=XB+uE9kBjbfKhmkC5PBDe/1M3vfoYhSZJc0Vhmw5iy3qOCAS2zHeCbimmJNawrCUFx
 D6XzrjKdPu6mf1HURblfF8ZhFICtmtEYZ11pffw4g/dms1RsE0UvuQtFTBLWypS1YuoU
 XyOeZ4KCBNQ34Bp7wEJpdYlBrKG9hPPgTnqO+a1SALGd+Bxu/X5uZRDlHFYnBJE56b97
 lI1uwvtg+SoDt8+fSJQGhkJU/rgbYFYjiFPR0Kh+9YTKd041b0x4MQb4FMlWiXPjNDVi
 N6WpZMm/yn8ZKIeJ0nnJl5BHDeh69lbIDZJ1G2BkUvNFXL4uElfcNH3p91v5SO0wPBdr
 RZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ETjzKHkGSuX3vwKOaddww0aBB6AiCP5kll3MMdJ+Yf8=;
 b=I2XU3S7iZIpdRm7VZYfMj6t67x18sTK15Jle6iKg5uN0jCrw8zWXZOfivAwEmE6qmG
 Ju07p/YYhefGk366bR6b7nDCxMtIxPX0JfewiosAexIeQ0OMiRXJUl26qTIThxZVNVDq
 vuK3wwIfOXv8UAK1B04GO0BWUSZyEUL8I/QhOSq1E7hPZ+05egIedLtEdPahvf+ogg11
 CA3Pfq6yi5DYCrFLNi1uOWVWLCAI1d49pOZQHxIWJxvJxXMfbrGEoWZjNlsGRJrWMFEK
 grZaWkSMYQSCx1Ecp5m8+diOS3xD57cWPEFv/5/EXHSzl27Bt5TGSzz5JEyefUBPggvc
 agDw==
X-Gm-Message-State: APjAAAV4/SJPuMH4AxzG2AiH7UQR6znDS4yQkI75R3CzlabDhXr/xUI6
 iutvP4KqQsEKwGnatVscZik=
X-Google-Smtp-Source: APXvYqwvJYKbhuXaTd6tKpBeql1aKRYZKg9dNPnPCmjXpTotKGxIRbF+sEYNUiZtaFH6Glw5zQO5yA==
X-Received: by 2002:a17:902:403:: with SMTP id 3mr80460124ple.66.1560345093871; 
 Wed, 12 Jun 2019 06:11:33 -0700 (PDT)
Received: from localhost (g30.211-19-85.ppp.wakwak.ne.jp. [211.19.85.30])
 by smtp.gmail.com with ESMTPSA id a16sm33668103pfd.68.2019.06.12.06.11.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 12 Jun 2019 06:11:33 -0700 (PDT)
Date: Wed, 12 Jun 2019 22:11:31 +0900
From: Stafford Horne <shorne@gmail.com>
To: Andrew Burgess <andrew.burgess@embecosm.com>
Message-ID: <20190612131131.GC2358@lianli.shorne-pla.net>
References: <20190610204940.3846-1-shorne@gmail.com>
 <20190610204940.3846-2-shorne@gmail.com>
 <20190611214912.GT23204@embecosm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190611214912.GT23204@embecosm.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [OpenRISC] [PATCH v3 11/11] sim/testsuite/or1k: Add tests for
 unordered compares
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
Cc: Nick Clifton <nickc@redhat.com>, Openrisc <openrisc@lists.librecores.org>,
 GNU Binutils <binutils@sourceware.org>, Andrey Bacherov <bandvig@mail.ru>,
 GDB patches <gdb-patches@sourceware.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMTA6NDk6MTJQTSArMDEwMCwgQW5kcmV3IEJ1cmdlc3Mg
d3JvdGU6Cj4gKiBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4gWzIwMTktMDYtMTEg
MDU6NDk6NDAgKzA5MDBdOgo+IAo+ID4gQWRkIHRlc3RzIGZvciAzMi1iaXQgYW5kIDY0LWJpdCB1
bm9yZGVyZWQgY29tcGFyZSBpbnN0cnVjdGlvbnMuCj4gPiAKPiA+IHNpbS90ZXN0c3VpdGUvc2lt
L29yMWsvQ2hhbmdlTG9nOgo+ID4gCj4gPiB5eXl5LW1tLWRkICBTdGFmZm9yZCBIb3JuZSAgPHNo
b3JuZUBnbWFpbC5jb20+Cj4gPiAKPiA+IAkqIGZwdS11bm9yZGVyZWQuUzogTmV3IGZpbGUuCj4g
PiAJKiBmcHU2NGEzMi11bm9yZGVyZWQuUzogTmV3IGZpbGUuCj4gCj4gVGhpcyBpcyBmaW5lIHdp
dGggdGhlIG5pdHMgYmVsb3cgZml4ZWQuCgpTdXJlLCBJIHdpbGwgZml4IHRoZW0uICBQbGVhc2Ug
bm90ZSB0aGVyZSBhcmUgb3RoZXIgcGF0Y2hlcyBmb3IgdGhlIHNpbSB0aGF0CmhhdmUgYmVlbiB1
cGRhdGVkIChtb3N0bHkgcmVnZW5zIGZyb20gdGhlIGJpbnV0aWxzIHVwZGF0ZXMpLgoKQWxzbywg
dGhpcyBhbGwgZGVwZW5kcyBvbiBhIGNnZW4gcGF0Y2ggYXMgd2VsbCB0aGF0IGlzIHBlbmRpbmcg
cmV2aWV3LiAgU28gSQp3aWxsIHdhaXQgdG8gY29tbWl0IHVudGlsIGNnZW4gaXMgcmV2aWV3ZWQu
CgotU3RhZmZvcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0
dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
