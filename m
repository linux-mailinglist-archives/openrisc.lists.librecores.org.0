Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 4867C2E2930
	for <lists+openrisc@lfdr.de>; Fri, 25 Dec 2020 00:15:31 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3AC9720919;
	Fri, 25 Dec 2020 00:15:30 +0100 (CET)
Received: from sonic305-21.consmr.mail.gq1.yahoo.com
 (sonic305-21.consmr.mail.gq1.yahoo.com [98.137.64.84])
 by mail.librecores.org (Postfix) with ESMTPS id C72B620417
 for <openrisc@lists.librecores.org>; Wed, 16 Dec 2020 00:39:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.ca; s=s2048;
 t=1608075561; bh=ZkwtcN1Znn8ElcNfcf+qBswC+LM15JB4pYSZu2ijlTk=;
 h=Date:From:Subject:To:References:In-Reply-To:From:Subject;
 b=bsOksqOjy08JRuM1vNMYKY63ugniz6HKC1zmUhBC5VKH2e12SAHB008RzBECewMo+icMFJI6NYQhG4/OH7Z/GLk5hLZgxT6F8kZiz5UMvuAYx2D/hINMWnQtozRzOnLfAyfg4lGjSjjFIIidoNVJcMiw2bwjvwedEWRGxpRnyM3Ldt3qrWOgqFbOOiBgI3BZuVeYXjfeaWjeGeT0MBIBWTGZika6x6BAqY+x1IAlvkfZB4WTzvSUQjuyI/HEv0kpieYrUu5GWR9OVUjFxGsut6hwHVFFNYOj3DlUB/PQIYAldTAgtvZgISakZfFzJiNQVM/20ujq6L1prYQ3+1aTYw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1608075561; bh=sa9UqAHRB7t41f/GLWfHt+ZwGcZHRuwzz9vsWaaIuHi=;
 h=Date:From:Subject:To:From:Subject;
 b=jBqLOED7uPJH+hPV5WVZNIV/P86RjHeCPnWryS+Z+teP5vUvDvppKa/KgpFjsDGAyX9x5IVqe+MNZRFJB5wO7GjSO7NrcrdbtS1i1Cme4DGBGEmM0jUIHuBXr+OHecGvV7frx91OwbA8b5xY+qrzhHM/5e4s7p781cSM5YNwfIKpYsLgKfnFNg83UyrBfJWg4ioEuMwW13uUB7hTvBTivVGYHzSpMaP5scMnwuPq4A0xgJH7L62FGyU7yxofnHAZEjRZVoCzfy4+YdMpUhltJUNVEe2aZs4O59gIQy2zlFm0AkPZB1YIqvAWU3PE6Sh8JQefZqwhHUv/kiFoAQioAQ==
