Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 0071651B28B
	for <lists+openrisc@lfdr.de>; Thu,  5 May 2022 01:20:05 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9D705248F5;
	Thu,  5 May 2022 01:20:05 +0200 (CEST)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by mail.librecores.org (Postfix) with ESMTPS id 1528823E0C
 for <openrisc@lists.librecores.org>; Thu,  5 May 2022 01:20:04 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9985CB82733;
 Wed,  4 May 2022 23:20:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3D84C385A5;
 Wed,  4 May 2022 23:20:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="KTM0gyBp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1651706400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bKkCVVabyR0xZiqzEwLNse/7F7cIokCI/3IfoTyQOnc=;
 b=KTM0gyBp1TAHxlaJ336yyFFAyVIYJP8Hh0PxVGcHxWqz0yQEQp75i804P5dTj+bT0Mf9GO
 10NEx0O13WfwUr2GZm6apS2wYssQS9L/37U3FODa0OqYjUfG2JQBss3MhJxRRwPsGFu/h2
 NCDlri9kln3DbxMWg1vs5UB/fGtxzXI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 771c9d88
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Wed, 4 May 2022 23:19:59 +0000 (UTC)
Date: Thu, 5 May 2022 01:19:57 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Stafford Horne <shorne@gmail.com>
Subject: Re: [PATCH] openrisc: remove bogus nops and shutdowns
Message-ID: <YnMKHdRy/GkAB+9e@zx2c4.com>
References: <20220504110911.283525-1-Jason@zx2c4.com> <YnL9MuVLtiGWD2EV@antec>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YnL9MuVLtiGWD2EV@antec>
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
Cc: openrisc@lists.librecores.org, linux-kernel@vger.kernel.org
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

On Thu, May 05, 2022 at 07:24:50AM +0900, Stafford Horne wrote:
> On Wed, May 04, 2022 at 01:09:11PM +0200, Jason A. Donenfeld wrote:
> > Nop 42 is some leftover debugging thing by the looks of it. Nop 1 will
> > shut down the simulator, which isn't what we want, since it makes it
> > possible to handle errors.
> 
> Do you mean impossible to handler errors?

Whoops, yes.

> 
> > Cc: Stafford Horne <shorne@gmail.com>
> > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> 
> This looks good to me, I didn't add these debug's I think we can remove them.
> 

