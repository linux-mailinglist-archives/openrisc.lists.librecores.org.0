Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D53522460E9
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:46:53 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 857E220EAA;
	Mon, 17 Aug 2020 10:46:53 +0200 (CEST)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by mail.librecores.org (Postfix) with ESMTPS id 15D8D20CFB
 for <openrisc@lists.librecores.org>; Sun,  9 Aug 2020 01:08:45 +0200 (CEST)
Received: by mail-ej1-f65.google.com with SMTP id a26so5784832ejc.2
 for <openrisc@lists.librecores.org>; Sat, 08 Aug 2020 16:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zAaByrVsjAb8vkDODtWIHOdYlEgt3BUanXR86wDnYY8=;
 b=KVNW+y9kpxQQr+a9b39ZyonobIptGqRr7IUHfHN20hS/wnnFnufklnyEB/93fviJ+7
 Tv5QZXRlXmNXIvNaI7LpomsQPAJbQntM0YY19Nd1q34IKVzlBCYesu7TrzlJ9+ir91/l
 kpCHA5zOQnntbUAgkjHlrTTF0DlL15tYGz4RXJ5Iqzx8ube2iTYy7Dtru7CQcr+/X0Vr
 5n7p43OYCIVdPUfLLPUmwCpH4gsCZrz5AM1D+IJbYYjentOrU0n2EOJ0XLHJP8+tWCHt
 bncy1S4TNdQ75G319IAquwzSSrnmTwYfe843M/1EALN9WcU9HF22sEqyech7ew9amrXn
 2BEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zAaByrVsjAb8vkDODtWIHOdYlEgt3BUanXR86wDnYY8=;
 b=Hpn/YzQ7cQCty9g/SgDwgsK+oy9VLtmTX8capr1TUeJXvGnm/98MAtwlBgat1ELlIB
 aXerMQ+pOJOTK9phhrqZ4ZK97kiVSSBBiwU4wFA574yGEkcUh/kw4oVz6dtu29Og857q
 B02ACKumpCFCh2Fa72c/hq0ZKrDhfhYmix06mageSfX6JD7XTYnpCN+uZtrNFJwC1MVx
 JfeQKi7TIKyeoBn97vMPLOZT6+XLa9P67RXJKeU/KPYK25BZ9L8EODnpdK7e8qOBK0SA
 gcEjHfxHo/rB9vZKySn9qnvZxqHphMiSlVaP4rzG80/M/qWvSPLHw5Mo5yxo38zgfz84
 Fgzg==
X-Gm-Message-State: AOAM533eWoLuuxWTM26gGe94zVpq619o0TL8gZ7DaE1B/FyavjI+N8mG
 kO9jvh9M0OHS35mlZwafdCM=
X-Google-Smtp-Source: ABdhPJyP5jl7/2J/NXBdipAl6ngjmA4FZxLt8ho9+qZHMgHxuaGiWoeQVK9/R6TblDdzHI86FLNgew==
X-Received: by 2002:a17:906:fcb3:: with SMTP id
 qw19mr16283026ejb.271.1596928124697; 
 Sat, 08 Aug 2020 16:08:44 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:a7fb:e200:6d1d:82a1:4f64:b708])
 by smtp.gmail.com with ESMTPSA id cm22sm8864099edb.44.2020.08.08.16.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Aug 2020 16:08:44 -0700 (PDT)
