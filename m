Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 1E01B416171
	for <lists+openrisc@lfdr.de>; Thu, 23 Sep 2021 16:52:16 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 400B72412B;
	Thu, 23 Sep 2021 16:52:14 +0200 (CEST)
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by mail.librecores.org (Postfix) with ESMTPS id EE524240DA
 for <openrisc@lists.librecores.org>; Thu, 23 Sep 2021 16:52:12 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0EDAA58022E;
 Thu, 23 Sep 2021 10:52:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 23 Sep 2021 10:52:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=ECL/W0JHBzjsvTqx0apumlX8TFj
 I0aM1RfQ42lFm1yE=; b=e6mKC9bJBNCh+RXWafVvCV5Jf03xh/NidQDc5NIYfz2
 S9Pw1VcH/VNQ5sq6XQAJRmDkwrEuxYWnpX/IMHpVmijM0Iv8llJldRYrBe/nAFSM
 VDnf98qQdI6MYKGpw4jSNd78eEDcCzrtPWuqiJPEUFRaZJSsPYUj14kcGxbyKoLJ
 IeNW6UbvHe9CaigyX7itvsWJul78oSE0A2VikawBYxZhydMenl+Hbk8dnGMSoxqh
 6aBfFMaaA1W56NXvYmEsVTm4C3NIgXXa/1e1UdMjMZsy/xusnDFRDIDRI7eYbmjB
 zrW1bzFnzgTakISMpzaEocmKJfJKRW7ME4QGMcF8JDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ECL/W0
 JHBzjsvTqx0apumlX8TFjI0aM1RfQ42lFm1yE=; b=G0chn8iQj5pMkUwxH5bJGa
 3Or2RCZdRX955IK/flCpC+fgvZPI1egFi6Kk4k4EN8qiLqq3sHYLcZ9RIMISx1dM
 15OpIalBCnjxMwqMiUph0o/uWSFr1xhY6DWENqW49G4s3yKksQPPfJOWl9Qj8/x2
 lEA5vwq5TWgZx/DA2hiviZ3oq/7M/wHtRhn6xaqQ9Ig1dpdDBtlfyXNAO6/kl7Gu
 AvMyxUV1dA96gPyzRrI794ax/fLsNujxvs9RNWHudVMqMOh6lKaS3gvxdi0vCKxT
 fc2TyJl6rx4JiXNWqTvjjSbyuETmYPINNlZ/Uy1zwvxYmn85+FcPI+0sk6Lrm35A
 ==
X-ME-Sender: <xms:mpRMYel1ntLjCzzrgWb9NBpidWZsao8yoK5gPTjlc2ERRR8nuQ74bQ>
 <xme:mpRMYV2mKRSgxPMJF6gfIWLiwDpyGYmwFinURePab0D57azrWirOK9GGYWoWA2rDJ
 -QmI2lq_2Lrz2uLbU4>
X-ME-Received: <xmr:mpRMYcq7T_wTF8S7CvHKoOTp1uD9S1FncAc4bDHAEMQ1QcH3ThRt0C3cBVdT2wI56abX9jfmyh-Pxdj-Dv1A-UlxgESP5b41c6v6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeiledgkeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepveevfeffudeviedtgeethffhteeuffetfeffvdehvedvheetteehvdelfffg
 jedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:mpRMYSndxZ-HJruYXzhS2RsdSE1_99p4YMTzKpcZY64cjsibiOLJfg>
 <xmx:mpRMYc3EAXiPX8WYMlOscozr6DM0elkWKxPeajp_N3s79ra7U4GSEg>
 <xmx:mpRMYZuVc2OwQpAMi966nDciHF9fP24bpP-n-dROi_n5V1nkgSZTYw>
 <xmx:nJRMYWXG8QHVD6a6uIO8C4Z21Z3Rdj8pJNGe8_cMO8vj6zG-zTV8Dw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Sep 2021 10:52:10 -0400 (EDT)
Date: Thu, 23 Sep 2021 16:52:08 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Nathan Chancellor <nathan@kernel.org>
Message-ID: <20210923145208.433zaqldird2vnxk@gilmour>
References: <20210819135931.895976-1-maxime@cerno.tech>
 <20210819135931.895976-2-maxime@cerno.tech>
 <8a5cdcf5-33ed-398f-243a-b8889fd754e3@infradead.org>
 <20210922084156.xqru5fdjkarbkyew@gilmour>
 <YUtQnml8FO8BC7sM@archlinux-ax161>
MIME-Version: 1.0
In-Reply-To: <YUtQnml8FO8BC7sM@archlinux-ax161>
Subject: Re: [OpenRISC] [PATCH v3 1/6] drm/vc4: select PM (openrisc)
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
Cc: Jonas Bonn <jonas@southpole.se>, Emma Anholt <emma@anholt.net>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Randy Dunlap <rdunlap@infradead.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Openrisc <openrisc@lists.librecores.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: multipart/mixed; boundary="===============0037993879421432909=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>


--===============0037993879421432909==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ytg6q5sndyazppt3"
Content-Disposition: inline


--ytg6q5sndyazppt3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Nathan,

