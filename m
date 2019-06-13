Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id BB2B443629
	for <lists+openrisc@lfdr.de>; Thu, 13 Jun 2019 15:00:58 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 68F172026B;
	Thu, 13 Jun 2019 15:00:58 +0200 (CEST)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mail.librecores.org (Postfix) with ESMTPS id 9837A2016C
 for <openrisc@lists.librecores.org>; Thu, 13 Jun 2019 15:00:56 +0200 (CEST)
Received: by mail-pf1-f175.google.com with SMTP id 19so10979572pfa.4
 for <openrisc@lists.librecores.org>; Thu, 13 Jun 2019 06:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qnRq7gToPjKdHuynaFJk7yRP6kHBi6Chcbz/JXnahl8=;
 b=WwE+1EKvcqkZkV7CR7up9LpsKgLAnr/a1y2t9wzslua+pv3D9M3KjZwCxfL8hoL0XS
 g2I6VdODEuuXajyrZg0P97vpoSgD31mmCm7jA0KrJsysn69O2M5Gyp/j7jidmi3QQGuF
 ZLUrhXD2VEzqFaMYrUtR4XPVEOHJ+DnKP6kkJa/HY7Se1p/7PZ/3gjKOSUM5oOatpG1u
 N7LJdQxjMACa0FX4Wq1bn9+U1Yf8sd2/rTnnev3xHsha964QGVEP/20XFRV3egoLfHp8
 ODegjkkH2/L2h0o+EWvAQLss7T6DKPjSO3n0q95Bmlk7+9vnIAXVSTx6vICNVs7Jfy3L
 nFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qnRq7gToPjKdHuynaFJk7yRP6kHBi6Chcbz/JXnahl8=;
 b=M3v/55UG9J89ObgD+4bw6V0iZV3xZNtnM6G0Js9UBpGCOcdegWyXR/9uwawrh1nQtP
 CV3TIVQGcB/HEZMmxiJwhs4uYwvq3xs9eVmtnsPxS+jdyH5mtSeZBROmFLAifPTLM5+e
 2E3lgYPs+F69AcYlSAONHtdllZuApv6/ShZlAKEqblLPmcUzzix2RLwwo/zCuYNe1Uj+
 ndrCMv3caAuKb21pxv17a85TEVSJFpomglIxscYMu4RoFy/q2eIpIM8I/dFk4p/9R32Y
 1cQRrD9z5TjVVeQZbnp1a/NbemXYuNPY4WM5IifR28ep85lzhsKj87ijo7X+/fKPo8Aw
 fCVg==
X-Gm-Message-State: APjAAAVq9iIK0BxLbmQ6XvhIob5jUCzSMMS9vpXbzchiF4Qg1WASsZ02
 8EcYQawdIfgEHdxqaIhBHYg=
X-Google-Smtp-Source: APXvYqya8YM5jA0XWp6TnD2yta4okXuMOaeBi3vh4Ey8097cRMHCBbfVfcZMPTfxpx68pvoMjyYYdQ==
X-Received: by 2002:a63:1617:: with SMTP id w23mr22626505pgl.183.1560430854497; 
 Thu, 13 Jun 2019 06:00:54 -0700 (PDT)
Received: from localhost (g30.211-19-85.ppp.wakwak.ne.jp. [211.19.85.30])
 by smtp.gmail.com with ESMTPSA id p27sm5306776pfq.136.2019.06.13.06.00.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 13 Jun 2019 06:00:53 -0700 (PDT)
