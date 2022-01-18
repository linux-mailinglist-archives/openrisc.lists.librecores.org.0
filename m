Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id CD5F149207F
	for <lists+openrisc@lfdr.de>; Tue, 18 Jan 2022 08:48:41 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5DA1A2403C;
	Tue, 18 Jan 2022 08:48:41 +0100 (CET)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by mail.librecores.org (Postfix) with ESMTPS id F191820169
 for <openrisc@lists.librecores.org>; Tue, 18 Jan 2022 08:48:39 +0100 (CET)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 45C3468AFE; Tue, 18 Jan 2022 08:48:36 +0100 (CET)
Date: Tue, 18 Jan 2022 08:48:36 +0100
From: Christoph Hellwig <hch@lst.de>
To: Richard Henderson <rth@twiddle.net>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
 Guo Ren <guoren@kernel.org>, Brian Cain <bcain@codeaurora.org>,
 Michal Simek <monstr@monstr.eu>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 "David S. Miller" <davem@davemloft.net>,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>
Message-ID: <20220118074836.GA20994@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: [OpenRISC] architectures that still need to remove set_fs()
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
Cc: linux-xtensa@linux-xtensa.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-kernel@linux-xtensa.org, linux-arch@linux-xtensa.org,
 linux-csky@vger.kernel.org, openrisc@lists.librecores.org,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgYWxsLAoKeW91IGFyZSBpbiB0aGlzIGxpc3QgYmVjYXVzZSB5b3VyIGFyY2hpdGVjdHVyZSBz
dGlsbCBpbXBsZW1lbnRzIGFuZAp1c2VzIGFkZHJlc3Mgc3BhY2Ugb3ZlcnJpZGVzIHVzaW5nIHNl
dF9mcygpLCB3aGljaCBhcmUgZGVwcmVjYXRlZCBhbmQKaGF2ZSBiZWVuIHJlbW92ZWQgZnJvbSBh
bGwgbWFpbnN0cmVhbSBhcmNoaXRlY3R1cmUgcG9ydHMuICBUbyBoZWxwCmNsZWFudXAgdGhlIGNv
cmUga2VybmVsIGl0IHdvdWxkIGJlIGdyZWF0IHRvIG1ha2UgcHJvZ3Jlc3Mgb24gcmVtb3ZpbmcK
c2V0X2ZzIGVudGlyZWx5LgoKVGhlIGZvbGxvd2luZyBzdGVwcyBhcmUgcmVxdWlyZWQ6CgogKDEp
IGltcGxlbWVudCB0aGUgX19nZXRfa2VybmVsX25vZmF1bHQgYW5kIF9fcHV0X2tlcm5lbF9ub2Zh
dWx0CiAgICAgaGVscGVyIHRvIGFjY2VzcyBrZXJuZWwgbWVtb3J5IHdpdGhvdXQgcGFnZSBmYXVs
dHMsIHJlcGxhY2luZwogICAgIHRoZSBnZXQvcHV0X3VzZXIgdW5kZXIgc2V0X2ZzKEtFUk5FTF9E
UykgYWJ1c2UuICBNaXBzIGhhcyBhIGdvb2QKICAgICBleGFtcGxlIGZvciBhIHRyaXZpYWwgaW1w
bGVtZW50YXRpb24gZm9yIGFyY2hpdGVjdHVyZXMgdGhhdCB1c2UKICAgICBhIGNvbW1vbiBhZGRy
ZXNzIHNwYWNlIGluIGNvbW1pdCAwNDMyNGY0NGNiNjkKICgyKSByZW1vdmUgYW55IGFyY2hpdGVj
dHVyZSBzcGVjaWZpYyB1c2Ugb2Ygc3VjaCBjb25zdHJ1Y3RzLiAgVGhpcwogICAgIG9ubHkgYWZm
ZWN0cyBpYTY0IGFuZCBzaC4KICgzKSBzdG9wIHNlbGVjdGluZyB0aGUgU0VUX0ZTIGFuZCByZW1v
dmUgYWxsIHRoZSBzZXRfZnMtcmVsYXRlZAogICAgIGluZnJhc3RydWN0dXJlLiAgVGhlIGFib3Zl
IG1pcHMgY29tbWl0IGlzIGEgZ29vZCBndWlkZSBvbmNlIGFnYWluLgoKVGhhbmtzIQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5n
IGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNv
cmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
