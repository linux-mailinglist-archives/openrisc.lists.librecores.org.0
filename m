Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2281255BC82
	for <lists+openrisc@lfdr.de>; Tue, 28 Jun 2022 02:02:42 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 984822497B;
	Tue, 28 Jun 2022 02:02:41 +0200 (CEST)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id 21E51213CC
 for <openrisc@lists.librecores.org>; Tue, 28 Jun 2022 02:02:39 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 902326130F;
 Tue, 28 Jun 2022 00:02:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E60FC34115;
 Tue, 28 Jun 2022 00:02:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="MEBk7vXW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1656374554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=FQZUKap5XDNkZfcRyXkPVi3bbUHLQHnsSG5bGqyP4Gs=;
 b=MEBk7vXWX9UxdXzAdEHnClyt7qh/hAjxGeO5aDwQEp+3YPsSYyWcoowjA0G91IZd0yzh2V
 kADyTqVjLdCONybrElAPkuNf5RSt891Ef9Fy6pFWyKLziDXhZ/oSGKWiVfkyY0co7a0/a1
 LD7l8b0Kqq9/e/3+qxIuUvIvNLk81CY=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8c2a650d
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Tue, 28 Jun 2022 00:02:34 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 shorne@gmail.com
Subject: [PATCH] wireguard: selftests: support OpenRISC
Date: Tue, 28 Jun 2022 02:02:10 +0200
Message-Id: <20220628000210.763674-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Stafford and I have been using this to shake out OpenRISC bugs, and it's
been a great help, so it's time OpenRISC support for the WireGuard test
suite is made into a proper commit. The QEMU changes necessary for this
to work should also be around the corner now, and they seem some what
stationary in their interface too.

Cc: Stafford Horne <shorne@gmail.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 .../testing/selftests/wireguard/qemu/Makefile | 13 ++++++++++-
 .../selftests/wireguard/qemu/arch/or1k.config | 22 +++++++++++++++++++
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/wireguard/qemu/arch/or1k.config

diff --git a/tools/testing/selftests/wireguard/qemu/Makefile b/tools/testing/selftests/wireguard/qemu/Makefile
index 7d1b80988d8a..57b00578b86f 100644
--- a/tools/testing/selftests/wireguard/qemu/Makefile
+++ b/tools/testing/selftests/wireguard/qemu/Makefile
@@ -247,8 +247,19 @@ QEMU_MACHINE := -cpu host,accel=kvm -machine s390-ccw-virtio -append $(KERNEL_CM
 else
 QEMU_MACHINE := -cpu max -machine s390-ccw-virtio -append $(KERNEL_CMDLINE)
 endif
+else ifeq ($(ARCH),or1k)
+CHOST := or1k-linux-musl
+QEMU_ARCH := or1k
+KERNEL_ARCH := openrisc
+KERNEL_BZIMAGE := $(KERNEL_BUILD_PATH)/vmlinux
+QEMU_VPORT_RESULT := virtio-serial-device
+ifeq ($(HOST_ARCH),$(ARCH))
+QEMU_MACHINE := -cpu host,accel=kvm -machine virt
+else
+QEMU_MACHINE := -cpu or1200 -machine virt
+endif
 else
-$(error I only build: x86_64, i686, arm, armeb, aarch64, aarch64_be, mips, mipsel, mips64, mips64el, powerpc64, powerpc64le, powerpc, m68k, riscv64, riscv32, s390x)
+$(error I only build: x86_64, i686, arm, armeb, aarch64, aarch64_be, mips, mipsel, mips64, mips64el, powerpc64, powerpc64le, powerpc, m68k, riscv64, riscv32, s390x, or1k)
 endif
 
 TOOLCHAIN_FILENAME := $(CHOST)-cross.tgz
diff --git a/tools/testing/selftests/wireguard/qemu/arch/or1k.config b/tools/testing/selftests/wireguard/qemu/arch/or1k.config
new file mode 100644
index 000000000000..164dce530ccb
--- /dev/null
+++ b/tools/testing/selftests/wireguard/qemu/arch/or1k.config
@@ -0,0 +1,22 @@
+CONFIG_OPENRISC_HAVE_INST_FF1=y
+CONFIG_OPENRISC_HAVE_INST_FL1=y
+CONFIG_OPENRISC_HAVE_INST_MUL=y
+CONFIG_OPENRISC_HAVE_INST_DIV=y
+CONFIG_OPENRISC_HAVE_INST_CMOV=y
+CONFIG_OPENRISC_HAVE_INST_ROR=y
+CONFIG_OPENRISC_HAVE_INST_RORI=y
+CONFIG_OPENRISC_HAVE_INST_SEXT=y
+CONFIG_OPENRISC_NO_SPR_SR_DSX=y
+CONFIG_JUMP_UPON_UNHANDLED_EXCEPTION=y
+CONFIG_COMPAT_32BIT_TIME=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_VIRTIO_MENU=y
+CONFIG_VIRTIO_MMIO=y
+CONFIG_VIRTIO_CONSOLE=y
+CONFIG_POWER_RESET=y
+CONFIG_POWER_RESET_SYSCON=y
+CONFIG_POWER_RESET_SYSCON_POWEROFF=y
+CONFIG_SYSCON_REBOOT_MODE=y
+CONFIG_CMDLINE="console=ttyS0 wg.success=vport0p1 panic_on_warn=1"
-- 
2.35.1

