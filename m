Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 4B00C1B20CF
	for <lists+openrisc@lfdr.de>; Tue, 21 Apr 2020 10:02:09 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 282AF20B1A;
	Tue, 21 Apr 2020 10:02:09 +0200 (CEST)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by mail.librecores.org (Postfix) with ESMTPS id 92F3D2013B
 for <openrisc@lists.librecores.org>; Mon, 20 Apr 2020 19:06:36 +0200 (CEST)
Received: by mail-pf1-f193.google.com with SMTP id p25so5223062pfn.11
 for <openrisc@lists.librecores.org>; Mon, 20 Apr 2020 10:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=c8ZXcCGyaOKw+Ozb6O6bftY8giwA2pivW+jGUiqARaA=;
 b=ceDuzW14kbIZ2i0eQwyeRjXpeFLA37N/sOZVm/wg+k11CjEifTp/ga29eBOeIrGe44
 yS2uGs4Misq8OUxFCQ5+VmhINn7W+Ahb4Mz4SbDNMMq/1TP0qeU/J48I4AOekIlLRrne
 zc1zc/hacZT4ljGtO8cHQ2J8w54tHxbpKnC1q2Qus4PkK2hZP59KVUwSCAvlYJLXOQMl
 xRiqkSOytKWWTdWjscJfLjDYaMU+VEjJRdgxaooMoQVbqKJsmymCw5hDMDk+RpVV2rm9
 Pc2jV61EflOu0Vx8whUtyg5hKD7ZvPPh4EtG3dOxIWqWQ51G1lwkYDzhjCBRVubUJawC
 dITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c8ZXcCGyaOKw+Ozb6O6bftY8giwA2pivW+jGUiqARaA=;
 b=hHsjKZtYmYDlmf3IY1iQIffBbCB90IAzSSMz+oALcfcuFQAhVjoOwuk1miTmRCM/sP
 cKAQevhuwQ/jLuFiY6d2dFrvpoa7TepVy3t1kpX8kXeYa/xnfq4uy+rE3nHUJCRhrZEk
 6ffmDNqQx2HFu2nBg6wCYIcqxcRM9+lcSFbvVdYNfC8M58+H4saVPxcitC2HK4t3PLlL
 qhQFzSFjZC5DzJHkwJnmTVOFXr1B2VEDwCMWBHy0GJdKLNzPGL9D45QlO1VFn8VcgX8Y
 zKePgNRYf+2M7JPYHdScIKXhCW4JTkQvHgRY6IryKZyTsZ3zXhS4pjpkx15+q4+DV09o
 MJtQ==
X-Gm-Message-State: AGi0PuZkfTd+ZDCZM6TAjq1Hfnlrhyde2fdBpT1UCP5n03LIQ+Xwfd/V
 7a8G5RbSqZNN+h3ixiAkMxV1ig==
X-Google-Smtp-Source: APiQypKuyVVHqIYvsIWKtWzA0+g4/2oga3POfBR+VhvJnYBpmh1SmDpP7GPNGKWBwfv8Pv1ID71P+w==
X-Received: by 2002:a62:1a53:: with SMTP id a80mr18468354pfa.157.1587402394962; 
 Mon, 20 Apr 2020 10:06:34 -0700 (PDT)
Received: from ?IPv6:2a02:8084:e84:2480:228:f8ff:fe6f:83a8?
 ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
 by smtp.gmail.com with ESMTPSA id 6sm1696189pgz.0.2020.04.20.10.06.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2020 10:06:33 -0700 (PDT)
To: Stafford Horne <shorne@gmail.com>
References: <20200418201944.482088-1-dima@arista.com>
 <20200418201944.482088-25-dima@arista.com>
 <20200419205728.GT7926@lianli.shorne-pla.net>
From: Dmitry Safonov <dima@arista.com>
Message-ID: <b42b19e0-823c-dc7b-2a72-b6ad0a02b26a@arista.com>
Date: Mon, 20 Apr 2020 18:06:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200419205728.GT7926@lianli.shorne-pla.net>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 21 Apr 2020 10:01:35 +0200
Subject: Re: [OpenRISC] [PATCHv3 24/50] openrisc: Add show_stack_loglvl()
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
Cc: Jonas Bonn <jonas@southpole.se>, Petr Mladek <pmladek@suse.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Safonov <0x7f454c46@gmail.com>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 openrisc@lists.librecores.org, Jiri Slaby <jslaby@suse.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

