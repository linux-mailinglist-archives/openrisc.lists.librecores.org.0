Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C127B35F075
	for <lists+openrisc@lfdr.de>; Wed, 14 Apr 2021 11:10:50 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5833F21324;
	Wed, 14 Apr 2021 11:10:50 +0200 (CEST)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by mail.librecores.org (Postfix) with ESMTPS id 1848620D48
 for <openrisc@lists.librecores.org>; Wed, 14 Apr 2021 11:10:48 +0200 (CEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FKxXQ05PXz9txRC;
 Wed, 14 Apr 2021 11:10:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 0zeBA9ZPccDQ; Wed, 14 Apr 2021 11:10:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FKxXP4rdvz9ttBY;
 Wed, 14 Apr 2021 11:10:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BE0B88B7BC;
 Wed, 14 Apr 2021 11:10:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id QZ2BMSlNARn7; Wed, 14 Apr 2021 11:10:46 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 098558B7BA;
 Wed, 14 Apr 2021 11:10:44 +0200 (CEST)
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
 Vineet Gupta <vgupta@synopsys.com>, Russell King <linux@armlinux.org.uk>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Brian Cain <bcain@codeaurora.org>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>
References: <20210414165808.458a3d11@xhacker.debian>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <44bdf1f1-117d-0f10-fc59-9edd32d1ad61@csgroup.eu>
Date: Wed, 14 Apr 2021 11:10:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210414165808.458a3d11@xhacker.debian>
Content-Language: fr
Subject: Re: [OpenRISC] [PATCH] init: consolidate trap_init()
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
Cc: uclinux-h8-devel@lists.sourceforge.jp, linux-parisc@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

CgpMZSAxNC8wNC8yMDIxIMOgIDEwOjU4LCBKaXNoZW5nIFpoYW5nIGEgw6ljcml0wqA6Cj4gTWFu
eSBhcmNoaXRlY3R1cmVzIGltcGxlbWVudCB0aGUgdHJhcF9pbml0KCkgYXMgTk9QLCBzaW5jZSB0
aGVyZSBpcwo+IG5vIHN1Y2ggZGVmYXVsdCBmb3IgdHJhcF9pbml0KCksIHRoaXMgZW1wdHkgc3R1
YiBpcyBkdXBsaWNhdGVkIGFtb25nCj4gdGhlc2UgYXJjaGl0ZWN0dXJlcy4gUHJvdmlkZSBhIGdl
bmVyaWMgYnV0IHdlYWsgTk9QIGltcGxlbWVudGF0aW9uCj4gdG8gZHJvcCB0aGUgZW1wdHkgc3R1
YnMgb2YgdHJhcF9pbml0KCkgaW4gdGhlc2UgYXJjaGl0ZWN0dXJlcy4KCllvdSBkZWZpbmUgdGhl
IHdlYWsgZnVuY3Rpb24gaW4gdGhlIF9faW5pdCBzZWN0aW9uLgoKTW9zdCBidXQgbm90IGFsbCBh
cmNoaXRlY3R1cmVzIGhhZCBpdCBpbiBfX2luaXQgc2VjdGlvbi4KCkFuZCB0aGUgcmVtYWluaW5n
IG9uZXMgbWF5IG5vdCBiZSBkZWZpbmVkIGluIF9faW5pdCBzZWN0aW9uLiBGb3IgaW5zdGFuY2Ug
bG9vayBhdCB0aGUgb25lIGluIGFscGhhIAphcmNoaXRlY3R1cmUuCgpIYXZlIHlvdSBjaGVja2Vk
IHRoYXQgaXQgaXMgbm90IGEgcHJvYmxlbSA/IEl0IHdvdWxkIGJlIGdvb2QgdG8gc2F5IHNvbWV0
aGluZyBhYm91dCBpdCBpbiB0aGUgY29tbWl0IApkZXNjcmlwdGlvbi4KCgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEppc2hlbmcgWmhhbmcgPEppc2hlbmcuWmhhbmdAc3luYXB0aWNzLmNvbT4KPiAtLS0K
PiAgIGFyY2gvYXJjL2tlcm5lbC90cmFwcy5jICAgICAgfCAgNSAtLS0tLQo+ICAgYXJjaC9hcm0v
a2VybmVsL3RyYXBzLmMgICAgICB8ICA1IC0tLS0tCj4gICBhcmNoL2g4MzAwL2tlcm5lbC90cmFw
cy5jICAgIHwgMTMgLS0tLS0tLS0tLS0tLQo+ICAgYXJjaC9oZXhhZ29uL2tlcm5lbC90cmFwcy5j
ICB8ICA0IC0tLS0KPiAgIGFyY2gvbmRzMzIva2VybmVsL3RyYXBzLmMgICAgfCAgNSAtLS0tLQo+
ICAgYXJjaC9uaW9zMi9rZXJuZWwvdHJhcHMuYyAgICB8ICA1IC0tLS0tCj4gICBhcmNoL29wZW5y
aXNjL2tlcm5lbC90cmFwcy5jIHwgIDUgLS0tLS0KPiAgIGFyY2gvcGFyaXNjL2tlcm5lbC90cmFw
cy5jICAgfCAgNCAtLS0tCj4gICBhcmNoL3Bvd2VycGMva2VybmVsL3RyYXBzLmMgIHwgIDUgLS0t
LS0KPiAgIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgICAgfCAgNSAtLS0tLQo+ICAgYXJjaC91
bS9rZXJuZWwvdHJhcC5jICAgICAgICB8ICA0IC0tLS0KPiAgIGluaXQvbWFpbi5jICAgICAgICAg
ICAgICAgICAgfCAgMiArKwo+ICAgMTIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA2
MCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaW5pdC9tYWluLmMgYi9pbml0L21haW4u
Ywo+IGluZGV4IDUzYjI3ODg0NWI4OC4uNGJkYmUyOTI4NTMwIDEwMDY0NAo+IC0tLSBhL2luaXQv
bWFpbi5jCj4gKysrIGIvaW5pdC9tYWluLmMKPiBAQCAtNzkwLDYgKzc5MCw4IEBAIHN0YXRpYyBp
bmxpbmUgdm9pZCBpbml0Y2FsbF9kZWJ1Z19lbmFibGUodm9pZCkKPiAgIH0KPiAgICNlbmRpZgo+
ICAgCj4gK3ZvaWQgX19pbml0IF9fd2VhayB0cmFwX2luaXQodm9pZCkgeyB9Cj4gKwoKSSB0aGlu
ayBpbiBhIEMgZmlsZSB3ZSBkb24ndCB0cnkgdG8gc2F2ZSBzcGFjZSBhcyBtdWNoIGFzIGluIGEg
aGVhZGVyIGZpbGUuCgpJIHdvdWxkIHByZWZlciBzb21ldGhpbmcgbGlrZToKCgp2b2lkIF9faW5p
dCBfX3dlYWsgdHJhcF9pbml0KHZvaWQpCnsKfQoKCj4gICAvKiBSZXBvcnQgbWVtb3J5IGF1dG8t
aW5pdGlhbGl6YXRpb24gc3RhdGVzIGZvciB0aGlzIGJvb3QuICovCj4gICBzdGF0aWMgdm9pZCBf
X2luaXQgcmVwb3J0X21lbWluaXQodm9pZCkKPiAgIHsKPiAKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVND
QGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGlu
Zm8vb3BlbnJpc2MK
