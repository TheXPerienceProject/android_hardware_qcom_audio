#                                               -*- Autoconf -*-
# configure.ac -- Autoconf script for halinterface
#

# Process this file with autoconf to produce a configure script.

# Requires autoconf tool later than 2.61
AC_PREREQ([2.69])
# Initialize the hal-interface package version 1.0.0
AC_INIT(halinterface,1.0.0)
# Does not strictly follow GNU Coding standards
AM_INIT_AUTOMAKE([foreign])
# Disables auto rebuilding of configure, Makefile.ins
#AM_MAINTAINER_MODE
# defines some macros variable to be included by source
AC_CONFIG_HEADERS([config.h])
# defines some macros variable to be included by source
AC_CONFIG_MACRO_DIR([m4])

# Checks for programs.
AC_PROG_CC
AM_PROG_CC_C_O
AC_PROG_CXX
AC_PROG_LIBTOOL
AC_PROG_AWK
AC_PROG_CPP
AC_PROG_INSTALL
AC_PROG_LN_S
AC_PROG_MAKE_SET
PKG_PROG_PKG_CONFIG

PKG_CHECK_MODULES([AUDIOROUTE], [audio_route])
AC_SUBST([AUDIOROUTE_CFLAGS])

AC_ARG_WITH(sanitized-headers,
        AS_HELP_STRING([--with-sanitized-headers=DIR],
                [Specify the location of the sanitized Linux headers]),
        [CPPFLAGS="$CPPFLAGS -I $withval"])


AC_ARG_WITH([glib],
      AC_HELP_STRING([--with-glib],
         [enable glib, Build against glib. Use this when building for HLOS systems which use glib]))

AC_ARG_ENABLE(target,
               [AS_HELP_STRING([--enable-target=TARGET_SUPPORT],
                               [Specify the target product to build])],
               [AS_CASE([$enableval],
                        [qtiquingvm], [TARGET_SUPPORT=msmnile_au],
                        [sa81*],      [TARGET_SUPPORT=msmnile_au],
                        [sa61*],      [TARGET_SUPPORT=msmsteppe_au],
                        [qrbx210],    [TARGET_SUPPORT=qrbx210],
                        [qrb5165],    [TARGET_SUPPORT=qrb5165],
                        [sdmsteppe],    [TARGET_SUPPORT=sdmsteppe],
                        [qcs6490],    [TARGET_SUPPORT=qcs6490],
                        [TARGET_SUPPORT=none])],
               [TARGET_SUPPORT=none]
)

AC_ARG_WITH(hal-path,
        AS_HELP_STRING([--with-hal-path=DIR], [Specify the HAL modules location in run time]),
        [HAL_PATH="$withval"],
        [HAL_PATH="no"])

AM_CONDITIONAL([HAL_PATH_SPECIFIED], [test "x${HAL_PATH}" != "xno"])
AC_SUBST(HAL_PATH)

if (test "x${with_glib}" = "xyes"); then
        PKG_CHECK_MODULES(GTHREAD, gthread-2.0 >= 2.16, dummy=yes,
                                AC_MSG_ERROR(GThread >= 2.16 is required))
        PKG_CHECK_MODULES(GLIB, glib-2.0 >= 2.16, dummy=yes,
                                AC_MSG_ERROR(GLib >= 2.16 is required))
        GLIB_CFLAGS="$GLIB_CFLAGS $GTHREAD_CFLAGS"
        GLIB_LIBS="$GLIB_LIBS $GTHREAD_LIBS"

        AC_SUBST(GLIB_CFLAGS)
        AC_SUBST(GLIB_LIBS)
fi

AM_CONDITIONAL(USE_GLIB, test "x${with_glib}" = "xyes")

AC_SUBST([TARGET_PLATFORM], ["msm8916"])
if (test x$TARGET_SUPPORT = xapq8009); then
         AC_SUBST([TARGET_PLATFORM], ["msm8916"])
         TARGET_CFLAGS="-DPLATFORM_MSM8909"
