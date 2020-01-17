Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 776F5142094
	for <lists+openrisc@lfdr.de>; Sun, 19 Jan 2020 23:54:16 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id EB40F20114;
	Sun, 19 Jan 2020 23:54:15 +0100 (CET)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by mail.librecores.org (Postfix) with ESMTPS id 911A7207F9
 for <openrisc@lists.librecores.org>; Fri, 17 Jan 2020 01:51:08 +0100 (CET)
Received: by mail-pf1-f194.google.com with SMTP id z16so11102478pfk.0
 for <openrisc@lists.librecores.org>; Thu, 16 Jan 2020 16:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/bRgCqf8dXM5+HUXnDbTAsx03inkApGhpfnqYonvv2Q=;
 b=MlcF60V6LOeLu2rbPdIpdA2lx8BCiBjcbHVXo9+t4SA8uLfR3ygtMnrl6I8GQQ2nVq
 mgl3A89BfTnjQipzxXP4C95pS23IpvMaC2uHtioqFf30D/5aJeguiByzpQ5+JE4o1Mdh
 BvlI8VydRN/+5CNlj+qEf3jGtz9A5JNdgRACf8KtXaUfP22DjMrIFRJJhRQv/rnwzjOw
 EwCi9TvIaEmJI7pyq9O6/V6pRvmgQAwIJSrZ7UTgjKu0qJfceUPlBHelvTqCbYcvAEiQ
 oEcWp3XPjPW2BX0pXBt8of18DHy1530phD0mU9vGUCgLsUkipqbUSUhHqLFBHlzAhOo8
 F/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/bRgCqf8dXM5+HUXnDbTAsx03inkApGhpfnqYonvv2Q=;
 b=rAeSexnOW6eXt/tBt4CeRg7apA84i7pzD7ICfyPS1Am15n18mHwjftHzcENnGr9uYP
 lS803EzXJEwj51SOOKcZth7/O+Bne8oH1s05jo0mkxS06ojKT4wmhg2QTBDCwr1Lrb/C
 hkMbw0SDhVSkwj5zyhbFoFzBEnoXygB4Db7eDsJ8jrAgRSraT8OGWjy90FSk2kxDGrTy
 Wml0qBAWqjY/u9WqM1TB6jc6ReqmQYN1/rINh6kLqUX7Zn9F3nOtTGHbjEiIXEgiGfbg
 hMByqOQ04xt+mP7pGHv665a5F3WRedH6VSX77+UIxOHWzSq12XzdOqPerwSlDerJHu1m
 LqsA==
X-Gm-Message-State: APjAAAXWo0y7F+pJHCM66Zi3luqV/3UeHAoAZLEL3/LAkFmAzi2stbhE
 HomEKg/wbLk1KDBV9i6j++dz3Q==
X-Google-Smtp-Source: APXvYqzbgl3U9kQNwhNdTd46vNLrzL1IYp5lCP9i/MZjDuevpIPbKoL6VtLftp5XHNyRVerCE6fziQ==
X-Received: by 2002:a62:ac03:: with SMTP id v3mr288815pfe.17.1579222267014;
 Thu, 16 Jan 2020 16:51:07 -0800 (PST)
Received: from [192.168.3.43] (rrcs-66-91-136-155.west.biz.rr.com.
 [66.91.136.155])
 by smtp.gmail.com with ESMTPSA id d26sm25240249pgv.66.2020.01.16.16.51.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jan 2020 16:51:06 -0800 (PST)
To: Stafford Horne <shorne@gmail.com>
References: <20200110212843.27335-1-shorne@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7cbf0cfa-2fa7-ed78-d0b4-5b93d012f265@linaro.org>
Date: Thu, 16 Jan 2020 14:51:02 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200110212843.27335-1-shorne@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Sun, 19 Jan 2020 23:54:14 +0100
Subject: Re: [OpenRISC] [PATCH] target/openrisc: Fix FPCSR mask to allow
 setting DZF
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
 QEMU Development <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gMS8xMC8yMCAxMToyOCBBTSwgU3RhZmZvcmQgSG9ybmUgd3JvdGU6Cj4gVGhlIG1hc2sgdXNl
ZCB3aGVuIHNldHRpbmcgRlBDU1IgYWxsb3dzIHNldHRpbmcgYml0cyAxMCB0byAxLiAgSG93ZXZl
ciwKPiBPcGVuUklTQyBoYXMgZmxhZ3MgYW5kIGNvbmZpZyBiaXRzIGluIDExIHRvIDEsIDExIGJl
aW5nIERpdmlkZSBieSBaZXJvCj4gRmxhZyAoRFpGKS4gIFRoaXMgc2VlbXMgbGlrZSBhbiBvZmYt
Ynktb25lIGJ1Zy4KPiAKPiBUaGlzIHdhcyBmb3VuZCB3aGVuIHRlc3RpbmcgdGhlIEdMSUJDIHRl
c3Qgc3VpdGUgd2hpY2ggaGFzIHRlc3QgY2FzZXMgdG8KPiBzZXQgYW5kIGNsZWFyIGFsbCBiaXRz
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFN0YWZmb3JkIEhvcm5lIDxzaG9ybmVAZ21haWwuY29tPgo+
IC0tLQo+ICB0YXJnZXQvb3BlbnJpc2MvZnB1X2hlbHBlci5jIHwgMiArLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKClRoYW5rcywgcXVldWVkLgoKCnJ+
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVND
IG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3Rz
LmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
