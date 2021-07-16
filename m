Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C38F13CB864
	for <lists+openrisc@lfdr.de>; Fri, 16 Jul 2021 16:04:47 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 7A9D823F99;
	Fri, 16 Jul 2021 16:04:47 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by mail.librecores.org (Postfix) with ESMTP id 60C6E21361
 for <openrisc@lists.librecores.org>; Fri, 16 Jul 2021 16:04:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626444284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pedmGDhV8R/ssMr6HBz+auiRcitZce+AljxKlETnrsY=;
 b=WQOJR1JBkUKlv+S8KU5l7BTMMpk2Ii4wi0XbxmvgaZgEyVXqQTNauXlegnEpg6z7e1tJmZ
 COCMTIcJBQ8jdldvfjg9kycIZSbj7CA8qminWpGwKLiavjvsvFAcqvEbPUtMMofJHVWPOa
 U98AJQcxfO/5aWdoZ6QzEfelsqRUxn0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-LBNeuNt0O7uGxX9A5Dp-gw-1; Fri, 16 Jul 2021 10:04:43 -0400
X-MC-Unique: LBNeuNt0O7uGxX9A5Dp-gw-1
Received: by mail-wm1-f71.google.com with SMTP id
 p6-20020a05600c3586b029020b46124c2eso3551238wmq.1
 for <openrisc@lists.librecores.org>; Fri, 16 Jul 2021 07:04:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pedmGDhV8R/ssMr6HBz+auiRcitZce+AljxKlETnrsY=;
 b=tdsG3HOHdUm8l3jrP3whwdNF8EAmX0n6vGTm+llOKuh+7CnKquOPUhFAzCVgDuyLiA
 TcsvKdLfy8rlsp6P8/qAkhW2iea965GPVxxWRg3JOOakpFSrWw6VKYD4ye0kHo41+IZ8
 gMQCJTrutzq7YqU6hm2LQeBd6u10DKQNqgZlRi0lvxhZrMEf6bDAaq+/pa4K+/aRGaf1
 g7f/gyU59lcdPP1YLPZGnmWFsgxfhL+bSOa5w18L/dlWbV2PBeMJVqJb/ZI74kxCSWD5
 Y8zXh1sRA11hn6SZW5JrWJTR8KB2i5vIvHRQXzCXrwKHJ1A2pcPwniCz3nxlqxp9val0
 nbLg==
X-Gm-Message-State: AOAM530CrTXvZNYjHLeckUldgGhsesoMWD82MKjQG8UwfRh7cxNQ5+uu
 GW0Djk7FXTzhOhcKX6b3dOejbtXk544h31ULJS+1pfj3z1gN6NJQCTYr8ucgMjdPC2ZI2c8YJFj
 yWxdyn2hlud5BfCF7qva5LQ3Wvw==
X-Received: by 2002:a05:6000:1c4:: with SMTP id
 t4mr12697864wrx.181.1626444281971; 
 Fri, 16 Jul 2021 07:04:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLpAj0Ivjlvi+xMUvEhyyOAAGoLwXllVSc0cl1Q8zxOJF8NUABy9xQcFzAHuRhlgMqJcAOCQ==
X-Received: by 2002:a05:6000:1c4:: with SMTP id
 t4mr12697846wrx.181.1626444281797; 
 Fri, 16 Jul 2021 07:04:41 -0700 (PDT)
Received: from [192.168.1.5] ([80.168.238.114])
 by smtp.gmail.com with ESMTPSA id x18sm9767380wrw.19.2021.07.16.07.04.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 07:04:41 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Openrisc <openrisc@lists.librecores.org>
References: <20210712103256.2275617-1-giulio.benetti@benettiengineering.com>
From: Nick Clifton <nickc@redhat.com>
Message-ID: <2c9bcabe-99d0-c305-26aa-08fee85654d3@redhat.com>
Date: Fri, 16 Jul 2021 15:04:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210712103256.2275617-1-giulio.benetti@benettiengineering.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nickc@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-GB
Subject: Re: [OpenRISC] [PATCH] or1k: fix pc-relative relocation against
 dynamic on PC relative 26 bit relocation
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 GNU Binutils <binutils@sourceware.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgR2l1bGlvLAoKPiAgICAgICAgIHVzZSBhIHNlcGFyYXRlIGVudHJ5Cj4gCSAgaW4gc3dpdGNo
IGNhc2UgUl9PUjFLX0lOU05fUkVMXzI2IHdoZXJlIHdlIG5lZWQgdG8gY2hlY2sgZm9yCj4gCSAg
IVNZTUJPTF9DQUxMU19MT0NBTCgpIGluc3RlYWQgb2YgIVNZTUJPTF9SRUZFUkVOQ0VTX0xPQ0FM
KCkuCgpQYXRjaCBhcHByb3ZlZCBhbmQgYXBwbGllZC4gIFRoYW5rcyBmb3IgcmVwb3J0aW5nIGFu
ZCBmaXhpbmcgdGhpcyBwcm9ibGVtLgoKQ2hlZXJzCiAgIE5pY2sKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVu
UklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xp
c3RpbmZvL29wZW5yaXNjCg==