Date: Sun, 9 Aug 2020 01:08:42 +0200
From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To: Stafford Horne <shorne@gmail.com>
Message-ID: <20200808230842.4bdwrvuz3lbgkcom@ltop.local>
References: <20200805210725.310301-1-shorne@gmail.com>
 <20200805210725.310301-6-shorne@gmail.com>
 <20200806190449.xqflhmbiiv5btusf@ltop.local>
 <20200808224822.GQ80756@lianli.shorne-pla.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200808224822.GQ80756@lianli.shorne-pla.net>
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:38 +0200
Subject: Re: [OpenRISC] [PATCH v2 5/6] openrisc: signal: Fix sparse address
 space warnings
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
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU3VuLCBBdWcgMDksIDIwMjAgYXQgMDc6NDg6MjJBTSArMDkwMCwgU3RhZmZvcmQgSG9ybmUg
d3JvdGU6Cj4gT24gVGh1LCBBdWcgMDYsIDIwMjAgYXQgMDk6MDQ6NDlQTSArMDIwMCwgTHVjIFZh
biBPb3N0ZW5yeWNrIHdyb3RlOgo+ID4gT24gVGh1LCBBdWcgMDYsIDIwMjAgYXQgMDY6MDc6MjRB
TSArMDkwMCwgU3RhZmZvcmQgSG9ybmUgd3JvdGU6Cj4gPiA+IC0tLQo+ID4gPiAgYXJjaC9vcGVu
cmlzYy9rZXJuZWwvc2lnbmFsLmMgfCAxNCArKysrKysrLS0tLS0tLQo+ID4gPiAgMSBmaWxlIGNo
YW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiA+ID4gCj4gPiA+IGRpZmYg
LS1naXQgYS9hcmNoL29wZW5yaXNjL2tlcm5lbC9zaWduYWwuYyBiL2FyY2gvb3BlbnJpc2Mva2Vy
bmVsL3NpZ25hbC5jCj4gPiA+IGluZGV4IDRmMDc1NDg3NGQ3OC4uN2NlMDcyODQxMmY2IDEwMDY0
NAo+ID4gPiAtLS0gYS9hcmNoL29wZW5yaXNjL2tlcm5lbC9zaWduYWwuYwo+ID4gPiArKysgYi9h
cmNoL29wZW5yaXNjL2tlcm5lbC9zaWduYWwuYwo+ID4gPiBAQCAtNzYsNyArNzYsNyBAQCBhc21s
aW5rYWdlIGxvbmcgX3N5c19ydF9zaWdyZXR1cm4oc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gPiA+
ICAJICogdGhlbiBmcmFtZSBzaG91bGQgYmUgZHdvcmQgYWxpZ25lZCBoZXJlLiAgSWYgaXQncwo+
ID4gPiAgCSAqIG5vdCwgdGhlbiB0aGUgdXNlciBpcyB0cnlpbmcgdG8gbWVzcyB3aXRoIHVzLgo+
ID4gPiAgCSAqLwo+ID4gPiAtCWlmICgoKGxvbmcpZnJhbWUpICYgMykKPiA+ID4gKwlpZiAoKChf
X2ZvcmNlIHVuc2lnbmVkIGxvbmcpZnJhbWUpICYgMykKPiA+ID4gIAkJZ290byBiYWRmcmFtZTsK
PiA+IAo+ID4gU2FtZSBhcyBwYXRjaCA2LCB0aGUgX19mb3JjZSBpcyBub3QgbmVlZGVkLgo+IAo+
IFRoYW5rcywgIEkgdGhvdWdodCB0aGlzIHdhcyBjb21wbGFpbmluZyBiZWZvcmUsIEkgdGVzdGVk
IG5vdyBhbmQgdGhlcmUgaXMgbm8KPiBwcm9ibGVtIHNvIEkgbXVzdCBoYXZlIGJlZW4gbWl4ZWQg
dXAgd2l0aCBzb21ldGhpbmcgZWxzZS4KClNwYXJzZSBzaG91bGQgaGF2ZSBjb21wbGFpbmVkIHdp
dGggd2l0aCB0aGUgY2FzdCB0byBsb25nIGJ1dApwdXJwb3NlbHkgZG9lc24ndCB3aXRoIHVuc2ln
bmVkIGxvbmcgKG9yIHVpbnRwdHJfdCkuClNvLCBubyBtaXggdXAsIEkgdGhpbmsuCiAKQ2hlZXJz
LAotLSBMdWMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
T3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBz
Oi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
