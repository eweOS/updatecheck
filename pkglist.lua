function replacer(a, b)
	return function(s)
		return string.gsub(s, a, b);
	end
end

function gnomeStable(v)
	return v[2] % 2 == 0;
end

local vPrefixedTarGz = "v(%d+[%.%d]+).tar.gz";
local tarGz = "/(%d+[%.%d]+).tar.gz";

pkgs["abseil-cpp"] = {
	url	= "https://github.com/abseil/abseil-cpp/tags",
	regex	= "(%d%d%d%d%d%d%d%d%.%d).tar.gz",
};

pkgs["acl"] = {
	url	= "https://download.savannah.gnu.org/releases/acl/",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["adwaita-icon-theme"] = {
	url	= "https://gitlab.gnome.org/GNOME/adwaita-icon-theme/-/tags",
	regex	= "(%d+%.%d+).tar.gz",
};


pkgs["alsa-lib"] = {
	url	= "https://www.alsa-project.org/files/pub/lib/",
	regex	= "alsa-lib-(%d+%.%d+%.%d+).tar.bz2",
};

pkgs["alsa-utils"] = {
	url	= "https://www.alsa-project.org/wiki/Main_Page",
	regex	= "alsa-utils-(%d+%.%d+%.%d+).tar.bz2",
};

pkgs["aml"] = {
	url	= "https://github.com/any1/aml/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["arch-install-scripts"] = {
	url	= "https://github.com/archlinux/arch-install-scripts/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["aria2"] = {
	url	= "https://github.com/aria2/aria2/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["angband"] = {
	url	= "https://rephial.org/",
	regex	= "version ([.%d]+),",
};

pkgs["appstream"] = {
	url	= "https://www.freedesktop.org/software/appstream/releases/",
	regex	= "AppStream-([.%d]+).tar.xz",
};

pkgs["appstream-glib"] = {
	url	= "https://people.freedesktop.org/~hughsient/appstream-glib/releases/",
	regex	= "appstream-glib-(%d+%.%d+%.%d+).tar.xz",
};

pkgs["aquamarine"] = {
	url	= "https://github.com/hyprwm/aquamarine/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["avrdude"] = {
	url	= "https://github.com/avrdudes/avrdude/tags",
	regex	= "v(%d+%.%d+).tar.gz",
};

pkgs["asciidoc"] = {
	url	= "https://github.com/asciidoc-py/asciidoc-py/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["aspell"] = {
	url	= "https://github.com/GNUAspell/aspell/tags",
	regex	= "rel-([-.%d]+).tar.gz",
};

pkgs["astyle"] = {
	url	= "https://sourceforge.net/projects/astyle/files/",
	regex	= "astyle-(%d%.[%.%d]+)-x64.zip",
};

pkgs["at-spi2-core"] = {
	url	= "https://gitlab.gnome.org/GNOME/at-spi2-core/-/tags",
	regex	= "AT_SPI2_CORE_([_%d]+)",
	postMatch = replacer('_', '.'),
};

pkgs["atkmm"] = {
	url	= "https://gitlab.gnome.org/GNOME/atkmm/-/tags",
	regex	= "atkmm-(%d+%.%d+%.%d+).tar.gz",
	filter	= gnomeStable,
};

pkgs["atkmm-gtk3"] = {
	url	= "https://gitlab.gnome.org/GNOME/atkmm/-/tags",
	regex	= "(2.28.%d+).tar.gz",
};

pkgs["atool"] = {
	url	= "http://download.savannah.gnu.org/releases/atool/",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["attr"] = {
	url	= "http://download.savannah.gnu.org/releases/attr/",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["autoconf"] = {
	url	= "http://ftp.gnu.org/gnu/autoconf",
	regex	= "(%d+%.%d+).tar.gz",
};

pkgs["autoconf-archive"] = {
	url	= "https://ftp.gnu.org/gnu/autoconf-archive",
	regex	= "(%d+%.%d+%.%d+).tar.xz",
};

pkgs["automake"] = {
	url	= "https://ftp.gnu.org/gnu/automake",
	regex	= "(%d+[%.%d]+).tar.gz",
};

pkgs["axel"] = {
	url	= "https://github.com/axel-download-accelerator/axel/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["base16384"] = {
	url	= "https://github.com/fumiama/base16384/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["bash"] = {
	url	= "https://ftp.gnu.org/gnu/bash",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["bash-completion"] = {
	url	= "https://github.com/scop/bash-completion/tags",
	regex	= "([.%d]+).tar.gz",
};

pkgs["basu"] = {
	url	= "https://git.sr.ht/~emersion/basu/refs",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["benchmark"] = {
	url	= "https://github.com/google/benchmark/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["bird"] = {
	url	= "http://bird.network.cz/download",
	regex	= "bird-([%.%d]+).tar.gz",
};

pkgs["bison"] = {
	url	= "http://ftp.gnu.org/gnu/bison",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["blueprint-compiler"] = {
	url	= "https://gitlab.gnome.org/jwestman/blueprint-compiler/-/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["boost"] = {
	url	= "https://boostorg.jfrog.io/artifactory/main/release/",
	regex	= "(%d+%.%d+%.%d+)/",
};

pkgs["bottom"] = {
	url	= "https://github.com/ClementTsang/bottom/tags",
	regex	= "([.%d]+).tar.gz",
};

pkgs["brotli"] = {
	url	= "https://github.com/google/brotli/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["btop"] = {
	url	= "https://github.com/aristocratos/btop/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["btrfs-progs"] = {
	url	= "https://mirrors.edge.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/",
	regex	= "btrfs-progs-v(%d+%.[%.%d]+).tar.gz",
};

pkgs["bubblewrap"] = {
	url	= "https://github.com/containers/bubblewrap/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["busybox"] = {
	url	= "https://www.busybox.net/downloads",
	regex	= "busybox-(%d+%.%d+%.%d+).tar.bz2",
};

pkgs["c-ares"] = {
	url	= "https://github.com/c-ares/c-ares/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["caddy"] = {
	url	= "https://github.com/caddyserver/caddy/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["cage"] = {
	url	= "https://github.com/Hjdskes/cage/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["cairo"] = {
	url	= "https://gitlab.freedesktop.org/cairo/cairo/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["cairomm"] = {
	url	= "https://gitlab.freedesktop.org/cairo/cairomm/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["capstone"] = {
	url	= "https://github.com/capstone-engine/capstone/tags",
	regex	= "/(%d+%.%d%.%d+).tar.gz",
};

pkgs["catnest"] = {
	url	= "https://github.com/eweOS/catnest/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["cbindgen"] = {
	url	= "https://github.com/eqrion/cbindgen/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["cfiles"] = {
	url	= "https://github.com/mananapr/cfiles/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["check"] = {
	url	= "https://github.com/libcheck/check/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["chrpath"] = {
	url	= "http://ftp.debian.org/debian/pool/main/c/chrpath/",
	regex	= "chrpath_([.%d]+).orig.tar.gz",
};

pkgs["cmake"] = {
	url	= "https://github.com/Kitware/CMake/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["cmark"] = {
	url	= "https://github.com/commonmark/cmark/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["cmatrix"] = {
	url	= "https://github.com/abishekvashok/cmatrix/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["cmocka"] = {
	url	= "https://git.cryptomilk.org/projects/cmocka.git/",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["composefs"] = {
	url	= "https://github.com/containers/composefs/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["connman"] = {
	url	= "https://mirrors.edge.kernel.org/pub/linux/network/connman/",
	regex	= "(%d+%.%d+).tar.gz",
};

pkgs["cppunit"] = {
	url	= "https://dev-www.libreoffice.org/src/",
	regex	= "cppunit-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["cracklib"] = {
	url	= "https://github.com/cracklib/cracklib/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["cronie"] = {
	url	= "https://github.com/cronie-crond/cronie/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["ctags"] = {
	url	= "https://github.com/universal-ctags/ctags/tags",
	regex	= "p(%d+%.%d+%.%d%d%d%d%d%d%d%d%.%d+).tar.gz",
};

pkgs["cups"] = {
	url	= "https://github.com/OpenPrinting/cups/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["cups-filters"] = {
	url	= "https://github.com/OpenPrinting/cups-filters/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["curl"] = {
	url	= "https://curl.haxx.se/download/",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["cyrus-sasl"] = {
	url	= "https://github.com/cyrusimap/cyrus-sasl/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["cython"] = {
	url	= "https://github.com/cython/cython/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["d-spy"] = {
	url	= "https://gitlab.gnome.org/GNOME/d-spy/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["dash"] = {
	url	= "https://git.kernel.org/pub/scm/utils/dash/dash.git/refs",
	regex	= "dash-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["dav1d"] = {
	url	= "https://downloads.videolan.org/pub/videolan/dav1d",
	regex	= "(%d+%.%d+%.%d+)/",
};

pkgs["dconf"] = {
	url	= "https://gitlab.gnome.org/GNOME/dconf/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["dconf-editor"] = {
	url	= "https://gitlab.gnome.org/GNOME/dconf-editor/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["dbus"] = {
	url	= "https://gitlab.freedesktop.org/dbus/dbus/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["desktop-file-utils"] = {
	url	= "https://www.freedesktop.org/software/desktop-file-utils/releases/",
	regex	= "desktop-file-utils-(%d+%.%d+).tar.xz",
};

pkgs["diffutils"] = {
	url	= "https://ftp.gnu.org/gnu/diffutils/",
	regex	= "diffutils-(%d+%.%d+).tar.xz",
};

pkgs["dinit"] = {
	url	= "https://github.com/davmac314/dinit/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["dmidecode"] = {
	url	= "https://sources.archlinux.org/other/dmidecode/",
	regex	= "dmidecode-(%d+%.%d+).tar.xz",
};

pkgs["doctest"] = {
	url	= "https://github.com/onqtam/doctest/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["dosfstools"] = {
	url	= "https://github.com/dosfstools/dosfstools/tags",
	regex	= "v(%d+%.[%.%d]+).tar.gz",
};

pkgs["dropbear"] = {
	url	= "https://github.com/mkj/dropbear/tags",
	regex	= "DROPBEAR_(%d%d%d%d.%d+).tar.gz",
};

pkgs["dtc"] = {
	url	= "https://git.kernel.org/pub/scm/utils/dtc/dtc.git/",
	regex	= "dtc-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["duktape"] = {
	url	= "https://duktape.org/download",
	regex	= "duktape-(%d+.%d+.%d+).tar.xz",
};

pkgs["e2fsprogs"] = {
	url	= "https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/refs/",
	regex	= "e2fsprogs-([.%d]+).tar.gz",
};

pkgs["efibootmgr"] = {
	url	= "https://github.com/rhboot/efibootmgr/tags",
	regex	= "([.%d]+).tar.gz",
};

pkgs["efivar"] = {
	url	= "https://github.com/rhboot/efivar/tags",
	regex	= "([.%d]+).tar.gz",
};

pkgs["ewe_pkgtool"] = {
	url	= "https://github.com/eweOS/ewe-pkgtool/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["eww"] = {
	url	= "https://github.com/elkowar/eww/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["expat"] = {
	url	= "https://github.com/libexpat/libexpat/tags",
	regex	= "R_([_%d]+).tar.gz",
	postMatch = replacer('_', '.'),
};

pkgs["extra-cmake-modules"] = {
	url	= "https://download.kde.org/stable/frameworks/",
	regex	= "(%d+%.%d+)/",
};

pkgs["fake-alpine-release"] = {
	url	= "https://git.alpinelinux.org/aports/plain/main/alpine-base/APKBUILD",
	regex	= "pkgver=([.%d]+)",
};

pkgs["fakeroot"] = {
	url	= "http://ftp.debian.org/debian/pool/main/f/fakeroot/",
	regex	= "fakeroot_([.%d]+).orig.tar.gz",
};

pkgs["fast_float"] = {
	url	= "https://github.com/fastfloat/fast_float/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["fastfetch"] = {
	url	= "https://github.com/fastfetch-cli/fastfetch/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["fcft"] = {
	url	= "https://codeberg.org/dnkl/fcft/tags",
	regex	= "([.%d]+).tar.gz",
};

pkgs["fcgi"] = {
	url	= "https://github.com/FastCGI-Archives/fcgi2/tags",
	regex	= "([.%d]+).tar.gz",
};

pkgs["fcgiwrap"] = {
	url	= "https://github.com/gnosek/fcgiwrap/tags",
	regex	= "([.%d]+).tar.gz",
};

pkgs["fcitx5"] = {
	url	= "https://github.com/fcitx/fcitx5/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
}

pkgs["fcitx5-anthy"] = {
	url	= "https://github.com/fcitx/fcitx5-anthy/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["fcitx5-chinese-addons"] = {
	url	= "https://github.com/fcitx/fcitx5-chinese-addons/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["fcitx5-configtool"] = {
	url	= "https://github.com/fcitx/fcitx5-configtool/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["fcitx5-gtk"] = {
	url	= "https://github.com/fcitx/fcitx5-gtk/tags",
	regex	= "/(5%.%d+%.%d+).tar.gz",
};

pkgs["fcitx5-lua"] = {
	url	= "https://github.com/fcitx/fcitx5-lua/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["fcitx5-qt"] = {
	url	= "https://github.com/fcitx/fcitx5-qt/tags",
	regex	= "/(5%.%d+%.%d+).tar.gz",
};

pkgs["featherpad"] = {
	url	= "https://github.com/tsujan/FeatherPad/tags",
	regex	= "V(%d+%.%d+%.%d+).tar.gz",
};

pkgs["ffmpeg"] = {
	url	= "https://github.com/FFmpeg/FFmpeg/tags",
	regex	= "n([.%d]+).tar.gz",
};

pkgs["file"] = {
	url	= "https://astron.com/pub/file/",
	regex	= "(%d+%.%d+).tar.gz",
};

pkgs["fim"] = {
	url	= "https://www.nongnu.org/fbi-improved/",
	regex	= "fim-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["firefox"] = {
	url	= "https://archive.mozilla.org/pub/firefox/releases/",
	regex	= "/([.%d]+)/",
};

pkgs["flac"] = {
	url	= "https://github.com/xiph/flac/releases",
	regex	= "flac-([.%d]+).tar.xz",
};

pkgs["flatpak"] = {
	url	= "https://github.com/flatpak/flatpak/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["flatpak-xdg-utils"] = {
	url	= "https://github.com/flatpak/flatpak-xdg-utils/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["flex"] = {
	url	= "https://github.com/westes/flex/releases",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["fmt"] = {
	url	= "https://github.com/fmtlib/fmt/tags",
	regex	= "([.%d]+).tar.gz",
};

pkgs["fontconfig"] = {
	url	= "https://gitlab.freedesktop.org/fontconfig/fontconfig/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["ttf-font-awesome"] = {
	url	= "https://github.com/FortAwesome/Font-Awesome/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["foot"] = {
	url	= "https://codeberg.org/dnkl/foot/tags",
	regex	= "([.%d]+).tar.gz",
};

pkgs["freeimage"] = {
	url	= "https://freeimage.sourceforge.io/download.html",
	regex	= "FreeImage(%d%d%d%d).zip",
	postMatch = function(s) return s:sub(1, 1) .. "." ..
				       s:sub(2, 3) .. "." ..
				       s:sub(4, 4); end,
};

pkgs["freetype2"] = {
	url	= "https://download.savannah.gnu.org/releases/freetype/",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["fribidi"] = {
	url	= "https://github.com/fribidi/fribidi/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["fswatch"] = {
	url	= "https://github.com/emcrisostomo/fswatch/tags",
	regex	= "([.%d]+).tar.gz",
};

pkgs["fuse3"] = {
	url	= "https://github.com/libfuse/libfuse/tags",
	regex	= "fuse-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["fzf"] = {
	url	= "https://github.com/junegunn/fzf/tags",
	regex	= "([.%d]+).tar.gz",
};

pkgs["fzpac"] = {
	url	= "https://github.com/sheepla/fzpac/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["gc"] = {
	url	= "https://github.com/ivmai/bdwgc/releases",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["gcompat"] = {
	url	= "https://git.adelielinux.org/adelie/gcompat/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["gdbm"] = {
	url	= "https://ftp.gnu.org/gnu/gdbm",
	regex	= "(%d+%.[%.%d]+).tar.gz",
};

pkgs["gdk-pixbuf"] = {
	url	= "https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["gettext"] = {
	url	= "https://ftp.gnu.org/gnu/gettext/",
	regex	= "gettext-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["gettext-tiny"] = {
	url	= "https://github.com/sabotage-linux/gettext-tiny/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["gflags"] = {
	url	= "https://github.com/schuhschuh/gflags/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["ghostscript"] = {
	url	= "https://github.com/ArtifexSoftware/ghostpdl-downloads/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["giflib"] = {
	url	= "https://sourceforge.net/projects/giflib/files/",
	regex	= "giflib-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["git"] = {
	url	= "https://www.kernel.org/pub/software/scm/git",
	regex	= "git-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["glad"] = {
	url	= "https://github.com/Dav1dde/glad/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["glade"] = {
	url	= "https://gitlab.gnome.org/GNOME/glade/-/tags",
	regex	= "GLADE_(%d+_%d+_%d+).tar.gz",
	postMatch = replacer('_', '.'),
};

pkgs["glfw"] = {
	url	= "https://github.com/glfw/glfw/tags",
	regex	= "/(%d+%.[%.%d]+).tar.gz",
};

pkgs["glib"] = {
	url	= "https://gitlab.gnome.org/GNOME/glib/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["glibmm"] = {
	url	= "https://gitlab.gnome.org/GNOME/glibmm/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["glibmm-gtk3"] = {
	url	= "https://gitlab.gnome.org/GNOME/glibmm/-/tags",
	regex	= "(2.66.%d+).tar.gz",
};

pkgs["glm"] = {
	url	= "https://github.com/g-truc/glm/tags",
	regex	= "([.%w]+).tar.gz",
};

pkgs["glslang"] = {
	url	= "https://github.com/KhronosGroup/glslang/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["glu"] = {
	url	= "https://gitlab.freedesktop.org/mesa/glu/-/tags",
	regex	= "glu-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["gmp"] = {
	url	= "https://gmplib.org/download/gmp/",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["gnupg"] = {
	url	= "https://gnupg.org/ftp/gcrypt/gnupg",
	regex	= "gnupg-(%d+%.%d+%.%d+).tar.bz2",
};

pkgs["go"] = {
	url	= "https://go.dev/dl/",
	regex	= "go([.%d]+).src.tar.gz",
};

pkgs["gobject-introspection"] = {
	url	= "https://gitlab.gnome.org/GNOME/gobject-introspection/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["googletest"] = {
	url	= "https://github.com/google/googletest/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["gparted"] = {
	url	= "https://gparted.org/download.php",
	regex	= "gparted-live-(%d+%.%d+%.%d+)-",
};

pkgs["gperf"] = {
	url	= "https://ftp.gnu.org/gnu/gperf",
	regex	= "(%d+%.[%.%d]+).tar.gz",
};

pkgs["gpgme"] = {
	url	= "https://www.gnupg.org/ftp/gcrypt/gpgme/",
	regex	= "gpgme-(%d+%.%d+%.%d+).tar.bz2",
};

pkgs["graphene"] = {
	url	= "https://github.com/ebassi/graphene/tags",
	regex	= "([.%d]+).tar.gz",
};

pkgs["graphviz"] = {
	url	= "https://gitlab.com/graphviz/graphviz/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["greetd"] = {
	url	= "https://git.sr.ht/~kennylevinsen/greetd/refs",
	regex	= "([.%d]+).tar.gz",
};

pkgs["greetd-gtk"] = {
	url	= "https://git.sr.ht/~kennylevinsen/gtkgreet/refs",
	regex	= "([.%d]+).tar.gz",
};

pkgs["greetd-regreet"] = {
	url	= "https://github.com/rharish101/ReGreet/tags",
	regex	= "([.%d]+).tar.gz",
};

pkgs["greetd-tui"] = {
	url	= "https://github.com/apognu/tuigreet/tags",
	regex	= "([.%d]+).tar.gz",
};

pkgs["grim"] = {
	url	= "https://git.sr.ht/~emersion/grim/refs",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["groff"] = {
	url	= "https://ftp.gnu.org/gnu/groff/",
	regex	= "groff-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["gsettings-desktop-schemas"] = {
	url	= "https://gitlab.gnome.org/GNOME/gsettings-desktop-schemas/-/tags",
	regex	= "(%d+%.%d+).tar.gz",
};

pkgs["gsm"] = {
	url	= "https://www.quut.com/gsm/",
	regex	= "gsm-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["gtk-layer-shell"] = {
	url	= "https://github.com/wmww/gtk-layer-shell/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["gtk-session-lock"] = {
	url	= "https://github.com/Cu3PO42/gtk-session-lock/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["gtk3"] = {
	url	= "https://gitlab.gnome.org/GNOME/gtk/-/tags",
	regex	= "gtk-(3.[.%d]+).tar.gz",
};

pkgs["gtkmm3"] = {
	url	= "https://gitlab.gnome.org/GNOME/gtkmm/-/tags",
	regex	= "(3%.%d+%.%d+)",
};

pkgs["gtk4"] = {
	url	= "https://gitlab.gnome.org/GNOME/gtk/-/tags",
	regex	= "gtk-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["gtk4-layer-shell"] = {
	url	= "https://github.com/wmww/gtk4-layer-shell/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["gtklock"] = {
	url	= "https://github.com/jovanlanik/gtklock/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["gtksourceview5"] = {
	url	= "https://gitlab.gnome.org/GNOME/gtksourceview/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
	filter	= gnomeStable,
};

pkgs["harfbuzz"] = {
	url	= "https://github.com/harfbuzz/harfbuzz/tags",
	regex	= "([.%d]+).tar.gz",
};

pkgs["havoc"] = {
	url	= "https://github.com/ii8/havoc/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["help2man"] = {
	url	= "https://ftp.gnu.org/gnu/help2man",
	regex	= "(%d+%.%d+%.%d+).tar.xz",
};

pkgs["helvum"] = {
	url	= "https://gitlab.freedesktop.org/pipewire/helvum/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["hicolor-icon-theme"] = {
	url	= "https://icon-theme.freedesktop.org/releases/",
	regex	= "hicolor-icon-theme-(%d+%.%d+).tar.xz",
};

pkgs["htop"] = {
	url	= "https://github.com/htop-dev/htop/tags",
	regex	= "([.%d]+).tar.gz",
};

pkgs["http-parser"] = {
	url	= "https://github.com/nodejs/http-parser/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["hunspell"] = {
	url	= "https://github.com/hunspell/hunspell/tags",
	regex	= "v(%d+%.%d%.%d+).tar.gz",
};

pkgs["hwdata"] = {
	url	= "https://github.com/vcrhonek/hwdata/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["hwloc"] = {
	url	= "https://github.com/open-mpi/hwloc/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["hyfetch"] = {
	url	= "https://github.com/hykilpikonna/hyfetch/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["hyprcursor"] = {
	url	= "https://github.com/hyprwm/hyprcursor/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["hyprland"] = {
	url	= "https://github.com/hyprwm/Hyprland/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["hyprlang"] = {
	url	= "https://github.com/hyprwm/hyprlang/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["hyprpicker"] = {
	url	= "https://github.com/hyprwm/hyprpicker/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["hyprutils"] = {
	url	= "https://github.com/hyprwm/hyprutils/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["hyprwayland-scanner"] = {
	url	= "https://github.com/hyprwm/hyprwayland-scanner/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["icu"] = {
	url	= "https://github.com/unicode-org/icu/releases/latest",
	regex	= "release-([-%d]+)",
	postMatch = replacer('-', '.'),
};

pkgs["ifupdown-ng"] = {
	url	= "https://github.com/ifupdown-ng/ifupdown-ng/tags",
	regex	= "ifupdown-ng-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["imath"] = {
	url	= "https://github.com/AcademySoftwareFoundation/Imath/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["inotify-tools"] = {
	url	= "https://github.com/inotify-tools/inotify-tools/tags",
	regex	= "/(%d+.%d+%.%d+%.%d+).tar.gz",
};

pkgs["intltool"] = {
	url	= "https://launchpad.net/intltool",
	regex	= "intltool-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["iperf3"] = {
	url	= "https://github.com/esnet/iperf/tags",
	regex	= "/([.%d]+).tar.gz",
};

pkgs["iso-codes"] = {
	url	= "https://salsa.debian.org/iso-codes-team/iso-codes/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["itstool"] = {
	url	= "https://github.com/itstool/itstool/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["jansson"] = {
	url	= "https://github.com/akheron/jansson/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["jbig2dec"] = {
	url	= "https://github.com/ArtifexSoftware/jbig2dec/tags",
	regex	= "/(%d+%.%d+).tar.gz",
};

pkgs["jq"] = {
	url	= "https://github.com/stedolan/jq/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["json-c"] = {
	url	= "https://github.com/json-c/json-c/tags",
	regex	= "json-c-([%.%d]+)-%d+.tar.gz",
};

pkgs["json-glib"] = {
	url	= "https://gitlab.gnome.org/GNOME/json-glib/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["jsoncpp"] = {
	url	= "https://github.com/open-source-parsers/jsoncpp/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["jxrlib"] = {
	url	= "https://github.com/glencoesoftware/jxrlib/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["keyutils"] = {
	url	= "https://people.redhat.com/~dhowells/keyutils/",
	regex	= "(%d+%.%d+%.%d+).tar.bz2",
};

pkgs["kirc"] = {
	url	= "https://github.com/mcpcpc/kirc/tags",
	regex	= "([.%d]+).tar.gz",
};

pkgs["krb5"] = {
	url	= "https://web.mit.edu/kerberos/dist/",
	regex	= "krb5-(%d+%.[%.%d]+).tar.gz",
};

pkgs["lame"] = {
	url	= "https://sourceforge.net/projects/lame/files/lame/",
	regex	= "lame-(%d+%.%d+).tar.gz",
};

pkgs["lazygit"] = {
	url	= "https://github.com/jesseduffield/lazygit/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["lcms2"] = {
	url	= "https://github.com/mm2/Little-CMS/tags",
	regex	= "lcms([.%d]+).tar.gz",
};

pkgs["lddtree"] = {
	url	= "https://github.com/ncopa/lddtree/tags",
	regex	= "v(%d+%.%d+).tar.gz",
};

pkgs["libadwaita"] = {
	url	= "https://gitlab.gnome.org/GNOME/libadwaita/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libaio"] = {
	url	= "https://pagure.io/libaio/releases",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libaom"] = {
	url	= "https://storage.googleapis.com/aom-releases/",
	regex	= "libaom-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libarchive"] = {
	url	= "https://github.com/libarchive/libarchive/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["libass"] = {
	url	= "https://github.com/libass/libass/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libassuan"] = {
	url	= "https://gnupg.org/ftp/gcrypt/libassuan",
	regex	= "(%d+%.%d+%.%d+).tar.bz2",
};

pkgs["libbpf"] = {
	url	= "https://github.com/libbpf/libbpf/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libbsd"] = {
	url	= "https://libbsd.freedesktop.org/releases",
	regex	= "libbsd-(%d+%.%d+%.%d+).tar.xz",
};

pkgs["libburn"] = {
	url	= "https://files.libburnia-project.org/releases",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libbz2"] = {
	url	= "https://gitlab.com/bzip2/bzip2/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libcap"] = {
	url	= "https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/",
	regex	= "(%d+%.%d+).tar.gz",
};

pkgs["libclc"] = {
	url	= "https://github.com/llvm/llvm-project/tags",
	regex	= "llvmorg-([.%d]+).tar.gz",
};

pkgs["libcrc32c"] = {
	url	= "https://github.com/google/crc32c/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libcrossguid"] = {
	url	= "https://github.com/graeme-hill/crossguid/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["libcue"] = {
	url	= "https://github.com/lipnitsk/libcue/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["libcupsfilters"] = {
	url	= "https://github.com/OpenPrinting/libcupsfilters/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libdaemon"] = {
	url	= "https://dev.alpinelinux.org/archive/libdaemon",
	regex	= "(%d+%.%d+).tar.gz",
};

pkgs["libdecor"] = {
	url	= "https://gitlab.freedesktop.org/libdecor/libdecor/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libdeflate"] = {
	url	= "https://github.com/ebiggers/libdeflate/tags",
	regex	= "v(%d+%.%d+).tar.gz",
};

pkgs["libdispatch"] = {
	url	= "https://github.com/apple/swift-corelibs-libdispatch/releases",
	regex	= "Swift (%d+%.%d+) Release",
};

pkgs["libdisplay-info"] = {
	url	= "https://gitlab.freedesktop.org/emersion/libdisplay-info/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libdrm"] = {
	url	= "https://dri.freedesktop.org/libdrm/",
	regex	= "(%d+%.%d+%.%d+).tar.xz",
};

pkgs["libedit"] = {
	url	= "https://thrysoee.dk/editline/",
	regex	= "(%d%d%d%d%d%d%d%d-%d+%.%d+).tar.gz",
	postMatch = replacer('-', '_'),
};

pkgs["libei"] = {
	url	= "https://gitlab.freedesktop.org/libinput/libei/-/tags",
	regex	= "libei-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libelf"] = {
	url	= "https://sourceware.org/elfutils/ftp/",
	regex	= "([.%d]+)/",
};

pkgs["libepoxy"] = {
	url	= "https://github.com/anholt/libepoxy/tags",
	regex	= "([.%d]+).tar.gz",
};

pkgs["libevdev"] = {
	url	= "https://freedesktop.org/software/libevdev/",
	regex	= "libevdev-(%d+%.%d+%.%d+).tar.xz",
};

pkgs["libevent"] = {
	url	= "https://github.com/libevent/libevent/tags",
	regex	= "release-([.%d]+)-stable.tar.gz",
};

pkgs["libexif"] = {
	url	= "https://github.com/libexif/libexif/tags",
	regex	= "libexif-([_%d]+)-release",
	postMatch = replacer('_', '.'),
};

pkgs["libffi"] = {
	url	= "https://sourceware.org/pub/libffi/",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libgcrypt"] = {
	url	= "https://gnupg.org/ftp/gcrypt/libgcrypt/",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libgit2"] = {
	url	= "https://github.com/libgit2/libgit2/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["libglvnd"] = {
	url	= "https://gitlab.freedesktop.org/glvnd/libglvnd/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libgpg-error"] = {
	url	= "https://www.gnupg.org/ftp/gcrypt/libgpg-error",
	regex	= "(%d+%.%d+).tar.gz",
};

pkgs["libhandy"] = {
	url	= "https://gitlab.gnome.org/GNOME/libhandy/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libhidapi"] = {
	url	= "https://github.com/libusb/hidapi/tags",
	regex	= "hidapi-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libidn"] = {
	url	= "https://ftp.gnu.org/gnu/libidn/",
	regex	= "libidn-(1.[.%d]+).tar.gz",
};

pkgs["libidn2"] = {
	url	= "https://ftp.gnu.org/gnu/libidn/",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libime"] = {
	url	= "https://github.com/fcitx/libime/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libinih"] = {
	url	= "https://github.com/benhoyt/inih/tags",
	regex	= "r(%d+).tar.gz",
};

pkgs["libinput"] = {
	url	= "https://gitlab.freedesktop.org/libinput/libinput/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libisoburn"] = {
	url	= "https://files.libburnia-project.org/releases",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libisofs"] = {
	url	= "https://files.libburnia-project.org/releases",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libjpeg"] = {
	url	= "https://github.com/libjpeg-turbo/libjpeg-turbo/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libksba"] = {
	url	= "https://www.gnupg.org/ftp/gcrypt/libksba/",
	regex	= "(%d+%.%d+%.%d+).tar.bz2",
};

pkgs["libliftoff"] = {
	url	= "https://gitlab.freedesktop.org/emersion/libliftoff/-/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libltdl"] = {
	url	= "https://ftp.gnu.org/gnu/libtool/",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libmarisa"] = {
	url	= "https://github.com/s-yata/marisa-trie/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libmd"] = {
	url	= "https://libbsd.freedesktop.org/releases/",
	regex	= "libmd-(%d+%.%d+%.%d+).tar.xz",
};

pkgs["libmnl"] = {
	url	= "https://www.netfilter.org/projects/libmnl/files/",
	regex	= "libmnl-(%d+%.%d+%.%d+).tar.bz2",
};

pkgs["libmicrohttpd"] = {
	url	= "https://ftp.gnu.org/gnu/libmicrohttpd/",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libmpack"] = {
	url	= "https://github.com/libmpack/libmpack/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libnfnetlink"] = {
	url	= "https://www.netfilter.org/projects/libnfnetlink/files/",
	regex	= "libnfnetlink-(%d+%.%d+%.%d+).tar.bz2",
};

pkgs["libnfs"] = {
	url	= "https://github.com/sahlberg/libnfs/tags",
	regex	= "libnfs-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libnftnl"] = {
	url	= "https://netfilter.org/projects/libnftnl/files/",
	regex	= "libnftnl-(%d+%.%d+%.%d+).tar.xz",
};

pkgs["libnghttp2"] = {
	url	= "https://github.com/nghttp2/nghttp2/tags",
	regex	= "v(%d+%.%d+%.%d+)",
};

pkgs["libnl"] = {
	url	= "https://github.com/thom311/libnl/tags",
	regex	= "libnl([_%d]+).tar.gz",
	postMatch = replacer('_', '.'),
};

pkgs["libogg"] = {
	url	= "https://downloads.xiph.org/releases/ogg",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libopus"] = {
	url	= "https://archive.mozilla.org/pub/opus/",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libpaper"] = {
	url	= "https://github.com/rrthomas/libpaper/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libpcap"] = {
	url	= "https://www.tcpdump.org/release",
	regex	= "libpcap-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libpciaccess"] = {
	url	= "https://xorg.freedesktop.org/releases/individual/lib/",
	regex	= "libpciaccess-(%d+%.%d+%.%d+).tar.xz",
};

pkgs["libplacebo"] = {
	url	= "https://code.videolan.org/videolan/libplacebo/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.xz",
};

pkgs["libpng"] = {
	url	= "https://libpng.sourceforge.io/index.html",
	regex	= "libpng-(%d+%.%d+%.%d+)</li>",
};

pkgs["libppd"] = {
	url	= "https://github.com/OpenPrinting/libppd/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libpulse"] = {
	url	= "https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/tags",
	regex	= "PulseAudio% ([.%d]+)",
};

pkgs["libraw"] = {
	url	= "https://www.libraw.org/download",
	regex	= "LibRaw-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libraw1394"] = {
	url	= "https://www.kernel.org/pub/linux/libs/ieee1394",
	regex	= "libraw1394-(%d+%.%d+%.%d+).tar.xz",
};

pkgs["librsvg"] = {
	url	= "https://gitlab.gnome.org/GNOME/librsvg/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libsamplerate"] = {
	url	= "https://github.com/libsndfile/libsamplerate/tags",
	regex	= "([.%d]+).tar.gz",
};

pkgs["libsass"] = {
	url	= "https://github.com/sass/libsass/tags",
	regex	= "([.%d]+).tar.gz",
};

pkgs["libseccomp"] = {
	url	= "https://github.com/seccomp/libseccomp/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libserialport"] = {
	url	= "https://github.com/sigrokproject/libserialport/tags",
	regex	= "libserialport-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libsigc++2"] = {
	url	= "https://github.com/libsigcplusplus/libsigcplusplus/tags",
	regex	= "(2.[.%d]+).tar.gz",
};

pkgs["libsigc++3"] = {
	url	= "https://github.com/libsigcplusplus/libsigcplusplus/tags",
	regex	= "(3.[.%d]+).tar.gz",
};

pkgs["libslirp"] = {
	url	= "https://gitlab.freedesktop.org/slirp/libslirp/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libsndfile"] = {
	url	= "https://github.com/libsndfile/libsndfile/tags",
	regex	= "/([.%d]+).tar.gz",
};

pkgs["libsodium"] = {
	url	= "https://download.libsodium.org/libsodium/releases/",
	regex	= "libsodium-([.%d]+).tar.gz",
};

pkgs["libsrt"] = {
	url	= "https://github.com/Haivision/srt/tags/",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libssh2"] = {
	url	= "https://www.libssh2.org/download/",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libtasn1"] = {
	url	= "https://ftp.gnu.org/gnu/libtasn1/",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libtermkey"] = {
	url	= "http://www.leonerd.org.uk/code/libtermkey/",
	regex	= "(%d+%.[%d+%.]+).tar.gz",
};

pkgs["libtheora"] = {
	url	= "https://github.com/xiph/theora/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libtiff"] = {
	url	= "https://download.osgeo.org/libtiff/",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libtirpc"] = {
	url	= "https://sourceforge.net/projects/libtirpc/files/libtirpc/",
	regex	= "libtirpc/([.%d]+)/",
};

pkgs["libucontext"] = {
	url	= "https://github.com/kaniini/libucontext/tags",
	regex	= "(%d+%.[%.%d]+).tar.gz",
};

pkgs["libudev"] = {
	url	= "https://github.com/illiliti/libudev-zero/tags",
	regex	= "([.%d]+).tar.gz",
};

pkgs["libunistring"] = {
	url	= "https://ftp.gnu.org/gnu/libunistring/",
	regex	= "libunistring-(%d+%.%d+).tar.gz",
};

pkgs["libusb"] = {
	url	= "https://github.com/libusb/libusb/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["libutf8proc"] = {
	url	= "https://github.com/JuliaStrings/utf8proc/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["libuv"] = {
	url	= "https://github.com/libuv/libuv/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libva"] = {
	url	= "https://github.com/intel/libva/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libva-utils"] = {
	url	= "https://github.com/intel/libva-utils/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libverto"] = {
	url	= "https://github.com/latchset/libverto/tags",
	regex	= "([.%d]+).tar.gz",
};

pkgs["libvorbis"] = {
	url	= "http://downloads.xiph.org/releases/vorbis/",
	regex	= "libvorbis-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libvpx"] = {
	url	= "https://github.com/webmproject/libvpx/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libvterm"] = {
	url	= "https://www.leonerd.org.uk/code/libvterm/",
	regex	= "libvterm-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libwebp"] = {
	url	= "https://github.com/webmproject/libwebp/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libxcrypt"] = {
	url	= "https://github.com/besser82/libxcrypt/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["libxkbcommon"] = {
	url	= "https://github.com/xkbcommon/libxkbcommon/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libxml2"] = {
	url	= "https://gitlab.gnome.org/GNOME/libxml2/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libxmlb"] = {
	url	= "https://github.com/hughsie/libxmlb/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libxslt"] = {
	url	= "https://gitlab.gnome.org/GNOME/libxslt/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libyaml"] = {
	url	= "https://pyyaml.org/download/libyaml/",
	regex	= "yaml-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libzip"] = {
	url	= "https://libzip.org/download",
	regex	= "libzip-(%d+%.%d+%.%d+).tar.xz",
};

pkgs["limine"] = {
	url	= "https://github.com/limine-bootloader/limine/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["linux"] = {
	url	= "https://kernel.org/pub/linux/kernel/v6.x",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["linux-firmware"] = {
	url	= "https://git.kernel.org/?p=linux/kernel/git/firmware/linux-firmware.git;a=summary",
	regex	= "linux-firmware-(%d%d%d%d%d%d%d%d).tar.gz",
};

pkgs["llvm"] = {
	url	= "https://github.com/llvm/llvm-project/tags",
	regex	= "llvmorg-([.%d]+).tar.gz",
};

pkgs["lua51"] = {
	url	= "https://www.lua.org/ftp/",
	regex	= "lua-(5.1[.%d]+).tar.gz",
};

pkgs["lua51-cjson"] = {
	url	= "https://github.com/openresty/lua-cjson/tags",
	regex	= "/(%d+%.%d+%.%d+%.%d+).tar.gz",
};

pkgs["lua51-lpeg"] = {
	url	= "https://www.inf.puc-rio.br/~roberto/lpeg",
	regex	= "lpeg-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["lua51-luv"] = {
	url	= "https://github.com/luvit/luv/tags",
	regex	= "/(%d+%.%d+%.%d+-%d+).tar.g",
	postMatch = replacer('-', '.'),
};

pkgs["lua54"] = {
	url	= "https://www.lua.org/ftp/",
	regex	= "lua-(5.4[.%d]+).tar.gz",
};

pkgs["lua54-lmerge"] = {
	url	= "https://github.com/ziyao233/lmerge/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["luarocks54"] = {
	url	= "https://luarocks.github.io/luarocks/releases/",
	regex	= "luarocks-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["lz4"] = {
	url	= "https://github.com/lz4/lz4/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["m4"] = {
	url	= "https://ftp.gnu.org/gnu/m4/",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["mailcap"] = {
	url	= "https://pagure.io/mailcap/releases",
	regex	= "r([-%d]+).tar.gz",
	postMatch = replacer('-', '.'),
};

pkgs["make"] = {
	url	= "http://ftp.gnu.org/gnu/make/",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["mandoc"] = {
	url	= "https://mandoc.bsd.lv/snapshots/",
	regex	= "mandoc-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["md4c"] = {
	url	= "https://github.com/mity/md4c/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["mercurial"] = {
	url	= "https://www.mercurial-scm.org/release/",
	regex	= "mercurial-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["mesa"] = {
	url	= "https://archive.mesa3d.org/",
	regex	= "mesa-([.%d]+).tar.xz",
};

pkgs["meson"] = {
	url	= "https://github.com/mesonbuild/meson/tags",
	regex	= "/([.%d]+).tar.gz",
};

pkgs["mg"] = {
	url	= "https://github.com/hboetes/mg/tags",
	regex	= "(%d+).tar.gz",
};

pkgs["mimalloc"] = {
	url	= "https://github.com/microsoft/mimalloc/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["minisign"] = {
	url	= "https://github.com/jedisct1/minisign/tags",
	regex	= "([.%d]+).tar.gz",
};

pkgs["minizip"] = {
	url	= "https://zlib.net",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["mm-common"] = {
	url	= "https://gitlab.gnome.org/GNOME/mm-common/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["mold"] = {
	url	= "https://github.com/rui314/mold/tags",
	regex	= "([.%d]+).tar.gz",
};

pkgs["mpdecimal"] = {
	url	= "https://www.bytereef.org/mpdecimal/download.html",
	regex	= "mpdecimal-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["mpv"] = {
	url	= "https://github.com/mpv-player/mpv/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["msgpack-c"] = {
	url	= "https://github.com/msgpack/msgpack-c/tags",
	regex	= "c-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["mtdev"] = {
	url	= "https://bitmath.org/code/mtdev/",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["mtools"] = {
	url	= "https://ftp.gnu.org/gnu/mtools/",
	regex	= "mtools-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["mtr"] = {
	url	= "https://github.com/traviscross/mtr/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["musl"] = {
	url	= "https://musl.libc.org/",
	regex	= "musl-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["musl-fts"] = {
	url	= "https://github.com/void-linux/musl-fts/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["musl-obstack"] = {
	url	= "https://github.com/void-linux/musl-obstack/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["musl-rpmatch"] = {
	url	= "https://github.com/pullmoll/musl-rpmatch/tags",
	regex	= "v(%d+%.%d+).tar.gz",
};

pkgs["nano"] = {
	url	= "https://git.savannah.gnu.org/cgit/nano.git/refs/",
	regex	= "nano-(%d+%.%d+).tar.gz",
};

pkgs["nasm"] = {
	url	= "https://www.nasm.us/",
	regex	= "releasebuilds/([.%d]+)",
};

pkgs["ncurses"] = {
	url	= "http://ftp.gnu.org/gnu/ncurses/",
	regex	= "(%d+%.%d+).tar.gz",
};

pkgs["neatvnc"] = {
	url	= "https://github.com/any1/neatvnc/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["neofetch"] = {
	url	= "https://github.com/dylanaraps/neofetch/tags",
	regex	= "([.%d]+).tar.gz",
};

pkgs["neovim"] = {
	url	= "https://github.com/neovim/neovim/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["nethack"] = {
	url	= "http://nethack.org/",
	regex	= "Version (%d+%.%d+%.%d+)",
};

pkgs["nettle"] = {
	url	= "https://ftp.gnu.org/gnu/nettle",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["nginx"] = {
	url	= "https://nginx.org/download",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["ninja"] = {
	url	= "https://github.com/ninja-build/ninja/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["nlohmann-json"] = {
	url	= "https://github.com/nlohmann/json/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["nmap"] = {
	url	= "https://nmap.org/download",
	regex	= "nmap-(%d+%.%d+).tar.bz2",
};

pkgs["nmon"] = {
	url	= "https://sourceforge.net/projects/nmon/files/",
	regex	= "lmon([%w]+).c",
};

pkgs["nodejs"] = {
	url	= "https://github.com/nodejs/node/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["npth"] = {
	url	= "https://gnupg.org/ftp/gcrypt/npth/",
	regex	= "(%d+%.%d+).tar.bz2",
};

pkgs["nsnake"] = {
	url	= "https://github.com/alexdantas/nSnake/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["nspr"] = {
	url	= "https://hg.mozilla.org/projects/nspr/tags",
	regex	= "NSPR_([_%d]+)_RTM",
	postMatch = replacer('_', '.'),
};

pkgs["nss"] = {
	url	= "https://github.com/nss-dev/nss/tags",
	regex	= "NSS_([_%d]+)_RTM.tar.gz",
	postMatch = replacer('_', '.'),
};

pkgs["nudoku"] = {
	url	= "https://github.com/jubalh/nudoku/tags",
	regex	= "([.%d]+).tar.gz",
};

pkgs["nvtop"] = {
	url	= "https://github.com/Syllo/nvtop/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["oed"] = {
	url	= "https://github.com/ibara/oed/tags",
	regex	= "(%d+%.%d+).tar.gz",
};

pkgs["oksh"] = {
	url	= "https://github.com/ibara/oksh/tags",
	regex	= "(%d+%.[%.%d]+).tar.gz",
};

pkgs["oniguruma"] = {
	url	= "https://github.com/kkos/oniguruma/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["openal-soft"] = {
	url	= "https://github.com/kcat/openal-soft/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["opencc"] = {
	url	= "https://github.com/BYVoid/OpenCC/tags",
	regex	= "ver.(%d+%.%d+%.%d+).tar.gz",
};

pkgs["opendoas"] = {
	url	= "https://github.com/Duncaen/OpenDoas/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["openexr"] = {
	url	= "https://github.com/AcademySoftwareFoundation/openexr/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["openh264"] = {
	url	= "https://github.com/cisco/openh264/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["openjpeg2"] = {
	url	= "https://github.com/uclouvain/openjpeg/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["openldap"] = {
	url	= "https://www.openldap.org/software/download/OpenLDAP/openldap-release/",
	regex	= "(%d+%.%d+%.%d+).tgz",
};

pkgs["openpmix"] = {
	url	= "https://github.com/openpmix/openpmix/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["openssl"] = {
	url	= "https://www.openssl.org/source/",
	regex	= "openssl-(3.[%.%d]+).tar.gz",
};

pkgs["optipng"] = {
	url	= "https://sourceforge.net/projects/optipng/files/OptiPNG/",
	regex	= "optipng-(%d+%.%d+%.%d+)/",
};

pkgs["ostree"] = {
	url	= "https://github.com/ostreedev/ostree/tags",
	regex	= "v(%d%d%d%d.[%d]+).tar.gz",
};

pkgs["p11-kit"] = {
	url	= "https://github.com/p11-glue/p11-kit/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["pacman"] = {
	url	= "https://gitlab.archlinux.org/pacman/pacman/-/tags",
	regex	= "v(%d+%.[%.%d]+).tar.gz",
};

pkgs["pam"] = {
	url	= "https://github.com/linux-pam/linux-pam/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["pango"] = {
	url	= "https://gitlab.gnome.org/GNOME/pango/-/tags",
	regex	= "pango-(1.5[.%d]+).tar.gz",
};

pkgs["pangomm"] = {
	url	= "https://gitlab.gnome.org/GNOME/pangomm/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["papirus-icon-theme"] = {
	url	= "https://github.com/PapirusDevelopmentTeam/papirus-icon-theme/tags",
	regex	= "(%d%d%d%d%d%d%d%d).tar.gz",
};

pkgs["patch"] = {
	url	= "http://ftp.gnu.org/gnu/patch/",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["patchelf"] = {
	url	= "https://github.com/NixOS/patchelf/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["pciutils"] = {
	url	= "https://www.kernel.org/pub/software/utils/pciutils/",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["pcre2"] = {
	url	= "https://github.com/PhilipHazel/pcre2/tags",
	regex	= "(%d+%.%d+).tar.gz",
};

pkgs["perl"] = {
	url	= "https://www.cpan.org/src/",
	regex	= "tar -xzf perl-([.%d]+).tar.gz",
};

pkgs["perl-algorithm-diff"] = {
	url	= "https://cpan.metacpan.org/authors/id/R/RJ/RJBS/",
	regex	= "Algorithm-Diff-(%d+%.%d+).tar.gz",
};

pkgs["perl-b-cow"] = {
	url	= "https://cpan.metacpan.org/authors/id/A/AT/ATOOMIC/",
	regex	= "B-COW-(%d+%.%d+).tar.gz",
};

pkgs["perl-capture-tiny"] = {
	url	= "https://cpan.metacpan.org/authors/id/D/DA/DAGOLDEN/",
	regex	= "Capture-Tiny-(%d+%.%d+).tar.gz",
};

pkgs["perl-class-data-inheritable"] = {
	url	= "https://cpan.metacpan.org/authors/id/R/RS/RSHERER/",
	regex	= "Class-Data-Inheritable-(%d+%.%d+).tar.gz",
};

pkgs["perl-clone"] = {
	url	= "https://cpan.metacpan.org/authors/id/G/GA/GARU/",
	regex	= "Clone-(%d+%.%d+).tar.gz",
};

pkgs["perl-devel-stacktrace"] = {
	url	= "https://cpan.metacpan.org/authors/id/D/DR/DROLSKY/",
	regex	= "Devel-StackTrace-(%d+%.%d+).tar.gz",
};

pkgs["perl-encode-locale"] = {
	url	= "https://search.cpan.org/CPAN/authors/id/G/GA/GAAS/",
	regex	= "Encode-Locale-(%d%.%d%d)%.tar%.gz",
};

pkgs["perl-error"] = {
	url	= "https://cpan.metacpan.org/authors/id/S/SH/SHLOMIF/",
	regex	= "Error-(%d+%.%d+).tar.gz",
};

pkgs["perl-exception-class"] = {
	url	= "https://cpan.metacpan.org/authors/id/D/DR/DROLSKY/",
	regex	= "Exception-Class-(%d+%.%d+).tar.gz",
};

pkgs["perl-extutils-config"] = {
	url	= "https://cpan.metacpan.org/authors/id/L/LE/LEONT/",
	regex	= "ExtUtils-Config-(%d+%.%d+).tar.gz",
};

pkgs["perl-extutils-hascompiler"] = {
	url	= "https://cpan.metacpan.org/authors/id/L/LE/LEONT/",
	regex	= "ExtUtils-HasCompiler-(%d+%.%d+).tar.gz",
};

pkgs["perl-extutils-helpers"] = {
	url	= "https://cpan.metacpan.org/authors/id/L/LE/LEONT/",
	regex	= "ExtUtils-Helpers-(%d+%.%d+).tar.gz",
};

pkgs["perl-extutils-installpaths"] = {
	url	= "https://cpan.metacpan.org/authors/id/L/LE/LEONT/",
	regex	= "ExtUtils-InstallPaths-(%d+%.%d+).tar.gz",
};

pkgs["perl-file-slurper"] = {
	url	= "https://cpan.metacpan.org/authors/id/L/LE/LEONT/",
	regex	= "File-Slurper-(%d+%.%d+).tar.gz",
};

pkgs["perl-http-daemon"] = {
	url	= "https://cpan.metacpan.org/authors/id/O/OA/OALDERS/",
	regex	= "HTTP-Daemon-(%d+%.%d+).tar.gz",
};

pkgs["perl-http-date"] = {
	url	= "https://cpan.metacpan.org/authors/id/O/OA/OALDERS/",
	regex	= "HTTP-Date-(%d+%.%d+).tar.gz",
};

pkgs["perl-http-message"] = {
	url	= "https://cpan.metacpan.org/authors/id/O/OA/OALDERS/",
	regex	= "HTTP-Message-(%d+%.%d+).tar.gz",
};

pkgs["perl-io-compress-brotli"] = {
	url	= "https://cpan.metacpan.org/authors/id/M/MG/MGV/",
	regex	= "IO-Compress-Brotli-(%d+%.%d+).tar.gz",
};

pkgs["perl-io-html"] = {
	url	= "https://cpan.metacpan.org/authors/id/C/CJ/CJM/",
	regex	= "IO-HTML-(%d+%.%d+).tar.gz",
};

pkgs["perl-json"] = {
	url	= "https://cpan.metacpan.org/authors/id/I/IS/ISHIGAKI/",
	regex	= "JSON-(%d+%.%d+).tar.gz",
};

pkgs["perl-locale-gettext"] = {
	url	= "https://cpan.metacpan.org/authors/id/P/PV/PVANDRY/",
	regex	= "Locale-gettext-(%d+%.%d+).tar.gz",
};

pkgs["perl-lwp-mediatypes"] = {
	url	= "https://cpan.metacpan.org/authors/id/O/OA/OALDERS/",
	regex	= "LWP-MediaTypes-(%d+%.%d+).tar.gz",
};

pkgs["perl-module-build-tiny"] = {
	url	= "https://metacpan.org/pod/Module::Build::Tiny",
	regex	= "(%d+%.%d+).tar.gz",
};

pkgs["perl-sub-uplevel"] = {
	url	= "https://cpan.metacpan.org/authors/id/D/DA/DAGOLDEN/",
	regex	= "Sub-Uplevel-(%d+%.%d+).tar.gz",
};

pkgs["perl-test-deep"] = {
	url	= "https://cpan.metacpan.org/authors/id/R/RJ/RJBS/",
	regex	= "Test-Deep-(%d+%.%d+).tar.gz",
};

pkgs["perl-test-differences"] = {
	url	= "https://cpan.metacpan.org/authors/id/D/DC/DCANTRELL/",
	regex	= "Test-Differences-(%d+%.%d+).tar.gz",
};

pkgs["perl-test-exception"] = {
	url	= "https://cpan.metacpan.org/authors/id/E/EX/EXODIST/",
	regex	= "Test-Exception-(%d+%.%d+).tar.gz",
};

pkgs["perl-test-fatal"] = {
	url	= "https://metacpan.org/pod/Test::Fatal",
	regex	= "(%d+%.%d+).tar.gz",
};

pkgs["perl-test-most"] = {
	url	= "https://cpan.metacpan.org/authors/id/O/OV/OVID/",
	regex	= "Test-Most-(%d+%.%d+).tar.gz",
};

pkgs["perl-test-needs"] = {
	url	= "https://metacpan.org/pod/Test::Needs",
	regex	= "(%d+%.%d+).tar.gz",
};

pkgs["perl-test-simple"] = {
	url	= "https://cpan.metacpan.org/authors/id/E/EX/EXODIST/",
	regex	= "Test-Simple-(%d+%.%d+).tar.gz",
};

pkgs["perl-test-warn"] = {
	url	= "https://cpan.metacpan.org/authors/id/B/BI/BIGJ/",
	regex	= "Test-Warn-(%d+%.%d+).tar.gz",
};

pkgs["perl-test-warnings"] = {
	url	= "https://search.mcpan.org/CPAN/authors/id/E/ET/ETHER/",
	regex	= "Test-Warnings-(%d+%.%d+).tar.gz",
};

pkgs["perl-text-diff"] = {
	url	= "https://cpan.metacpan.org/authors/id/N/NE/NEILB/",
	regex	= "Text-Diff-(%d+%.%d+).tar.gz",
};

pkgs["perl-timedate"] = {
	url	= "https://metacpan.org/pod/TimeDate",
	regex	= "(%d+%.%d+).tar.gz",
};

pkgs["perl-try-tiny"] = {
	url	= "https://metacpan.org/pod/Try::Tiny",
	regex	= "(%d+%.%d+).tar.gz",
};

pkgs["perl-uri"] = {
	url	= "https://metacpan.org/pod/URI",
	regex	= "(%d+%.%d+).tar.gz",
};

pkgs["perl-xml-namespacesupport"] = {
	url	= "https://www.cpan.org/authors/id/P/PE/PERIGRIN/",
	regex	= "XML-NamespaceSupport-(%d+%.%d+).tar.gz",
};

pkgs["perl-xml-parser"] = {
	url	= "https://metacpan.org/pod/XML::Parser",
	regex	= "(%d+%.%d+).tar.gz",
};

pkgs["perl-xml-sax"] = {
	url	= "https://www.cpan.org/authors/id/G/GR/GRANTM/",
	regex	= "XML-SAX-(%d+%.%d+).tar.gz",
};

pkgs["perl-xml-sax-base"] = {
	url	= "https://www.cpan.org/authors/id/G/GR/GRANTM/",
	regex	= "XML-SAX-Base-(%d+%.%d+).tar.gz",
};

pkgs["perl-xml-sax-expat"] = {
	url	= "https://www.cpan.org/authors/id/B/BJ/BJOERN/",
	regex	= "XML-SAX-Expat-(%d+%.%d+).tar.gz",
};

pkgs["perl-xml-simple"] = {
	url	= "https://www.cpan.org/authors/id/G/GR/GRANTM/",
	regex	= "XML-Simple-(%d+%.%d+).tar.gz",
};

pkgs["pigz"] = {
	url	= "https://www.zlib.net/pigz/",
	regex	= "pigz-(%d+%.%d+).tar.gz",
};

pkgs["pinentry"] = {
	url	= "https://gnupg.org/ftp/gcrypt/pinentry/",
	regex	= "(%d+%.%d+%.%d+).tar.bz2",
};

pkgs["pipewire"] = {
	url	= "https://gitlab.freedesktop.org/pipewire/pipewire/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["pixman"] = {
	url	= "https://xorg.freedesktop.org/releases/individual/lib/",
	regex	= "pixman-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["pkgconf"] = {
	url	= "https://github.com/pkgconf/pkgconf/tags",
	regex	= "pkgconf-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["plasma-wayland-protocols"] = {
	url	= "https://download.kde.org/stable/plasma-wayland-protocols/",
	regex	= "plasma-wayland-protocols-(%d+%.%d+%.%d+).tar.xz",
};

pkgs["plymouth"] = {
	url	= "https://www.freedesktop.org/software/plymouth/releases/",
	regex	= "plymouth-(%d%d%.%d+%.%d+).tar.xz",
};

pkgs["popt"] = {
	url	= "https://ftp.osuosl.org/pub/rpm/popt/releases/popt-1.x/",
	regex	= "popt-(%d+%.%d+).tar.gz",
};

pkgs["protobuf"] = {
	url	= "https://github.com/protocolbuffers/protobuf/releases",
	regex	= "protobuf-(%d+%.%d+).tar.gz",
};

pkgs["pugixml"] = {
	url	= "https://github.com/zeux/pugixml/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["pyalpm"] = {
	url	= "https://gitlab.archlinux.org/archlinux/pyalpm/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python"] = {
	url	= "https://www.python.org/ftp/python/",
	regex	= "(3.12.%d+)/",
};

pkgs["python-attrs"] = {
	url	= "https://github.com/python-attrs/attrs/tags",
	regex	= "/(%d%d%.%d+%.%d+).tar.gz",
};

pkgs["python-autocommand"] = {
	url	= "https://github.com/Lucretiel/autocommand/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-babel"] = {
	url	= "https://github.com/python-babel/babel/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-beautifulsoup4"] = {
	url	= "https://git.launchpad.net/beautifulsoup/tree/CHANGELOG",
	regex	= "%s(%d+%.%d+%.%d+)%s",
};

pkgs["python-build"] = {
	url	= "https://github.com/pypa/build/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-cairo"] = {
	url	= "https://github.com/pygobject/pycairo/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-calver"] = {
	url	= "https://github.com/di/calver/tags",
	regex	= "/(%d%d%d%d%.%d%d%.%d%d).tar.gz",
};

pkgs["python-editables"] = {
	url	= "https://github.com/pfmoore/editables/tags",
	regex	= "/(%d+%.%d+).tar.gz",
};

pkgs["python-fastjsonschema"] = {
	url	= "https://github.com/horejsek/python-fastjsonschema/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-flit-core"] = {
	url	= "https://github.com/pypa/flit/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-freezegun"] = {
	url	= "https://github.com/spulec/freezegun/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-hatch-fancy-pypi-readme"] = {
	url	= "https://github.com/hynek/hatch-fancy-pypi-readme/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-hatch-vcs"] = {
	url	= "https://github.com/ofek/hatch-vcs/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-hatchling"] = {
	url	= "https://github.com/pypa/hatch/tags",
	regex	= "hatchling-v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-html5lib"] = {
	url	= "https://github.com/html5lib/html5lib-python/tags",
	regex	= "/([.%d]+).tar.gz",
};

pkgs["python-hypothesis"] = {
	url	= "https://github.com/HypothesisWorks/hypothesis/tags",
	regex	= "hypothesis-python-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-imagesize"] = {
	url	= "https://github.com/shibukawa/imagesize_py",
	regex	= tarGz,
};

pkgs["python-inflect"] = {
	url	= "https://github.com/jaraco/inflect/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-iniconfig"] = {
	url	= "https://github.com/pytest-dev/iniconfig/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-installer"] = {
	url	= "https://github.com/pypa/installer/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-jaraco.classes"] = {
	url	= "https://github.com/jaraco/jaraco.classes/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-jaraco.context"] = {
	url	= "https://github.com/jaraco/jaraco.context/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-jaraco.functools"] = {
	url	= "https://github.com/jaraco/jaraco.functools/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-jaraco.text"] = {
	url	= "https://github.com/jaraco/jaraco.text/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-jinja"] = {
	url	= "https://github.com/pallets/jinja/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-license-expression"] = {
	url	= "https://github.com/nexB/license-expression/tags",
	regex	= vPrefixedTarGz,
};

pkgs["python-lxml"] = {
	url	= "https://github.com/lxml/lxml/tags",
	regex	= "lxml-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-magic"] = {
	url	= "https://github.com/ahupp/python-magic/tags",
	regex	= tarGz,
};

pkgs["python-mako"] = {
	url	= "https://github.com/sqlalchemy/mako/tags",
	regex	= "rel_(%d+_%d+_%d+).tar.gz",
	postMatch = replacer('_', '.'),
};

pkgs["python-markdown"] = {
	url	= "https://github.com/Python-Markdown/markdown/tags",
	regex	= tarGz,
};

pkgs["python-markupsafe"] = {
	url	= "https://github.com/pallets/markupsafe/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-mock"] = {
	url	= "https://github.com/testing-cabal/mock/tags",
	regex	= tarGz,
};

pkgs["python-more-itertools"] = {
	url	= "https://github.com/more-itertools/more-itertools/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-ordered-set"] = {
	url	= "https://github.com/rspeer/ordered-set/tags",
	regex	= "release/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-packaging"] = {
	url	= "https://github.com/pypa/packaging/tags",
	regex	= "/(%d+%.%d+).tar.gz",
};

pkgs["python-pathspec"] = {
	url	= "https://github.com/cpburnz/python-pathspec/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-pbr"] = {
	url	= "https://opendev.org/openstack/pbr/tags",
	regex	= tarGz,
};

pkgs["python-pkgconfig"] = {
	url	= "https://github.com/matze/pkgconfig/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-platformdirs"] = {
	url	= "https://github.com/platformdirs/platformdirs/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-pluggy"] = {
	url	= "https://github.com/pytest-dev/pluggy/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-portend"] = {
	url	= "https://github.com/jaraco/portend/tags",
	regex	= vPrefixedTarGz,
};

pkgs["python-pretend"] = {
	url	= "https://github.com/alex/pretend/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-psutil"] = {
	url	= "https://github.com/giampaolo/psutil/tags",
	regex	= "release-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-py-cpuinfo"] = {
	url	= "https://github.com/workhorsy/py-cpuinfo/tags",
	regex	= vPrefixedTarGz,
};

pkgs["python-pycparser"] = {
	url	= "https://github.com/eliben/pycparser/tags",
	regex	= "release_v(%d+%.%d+).tar.gz",
};

pkgs["python-pyelftools"] = {
	url	= "https://github.com/eliben/pyelftools/tags",
	regex	= "v(%d+%.%d+).tar.gz",
};

pkgs["python-pygments"] = {
	url	= "https://github.com/pygments/pygments/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-pyproject-hooks"] = {
	url	= "https://github.com/pypa/pyproject-hooks/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-pyproject-metadata"] = {
	url	= "https://github.com/pypa/pyproject-metadata/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-pysocks"] = {
	url	= "https://github.com/Anorov/PySocks/tags",
	regex	= tarGz,
};

pkgs["python-pytest"] = {
	url	= "https://github.com/pytest-dev/pytest/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-pytest-asyncio"] = {
	url	= "https://github.com/pytest-dev/pytest-asyncio/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-pytest-benchmark"] = {
	url	= "https://github.com/ionelmc/pytest-benchmark/tags",
	regex	= vPrefixedTarGz,
};

pkgs["python-pytest-enabler"] = {
	url	= "https://github.com/jaraco/pytest-enabler/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-pytest-expect"] = {
	url	= "https://github.com/gsnedders/pytest-expect/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-pytest-mock"] = {
	url	= "https://github.com/pytest-dev/pytest-mock/tags",
	regex	= vPrefixedTarGz,
};

pkgs["python-pytest-pacman"] = {
	url	= "https://gitlab.archlinux.org/archlinux/pytest-pacman/-/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["python-pytest-timeout"] = {
	url	= "https://github.com/pytest-dev/pytest-timeout/tags",
	regex	= tarGz,
};

pkgs["python-pytest-xdist"] = {
	url	= "https://github.com/pytest-dev/pytest-xdist/tags/",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-pytz"] = {
	url	= "https://pypi.python.org/pypi/pytz/#history",
	regex	= "project/pytz/(%d%d%d%d%.%d+)/",
};

pkgs["python-requests"] = {
	url	= "https://github.com/psf/requests/tags",
	regex	= vPrefixedTarGz,
};

pkgs["python-semantic-version"] = {
	url	= "https://github.com/rbarrois/python-semanticversion/tags",
	regex	= tarGz,
};

pkgs["python-setuptools"] = {
	url	= "https://github.com/pypa/setuptools/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-setuptools-rust"] = {
	url	= "https://github.com/PyO3/setuptools-rust/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-setuptools-scm"] = {
	url	= "https://github.com/pypa/setuptools_scm/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-six"] = {
	url	= "https://pypi.org/project/six",
	regex	= "six-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-smartypants"] = {
	url	= "https://github.com/leohemsted/smartypants.py/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-sortedcontainers"] = {
	url	= "https://github.com/grantjenks/python-sortedcontainers/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-soupsieve"] = {
	url	= "https://github.com/facelessuser/soupsieve/tags",
	regex	= "/([.%d]+).tar.gz",
};

pkgs["python-stevedore"] = {
	url	= "https://github.com/openstack/stevedore/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-structlog"] = {
	url	= "https://github.com/hynek/structlog/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-tempora"] = {
	url	= "https://github.com/jaraco/tempora/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-testpath"] = {
	url	= "https://github.com/jupyter/testpath/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-toml"] = {
	url	= "https://github.com/uiri/toml/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-tomli"] = {
	url	= "https://github.com/hukkin/tomli/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-tqdm"] = {
	url	= "https://github.com/tqdm/tqdm/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-trove-classifiers"] = {
	url	= "https://github.com/pypa/trove-classifiers/tags",
	regex	= "/(%d%d%d%d%.%d+%.%d+).tar.gz",
};

pkgs["python-typeguard"] = {
	url	= "https://github.com/agronholm/typeguard/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-typing_extensions"] = {
	url	= "https://github.com/python/typing_extensions/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-typogrify"] = {
	url	= "https://github.com/mintchaos/typogrify/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-tzlocal"] = {
	url	= "https://github.com/regebro/tzlocal/tags",
	regex	= "(%d+%.[%.%d]+).tar.gz",
};

pkgs["python-u-msgpack"] = {
	url	= "https://github.com/vsergeev/u-msgpack-python/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-urllib3"] = {
	url	= "https://github.com/urllib3/urllib3/tags",
	regex	= "(1%.%d+%.%d+).tar.gz",
};

pkgs["python-validate-pyproject"] = {
	url	= "https://github.com/abravalheri/validate-pyproject/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["python-wcag-contrast-ratio"] = {
	url	= "https://github.com/gsnedders/wcag-contrast-ratio/tags",
	regex	= "/(%d+%.%d+).tar.gz",
};

pkgs["python-webencodings"] = {
	url	= "https://github.com/gsnedders/python-webencodings/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["python-wheel"] = {
	url	= "https://github.com/pypa/wheel/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-yaml"] = {
	url	= "https://github.com/yaml/pyyaml/tags",
	regex	= "/(%d+%.[%d%.]+).tar.gz",
};

pkgs["qemu-common"] = {
	url	= "https://download.qemu.org/",
	regex	= "qemu-(%d+%.%d+%.%d+).tar.xz",
};

pkgs["qpdf"] = {
	url	= "https://github.com/qpdf/qpdf/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["qt6-base"] = {
	url	= "https://download.qt.io/official_releases/qt/",
	regex	= "(%d+%.%d+)/",
	postMatch = function(s) return s .. ".0"; end,
};

pkgs["ranger"] = {
	url	= "https://github.com/ranger/ranger/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["rapidjson"] = {
	url	= "https://github.com/Tencent/rapidjson/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["rdfind"] = {
	url	= "https://github.com/pauldreik/rdfind/tags",
	regex	= "releases/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["re2"] = {
	url	= "https://github.com/google/re2/tags",
	regex	= "(%d%d%d%d-%d%d-%d%d).tar.gz",
	postMatch = replacer('-', ''),
};

pkgs["re2c"] = {
	url	= "https://github.com/skvadrik/re2c/tags",
	regex	= "(%d+%.%d+).tar.gz",
};

pkgs["readline"] = {
	url	= "https://ftp.gnu.org/gnu/readline/",
	regex	= "readline-(%d+%.%d+).tar.gz",
};

pkgs["rollmeow"] = {
	url	= "https://github.com/eweOS/rollmeow/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["rsync"] = {
	url	= "https://github.com/WayneD/rsync/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["rust"] = {
	url	= "https://www.rust-lang.org/",
	regex	= "Rust-(%d+%.%d+%.%d+).html",
};

pkgs["sassc"] = {
	url	= "https://github.com/sass/sassc/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["scdoc"] = {
	url	= "https://git.sr.ht/~sircmpwn/scdoc/refs",
	regex	= "refs/(%d+%.%d+%.%d+)",
};

pkgs["sdl12-compat"] = {
	url	= "https://github.com/libsdl-org/sdl12-compat/tags",
	regex	= "release-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["sdl2"] = {
	url	= "https://github.com/libsdl-org/SDL/tags",
	regex	= "/release-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["sdl2-image"] = {
	url	= "https://github.com/libsdl-org/SDL_image/tags",
	regex	= "release-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["seatd"] = {
	url	= "https://git.sr.ht/~kennylevinsen/seatd/refs",
	regex	= "refs/(%d+%.%d+%.%d+)",
};

pkgs["setconf"] = {
	url	= "https://setconf.roboticoverlords.org/",
	regex	= "setconf-(%d+%.%d+%.%d+).tar.xz",
};

pkgs["shaderc"] = {
	url	= "https://github.com/google/shaderc/tags",
	regex	= "v(%d%d%d%d%.%d+).tar.gz",
};

pkgs["shared-mime-info"] = {
	url	= "https://gitlab.freedesktop.org/xdg/shared-mime-info/-/tags",
	regex	= "(%d+%.%d+).tar.gz",
};

pkgs["shellcheck-bin"] = {
	url	= "https://github.com/koalaman/shellcheck/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["samurai"] = {
	url	= "https://github.com/michaelforney/samurai/tags",
	regex	= "/(%d+%.%d+).tar.gz",
};

pkgs["signify"] = {
	url	= "https://github.com/aperezdc/signify/tags",
	regex	= "v(%d+).tar.gz",
};

pkgs["sing-box"] = {
	url	= "https://github.com/SagerNet/sing-box",
	regex	= "v(%d+%.%d+%.%d+)",
};

pkgs["skalibs"] = {
	url	= "http://git.skarnet.org/cgi-bin/cgit.cgi/skalibs/refs/",
	regex	= "skalibs-(%d+%.%d+%.%d+%.%d+).tar.gz",
};

pkgs["sl"] = {
	url	= "https://github.com/eyJhb/sl/tags",
	regex	= "(%d+%.%d+).tar.gz",
};

pkgs["slibtool"] = {
	url	= "https://midipix.org/dl/slibtool/",
	regex	= "slibtool-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["slurp"] = {
	url	= "https://github.com/emersion/slurp/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["smartmontools"] = {
	url	= "https://www.smartmontools.org/wiki/Download",
	regex	= "RELEASE_(%d+_%d+)/",
	postMatch = replacer('_', '.'),
};

pkgs["socat"] = {
	url	= "http://www.dest-unreach.org/socat/download/",
	regex	= "socat-(%d+%.%d+%.%d+%.%d+).tar.gz",
};

pkgs["sockstat"] = {
	url	= "http://deb.debian.org/debian/pool/main/s/sockstat/",
	regex	= "sockstat_(%d+%.%d+%.%d+).orig.tar.gz",
};

pkgs["sof-firmware"] = {
	url	= "https://github.com/thesofproject/sof-bin/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["soxr"] = {
	url	= "https://github.com/chirlu/soxr/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["spdlog"] = {
	url	= "https://github.com/gabime/spdlog/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["spice-protocol"] = {
	url	= "https://gitlab.freedesktop.org/spice/spice-protocol/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["spirv-headers"] = {
	url	= "https://github.com/KhronosGroup/SPIRV-Headers/tags",
	regex	= "sdk-(%d+%.%d+%.%d+%.%d+).tar.gz",
};

pkgs["spirv-llvm-translator"] = {
	url	= "https://github.com/KhronosGroup/SPIRV-LLVM-Translator/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["spirv-tools"] = {
	url	= "https://github.com/KhronosGroup/SPIRV-Tools/tags",
	regex	= "v(%d%d%d%d%.%d+).tar.gz",
};

pkgs["sqlite"] = {
	url	= "https://sqlite.org/index.html",
	regex	= "Version (%d+%.%d+%.%d+)",
};

pkgs["squashfs-tools"] = {
	url	= "https://github.com/plougher/squashfs-tools/tags",
	regex	= "/([.%d]+).tar.gz",
};

pkgs["strace"] = {
	url	= "https://github.com/strace/strace/tags",
	regex	= "v(%d+%.%d+).tar.gz",
};

pkgs["sudo"] = {
	url	= "https://www.sudo.ws/sudo/dist/",
	regex	= "sudo-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["supertux"] = {
	url	= "https://github.com/supertux/supertux/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["supertuxkart"] = {
	url	= "https://github.com/supertuxkart/stk-code/tags",
	regex	= "/(%d+%.%d+).tar.gz",
};

pkgs["swappy"] = {
	url	= "https://github.com/jtheoof/swappy/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["sway"] = {
	url	= "https://github.com/swaywm/sway/tags",
	regex	= "(%d+%.[%.%d]+).tar.gz",
};

pkgs["swaybg"] = {
	url	= "https://github.com/swaywm/swaybg/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["swayimg"] = {
	url	= "https://github.com/artemsen/swayimg/tags",
	regex	= "v(%d+%.%d+).tar.gz",
};

pkgs["swig"] = {
	url	= "https://sourceforge.net/projects/swig/files/swig/",
	regex	= "swig-(%d+%.%d+%.%d+)/",
};

pkgs["swww"] = {
	url	= "https://github.com/Horus645/swww/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["symlinks"] = {
	url	= "https://github.com/brandt/symlinks/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["systemc"] = {
	url	= "https://github.com/accellera-official/systemc/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["tcl"] = {
	url	= "https://sourceforge.net/projects/tcl/files/Tcl/",
	regex	= "/(%d+%.[%.%d]+)/",
};

pkgs["tclap"] = {
	url	= "https://sourceforge.net/projects/tclap/files/",
	regex	= "tclap-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["telegram-desktop"] = {
	url	= "https://github.com/telegramdesktop/tdesktop/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["tetris"] = {
	url	= "https://github.com/eNV25/tetris/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["texinfo"] = {
	url	= "https://ftp.gnu.org/pub/gnu/texinfo/",
	regex	= "texinfo-([.%d]+).tar.xz",
};

pkgs["tl-expected"] = {
	url	= "https://github.com/TartanLlama/expected/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["tllist"] = {
	url	= "https://codeberg.org/dnkl/tllist/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["tomlplusplus"] = {
	url	= "https://github.com/marzer/tomlplusplus/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["tree"] = {
	url	= "https://gitlab.com/OldManProgrammer/unix-tree/-/tags",
	regex	= "unix-tree-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["tree-sitter"] = {
	url	= "https://github.com/tree-sitter/tree-sitter/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["ttf-dejavu"] = {
	url	= "https://github.com/dejavu-fonts/dejavu-fonts/tags",
	regex	= "version_(%d+_%d+)",
	postMatch = replacer('_', '.'),
};

pkgs["ttf-unifont"] = {
	url	= "https://ftpmirror.gnu.org/gnu/unifont/",
	regex	= "unifont-(%d+%.%d+%.%d+)/",
};

pkgs["tty2socket"] = {
	url	= "https://github.com/eweOS/tty2socket/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["turnstile"] = {
	url	= "https://github.com/chimera-linux/turnstile/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["unibilium"] = {
	url	= "https://github.com/neovim/unibilium/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["util-linux"] = {
	url	= "https://github.com/util-linux/util-linux/tags",
	regex	= "v(%d+%.[%.%d]+).tar.gz",
};

pkgs["utmps"] = {
	url	= "http://skarnet.org/software/utmps/",
	regex	= "utmps-(%d+%.%d+%.%d+%.%d+).tar.gz",
};

pkgs["vala"] = {
	url	= "https://gitlab.gnome.org/GNOME/vala/-/tags",
	regex	= "vala-(%d+%.%d+%.%d+).tar.gz",
	-- releases with even minor version is stable
	filter	= function(vs) return vs[2] % 2 == 0; end,
};

pkgs["valgrind"] = {
	url	= "https://sourceware.org/pub/valgrind/",
	regex	= "valgrind-(%d+%.%d+%.%d+).tar.bz2",
};

pkgs["vapoursynth"] = {
	url	= "https://github.com/vapoursynth/vapoursynth/tags",
	regex	= "(R%d+).tar.gz",
};

pkgs["verilator"] = {
	url	= "https://github.com/verilator/verilator/tags",
	regex	= "v(%d+%.%d+).tar.gz",
};

pkgs["vim"] = {
	url	= "https://github.com/vim/vim/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["virglrenderer"] = {
	url	= "https://gitlab.freedesktop.org/virgl/virglrenderer/-/tags",
	regex	= "virglrenderer-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["vte-common"] = {
	url	= "https://gitlab.gnome.org/GNOME/vte/-/tags",
	regex	= "vte-(%d+%.%d+%.%d+).tar.gz",
	-- releases with even minor version are stable
	filter	= function(s) return s[2] % 2 == 0; end,
};

pkgs["vulkan-headers"] = {
	url	= "https://github.com/KhronosGroup/Vulkan-Headers/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["vulkan-icd-loader"] = {
	url	= "https://github.com/KhronosGroup/Vulkan-Loader/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["warzone2100"] = {
	url	= "https://github.com/Warzone2100/warzone2100/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["waybar"] = {
	url	= "https://github.com/Alexays/Waybar/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["waycheck"] = {
	url	= "https://gitlab.freedesktop.org/serebit/waycheck/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["wayfire"] = {
	url	= "https://github.com/WayfireWM/wayfire/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["wayland"] = {
	url	= "https://gitlab.freedesktop.org/wayland/wayland/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["wayland-protocols"] = {
	url	= "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/tags",
	regex	= "(%d+%.%d+).tar.gz",
};

pkgs["wayvnc"] = {
	url	= "https://github.com/any1/wayvnc/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["wdisplays"] = {
	url	= "https://github.com/artizirk/wdisplays/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["weston"] = {
	url	= "https://gitlab.freedesktop.org/wayland/weston/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["wf-config"] = {
	url	= "https://github.com/WayfireWM/wf-config/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["wget"] = {
	url	= "https://ftp.gnu.org/gnu/wget/",
	regex	= "wget-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["wireguard-tools"] = {
	url	= "https://git.zx2c4.com/wireguard-tools/",
	regex	= "/wireguard-tools-(%d+%.%d+%.%d%d%d%d%d%d%d%d).tar.xz",
};

pkgs["wireplumber"] = {
	url	= "https://gitlab.freedesktop.org/pipewire/wireplumber/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["wl-clipboard"] = {
	url	= "https://github.com/bugaevc/wl-clipboard/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["wlogout"] = {
	url	= "https://github.com/ArtsyMacaw/wlogout/tags",
	regex	= "/([.%d]+).tar.gz",
};

pkgs["wlr-randr"] = {
	url	= "https://git.sr.ht/~emersion/wlr-randr/refs",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["wlroots"] = {
	url	= "https://gitlab.freedesktop.org/wlroots/wlroots/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["wmenu"] = {
	url	= "https://codeberg.org/adnano/wmenu/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["wofi"] = {
	url	= "https://hg.sr.ht/~scoopta/wofi/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["wpa_supplicant"] = {
	url	= "https://w1.fi/releases/",
	regex	= "wpa_supplicant-(%d+%.%d+).tar.gz",
};

pkgs["x265"] = {
	url	= "https://bitbucket.org/multicoreware/x265_git/wiki/Home",
	regex	= "x265_([.%d]+).tar.gz",
};

pkgs["xdg-dbus-proxy"] = {
	url	= "https://github.com/flatpak/xdg-dbus-proxy/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["xdg-desktop-portal"] = {
	url	= "https://github.com/flatpak/xdg-desktop-portal/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["xdg-user-dirs"] = {
	url	= "https://gitlab.freedesktop.org/xdg/xdg-user-dirs/-/tags",
	regex	= "(%d+%.%d+).tar.gz",
};

pkgs["xdg-utils"] = {
	url	= "https://gitlab.freedesktop.org/xdg/xdg-utils/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["xkeyboard-config"] = {
	url	= "https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config/-/tags",
	regex	= "xkeyboard-config-(%d+%.%d+).tar.gz",
};

pkgs["xmlto"] = {
	url	= "https://releases.pagure.org/xmlto/",
	regex	= "xmlto-(%d+%.%d+%.%d+).tar.bz2",
};

pkgs["xxhash"] = {
	url	= "https://github.com/Cyan4973/xxHash/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["xz"] = {
	url	= "https://github.com/tukaani-project/xz/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["yaft"] = {
	url	= "https://github.com/uobikiemukot/yaft/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["yaml-cpp"] = {
	url	= "https://github.com/jbeder/yaml-cpp/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["yasm"] = {
	url	= "https://www.tortall.net/projects/yasm/releases/",
	regex	= "yasm-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["zimg"] = {
	url	= "https://github.com/sekrit-twc/zimg/tags",
	regex	= "release-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["zlib-ng"] = {
	url	= "https://github.com/zlib-ng/zlib-ng/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["zstd"] = {
	url	= "https://github.com/facebook/zstd/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

