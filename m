Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA865EECD
	for <lists+openrisc@lfdr.de>; Wed,  3 Jul 2019 23:49:24 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1C03120357;
	Wed,  3 Jul 2019 23:49:24 +0200 (CEST)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by mail.librecores.org (Postfix) with ESMTPS id 0E6C020343
 for <openrisc@lists.librecores.org>; Wed,  3 Jul 2019 23:49:22 +0200 (CEST)
Received: by mail-pf1-f194.google.com with SMTP id x15so1923536pfq.0
 for <openrisc@lists.librecores.org>; Wed, 03 Jul 2019 14:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/tnXfVM5+Qo2vtC5jmYwh74C7w99qPON1lSeWIHsb0g=;
 b=bMkalU+UFW5wpk//kaw1B73scuj5rJ1UO8o8cgRsmD103IgYZv561aGIA2PNEOp3L9
 aPYXuRF4c0tp2R1o70y+yxed1udaf+HK3pNXurwQwlaYpAp9UEnIgfqVTGlcl4bAGQ1R
 lMUXyxqYMlK048iDg3zQ2oqurX+4k0lFodlWhN6ss+Si/7xhNbQZBiYtxccgYOYi51CC
 u2Xt6WVLuUh5ethOn8kWiNceieh7v70i0HohcH8ZnMrGrPtOuyTCb5IT34WHzHqFYt1u
 YJcSI01SFBxIqGzwOoUfM8uJ1CHTaLHjS3mH48cYYJLuSl8OT/jpNnAsfwEiZ+Tq4WiC
 LFyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/tnXfVM5+Qo2vtC5jmYwh74C7w99qPON1lSeWIHsb0g=;
 b=tBuygwkwswyNCOCK0uRLyXN+4FLjbrT9ITqNFLmfL77sZRD4jPXzpZOmKNp7cPyO0m
 SM7QwXUl/66JAtK5hT7Hj87uDIya+rn/Cv/eKmtXyamVLvJvBns0SBqYnEM8saBMCveB
 +VBp26P79PPu7Bfal8ILzBkJnRqoEk5gd0iBTcNEOr48Fq1002Lr2gXgTR+t6g7tNa5q
 pmX3x3ip4GdCALA0pXlpIjylrv5Q51WAARhhdsrPZuEFRXDbCrOj4lASSNSXcKNPGEvX
 gNjYFka5KcNNgrDF00K838wkcdruQDk/Do2uPeO20b0uaqIj3Jv4VoA1CFBPVLY9ljI4
 X/Tg==
X-Gm-Message-State: APjAAAUQ/GPhxcibcv0psThW+VXjp3w0+peeC09Bf9aJ78ldV7x3vTfB
 c0fAOpERr7b+PT0cZVNM0uA=
X-Google-Smtp-Source: APXvYqzkZ84a83KeumxK75cZCSaAjqDYxwxIP02NDpQjZGtkZp+x6nZQNmcBgM3UUVsYSlwyyViueQ==
X-Received: by 2002:a63:755e:: with SMTP id f30mr31228160pgn.246.1562190560141; 
 Wed, 03 Jul 2019 14:49:20 -0700 (PDT)
Received: from localhost (g223.61-115-60.ppp.wakwak.ne.jp. [61.115.60.223])
 by smtp.gmail.com with ESMTPSA id j11sm4837324pfa.2.2019.07.03.14.49.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 14:49:19 -0700 (PDT)
Date: Thu, 4 Jul 2019 06:49:17 +0900
From: Stafford Horne <shorne@gmail.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Message-ID: <20190703214917.GB2601@lianli.shorne-pla.net>
References: <20190703033351.11924-1-shorne@gmail.com>
 <20190703033351.11924-4-shorne@gmail.com>
 <20190703144902.GX18316@gate.crashing.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190703144902.GX18316@gate.crashing.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [OpenRISC] [PATCH v2 3/5] or1k: Add mrori option,
 fix option docs
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
Cc: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>,
 Openrisc <openrisc@lists.librecores.org>,
 GCC patches <gcc-patches@gcc.gnu.org>, Jeff Law <law@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDk6NDk6MDJBTSAtMDUwMCwgU2VnaGVyIEJvZXNzZW5r
