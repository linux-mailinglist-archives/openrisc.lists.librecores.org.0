Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 459FE9719F
	for <lists+openrisc@lfdr.de>; Wed, 21 Aug 2019 07:30:49 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D18CC204C3;
	Wed, 21 Aug 2019 07:30:48 +0200 (CEST)
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810112.outbound.protection.outlook.com [40.107.81.112])
 by mail.librecores.org (Postfix) with ESMTPS id 3BAC920116
 for <openrisc@lists.librecores.org>; Mon, 19 Aug 2019 22:57:33 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bGz4W9u+/50ifh/XazO3SsJDsdYXcV0ub1dmfkoaZkrmCZumDMfyTWWiT/rCAG9y2Ohhe/b19HWRKD8YyEzcSdyWFw4M2/k5sk2VvuM1QuSOW4TqhYV8CJSRuQqd0u5WabkghdQSYHQRyAKD5J6/98ZsbeYbOa8mUgI9lRcnEC43zxXgp6PaKgtfer7rHRtzIlaecvBDcl2SGL4ijfD2324+8jz5ch+OV/2qn9TILMjwtwcUPQTKFItYqPqGFvwgDPPNZcGDhmxKzqJlq/+4lXxGOAibOaSm/MplXnTI35ax6Kl3y6diRe0luZe8/XeJ8ut26/rkH+rM4mzdg2NYdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQlemvDaibl3TmaUoytPX70nix/LzsjtaZ1/LsbuUDQ=;
 b=F77d5PqBjjR3NragXVyVzF+8IkCwFqeHS39abnfMgapxqGRsW9ukpD9zzSEVUDMQ/jvJ8vtbwTapkx8jmMyooGsjxmyJ6feHFSCHU4uyyYGB2TuhSSrPr2+1UDkRWA+BFtV2bXItHCx641szKLf8rx1CgmYnMcvH9JIdiURutWM9ff9gTPnYBiVbM4x0My2mjjRWGh8Z5MBvyc+59MRB0n/ebVvDytQWcjhq7QegUhj8ZAqF4n5V2GVJMgo1Ew9oAoY5GxvNq4v6FveJxHGWet+WCpK1Igjfc636zVP6GO+f66TXXxn2dPV25V8G0Qy8fjwKPNs5Zgn60y7DjItg4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQlemvDaibl3TmaUoytPX70nix/LzsjtaZ1/LsbuUDQ=;
 b=vQ/3pUFl5pl4EUYYaAjWg0jq9iLtomWR7q2NzSLd8KleB3fGL4Kf68+gNkERCR82HHTgHcJ3jmVtdMwBtxwKYn3CRheLwhUqHgXa2RA7zB/l6Vqrg1soikbidi4Hc0Eqd6Q3wYn9MPQsHUlsA7C2DQENfza+mdqBZZVqVoiJd3o=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1214.namprd22.prod.outlook.com (10.174.161.147) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Mon, 19 Aug 2019 20:57:30 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f566:bf1f:dcd:862c]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f566:bf1f:dcd:862c%10]) with mapi id 15.20.2178.018; Mon, 19 Aug 2019
 20:57:30 +0000
From: Paul Burton <paul.burton@mips.com>
To: Christoph Hellwig <hch@lst.de>
Thread-Topic: [PATCH 04/26] mips: remove ioremap_cachable
Thread-Index: AQHVVtC3NrUy1/60K0Ou3aE6SqmWcg==
Date: Mon, 19 Aug 2019 20:57:30 +0000
Message-ID: <20190819205722.4eir2edy6qgtgarl@pburton-laptop>
References: <20190817073253.27819-1-hch@lst.de>
 <20190817073253.27819-5-hch@lst.de>