CgpPbiA0LzE5LzIwIDk6NTcgUE0sIFN0YWZmb3JkIEhvcm5lIHdyb3RlOgo+IE9uIFNhdCwgQXBy
IDE4LCAyMDIwIGF0IDA5OjE5OjE4UE0gKzAxMDAsIERtaXRyeSBTYWZvbm92IHdyb3RlOgo+PiBD
dXJyZW50bHksIHRoZSBsb2ctbGV2ZWwgb2Ygc2hvd19zdGFjaygpIGRlcGVuZHMgb24gYSBwbGF0
Zm9ybQo+PiByZWFsaXphdGlvbi4gSXQgY3JlYXRlcyBzaXR1YXRpb25zIHdoZXJlIHRoZSBoZWFk
ZXJzIGFyZSBwcmludGVkIHdpdGgKPiAKPiBJbnN0ZWFkIG9mIHJlYWxpemF0aW9uIEkgd291bGQg
c2F5ICJJbXBsZW1lbnRhdGlvbiIuCj4gCj4+IGxvd2VyIGxvZyBsZXZlbCBvciBoaWdoZXIgdGhh
biB0aGUgc3RhY2t0cmFjZSAoZGVwZW5kaW5nIG9uCj4+IGEgcGxhdGZvcm0gb3IgdXNlcikuCj4+
Cj4+IEZ1cnRoZXJtb3JlLCBpdCBmb3JjZXMgdGhlIGxvZ2ljIGRlY2lzaW9uIGZyb20gdXNlciB0
byBhbiBhcmNoaXRlY3R1cmUKPj4gc2lkZS4gSW4gcmVzdWx0LCBzb21lIHVzZXJzIGFzIHN5c3Jx
L2tkYi9ldGMgYXJlIGRvaW5nIHRyaWNrcyB3aXRoCj4+IHRlbXBvcmFyeSByaXNpbmcgY29uc29s
ZV9sb2dsZXZlbCB3aGlsZSBwcmludGluZyB0aGVpciBtZXNzYWdlcy4KPj4gQW5kIGluIHJlc3Vs
dCBpdCBub3Qgb25seSBtYXkgcHJpbnQgdW53YW50ZWQgbWVzc2FnZXMgZnJvbSBvdGhlciBDUFVz
LAo+PiBidXQgYWxzbyBvbWl0IHByaW50aW5nIGF0IGFsbCBpbiB0aGUgdW5sdWNreSBjYXNlIHdo
ZXJlIHRoZSBwcmludGsoKQo+PiB3YXMgZGVmZXJyZWQuCj4+Cj4+IEludHJvZHVjaW5nIGxvZy1s
ZXZlbCBwYXJhbWV0ZXIgYW5kIEtFUk5fVU5TVVBQUkVTU0VEIFsxXSBzZWVtcwo+PiBhbiBlYXNp
ZXIgYXBwcm9hY2ggdGhhbiBpbnRyb2R1Y2luZyBtb3JlIHByaW50ayBidWZmZXJzLgo+PiBBbHNv
LCBpdCB3aWxsIGNvbnNvbGlkYXRlIHByaW50aW5ncyB3aXRoIGhlYWRlcnMuCj4+Cj4+IEludHJv
ZHVjZSBzaG93X3N0YWNrX2xvZ2x2bCgpLCB0aGF0IGV2ZW50dWFsbHkgd2lsbCBzdWJzdGl0dXRl
Cj4+IHNob3dfc3RhY2soKS4KPiAKPiBXaWxsIHlvdSBkbyB0aGUgd29yayB0byByZXBsYWNlIHNo
b3dfc3RhY2soKSwgd2hlbiBpcyB0aGF0IHBsYW5uZWQ/CgpJbiB0aGUgcGF0Y2ggNTAvNTAgZnJv
bSB0aGUgc2VyaWVzOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjAwNDE4MjAxOTQ0
LjQ4MjA4OC01MS1kaW1hQGFyaXN0YS5jb20vCgo+IAo+IE90aGVyIHRoYW4gdGhhdCBzbWFsbCBj
b21tZW50IHRoaXMgbG9va3MgZmluZS4KPiAKPiBBY2tlZC1ieTogU3RhZmZvcmQgSG9ybmUgPHNo
b3JuZUBnbWFpbC5jb20+ClRoYW5rIHlvdSwKICAgICAgICAgIERtaXRyeQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QK
T3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9y
Zy9saXN0aW5mby9vcGVucmlzYwo=
