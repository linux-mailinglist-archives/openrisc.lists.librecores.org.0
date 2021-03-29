Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 8A4F234C8F9
	for <lists+openrisc@lfdr.de>; Mon, 29 Mar 2021 10:28:54 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B7C3921243;
	Mon, 29 Mar 2021 10:28:53 +0200 (CEST)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mail.librecores.org (Postfix) with ESMTPS id 47230211D8
 for <openrisc@lists.librecores.org>; Mon, 29 Mar 2021 03:35:26 +0200 (CEST)
IronPort-SDR: zQ0CHOkMmYSg1EDXLjmmSHR00wTYquR1QgbburfC5RfSK8rSbsNvWQQGdk6JZwEp/Qy1hn3oNO
 RKSMSFdRuKQg==
X-IronPort-AV: E=McAfee;i="6000,8403,9937"; a="211647606"
X-IronPort-AV: E=Sophos;i="5.81,285,1610438400"; d="scan'208";a="211647606"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2021 18:35:24 -0700
IronPort-SDR: 3OnYc4reE3mBx0xx2TBrBEdlwziLi7HjDKDFWRUBHfunsKIJDM1QQWrb+BVf58G1M5KJOojGGq
 lI3XkuczvN6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,285,1610438400"; d="scan'208";a="606193074"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga006.fm.intel.com with ESMTP; 28 Mar 2021 18:35:23 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sun, 28 Mar 2021 18:35:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Sun, 28 Mar 2021 18:35:23 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Sun, 28 Mar 2021 18:35:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VbvUume1AMZG1bMZ0EK31cV+xchex/cexicm6ztwC/xZQYIxuWC3o4YUu7oHbxu/kHDEEmd/olcsjLAhiwq3Fhc6TViO/G1kPfyz5Ka+rVkb6thfa4HZO7qNvsKBMIss978mmIrc4tSSOumCgtDMARLObK9r89v7Y7S4wzaJEUZSqb3OShD+DrStEdzrbBZEj+PMEPmDSeefTN7NmVlB35fZzE8Fis/0D3kCeT4cxZqUWKkqnxZcyJOKx9xJS7SG7J2MdXygv01DECh8W77ogJXQxoLJm5pyK1NZZJw4cHPd/wKcGdDCQM81/PNEgrfHq0sR6UBUzPwlXx3giicIMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ay8TMmJ++2GJdBf7EWjPTAnf1cCb7gNzJ19byz4mjw=;
 b=YVzKE4WosVRut8kCQTTj//0akhjfIfLdr3SC/zO8EYIzRo14v+nIzzwakYtF5jg9ud6s0tKOyeT+KBiDQqOxF76CRrHWZhZgjv4HgZ7KEqQYRv8ajy8r9UgSDnZdBOhKUh+PgN5oEG0snHNB4/gkXt8mtWFpoO6ymY6j280eW+qqQtp+nQTR5GdT6q+5yZYTbSWMtTs6zMVPTBfeduCwzYekECwGNRlRshEG3kKCZi+DoA6RfX7XLxxpP3XOYEPF0scVyw+I1+h+Y8VD+5/EYafnBHN07rS5Tu4ZS9TxV3ECAom+dKzfKLWC3keo8Nl8ESAfz3OpPj8ff6MbCssBIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ay8TMmJ++2GJdBf7EWjPTAnf1cCb7gNzJ19byz4mjw=;
 b=u/DX/kYhvaEdHbMUGTBhNPannLaSs2aqRDefhuYJOx8lA/ZONkC9mEysKJnE+KwH2IjHkNftja78aAwafaR7E8gNsMHdrjIzHD3+J+lcX49p94nISQoVItvKvzdZBu7WyCxMsAZ6S5ZXkhnnag3f8xpqZNyQyU361husRYP8uwY=
