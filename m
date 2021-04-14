Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 5D9EF35FC9A
	for <lists+openrisc@lfdr.de>; Wed, 14 Apr 2021 22:25:48 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B9D1220E79;
	Wed, 14 Apr 2021 22:25:46 +0200 (CEST)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
 by mail.librecores.org (Postfix) with ESMTPS id AF4C820F26
 for <openrisc@lists.librecores.org>; Wed, 14 Apr 2021 10:58:25 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aFZ4fduwkKuEKsaIEawDGjylvNl+A6eqRZZaK1+acS9Oj68pRag6FHveY1KuznN5Ngu1Q+7gDet4chvKUutS96LwCOia5/vcpQ9FyodQ8HjOE8wg50Hm4r+yWDPeW0sq60oIVinusymRQAJJYUhz62gvZ+nf4MM1GCIoH1MJmipjQnUgtWz83W3b6lru/g2YvrSUiWlP4Y+YUmt7iC2iatOE7E6w9hAfqH4VJJ8/ZlhaZ8IUZLOfLnUebqTes7ljuifKrNClUTp3GekXA24alPIMqNvcRP2D3MZCOchtYNL3V/WCP8QuRmZtdJjhjtK/IaxFa9qUg6/pvfRnSJM0Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08voTLsZcDJChYQ5jgeNzzEpKc8++MtNWQh8s3eoYvU=;
 b=kEzcTqxJ8VSQOq+LOZJISWXVgktC1YAmtxb5HbthzlBp7ySiOtUv+VyQirKR5K9t1D4kiekTlJprIkdOz5xJC5vH+bGSBd6mMxRjbDDYKLbKIuppRHI9YFvYOC7mfCyUM3lBbS4OsUe8BWsM7AGTgVjOV67nbmT04pBcHSICohkqjHeTE8R3o7YQNPSWuFjFBGHHrO7NDq/cuQQgK7GlMuUR+M1ZZ+M6gFjCweK2T1Tc7PtbW9FzN5ChSX7pip3fThe6mphYfDYOp68cy2IoR2B3UXSWx4ddNlWu/crlmN4MXfSCfHQUFuLSkkUdSP+anVX2LBOKGcDKzmW1o3DhhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08voTLsZcDJChYQ5jgeNzzEpKc8++MtNWQh8s3eoYvU=;
 b=Vw5JlE3LAAEucBaNse013pBy2dqiuPE0YpK2oVLfOdq7y6Bo0fWn1/vfcVjeGrS558kbEYs60EnJZw3zOSIcVLweOF7BQxbLz2avVqenu93DmEuQSF0aflRBRtDIybBYvid7UlyFY3nz08xfv3hbR7u2VbL7SrPcajsIS3RQhqI=
Authentication-Results: synopsys.com; dkim=none (message not signed)
 header.d=none; synopsys.com; dmarc=none action=none header.from=synaptics.com; 