b29sIHdyb3RlOgo+IE9uIFdlZCwgSnVsIDAzLCAyMDE5IGF0IDEyOjMzOjQ5UE0gKzA5MDAsIFN0
YWZmb3JkIEhvcm5lIHdyb3RlOgo+ID4gQEAgLTE3OSwxMSArMTgzLDExIEBACj4gPiAgICBbKHNl
dCAobWF0Y2hfb3BlcmFuZDpTSSAwICJyZWdpc3Rlcl9vcGVyYW5kIiAiPXIsciIpCj4gPiAgCShy
b3RhdGVydDpTSSAobWF0Y2hfb3BlcmFuZDpTSSAxICJyZWdpc3Rlcl9vcGVyYW5kIiAgInIsciIp
Cj4gPiAgCQkgIChtYXRjaF9vcGVyYW5kOlNJIDIgInJlZ19vcl91Nl9vcGVyYW5kIiAicixuIikp
KV0KPiA+IC0gICJUQVJHRVRfUk9SIgo+ID4gKyAgIlRBUkdFVF9ST1IgfHwgVEFSR0VUX1JPUkki
Cj4gPiAgICAiQAo+ID4gICAgIGwucm9yXHQlMCwgJTEsICUyCj4gPiAgICAgbC5yb3JpXHQlMCwg
JTEsICUyIgo+ID4gLSAgWyhzZXRfYXR0ciAiaW5zbl9zdXBwb3J0IiAiKixzaGZ0aW1tIildKQo+
ID4gKyAgWyhzZXRfYXR0ciAiaW5zbl9zdXBwb3J0IiAicm9yLHJvcmkiKV0pCj4gCj4gRG9lcyB0
aGlzIHdvcms/ICBJZiB5b3UgdXNlIC1tbm8tcm9yIC1tcm9yaT8gIEl0IHdpbGwgdGhlbiBhbGxv
dyBnZW5lcmF0aW5nCj4gYSByZWcgZm9yIHRoZSBzZWNvbmQgb3BlcmFuZCwgYW5kIElDRSBsYXRl
ciBvbiwgYXMgZmFyIGFzIEkgY2FuIHNlZT8KCkl0IGRvZXMgc2VlbSB0byB3b3JrLiAgV2h5IHdv
dWxkIGl0IHByb2R1Y2UgYW4gaW50ZXJuYWwgY29tcGlsZXIgZXJyb3I/CgpPbmUgdGhpbmcgSSBo
YXZlIGlzIFJlZ2VjdE5lZ2F0aXZlIG9uIG1yb3IgYW5kIG1yb3JpLCBzbyAtbW5vLXJvciB3aWxs
IG5vdCBiZQphbGxvd2VkIGFuZCBjYXVzZSBhbiBlcnJvci4KCkV4YW1wbGU6IAoKICAgICQgY2F0
IC4vZ2NjL3Rlc3RzdWl0ZS9nY2MudGFyZ2V0L29yMWsvcm9yLTQuYwoKCXVuc2lnbmVkIGludCBy
b3RhdGU2ICh1bnNpZ25lZCBpbnQgYSkgewoJICByZXR1cm4gKCBhID4+IDYgKSB8ICggYSA8PCAo
IDMyIC0gNiApICk7Cgl9CgojIFdpdGggcm9yaSwgZGlyZWN0IGltbWVkaWF0ZS4KCiAgICAkIG9y
MWstZWxmLWdjYyAtTzIgLWMgLW1yb3JpIC4vZ2NjL3Rlc3RzdWl0ZS9nY2MudGFyZ2V0L29yMWsv
cm9yLTQuYyAKICAgICQgb3Ixay1lbGYtb2JqZHVtcCAtZCByb3ItNC5vIAoKCXJvci00Lm86ICAg
ICBmaWxlIGZvcm1hdCBlbGYzMi1vcjFrCgoJRGlzYXNzZW1ibHkgb2Ygc2VjdGlvbiAudGV4dDoK
CgkwMDAwMDAwMCA8cm90YXRlNj46CgkgICAwOiAgIDQ0IDAwIDQ4IDAwICAgICBsLmpyIHI5Cgkg
ICA0OiAgIGI5IDYzIDAwIGM2ICAgICBsLnJvcmkgcjExLHIzLDB4NgoKIyBXaXRoIHJvciwgbG9h
ZGluZyBpbW1lZGlhdGUgdG8gdGVtcG9yYXJ5IHJlZ2lzdGVyIGZpcnN0LgoKICAgICQgb3Ixay1l
bGYtZ2NjIC1PMiAtYyAtbXJvciAuL2djYy90ZXN0c3VpdGUvZ2NjLnRhcmdldC9vcjFrL3Jvci00
LmMgCiAgICAkIG9yMWstZWxmLW9iamR1bXAgLWQgcm9yLTQubyAKCglyb3ItNC5vOiAgICAgZmls
ZSBmb3JtYXQgZWxmMzItb3IxawoKCURpc2Fzc2VtYmx5IG9mIHNlY3Rpb24gLnRleHQ6CgoJMDAw
MDAwMDAgPHJvdGF0ZTY+OgoJICAgMDogICBhYSAyMCAwMCAwNiAgICAgbC5vcmkgcjE3LHIwLDB4
NgoJICAgNDogICA0NCAwMCA0OCAwMCAgICAgbC5qciByOQoJICAgODogICBlMSA2MyA4OCBjOCAg
ICAgbC5yb3IgcjExLHIzLHIxNwoKLVN0YWZmb3JkCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0
cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29w
ZW5yaXNjCg==
