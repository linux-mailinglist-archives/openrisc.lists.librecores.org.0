Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 9C6DF17187C
	for <lists+openrisc@lfdr.de>; Thu, 27 Feb 2020 14:18:57 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 599D820114;
	Thu, 27 Feb 2020 14:18:57 +0100 (CET)
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by mail.librecores.org (Postfix) with ESMTPS id EB0C220114
 for <openrisc@lists.librecores.org>; Thu, 27 Feb 2020 14:18:54 +0100 (CET)
Received: by mail-pj1-f68.google.com with SMTP id q39so1184642pjc.0
 for <openrisc@lists.librecores.org>; Thu, 27 Feb 2020 05:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tso06dQ5KURpIQbwzfLBnMB5Yciq8th0gVZxPZDPYR0=;
 b=A1kOoe0J2pr4Hm3yBkmJ/3llEgRRM7WGp0I+bw6LgoNvKSAraMZGmsJY8AOlzPo1SZ
 UxkxfNHq3Cq4NfrU7Vx9OPwr1tlRMjNhPjKqK9dYXIGHQ2aGMu90oHsbkJJtgDtlm2rk
 Do31YHlDAixtr0kHkDf4X43askJFQJGFc40Sjx9T30pOdpI1vCAcO2gR45CRenD0z56k
 rWdD8+xTgnwXZIQLzfyXkKXipXHcFvEzI9ukDptFzW1mlVzKwtOhhpxaiH1ZcXRr2OL5
 a0fpeFRSIp+aMEaVmvU8bhIMzJTHt6Te7Po7z8su2EW49fZ8+FZQwW3xRODe5RMErTKg
 /72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tso06dQ5KURpIQbwzfLBnMB5Yciq8th0gVZxPZDPYR0=;
 b=Rc2ldZQ3AVJTdyz7cRTl68e8nWF5lRVu8A2Ba8Y+wydgWAvxEt48yPVSvc6rFPmWLy
 ElutQqtfoVitF9o3GL8g9T0iyKFddmuM3eiEubNyvsxIXyHKksksIMIuifICls2eF+MZ
 DyepEGZmLBCBsq6FuXWnCMt9PXcZFIRLcQoF1y9hHRZJ5noRDLmd49dj5l/tRwrhRs18
 A2H99Tkv3tyH43kA36uQDc/9F5qj8dw2wKTYDym9msli2EbWTBVnDiOLesrDhia6bjoB
 OdaReH2lnfFaMMTpZ44oRTPqKSvR/2qwKam7Tl50LSHzyhEefMi4jYu4l4cK3Dj1RZ3v
 Cu6g==
X-Gm-Message-State: APjAAAW8q9edrm42tXLbboK3vFt7DGkYkhi+5sKYBn9Tifc6AYsJI5Dt
 xlGyUd3JlmWyZ9Xl5LZ/vl0=
X-Google-Smtp-Source: APXvYqzF7IoKdlTUwbggtc5n+VbV8IRrqbMxDjr5/cNKzt0gJHtjWrw1C+arbiUmtSvvC+KAHq0OoA==
X-Received: by 2002:a17:902:7004:: with SMTP id
 y4mr4559688plk.263.1582809533502; 
 Thu, 27 Feb 2020 05:18:53 -0800 (PST)
Received: from localhost (g183.222-224-185.ppp.wakwak.ne.jp. [222.224.185.183])
 by smtp.gmail.com with ESMTPSA id t189sm7203682pfd.168.2020.02.27.05.18.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 05:18:52 -0800 (PST)
Date: Thu, 27 Feb 2020 22:18:50 +0900
From: Stafford Horne <shorne@gmail.com>
To: Christian Brauner <christian.brauner@ubuntu.com>
Message-ID: <20200227131850.GH7926@lianli.shorne-pla.net>
References: <20200226225625.28935-1-shorne@gmail.com>
 <20200227122654.ad2tbrohm6ot7pes@wittgenstein>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200227122654.ad2tbrohm6ot7pes@wittgenstein>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [OpenRISC] [PATCH 0/3] OpenRISC clone3 support
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
 LKML <linux-kernel@vger.kernel.org>, Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCBGZWIgMjcsIDIwMjAgYXQgMDE6MjY6NTRQTSArMDEwMCwgQ2hyaXN0aWFuIEJyYXVu
ZXIgd3JvdGU6Cj4gT24gVGh1LCBGZWIgMjcsIDIwMjAgYXQgMDc6NTY6MjJBTSArMDkwMCwgU3Rh
ZmZvcmQgSG9ybmUgd3JvdGU6Cj4gPiBUaGlzIHNlcmllcyBmaXhlcyB0aGUgY2xvbmUzIG5vdCBp
bXBsZW1lbnRlZCB3YXJuaW5ncyBJIGhhdmUgYmVlbiBzZWVpbmcKPiA+IGR1cmluZyByZWNlbnQg
YnVpbGRzLiAgSXQgd2FzIGEgc2ltcGxlIGNhc2Ugb2YgaW1wbGVtZW50aW5nIGNvcHlfdGhyZWFk
X3Rscwo+ID4gYW5kIHR1cm5pbmcgb24gY2xvbmUzIGdlbmVyaWMgc3VwcG9ydC4gIFRlc3Rpbmcg
c2hvd3Mgbm8gaXNzdWVzLgo+IAo+IFRoaXMgYWxsIGxvb2tzIGdvb2QgdG8gbWUuIFRoYW5rcyBm
b3IgZG9pbmcgdGhpcy4gV2UncmUgZ2V0dGluZyBjbG9zZXIKPiBhbmQgY2xvc2VyIHRvIGhhdmlu
ZyBhbGwgYXJjaGl0ZWN0dXJlcyBzdXBwb3J0aW5nIGNsb25lMygpIQo+IAo+IFlvdSB3YW50IG1l
IHRvIHBpY2sgdGhpcyBzZXJpZXMgdXAgZm9yIDUuNyBvciBhcmUgeW91IGdvaW5nIHRocm91Z2gK
PiBhbm90aGVyIHRyZWU/CgpJIGFtIHRoZSBPcGVuUklTQyBtYWludGFpbmVyIHNvIEkgd2lsbCBq
dXN0IHNlbmQgdGhlc2UgdGhyb3VnaCBteSB0cmVlIGR1cmluZwp0aGUgNS43IG1lcmdlIHdpbmRv
dyB3aXRoIHlvdSBBY2sgYXR0cmlidXRpb25zLgoKLVN0YWZmb3JkCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVu
UklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xp
c3RpbmZvL29wZW5yaXNjCg==