Received: from BY5PR03MB5345.namprd03.prod.outlook.com (2603:10b6:a03:219::16)
 by BY5PR03MB5078.namprd03.prod.outlook.com (2603:10b6:a03:1e5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Wed, 14 Apr
 2021 08:58:22 +0000
Received: from BY5PR03MB5345.namprd03.prod.outlook.com
 ([fe80::8569:341f:4bc6:5b72]) by BY5PR03MB5345.namprd03.prod.outlook.com
 ([fe80::8569:341f:4bc6:5b72%8]) with mapi id 15.20.4020.022; Wed, 14 Apr 2021
 08:58:22 +0000
Date: Wed, 14 Apr 2021 16:58:08 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Vineet Gupta <vgupta@synopsys.com>, Russell King
 <linux@armlinux.org.uk>, Yoshinori Sato <ysato@users.sourceforge.jp>, Brian
 Cain <bcain@codeaurora.org>, Nick Hu <nickhu@andestech.com>, Greentime Hu
 <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>, Ley Foon Tan
 <ley.foon.tan@intel.com>, Jonas Bonn <jonas@southpole.se>, Stefan
 Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne
 <shorne@gmail.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
 Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Jeff Dike <jdike@addtoit.com>, Richard
 Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>
Message-ID: <20210414165808.458a3d11@xhacker.debian>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Originating-IP: [192.147.44.204]
X-ClientProxiedBy: SJ0PR03CA0126.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::11) To BY5PR03MB5345.namprd03.prod.outlook.com
 (2603:10b6:a03:219::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xhacker.debian (192.147.44.204) by
 SJ0PR03CA0126.namprd03.prod.outlook.com (2603:10b6:a03:33c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Wed, 14 Apr 2021 08:58:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7241407c-569c-4a0a-dbeb-08d8ff23748b
X-MS-TrafficTypeDiagnostic: BY5PR03MB5078:
X-Microsoft-Antispam-PRVS: <BY5PR03MB507877BF88DECBED662A331CED4E9@BY5PR03MB5078.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Crn+fGVoq2cFN5JsT5rO0n2SsaHWm3Ut8MH/MkRVC3a9qKL2t5tE1ctlC/CGF/bawhG5BgLQ2vfB+zsJz/6c/gzjuusAGP+OrGvKHHLd32vOkRWFZKpIw6JTlfCJrM1THdSj7fE/N/xQHpFk5KKQ64qcJA8skAURoQRhF42jx7t0ZwpY9t0ykX0v+DXVIHhSMBefbzr76ntASr5IMG2y6hIXj5n6lGxRFQNnkiAvk98k894H4J3yDFVLESJAdmb2TPSsVzwwVIntTe1U1U4lh3IehBtsLFAqN9A0fvu2RtoghMXdCM+ftkxR4gA5L3XO71oClniv0MTq8c6J4PxZ4HyNsj4svHhKJBJDtUhHX8qAMowfq97tBxEyZgS+3VEK4mVHpp33nM6U4IEJEvC/BpXSsSKVSEAv9rKOuqdnha9NfcdtJ1DPJ2zybEB+DIXyUoHGMYAE8nniBysB8NtBE0P18DgXfJAD//sJFuT7YlnzjH3R+zV9pVEj/OoK+8/gMPE4UYnRsegZUPWPYErVX5/LKbHhJDcwvl5VDcKOoFEkwxXc/8iuS5Om4+jwtfsliw23D34iH2h9W4XkoSc2s76CuNEkIpx28IevWlry3CG3LKx8lSC5ytbkIG9q1UwDSHY3xe0E2wTUoHJalAFkh3sebbOQGxGqx4POpkcRcnlOLaC5gynphBILeJFwQEGD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR03MB5345.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(136003)(346002)(396003)(39850400004)(956004)(55016002)(8676002)(8936002)(66476007)(9686003)(66556008)(66946007)(6666004)(7416002)(7406005)(921005)(110136005)(86362001)(2906002)(1076003)(316002)(38350700002)(7696005)(52116002)(186003)(83380400001)(26005)(16526019)(6506007)(5660300002)(478600001)(4326008)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?cN76SSrX8CSB9pwmcNgZn7oaug3fu8oia1gOEDie+RQu2LDC5HMVflXF5Oei?=
 =?us-ascii?Q?F3D7GWDS/GFTuG/xnCQ2W8YH6bxDMatQ1bawNa9XixIDzSI+dzjzCcwAPCcY?=
 =?us-ascii?Q?qLUWxbxJ+tsU/BZAM3I71+qgtPIa23g4shUk031TJqdJtTxpI3uKwUtzRBDL?=
 =?us-ascii?Q?QDdI9er3L18Z4CufL++In7dhSGbyQxzjELtGg3xBRqwvUhC6a2PdFVvWiYXq?=
 =?us-ascii?Q?x6kXaUB/TUqo+sPxkMXPahbF+BKaz954iJkKw0Ff4hkJydKMtlw+JKvq8GwK?=
 =?us-ascii?Q?mpihLgfdpDQRlFSxnLzDTa8NuWx+PguPle2l5lKGH9W2EgJyJWV4RDI8gMH/?=
 =?us-ascii?Q?CrZHhosQb8oT7aqqSTpF2zsDjfeaMlHdpT/9kRDJS4oq98Zirm2l7aBLVNuc?=
 =?us-ascii?Q?gJ6ZVIvQunw9erThGIzysLWpaoKzh1hbgfz5J1F/Qv+qoh6ZqvKhVGBp2r6f?=
 =?us-ascii?Q?SGj/M6uE1+RJVziPTfK1CWahTVzqhIJD+U7CrWYqpUDwbM6KbJgv9FUOgJDl?=
 =?us-ascii?Q?OTbsQP4H4exDbF8in0e/+CNu7wvNfqMJVQ+Lo9V0dnK3ZUlNPf/kbAPdGkJL?=
 =?us-ascii?Q?R+EB52YdQU/Llg4kB+Cgzo/ARQzx1WChB7PZD8OY+pXkDMq3x31n8IWzRe6+?=
 =?us-ascii?Q?YiPs+TMu/UBuxG2HYsz6R8xfmMQhO/A/ovqkQl2vra9TJ1zfuvq4XEm9Y3gB?=
 =?us-ascii?Q?ZKYbdQPgvW462jyCKChfGhwmuKQGE0v8Mv3DoY91cjkuyvLcJdjdB1nXwy2H?=
 =?us-ascii?Q?48vBrG3cUrN/b9fX38dqe7gAebyV3ZFkfaXMO8SfIoArhwBnvl490hxthE2i?=
 =?us-ascii?Q?Bjm55kckQhi3EyAQluaIBRtNe1EuUgyd3kx5tfgW7cKBv4/fRgVOQDjtuYo4?=
 =?us-ascii?Q?iSLLKrE/3ywFsGEDWRcTGVbi6872Xb1zuUktlBnQuI0KzUktHlvCY5Y9Rf05?=
 =?us-ascii?Q?nvlDj/oaztJKh8+Wa/A2QsR5Q3H7wilKp3dVkpTTr2hkRjYsKNi8AVMmBFtM?=
 =?us-ascii?Q?JfxdwB89v06vjzBX5WG+s7B4E3Adp9xgj6iaHDX5ZEV0LGddW0wu2cytNAGd?=
 =?us-ascii?Q?DbG8zYGgytjnNsScaONPCQfa0FCJ2l1Q9OOEpBzoIcOeRB2UsJSof2j7Z+n2?=
 =?us-ascii?Q?eNnpgegXeuNPC6EyXt/gIihLZuaJhaGLudadOVL7nj9SruscDQQp6WkipPAi?=
 =?us-ascii?Q?fXpo5VY1oWKbdufEnc3QDXOOQnD5f8ExGeX1guIlXoGAzbWp4LtKg+oclJeO?=
 =?us-ascii?Q?7KMfxo+E6GFkH7xoGrbV2O5s/IjArIb8BGXjf3vlslL08y5RsDK2qPe028v6?=
 =?us-ascii?Q?TZqo/HdUZosKUVq0998wxLyf?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7241407c-569c-4a0a-dbeb-08d8ff23748b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR03MB5345.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 08:58:21.9376 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u3+IU7wqdlqvMVyVUza0UfQx5B/Ur9neZBnGGkRnm1Re505DQ2rdBkTR44Ir43r3kASpvgf2r7o74iIJ2MmnIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5078
X-Mailman-Approved-At: Wed, 14 Apr 2021 22:25:43 +0200
Subject: [OpenRISC] [PATCH] init: consolidate trap_init()
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

TWFueSBhcmNoaXRlY3R1cmVzIGltcGxlbWVudCB0aGUgdHJhcF9pbml0KCkgYXMgTk9QLCBzaW5j
ZSB0aGVyZSBpcwpubyBzdWNoIGRlZmF1bHQgZm9yIHRyYXBfaW5pdCgpLCB0aGlzIGVtcHR5IHN0
dWIgaXMgZHVwbGljYXRlZCBhbW9uZwp0aGVzZSBhcmNoaXRlY3R1cmVzLiBQcm92aWRlIGEgZ2Vu
ZXJpYyBidXQgd2VhayBOT1AgaW1wbGVtZW50YXRpb24KdG8gZHJvcCB0aGUgZW1wdHkgc3R1YnMg
b2YgdHJhcF9pbml0KCkgaW4gdGhlc2UgYXJjaGl0ZWN0dXJlcy4KClNpZ25lZC1vZmYtYnk6IEpp
c2hlbmcgWmhhbmcgPEppc2hlbmcuWmhhbmdAc3luYXB0aWNzLmNvbT4KLS0tCiBhcmNoL2FyYy9r
ZXJuZWwvdHJhcHMuYyAgICAgIHwgIDUgLS0tLS0KIGFyY2gvYXJtL2tlcm5lbC90cmFwcy5jICAg
ICAgfCAgNSAtLS0tLQogYXJjaC9oODMwMC9rZXJuZWwvdHJhcHMuYyAgICB8IDEzIC0tLS0tLS0t
LS0tLS0KIGFyY2gvaGV4YWdvbi9rZXJuZWwvdHJhcHMuYyAgfCAgNCAtLS0tCiBhcmNoL25kczMy
L2tlcm5lbC90cmFwcy5jICAgIHwgIDUgLS0tLS0KIGFyY2gvbmlvczIva2VybmVsL3RyYXBzLmMg
ICAgfCAgNSAtLS0tLQogYXJjaC9vcGVucmlzYy9rZXJuZWwvdHJhcHMuYyB8ICA1IC0tLS0tCiBh
cmNoL3BhcmlzYy9rZXJuZWwvdHJhcHMuYyAgIHwgIDQgLS0tLQogYXJjaC9wb3dlcnBjL2tlcm5l
bC90cmFwcy5jICB8ICA1IC0tLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jICAgIHwgIDUg
LS0tLS0KIGFyY2gvdW0va2VybmVsL3RyYXAuYyAgICAgICAgfCAgNCAtLS0tCiBpbml0L21haW4u
YyAgICAgICAgICAgICAgICAgIHwgIDIgKysKIDEyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgNjAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcmMva2VybmVsL3RyYXBz
LmMgYi9hcmNoL2FyYy9rZXJuZWwvdHJhcHMuYwppbmRleCA1NzIzNWU1YzBjZWEuLjZiODNlM2Yy
YjQxYyAxMDA2NDQKLS0tIGEvYXJjaC9hcmMva2VybmVsL3RyYXBzLmMKKysrIGIvYXJjaC9hcmMv
a2VybmVsL3RyYXBzLmMKQEAgLTIwLDExICsyMCw2IEBACiAjaW5jbHVkZSA8YXNtL3VuYWxpZ25l
ZC5oPgogI2luY2x1ZGUgPGFzbS9rcHJvYmVzLmg+CiAKLXZvaWQgX19pbml0IHRyYXBfaW5pdCh2
b2lkKQotewotCXJldHVybjsKLX0KLQogdm9pZCBkaWUoY29uc3QgY2hhciAqc3RyLCBzdHJ1Y3Qg
cHRfcmVncyAqcmVncywgdW5zaWduZWQgbG9uZyBhZGRyZXNzKQogewogCXNob3dfa2VybmVsX2Zh
dWx0X2RpYWcoc3RyLCByZWdzLCBhZGRyZXNzKTsKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2tlcm5l
bC90cmFwcy5jIGIvYXJjaC9hcm0va2VybmVsL3RyYXBzLmMKaW5kZXggMTdkNWE3ODVkZjI4Li45
YmFjY2VmMjAzOTIgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2tlcm5lbC90cmFwcy5jCisrKyBiL2Fy
Y2gvYXJtL2tlcm5lbC90cmFwcy5jCkBAIC03ODAsMTEgKzc4MCw2IEBAIHZvaWQgYWJvcnQodm9p
ZCkKIAlwYW5pYygiT29wcyBmYWlsZWQgdG8ga2lsbCB0aHJlYWQiKTsKIH0KIAotdm9pZCBfX2lu
aXQgdHJhcF9pbml0KHZvaWQpCi17Ci0JcmV0dXJuOwotfQotCiAjaWZkZWYgQ09ORklHX0tVU0VS
X0hFTFBFUlMKIHN0YXRpYyB2b2lkIF9faW5pdCBrdXNlcl9pbml0KHZvaWQgKnZlY3RvcnMpCiB7
CmRpZmYgLS1naXQgYS9hcmNoL2g4MzAwL2tlcm5lbC90cmFwcy5jIGIvYXJjaC9oODMwMC9rZXJu
ZWwvdHJhcHMuYwppbmRleCA1ZDhiOTY5Y2Q4ZjMuLmMzYTNlYmY3N2ZiYiAxMDA2NDQKLS0tIGEv
YXJjaC9oODMwMC9rZXJuZWwvdHJhcHMuYworKysgYi9hcmNoL2g4MzAwL2tlcm5lbC90cmFwcy5j
CkBAIC0zMCwxOSArMzAsNiBAQAogCiBzdGF0aWMgREVGSU5FX1NQSU5MT0NLKGRpZV9sb2NrKTsK
IAotLyoKLSAqIHRoaXMgbXVzdCBiZSBjYWxsZWQgdmVyeSBlYXJseSBhcyB0aGUga2VybmVsIG1p
Z2h0Ci0gKiB1c2Ugc29tZSBpbnN0cnVjdGlvbiB0aGF0IGFyZSBlbXVsYXRlZCBvbiB0aGUgMDYw
Ci0gKi8KLQotdm9pZCBfX2luaXQgYmFzZV90cmFwX2luaXQodm9pZCkKLXsKLX0KLQotdm9pZCBf
X2luaXQgdHJhcF9pbml0KHZvaWQpCi17Ci19Ci0KIGFzbWxpbmthZ2Ugdm9pZCBzZXRfZXNwMCh1
bnNpZ25lZCBsb25nIHNzcCkKIHsKIAljdXJyZW50LT50aHJlYWQuZXNwMCA9IHNzcDsKZGlmZiAt
LWdpdCBhL2FyY2gvaGV4YWdvbi9rZXJuZWwvdHJhcHMuYyBiL2FyY2gvaGV4YWdvbi9rZXJuZWwv
dHJhcHMuYwppbmRleCA5MDQxMzRiMzcyMzIuLmVkZmMzNWRhZmViMSAxMDA2NDQKLS0tIGEvYXJj
aC9oZXhhZ29uL2tlcm5lbC90cmFwcy5jCisrKyBiL2FyY2gvaGV4YWdvbi9rZXJuZWwvdHJhcHMu
YwpAQCAtMjgsMTAgKzI4LDYgQEAKICNkZWZpbmUgVFJBUF9TWVNDQUxMCTEKICNkZWZpbmUgVFJB
UF9ERUJVRwkweGRiCiAKLXZvaWQgX19pbml0IHRyYXBfaW5pdCh2b2lkKQotewotfQotCiAjaWZk
ZWYgQ09ORklHX0dFTkVSSUNfQlVHCiAvKiBNYXliZSBzaG91bGQgcmVzZW1ibGUgYXJjaC9zaC9r
ZXJuZWwvdHJhcHMuYyA/PyAqLwogaW50IGlzX3ZhbGlkX2J1Z2FkZHIodW5zaWduZWQgbG9uZyBh
ZGRyKQpkaWZmIC0tZ2l0IGEvYXJjaC9uZHMzMi9rZXJuZWwvdHJhcHMuYyBiL2FyY2gvbmRzMzIv
a2VybmVsL3RyYXBzLmMKaW5kZXggZWUwZDlhZTE5MmE1Li5mMDY0MjFjNjQ1YWYgMTAwNjQ0Ci0t
LSBhL2FyY2gvbmRzMzIva2VybmVsL3RyYXBzLmMKKysrIGIvYXJjaC9uZHMzMi9rZXJuZWwvdHJh
cHMuYwpAQCAtMTgzLDExICsxODMsNiBAQCB2b2lkIF9fcGdkX2Vycm9yKGNvbnN0IGNoYXIgKmZp
bGUsIGludCBsaW5lLCB1bnNpZ25lZCBsb25nIHZhbCkKIH0KIAogZXh0ZXJuIGNoYXIgKmV4Y2Vw
dGlvbl92ZWN0b3IsICpleGNlcHRpb25fdmVjdG9yX2VuZDsKLXZvaWQgX19pbml0IHRyYXBfaW5p
dCh2b2lkKQotewotCXJldHVybjsKLX0KLQogdm9pZCBfX2luaXQgZWFybHlfdHJhcF9pbml0KHZv
aWQpCiB7CiAJdW5zaWduZWQgbG9uZyBpdmIgPSAwOwpkaWZmIC0tZ2l0IGEvYXJjaC9uaW9zMi9r
ZXJuZWwvdHJhcHMuYyBiL2FyY2gvbmlvczIva2VybmVsL3RyYXBzLmMKaW5kZXggYjE3MmRhNGVi
MWE5Li41OTY5ODZhNzRhMjYgMTAwNjQ0Ci0tLSBhL2FyY2gvbmlvczIva2VybmVsL3RyYXBzLmMK
KysrIGIvYXJjaC9uaW9zMi9rZXJuZWwvdHJhcHMuYwpAQCAtMTA1LDExICsxMDUsNiBAQCB2b2lk
IHNob3dfc3RhY2soc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrLCB1bnNpZ25lZCBsb25nICpzdGFj
aywKIAlwcmludGsoIiVzXG4iLCBsb2dsdmwpOwogfQogCi12b2lkIF9faW5pdCB0cmFwX2luaXQo
dm9pZCkKLXsKLQkvKiBOb3RoaW5nIHRvIGRvIGhlcmUgKi8KLX0KLQogLyogQnJlYWtwb2ludCBo
YW5kbGVyICovCiBhc21saW5rYWdlIHZvaWQgYnJlYWtwb2ludF9jKHN0cnVjdCBwdF9yZWdzICpm
cCkKIHsKZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJpc2Mva2VybmVsL3RyYXBzLmMgYi9hcmNoL29w
ZW5yaXNjL2tlcm5lbC90cmFwcy5jCmluZGV4IDRkNjEzMzNjMjYyMy4uYWExZTcwOTQwNWFjIDEw
MDY0NAotLS0gYS9hcmNoL29wZW5yaXNjL2tlcm5lbC90cmFwcy5jCisrKyBiL2FyY2gvb3BlbnJp
c2Mva2VybmVsL3RyYXBzLmMKQEAgLTIzMSwxMSArMjMxLDYgQEAgdm9pZCB1bmhhbmRsZWRfZXhj
ZXB0aW9uKHN0cnVjdCBwdF9yZWdzICpyZWdzLCBpbnQgZWEsIGludCB2ZWN0b3IpCiAJZGllKCJP
b3BzIiwgcmVncywgOSk7CiB9CiAKLXZvaWQgX19pbml0IHRyYXBfaW5pdCh2b2lkKQotewotCS8q
IE5vdGhpbmcgbmVlZHMgdG8gYmUgZG9uZSAqLwotfQotCiBhc21saW5rYWdlIHZvaWQgZG9fdHJh
cChzdHJ1Y3QgcHRfcmVncyAqcmVncywgdW5zaWduZWQgbG9uZyBhZGRyZXNzKQogewogCWZvcmNl
X3NpZ19mYXVsdChTSUdUUkFQLCBUUkFQX0JSS1BULCAodm9pZCBfX3VzZXIgKilyZWdzLT5wYyk7
CmRpZmYgLS1naXQgYS9hcmNoL3BhcmlzYy9rZXJuZWwvdHJhcHMuYyBiL2FyY2gvcGFyaXNjL2tl
cm5lbC90cmFwcy5jCmluZGV4IDhkODQ0MWQ0NTYyYS4uNzQ3YzMyOGZiODg2IDEwMDY0NAotLS0g
YS9hcmNoL3BhcmlzYy9rZXJuZWwvdHJhcHMuYworKysgYi9hcmNoL3BhcmlzYy9rZXJuZWwvdHJh
cHMuYwpAQCAtODU5LDcgKzg1OSwzIEBAIHZvaWQgIF9faW5pdCBlYXJseV90cmFwX2luaXQodm9p
ZCkKIAogCWluaXRpYWxpemVfaXZ0KCZmYXVsdF92ZWN0b3JfMjApOwogfQotCi12b2lkIF9faW5p
dCB0cmFwX2luaXQodm9pZCkKLXsKLX0KZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rZXJuZWwv
dHJhcHMuYyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvdHJhcHMuYwppbmRleCBhNDRhMzBiMDY4OGMu
LmU5NTJiZWU4OTY4NCAxMDA2NDQKLS0tIGEvYXJjaC9wb3dlcnBjL2tlcm5lbC90cmFwcy5jCisr
KyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvdHJhcHMuYwpAQCAtMjIwNywxMSArMjIwNyw2IEBAIERF
RklORV9JTlRFUlJVUFRfSEFORExFUihrZXJuZWxfYmFkX3N0YWNrKQogCWRpZSgiQmFkIGtlcm5l
bCBzdGFjayBwb2ludGVyIiwgcmVncywgU0lHQUJSVCk7CiB9CiAKLXZvaWQgX19pbml0IHRyYXBf
aW5pdCh2b2lkKQotewotfQotCi0KICNpZmRlZiBDT05GSUdfUFBDX0VNVUxBVEVEX1NUQVRTCiAK
ICNkZWZpbmUgV0FSTl9FTVVMQVRFRF9TRVRVUCh0eXBlKQkudHlwZSA9IHsgLm5hbWUgPSAjdHlw
ZSB9CmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvdHJhcHMuYwppbmRleCAwODc5YjVkZjExYjkuLmIzZjNkODRkZTc3OSAxMDA2NDQKLS0t
IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFw
cy5jCkBAIC0xOTQsOCArMTk0LDMgQEAgaW50IGlzX3ZhbGlkX2J1Z2FkZHIodW5zaWduZWQgbG9u
ZyBwYykKIAkJcmV0dXJuICgoaW5zbiAmIF9fQ09NUFJFU1NFRF9JTlNOX01BU0spID09IF9fQlVH
X0lOU05fMTYpOwogfQogI2VuZGlmIC8qIENPTkZJR19HRU5FUklDX0JVRyAqLwotCi0vKiBzdHZl
YyAmIHNjcmF0Y2ggaXMgYWxyZWFkeSBzZXQgZnJvbSBoZWFkLlMgKi8KLXZvaWQgdHJhcF9pbml0
KHZvaWQpCi17Ci19CmRpZmYgLS1naXQgYS9hcmNoL3VtL2tlcm5lbC90cmFwLmMgYi9hcmNoL3Vt
L2tlcm5lbC90cmFwLmMKaW5kZXggYWQxMmY3OGJkYTdlLi4zMTk4YzQ3NjczODcgMTAwNjQ0Ci0t
LSBhL2FyY2gvdW0va2VybmVsL3RyYXAuYworKysgYi9hcmNoL3VtL2tlcm5lbC90cmFwLmMKQEAg
LTMxMSw3ICszMTEsMyBAQCB2b2lkIHdpbmNoKGludCBzaWcsIHN0cnVjdCBzaWdpbmZvICp1bnVz
ZWRfc2ksIHN0cnVjdCB1bWxfcHRfcmVncyAqcmVncykKIHsKIAlkb19JUlEoV0lOQ0hfSVJRLCBy
ZWdzKTsKIH0KLQotdm9pZCB0cmFwX2luaXQodm9pZCkKLXsKLX0KZGlmZiAtLWdpdCBhL2luaXQv
bWFpbi5jIGIvaW5pdC9tYWluLmMKaW5kZXggNTNiMjc4ODQ1Yjg4Li40YmRiZTI5Mjg1MzAgMTAw
NjQ0Ci0tLSBhL2luaXQvbWFpbi5jCisrKyBiL2luaXQvbWFpbi5jCkBAIC03OTAsNiArNzkwLDgg
QEAgc3RhdGljIGlubGluZSB2b2lkIGluaXRjYWxsX2RlYnVnX2VuYWJsZSh2b2lkKQogfQogI2Vu
ZGlmCiAKK3ZvaWQgX19pbml0IF9fd2VhayB0cmFwX2luaXQodm9pZCkgeyB9CisKIC8qIFJlcG9y
dCBtZW1vcnkgYXV0by1pbml0aWFsaXphdGlvbiBzdGF0ZXMgZm9yIHRoaXMgYm9vdC4gKi8KIHN0
YXRpYyB2b2lkIF9faW5pdCByZXBvcnRfbWVtaW5pdCh2b2lkKQogewotLSAKMi4zMS4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWls
aW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJy
ZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=
