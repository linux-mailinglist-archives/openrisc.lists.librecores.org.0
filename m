Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 9EE892E8338
	for <lists+openrisc@lfdr.de>; Fri,  1 Jan 2021 07:11:44 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 4B464200FD;
	Fri,  1 Jan 2021 07:11:44 +0100 (CET)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mail.librecores.org (Postfix) with ESMTPS id C9163202AE
 for <openrisc@lists.librecores.org>; Fri,  1 Jan 2021 07:11:41 +0100 (CET)
Received: by mail-pf1-f174.google.com with SMTP id h10so11199597pfo.9
 for <openrisc@lists.librecores.org>; Thu, 31 Dec 2020 22:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FmAkaRO9ofNP/6j9RK7haiAvDC6oSSf/13JUxt6XUpg=;
 b=BTMVd0Mnqvbh3hjtXYbPj9j74wDyKIql+z3uzxuM5xuQAVoMXSKz68StDG467zM5gL
 lvwlI4fOHLz+mv5b0ErbqlGWWyl8tWGzA1SnsxWFG6wP5czUXTou6TvowB3iiVZaAI3O
 4DO8B5/oFa0HQtN0FO5vm7EwCV4tJ+AtMKDtemFQSkuBTnewTscBD3e5Kqg8SzTWBRg5
 3ZlRywm8P+aB1GKNr+2JTuPkLg32hC6MrCcHWrS6v8LcY+KZUsjAEqSDyJrb7nC0LVkl
 IC9r1Mmu6lndRqyWw5fVdwdKhNyaE80WfXdW2LS+EgXDP0zkW7NiksFm3EZuKHEx74Y1
 pIXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FmAkaRO9ofNP/6j9RK7haiAvDC6oSSf/13JUxt6XUpg=;
 b=BbpdMbcYKW6xq2Aed8omT3Q0/7JukM1jRtWKInphv9N86Nfuv8zE86MZocDCNz06dZ
 stFeFRefJo+hp1VfiilwzdWRkwgJVYgjW/DZ3JJsAWE7cC1u+jDn9T1JwU1qh/BWAjes
 cEEjeuFGxgCml/5K1ZdoX4SktcQyU2h5/k7OhUNxxMazxm7qRq04oC84czdw0VksCbpm
 Hx1Kal3iKG/FLi3/u+dN2srIC26DYIPsssm9DMEbHK4EyenPUKMb3amZOptwA7KtYwhd
 /ifFZ1W1y/KYB5EHzKozCEzCvFyMVKOitXYVF8h46FPGSd6Q6RZDSH1ujpr3N5U+jsnf
 tXgQ==
X-Gm-Message-State: AOAM532LJ4M0dICriEaiDs6T1/kG7ttweT4Pk0oIKvtNrZhNj52Oiste
 9I0VcUWj/zNhhQT1jbBNlUE=
X-Google-Smtp-Source: ABdhPJxbMw7KU34kDW7dVD8O1dieGLyXAkOPQWp/DIIgRLUyPE3kpanqpWup+pFrWXqVdhspKQsgMA==
X-Received: by 2002:a63:c444:: with SMTP id m4mr58675255pgg.420.1609481499888; 
 Thu, 31 Dec 2020 22:11:39 -0800 (PST)
Received: from localhost (g39.222-224-245.ppp.wakwak.ne.jp. [222.224.245.39])
 by smtp.gmail.com with ESMTPSA id
 h10sm43515056pfn.213.2020.12.31.22.11.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 22:11:39 -0800 (PST)
