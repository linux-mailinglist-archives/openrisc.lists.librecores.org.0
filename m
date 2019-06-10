Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 69939429C7
	for <lists+openrisc@lfdr.de>; Wed, 12 Jun 2019 16:48:01 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C346C20284;
	Wed, 12 Jun 2019 16:48:00 +0200 (CEST)
Received: from mx.kolabnow.com (mx.kolabnow.com [95.128.36.42])
 by mail.librecores.org (Postfix) with ESMTPS id 290F9200E4
 for <openrisc@lists.librecores.org>; Mon, 10 Jun 2019 18:25:42 +0200 (CEST)
Received: from localhost (unknown [127.0.0.1])
 by ext-mx-out003.mykolab.com (Postfix) with ESMTP id 1FF58403E2;
 Mon, 10 Jun 2019 18:25:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:message-id:date:date:subject:subject
 :from:from:received:received:received; s=dkim20160331; t=
 1560183940; x=1561998341; bh=ySLNIX1jiCqldrmER8p/c1YOLUiUU7vfIBo
 k3u7v1yA=; b=Qbjr2lAFN/nwTVFb3YkUWU/8tkK2xRuhjZsLMgdCND9R34aGoNh
 L2rcHMjFoWIBOEyBgi+MymRMgil8vhsvUkvUoupC7SoATMEh/iy6YPVpjA+5H4ji
 Sq9azbND3/SSpkJHQo81xewDfs7u1H8fnDh9kVM4AjM48YEfBXsuVqT4rapzKmul
 1Ei88sIKitJClBwofZmi6InRA8gbKUKcVg7DR+C8Og1oKRbf3v3PTi2BIL/5Ow+m
 fE5WCn3ir1WHhOXjbX9mYQIY6ionQ0oEGjmBF7gnqu8ILBGEfAUdczCqRfLLNKCu
 Mgna0odiTpKA/ttrTXGmAUMaLJYKwuOFR2wMFJm6jNdjUVsq50EPgBNt5hojESRK
 ARVzFlktwS9I7Dg3zxTTNCvNs1SDiPwRgnX2zRa6o2Hrxw0ZA9SD5NGvxwjwYkXn
 RcfHGYEqdsFjfhrPUKzbyHovzfhc/DvM6es5MEDChVM6hbtU3ebGQuYz5ZzCLoU5
 Tf5CE5ptqRaJnjqoewc+2I8Ou8dWd2AozVQYRI4NAjcWVDkkpXeNqNKSa8KUmZ9G
 AbcsC0D7p3FXd28Z6d8F8A8HeKobEE1AM4rGfzQsMzvMT1TA0Dv5erAQVa/NLGEs
 kZJ5ZtcjwU/5TJ6pEvxuxKdns93Yhvd/oWDj/yITosqRFhYy+AwM5lfQ=
X-Virus-Scanned: amavisd-new at mykolab.com
X-Spam-Flag: NO
X-Spam-Score: -1.9
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 tagged_above=-10 required=5
 tests=[BAYES_00=-1.9] autolearn=unavailable autolearn_force=no
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out003.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n9ph0Cuw_TXP; Mon, 10 Jun 2019 18:25:40 +0200 (CEST)
Received: from int-mx002.mykolab.com (unknown [10.9.13.2])
 by ext-mx-out003.mykolab.com (Postfix) with ESMTPS id 3D67D403AA;
 Mon, 10 Jun 2019 18:25:39 +0200 (CEST)
Received: from ext-subm003.mykolab.com (unknown [10.9.6.3])
 by int-mx002.mykolab.com (Postfix) with ESMTPS id 6CFED3431;
 Mon, 10 Jun 2019 18:25:38 +0200 (CEST)
From: Federico Vaga <federico.vaga@vaga.pv.it>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Date: Mon, 10 Jun 2019 18:25:36 +0200
Message-ID: <6349042.qd6NX4z2Zd@harkonnen>
In-Reply-To: <3d40d111d0512d785b6a67573772f532f88d2359.1560045490.git.mchehab+samsung@kernel.org>
References: <cover.1560045490.git.mchehab+samsung@kernel.org>
 <3d40d111d0512d785b6a67573772f532f88d2359.1560045490.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 12 Jun 2019 16:47:59 +0200
Subject: Re: [OpenRISC] [PATCH v3 14/33] docs: kbuild: convert docs to ReST
 and rename to *.rst
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
Cc: , linux-wireless@vger.kernel.org, linux-fbdev@vger.kernel.org,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	bridge@lists.linux-foundation.org,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Palmer Dabbelt <palmer@sifive.com>, alsa-devel@alsa-project.org,
	dri-devel@lists.freedesktop.org, Ofer Levi <oferle@mellanox.com>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Harry Wei <harryxiyou@gmail.com>, Paul Mackerras <paulus@samba.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-kbuild@vger.kernel.org, linux-riscv@lists.infradead.org,
	Vincent Chen <deanbo422@gmail.com>,
	Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
	Jonas Bonn <jonas@southpole.se>,
	Alex Shi <alex.shi@linux.alibaba.com>, linux-c6x-dev@linux-c6x.org,
	linux-scsi@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
	netdev@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
	coreteam@netfilter.org, Mark Salter <msalter@redhat.com>,
	Al exey Kuznetsov <kuznet@ms2.inr.ac.ru>,
	linux-snps-arc@lists.infradead.org,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>, devel@driverdev.osuosl.org,
	Albert Ou <aou@eecs.berkeley.edu>,
	Johannes Berg <johannes.berg@intel.com>,
	Intel Linux Wireless <linuxwifi@intel.com>,
	Nikolay Aleksandrov <nikolay@cumulusnetworks.com>,
	David Woodhouse <dwmw2@infradead.or>,
	Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>,
	Mauro Carvalho Chehab <mchehab@infradead.org>,
	openrisc@lists.librecores.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Greentime Hu <green.hu@gmail.com>, linux-mtd@lists.infradead.org,
	Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
	Kalle Valo <kvalo@codeaurora.org>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Jon Maloy <jon.maloy@ericsson.com>, Michal Simek <monstr@monstr.eu>,
	Michal Marek <michal.lkml@markovi.net>,
	netfilter-devel@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	g@lists.librecores.org, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	Vineet Gupta <vgupta@synopsys.com>, linux-usb@vger.kernel.org,
	Florian Westphal <fw@strlen.de>, linux-kernel@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>,
	Roopa Prabhu <roopa@cumulusnetworks.com>,
	Richard Weinberger <richard@nod.at>,
	Ying Xue <ying.xue@windriver.com>,
	Luca Coelho <luciano.coelho@intel.com>,
	Brian Norris <computersforpeace@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	"David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SW4gZGF0YSBTdW5kYXksIEp1bmUgOSwgMjAxOSA0OjI3OjA0IEFNIENFU1QsIE1hdXJvIENhcnZh