fi
if (test x$TARGET_SUPPORT = xapq8053); then
         AC_SUBST([TARGET_PLATFORM], ["msm8916"])
         TARGET_CFLAGS="-DPLATFORM_MSM8916"
fi
if (test x$TARGET_SUPPORT = xapq8096); then
         AC_SUBST([TARGET_PLATFORM], ["msm8974"])
         TARGET_CFLAGS="-DPLATFORM_MSM8996"
fi
if (test x$TARGET_SUPPORT = xapq8098); then
         AC_SUBST([TARGET_PLATFORM], ["msm8974"])
         TARGET_CFLAGS="-DPLATFORM_MSM8998"
fi
if (test x$TARGET_SUPPORT = xsdxpoorwills); then
         AC_SUBST([TARGET_PLATFORM], ["msm8974"])
         TARGET_CFLAGS="-DPLATFORM_SDX24"
fi
if (test x$TARGET_SUPPORT = x8x96autogvmquintcu); then
         AC_SUBST([TARGET_PLATFORM], ["msm8974"])
         TARGET_CFLAGS="-DPLATFORM_MSM8996"
fi
if (test x$TARGET_SUPPORT = xqcs605); then
         AC_SUBST([TARGET_PLATFORM], ["msm8974"])
         TARGET_CFLAGS=" -DPLATFORM_QCS605"
fi
if (test x$TARGET_SUPPORT = xqcs40x); then
         AC_SUBST([TARGET_PLATFORM], ["msm8974"])
         TARGET_CFLAGS=" -DPLATFORM_QCS405"
fi
if (test x$TARGET_SUPPORT = xsdmsteppe); then
         AC_SUBST([TARGET_PLATFORM], ["msm8974"])
         TARGET_CFLAGS="-DPLATFORM_MSMSTEPPE"
         TARGET_CFLAGS+=" -DMAX_TARGET_SPECIFIC_CHANNEL_CNT=\"4\""
         TARGET_CFLAGS+=" -DINCALL_STEREO_CAPTURE_ENABLED"
fi
if (test x$TARGET_SUPPORT = xqrbx210); then
         AC_SUBST([TARGET_PLATFORM], ["msm8974"])
         TARGET_CFLAGS=" -DPLATFORM_BENGAL"
         TARGET_CFLAGS+=" -DMAX_TARGET_SPECIFIC_CHANNEL_CNT=\"4\""
         TARGET_CFLAGS+=" -DINCALL_STEREO_CAPTURE_ENABLED"
fi
if (test x$TARGET_SUPPORT = xqrb5165); then
         AC_SUBST([TARGET_PLATFORM], ["msm8974"])
         TARGET_CFLAGS=" -DPLATFORM_KONA"
         TARGET_CFLAGS+=" -DMAX_TARGET_SPECIFIC_CHANNEL_CNT=\"4\""
         TARGET_CFLAGS+=" -DINCALL_STEREO_CAPTURE_ENABLED"
fi
if (test x$TARGET_SUPPORT = xqcs6490); then
         AC_SUBST([TARGET_PLATFORM], ["msm8974"])
         TARGET_CFLAGS=" -DPLATFORM_LAHAINA"
         TARGET_CFLAGS+=" -DMAX_TARGET_SPECIFIC_CHANNEL_CNT=\"4\""
         TARGET_CFLAGS+=" -DINCALL_STEREO_CAPTURE_ENABLED"
fi
if (test x$TARGET_SUPPORT = xmsmnile_au); then
         AC_SUBST([TARGET_PLATFORM], ["msm8974"])
         TARGET_CFLAGS="-DPLATFORM_MSMNILE"
fi
if (test x$TARGET_SUPPORT = xmsmsteppe_au); then
         AC_SUBST([TARGET_PLATFORM], ["msm8974"])
         TARGET_CFLAGS="-DPLATFORM_MSMSTEPPE"