In-Reply-To: <20190817073253.27819-5-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P123CA0023.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::35) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2a02:c7f:5e65:9900:8519:dc48:d16b:70fc]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c641ce4-c757-4855-8ea6-08d724e7d94d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR2201MB1214; 
x-ms-traffictypediagnostic: MWHPR2201MB1214:
x-microsoft-antispam-prvs: <MWHPR2201MB1214CEE95E7DDEFA250FDB2FC1A80@MWHPR2201MB1214.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0134AD334F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(7916004)(136003)(376002)(346002)(39830400003)(366004)(396003)(199004)(189003)(71200400001)(8936002)(71190400001)(5660300002)(486006)(1076003)(8676002)(44832011)(6246003)(76176011)(81156014)(81166006)(476003)(256004)(66946007)(42882007)(446003)(14454004)(64756008)(66446008)(66556008)(478600001)(7736002)(305945005)(4326008)(386003)(25786009)(6506007)(11346002)(186003)(46003)(316002)(102836004)(66476007)(33716001)(54906003)(58126008)(6436002)(229853002)(6916009)(53936002)(7416002)(52116002)(6512007)(9686003)(6486002)(99286004)(2906002)(6116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR2201MB1214;
 H:MWHPR2201MB1277.namprd22.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dV5mX8Pkr7io2t7Y4ptazUid5uXLcd1UBG1s8OB1iX7EfIpmwYRnxosRjB4LPEuf2aK6uYDRQyp3dJs9e92YsCag7SS46KiQIJbIs+xQf+X8AorBt+ClHaEVCD7ZJaKLLsK3BIu7HFM1fPLPFZYo9THzyC9l4isY5g+3SOqRd/PbHXxUZ2uSgAoDnFmA680Ikl/P2i1gv3Pq8U/+3zr5m9Se1heQNHNW9W+IpGDnSPoGZOheeQ1j1UyNjGTZ4d/ErxRt/oTakJHM26tn5F/e3EyR6w/SfiyXxgkxjzOiIVN/b0Qwc0Q4NwrF6c3sEnhjWrphN8eeZ8tYGK+3E8XLhe+j80tJ3Xkjkkm9LpWxh8NtiS6ZHs+RZNPPFMYIRwC+tWYw1I0HPisjb3DBeEEY9hu4JK07d0TBFPfz0jEA40s=
x-ms-exchange-transport-forked: True
Content-ID: <F7A01E6E65132543B693A9F6442F8662@namprd22.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c641ce4-c757-4855-8ea6-08d724e7d94d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2019 20:57:30.3016 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qJQF+IhT4z5pqGUgbfafaPiHTxqFNEqH6R6Z4I+k8rb9DobUqivCvM1ix+ODt4H/DJNJU2Hcxxg3SjfiBemtkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1214
X-Mailman-Approved-At: Wed, 21 Aug 2019 07:30:43 +0200
Subject: Re: [OpenRISC] [PATCH 04/26] mips: remove ioremap_cachable
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 Guo Ren <guoren@kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Vincent Chen <deanbo422@gmail.com>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
 Greentime Hu <green.hu@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Guan Xuetao <gxt@pku.edu.cn>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 "nios2-dev@lists.rocketboards.org" <nios2-dev@lists.rocketboards.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgQ2hyaXN0b3BoLAoKT24gU2F0LCBBdWcgMTcsIDIwMTkgYXQgMDk6MzI6MzFBTSArMDIwMCwg
Q2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gSnVzdCBkZWZpbmUgaW9yZW1hcF9jYWNoZSBkaXJl
Y3RseS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4K
CkFja2VkLWJ5OiBQYXVsIEJ1cnRvbiA8cGF1bC5idXJ0b25AbWlwcy5jb20+CgpUaGFua3MsCiAg
ICBQYXVsCgo+IC0tLQo+ICBhcmNoL21pcHMvaW5jbHVkZS9hc20vaW8uaCB8IDcgKysrLS0tLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9hcmNoL21pcHMvaW5jbHVkZS9hc20vaW8uaCBiL2FyY2gvbWlwcy9pbmNsdWRl
L2FzbS9pby5oCj4gaW5kZXggOTdhMjgwNjQwZGFmLi5jMDJkYjk4NmRkZjUgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9taXBzL2luY2x1ZGUvYXNtL2lvLmgKPiArKysgYi9hcmNoL21pcHMvaW5jbHVkZS9h
c20vaW8uaAo+IEBAIC0yNjIsMTEgKzI2MiwxMSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgX19pb21l
bSAqaW9yZW1hcF9wcm90KHBoeXNfYWRkcl90IG9mZnNldCwKPiAgI2RlZmluZSBpb3JlbWFwX3Vj
IGlvcmVtYXBfbm9jYWNoZQo+ICAKPiAgLyoKPiAtICogaW9yZW1hcF9jYWNoYWJsZSAtCW1hcCBi
dXMgbWVtb3J5IGludG8gQ1BVIHNwYWNlCj4gKyAqIGlvcmVtYXBfY2FjaGUgLQltYXAgYnVzIG1l
bW9yeSBpbnRvIENQVSBzcGFjZQo+ICAgKiBAb2Zmc2V0OgkgICAgYnVzIGFkZHJlc3Mgb2YgdGhl
IG1lbW9yeQo+ICAgKiBAc2l6ZToJICAgIHNpemUgb2YgdGhlIHJlc291cmNlIHRvIG1hcAo+ICAg
Kgo+IC0gKiBpb3JlbWFwX25vY2FjaGUgcGVyZm9ybXMgYSBwbGF0Zm9ybSBzcGVjaWZpYyBzZXF1
ZW5jZSBvZiBvcGVyYXRpb25zIHRvCj4gKyAqIGlvcmVtYXBfY2FjaGUgcGVyZm9ybXMgYSBwbGF0
Zm9ybSBzcGVjaWZpYyBzZXF1ZW5jZSBvZiBvcGVyYXRpb25zIHRvCj4gICAqIG1ha2UgYnVzIG1l
bW9yeSBDUFUgYWNjZXNzaWJsZSB2aWEgdGhlIHJlYWRiL3JlYWR3L3JlYWRsL3dyaXRlYi8KPiAg
ICogd3JpdGV3L3dyaXRlbCBmdW5jdGlvbnMgYW5kIHRoZSBvdGhlciBtbWlvIGhlbHBlcnMuIFRo
ZSByZXR1cm5lZAo+ICAgKiBhZGRyZXNzIGlzIG5vdCBndWFyYW50ZWVkIHRvIGJlIHVzYWJsZSBk
aXJlY3RseSBhcyBhIHZpcnR1YWwKPiBAQCAtMjc2LDkgKzI3Niw4IEBAIHN0YXRpYyBpbmxpbmUg
dm9pZCBfX2lvbWVtICppb3JlbWFwX3Byb3QocGh5c19hZGRyX3Qgb2Zmc2V0LAo+ICAgKiB0aGUg
Q1BVLiAgQWxzbyBlbmFibGVzIGZ1bGwgd3JpdGUtY29tYmluaW5nLgkgVXNlZnVsIGZvciBzb21l
Cj4gICAqIG1lbW9yeS1saWtlIHJlZ2lvbnMgb24gSS9PIGJ1c3Nlcy4KPiAgICovCj4gLSNkZWZp
bmUgaW9yZW1hcF9jYWNoYWJsZShvZmZzZXQsIHNpemUpCQkJCQlcCj4gKyNkZWZpbmUgaW9yZW1h
cF9jYWNoZShvZmZzZXQsIHNpemUpCQkJCQlcCj4gIAlfX2lvcmVtYXBfbW9kZSgob2Zmc2V0KSwg
KHNpemUpLCBfcGFnZV9jYWNoYWJsZV9kZWZhdWx0KQo+IC0jZGVmaW5lIGlvcmVtYXBfY2FjaGUg
aW9yZW1hcF9jYWNoYWJsZQo+ICAKPiAgLyoKPiAgICogaW9yZW1hcF93YyAgICAgLSAgIG1hcCBi
dXMgbWVtb3J5IGludG8gQ1BVIHNwYWNlCj4gLS0gCj4gMi4yMC4xCj4gCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApP
cGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3Jn
L2xpc3RpbmZvL29wZW5yaXNjCg==
