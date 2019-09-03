Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 3C96FA9A27
	for <lists+openrisc@lfdr.de>; Thu,  5 Sep 2019 07:45:30 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id AE0A3204A0;
	Thu,  5 Sep 2019 07:45:29 +0200 (CEST)
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750107.outbound.protection.outlook.com [40.107.75.107])
 by mail.librecores.org (Postfix) with ESMTPS id A274920385
 for <openrisc@lists.librecores.org>; Tue,  3 Sep 2019 10:57:05 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ffEmgDXQ32ktnYik+eVGVMhdy8ERJFJeO9bVlL8V0Mxg4D6rOgPOUmRR7Fyc3r5aBchk3kD/SxYNJ6jDqMm+AlskxxR5D6gxXz4Ap3C9770rvYs5nLEsf8mirPxU147GUK5AgKTMUtISMWNOtFlGwWzrwULp+0VStdI2wTEgEgT9m9CiXwweHgnAEA6bmg/le9JCAHcolXW4kVPKP+4i/tjNhpMPCtb+PiJR4S+hcx3BtV38qnjTaW2sukEWyMAFLneojynBG7YRQMRvUfkTpCTzG2o8YIi3y8H3g6xYI5TS5hmsnaBUCgqXB3ZFMQw1YJyeLXmZ+RH55DXVzybgeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pKGjwp1Uo8LfIHoyH7+b//d/bD44+fJfePgvviW7l8g=;
 b=mG1tWN7uUdyshf80A5MUT9b4f6P+Wl3TJJjI2GQ8ZUx0AFflfdICBbq8iw3/Yhzq8BPbGw5wEEcJcYFHMoY9CTTLu5rjbdoYrQRooJHt40TGSSs8CRwl3yHAmgH3BcdBm212x/sNaI/JHePgkCL5RI5ImrHCW4Va/8xjqT8RxvnislgjsJYAH74bugV/eCnLe84HjYXFBqSKMRX7dUb10TLokdEPKjB2Pk6ZuJOwUa60shooMhVChq5OtJZYqPC3c7Lh8TPywmKg3ZnAePzVm64g0iURm4a0MshUvC9WoYxNmVvtGmHAyRBCFSAQ2px4keNF4rch/Xz1xwu89RP0iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pKGjwp1Uo8LfIHoyH7+b//d/bD44+fJfePgvviW7l8g=;
 b=VCoxzS8WWTGfTcQYd0/WZ+jzrF0fosMbreNkfKpbvjQ4IW659Bg+NPwvuAf4EQKOuVRKFsAOj0pCb8p+7Dill9cY5mxZ4QAPW5CJCiLvD1LY+jZ1udVFo87TRkJbmYam+XgewallJsGzm3jjrChp1wMbXFymbbSiyHLv9/Ei034=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1422.namprd22.prod.outlook.com (10.172.59.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Tue, 3 Sep 2019 08:57:01 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3%11]) with mapi id 15.20.2220.021; Tue, 3 Sep 2019
 08:57:01 +0000
From: Paul Burton <paul.burton@mips.com>
To: Christoph Hellwig <hch@lst.de>
Thread-Topic: [PATCH 04/26] mips: remove ioremap_cachable
Thread-Index: AQHVYjWM7xZdW0g9rk2mdDHsFCA7Ig==
Date: Tue, 3 Sep 2019 08:57:00 +0000
Message-ID: <MWHPR2201MB1277E4E8214F6E50E5EC9BFCC1B90@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190817073253.27819-5-hch@lst.de>
In-Reply-To: <20190817073253.27819-5-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0041.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::29) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.196.173.241]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bc4e3957-ec12-4171-af7d-08d7304cae89
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR2201MB1422; 
x-ms-traffictypediagnostic: MWHPR2201MB1422:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MWHPR2201MB14223E109C3EC6DA480974C1C1B90@MWHPR2201MB1422.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(136003)(366004)(376002)(346002)(39840400004)(199004)(189003)(7736002)(71190400001)(6116002)(4744005)(3846002)(71200400001)(256004)(7416002)(99286004)(966005)(8936002)(66446008)(64756008)(66556008)(66946007)(66476007)(14454004)(8676002)(478600001)(386003)(6506007)(55236004)(53936002)(102836004)(2906002)(6246003)(74316002)(6436002)(42882007)(316002)(44832011)(446003)(476003)(11346002)(26005)(486006)(9686003)(6306002)(186003)(54906003)(55016002)(66066001)(81166006)(81156014)(25786009)(52116002)(7696005)(305945005)(52536014)(6916009)(229853002)(5660300002)(4326008)(76176011)(33656002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR2201MB1422;
 H:MWHPR2201MB1277.namprd22.prod.outlook.com; FPR:; SPF:None; PTR:InfoNoRecords;
 A:1; MX:1; 
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AMsW0LyaOM/yHrXI9m5Kie1YaQxjkfvMhyNX9ES2CGzwwwtpZntVqBckfi52aNkMc1Cdw2HlQMfo43GMtbo5mFVnqmdWekTCV8WgfEaqK2CjzX3+jfIMYgUYhhBN4zWgT9CB6mowfVObZSeeIEMtj7+DNC2MxefkmdolMdDmNiKZeyM/3alS0wsSmeCRCsmzACIx3yo9Czz0fYxxpPvPbHTf+KaRtsqNbIV5fuR38UuaxwgSY7khdFw8Ar3ThZt6HWelwgU4vmFePNfnQ/2+RAPxMWvPKk8KwT0tM6kvsaKJZ5DXKM+M8iKqCcMBcLD53stvyeVLaj4Syqkv0mqrETEw4t6/7LI69R/6BoyyTS/WN9nNKWlcsqFhE/rl8Anat/j9v2p6UBqUVH6JJkwAm+0PTbtyAY3KukhvYKL2BNg=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc4e3957-ec12-4171-af7d-08d7304cae89
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 08:57:00.4929 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CsvUw2VRN18dDCQo8ThReG3qLd2pbxbAWkvlwIUDlGTbHTsWbcHQ6WJEwrmmhkC2GbNjKIBlixwAJHAstD6HBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1422
X-Mailman-Approved-At: Thu, 05 Sep 2019 07:45:27 +0200
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
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

SGVsbG8sCgpDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBKdXN0IGRlZmluZSBpb3JlbWFwX2Nh
Y2hlIGRpcmVjdGx5LgoKQXBwbGllZCB0byBtaXBzLW5leHQuCgo+IGNvbW1pdCA2MGFmMGQ5NGNj
MzcKPiBodHRwczovL2dpdC5rZXJuZWwub3JnL21pcHMvYy82MGFmMGQ5NGNjMzcKPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPiBTaWduZWQtb2ZmLWJ5
OiBQYXVsIEJ1cnRvbiA8cGF1bC5idXJ0b25AbWlwcy5jb20+CgpUaGFua3MsCiAgICBQYXVsCgpb
IFRoaXMgbWVzc2FnZSB3YXMgYXV0by1nZW5lcmF0ZWQ7IGlmIHlvdSBiZWxpZXZlIGFueXRoaW5n
IGlzIGluY29ycmVjdAogIHRoZW4gcGxlYXNlIGVtYWlsIHBhdWwuYnVydG9uQG1pcHMuY29tIHRv
IHJlcG9ydCBpdC4gXQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcK
aHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
