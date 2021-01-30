Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 77DB83098C2
	for <lists+openrisc@lfdr.de>; Sun, 31 Jan 2021 00:12:00 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1581F210DE;
	Sun, 31 Jan 2021 00:12:00 +0100 (CET)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mail.librecores.org (Postfix) with ESMTPS id 115AF208C2
 for <openrisc@lists.librecores.org>; Sun, 31 Jan 2021 00:11:59 +0100 (CET)
Received: by mail-pg1-f180.google.com with SMTP id j2so7723453pgl.0
 for <openrisc@lists.librecores.org>; Sat, 30 Jan 2021 15:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=CYA0tZdulAeLRu+0Pp0MVAixuCTU0DdOiWTCQ56oUqM=;
 b=h1G+rtZyEkJgVGFy+4LV6fzraYMfMcLjxA/yM2w/uDee2p5RhlWmzh+LJDCdTEXXr3
 KBBhiXEUVhVcSi/SR7vhRaz9xFitaj8lt38FKYH0zq6Nhb78BTF5gWuXPctPssix2MeK
 W5fOuWK1jmPuwPvXaaklSWL6rw5vrSBh5m4uYMizecDziBS6d4Bwyo8A+04hdLpAbDEX
 G4s7M7YBb/27drL/413soNFjEIeLZBAchclHS11fIY1yvR+OjOk2AMc0NLqDuRH3zDuv
 atZKbggZBCKdxMELkX8YZlnzC7fa+i5tED052mdzluid5ARWI1zRiRhmsYshp9OKC4n1
 oKGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CYA0tZdulAeLRu+0Pp0MVAixuCTU0DdOiWTCQ56oUqM=;
 b=KO8gabrydfSC14Utc0OYo9cqjNGUre1A+bUbsz16rbvYIYwgwUzaOryF9Opee/9h2+
 EyIP+42JH3g6ipPNU00WG7B83j5N3pnYEoCFzaakcVhL2VSm3kGjVrIEcEcC/AanRsj6
 TgfeT0+vRRVBcDwSkwQwUZc98FE3sYNZ6gUNgNVbHzz7aAYkdVcqA+Xvw/qB1f2oukU1
 zBEcKDDwuO/fsmUd0+qL1MocnnSNdm+RNtTCw4MK6mDS5zVGZ4AkDOxkWJVXXlB82GKx
 ODmyuQKka8tl9PUgUn4CqQgTsvwYrUzZ5k1BYqUSU7i34Jiw8gidTg+tekpBSiWe9n8v
 iUPw==
X-Gm-Message-State: AOAM5331hkotEWUGou2MNtGkM+h2z061cdFHNgXatTGn1Xbo2GJhcpDX
 nUOsQx6fJHrkwqEQd0wo0KY=
X-Google-Smtp-Source: ABdhPJx/iEHYhd/6O+deSAIOj4vqbt+OOVI+STFkXV+vrycpVvU54wAvuIoIjPdWMzvHHneYNQlcoQ==
X-Received: by 2002:a63:db54:: with SMTP id x20mr10273751pgi.200.1612048317710; 
 Sat, 30 Jan 2021 15:11:57 -0800 (PST)
Received: from localhost (g54.222-224-210.ppp.wakwak.ne.jp. [222.224.210.54])
 by smtp.gmail.com with ESMTPSA id
 lw17sm10090959pjb.11.2021.01.30.15.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 15:11:56 -0800 (PST)
Date: Sun, 31 Jan 2021 08:11:55 +0900
From: Stafford Horne <shorne@gmail.com>
To: Jan Henrik Weinstock <jan.weinstock@rwth-aachen.de>
Message-ID: <20210130231155.GD2002709@lianli.shorne-pla.net>
References: <0b26eda7-229d-3dc9-f2ae-19b9212fb0ea@rwth-aachen.de>
 <20210129221643.GZ2002709@lianli.shorne-pla.net>
 <2a018afc-d797-3a91-ffab-e55ae3b0a795@rwth-aachen.de>
 <20210130230310.GC2002709@lianli.shorne-pla.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210130230310.GC2002709@lianli.shorne-pla.net>
Subject: Re: [OpenRISC] [PATCH] openrisc: use device tree to determine
 present cpus
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
Cc: jonas@southpole.se, openrisc@lists.librecores.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

U29ycnksIFBsZWFzZSBkaXNyZWNhcmQgdGhlIGdAbGlhbmxpLnNob3JuZS1wbGEubmV0IGFkZHJl
c3MgaW4gdGhlIG1haWwKZGlzdHJpYnV0aW9uIGxpc3QuICBJIG11c3QgaGF2ZSBpdCBhIGluY29y
cmVjdCBidXR0b24uCgogLVN0YWZmb3JkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJy
ZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNj
Cg==
