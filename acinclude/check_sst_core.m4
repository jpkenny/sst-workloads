
AC_DEFUN([CHECK_SST_CORE], [

AC_ARG_WITH([sst-core],
    AS_HELP_STRING([--with-sst-core@<:@=DIR@:>@],
        [Build shared library compatible with integrated SST core (optional).]
    ), [
      SST="$withval"
      have_integrated_core="yes"
    ], [
      have_integrated_core="no"
    ]
)

if test "X$have_integrated_core" = "Xyes"; then
#  AC_CONFIG_FILES([bin/pysstmac], [chmod +x bin/pysstmac])
#  AC_CONFIG_FILES([bin/sstmac-check], [chmod +x bin/sstmac-check])
#  AC_CONFIG_FILES([tests/api/mpi/testexec], [chmod +x tests/api/mpi/testexec])
#  AC_CONFIG_FILES([tests/api/globals/testexec], [chmod +x tests/api/globals/testexec])
  AC_SUBST([sst_prefix], "$SST")
  SST_INCLUDES="-I$SST/include -I$SST/include/sst -I$SST/include/sst/core"
  SST_CPPFLAGS="-DSSTMAC_INTEGRATED_SST_CORE=1 $SST_INCLUDES -D__STDC_FORMAT_MACROS"
  SAVE_CPPFLAGS="$CPPFLAGS"
  SST_CPPFLAGS="$SST_CPPFLAGS"
  CPPFLAGS="$CPPFLAGS $SST_CPPFLAGS"

  SST_LDFLAGS=""

  # We have to use CXXFLAGS from sst-config script
  SAVE_CXXFLAGS="$CXXFLAGS"
  SST_CXXFLAGS="`$SST/bin/sst-config --CXXFLAGS`"
  CXXFLAGS="$CXXFLAGS $SST_CXXFLAGS"

  AC_CHECK_HEADERS([sst/core/component.h], [],
      [AC_MSG_ERROR([Could not locate SST core header files at $SST])])

  AC_SUBST(SST_CPPFLAGS)
  CPPFLAGS="$SAVE_CPPFLAGS"
  SST_CXXFLAGS=`echo "$SST_CXXFLAGS" | sed s/-std=c++11//g | sed s/-std=c++14//g | sed s/-std=c++1y//g | sed s/-std=c++1z//g`
  AC_SUBST(SST_CXXFLAGS)
  AC_SUBST(SST_LDFLAGS)
  CXXFLAGS="$SAVE_CXXFLAGS"
else
  AC_MSG_ERROR([--with-sst-core required])
fi

])

