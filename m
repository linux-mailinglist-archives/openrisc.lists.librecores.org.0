Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id DED3B456E6F
	for <lists+openrisc@lfdr.de>; Fri, 19 Nov 2021 12:46:05 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8A6F3242AC;
	Fri, 19 Nov 2021 12:46:05 +0100 (CET)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mail.librecores.org (Postfix) with ESMTPS id A112924221
 for <openrisc@lists.librecores.org>; Fri, 19 Nov 2021 12:46:03 +0100 (CET)
Received: by mail-pf1-f170.google.com with SMTP id c4so9214500pfj.2
 for <openrisc@lists.librecores.org>; Fri, 19 Nov 2021 03:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=E1I5tqVZIEqjHHr3t4La+KZRTZ2iPOcb856MoPoNeXo=;
 b=SlrS6oLJeznVVrXVGFHg3vvCjMd2DjMZBUK5LfNzBng/lkZyv10DKEiIwbAT4FFB5s
 MRKD7tNYTscksg2w9IYH+I1c+4QTgjZvEEcaPKkKJihJGRrOQHEc5B+1249/rmEnrsij
 7rzNHQXy4atnG453f7O1oZlWiYbKpX78uETLyo5SvIChZ1ygulxogDX0flZXP4bKLROj
 W1gEoSRYrrmVERWuW1n6y6we1dhEV8Y8Shjdh+boDhv/OOcFWL5PKNpf8OJajbAgWQTJ
 RQLYr95HKP18+cYsY8RTGmcPp6vHnGrrL7MizI5GIGS21Rn2gUv6nq9ag9v7e9VvtF6a
 NW1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=E1I5tqVZIEqjHHr3t4La+KZRTZ2iPOcb856MoPoNeXo=;
 b=ZQxBnpyby/u5WN4AUlHt/Ui24t4XE7hOeeb4hnxA/xtavfwe1teT9Qt7KcQw5+rzpw
 sDdJxDYPVa/iZ1SLxhddVwyH9wJoY6fbke40rUrgcQoYkhPK9yWj7AB/sN4kdjnGqQmt
 sAGOrDRvdPezE0jNeZpiTW9x+2eWadZSyvwnNJNuuaMNtwHLQwS1k5ZVe4rZtVptpD3e
 IDXImUmJ7WfpRzycCafG7v12EFriy/uyQi7WUPsX+ih1OJmeGXy4ktwY7z3YlPTqvj/Y
 ZMuMdx5e3teEAE5j48YtXuIG8+QS7elZpssbCUR2or091zaiU/d4M81dnJr6szbHOqlk
 oKBQ==
X-Gm-Message-State: AOAM532C+OBEYA/UIR9AQl3gu3PkTHoL1UvPMFKm0TOq/9l0dKu6znue
 ilBZrVySDObN9JFUltUHLS8=
X-Google-Smtp-Source: ABdhPJw406OBujwXJeGOPQGhGg8/NC5NCnQafPbTJ2qoELlOEQvkVnzHKtHKf82rMHZatGcHA0TeYw==
X-Received: by 2002:a62:750e:0:b0:49f:a27d:62b3 with SMTP id
 q14-20020a62750e000000b0049fa27d62b3mr63284900pfc.37.1637322361699; 
 Fri, 19 Nov 2021 03:46:01 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id m13sm2830741pfk.76.2021.11.19.03.46.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 03:46:00 -0800 (PST)
Date: Fri, 19 Nov 2021 20:45:58 +0900
From: Stafford Horne <shorne@gmail.com>
To: Joseph Myers <joseph@codesourcery.com>
Message-ID: <YZeOdryKnxllpuNk@antec>
References: <20211113031639.2402161-1-shorne@gmail.com>
 <20211113031639.2402161-4-shorne@gmail.com>
 <alpine.DEB.2.22.394.2111182213000.1393807@digraph.polyomino.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2111182213000.1393807@digraph.polyomino.org.uk>
Subject: Re: [OpenRISC] [PATCH v2 03/13] or1k: ABI Implementation
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

T24gVGh1LCBOb3YgMTgsIDIwMjEgYXQgMTA6MTM6NDFQTSArMDAwMCwgSm9zZXBoIE15ZXJzIHdy
b3RlOgo+IE9uIFNhdCwgMTMgTm92IDIwMjEsIFN0YWZmb3JkIEhvcm5lIHZpYSBMaWJjLWFscGhh
IHdyb3RlOgo+IAo+ID4gKy8qIEhlbHBlciBmb3IgZ2VuZXJpYyBfX19fbG9uZ2ptcF9jaGsoKS4g
Ki8KPiAKPiBEb24ndCB1c2UgKCkgYWZ0ZXIgYSBmdW5jdGlvbiBuYW1lIGp1c3QgdG8gaW5kaWNh
dGUgaXQncyBhIGZ1bmN0aW9uLCBhcyAKPiBvcHBvc2VkIHRvIGEgZnVuY3Rpb24gY2FsbCB3aXRo
IG5vIGFyZ3VtZW50cyAoc2VlIHRoZSBHTlUgQ29kaW5nIAo+IFN0YW5kYXJkcykuCgpPSywgc29y
cnkgYWJvdXQgdGhhdCwgSSBrbm93IHRoaXMgYnV0IGRpZG4ndCByZW1lbWJlciB3aGVuIGdvaW5n
IHRob3VnaAp0aGUgcGF0Y2ggb24gbXkgb3duLiAgSSB3aWxsIGdvIHRocm91Z2ggYW5kIGNsZWFu
IHRoaXMgdXAuCgotU3RhZmZvcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29y
ZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
