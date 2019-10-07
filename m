Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D6090CDE80
	for <lists+openrisc@lfdr.de>; Mon,  7 Oct 2019 11:52:17 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id CDA402063F;
	Mon,  7 Oct 2019 11:52:16 +0200 (CEST)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by mail.librecores.org (Postfix) with ESMTPS id 8AB162058D
 for <openrisc@lists.librecores.org>; Mon,  7 Oct 2019 10:27:02 +0200 (CEST)
Received: by mail-ot1-f66.google.com with SMTP id 41so10217626oti.12
 for <openrisc@lists.librecores.org>; Mon, 07 Oct 2019 01:27:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VKymJxaLp2SF18G9ExdMOsAdXsmgBDVfrU/If3JZGxo=;
 b=sOZDxDzNL72W59R5XOvyq0hyOyeB98CGpPLcnF6/HVO3NaKw0z/+GimqfVpt70QJL6
 1/4AnjHVG5mllQ+CqDR9sIZOKdCmqA6gpx0phyhAOphs3QWnA3oixPa7GkJbAnDIGKlc
 ns1M9nJGcRM3h/b1VYhErEEx1kydmeI9f7rWNY3zzI9uQARj2WqjxKNXqQv5SEW1cTwu
 Vzv/5f8TEFuq2oXxTZGkswAjysnc7B/ed0XgMZ2VC712IAAJmFxpWzA/5y5GZ+uK2NmY
 YgozuVjp99p+2Np33cqBgIBlqaJZV+FhY1Gfl0lyAxeNR35vk0EezSo7geeZg7op5xF9
 X46A==
X-Gm-Message-State: APjAAAVvBD18KsxEUJ1uDGQciMQW5cFRcMuSPRYZZpZuxflfemvy4cXF
 qZvRwJXahdvsf2esWKgVFhQ9VaXoUvQAVrqctTI=
X-Google-Smtp-Source: APXvYqxEOkV8nJCSllSqxdkQVypo90wcNgBvYDBNSKRgpoLJCvXTnmOdSLlUAojqzzfR9rCgupdlwodIFF5kpYpgt28=
X-Received: by 2002:a9d:17e6:: with SMTP id j93mr20339687otj.297.1570436821298; 
 Mon, 07 Oct 2019 01:27:01 -0700 (PDT)
MIME-Version: 1.0
References: <20191004145544.5066-1-krzk@kernel.org>
 <20191004145544.5066-3-krzk@kernel.org>
In-Reply-To: <20191004145544.5066-3-krzk@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Oct 2019 10:26:49 +0200
Message-ID: <CAMuHMdW0DSujexoGq4CJAYP40DvMcigk08aEnyQ72haY6jds5Q@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Mailman-Approved-At: Mon, 07 Oct 2019 11:52:13 +0200
Subject: Re: [OpenRISC] [RESEND TRIVIAL 3/3] treewide: arch: Fix Kconfig
 indentation
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-efi <linux-efi@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>, linux-iio@vger.kernel.org,
 linux-pci <linux-pci@vger.kernel.org>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 platform-driver-x86@vger.kernel.org, linux-ide@vger.kernel.org,
 dm-devel@redhat.com, keyrings@vger.kernel.org,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, ac100@lists.launchpad.net,
 linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 scsi <linux-scsi@vger.kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, esc.storagedev@microsemi.com,
 linux-security-module@vger.kernel.org, linux-clk <linux-clk@vger.kernel.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 bcm-kernel-feedback-list@broadcom.com,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 linux-input@vger.kernel.org, xen-devel@lists.xenproject.org,
 virtualization@lists.linux-foundation.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>,
 driverdevel <devel@driverdev.osuosl.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-um@lists.infradead.org,
 linux-block@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 openipmi-developer@lists.sourceforge.net,
 "open list:TI ETHERNET SWITCH DRIVER \(CPSW\)" <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-raid@vger.kernel.org,
 Jiri Kosina <trivial@kernel.org>, Linux MM <linux-mm@kvack.org>,
 netdev <netdev@vger.kernel.org>, Linux MMC List <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>, dmaengine@vger.kernel.org,
 linux-integrity <linux-integrity@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gRnJpLCBPY3QgNCwgMjAxOSBhdCA0OjU3IFBNIEtyenlzenRvZiBLb3psb3dza2kgPGtyemtA
a2VybmVsLm9yZz4gd3JvdGU6Cj4gQWRqdXN0IGluZGVudGF0aW9uIGZyb20gc3BhY2VzIHRvIHRh
YiAoK29wdGlvbmFsIHR3byBzcGFjZXMpIGFzIGluCj4gY29kaW5nIHN0eWxlIHdpdGggY29tbWFu
ZCBsaWtlOgo+ICAgICAkIHNlZCAtZSAncy9eICAgICAgICAvXHQvJyAtaSAqL0tjb25maWcKPgo+
IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KCj4g
IGFyY2gvbTY4ay9LY29uZmlnLmJ1cyAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgYXJjaC9t
NjhrL0tjb25maWcuZGVidWcgICAgICAgICAgICAgICAgfCAxNiArKysrKysrKy0tLS0tLS0tCj4g
IGFyY2gvbTY4ay9LY29uZmlnLm1hY2hpbmUgICAgICAgICAgICAgIHwgIDggKysrKy0tLS0KCkZv
ciBtNjhrOgpBY2tlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9y
Zz4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0t
IApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMy
IC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGgg
dGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRh
bGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5n
IGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2
YWxkcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVu
UklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9s
aXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
