Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 1391FE2A61
	for <lists+openrisc@lfdr.de>; Thu, 24 Oct 2019 08:24:22 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 0400D20101;
	Thu, 24 Oct 2019 08:24:21 +0200 (CEST)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 by mail.librecores.org (Postfix) with ESMTPS id CE876205AF
 for <openrisc@lists.librecores.org>; Wed, 23 Oct 2019 11:54:40 +0200 (CEST)
Received: by mail-lj1-f196.google.com with SMTP id c4so5268728lja.11
 for <openrisc@lists.librecores.org>; Wed, 23 Oct 2019 02:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=antmicro-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=4VHhZd/wcq8CsgM9Wmx2uBu3omWaeKjtFbw8MkTHq6g=;
 b=H8VSkOPTjkxxX/RyvszS1osFjESmMV3MyStKtrMJXKcrHnaBAIIT4oQYWysZCSdVA/
 iiTbaT4dONHJeFdxBX/kQs1p28NAGh8qRMeLE0apAU2SpQXgOozRXqx/gcR/5NUtcdCH
 jDR9qE8t8ttnB278/DjCfFphY69YxM2CX4jG5avgiriB5g3owh50ascghBQDePjjRxdX
 KWM2BxLxD2dY1Lo4eojmFkjKoqoEmg8BIrQ8V+DD9VPu+0Jqc51jTuD53vRv+zIxhtJe
 Zz2AmXSw2Psdqro6vxj8boriL8UGofLG2nYKbioiL2CyJ7CG31XVCRa0K/1MZbbN8fpb
 7zLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=4VHhZd/wcq8CsgM9Wmx2uBu3omWaeKjtFbw8MkTHq6g=;
 b=pvc4Xj/b7bu0TGYKXZw7W4j15lxt403HgtpX+7y5SG3SE5MHLCCn6OvjMsmChm5mTn
 PRMhkYMgBoPs8HZrV/QbEsqG/7XOtpl2Y0OoLettEoVFfuSmiQeuPLc6yHAR523d2gsO
 RyjH1+9bYmvwpgRdYa//mwS30+PQGiH+3koCNL8sRwtawCaQkjW6piFCFda+BIMMf9o+
 +2YuxMCHU+655sJ4MY54oR0eTlY12u27MKBzG2XBnwrMdFRwvIynYkbruJEOsWELJZsd
 I0Fl4fl+lfKWt6ASthmZLufzSF1z2zemjGi3cMZAPA+Jtkin7aYngBCyFhtZr2HL5cJQ
 RCvw==
X-Gm-Message-State: APjAAAUCiqsVLyrDpyq6x/wWu20ga9uePhEkBOjuRZOfYYzQ1awaIxsg
 OVtuQs3owzNcYVZQohF8QeGEJw==
X-Google-Smtp-Source: APXvYqx2dskJDKXaT+E0oNXiAyypndDtxvLHHetWpyjlUHp4FdtjH3uYI6Q1hpDsb+x0thq/HRyJ6g==
X-Received: by 2002:a2e:750c:: with SMTP id q12mr21242131ljc.138.1571824480183; 
 Wed, 23 Oct 2019 02:54:40 -0700 (PDT)
Received: from localhost.localdomain (d79-196.icpnet.pl. [77.65.79.196])
 by smtp.gmail.com with ESMTPSA id v7sm9177824lfd.55.2019.10.23.02.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 02:54:39 -0700 (PDT)
Date: Wed, 23 Oct 2019 11:54:33 +0200
From: Mateusz Holenko <mholenko@antmicro.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, openrisc@lists.librecores.org
Message-ID: <20191023115427.23684-0-mholenko@antmicro.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Thu, 24 Oct 2019 08:24:18 +0200
Subject: [OpenRISC] [PATCH 0/1]  openrisc: LiteX+mor1kx platform
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
Cc: devicetree@vger.kernel.org, Mateusz Holenko <mholenko@antmicro.com>,
 Filip Kokosinski <fkokosinski@internships.antmicro.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "Paul E. McKenney" <paulmck@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>, Karol Gugala <kgugala@antmicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VGhpcyBwYXRjaHNldCBhZGRzIGEgbmV3IExpdGVYIFNvQy1iYXNlZCBwbGF0Zm9ybQpjb25maWd1
cmVkIGZvciBtb3Ixa3ggKE9wZW5SSVNDKSBDUFUgY291cGxlZCB3aXRoCkxpdGVVQVJUIHNlcmlh
bCBkZXZpY2UuCgpEZXRhaWxzIGFib3V0IExpdGVYIGNhbiBiZSBmb3VuZCBhdApodHRwczovL2dp
dGh1Yi5jb20vZW5qb3ktZGlnaXRhbC9saXRleC4KClRoaXMgcGxhdGZvcm0gaXMgaW50ZW5kZWQg
Zm9yIGZ1cnRoZXIgZXh0ZW5zaW9uCm9uY2UgZHJpdmVycyBmb3Igb3RoZXIgTGl0ZVggZGV2aWNl
cyBhcmUgbWVyZ2VkCnRvIHRoZSBrZXJuZWwuCgpOT1RFOgpUaGlzIHJlcXVpcmVzIGFub3RoZXIg
cGF0Y2hzZXQgdG8gYmUgbWVyZ2VkIGZpcnN0OgpodHRwczovL2xvcmUua2VybmVsLm9yZy9wYXRj
aHdvcmsvY292ZXIvMTE0MzM1Mi8KCkZpbGlwIEtva29zaW5za2kgKDEpOgogIG9wZW5yaXNjOiBh
ZGQgc3VwcG9ydCBmb3IgTGl0ZVgKCiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAxICsKIGFyY2gvb3BlbnJpc2MvYm9vdC9kdHMvb3Ixa2xpdGV4LmR0cyAgICAg
IHwgNDkgKysrKysrKysrKysrKysrKysrKysrKysKIGFyY2gvb3BlbnJpc2MvY29uZmlncy9vcjFr
bGl0ZXhfZGVmY29uZmlnIHwgMTggKysrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDY4IGluc2Vy
dGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL29wZW5yaXNjL2Jvb3QvZHRzL29yMWts
aXRleC5kdHMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL29wZW5yaXNjL2NvbmZpZ3Mvb3Ixa2xp
dGV4X2RlZmNvbmZpZwoKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxp
YnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJp
c2MK