Received: from BY5PR11MB3893.namprd11.prod.outlook.com (2603:10b6:a03:183::26)
 by BYAPR11MB3253.namprd11.prod.outlook.com (2603:10b6:a03:77::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26; Mon, 29 Mar
 2021 01:35:22 +0000
Received: from BY5PR11MB3893.namprd11.prod.outlook.com
 ([fe80::297b:a818:3bfb:f897]) by BY5PR11MB3893.namprd11.prod.outlook.com
 ([fe80::297b:a818:3bfb:f897%6]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 01:35:22 +0000
From: "Tan, Ley Foon" <ley.foon.tan@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, "will@kernel.org"
 <will@kernel.org>, "danielwa@cisco.com" <danielwa@cisco.com>,
 "robh@kernel.org" <robh@kernel.org>, "daniel@gimpelevich.san-francisco.ca.us"
 <daniel@gimpelevich.san-francisco.ca.us>
Thread-Topic: [PATCH v3 09/17] nios2: Convert to GENERIC_CMDLINE
Thread-Index: AQHXIkY9EWGkIZwlLUepcXMICy4iU6qaMsdw
Date: Mon, 29 Mar 2021 01:35:21 +0000
Message-ID: <BY5PR11MB38934E74AF74D40379E46AB9CC7E9@BY5PR11MB3893.namprd11.prod.outlook.com>
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
 <85b1dc6339351cbc46d179e8fdb9dfc398e58303.1616765870.git.christophe.leroy@csgroup.eu>
In-Reply-To: <85b1dc6339351cbc46d179e8fdb9dfc398e58303.1616765870.git.christophe.leroy@csgroup.eu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: csgroup.eu; dkim=none (message not signed)
 header.d=none;csgroup.eu; dmarc=none action=none header.from=intel.com;
x-originating-ip: [42.189.153.48]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3136e626-5230-45dc-23e7-08d8f252eb33
x-ms-traffictypediagnostic: BYAPR11MB3253:
x-microsoft-antispam-prvs: <BYAPR11MB325308E3D7134732CEAD512ECC7E9@BYAPR11MB3253.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sp4Dol+Ce3nl3hU/fv/D/GUIKDOUypkeJE/zMbaTQm+QnbmSVuL0jjK/ZMXtf2p7SdDLd0pSfuuiImYjWC2pohxUpt1MyaTp/n5BOxXpfN/WBOGp7vCgEznkbRin7gx1gHK5syIi7vYCGx6bo5oW/nQregC+QI2Lc8qopP2qA9DfcDk3t/JvlXYMZq4TEgdN/mJvI6XjsorSmY5zyom8Avm/HFtuAaNjka1tiEhIxIcZtUHfq4l9WC7+J8KYLdl5+olfQCFc7XfDN1T1MZmR4UU/UjID50WgHr/PtQ8N6gYizCrfwNDixADhfDSQmwqUI7NDVT4gWSrBU2L7yDNup4v7Yen8cG9V88vMkCYCborUb5Qdlz75Vsvyu5KuZNQ2okqrZO6KQOXbl3Q128Z8hMeMGBYzb6U58EGDrj1E6cStukiiNcoI0lkl5pLZ+yN7XKJb0yPfvQAC0nSLee/lB67769TkYbOvzbF3t6xeeG6FaLrn+6Fj/1YuIOjE3EZWL50BepT7041SZs3mEYdPjSb4c6g89nDqa70MC1WmyfoN3C38OC8qu38D4qSZqlMzrMkf2AsBvH+HkXAXJLE7g/ve9C0e351D1SjDMD7041qURhXVi7FyjSKfVIDn/IS6p73+6cVBrCMoSjHQPrx7A941nQU7qd0TUDdLvhlRXmqOh3fDsFehe9OH42eV9GNu
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3893.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(346002)(136003)(396003)(366004)(376002)(8936002)(38100700001)(316002)(83380400001)(54906003)(76116006)(66946007)(66446008)(5660300002)(8676002)(66556008)(64756008)(66476007)(7416002)(478600001)(4326008)(110136005)(53546011)(2906002)(55016002)(9686003)(52536014)(86362001)(71200400001)(26005)(33656002)(186003)(7696005)(6506007)(41533002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?qG30XGx1ArCsOPyfjuxDCzCGIxsdK9sVdtWTrycEB0bBZl1DAzQSe6MJaEOw?=
 =?us-ascii?Q?fKwOr7ob9iSZmk4lSHK+dVaRvtzc1/vvfzbQuvGjjq8Acx2Uzjj4QOCsAMA4?=
 =?us-ascii?Q?6DobvsLMhKufv6PsBcV3FoHHUqhSWwUzakvMWneHFqoyBFMiM5DcQPkxEM+V?=
 =?us-ascii?Q?eoArLPer2IGntmEqs8mNnmHIWABfd2uDS5oWEMD13fIoX9Schn07FRRHAotI?=
 =?us-ascii?Q?RXTrVZaAFm1qOg8y4JPH/YtfoxlbbS1lgxPRBi4ny36JeHdFCW77OFP1D8ua?=
 =?us-ascii?Q?lSB0vBoDd2qIhw8PXL3tiYfAkmy0ET/r/MeWMvWtX0gjZFD2rckSu3fd/4yZ?=
 =?us-ascii?Q?6d6P/njxZCCFWAyZl6DFrlJClVFIf2Lu1DP7hRNLwM4eQuz3fqzEHDed87Lk?=
 =?us-ascii?Q?ZvDH5sav+GwpUUjw1RAbwi16nHC5xwxiL1uiYiamrbDrv/ra4h2lXmCmF/yk?=
 =?us-ascii?Q?TzrhiYhxuYTgLsRxNJ5HZv7WzkEigvdq0QsCLlqyDgdkj+/0z/cLrVNeb80W?=
 =?us-ascii?Q?2wSvn8REbgHtejy1n3/b3om8NSEe+R7xgkTseEnFIbhj+aFJe7qKZdmBkiY5?=
 =?us-ascii?Q?do1zP2icP3vdavYhTj81JRCeI5R1Y13JoAJpEQnx/Cu9tdAQJx9fhM8luiyn?=
 =?us-ascii?Q?6mV3ygmDJvjUTGSknoQWLBNjAO7C7lNzb0t0MHV6qNi45QV+YMyMBpBsuiMp?=
 =?us-ascii?Q?AK0rEuaMuYOvSZZwWdMjwLjULKPtX65KFgs7u0H4QZG+lIyfESMcu5K4mKfO?=
 =?us-ascii?Q?ljfN4MHne8IAXdoQUU8SvOodGvEAnDT9H1PJetgxUfiC7oa04tEGtEt1KG7c?=
 =?us-ascii?Q?aia5+lQEMGpVKDQPNDi2d0OyKUjRJ+J1uth0georYToydJMdG0wIY4rb5xgB?=
 =?us-ascii?Q?HXQJUFQfhTpHiTUAMD1fBoD9QkAyKkRiByUTj5AyqM4vWkUnO7K4+XZpwNVk?=
 =?us-ascii?Q?LjomyGnfjOrMIfrLfAIysCBW3G6xwqnpWtPjgV9mcvUMDP9+JDlNMmaKQlEp?=
 =?us-ascii?Q?+x9xQ/mpCxZu0BeG/6dE9aBUXXPxCI4MSTFbcnMKDa+snCvmFI+KMamONbGC?=
 =?us-ascii?Q?JU6yudXQYXtJqOUIWiSTlokL9qu1xx/vgyDTMcL8u2ArLjpFJbp2ScplBcPT?=
 =?us-ascii?Q?S2lWf5mcn0q83OUpHuGioRBeopGLkqtbHsweMOEpW5EDjXkz5U/gBcGfkI8J?=
 =?us-ascii?Q?00xd41Yk5sgyWZfN1omxCwnXbq2CVn2RXoaeI9MP2NYS5GKpAuj4U4wm6Zsd?=
 =?us-ascii?Q?0FbDXcF1H84zchNGCeIKFBgW6tI18NFXDiOExz+Ra5daCgTs2LyAEDCfdxMR?=
 =?us-ascii?Q?J2gtbbxgIAD8YK/c+DHzOsrf?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3893.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3136e626-5230-45dc-23e7-08d8f252eb33
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2021 01:35:21.8933 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EORUlTAMEmVGyPJ9IXxT10ifW8qQlyWaELYLStNmnpr+Szh6mpMwUAPTHgqsnwEvoe/BmzqwOe5+1m1EIpQbUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3253
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Mon, 29 Mar 2021 10:28:52 +0200
Subject: Re: [OpenRISC] [PATCH v3 09/17] nios2: Convert to GENERIC_CMDLINE
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 microblaze <monstr@monstr.eu>,
 "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Cgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogQ2hyaXN0b3BoZSBMZXJveSA8
Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pgo+IFNlbnQ6IEZyaWRheSwgTWFyY2ggMjYsIDIw
MjEgOTo0NSBQTQo+IFRvOiB3aWxsQGtlcm5lbC5vcmc7IGRhbmllbHdhQGNpc2NvLmNvbTsgcm9i
aEBrZXJuZWwub3JnOwo+IGRhbmllbEBnaW1wZWxldmljaC5zYW4tZnJhbmNpc2NvLmNhLnVzCj4g
Q2M6IGxpbnV4LWFyY2hAdmdlci5rZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9y
ZzsgbGludXhwcGMtCj4gZGV2QGxpc3RzLm96bGFicy5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmc7IGxpbnV4cHBjLQo+IGRldkBsaXN0cy5vemxhYnMub3JnOyBsaW51eC1hcm0ta2Vy
bmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IG1pY3JvYmxhemUKPiA8bW9uc3RyQG1vbnN0ci5ldT47
IGxpbnV4LW1pcHNAdmdlci5rZXJuZWwub3JnOyBUYW4sIExleSBGb29uCj4gPGxleS5mb29uLnRh
bkBpbnRlbC5jb20+OyBvcGVucmlzY0BsaXN0cy5saWJyZWNvcmVzLm9yZzsgbGludXgtCj4gaGV4
YWdvbkB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmc7IHg4
NkBrZXJuZWwub3JnOwo+IGxpbnV4LXh0ZW5zYUBsaW51eC14dGVuc2Eub3JnOyBsaW51eC1zaEB2
Z2VyLmtlcm5lbC5vcmc7Cj4gc3BhcmNsaW51eEB2Z2VyLmtlcm5lbC5vcmcKPiBTdWJqZWN0OiBb
UEFUQ0ggdjMgMDkvMTddIG5pb3MyOiBDb252ZXJ0IHRvIEdFTkVSSUNfQ01ETElORQo+IAo+IFRo
aXMgY29udmVydHMgdGhlIGFyY2hpdGVjdHVyZSB0byBHRU5FUklDX0NNRExJTkUuCj4gCj4gU2ln
bmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1
Pgo+IC0tLQo+ICBhcmNoL25pb3MyL0tjb25maWcgICAgICAgIHwgMjQgKy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCj4gIGFyY2gvbmlvczIva2VybmVsL3NldHVwLmMgfCAxMyArKysrLS0tLS0tLS0t
Cj4gIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzMiBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvYXJjaC9uaW9zMi9LY29uZmlnIGIvYXJjaC9uaW9zMi9LY29uZmlnIGlu
ZGV4Cj4gYzI0OTU1YzgxYzkyLi5mNjZjOTdiMTU4MTMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9uaW9z
Mi9LY29uZmlnCj4gKysrIGIvYXJjaC9uaW9zMi9LY29uZmlnCj4gQEAgLTkwLDMxICs5MCw5IEBA
IGNvbmZpZyBOSU9TMl9BTElHTk1FTlRfVFJBUAo+IAo+ICBjb21tZW50ICJCb290IG9wdGlvbnMi
Cj4gCj4gLWNvbmZpZyBDTURMSU5FX0JPT0wKPiAtCWJvb2wgIkRlZmF1bHQgYm9vdGxvYWRlciBr
ZXJuZWwgYXJndW1lbnRzIgo+IC0JZGVmYXVsdCB5Cj4gLQo+IC1jb25maWcgQ01ETElORQo+IC0J
c3RyaW5nICJEZWZhdWx0IGtlcm5lbCBjb21tYW5kIHN0cmluZyIKPiAtCWRlZmF1bHQgIiIKPiAt
CWRlcGVuZHMgb24gQ01ETElORV9CT09MCj4gLQloZWxwCj4gLQkgIE9uIHNvbWUgcGxhdGZvcm1z
LCB0aGVyZSBpcyBjdXJyZW50bHkgbm8gd2F5IGZvciB0aGUgYm9vdCBsb2FkZXIgdG8KPiAtCSAg
cGFzcyBhcmd1bWVudHMgdG8gdGhlIGtlcm5lbC4gRm9yIHRoZXNlIHBsYXRmb3JtcywgeW91IGNh
biBzdXBwbHkKPiAtCSAgc29tZSBjb21tYW5kLWxpbmUgb3B0aW9ucyBhdCBidWlsZCB0aW1lIGJ5
IGVudGVyaW5nIHRoZW0gaGVyZS4gIEluCj4gLQkgIG90aGVyIGNhc2VzIHlvdSBjYW4gc3BlY2lm
eSBrZXJuZWwgYXJncyBzbyB0aGF0IHlvdSBkb24ndCBoYXZlCj4gLQkgIHRvIHNldCB0aGVtIHVw
IGluIGJvYXJkIHByb20gaW5pdGlhbGl6YXRpb24gcm91dGluZXMuCj4gLQo+IC1jb25maWcgQ01E
TElORV9GT1JDRQo+IC0JYm9vbCAiRm9yY2UgZGVmYXVsdCBrZXJuZWwgY29tbWFuZCBzdHJpbmci
Cj4gLQlkZXBlbmRzIG9uIENNRExJTkVfQk9PTAo+IC0JaGVscAo+IC0JICBTZXQgdGhpcyB0byBo
YXZlIGFyZ3VtZW50cyBmcm9tIHRoZSBkZWZhdWx0IGtlcm5lbCBjb21tYW5kIHN0cmluZwo+IC0J
ICBvdmVycmlkZSB0aG9zZSBwYXNzZWQgYnkgdGhlIGJvb3QgbG9hZGVyLgo+IC0KPiAgY29uZmln
IE5JT1MyX0NNRExJTkVfSUdOT1JFX0RUQgo+ICAJYm9vbCAiSWdub3JlIGtlcm5lbCBjb21tYW5k
IHN0cmluZyBmcm9tIERUQiIKPiAtCWRlcGVuZHMgb24gQ01ETElORV9CT09MCj4gKwlkZXBlbmRz
IG9uIENNRExJTkUgIT0gIiIKPiAgCWRlcGVuZHMgb24gIUNNRExJTkVfRk9SQ0UKPiAgCWRlZmF1
bHQgeQo+ICAJaGVscAoKTWlzc2luZyAiIHNlbGVjdCBHRU5FUklDX0NNRExJTkUiID8KCgoKCj4g
ZGlmZiAtLWdpdCBhL2FyY2gvbmlvczIva2VybmVsL3NldHVwLmMgYi9hcmNoL25pb3MyL2tlcm5l
bC9zZXR1cC5jIGluZGV4Cj4gZDJmMjE5NTdlOTljLi40MjQ2NGY0NTdhNmQgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9uaW9zMi9rZXJuZWwvc2V0dXAuYwo+ICsrKyBiL2FyY2gvbmlvczIva2VybmVsL3Nl
dHVwLmMKPiBAQCAtMjAsNiArMjAsNyBAQAo+ICAjaW5jbHVkZSA8bGludXgvaW5pdHJkLmg+Cj4g
ICNpbmNsdWRlIDxsaW51eC9vZl9mZHQuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3NjcmVlbl9pbmZv
Lmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9jbWRsaW5lLmg+Cj4gCj4gICNpbmNsdWRlIDxhc20vbW11
X2NvbnRleHQuaD4KPiAgI2luY2x1ZGUgPGFzbS9zZWN0aW9ucy5oPgo+IEBAIC0xMDgsNyArMTA5
LDcgQEAgYXNtbGlua2FnZSB2b2lkIF9faW5pdCBuaW9zMl9ib290X2luaXQodW5zaWduZWQgcjQs
Cj4gdW5zaWduZWQgcjUsIHVuc2lnbmVkIHI2LAo+ICAJCQkJICAgICAgIHVuc2lnbmVkIHI3KQo+
ICB7Cj4gIAl1bnNpZ25lZCBkdGJfcGFzc2VkID0gMDsKPiAtCWNoYXIgY21kbGluZV9wYXNzZWRb
Q09NTUFORF9MSU5FX1NJWkVdIF9fbWF5YmVfdW51c2VkID0KPiB7IDAsIH07Cj4gKwljaGFyIGNt
ZGxpbmVfcGFzc2VkW0NPTU1BTkRfTElORV9TSVpFXSA9IHsgMCwgfTsKPiAKPiAgI2lmIGRlZmlu
ZWQoQ09ORklHX05JT1MyX1BBU1NfQ01ETElORSkKPiAgCWlmIChyNCA9PSAweDUzNGY0OTRlKSB7
IC8qIHI0IGlzIG1hZ2ljIE5JT1MgKi8gQEAgLTEyNywxNCArMTI4LDggQEAKPiBhc21saW5rYWdl
IHZvaWQgX19pbml0IG5pb3MyX2Jvb3RfaW5pdCh1bnNpZ25lZCByNCwgdW5zaWduZWQgcjUsIHVu
c2lnbmVkIHI2LAo+IAo+ICAJZWFybHlfaW5pdF9kZXZ0cmVlKCh2b2lkICopZHRiX3Bhc3NlZCk7
Cj4gCj4gLSNpZm5kZWYgQ09ORklHX0NNRExJTkVfRk9SQ0UKPiAtCWlmIChjbWRsaW5lX3Bhc3Nl
ZFswXSkKPiAtCQlzdHJsY3B5KGJvb3RfY29tbWFuZF9saW5lLCBjbWRsaW5lX3Bhc3NlZCwKPiBD
T01NQU5EX0xJTkVfU0laRSk7Cj4gLSNpZmRlZiBDT05GSUdfTklPUzJfQ01ETElORV9JR05PUkVf
RFRCCj4gLQllbHNlCj4gLQkJc3RybGNweShib290X2NvbW1hbmRfbGluZSwgQ09ORklHX0NNRExJ
TkUsCj4gQ09NTUFORF9MSU5FX1NJWkUpOwo+IC0jZW5kaWYKPiAtI2VuZGlmCj4gKwlpZiAoY21k
bGluZV9wYXNzZWRbMF0gfHwKPiBJU19FTkFCTEVEKENPTkZJR19OSU9TMl9DTURMSU5FX0lHTk9S
RV9EVEIpKQo+ICsJCWNtZGxpbmVfYnVpbGQoYm9vdF9jb21tYW5kX2xpbmUsIGNtZGxpbmVfcGFz
c2VkLAo+IENPTU1BTkRfTElORV9TSVpFKTsKPiAKPiAgCXBhcnNlX2Vhcmx5X3BhcmFtKCk7Cj4g
IH0KPiAtLQo+IDIuMjUuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMu
b3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK
