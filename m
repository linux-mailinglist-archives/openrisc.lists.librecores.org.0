Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 0C1BB13141F
	for <lists+openrisc@lfdr.de>; Mon,  6 Jan 2020 15:53:54 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9C365207AA;
	Mon,  6 Jan 2020 15:53:53 +0100 (CET)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by mail.librecores.org (Postfix) with ESMTPS id 634AD20690
 for <openrisc@lists.librecores.org>; Mon,  6 Jan 2020 15:53:51 +0100 (CET)
Received: by mail-pf1-f194.google.com with SMTP id p14so27069785pfn.4
 for <openrisc@lists.librecores.org>; Mon, 06 Jan 2020 06:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7XaSQ/EximSmFGX8/V3EJ80TFSF4aq77AU2UpijSJZI=;
 b=Ik5AnhpvAImEgN0p68Hf/k9umrhsuqXm4qs4u1YkY6jd3OiUdRu9W1AWJ5x0/nw7FO
 0qu3x8xEPb/n6HoM5qFhztMzyR0T1k7hjFDX8l4lkfRqFaoG5SCnK4DOKDGA2eUmpzYb
 PlmW6sZk6qfLbaO8+8VVPoz1GrYrj967PNenLmYB1U70QsW7vB86h2NM6C953J8gYsG6
 mWyOAYo8eHHXfCwkDvSfQR5wVbR0Xhn7vy5QxTUM35CePfOWGKGmK3qW1NZss9LXbx36
 +gAsR7V7Dbj4eBNdtu7XYWkdZZegcEZ3ygCCYjiyV4PU8/Vf8tLJwGozZyVAuUdyDXlU
 7qeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7XaSQ/EximSmFGX8/V3EJ80TFSF4aq77AU2UpijSJZI=;
 b=hxkTye7MOwIrau8xVcV9LntyPtBv8grLati4tyatNMDXLf1FBNyvNqZqQcGMLsPrvY
 SI2moH9yHxjOm0onXpMnjmAxpjDh/t44JTghiuv3S+FLNkP3+jgR8C9ynzMne5YDsbuZ
 o55thYTAejzPeXeiX6Yt/vuNdsA30l+URbnu16YSRe9TlJvBkoijhsW5N/qsS0rBYBGH
 a6PL/+PCI6bre3i4KCF3FiN25Rc4JpGCk2iyDDFqWTIV4Sveh5SHthntYMGfw8gHGIBC
 B48c+jisd7APHgpz0gj6WLuPicz5VDgVZ3SLTByezCBB303nrQwQOoKzTcgj/BdRe5WH
 yPHQ==
X-Gm-Message-State: APjAAAVMVZm16VFzN2xtBnTiob+5kO7ebMoRT6nc4EgRbQjwhet3CbRL
 F/n7uCucXIyFHpUo5bZtShk=
X-Google-Smtp-Source: APXvYqw7X+6XPNP8y15lx7qSPoqnIH26+3MN77S1SiKjqMSEGFmpmGs8DCFCMg4IJCS/+hFNtusRHQ==
X-Received: by 2002:a63:358a:: with SMTP id c132mr4412983pga.286.1578322429849; 
 Mon, 06 Jan 2020 06:53:49 -0800 (PST)
Received: from localhost (g52.222-224-164.ppp.wakwak.ne.jp. [222.224.164.52])
 by smtp.gmail.com with ESMTPSA id
 k21sm68949754pgt.22.2020.01.06.06.53.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 06:53:49 -0800 (PST)
