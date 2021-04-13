Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 02B9C35D925
	for <lists+openrisc@lfdr.de>; Tue, 13 Apr 2021 09:42:22 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8E97C211BC;
	Tue, 13 Apr 2021 09:42:21 +0200 (CEST)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by mail.librecores.org (Postfix) with ESMTPS id 6416E205A7
 for <openrisc@lists.librecores.org>; Tue, 13 Apr 2021 09:42:19 +0200 (CEST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1lWDgg-00036U-GT; Tue, 13 Apr 2021 09:42:18 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1lWDge-0004Vg-Qx; Tue, 13 Apr 2021 09:42:16 +0200
Date: Tue, 13 Apr 2021 09:42:16 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Stafford Horne <shorne@gmail.com>
Message-ID: <20210413074216.GF13990@pengutronix.de>
References: <20210304210747.3679483-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210304210747.3679483-1-shorne@gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:42:06 up 54 days, 11:05, 87 users,  load average: 0.16, 0.10, 0.14
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: openrisc@lists.librecores.org
Subject: Re: [OpenRISC] [PATCH] Documentation: Add qemu instructions for
 OpenRISC
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
Cc: Barebox <barebox@lists.infradead.org>,
 Openrisc <openrisc@lists.librecores.org>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gRnJpLCBNYXIgMDUsIDIwMjEgYXQgMDY6MDc6NDdBTSArMDkwMCwgU3RhZmZvcmQgSG9ybmUg
d3JvdGU6Cj4gTW9zdCBkZXZlbG9wZXJzIGhhdmUgcWVtdSBhbmQgcmF0aGVyIG5vdCBkb3dubG9h
ZCBhbmQgaW5zdGFsbCB0aGUKPiBvcjFrc2ltLiAgQWxzbywgdGhpcyBhZGRzIGRldGFpbHMgb24g
aG93IHRvIGdldCBhIG9wZW5yaXNjIHRvb2xjaGFpbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTdGFm
Zm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4KPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9ib2Fy
ZHMvb3BlbnJpc2MucnN0IHwgNjggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAx
IGZpbGUgY2hhbmdlZCwgNjggaW5zZXJ0aW9ucygrKQoKQXBwbGllZCwgdGhhbmtzCgpTYXNjaGEK
Cj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vYm9hcmRzL29wZW5yaXNjLnJzdCBiL0Rv
Y3VtZW50YXRpb24vYm9hcmRzL29wZW5yaXNjLnJzdAo+IGluZGV4IGY5ZDY3Zjk2NS4uMzQ1ODZi
NGE3IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vYm9hcmRzL29wZW5yaXNjLnJzdAo+ICsr
KyBiL0RvY3VtZW50YXRpb24vYm9hcmRzL29wZW5yaXNjLnJzdAo+IEBAIC0xLDYgKzEsNzQgQEAK
PiAgT3BlblJJU0MKPiAgPT09PT09PT0KPiAgCj4gK09wdGFpbmluZyBhbiBPcGVuUklTQyB0b29s
Y2hhaW4KPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICsKPiArVG9vbGNoYWlu
IGJpbmFyaWVzIGNhbiBiZSBvYnRhaW5lZCBmcm9tIG9wZW5yaXNjLmlvIG9yIG91ciBnaXRodWIg
cmVsZWFzZXMgcGFnZS4KPiArSW5zdHJ1Y3Rpb25zIGZvciBidWlsZGluZyB0aGUgZGlmZmVyZW50
IHRvb2xjaGFpbnMgY2FuIGJlIGZvdW5kIG9uIG9wZW5yaXNjLmlvCj4gK29yIFN0YWZmb3JkJ3Mg
dG9vbGNoYWluIGJ1aWxkIGFuZCByZWxlYXNlIHNjcmlwdHMuCj4gKwo+ICtTZWU6Cj4gKwo+ICsg
ICogaHR0cHM6Ly9naXRodWIuY29tL3N0ZmZyZGhybi9nY2MvcmVsZWFzZXMKPiArICAqIGh0dHBz
Oi8vZ2l0aHViLmNvbS9zdGZmcmRocm4vb3Ixay10b29sY2hhaW4tYnVpbGQKPiArICAqIGh0dHBz
Oi8vb3BlbnJpc2MuaW8vc29mdHdhcmUKPiArCj4gK0V4YW1wbGUgb2YgZG93bmxvYWRpbmcgYW5k
IGluc3RhbGxpbmcgYSB0b29sY2hhaW46Ogo+ICsKPiArICAkIGN1cmwgLS1yZW1vdGUtbmFtZSAt
LWxvY2F0aW9uIFwKPiArICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9zdGZmcmRocm4vZ2NjL3JlbGVh
c2VzL2Rvd25sb2FkL29yMWstMTAuMC4wLTIwMTkwNzIzL29yMWstZWxmLTEwLjAuMC0yMDE5MDcy
My50YXIueHoKPiArICAkIHRhciAteGYgb3Ixay1lbGYtMTAuMC4wLTIwMTkwNzIzLnRhci54ego+
ICsgICQgZXhwb3J0IFBBVEg9JFBBVEg6JFBXRC9vcjFrLWVsZi9iaW4KPiArCj4gK1J1bm5pbmcg
T3BlblJJU0MgYmFyZWJveCBvbiBxZW11Cj4gKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQo+ICsKPiArUnVubmluZyBiYXJlYm94IG9uIHFlbXUgaXMgc2ltaWxhciB0byBydW5uaW5nIGxp
bnV4IG9uIHFlbXUgc2VlIG1vcmUgZGV0YWlscyBvbgo+ICt0aGUgcWVtdSB3aWtpIHNpdGUgYXQg
aHR0cHM6Ly93aWtpLnFlbXUub3JnL0RvY3VtZW50YXRpb24vUGxhdGZvcm1zL09wZW5SSVNDCj4g
Kwo+ICtDb21waWxlIHRoZSBxZW11IGVtdWxhdG9yOjoKPiArCj4gKyAgJCBnaXQgY2xvbmUgaHR0
cHM6Ly9naXRsYWIuY29tL3FlbXUtcHJvamVjdC9xZW11LmdpdAo+ICsgICQgY2QgcWVtdQo+ICsg
ICQgbWtkaXIgYnVpbGQgOyBjZCBidWlsZAo+ICsgICQgLi4vY29uZmlndXJlIFwKPiArICAgIC0t
dGFyZ2V0LWxpc3Q9Im9yMWstc29mdG1tdSIgXAo+ICsgICAgLS1lbmFibGUtZmR0IFwKPiArICAg
IC0tZGlzYWJsZS1rdm0gXAo+ICsgICAgLS1kaXNhYmxlLXhlbiBcCj4gKyAgICAtLWRpc2FibGUt
eGtiY29tbW9uIFwKPiArICAgIC0tZW5hYmxlLWRlYnVnIFwKPiArICAgIC0tZW5hYmxlLWRlYnVn
LWluZm8KPiArICAkIG1ha2UKPiArCj4gK05leHQgY29tcGlsZSBiYXJlYm94OjoKPiArCj4gKyAg
JCBtYWtlIEFSQ0g9b3BlbnJpc2MgZGVmY29uZmlnCj4gKyAgLi4uCj4gKyAgJCBtYWtlIEFSQ0g9
b3BlbnJpc2MgQ1JPU1NfQ09NUElMRT1vcjFrLWVsZi0KPiArCj4gK1J1biBiYXJlYm94OjoKPiAr
Cj4gKyAgJCA8cGF0aCB0byBxZW11IHNvdXJjZT4vYnVpbGQvb3Ixay1zb2Z0bW11L3FlbXUtc3lz
dGVtLW9yMWsgXAo+ICsgICAgLWNwdSBvcjEyMDAgXAo+ICsgICAgLU0gb3Ixay1zaW0gXAo+ICsg
ICAgLWtlcm5lbCAvaG9tZS9zaG9ybmUvd29yay9vcGVucmlzYy9iYXJlYm94L2JhcmVib3ggXAo+
ICsgICAgLW5ldCBuaWMgLW5ldCB0YXAsaWZuYW1lPXRhcDAsc2NyaXB0PW5vLGRvd25zY3JpcHQ9
bm8gXAo+ICsgICAgLXNlcmlhbCBtb246c3RkaW8gLW5vZ3JhcGhpYyAtZ2RiIHRjcDo6MTAwMDEg
XAo+ICsgICAgLW0gMzIKPiArCj4gKwo+ICsgIGJhcmVib3ggMjAyMS4wMi4wLTAwMTIwLWc3NjNj
NmZlZTctZGlydHkgIzE0IFRodSBNYXIgNCAwNToxMzo1MSBKU1QgMjAyMQo+ICsKPiArCj4gKyAg
Qm9hcmQ6IG9yMWtzaW0KPiArICBtZGlvX2J1czogbWlpYnVzMDogcHJvYmVkCj4gKyAgbWFsbG9j
IHNwYWNlOiAweDAxYjgwMDAwIC0+IDB4MDFmN2ZmZmYgKHNpemUgNCBNaUIpCj4gKwo+ICsgIEhp
dCBhbnkgdG8gc3RvcCBhdXRvYm9vdDogICAgMwo+ICsgIGJhcmVib3hAb3Ixa3NpbTovCj4gKwo+
ICBvcjFrc2ltCj4gIC0tLS0tLS0KPiAgCj4gLS0gCj4gMi4yNi4yCj4gCj4gCgotLSAKUGVuZ3V0
cm9uaXggZS5LLiAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwKU3RldWVyd2FsZGVyIFN0ci4gMjEgICAgICAgICAgICAgICAgICAgICAgIHwg
aHR0cDovL3d3dy5wZW5ndXRyb25peC5kZS8gIHwKMzExMzcgSGlsZGVzaGVpbSwgR2VybWFueSAg
ICAgICAgICAgICAgICAgIHwgUGhvbmU6ICs0OS01MTIxLTIwNjkxNy0wICAgIHwKQW10c2dlcmlj
aHQgSGlsZGVzaGVpbSwgSFJBIDI2ODYgICAgICAgICAgIHwgRmF4OiAgICs0OS01MTIxLTIwNjkx
Ny01NTU1IHwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
T3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBz
Oi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
