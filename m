Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C2724F7420
	for <lists+openrisc@lfdr.de>; Mon, 11 Nov 2019 13:37:47 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A0089207FA;
	Mon, 11 Nov 2019 13:37:47 +0100 (CET)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by mail.librecores.org (Postfix) with ESMTPS id B85162079C
 for <openrisc@lists.librecores.org>; Mon, 11 Nov 2019 11:27:45 +0100 (CET)
Received: from mail-qk1-f181.google.com ([209.85.222.181]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MdeSt-1hum2L3bfN-00ZgME for <openrisc@lists.librecores.org>; Mon, 11 Nov
 2019 11:27:45 +0100
Received: by mail-qk1-f181.google.com with SMTP id h15so10658471qka.13
 for <openrisc@lists.librecores.org>; Mon, 11 Nov 2019 02:27:44 -0800 (PST)
X-Gm-Message-State: APjAAAUqgUIpy3TDLwkFo3GyuNIaVxN71fYIvcgHxq/HOTka0z9lsIBk
 tk78QKUf+Hey1g9OLQDaYfHmRHUzyHUlDfc/2Q4=
X-Google-Smtp-Source: APXvYqyGcZLqyAcsV/LYDmC4LmwcrdvTKQ+w9XPWbssEa676VSOvhgPE+TuvbqMkbxFWBQMzT6WHPBHBJZYF9AVQbpE=
X-Received: by 2002:a37:4f0a:: with SMTP id d10mr9711437qkb.286.1573468063366; 
 Mon, 11 Nov 2019 02:27:43 -0800 (PST)
MIME-Version: 1.0
References: <20191029064834.23438-1-hch@lst.de>
 <20191029064834.23438-11-hch@lst.de>
 <CAK8P3a2o4R+E2hTrHrmNy7K1ki3_98aWE5a-fjkQ_NWW=xd_gQ@mail.gmail.com>
 <20191111101531.GA12294@lst.de>
In-Reply-To: <20191111101531.GA12294@lst.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 11 Nov 2019 11:27:27 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0rTvfPP2LUMw8EC0xz5gfZP5+NUkoaZBJrtYYfr6YRig@mail.gmail.com>
Message-ID: <CAK8P3a0rTvfPP2LUMw8EC0xz5gfZP5+NUkoaZBJrtYYfr6YRig@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Provags-ID: V03:K1:ftaqnqNdEYHJcAaLD5jJoclbBPuKkl0J0KAzWo6IdVtITZTUBWJ
 C612AHPq/x8dCzXG/yqFI7EerCkv/b1IXoKOBJ2AdUsCLYWIS/bQMDo6+BPfgy1mwQMwN+4
 YGiDNYqn/48J16RkNIoixTNA3+Z7YUM9Iuh47FA2bvgIl6pOg0F0Yt3shzWy0DwJOkxDK25
 JyxBB0BgKggkh4BV4w/bg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZzxhgUQMy+k=:F9r93lblRoOTP3Ame72gk+
 slkq78aO4oAtWNaEUCL7USUcEbAEi57n1XW8ulRPXcht18TqAjiJSYfbE3Y7NZQyYn8f4dhag
 bd6TN2j2nrl1wcNFQrnMXqjqiZI3UZKr4M64JOvgXGmuR0oG8KZhZYg4daijvrTjJuTA/7UJ0
 oKXiK+mxcE2KqlZqJCyZDtz4Pf3CjBJxHLaER7uY2eUXWrbP7qTCqtCYdADBlI5gl/6jLTJ39
 1m02z3avbqKZJ+dOu00Rx55uwSjZIv/XSKEPPKMcxaqhK/VONYhJQ0kRcWFfXjjssrv7sW+8X
 txuvXUlUeXBRU30RE1jZ3aATmJ8l346bcGCmpB4/CRoG76J31VepY0TlV5yQjFdyBFoczbnDi
 XYy2LQ4AP4COcsWv3GGqUZyYmY9TfyRsrrF6Db6xiwH5cO8ne48ing9vKwS6w7/o8NDtb0PEp
 fU/+a5J+/ZW+EnjZnVh4rzhx0LKZIqnfZX9CobMIUR38bhD4QgkWfiCcLN0FL3A/ODa3RK9/I
 JhAHixRabmNPgqjjfBt17oVea3ivj7fiE7yd5SC4SRdcBEjk4J0K834GZRp6J3vzlmIfWmfwy
 AwhmALCtexPwK1cT+x7T96J1q9oIFTJ/PHizd6v02uJfbxhGebG04p3mKp943JBB+1gecGPTd
 R6VOHX0FgStp+zlhPu1O87xykyH3Z2JNFvBLWW8QYH9K0Xt+mSYZJ2bhgZhrlWsxGrxa/2nOj
 bwoqtZ7EdoRE5PMJvEu/OYW/q9TOflGnmqsdkbtN3xv4ldRfwWtN1V2FG3WCp7Nxn/qyoVgMp
 zNXbbLBKsmn+LxcqIpvkFnrPV0fws9E/uJsAto0+q2TJJzLUtqLBTje6q/OLKlJT3fl0U4EPn
 vsVOTY5HnHfIk5/6mbYA==
X-Mailman-Approved-At: Mon, 11 Nov 2019 13:37:30 +0100
Subject: Re: [OpenRISC] [PATCH 10/21] asm-generic: ioremap_uc should behave
 the same with and without MMU
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
Cc: linux-ia64@vger.kernel.org, Linux-sh list <linux-sh@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@kernel.org>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 linux-xtensa@linux-xtensa.org, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 openrisc@lists.librecores.org, Greentime Hu <green.hu@gmail.com>,
 "moderated list:NIOS2 ARCHITECTURE" <nios2-dev@lists.rocketboards.org>,
 Guan Xuetao <gxt@pku.edu.cn>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>, Parisc List <linux-parisc@vger.kernel.org>,
 linux-mips@vger.kernel.org, alpha <linux-alpha@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBOb3YgMTEsIDIwMTkgYXQgMTE6MTUgQU0gQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBs
c3QuZGU+IHdyb3RlOgo+Cj4gT24gTW9uLCBOb3YgMTEsIDIwMTkgYXQgMTE6MDk6MDVBTSArMDEw
MCwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiA+IE1heWJlIHdlIGNvdWxkIG1vdmUgdGhlIGRlZmlu
aXRpb24gaW50byB0aGUgYXR5ZmIgZHJpdmVyIGl0c2VsZj8KPiA+Cj4gPiBBcyBJIHVuZGVyc3Rh
bmQgaXQsIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gaW9yZW1hcCgpL2lvcmVtYXBfbm9jYWNoZSgp
Cj4gPiBhbmQgaW9yZW1hcF91YygpIG9ubHkgZXhpc3RzIG9uIHByZS1QQVQgeDg2LTMyIHN5c3Rl
bXMgKGkuZS4gNDg2LCBQNSwKPiA+IFBwcm8sIFBJSSwgSzYsIFZJQSBDMyksIHdoaWxlIG9uIG1v
cmUgbW9kZXJuIHN5c3RlbXMgKGFsbCBub24teDg2LAo+ID4gUGVudGl1bUlJSSwgQXRobG9uLCBW
SUEgQzcpICB0aG9zZSB0aHJlZSBhcmUgbWVhbnQgdG8gYmUgc3lub255bXMKPiA+IGFueXdheS4K
Pgo+IFRoYXQncyBub3QgaG93IEkgdW5kZXJzdG9vZCBpdC4gIEJhc2VkIG9uIHRoZSBjb2RlIGFu
ZCB0aGUgVUMtCj4gZXhwbGFuYXRpb24gaW9yZW1hcF91YyBhbHdheXMgb3ZlcnJpZGVzIHRoZSBN
VFJSLCB3aGljaCBjYW4gc3RpbGwKPiBiZSBwcmVzZW50IG9uIG1vcmUgbW9kZXJuIHg4NiBzeXN0
ZW1zLgoKQXMgSSB1bmRlcnN0YW5kLCB0aGUgcG9pbnQgaXMgdGhhdCBvbiBQQVQtZW5hYmxlZCBz
eXN0ZW1zLCB0aGUKbm9ybWFsIGlvcmVtYXAoKSAqYWxzbyogb3ZlcnJpZGVzIHRoZSBNVFJSLCBj
aXRpbmcgZnJvbQpEb2N1bWVudGF0aW9uL3g4Ni9wYXQucnN0OgoKICA9PT09ICA9PT09PT09ICA9
PT0gID09PT09PT09PT09PT09PT09PT09PT09PT0gID09PT09PT09PT09PT09PT09PT09PQogIE1U
UlIgIE5vbi1QQVQgIFBBVCAgTGludXggaW9yZW1hcCB2YWx1ZSAgICAgICAgRWZmZWN0aXZlIG1l
bW9yeSB0eXBlCiAgPT09PSAgPT09PT09PSAgPT09ICA9PT09PT09PT09PT09PT09PT09PT09PT09
ICA9PT09PT09PT09PT09PT09PT09PT0KICAgICAgICBQQVQgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgTm9uLVBBVCB8ICBQQVQKICAgICAgICB8UENEICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8CiAgICAgICAgfHxQV1QgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfAogICAgICAgIHx8fCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwKICBXQyAgICAwMDAg
ICAgICBXQiAgIF9QQUdFX0NBQ0hFX01PREVfV0IgICAgICAgICAgICAgV0MgICB8ICAgV0MKICBX
QyAgICAwMDEgICAgICBXQyAgIF9QQUdFX0NBQ0hFX01PREVfV0MgICAgICAgICAgICAgV0MqICB8
ICAgV0MKICBXQyAgICAwMTAgICAgICBVQy0gIF9QQUdFX0NBQ0hFX01PREVfVUNfTUlOVVMgICAg
ICAgV0MqICB8ICAgVUMKICBXQyAgICAwMTEgICAgICBVQyAgIF9QQUdFX0NBQ0hFX01PREVfVUMg
ICAgICAgICAgICAgVUMgICB8ICAgVUMKICA9PT09ICA9PT09PT09ICA9PT0gID09PT09PT09PT09
PT09PT09PT09PT09PT0gID09PT09PT09PT09PT09PT09PT09PQoKPiBJbiBmYWN0IEkgcmVtZW1i
ZXIgYSBwYXRjaAo+IGZsb2F0aW5nIGFyb3VuZCB2ZXJ5IHJlY2VudGx5IGFkZGluZyBhbm90aGVy
IGlvcmVtYXBfdWMgY2FsbGVyIGluCj4gc29tZSBBdG9tIHBsYXRmb3JtIGRldmljZSBkcml2ZXIg
dGhhdCB3b3JrcyBhcm91bmQgYnVnZ3kgTVRSUgo+IHRhYmxlcy4gIEFsc28gdGhpcyBzZXJpZXMg
YWN0dWFsbHkgYWRkcyBhIG5ldyBvdmVycmlkZSBhbmQgYSBmZXcKPiBjYWxsZXJzIGZvciBpYTY0
IHBsYXRmb3JtIGNvZGUsIHdoaWNoIHdvcmtzIHZlcnkgc2ltaWxhciB0byB4ODYKPiBiYXNlZCBv
biB0aGUgY29tbWVudHMgaW4gdGhlIGNvZGUuICBUaGF0IGJlaW5nIHNhaWQgSSdtIG5vdCBzdXJl
Cj4gdGhlIGNhbGxlcnMgaW4gaWE2NCBhcmUgcmVhbGx5IHJlcXVpcmVkLCBidXQgaXQgd2FzIHRo
ZSBzYWZlc3QgdGhpbmcKPiB0byBkbyBhcyBwYXJ0IG9mIHRoaXMgY2xlYW51cC4KCk9rLCBmYWly
IGVub3VnaC4gTGV0J3MganVzdCBnbyB3aXRoIHlvdXIgdmVyc2lvbiBmb3Igbm93LCBpZiBvbmx5
IHRvIG5vdApob2xkIHlvdXIgc2VyaWVzIHVwIG1vcmUuIEknZCBzdGlsbCBzdWdnZXN0IHdlIGNo
YW5nZSBhdHlmYiB0byBvbmx5CnVzZSBpb3JlbWFwX3VjKCkgb24gaTM4NiBhbmQgbWF5YmUgaWE2
NC4gSSBjYW4gc2VuZCBhIHBhdGNoIGZvciB0aGF0LgoKICAgICAgQXJuZApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QK
T3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9y
Zy9saXN0aW5mby9vcGVucmlzYwo=