X-YMail-OSG: JulUi2QVM1nOM7VAg5vRbxJvcPrCfaXBKUng8mGlePCsxSIq3rtbyl96cSN5qFK
 7.h4Aa88liq6HVnGOUXcsPeXL74TBWciCtyW_KeIQUDxofTYYXt5IHkQm_umaVImY3W8liebEIU4
 szvNP5o2H3HY3PIhLLi9iNOUkBJ2yguyZZ4umprzcIXvxROcjUkrtUF8dVFU5Y3xwGuCdvPCLPqj
 mLREEVIFTPri8ysQqktoHfLQdaQYt8xV18xWtfZtrMrOK_JzwXGk7SW7sYwSNosu9uwQQJEIYp25
 cTHfIxdQVf4lWmsA.CIzdUsg8QPSpTavYfCr6LO0SfIZRWuzGApiP8U6LWearQZG1UoSMaGOlmvV
 QK3kWN4RGWv9HSH1Hg82mcZreKjG.nLZe.u_SHz2u_rWetzTpPUsB1yRuKpBnteJnWvrO.qum9.z
 mv0L0fE0DATM5I0.NwaT7tn2NiCPFmwsqfsc9.kyWtiASArq.zAo2RpYFPlBPXhEbPBlCENQEQKv
 s5QeeeNSDN1OwLxmgN5B5wiM7K_r72En.FDRAtdIxWMRCAOJKiCjmnzIEoMIk3FFRaoSWD9jNBrW
 Oax9cagl6c79yx1SMZUw7ySAIVUiSnngUQlsee9F1VF7DviJZxvYlHBMNbteIpirbYjbC6Z9rvGd
 uIH6K0NPiK9DtjyFmrZzLewFlF_wE_jjzO.nvjjRG5DkZVtY4xYLtBfRNyfvz.5E4gb6oRmifOoI
 yfzOfhS68sbdmcv.z2QoB95lDfu3Lh2usQc9_iLkRfF2x0fJZKLWl5yMHJXhjqc5CL0OBrD_Quwn
 vlJyTIvFRHi9cuQOYThWQ7mmLMLJno6OSpcAiAh_Ov4rS_62MmN5bX.L_8AtKoD663erfbVNhRAK
 _rkXoHsNSR41yhY_.keMq9DQU_iI2kQWkNUYGpVI5GpnJWjdlBqWagg20f40YxDoPHDa6tXsqhlb
 ZZA.yEr0wXymIX4mjuMRnTLupT1nD4oq_M65fcyBFE.nyrW3Fet4XndSxEbOE.bwMM60PNwxD1Nz
 eJvvTM6.CqVT_feH0fVAhigwiI4l.YfplONEEAyRsLwhS_HH6gbt4JPTz6fLQWku6QOq5lpehXsZ
 KUeYwDTIJkmNzjjmCeg3GbP4xFEhYYaUIg42LJ.97ldAT9iYf8g.c7P.7KUMMArV5ypQrnw1j6CD
 0JxTjhsdTnF49PUfrYa0s_MEKYvrly5B2WyCbpAcG9EFoTFhU.LWSbdyHz8C.Dcva4VHJIgt8XYf
 Gi5MaKoYfAvOC4MAgTmJ4ZOg0q3eMDsHGs.gyr.XUwV6rOJIFsQkmWHe5rSAMGlXIPUW8t8tg3dJ
 EvwOP9NXlwMJ566bOyAKEwOMCM34ICqvVjQsUOrkPwQ4lyO74vG6CfNeJQLhgtteaNJckXbbMYom
 0JTVZbosF0m5qEi1TVusHClEGP7Z4xbDXarz8NRWZI_ZNZFL.tIYlsO22EHLzE22YQPFWcWAkth1
 NZ_M2bnWezpO5GVnUliz65SktX_0SpmT5rqk7GR_19caN3LB.MaDOkY4ecZ0XcBRN8uEIFI64YWy
 1My91erfKvO3oXGTtA7m7jZSqJjGz3K7Il_Tb_XdT8YVxK._qI6DnY0Qp4Yh0m5nj4k9R6JN.Ikx
 VasRMIlnL.xwcgifvV.4GjcKSJahPRp5GpCTEBPcurH1zDt9QwztI3Zv07uC5koUrcwqGNtnc3XD
 gFmL1quC.BGbahu9v8eRrCAEIppDmZO.72mlMtzLhZENeSQiSuo4cPtoMsGBJN_KUy8VeztqYzFD
 EfxCmL21bPq.A4QLIFTpRzDhKirGiOWr0Bq2IHZfHT5ijhUpfqv5K.6JgXPa1IMg7DM_Gow4vzuP
 SeW27Y0P4zHN3SxUy2r61UDe1ZbNJ9k4MwzC6YoC_d6QOi46NjldipKhbIqHo6o71_eEjH9uwL_i
 _zgJQIT_J3itRCrREf451k4iZvlUlSyX5IczmCMYrOsE7cfoqb0Nyc7DTrbKJHMnBwBJix09Ckpz
 .teceLV2ymIU0aOOwiX.44MLRrUl5Wg7YYqY8CI2J7cC3fPw5cIxg5O4UXv7pvPyVvE2W3hJgO9F
 wrGwyKCcY0bXQu3GN6OoCkX6jNSHTPoYu5k7WLYoK7tcL3eS0LE5PG9xVEoyy7oXWUlyZshME2qI
 KO_DK.c_1z4S77qdx7g5kAF.OHVQX6ndSiRlwpiBBGFE2ThKR.xWlfNg8OtjD_wkPzbb8jPOhVmZ
 _pWEzmIMWTGML6UG6XRrr26iSpK.L_5qJkOWiU_JTnF0dRNmoQeW6JpP_jzs8qwn3izwaxkDlldY
 4.oHtiHpqde8T4uIl9ob33_.aMuSa_PkLK9CJYHa7_B_gmqr37Xx9ToobzNTJjlOlg5SwfFGAHk7
 3vK2RZcMYwoQjAmf3xX38T1lWinVefLaW4ivnACyz9UikzJX0SBJKjQLkSc_afdyIjXARY_Urvn_
 QMkkwGljA8VbvJ2CWPJ0BMEmUwiCYzPtTyHlmQiOv9yAAxhuCg32.jgPJVuvGU7Iet6xroUXpqsM
 t99A9lEGlYWGE_SBf56PyMeXAk.yv3NBa7T4I43u.X.xjVy7D01r4ED5lpaQ7RCnx.XfVJFK6Btg
 sQRdIz_UER_rNkMUrGDlzs8dnJMpxICv7gh0fSIrB4JgTsIn9g3Oy5eZZvHp5d6lEj6PgrUHyrSu
 qCDbrnZdiqIFiE3TS9ywhnHJKOP31TMCVzhypQtBC9KPedUuZe0GGlqPLWBVgc2E6nm8L4s2b56N
 UlyZdlKFUyeBoFy8vhS8Q1XuFHcLinhhwKHbG8s60WOAZAmRNkYJ1AEtD_trNzcKQ7a8f.oS6a8I
 _UgJD1jFuMJeAjp4Nd2zY.fTu_1t5CBIPBgaVlesmI_6dUDjGS5M6zjHuoD.IHF5YAwJNQW764XX
 hYuc-
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic305.consmr.mail.gq1.yahoo.com with HTTP; Tue, 15 Dec 2020 23:39:21 +0000
Received: by smtp409.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
 ID 7f42f66753ff764add4cd34d24e29391; 
 Tue, 15 Dec 2020 23:39:20 +0000 (UTC)