fi

TARGET_CFLAGS+=' -DLE_LIBDIR=\"${libdir}\" '
AC_SUBST([TARGET_CFLAGS])

AM_CONDITIONAL([QTI_AUDIO_SERVER_ENABLED],[test x$BOARD_SUPPORTS_QTI_AUDIO_SERVER = xtrue])
AM_CONDITIONAL([QAHW_SUPPORT], [test x$BOARD_SUPPORTS_QAHW = xtrue])
AM_CONDITIONAL([HDMI_EDID],    [test x$AUDIO_FEATURE_ENABLED_HDMI_EDID = xtrue])
AM_CONDITIONAL([FM_POWER_OPT], [test x$AUDIO_FEATURE_ENABLED_FM_POWER_OPT = xtrue])
AM_CONDITIONAL([USBAUDIO], [test x$AUDIO_FEATURE_ENABLED_USBAUDIO = xtrue])
AM_CONDITIONAL([HFP], [test x$AUDIO_FEATURE_ENABLED_HFP = xtrue])
AM_CONDITIONAL([SSR], [test x$AUDIO_FEATURE_ENABLED_SSR = xtrue])
AM_CONDITIONAL([MULTI_VOICE_SESSIONS], [test x$AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS = xtrue])
AM_CONDITIONAL([COMPRESS_VOIP], [test x$AUDIO_FEATURE_ENABLED_COMPRESS_VOIP = xtrue])
AM_CONDITIONAL([SPKR_PROTECTION], [test x$AUDIO_FEATURE_ENABLED_SPKR_PROTECTION = xtrue])
AM_CONDITIONAL([HW_VARIANTS], [test x$MULTIPLE_HW_VARIANTS_ENABLED = xtrue])
AM_CONDITIONAL([COMPRESS_CAPTURE], [test x$AUDIO_FEATURE_ENABLED_COMPRESS_CAPTURE = xtrue])
AM_CONDITIONAL([DTS_EAGLE], [test x$AUDIO_FEATURE_ENABLED_DTS_EAGLE = xtrue])
AM_CONDITIONAL([DOLBY_DDP], [test x$DOLBY_DDP = xtrue])
AM_CONDITIONAL([DS1_DOLBY_DAP], [test x$DS1_DOLBY_DAP = xtrue])
AM_CONDITIONAL([DEV_ARBI], [test x$AUDIO_FEATURE_ENABLED_DEV_ARBI = xtrue])
AM_CONDITIONAL([SOURCE_TRACKING], [test x$AUDIO_FEATURE_ENABLED_SOURCE_TRACKING = xtrue])
AM_CONDITIONAL([LISTEN], [test x$AUDIO_FEATURE_ENABLED_LISTEN = xtrue])
AM_CONDITIONAL([SOUND_TRIGGER], [test x$BOARD_SUPPORTS_SOUND_TRIGGER = xtrue])
AM_CONDITIONAL([PM_SUPPORT], [test x$AUDIO_FEATURE_ENABLED_PM_SUPPORT = xtrue])
AM_CONDITIONAL([FLAC_SUPPORT], [test x$AUDIO_FEATURE_ENABLED_EXTN_FLAC_DECODER = xtrue])
AM_CONDITIONAL([ALAC_SUPPORT], [test x$AUDIO_FEATURE_ENABLED_EXTN_ALAC_DECODER = xtrue])
AM_CONDITIONAL([VORBIS_SUPPORT], [test x$AUDIO_FEATURE_ENABLED_EXTN_VORBIS_DECODER = xtrue])
AM_CONDITIONAL([WMA_SUPPORT], [test x$AUDIO_FEATURE_ENABLED_EXTN_WMA_DECODER = xtrue])
AM_CONDITIONAL([COMPRESS_INPUT], [test x$AUDIO_FEATURE_ENABLED_COMPRESS_INPUT = xtrue])
AM_CONDITIONAL([AUDIO_HW_EXTN_API], [test x$BOARD_SUPPORTS_QAHW = xtrue])
AM_CONDITIONAL([AFE_PROXY], [test x$AUDIO_FEATURE_ENABLED_PROXY_DEVICE = xtrue])
AM_CONDITIONAL([HW_ACC_EFFECT], [test x$AUDIO_FEATURE_ENABLED_HW_ACCELERATED_EFFECTS = xtrue])
AM_CONDITIONAL([AUDIOSPHERE], [test x$AUDIO_FEATURE_ENABLED_AUDIOSPHERE = xtrue])
AM_CONDITIONAL([COMPRESS_PASSTHROUGH], [test x$AUDIO_FEATURE_ENABLED_HDMI_PASSTHROUGH = xtrue])
AM_CONDITIONAL([KEEP_ALIVE], [test x$AUDIO_FEATURE_ENABLED_KEEP_ALIVE = xtrue])
AM_CONDITIONAL([GEF], [test x$AUDIO_FEATURE_ENABLED_GEF_SUPPORT = xtrue])
AM_CONDITIONAL([APTX_DECODER], [test x$AUDIO_FEATURE_ENABLED_APTX_DECODER = xtrue])
AM_CONDITIONAL([ADSP_HDLR], [test x$AUDIO_FEATURE_ADSP_HDLR_ENABLED = xtrue])
AM_CONDITIONAL([AUDIO_IP_HDLR], [test x$AUDIO_FEATURE_IP_HDLR_ENABLED = xtrue])
AM_CONDITIONAL([SPLIT_A2DP], [test x$AUDIO_FEATURE_ENABLED_SPLIT_A2DP = xtrue])
AM_CONDITIONAL([QAF_SUPPORT], [test x$AUDIO_FEATURE_ENABLED_QAF = xtrue])
AM_CONDITIONAL([AUDIO_HW_LOOPBACK], [test x$AUDIO_FEATURE_ENABLED_AUDIO_HW_LOOPBACK = xtrue])
AM_CONDITIONAL([AUDIO_PARSER], [test x$AUDIO_FEATURE_ENABLED_PARSER = xtrue])
AM_CONDITIONAL([DTSHD_PARSER], [test x$AUDIO_FEATURE_ENABLED_DTSHD_PARSER = xtrue])
AM_CONDITIONAL([QAP], [test x$AUDIO_FEATURE_ENABLED_QAP = xtrue])
AM_CONDITIONAL([AUDIO_HW_FFV], [test x$AUDIO_FEATURE_ENABLED_FFV = xtrue])
AM_CONDITIONAL([CUSTOM_STEREO], [test x$AUDIO_FEATURE_ENABLED_CUSTOM_STEREO = xtrue])
AM_CONDITIONAL([RUN_KEEP_ALIVE_IN_ARM_FFV], [test x$AUDIO_FEATURE_ENABLED_KEEP_ALIVE_ARM_FFV = xtrue])
AM_CONDITIONAL([INSTANCE_ID], [test x$AUDIO_FEATURE_ENABLED_INSTANCE_ID = xtrue])
AM_CONDITIONAL([LL_AS_PRIMARY_OUTPUT], [test x$AUDIO_USE_LL_AS_PRIMARY_OUTPUT = xtrue])
AM_CONDITIONAL([QAHW_V1], [test x$AUDIO_FEATURE_ENABLED_QAHW_1_0 = xtrue])
AM_CONDITIONAL([DISABLE_COMPRESS_FORMAT], [test x$AUDIO_FEATURE_DISABLE_COMPRESS_FORMAT = xtrue])

AC_CONFIG_FILES([ \
        Makefile \
        hal/Makefile \
        hal/audio_extn/Makefile \
        post_proc/Makefile \
        qahw_api/Makefile \
        qahw_api/test/Makefile \
        hdmi_in_test/Makefile
        ])

AC_OUTPUT