On Wed, Sep 22, 2021 at 08:49:50AM -0700, Nathan Chancellor wrote:
> On Wed, Sep 22, 2021 at 10:41:56AM +0200, Maxime Ripard wrote:
> > Hi Randy,
> >=20
> > On Sun, Sep 19, 2021 at 09:40:44AM -0700, Randy Dunlap wrote:
> > > On 8/19/21 6:59 AM, Maxime Ripard wrote:
> > > > We already depend on runtime PM to get the power domains and clocks=
 for
> > > > most of the devices supported by the vc4 driver, so let's just sele=
ct it
> > > > to make sure it's there, and remove the ifdef.
> > > >=20
> > > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > > ---
> > > >   drivers/gpu/drm/vc4/Kconfig    | 1 +
> > > >   drivers/gpu/drm/vc4/vc4_hdmi.c | 2 --
> > > >   2 files changed, 1 insertion(+), 2 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/vc4/Kconfig b/drivers/gpu/drm/vc4/Kcon=
fig
> > > > index 118e8a426b1a..f774ab340863 100644
> > > > --- a/drivers/gpu/drm/vc4/Kconfig
> > > > +++ b/drivers/gpu/drm/vc4/Kconfig
> > > > @@ -9,6 +9,7 @@ config DRM_VC4
> > > >   	select DRM_KMS_CMA_HELPER
> > > >   	select DRM_GEM_CMA_HELPER
> > > >   	select DRM_PANEL_BRIDGE
> > > > +	select PM
> > > >   	select SND_PCM
> > > >   	select SND_PCM_ELD
> > > >   	select SND_SOC_GENERIC_DMAENGINE_PCM
> > > > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/v=
c4_hdmi.c
> > > > index c2876731ee2d..602203b2d8e1 100644
> > > > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > > @@ -2107,7 +2107,6 @@ static int vc5_hdmi_init_resources(struct vc4=
_hdmi *vc4_hdmi)
> > > >   	return 0;
> > > >   }
> > > > -#ifdef CONFIG_PM
> > > >   static int vc4_hdmi_runtime_suspend(struct device *dev)
> > > >   {
> > > >   	struct vc4_hdmi *vc4_hdmi =3D dev_get_drvdata(dev);
> > > > @@ -2128,7 +2127,6 @@ static int vc4_hdmi_runtime_resume(struct dev=
ice *dev)
> > > >   	return 0;
> > > >   }
> > > > -#endif
> > > >   static int vc4_hdmi_bind(struct device *dev, struct device *maste=
r, void *data)
> > > >   {
> > > >=20
> > >=20
> > > Hi,
> > >=20
> > > FYI.
> > >=20
> > > This still causes a build error on arch/openrisc/ since it does not s=
upport
> > > CONFIG_PM (it does not source "kernel/power/Kconfig" like some other =
arches do):
> > >=20
> > > ./arch/riscv/Kconfig:source "kernel/power/Kconfig"
> > > ./arch/x86/Kconfig:source "kernel/power/Kconfig"
> > > ./arch/nds32/Kconfig:source "kernel/power/Kconfig"
> > > ./arch/sh/Kconfig:source "kernel/power/Kconfig"
> > > ./arch/arc/Kconfig:source "kernel/power/Kconfig"
> > > ./arch/arm64/Kconfig:source "kernel/power/Kconfig"
> > > ./arch/xtensa/Kconfig:source "kernel/power/Kconfig"
> > > ./arch/sparc/Kconfig:source "kernel/power/Kconfig"
> > > ./arch/arm/Kconfig:source "kernel/power/Kconfig"
> > > ./arch/mips/Kconfig:source "kernel/power/Kconfig"
> > > ./arch/powerpc/Kconfig:source "kernel/power/Kconfig"
> > > ./arch/um/Kconfig:source "kernel/power/Kconfig"
> > > ./arch/ia64/Kconfig:source "kernel/power/Kconfig"
> > >=20
> > > so with
> > > CONFIG_DRM_VC4=3Dy
> > > # CONFIG_DRM_VC4_HDMI_CEC is not set
> > >=20
> > > I still see
> > > ../drivers/gpu/drm/vc4/vc4_hdmi.c:2139:12: warning: 'vc4_hdmi_runtime=
_suspend' defined but not used [-Wunused-function]
> > >  2139 | static int vc4_hdmi_runtime_suspend(struct device *dev)
> > >       |            ^~~~~~~~~~~~~~~~~~~~~~~~
> >=20
> > With what version did you get that build error? -rc2 shouldn't have it
> > anymore since the runtime_pm hooks introduction got reverted.
>=20
> -next still contains these patches as Stephen effectively reverted the
> changes in Linus' tree when merging in the drm-misc-fixes tree:
>=20
> https://lore.kernel.org/r/20210920090729.19458953@canb.auug.org.au/

Ah, indeed, thanks.

What's the typical fix for these errors?

I guess adding a depends on ARM || ARM64 || COMPILE_TEST would work?

Maxime

--ytg6q5sndyazppt3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYUyUmAAKCRDj7w1vZxhR
xbxSAQD2+DTtAckkOgIkW5XhuxgVb3l6s27uLrWlriXbewaI7gD+N6tDqdxX9c8I
OI6BWbSVexzvlP+2PqO6lPRQNi+kiA0=
=dOL2
-----END PGP SIGNATURE-----

--ytg6q5sndyazppt3--

--===============0037993879421432909==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============0037993879421432909==--