Date: Mon, 6 Jan 2020 23:53:47 +0900
From: Stafford Horne <shorne@gmail.com>
To: kbuild test robot <lkp@intel.com>
Message-ID: <20200106145347.GT24874@lianli.shorne-pla.net>
References: <1577634178-22530-5-git-send-email-Julia.Lawall@inria.fr>
 <201912301238.xfn6pKut%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <201912301238.xfn6pKut%lkp@intel.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [OpenRISC] [PATCH 4/4] openrisc: use mmgrab
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
Cc: Jonas Bonn <jonas@southpole.se>, kbuild-all@lists.01.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Julia Lawall <Julia.Lawall@inria.fr>, openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBEZWMgMzAsIDIwMTkgYXQgMTI6NDk6MTlQTSArMDgwMCwga2J1aWxkIHRlc3Qgcm9i
b3Qgd3JvdGU6Cj4gSGkgSnVsaWEsCj4gCj4gSSBsb3ZlIHlvdXIgcGF0Y2ghIFlldCBzb21ldGhp
bmcgdG8gaW1wcm92ZToKPgo+IFthdXRvIGJ1aWxkIHRlc3QgRVJST1Igb24gdmZpby9uZXh0XQo+
IFthbHNvIGJ1aWxkIHRlc3QgRVJST1Igb24gY2hhci1taXNjL2NoYXItbWlzYy10ZXN0aW5nIHY1
LjUtcmMzIG5leHQtMjAxOTEyMjBdCj4gW2lmIHlvdXIgcGF0Y2ggaXMgYXBwbGllZCB0byB0aGUg
d3JvbmcgZ2l0IHRyZWUsIHBsZWFzZSBkcm9wIHVzIGEgbm90ZSB0byBoZWxwCj4gaW1wcm92ZSB0
aGUgc3lzdGVtLiBCVFcsIHdlIGFsc28gc3VnZ2VzdCB0byB1c2UgJy0tYmFzZScgb3B0aW9uIHRv
IHNwZWNpZnkgdGhlCj4gYmFzZSB0cmVlIGluIGdpdCBmb3JtYXQtcGF0Y2gsIHBsZWFzZSBzZWUg
aHR0cHM6Ly9zdGFja292ZXJmbG93LmNvbS9hLzM3NDA2OTgyXQo+IAo+IHVybDogICAgaHR0cHM6
Ly9naXRodWIuY29tLzBkYXktY2kvbGludXgvY29tbWl0cy9KdWxpYS1MYXdhbGwvdXNlLW1tZ3Jh
Yi8yMDE5MTIzMC0wMTE2MTEKPiBiYXNlOiAgIGh0dHBzOi8vZ2l0aHViLmNvbS9hd2lsbGlhbS9s
aW51eC12ZmlvLmdpdCBuZXh0Cj4gY29uZmlnOiBvcGVucmlzYy1zaW1wbGVfc21wX2RlZmNvbmZp
ZyAoYXR0YWNoZWQgYXMgLmNvbmZpZykKPiBjb21waWxlcjogb3Ixay1saW51eC1nY2MgKEdDQykg
OS4yLjAKPiByZXByb2R1Y2U6Cj4gICAgICAgICB3Z2V0IGh0dHBzOi8vcmF3LmdpdGh1YnVzZXJj
b250ZW50LmNvbS9pbnRlbC9sa3AtdGVzdHMvbWFzdGVyL3NiaW4vbWFrZS5jcm9zcyAtTyB+L2Jp
bi9tYWtlLmNyb3NzCj4gICAgICAgICBjaG1vZCAreCB+L2Jpbi9tYWtlLmNyb3NzCj4gICAgICAg
ICAjIHNhdmUgdGhlIGF0dGFjaGVkIC5jb25maWcgdG8gbGludXggYnVpbGQgdHJlZQo+ICAgICAg
ICAgR0NDX1ZFUlNJT049OS4yLjAgbWFrZS5jcm9zcyBBUkNIPW9wZW5yaXNjIAo+IAo+IElmIHlv
dSBmaXggdGhlIGlzc3VlLCBraW5kbHkgYWRkIGZvbGxvd2luZyB0YWcKPiBSZXBvcnRlZC1ieTog
a2J1aWxkIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4gCj4gQWxsIGVycm9ycyAobmV3IG9u
ZXMgcHJlZml4ZWQgYnkgPj4pOgo+IAo+ICAgIGFyY2gvb3BlbnJpc2Mva2VybmVsL3NtcC5jOiBJ
biBmdW5jdGlvbiAnc2Vjb25kYXJ5X3N0YXJ0X2tlcm5lbCc6Cj4gPj4gYXJjaC9vcGVucmlzYy9r
ZXJuZWwvc21wLmM6MTE2OjI6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlv
biAnbW1ncmFiJzsgZGlkIHlvdSBtZWFuICdpZ3JhYic/IFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0
aW9uLWRlY2xhcmF0aW9uXQo+ICAgICAgMTE2IHwgIG1tZ3JhYihtbSk7Cj4gICAgICAgICAgfCAg
Xn5+fn5+Cj4gICAgICAgICAgfCAgaWdyYWIKPiAgICBjYzE6IHNvbWUgd2FybmluZ3MgYmVpbmcg
dHJlYXRlZCBhcyBlcnJvcnMKCkhpIEp1bGlhLAoKSXQgbG9va3MgbGlrZSB0aGlzIGlzIGp1c3Qg
YW4gaW5jbHVkZSBpc3N1ZSwgZG8geW91IHdhbnQgdG8gcmV2aXNlIHRoZSBwYXRjaD8KCk9uY2Ug
Zml4ZWQsIGhvdyBkbyB5b3UgcGxhbiB0byBnZXQgdGhpcyBwYXRjaCBzZXJpZXMgbWVyZ2VkPyAg
SSBjYW4gYWRkIHRoZQpPcGVuUklTQyBwYXJ0IHRvIG15IHF1ZXVlIG9yIGRvIHlvdSBoYXZlIGEg
Y2xlYW51cHMgcXVldWUgeW91IGNhbiBtYW5hZ2U/CgotU3RhZmZvcmQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApP
cGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3Jn
L2xpc3RpbmZvL29wZW5yaXNjCg==