Date: Tue, 15 Dec 2020 18:39:17 -0500
From: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-xtensa@linux-xtensa.org
References: <20201215190315.8681-1-alex_y_xu.ref@yahoo.ca>
 <20201215190315.8681-1-alex_y_xu@yahoo.ca>
In-Reply-To: <20201215190315.8681-1-alex_y_xu@yahoo.ca>
MIME-Version: 1.0
Message-Id: <1608075451.ootu1tx25o.none@localhost>
X-Mailer: WebService/1.1.17278
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
 Apache-HttpAsyncClient/4.1.4 (Java/11.0.8)
X-Mailman-Approved-At: Fri, 25 Dec 2020 00:15:22 +0100
Subject: Re: [OpenRISC] [RFC PATCH] treewide: remove bzip2 compression
 support
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RXhjZXJwdHMgZnJvbSBBbGV4IFh1IChIZWxsbzcxKSdzIG1lc3NhZ2Ugb2YgRGVjZW1iZXIgMTUs
IDIwMjAgMjowMyBwbToKPiBiemlwMiBpcyBlaXRoZXIgc2xvd2VyIG9yIGxhcmdlciB0aGFuIGV2
ZXJ5IG90aGVyIHN1cHBvcnRlZCBhbGdvcml0aG0sCj4gYWNjb3JkaW5nIHRvIGJlbmNobWFya3Mg
YXQgWzBdLiBJdCBpcyBmYXIgc2xvd2VyIHRvIGRlY29tcHJlc3MgdGhhbiBhbnkKPiBvdGhlciBh
bGdvcml0aG0sIGFuZCBzdGlsbCBsYXJnZXIgdGhhbiBsem1hLCB4eiwgYW5kIHpzdGQuCj4gCj4g
WzBdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMTU4ODc5MTg4Mi4wOGcxMzc4ZzY3Lm5v
bmVAbG9jYWxob3N0Lwo+IAo+IFNpZ25lZC1vZmYtYnk6IEFsZXggWHUgKEhlbGxvNzEpIDxhbGV4
X3lfeHVAeWFob28uY2E+CgpVcG9uIGZ1cnRoZXIgcmVzZWFyY2gsIEkgZm91bmQgdGhhdCBiemlw
MiByZW1vdmFsIHdhcyBhbHJlYWR5IAppbXBsZW1lbnRlZCBhcyBwYXJ0IG9mIHpzdGQgYWRkaXRp
b24sIGJ1dCB3ZXJlIGFwcGFyZW50bHkgYWJhbmRvbmVkIGluIAphbiBlZmZvcnQgdG8gZ2V0IHpz
dGQgaW4uIEkgd2lsbCBjaGVjayB0aG9zZSBwYXRjaGVzIGFuZCB0cnkgc2VuZGluZyAKdGhvc2Ug
aW5zdGVhZC4gVGhhbmtzIHRvIGFsbCByZXZpZXdlcnMgZm9yIGNvbW1lbnRzIG9uIHRoaXMgcGF0
Y2guCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5S
SVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xp
c3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==
