Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 062E76340E8
	for <lists+openrisc@lfdr.de>; Tue, 22 Nov 2022 17:09:07 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id AB5B524B13;
	Tue, 22 Nov 2022 17:09:06 +0100 (CET)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by mail.librecores.org (Postfix) with ESMTPS id 21170248F8
 for <openrisc@lists.librecores.org>; Tue, 22 Nov 2022 17:09:05 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id C39C95C0227;
 Tue, 22 Nov 2022 11:09:03 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute3.internal (MEProxy); Tue, 22 Nov 2022 11:09:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1669133343; x=1669219743; bh=wZK3t3HJow
 uFDWWGw35sZXrKQvEJ+7CgMyEoa9LFdzU=; b=VJe90TpP8RTK/QIc9GYtYkcCUZ
 +dEh/AVzio7FnM6vOUOGILTy/lJLNmo0eUoaRKaNX7wOMNDcj6PGsLzJdTKWIA1Y
 ocL6zpc+LmWdC42Rv+vRiDp2qo+rMK/XIxkUIA5/5B6moDqi3JA2tIArMAXKVI5Z
 y+w/3ANCtq+anryHgvhan6n7FNKAI/qagkicw5BqSnF58oR1uRSOIDcIKbBJvlMv
 8ZR2kkDXqeCR8yMqw3O1QlH3/xQV1iEva4MJPhWidiQLRRPDRbN/CRPDtgEGRn+r
 yKO+X6qSrDfHn9eMGl51NT10Fy43tHcDMYXosb/i32a5tteD94Bvm/dzxYZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1669133343; x=1669219743; bh=wZK3t3HJowuFDWWGw35sZXrKQvEJ
 +7CgMyEoa9LFdzU=; b=syTAPF1p89+UW5y1g6ux+3sD01Vq+0vTrH29QD0K56Q4
 4qlJyDdoP4QdH+3Ne2ukfRXOs7dE9f7PsBchYaHujQSBiQGEfTLGY5WNP/LhSLiw
 MhJwu+fXEAtn8IjpK5r+Jf+vMNN88ucamngzqACpvy7pcDIUgDeVr9jnTS0TnTio
 QmG/fCHy9SSCmedyJ9CvT07WXj4nSYJGyRGfCmfu/DUze087J3thanMdugavbvmx
 ZHfEynqK8XaTfHt+MySem8E94qwhF34IVcJUNto3y7UGAM5raXJ3PC5Z+AbpqmhS
 Ho3RpZX55HGGjD9p/Ymsed1kWAJOOk7g416Ej2kZUQ==
X-ME-Sender: <xms:HPR8Y59nahcNQlPbRSw2ZhLllrILxCqX4KptV1oAoRkZtWv-E8kglA>
 <xme:HPR8Y9sU8UHwlomzmoxPTqd5rvcLHOKcu0mnpWMfPIzxkrAT4b03uBHVruJqPCS7i
 zanDoEMJKY0BG5n52o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrheelgdehhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
 ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
 gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
 ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
 hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:HPR8Y3D7psfHuByn00UQVGrx961x3zFJEapQKjIcu3rqRI0b0FHAVg>
 <xmx:HPR8Y9caIzjjfd0VGUuHaKuBB5_Gb6nO8tKKXtbIUeRx87TMG_X65A>
 <xmx:HPR8Y-Nbh92Kn4Jb2763cnBuB_dd-6WEXdFdZZ3oGRzggfFjaOOV3g>
 <xmx:H_R8Y612vjXIUfBgPxm_w4drjL-43f0_z7tiu2wiEghZoXvTUB-yvA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 76F69B6008D; Tue, 22 Nov 2022 11:09:00 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <9ef883a8-6832-4242-8687-0a07ef8f99d2@app.fastmail.com>
In-Reply-To: <20221121171202.22080-13-vbabka@suse.cz>
References: <20221121171202.22080-1-vbabka@suse.cz>
 <20221121171202.22080-13-vbabka@suse.cz>
Date: Tue, 22 Nov 2022 17:08:38 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Vlastimil Babka" <vbabka@suse.cz>, "Christoph Lameter" <cl@linux.com>,
 "David Rientjes" <rientjes@google.com>,
 "Joonsoo Kim" <iamjoonsoo.kim@lge.com>, "Pekka Enberg" <penberg@kernel.org>
Subject: Re: [PATCH 12/12] mm,
 slob: rename CONFIG_SLOB to CONFIG_SLOB_DEPRECATED
Content-Type: text/plain
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
 Tony Lindgren <tony@atomide.com>, Roman Gushchin <roman.gushchin@linux.dev>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Matthew Wilcox <willy@infradead.org>, Hyeonggon Yoo <42.hyeyoo@gmail.com>,
 linux-riscv@lists.infradead.org, Jonas Bonn <jonas@southpole.se>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Josh Triplett <josh@joshtriplett.org>, openrisc@lists.librecores.org,
 Linux-OMAP <linux-omap@vger.kernel.org>, linux-arm-kernel@lists.infradead.org,
 patches@lists.linux.dev, Conor Dooley <conor@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

On Mon, Nov 21, 2022, at 18:12, Vlastimil Babka wrote:
> As explained in [1], we would like to remove SLOB if possible.
> ---
>  arch/arm/configs/clps711x_defconfig            |  3 ++-
>  arch/arm/configs/collie_defconfig              |  3 ++-
>  arch/arm/configs/multi_v4t_defconfig           |  3 ++-
>  arch/arm/configs/omap1_defconfig               |  3 ++-
>  arch/arm/configs/pxa_defconfig                 |  3 ++-
>  arch/arm/configs/tct_hammer_defconfig          |  3 ++-
>  arch/arm/configs/xcep_defconfig                |  3 ++-

These all seem fine to convert to SLUB_TINY

It might be a good idea to go through the arm defconfigs after
6.2 (which will remove a bunch of them) and check which of
the others should use it as well, but that of course is
unrelated to the mechanical conversion you do here.

Acked-by: Arnd Bergmann <arnd@arndb.de>