bGhvIENoZWhhYiBoYSAKc2NyaXR0bzoKPiBUaGUga2J1aWxkIGRvY3VtZW50YXRpb24gY2xlYXJs
eSBzaG93cyB0aGF0IHRoZSBkb2N1bWVudHMKPiB0aGVyZSBhcmUgd3JpdHRlbiBhdCBkaWZmZXJl
bnQgdGltZXM6IHNvbWUgdXNlIG1hcmtkb3duLAo+IHNvbWUgdXNlIHRoZWlyIG93biBwZWN1bGlh
ciBsb2dpYyB0byBzcGxpdCBzZWN0aW9ucy4KPiAKPiBDb252ZXJ0IGV2ZXJ5dGhpbmcgdG8gUmVT
VCB3aXRob3V0IGFmZmVjdGluZyB0b28gbXVjaAo+IHRoZSBhdXRob3IncyBzdHlsZSBhbmQgYXZv
aWRpbmcgYWRkaW5nIHVuZWVkZWQgbWFya3Vwcy4KPiAKPiBUaGUgY29udmVyc2lvbiBpcyBhY3R1
YWxseToKPiAgIC0gYWRkIGJsYW5rIGxpbmVzIGFuZCBpZGVudGF0aW9uIGluIG9yZGVyIHRvIGlk
ZW50aWZ5IHBhcmFncmFwaHM7Cj4gICAtIGZpeCB0YWJsZXMgbWFya3VwczsKPiAgIC0gYWRkIHNv
bWUgbGlzdHMgbWFya3VwczsKPiAgIC0gbWFyayBsaXRlcmFsIGJsb2NrczsKPiAgIC0gYWRqdXN0
IHRpdGxlIG1hcmt1cHMuCj4gCj4gQXQgaXRzIG5ldyBpbmRleC5yc3QsIGxldCdzIGFkZCBhIDpv
cnBoYW46IHdoaWxlIHRoaXMgaXMgbm90IGxpbmtlZCB0bwo+IHRoZSBtYWluIGluZGV4LnJzdCBm
aWxlLCBpbiBvcmRlciB0byBhdm9pZCBidWlsZCB3YXJuaW5ncy4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWIrc2Ftc3VuZ0BrZXJuZWwub3JnPgo+IC0t
LQo+ICBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL1JFQURNRS5yc3QgICAgICAgICAgfCAgIDIg
Ky0KPiAgLi4uZWFkZXJzX2luc3RhbGwudHh0ID0+IGhlYWRlcnNfaW5zdGFsbC5yc3R9IHwgICA1
ICstCj4gIERvY3VtZW50YXRpb24va2J1aWxkL2luZGV4LnJzdCAgICAgICAgICAgICAgICB8ICAy
NyArCj4gIERvY3VtZW50YXRpb24va2J1aWxkL2lzc3Vlcy5yc3QgICAgICAgICAgICAgICB8ICAx
MSArCj4gIC4uLi9rYnVpbGQve2tidWlsZC50eHQgPT4ga2J1aWxkLnJzdH0gICAgICAgICB8IDEx
OSArKy0tCj4gIC4uLm5maWctbGFuZ3VhZ2UudHh0ID0+IGtjb25maWctbGFuZ3VhZ2UucnN0fSB8
IDIzMiArKysrLS0tLQo+ICAuLi5hbmd1YWdlLnR4dCA9PiBrY29uZmlnLW1hY3JvLWxhbmd1YWdl
LnJzdH0gfCAgMzcgKy0KPiAgLi4uL2tidWlsZC97a2NvbmZpZy50eHQgPT4ga2NvbmZpZy5yc3R9
ICAgICAgIHwgMTM2ICsrKy0tCj4gIC4uLi9rYnVpbGQve21ha2VmaWxlcy50eHQgPT4gbWFrZWZp
bGVzLnJzdH0gICB8IDUzMCArKysrKysrKysrKy0tLS0tLS0KPiAgLi4uL2tidWlsZC97bW9kdWxl
cy50eHQgPT4gbW9kdWxlcy5yc3R9ICAgICAgIHwgMTY4ICsrKy0tLQo+ICBEb2N1bWVudGF0aW9u
L2tlcm5lbC1oYWNraW5nL2hhY2tpbmcucnN0ICAgICAgfCAgIDQgKy0KPiAgRG9jdW1lbnRhdGlv
bi9wcm9jZXNzL2NvZGluZy1zdHlsZS5yc3QgICAgICAgIHwgICAyICstCj4gIERvY3VtZW50YXRp
b24vcHJvY2Vzcy9zdWJtaXQtY2hlY2tsaXN0LnJzdCAgICB8ICAgMiArLQo+ICAuLi4vaXRfSVQv
a2VybmVsLWhhY2tpbmcvaGFja2luZy5yc3QgICAgICAgICAgfCAgIDQgKy0KPiAgLi4uL2l0X0lU
L3Byb2Nlc3MvY29kaW5nLXN0eWxlLnJzdCAgICAgICAgICAgIHwgICAyICstCj4gIC4uLi9pdF9J
VC9wcm9jZXNzL3N1Ym1pdC1jaGVja2xpc3QucnN0ICAgICAgICB8ICAgMiArLQoKTGltaXRlZCB0
byB0cmFuc2xhdGlvbnMvaXRfSVQKCkFja2VkLWJ5OiBGZWRlcmljbyBWYWdhIDxmZWRlcmljby52
YWdhQHZhZ2EucHYuaXQ+Cgo+ICAuLi4vemhfQ04vcHJvY2Vzcy9jb2Rpbmctc3R5bGUucnN0ICAg
ICAgICAgICAgfCAgIDIgKy0KPiAgLi4uL3poX0NOL3Byb2Nlc3Mvc3VibWl0LWNoZWNrbGlzdC5y
c3QgICAgICAgIHwgICAyICstCj4gIEtjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgMiArLQo+ICBhcmNoL2FyYy9wbGF0LWV6bnBzL0tjb25maWcgICAgICAg
ICAgICAgICAgICAgfCAgIDIgKy0KPiAgYXJjaC9jNngvS2NvbmZpZyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgICAyICstCj4gIGFyY2gvbWljcm9ibGF6ZS9LY29uZmlnLmRlYnVnICAg
ICAgICAgICAgICAgICB8ICAgMiArLQo+ICBhcmNoL21pY3JvYmxhemUvS2NvbmZpZy5wbGF0Zm9y
bSAgICAgICAgICAgICAgfCAgIDIgKy0KPiAgYXJjaC9uZHMzMi9LY29uZmlnICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgICAyICstCj4gIGFyY2gvb3BlbnJpc2MvS2NvbmZpZyAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgMiArLQo+ICBhcmNoL3Bvd2VycGMvc3lzZGV2L0tjb25maWcg
ICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KPiAgYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgICAyICstCj4gIGRyaXZlcnMvYXV4ZGlzcGxheS9LY29uZmln
ICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQo+ICBkcml2ZXJzL2Zpcm13YXJlL0tjb25maWcg
ICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KPiAgZHJpdmVycy9tdGQvZGV2aWNlcy9LY29u
ZmlnICAgICAgICAgICAgICAgICAgIHwgICAyICstCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L3Nt
c2MvS2NvbmZpZyAgICAgICAgICAgICB8ICAgNiArLQo+ICBkcml2ZXJzL25ldC93aXJlbGVzcy9p
bnRlbC9pd2xlZ2FjeS9LY29uZmlnICAgfCAgIDQgKy0KPiAgZHJpdmVycy9uZXQvd2lyZWxlc3Mv
aW50ZWwvaXdsd2lmaS9LY29uZmlnICAgIHwgICAyICstCj4gIGRyaXZlcnMvcGFycG9ydC9LY29u
ZmlnICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQo+ICBkcml2ZXJzL3Njc2kvS2NvbmZp
ZyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDQgKy0KPiAgZHJpdmVycy9zdGFnaW5nL3Nt
NzUwZmIvS2NvbmZpZyAgICAgICAgICAgICAgIHwgICAyICstCj4gIGRyaXZlcnMvdXNiL21pc2Mv
S2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICB8ICAgNCArLQo+ICBkcml2ZXJzL3ZpZGVvL2Zi
ZGV2L0tjb25maWcgICAgICAgICAgICAgICAgICAgfCAgMTQgKy0KPiAgbmV0L2JyaWRnZS9uZXRm
aWx0ZXIvS2NvbmZpZyAgICAgICAgICAgICAgICAgIHwgICAyICstCj4gIG5ldC9pcHY0L25ldGZp
bHRlci9LY29uZmlnICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQo+ICBuZXQvaXB2Ni9uZXRm
aWx0ZXIvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KPiAgbmV0L25ldGZpbHRl
ci9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDE2ICstCj4gIG5ldC90aXBjL0tj
b25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQo+ICBzY3JpcHRzL0ti
dWlsZC5pbmNsdWRlICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDQgKy0KPiAgc2NyaXB0cy9N
YWtlZmlsZS5ob3N0ICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICstCj4gIHNjcmlwdHMv
a2NvbmZpZy9zeW1ib2wuYyAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQo+ICAuLi4vdGVz
dHMvZXJyX3JlY3Vyc2l2ZV9kZXAvZXhwZWN0ZWRfc3RkZXJyICAgfCAgMTQgKy0KPiAgc291bmQv
b3NzL2RtYXNvdW5kL0tjb25maWcgICAgICAgICAgICAgICAgICAgIHwgICA2ICstCj4gIDQ4IGZp
bGVzIGNoYW5nZWQsIDg0MCBpbnNlcnRpb25zKCspLCA1NjEgZGVsZXRpb25zKC0pCj4gIHJlbmFt
ZSBEb2N1bWVudGF0aW9uL2tidWlsZC97aGVhZGVyc19pbnN0YWxsLnR4dCA9PiBoZWFkZXJzX2lu
c3RhbGwucnN0fQo+ICg5NiUpIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2tidWls
ZC9pbmRleC5yc3QKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24va2J1aWxkL2lz
c3Vlcy5yc3QKPiAgcmVuYW1lIERvY3VtZW50YXRpb24va2J1aWxkL3trYnVpbGQudHh0ID0+IGti
dWlsZC5yc3R9ICg3MiUpCj4gIHJlbmFtZSBEb2N1bWVudGF0aW9uL2tidWlsZC97a2NvbmZpZy1s
YW5ndWFnZS50eHQgPT4ga2NvbmZpZy1sYW5ndWFnZS5yc3R9Cj4gKDg1JSkgcmVuYW1lIERvY3Vt
ZW50YXRpb24va2J1aWxkL3trY29uZmlnLW1hY3JvLWxhbmd1YWdlLnR4dCA9Pgo+IGtjb25maWct
bWFjcm8tbGFuZ3VhZ2UucnN0fSAoOTQlKSByZW5hbWUgRG9jdW1lbnRhdGlvbi9rYnVpbGQve2tj
b25maWcudHh0Cj4gPT4ga2NvbmZpZy5yc3R9ICg4MCUpCj4gIHJlbmFtZSBEb2N1bWVudGF0aW9u
L2tidWlsZC97bWFrZWZpbGVzLnR4dCA9PiBtYWtlZmlsZXMucnN0fSAoODMlKQo+ICByZW5hbWUg
RG9jdW1lbnRhdGlvbi9rYnVpbGQve21vZHVsZXMudHh0ID0+IG1vZHVsZXMucnN0fSAoODQlKQoK
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5S
SVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xp
c3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
