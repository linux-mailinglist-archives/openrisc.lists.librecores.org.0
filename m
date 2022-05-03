Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 763175180D8
	for <lists+openrisc@lfdr.de>; Tue,  3 May 2022 11:19:35 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 20217248F0;
	Tue,  3 May 2022 11:19:35 +0200 (CEST)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mail.librecores.org (Postfix) with ESMTPS id 4B706247E5
 for <openrisc@lists.librecores.org>; Tue,  3 May 2022 11:19:33 +0200 (CEST)
Received: by mail-pg1-f174.google.com with SMTP id v10so13566763pgl.11
 for <openrisc@lists.librecores.org>; Tue, 03 May 2022 02:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=i90u9FWtuT9KsoF3yacMMNTaSW6l4P+xlhV+WVW3ggU=;
 b=HiTHQo4FxMXATb10nP1zwvTyXEiiC8bdJ3i2gB1YCIkJxmB02zhK3ELBzFm723FEnj
 Jsp5Hw13VbOu1o93TVWr/WGlVHgHmQqI7QkbbX7+UxDy0bAJdO2EXzv2Vzb7dwffVCiP
 QoQU9s5grdf44pUQIKa+FCGwN9+sTvyxRAtG8Pm0rkHP91At+VsQvzEaZpZ46i8JD3jA
 u0ouVWRUJxUOj4sWV0ZAiKxCeGKGd2nwREmcN7er6jYRaquKFPyztWrJsyd8c4yI+csw
 SuEWw5w80h56rvTkDzBpQWu8NKjCp07Knx0i6Ao6kVHNsU4kPFd77Ds3ginIHycYa0eR
 224g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=i90u9FWtuT9KsoF3yacMMNTaSW6l4P+xlhV+WVW3ggU=;
 b=c145blJsWXA4KqGyWztfPSZ2C6puLNgy6MutLBf18n7/UAOcInwLeb2NKXvUAAIujW
 2UNrcS0ZONkIcUP8AqHha9HG2GiEpj3Jp8BnKOQwSKT6zBCYEymrbQeDK+9YO6E6esrM
 OWObZv8hJpeFaYR2sEj14PpVgTsLZd3ALflLHN+udTvG+zIbaGOEN26O2GrMmasIHz+c
 +fBvQbJ1x9lPgdjw5XDPMEJE9Q9AaS6izthg9CWaxYSLlJm4wZdJhl6mbnkUEMBM8Ctg
 PySuUCrxhKoCYL+6Mx+8fqddLbbMtaP9Wojjv47tBr7Au39s7N2lW65izr1fez4CVrcC
 IE0g==
X-Gm-Message-State: AOAM530A+wEK/wf8p3knJOWc9PjCk18MeT7wDACF7lew7kuTOROiPI3A
 tcyaodtC0D/5P3wH5F2ZS1EP9cWWVZI=
X-Google-Smtp-Source: ABdhPJwhiIAQ5uhhL9wWfUrdziBQDIFdAxhNkphjIq+gaDmxbDGAEKdJbZWz/BkfGQPo27C4bN7JLw==
X-Received: by 2002:a63:6a45:0:b0:3c1:47b7:edce with SMTP id
 f66-20020a636a45000000b003c147b7edcemr12847164pgc.207.1651569571518; 
 Tue, 03 May 2022 02:19:31 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a170902864500b0015e8d4eb229sm5905731plt.115.2022.05.03.02.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 02:19:30 -0700 (PDT)
Date: Tue, 3 May 2022 18:19:29 +0900
From: Stafford Horne <shorne@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <YnDzoWHqpYcCWTVs@antec>
References: <20220502232800.259036-1-Jason@zx2c4.com>
 <c6d3a823-b9a4-411a-b4b8-5fb1f1c9c214@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c6d3a823-b9a4-411a-b4b8-5fb1f1c9c214@linaro.org>
Subject: Re: [OpenRISC] [PATCH] hw/openrisc: use right OMPIC size variable
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, openrisc@lists.librecores.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBNYXkgMDIsIDIwMjIgYXQgMDQ6NTk6NDdQTSAtMDcwMCwgUmljaGFyZCBIZW5kZXJz
b24gd3JvdGU6Cj4gT24gNS8yLzIyIDE2OjI4LCBKYXNvbiBBLiBEb25lbmZlbGQgd3JvdGU6Cj4g
PiBUaGlzIGFwcGVhcnMgdG8gYmUgYSBjb3B5IGFuZCBwYXN0ZSBlcnJvci4gVGhlIFVBUlQgc2l6
ZSB3YXMgdXNlZAo+ID4gaW5zdGVhZCBvZiB0aGUgbXVjaCBzbWFsbGVyIE9NUElDIHNpemUuCj4g
PiAKPiA+IFNpZ25lZC1vZmYtYnk6IEphc29uIEEuIERvbmVuZmVsZDxKYXNvbkB6eDJjNC5jb20+
Cj4gPiAtLS0KPiA+ICAgaHcvb3BlbnJpc2Mvb3BlbnJpc2Nfc2ltLmMgfCAyICstCj4gPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IFJldmlld2Vk
LWJ5OiBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4KClRo
YW5rcywKCkkgd2lsbCBxdWV1ZSB0aGlzIG9uZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3Rz
LmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3Bl
bnJpc2MK
