Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 35125518A25
	for <lists+openrisc@lfdr.de>; Tue,  3 May 2022 18:38:28 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B377E248EB;
	Tue,  3 May 2022 18:38:27 +0200 (CEST)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by mail.librecores.org (Postfix) with ESMTPS id E8C5B247E5
 for <openrisc@lists.librecores.org>; Tue,  3 May 2022 18:38:25 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id C3E8D5C02A4;
 Tue,  3 May 2022 12:38:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 03 May 2022 12:38:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 philipp-wagner.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1651595904; x=1651682304; bh=L/gRPz9aXd
 43N0+cEC2XOdHFG/Dtjt/Kn0gNpEIm9T8=; b=Sw26F81+Vv4rd3p5Uu3DXK1Wk1
 WLDuEdqwGZamN/5+5yqM2ynxGRf8/2YSY/mv6z/TQaUATWwIbQYbivMuDt4D1RIf
 SLo85uXwQYajKGycqqYBzV60R/IVu8W8yvwJjvlaxenvZbWwv6Z2llDAWCochMSo
 5bJOPwZyuI7shESxgcDJk5/PuBMfwBgoupp0CjUmmJ4j+gqtYNBgj4CFMyuGab41
 Wkq5H3mPcKIdCymAfAdYN5rFgptIbzCnFq/+euqrgOH604VXx6X0m6uBAzns375m
 49EocW401cl09l7Cvdd/eOG7KEBidZRMqf2uNdvI93QcBi7jeHUlgUOnRhgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1651595904; x=1651682304; bh=L/gRPz9aXd43N
 0+cEC2XOdHFG/Dtjt/Kn0gNpEIm9T8=; b=LhHwUhoPya0+yh7ptc37xpONn7sjm
 ifi1QIZCvrIUiV1+O2eTayRFBi8nL9I74KVSGV1L2Kex6b/GNaN4zHDynCSJ2VaH
 GgbjoW6YabSPVFuOpyE62S7uVSFF77axOv0upJYDuh71kLtfHr1YIetOUNUhLo57
 9gHtzN4SJhx1Dc8UGYSVsUu+2p8QIdIT5LyH3rIFgLYoH/41InRvh9zyLu0TQQSi
 R7OTFnVbcCWv+Z9z6xFs0O4JcP+sQ2aC1jHj8ol+FM/Xx4pmg5gST9p5XnPtPCA+
 lC41gkYcyJTupaENdVhsPkrhBdOXR+2vtQ+sgrWRWoMV1aPJ2sq2ao+YA==
X-ME-Sender: <xms:gFpxYgHp-tBqiuLTecuE-Ya_iDO8NiNhw5SrjhlMMnKQ7LWEd8BcnA>
 <xme:gFpxYpU3Dltc1Ez55MrVQij_1iyXRe9jU5W-2-z6oENBbEhdrX-xFcuo7yIXSfNDv
 dpofM7PwxbSV8gSkS8>
X-ME-Received: <xmr:gFpxYqLgufXvsWLoPgMAWFx2UJX_HqCi0AZJb76_A1VFZIYM2Qd0GyytnpCco-GpTCw6Vcz2Yv4lMqHu7jJvNvK39LvdOt0xSNNnQEuyAk4rZbqpm-ZO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejgddutdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtfeejnecuhfhrohhmpefrhhhi
 lhhiphhpucghrghgnhgvrhcuoehmrghilhesphhhihhlihhpphdqfigrghhnvghrrdgtoh
 hmqeenucggtffrrghtthgvrhhnpeeluddvvdefueefhfelgeeivdejieelgfevgfdtffff
 jeeitdeujedtveehtdektdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluh
 hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrihhlsehphhhi
 lhhiphhpqdifrghgnhgvrhdrtghomh
X-ME-Proxy: <xmx:gFpxYiGdMXbTZWlrCYniyRuvQF0Y26P7YUVqucSOQkCmsqtbBkd4tQ>
 <xmx:gFpxYmVR-5oP_45x3RJg5w8wR8QRrmSpyHvW3d0jNDClys5ht53aVA>
 <xmx:gFpxYlMCJejm-gtK4Pq6vyRbfV6R7VTl_CFCjtHqv8-sYenhBTfGnQ>
 <xmx:gFpxYlQ_3rGBsxZpm9EgddI93QKZzcRSHmTkTwSUC60HdW4wiiY9oQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 May 2022 12:38:23 -0400 (EDT)
Message-ID: <e9227aed-3450-dfdd-5bc2-4d14027e41b9@philipp-wagner.com>
Date: Tue, 3 May 2022 18:38:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [OpenRISC] Add openrisc@lists.librecores.org to lore.kernel.org
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
References: <CAHmME9ooFW5unm1AOWU5738_GHkYqVZ0whEgfKn6RH6k=SCm5g@mail.gmail.com>
 <20220428201950.6emdw5i2fvyktt2i@nitro.local>
 <CAAfxs75mxjefcTi5ficG0YvDr1THkPGG6aOxX0oor6WWTUngxA@mail.gmail.com>
From: Philipp Wagner <mail@philipp-wagner.com>
In-Reply-To: <CAAfxs75mxjefcTi5ficG0YvDr1THkPGG6aOxX0oor6WWTUngxA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Openrisc <openrisc@lists.librecores.org>,
 Stefan Wallentowitz <stefan.wallentowitz@gmail.com>
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

On 29.04.22 05:14, Stafford Horne wrote:
> On Fri, Apr 29, 2022, 5:19 AM Konstantin Ryabitsev 
> <konstantin@linuxfoundation.org <mailto:konstantin@linuxfoundation.org>> 
> wrote:
> 
>     On Thu, Apr 28, 2022 at 01:15:09PM +0200, Jason A. Donenfeld wrote:
>      > Hi folks,
>      >
>      > Any interest in getting this mailing list up on lore.kernel.org
>     <http://lore.kernel.org>? This
>      > would make sense since it's the mailing list specified in the Linux
>      > MAINTAINERS file for OpenRISC development. It'd require the list
>      > administrator to send the current list archives to Konstantin and
>     then
>      > add some archiver as a subscriber. Given this is a fairly normal
>      > mailman list, that doesn't seem too hard.
> 
>     We can add it, but it would be great if the list can be made
>     DKIM-compliant
>     first:
> 
>     1. turn off subject modification, if possible

done (unset the subject_prefix setting)

>     2. remove body modification, if present (mailman list footers, etc)

Done that as well (cleared msg_footer setting).

>     This way any messages sent to this list and to any other lists are
>     properly
>     deduplicated.
> 
> 
> I think it's a good idea, I am not an admin at librecores.  Can you guys 
> help out?

I made the changes above, let me know if that's not sufficient and more 
changes are needed.

(I think you're actually an admin on that list, Stafford :-))

Philipp