Date: Thu, 13 Jun 2019 22:00:51 +0900
From: Stafford Horne <shorne@gmail.com>
To: Nancy Chauhan <nancychn1@gmail.com>
Message-ID: <20190613130051.GK2358@lianli.shorne-pla.net>
References: <CAF69Gooae0PKYQYTLaB=r5u8AG0_Rxk5qhXXr-YppoKAm0h_vQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF69Gooae0PKYQYTLaB=r5u8AG0_Rxk5qhXXr-YppoKAm0h_vQ@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [OpenRISC] GSoC 2019 : mor1kx CI
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
Cc: o.v.nenashev@gmail.com, Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDQ6Mjk6MTNQTSArMDUzMCwgTmFuY3kgQ2hhdWhhbiB3
cm90ZToKPiBIZWxsbyBTdGFmZm9yZCAsCj4gCj4gVGhpcyB3ZWVrIEkgYW0gd29ya2luZyBvbiBj
cmVhdGluZyBqZW5raW5zZmlsZSBmb3IgTGlicmVjb3Jlcy1jaSBpbiBtb3Ixa3gKPiBhbmQgSSB3
YW50ZWQgIHRvIGtlZXAgaW4gZGlzY3Vzc2lvbiB3aXRoIHlvdSBmb3IgbmV4dCBnb2FscyBvZiBo
YXZpbmcgWW9zeXMKPiBhbmQgR0NDL0dEQiAuCj4gQXMgcGVyIGRpc2N1c3Npb24gd2l0aCBvbGVn
IHRvZGF5IHRoZSBiZXN0IHdheSBmb3IgIGhhdmluZyB5b3N5cyB3b3VsZCBiZQo+IHRvIGludm9r
ZSBpdCBmcm9tIEZ1c2VTb0MgLCBlLmcuIGJ5IGRlZmluaW5nIGl0IGluCj4gaHR0cHM6Ly9naXRo
dWIuY29tL29wZW5yaXNjL21vcjFreC9ibG9iL21hc3Rlci9tb3Ixa3guY29yZSNMNzkgLgo+IFN0
YWZmb3JkIGNhbiB5b3UgcGxlYXNlIGdpdmUgbWUgbW9yZSByZWZlcm5jZSBvbiBpdCAuCgpIZWxs
bywKCkkgd291bGQgc3VnZ2VzdCBmaW5kaW5nIGFuIGV4YW1wbGUgcHJvamVjdCB1c2luZyB5b3N5
cyBhbmQgZnVzZXNvYy4gIE9sb2YncyBzZXJ2CmlzIHByb2JhYmx5IGEgZ29vZCBjYW5kaWF0ZSBz
ZWU6CgogIGh0dHBzOi8vZ2l0aHViLmNvbS9vbG9may9zZXJ2L2Jsb2IvbWFzdGVyL3NlcnYuY29y
ZQoKTm90aWNlIGhlIHVzZXMgdGhlIGBpY2VzdG9ybWAgdG9vbCB3aGljaCBpcyBhY3R1YWxseSB5
b3N5cy4gIFlvdSBjYW4gcmVhZCB0aGUKZG9jcyBmb3IgZnVzZXNvYy4gIElmIHlvdSBnZXQgc3R1
Y2sgaXRzIHVzdWFsbHkgaXRzIGVhc3kgdG8gZ2V0IGZhciBieSByZWFkaW5nCnRoZSBjb2RlIHRv
byBhcyBpdHMgbm90IHRvbyBjb21wbGljYXRlZC4KCiAgaHR0cHM6Ly9naXRodWIuY29tL29sb2Zr
L2Z1c2Vzb2MgLSBmdXNlc29jIGZyb250ZW5kICh3ZSB1c2UgYXBpMikKICBodHRwczovL2Z1c2Vz
b2MucmVhZHRoZWRvY3MuaW8vZW4vbGF0ZXN0L2luZGV4Lmh0bWwgLSBkb2NzCgpJdHMgcHJvYmFi
bHkgZWFzaWVzdCBmb3IgeW91IHRyeSB0byB0byBjcmVhdGUgYW4gaWNlc3RvcmUgdG9vbCBidWls
ZCwgY29weWluZwp3aGF0IGlzIGluIHNlcnYgYW5kIHNlZSB3aGF0IGhhcHBlbnMuCgotLQoKU3Rl
cCAyIGZvciB5b3N5cwoKVGhlIGljZXN0b3JtIHdpbGwgZG8gYm90aCBzeW50aGVzaXMgYW5kIHBs
YWNlIGFuZCByb3V0ZWkgKHBucikuICBXZSByZWFsbHkganVzdApuZWVkIHN5bnRoZXNpcyB0byBn
ZXQgdGhlIHJlc291cmNlIHVzYWdlLiAgQnV0IEkgZ3Vlc3MgaXQgZG9lc24ndCBodXJ0IHRvIGRv
IHBucgphcyB3ZWxsLgoKQWxzbywgbm90ZSB5b3N5cyBzdXBwb3J0cyBzeW50aGVzaXppbmcgZm9y
IGRpZmZlcmVudCBGUEdBIHRhcmdldHMgc2VlCmh0dHA6Ly93d3cuY2xpZmZvcmQuYXQveW9zeXMv
ZG9jdW1lbnRhdGlvbi5odG1sLCB0aGVyZSBpczoKCiAgLSBzeW50aF9pbnRlbAogIC0gc3ludGhf
eGlsaW54CiAgLSBzeW50aF9pY2U0MAogIC0gZXRjLgoKSWRlYWxseSB3ZSB3b3VsZCBsaWtlIHRv
IHN5bnRoZXNpemUgZm9yIGEgZmV3IGRpZmZlcmVudCB0YXJnZXQgRlBHQXMgdG8gdHJhY2sKZm9y
IHJlc291cmNlIHVzYWdlIHJlZ3Jlc3Npb25zIGFjcm9zcyBtb3JlIGNhc2VzLiAgQnV0LCBjdXJy
ZW50bHkgZnVzZXNvYyBvbmx5CnN1cHBvcnQgc3ludGhfaWNlNDAuCgpJdCBtYXkgbWVhbiB3ZSBu
ZWVkIHRvIHBhdGNoIGZ1c2Vzb2MgYW5kIG9yIGVkYWxpemUuCmh0dHBzOi8vZ2l0aHViLmNvbS9v
bG9may9lZGFsaXplLiAgRWRhbGl6ZSBpcyB0aGUgYmFja2VuZCBmb3IgZnVzZXNvYyB3aGljaCBk
b2VzCnRoZSBhY3R1YWwgY2FsbHMgdG8gdGhlIEVEQSB0b29scyAobGlrZSB5b3N5cykuICBJbiBl
ZGFsaXplIHNvdXJjZSBjb2RlIEkgY2FuCnNlZSB0aGVyZSBhcmUgYmFja2VuZHMgZm9yOgoKIC0g
aWNlc3Rvcm0gLSBhcyBkb2N1bWVudGVkIGluIGZ1c2Vzb2MKIC0gdHJlbGxpcyAtIHlvc3lzIHN5
bnRoX2VjcDUKCldlIGNvdWxkIHdvcmsgd2l0aCB0aGUgZnVzZXNvYyB0ZWFtIHRvIGFkZCwgeGls
aW54L2ludGVsIGJhY2tlbmRzIGFzIHdlbGwuCkFsc28sIG5vdGUgdGhlcmUgaXMgYSBicmFuY2gg
d2hlcmUgT2xvZiBzdGFydGVkIHdvcmtpbmcgb24gYSBubyBQTlIgYmFja2VuZDoKCiAgaHR0cHM6
Ly9naXRodWIuY29tL29sb2ZrL2VkYWxpemUvdHJlZS9pY2VzdG9ybS1wbnItbm9uZS9lZGFsaXpl
CgpDQ2VkIGZ1c2Vzb2MgdGVhbSBhbmQgb3BlbnJpc2MgdGVhbS4KCi1TdGFmZm9yZApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5n
IGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNv
cmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