Date: Fri, 1 Jan 2021 15:11:35 +0900
From: Stafford Horne <shorne@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Message-ID: <20210101061135.GA3106870@lianli.shorne-pla.net>
References: <20201227091446.118437-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201227091446.118437-1-joel@jms.id.au>
Subject: Re: [OpenRISC] [PATCH] openrisc: restart: Call common handlers
 before hanging
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
Cc: Jonas Bonn <jonas@southpole.se>, openrisc@lists.librecores.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU3VuLCBEZWMgMjcsIDIwMjAgYXQgMDc6NDQ6NDZQTSArMTAzMCwgSm9lbCBTdGFubGV5IHdy
b3RlOgo+IEN1cnJlbnRseSBvcGVucmlzYyB3aWxsIHByaW50IGEgbWVzc2FnZSBhbmQgdGhlbiBo
YW5nIGluIGFuIGluZmluaXRlCj4gbG9vcCB3aGVuIHJlYm9vdGluZy4KPiAKPiBUaGlzIHBhdGNo
IGFkb3B0cyBzb21lIGNvZGUgZnJvbSBBUk0sIHdoaWNoIGNhbGxzIHRoZSBjb21tb24gcmVzdGFy
dAo+IGluZnJhc3RydWN0dXJlIGFuZCBoYW5ncyBhZnRlciBhIHNtYWxsIGRlbGF5IGlmIHRoZSBy
ZXN0YXJ0IGluZnJhCj4gZG9lc24ndCBkbyBhbnl0aGluZy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBK
b2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1Pgo+IC0tLQo+IEdlZXJ0IGhhcyBhIHBhdGNoWzFd
IGZvciB0aGUgbGl0ZXggc29jIGNvZGUgdGhhdCBhZGRzIGEgcmVzdGFydCBoYW5kZXIuCj4gT3Bl
bnJpc2MgZG9lc24ndCBoaXQgdGhhdCBjb2RlIHBhdGgsIHRoaXMgcGF0Y2ggZml4ZXMgdGhhdC4K
PiAKPiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL2dlZXJ0dS9saW51eC9jb21taXQvN2QwOWRjMDc5
N2E4MjA4YTExZWI3YzBjMjE1NmMxYTRjMTIwMTgwZgo+IAo+ICBhcmNoL29wZW5yaXNjL2tlcm5l
bC9wcm9jZXNzLmMgfCAxMyArKysrKysrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL29wZW5yaXNj
L2tlcm5lbC9wcm9jZXNzLmMgYi9hcmNoL29wZW5yaXNjL2tlcm5lbC9wcm9jZXNzLmMKPiBpbmRl
eCAzYzk4NzI4Y2NlMjQuLjE4MTQ0OGY3NDMxNiAxMDA2NDQKPiAtLS0gYS9hcmNoL29wZW5yaXNj
L2tlcm5lbC9wcm9jZXNzLmMKPiArKysgYi9hcmNoL29wZW5yaXNjL2tlcm5lbC9wcm9jZXNzLmMK
PiBAQCAtMzQsNiArMzQsNyBAQAo+ICAjaW5jbHVkZSA8bGludXgvaW5pdF90YXNrLmg+Cj4gICNp
bmNsdWRlIDxsaW51eC9tcXVldWUuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2ZzLmg+Cj4gKyNpbmNs
dWRlIDxsaW51eC9yZWJvb3QuaD4KPiAgCj4gICNpbmNsdWRlIDxsaW51eC91YWNjZXNzLmg+Cj4g
ICNpbmNsdWRlIDxhc20vaW8uaD4KPiBAQCAtNDksMTAgKzUwLDE2IEBACj4gICAqLwo+ICBzdHJ1
Y3QgdGhyZWFkX2luZm8gKmN1cnJlbnRfdGhyZWFkX2luZm9fc2V0W05SX0NQVVNdID0geyAmaW5p
dF90aHJlYWRfaW5mbywgfTsKPiAgCj4gLXZvaWQgbWFjaGluZV9yZXN0YXJ0KHZvaWQpCj4gK3Zv
aWQgbWFjaGluZV9yZXN0YXJ0KGNoYXIgKmNtZCkKPiAgewo+IC0JcHJpbnRrKEtFUk5fSU5GTyAi
KioqIE1BQ0hJTkUgUkVTVEFSVCAqKipcbiIpOwo+IC0JX19hc21fXygibC5ub3AgMSIpOwpKdXN0
IGEgbm90ZSwgdGhpcyBub3Agd2l0aCBhcmd1bWVudCAxLCBpcyB1c2VkIGJ5IHRoZSBzaW11bGF0
b3JzIHRvIHNodXRkb3duLiAgSQphbSBoYXBweSB0byBnZXQgcmlkIG9mIHRoaXMgdGhvdWdoLiAg
VGhlIHNpbXVsYXRvciBzaG91bGQgYmUgc2ltdWxhdGluZyBob3cgcmVhbApoYXJkd2FyZSBpcyBz
aHV0IGRvd24gbm90IGRvaW5nIHRoZXNlIHRyaWNrcy4KCj4gKwlkb19rZXJuZWxfcmVzdGFydChj
bWQpOwpBcyB5b3UgbWVudGlvbmVkIHRoaXMgZGVwZW5kcyBvbiBHZWVydCdzIHBhdGNoLiAgRG9l
cyBoZSBwbGFuIHRvIHN1Ym1pdCBpdCBzb29uPwoKR2VlcnQgaXMgQ0NlZC4KCj4gKwo+ICsJLyog
R2l2ZSBhIGdyYWNlIHBlcmlvZCBmb3IgZmFpbHVyZSB0byByZXN0YXJ0IG9mIDFzICovCj4gKwlt
ZGVsYXkoMTAwMCk7Cj4gKwo+ICsJLyogV2hvb3BzIC0gdGhlIHBsYXRmb3JtIHdhcyB1bmFibGUg
dG8gcmVib290LiBUZWxsIHRoZSB1c2VyISAqLwo+ICsJcHJfZW1lcmcoIlJlYm9vdCBmYWlsZWQg
LS0gU3lzdGVtIGhhbHRlZFxuIik7Cj4gKwl3aGlsZSAoMSk7Cj4gIH0KPiAgCj4gIC8qCj4gLS0g
Cj4gMi4yOS4yCgpJIGFtIHF1ZWluZyB0aGlzIGZvciA1LjExIGFueXdheSBpcyBpdCBodXJ0J3Mg
bm90aGluZyB3aXRob3V0IEdlZXJ0J3MgcGF0Y2guCgotU3RhZmZvcmQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApP
cGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3Jn
L2xpc3RpbmZvL29wZW5yaXNjCg==
