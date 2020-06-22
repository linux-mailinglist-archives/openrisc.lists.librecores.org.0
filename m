Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D929A204C13
	for <lists+openrisc@lfdr.de>; Tue, 23 Jun 2020 10:19:07 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3EE3420C57;
	Tue, 23 Jun 2020 10:19:06 +0200 (CEST)
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by mail.librecores.org (Postfix) with ESMTPS id 41C5D20AF4
 for <openrisc@lists.librecores.org>; Mon, 22 Jun 2020 11:06:25 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 714591674;
 Mon, 22 Jun 2020 05:06:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 22 Jun 2020 05:06:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 philipp-wagner.com; h=to:cc:from:subject:message-id:date
 :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
 1wFPxeAbZ30P9syoQi/PrvJ2yL+QDzWyWs0Xq2MwuWc=; b=k4E1NGMdCuhiInPF
 KJ6+BNhju953AyZzMaBaejcj65Sqvyxjgjz227hnQC4PC6HWW/QwLLr6XxlvV5dp
 AE394MuGBShN/LdiPCJl50CsZi3if3tkgCRjaW0WSkBiLE+g3Edzk3HViSeZC1Bd
 +R9BwBD0b1PRgmZ39v7n49AMxIC4pi5rwUVEt4aGqI1hQD9Wzx6pNlTfFbwrJMcL
 EztIjfoDgASRn0K1vWETlnZ1mv8eFQ0kCdbqxjj9YPXn/qLORiHJopdUxdDtANEy
 9ZcaT97dyT2On78zPIkBXZ0kxUWU5GOZHwhHptw4F+7CTaq2qMcKQVE7wXlgG5BW
 WbjnyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=1wFPxe
 AbZ30P9syoQi/PrvJ2yL+QDzWyWs0Xq2MwuWc=; b=oAN94auObBxiTTteXFskH2
 RBZ07CSoQyf4tvLWkHIMOQ1h74qMnOJEf95KFIx/EvgRb5WXpj/lbgngTzHjgawq
 1RWJuuM1WWKuHIrRhY6taebRxW6nxIVYBvI2RjhnTLiYiXuyvewO231gQRK/I/bg
 yevEG5W8YIztfG1qbGR0OaazWvaXVddlZHi5AkCc9fpe8UIzRQaG4Fc6FI0bbCJE
 SU8XUqW/Riqfg6B2cOZc7wPoK853MRPTlEmjFsIzXXxrh6cXCDjUu6+kXZxerOT9
 4FS0PjuJ2MgUmMLlgchWNPwab9IcZwvKflHtLZDrxIaGBunJjF8YK2Y6O+0PegJg
 ==
X-ME-Sender: <xms:jnTwXpYpRyiGOwR2iQYwfunXx43Bovnj2Rz7I3OTJD2NPmnlsVRJ9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudekvddgudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvffhuffkffgfgggtgfesthejredttdefjeenucfhrhhomheprfhhihhlihhp
 phcuhggrghhnvghruceomhgrihhlsehphhhilhhiphhpqdifrghgnhgvrhdrtghomheqne
 cuggftrfgrthhtvghrnhephedvkeehtdehkedvhfevvddtuedugfetuddtueejtdekfeej
 leevkeefieefuefgnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepudekke
 drvddvuddruddvgedriedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
 rghilhhfrhhomhepmhgrihhlsehphhhilhhiphhpqdifrghgnhgvrhdrtghomh
X-ME-Proxy: <xmx:jnTwXgaV58ckST-a3PJ0QLP0xaLbtwsCHnkGcJtoQVU-4GSmMPCQcA>
 <xmx:jnTwXr8vZrr8ebf8K6kyrCSuUKOMn-dZiQnQLDzwqlFGjWOn4NgfiQ>
 <xmx:jnTwXnpaXxfULNLeMCkEwlsoJGZpvZZFsAxxDiTQrhc5-qpR-dtsFA>
 <xmx:j3TwXh3x_hy-ITbcgPMNF6CXX_noZgPuZlYCXBR2RlpVWvvbDmv8og>
Received: from [192.168.0.24] (bcdd7c3c.skybroadband.com [188.221.124.60])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5FCEF3280060;
 Mon, 22 Jun 2020 05:06:22 -0400 (EDT)
To: openrisc@lists.librecores.org
From: Philipp Wagner <mail@philipp-wagner.com>
Message-ID: <c780c80d-18a8-9ba1-1bf2-5c10ea7c6b34@philipp-wagner.com>
Date: Mon, 22 Jun 2020 10:06:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Tue, 23 Jun 2020 10:19:04 +0200
Subject: [OpenRISC] Binary builds of or1k newlib toolchain?
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
Cc: "Koenen, Max" <max.koenen@tum.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGksCgpXaXRoIE9wVGlNU29DLCB3ZSBwcmV2aW91c2x5IHVzZWQgcHJlYnVpbHQgR0NDL25ld2xp
YiB0b29sY2hhaW5zIGZyb20gCmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVucmlzYy9uZXdsaWIvcmVs
ZWFzZXMuCgpOb3cgdGhhdCBldmVyeXRoaW5nIGlzIHVwc3RyZWFtLCBpcyB0aGVyZSBhbm90aGVy
IHBsYWNlIGZvciBwcmUtYnVpbHQgCnRvb2xjaGFpbnM/CgoKVGhhbmtzIQoKUGhpbGlwcApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWls
aW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJy
ZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
