function replacer(a, b)
	return function(s)
		return string.gsub(s, a, b);
	end
end

function gnomeStable(v)
	return v[2] % 2 == 0;
end

-- Some projects use version number >= 90 for unstable releases
function ignoreHighVersions(v)
	for _, n in pairs(v) do
		if tonumber(n) >= 90 then
			return false;
		end
	end

	return true;
end

function cAnd(...)
	local conds = { ... };
	return function(v)
		for _, cond in ipairs(conds) do
			if not cond(v) then
				return false;
			end
		end

		return true;
	end;
end

local vPrefixedTarGz = "v(%d+%.[%.%d]+).tar.gz";
local tarGz = "/(%d+[%.%d]+).tar.gz";
local function
namedTarGz(name)
	return name .. "-(%d+[%.%d]+).tar.gz";
end
local function
namedVTarGz(name)
	return name .. "-v(%d+[%.%d]+).tar.gz";
end

local vPrefixedTar = "v(%d+[%.%d]+).tar";
local tar = "/(%d+[%.%d]+).tar";
local function
namedTar(name)
	return name .. "-(%d+[%.%d]+).tar";
end
local function
namedVTar(name)
	return name .. "-v(%d+[%.%d]+).tar";
end

local function
namedTarBz2(name)
  return name .. "-(%d+[%.%d]+).tar.bz2";
end

local function
namedTarXz(name)
  return name .. "-(%d+[%.%d]+).tar.xz";
end

local gittag = "tags/(%w+)";
local vPrefixedTag = "tags/v([%d%.]+)$";
local numericTag = "tags/([%d%.]+)$";

local function
namedTag(name)
	return "tags/" .. name .. "-([%d%.]+)$";
end

local function
batchPkgs(upstreamName, names)
	local upstream = pkgs[upstreamName];

	names = type(names) == "string" and { names } or names;

	for _, name in pairs(names) do
		pkgs[name] = {
				url	= upstream.url,
				follow	= upstreamName,
			     };
	end
end

pkgs["a52dec"] = {
	gitrepo	= "https://git.adelielinux.org/community/a52dec.git",
	regex	= vPrefixedTag,
};

pkgs["abseil-cpp"] = {
	url	= "https://github.com/abseil/abseil-cpp/tags",
	regex	= "(%d%d%d%d%d%d%d%d%.%d).tar.gz",
};

pkgs["acl"] = {
	url	= "https://download.savannah.gnu.org/releases/acl/",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["acpica"] = {
	url	= "https://github.com/acpica/acpica/tags",
	regex	= "R(%d+_%d+_%d+).tar.gz",
	postMatch = replacer('_', ''),
};

pkgs["ada-url"] = {
	url	= "https://github.com/ada-url/ada/tags",
	regex	= vPrefixedTarGz,
};

pkgs["adwaita-icon-theme"] = {
	url	= "https://gitlab.gnome.org/GNOME/adwaita-icon-theme/-/tags",
	regex	= "(%d+%.%d+).tar.gz",
};

batchPkgs("adwaita-icon-theme", { "adwaita-cursors" });

pkgs["adw-gtk-theme"] = {
	url	= "https://github.com/lassekongo83/adw-gtk3/tags",
	regex	= vPrefixedTarGz,
	note	= "dart-scss is required for higher version",
};

--[[ KDE Framework ]]
pkgs["attica"] = {
	url	= "https://download.kde.org/stable/frameworks/",
	regex	= "href=\"(%d+%.%d+)/\"",
	postMatch = function(s) return s .. ".0"; end,
};

batchPkgs("attica", {
	"breeze-icons", "karchive", "kauth", "kbookmarks", "kcmutils",
	"kcodecs", "kcolorscheme", "kcompletion", "kconfig",
	"kconfigwidgets", "kcoreaddons", "kcrash", "kdbusaddons",
	"kdeclarative", "kdoctools", "kfilemetadata", "kglobalaccel",
	"kguiaddons", "kholidays", "ki18n", "kiconthemes", "kidletime",
	"kio", "kirigami", "kitemmodels", "kitemviews", "kjobwidgets",
	"knewstuff", "knotifications", "knotifyconfig", "kpackage",
	"kparts", "kpty", "kquickcharts", "krunner", "kservice",
	"kstatusnotifieritem", "ksvg", "ktextwidgets", "kwallet",
	"kwidgetsaddons", "kwindowsystem", "kxmlgui", "frameworkintegration",
	"kded", "kdesu", "kdnssd", "kunitconversion", "kuserfeedback",
	"networkmanager-qt", "solid", "sonnet", "syntax-highlighting",
	"threadweaver", "prison",
});

--[[ Plasma Libraries ]]
pkgs["breeze"] = {
	url	= "https://download.kde.org/stable/plasma/",
	regex	= "href=\"(%d+%.%d+%.%d+)/\"",
};

batchPkgs("breeze", {
	"kdecoration", "kwayland", "layer-shell-qt", "libkscreen", "libplasma",
});

--[[ KDE Applications ]]

pkgs["audex"] = {
	url	= "https://download.kde.org/stable/release-service/",
	regex	= "href=\"(%d+%.%d+%.%d+)/\"",
};

batchPkgs("audex", {
	"kdegraphics-mobipocket", "kdenlive", "konversation", "kweather",
	"kweathercore",

	"libkcddb", "libkexiv2",
});

pkgs["alex"] = {
	url	= "https://github.com/haskell/alex/tags",
	regex	= vPrefixedTarGz,
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

pkgs["android-tools"] = {
	url	= "https://github.com/nmeum/android-tools/tags",
	regex	= tarGz,
};

pkgs["assimp"] = {
	url	= "https://github.com/assimp/assimp/tags",
	regex	= vPrefixedTarGz,
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

batchPkgs("appstream", "appstream-qt");

pkgs["appstream-glib"] = {
	url	= "https://people.freedesktop.org/~hughsient/appstream-glib/releases/",
	regex	= "appstream-glib-(%d+%.%d+%.%d+).tar.xz",
};

pkgs["aquamarine"] = {
	url	= "https://github.com/hyprwm/aquamarine/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["argon2"] = {
	url	= "https://github.com/P-H-C/phc-winner-argon2/tags",
	regex	= "/(%d%d%d%d%d%d%d%d).tar.gz",
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
	url	= "https://sourceforge.net/projects/astyle",
	regex	= "astyle-(%d%.[%.%d]+).tar.bz2",
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

pkgs["atuin"] = {
	gitrepo	= "https://github.com/atuinsh/atuin.git",
	regex	= vPrefixedTag,
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

pkgs["avrdude"] = {
	url	= "https://github.com/avrdudes/avrdude/tags",
	regex	= "v(%d+%.%d+).tar.gz",
};

pkgs["axel"] = {
	url	= "https://github.com/axel-download-accelerator/axel/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["ayatana-ido"] = {
	url	= "https://github.com/AyatanaIndicators/ayatana-ido/tags",
	regex	= tarGz,
};

pkgs["babl"] = {
	url	= "https://gitlab.gnome.org/GNOME/babl/-/tags",
	regex	= "babl-BABL_(%d+_[_%d]+).tar.gz",
	postMatch = replacer('_', '.'),
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

pkgs["binwalk"] = {
	url	= "https://github.com/ReFirmLabs/binwalk/tags",
	regex	= vPrefixedTarGz,
};

pkgs["bird"] = {
	url	= "http://bird.network.cz/download",
	regex	= "bird-([%.%d]+).tar.gz",
};

pkgs["bison"] = {
	url	= "http://ftp.gnu.org/gnu/bison",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["blosc"] = {
	url	= "https://github.com/Blosc/c-blosc/tags",
	regex	= vPrefixedTarGz,
};

pkgs["blueprint-compiler"] = {
	url	= "https://gitlab.gnome.org/jwestman/blueprint-compiler/-/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["bluez"] = {
	url	= "https://www.kernel.org/pub/linux/bluetooth/",
	regex	= "bluez-(%d+%.%d+).tar.xz",
};

batchPkgs("bluez", {
	"bluez-cups", "bluez-libs", "bluez-mesh", "bluez-obex", "bluez-utils"
	});

pkgs["boost"] = {
	url	= "https://github.com/boostorg/boost/tags",
	regex	= namedTarGz("boost"),
};

batchPkgs("boost", "boost-libs");

pkgs["botan"] = {
	url	= "https://botan.randombit.net/releases/",
	regex	= "Botan-(%d+%.%d+%.%d+).tar.xz",
};

pkgs["bottom"] = {
	url	= "https://github.com/ClementTsang/bottom/tags",
	regex	= "([.%d]+).tar.gz",
};

pkgs["brightnessctl"] = {
	url	= "https://github.com/Hummer12007/brightnessctl/tags",
	regex	= tarGz,
};

pkgs["brotli"] = {
	url	= "https://github.com/google/brotli/tags",
	regex	= "v([.%d]+).tar.gz",
};

batchPkgs("brotli", { "python-brotli", "brotli-testdata" });

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

pkgs["cabextract"] = {
	url	= "https://github.com/kyz/libmspack/tags",
	regex	= vPrefixedTarGz,
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

batchPkgs("cairo", "cairo-docs");

pkgs["cairomm"] = {
	url	= "https://gitlab.freedesktop.org/cairo/cairomm/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["capstone"] = {
	url	= "https://github.com/capstone-engine/capstone/tags",
	regex	= "/(%d+%.%d%.%d+).tar.gz",
};

pkgs["cargo-about"] = {
	url	= "https://github.com/EmbarkStudios/cargo-about/tags",
	regex	= tarGz,
};

pkgs["cargo-insta"] = {
	gitrepo	= "https://github.com/mitsuhiko/insta.git",
	regex	= numericTag,
};

pkgs["cargo-c"] = {
	url	= "https://github.com/lu-zero/cargo-c/tags",
	regex	= vPrefixedTarGz,
};

pkgs["catatonit"] = {
	gitrepo	= "https://github.com/openSUSE/catatonit.git",
	regex	= vPrefixedTag,
};

pkgs["catdoc"] = {
	url	= "http://ftp.wagner.pp.ru/pub/catdoc/",
	regex	= "catdoc-(%d+%.[%.%d]+).tar.gz",
};

pkgs["catnest"] = {
	url	= "https://github.com/eweOS/catnest/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["cava"] = {
	url	= "https://github.com/karlstav/cava/tags",
	regex	= tarGz,
};

pkgs["cbindgen"] = {
	url	= "https://github.com/eqrion/cbindgen/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["cdrdao"] = {
	url	= "https://sourceforge.net/projects/cdrdao/files/",
	regex	= "rel_(%d+_[_%d]+)/",
	postMatch = replacer('_', '.'),
};

batchPkgs("cdrdao", "gcdmaster");

pkgs["cfiles"] = {
	url	= "https://github.com/mananapr/cfiles/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["chayang"] = {
	url	= "https://git.sr.ht/~emersion/chayang/refs",
	regex	= vPrefixedTarGz,
};

pkgs["check"] = {
	url	= "https://github.com/libcheck/check/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["chrpath"] = {
	url	= "http://ftp.debian.org/debian/pool/main/c/chrpath/",
	regex	= "chrpath_([.%d]+).orig.tar.gz",
};

pkgs["cjson"] = {
	url	= "https://github.com/DaveGamble/cJSON/tags",
	regex	= vPrefixedTarGz,
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

pkgs["conmon"] = {
	url	= "https://github.com/containers/conmon/tags",
	regex	= vPrefixedTarGz,
};

pkgs["connman"] = {
	url	= "https://mirrors.edge.kernel.org/pub/linux/network/connman/",
	regex	= "(%d+%.%d+).tar.gz",
};

pkgs["containers-common"] = {
	gitrepo	= "https://github.com/containers/common.git",
	regex	= vPrefixedTag,
	-- What is this heck
	-- https://github.com/containers/common/releases/tag/v1.0.1
	filter	= function(v) return not (v[1] == "1" and
					  v[2] == "0" and
					  v[3] == "1")
		  end,
};

pkgs["convertlit"] = {
	url	= "http://www.convertlit.com/download.php",
	regex	= "Convert LIT ([%.%d]+)",
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

pkgs["crun"] = {
	gitrepo	= "https://github.com/containers/crun.git",
	regex	= numericTag,
};

pkgs["crypto++"] = {
	url	= "https://github.com/weidai11/cryptopp/tags",
	regex	= "CRYPTOPP_(%d+_%d+_%d+).tar.gz",
	postMatch = replacer('_', '.'),
};

pkgs["cryptsetup"] = {
	url	= "https://gitlab.com/cryptsetup/cryptsetup/-/tags",
	regex	= namedVTarGz("cryptsetup"),
};

pkgs["ctags"] = {
	url	= "https://github.com/universal-ctags/ctags/tags",
	regex	= "p(%d+%.%d+%.%d%d%d%d%d%d%d%d%.%d+).tar.gz",
};

pkgs["cups"] = {
	url	= "https://github.com/OpenPrinting/cups/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

batchPkgs("cups", "libcups");

pkgs["cups-filters"] = {
	url	= "https://github.com/OpenPrinting/cups-filters/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["curl"] = {
	url	= "https://curl.haxx.se/download/",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["cxxopts"] = {
	url	= "https://github.com/jarro2783/cxxopts/tags",
	regex	= vPrefixedTarGz,
};

pkgs["cyrus-sasl"] = {
	url	= "https://github.com/cyrusimap/cyrus-sasl/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

batchPkgs("cyrus-sasl", { "libsasl", "cyrus-sasl-ldap", "cyrus-sasl-gssapi" });

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
	filter	= gnomeStable,
};

pkgs["debugedit"] = {
	url	= "https://sourceware.org/ftp/debugedit/",
	regex	= "(%d+.%d+)/",
};

pkgs["dejagnu"] = {
	url	= "https://ftp.gnu.org/gnu/dejagnu/",
	regex	= namedTarGz("dejagnu"),
};

pkgs["djvulibre"] = {
	url	= "https://djvu.sourceforge.net/",
	regex	= namedTarGz("djvulibre"),
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

pkgs["directx-headers"] = {
	gitrepo	= "https://github.com/microsoft/DirectX-Headers.git",
	regex	= vPrefixedTag,
};

pkgs["discount"] = {
	url	= "https://github.com/Orc/discount/tags",
	regex	= "v(%d+%.%d+%.%d+%w*).tar.gz",
	postMatch = function(s)
		local last = s:sub(-1, -1);
		return last:match("%d") and s or s:sub(1, -2) .. "." .. last;
	end,
};

pkgs["dmidecode"] = {
	url	= "https://sources.archlinux.org/other/dmidecode/",
	regex	= "dmidecode-(%d+%.%d+).tar.xz",
};

pkgs["doctest"] = {
	url	= "https://github.com/onqtam/doctest/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["door-knocker"] = {
	url	= "https://codeberg.org/tytan652/door-knocker/tags",
	regex	= tarGz,
};

pkgs["dos2unix"] = {
	url	= "https://waterlan.home.xs4all.nl/dos2unix.html",
	regex	= "dos2unix-(%d+%.[%.%d]+).tar.gz",
};

pkgs["dosfstools"] = {
	url	= "https://github.com/dosfstools/dosfstools/tags",
	regex	= "v(%d+%.[%.%d]+).tar.gz",
};

pkgs["draco"] = {
	url	= "https://github.com/google/draco/tags",
	regex	= tarGz,
};

pkgs["dropbear"] = {
	url	= "https://github.com/mkj/dropbear/tags",
	regex	= "DROPBEAR_(%d%d%d%d.%d+).tar.gz",
};

pkgs["dtc"] = {
	url	= "https://git.kernel.org/pub/scm/utils/dtc/dtc.git/",
	regex	= "dtc-(%d+%.%d+%.%d+).tar.gz",
};

batchPkgs("dtc", "libfdt");

pkgs["duktape"] = {
	url	= "https://duktape.org/download",
	regex	= "duktape-(%d+.%d+.%d+).tar.xz",
};

pkgs["dvisvgm"] = {
	url	= "https://github.com/mgieseki/dvisvgm/tags",
	regex	= tarGz,
};

pkgs["e2fsprogs"] = {
	url	= "https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/refs/",
	regex	= "e2fsprogs-([.%d]+).tar.gz",
};

pkgs["ebook-tools"] = {
	url	= "https://sourceforge.net/projects/ebook-tools/files/ebook-tools/",
	regex	= "/(%d+%.%d+%.%d+)/",
};

pkgs["efibootmgr"] = {
	url	= "https://github.com/rhboot/efibootmgr/tags",
	regex	= "([.%d]+).tar.gz",
};

pkgs["efivar"] = {
	url	= "https://github.com/rhboot/efivar/tags",
	regex	= "([.%d]+).tar.gz",
};

pkgs["eigen"] = {
	url	= "https://gitlab.com/libeigen/eigen/-/tags",
	regex	= namedTarGz("eigen"),
};

pkgs["ell"] = {
	url	= "https://git.kernel.org/pub/scm/libs/ell/ell.git/refs/",
	regex	= "tag/%?h=(%d+%.%d+)",
};

pkgs["emacs"] = {
	url	= "https://ftp.gnu.org/gnu/emacs/",
	regex	= namedTarGz("emacs"),
};
batchPkgs("emacs", "emacs-nogui");

pkgs["enet"] = {
	url	= "http://enet.bespin.org/Downloads.html",
	regex	= "enet-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["esbuild"] = {
	url	= "https://github.com/evanw/esbuild/tags",
	regex	= vPrefixedTarGz,
};

pkgs["ethtool"] = {
	url	= "https://cdn.kernel.org/pub/software/network/ethtool",
	regex	= namedTarGz("ethtool"),
};

pkgs["ewe-pkgtool"] = {
	url	= "https://github.com/eweOS/ewe-pkgtool/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["eww"] = {
	url	= "https://github.com/elkowar/eww/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["exiv2"] = {
	url	= "https://github.com/Exiv2/exiv2/tags",
	regex	= vPrefixedTarGz,
};

pkgs["exo"] = {
	url	= "https://gitlab.xfce.org/xfce/exo/-/tags",
	regex	= namedTarGz("exo"),
	filter	= gnomeStable,
};

pkgs["expac"] = {
	gitrepo	= "https://github.com/falconindy/expac.git",
	regex	= numericTag,
};

pkgs["expat"] = {
	url	= "https://github.com/libexpat/libexpat/tags",
	regex	= "R_([_%d]+).tar.gz",
	postMatch = replacer('_', '.'),
};

pkgs["expect"] = {
	url	= "https://sourceforge.net/projects/expect/files/Expect/",
	regex	= "/(%d+%.[%.%d]+)/",
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

batchPkgs("fakeroot", "fakeroot-tcp");

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

pkgs["fd"] = {
	url	= "https://github.com/sharkdp/fd/tags",
	regex	= vPrefixedTarGz,
};

pkgs["featherpad"] = {
	url	= "https://github.com/tsujan/FeatherPad/tags",
	regex	= "V(%d+%.%d+%.%d+).tar.gz",
};

pkgs["ffmpeg"] = {
	url	= "https://github.com/FFmpeg/FFmpeg/tags",
	regex	= "n([.%d]+).tar.gz",
};

pkgs["fftw"] = {
	url	= "http://www.fftw.org/download.html",
	regex	= namedTarGz("fftw"),
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

batchPkgs("flac", "libflac");

pkgs["flashrom"] = {
	url	= "https://github.com/flashrom/flashrom/tags",
	regex	= vPrefixedTarGz,
};

pkgs["flatpak"] = {
	url	= "https://github.com/flatpak/flatpak/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

batchPkgs("flatpak", "flatpak-docs");

pkgs["flatpak-xdg-utils"] = {
	url	= "https://github.com/flatpak/flatpak-xdg-utils/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["flex"] = {
	url	= "https://github.com/westes/flex/releases",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["flite"] = {
	url	= "https://github.com/festvox/flite/tags",
	regex	= vPrefixedTarGz,
};

pkgs["fmt"] = {
	url	= "https://github.com/fmtlib/fmt/tags",
	regex	= "([.%d]+).tar.gz",
};

pkgs["fluidsynth"] = {
	url	= "https://github.com/fluidsynth/fluidsynth/tags",
	regex	= vPrefixedTarGz,
};

pkgs["fontconfig"] = {
	url	= "https://gitlab.freedesktop.org/fontconfig/fontconfig/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["fontforge"] = {
	url	= "https://github.com/fontforge/fontforge/tags",
	regex	= "/(%d%d%d%d%d%d%d%d).tar.gz",
};

pkgs["ttf-font-awesome"] = {
	url	= "https://github.com/FortAwesome/Font-Awesome/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["foot"] = {
	url	= "https://codeberg.org/dnkl/foot/tags",
	regex	= "([.%d]+).tar.gz",
};

pkgs["fractal"] = {
	url	= "https://gitlab.gnome.org/World/fractal/-/tags",
	regex	= "fractal-([%.%d]+).tar.gz",
};

pkgs["freetype2"] = {
	url	= "https://download.savannah.gnu.org/releases/freetype/",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["frei0r-plugins"] = {
	url	= "https://github.com/dyne/frei0r/tags",
	regex	= vPrefixedTarGz,
};

pkgs["fribidi"] = {
	url	= "https://github.com/fribidi/fribidi/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["fswatch"] = {
	url	= "https://github.com/emcrisostomo/fswatch/tags",
	regex	= tarGz,
};

pkgs["fuse3"] = {
	url	= "https://github.com/libfuse/libfuse/tags",
	regex	= "fuse-(%d+%.%d+%.%d+).tar.gz",
};

batchPkgs("fuse3", "fuse-common");

pkgs["fzf"] = {
	url	= "https://github.com/junegunn/fzf/tags",
	regex	= "([.%d]+).tar.gz",
};

pkgs["fzpac"] = {
	url	= "https://github.com/sheepla/fzpac/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["garcon"] = {
	url	= "https://gitlab.xfce.org/xfce/garcon/-/tags",
	regex	= namedTarGz("garcon"),
	filter	= gnomeStable,
};

pkgs["gavl"] = {
	url	= "https://sourceforge.net/projects/gmerlin/files/gavl/",
	regex	= "/(%d+%.%d+%.%d+)/",
};

pkgs["gawk"] = {
	url	= "https://ftp.gnu.org/gnu/gawk/",
	regex	= namedTarGz("gawk"),
};

pkgs["gc"] = {
	url	= "https://github.com/ivmai/bdwgc/releases",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["gcompat"] = {
	url	= "https://git.adelielinux.org/adelie/gcompat/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["gcr-3"] = {
	url	= "https://gitlab.gnome.org/GNOME/gcr/-/tags",
	regex	= "gcr-(3%.%d+%.%d+).tar.gz",
	filter	= function(v) return tonumber(v[2]) < 90; end,
};

batchPkgs("gcr-3", "gcr-3-docs");

pkgs["gcr-4"] = {
	url	= "https://gitlab.gnome.org/GNOME/gcr/-/tags",
	regex	= "gcr-(4%.%d+%.%d+).tar.gz",
	filter	= ignoreHighVersions,
};

batchPkgs("gcr-4", "gcr-4-docs");

pkgs["gd"] = {
	url	= "https://github.com/libgd/libgd/tags",
	regex	= namedTarGz("gd"),
};

pkgs["gdal"] = {
	url	= "https://download.osgeo.org/gdal",
	regex	= "(%d+%.%d+%.%d+)/",
};

pkgs["gdbm"] = {
	url	= "https://ftp.gnu.org/gnu/gdbm",
	regex	= "(%d+%.[%.%d]+).tar.gz",
};

pkgs["gdk-pixbuf"] = {
	url	= "https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["gegl"] = {
	url	= "https://gitlab.gnome.org/GNOME/gegl/-/tags",
	regex	= "gegl-GEGL_(%d+_%d+_%d+).tar.gz",
	postMatch = replacer('_', '.'),
};

pkgs["geoclue"] = {
	url	= "https://gitlab.freedesktop.org/geoclue/geoclue/-/tags",
	regex	= namedTarGz("geoclue"),
};

pkgs["geocode-glib"] = {
	url	= "https://gitlab.gnome.org/GNOME/geocode-glib/-/tags",
	regex	= namedTarGz("geocode-glib"),
};

pkgs["geos"] = {
	url	= "https://download.osgeo.org/geos/",
	regex	= "geos-(%d+%.%d+%.%d+).tar.bz2",
};

pkgs["gettext-tiny"] = {
	url	= "https://github.com/sabotage-linux/gettext-tiny/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["gflags"] = {
	url	= "https://github.com/schuhschuh/gflags/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["ghc"] = {
	url	= "https://downloads.haskell.org/~ghc/latest/",
	regex	= "ghc-(%d+[%.%d]+)-src.tar.gz",
};

pkgs["ghostscript"] = {
	url	= "https://github.com/ArtifexSoftware/ghostpdl-downloads/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

batchPkgs("ghostscript", { "ghostpcl", "ghostxps" });

pkgs["gi-docgen"] = {
	url	= "https://gitlab.gnome.org/GNOME/gi-docgen/-/tags",
	regex	= namedTarGz("gi-docgen"),
};

pkgs["giflib"] = {
	url	= "https://sourceforge.net/projects/giflib/files/",
	regex	= "giflib-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["gigolo"] = {
	url	= "https://gitlab.xfce.org/apps/gigolo/-/tags",
	regex	= namedTarGz("gigolo"),
};

pkgs["gimp"] = {
	gitrepo	= "https://gitlab.gnome.org/GNOME/gimp.git",
	regex	= "tags/GIMP_(%d_[%d_]+)$",
	postMatch = replacer('_', '.');
	filter	= gnomeStable,
};

pkgs["git"] = {
	url	= "https://www.kernel.org/pub/software/scm/git",
	regex	= "git-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["gjs"] = {
	url	= "https://gitlab.gnome.org/GNOME/gjs/-/tags",
	regex	= namedTarGz("gjs"),
	filter	= gnomeStable,
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

pkgs["glaze"] = {
	gitrepo	= "https://github.com/stephenberry/glaze.git",
	regex	= vPrefixedTag,
};

pkgs["glfw"] = {
	url	= "https://github.com/glfw/glfw/tags",
	regex	= "/(%d+%.[%.%d]+).tar.gz",
};

pkgs["glib"] = {
	url	= "https://gitlab.gnome.org/GNOME/glib/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
	filter	= gnomeStable,
};

batchPkgs("glib", { "glib-docs", "glib-static" });

pkgs["glib-networking"] = {
	url	= "https://gitlab.gnome.org/GNOME/glib-networking/-/tags",
	regex	= namedTarGz("glib-networking"),
};

pkgs["glibmm"] = {
	url	= "https://gitlab.gnome.org/GNOME/glibmm/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
	filter	= gnomeStable,
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

batchPkgs("glslang", "glslang-static");

pkgs["glu"] = {
	url	= "https://gitlab.freedesktop.org/mesa/glu/-/tags",
	regex	= "glu-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["gmp"] = {
	url	= "https://gmplib.org/download/gmp/",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["gnome-calculator"] = {
	url	= "https://gitlab.gnome.org/GNOME/gnome-calculator/-/tags",
	regex	= namedTarGz("gnome-calculator"),
};

pkgs["gnome-common"] = {
	url	= "https://gitlab.gnome.org/GNOME/gnome-common/-/tags",
	regex	= namedTarGz("gnome-common"),
};

pkgs["gnome-keyring"] = {
	url	= "https://gitlab.gnome.org/GNOME/gnome-keyring/-/tags",
	regex	= "gnome-keyring-(%d+%.%d+).tar.gz",
};

pkgs["gnome-maps"] = {
	url	= "https://gitlab.gnome.org/GNOME/gnome-maps/-/tags",
	regex	= namedTarGz("gnome-maps"),
};

pkgs["gnome-sound-recorder"] = {
	url	= "https://gitlab.gnome.org/World/vocalis/-/tags",
	regex	= namedTarGz("vocalis"),
};

pkgs["gnome-terminal"] = {
	url	= "https://gitlab.gnome.org/GNOME/gnome-terminal/-/tags",
	regex	= namedTarGz("gnome-terminal"),
	-- 3.9x is a gtk4 preview version
	filter	= cAnd(gnomeStable, ignoreHighVersions),
};

pkgs["gnome-weather"] = {
	url	= "https://gitlab.gnome.org/GNOME/gnome-weather/-/tags",
	regex	= namedTarGz("gnome-weather"),
};

pkgs["gnupg"] = {
	url	= "https://gnupg.org/ftp/gcrypt/gnupg",
	regex	= "gnupg-(%d+%.%d+%.%d+).tar.bz2",
	filter	= gnomeStable,
};

pkgs["go"] = {
	url	= "https://go.dev/dl/",
	regex	= "go([.%d]+).src.tar.gz",
};

batchPkgs("go", "go-doc");

pkgs["go-md2man"] = {
	url	= "https://github.com/cpuguy83/go-md2man/tags",
	regex	= vPrefixedTarGz,
};

pkgs["gobject-introspection"] = {
	url	= "https://gitlab.gnome.org/GNOME/gobject-introspection/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

batchPkgs("gobject-introspection", {
	"gobject-introspection-runtime", "libgirepository"
});

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

pkgs["graphite"] = {
	url	= "https://github.com/silnrsi/graphite/tags",
	regex	= tarGz,
};

pkgs["graphviz"] = {
	url	= "https://gitlab.com/graphviz/graphviz/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["grass"] = {
	gitrepo	= "https://github.com/connorskees/grass.git",
	regex	= numericTag,
};

pkgs["greetd"] = {
	url	= "https://git.sr.ht/~kennylevinsen/greetd/refs",
	regex	= "([.%d]+).tar.gz",
};

batchPkgs("greetd", "greetd-agreety");

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

batchPkgs("gsettings-desktop-schemas", "gsettings-system-schemas");

pkgs["gsm"] = {
	url	= "https://www.quut.com/gsm/",
	regex	= "gsm-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["gstreamer"] = {
	url	= "https://gitlab.freedesktop.org/gstreamer/gstreamer/-/tags",
	regex	= "gstreamer-(%d+%.%d+%.%d+).tar.gz",
	filter	= gnomeStable,
};

batchPkgs("gstreamer", {
	"gst-editing-services", "gst-libav", "gst-plugin-gtk",
	"gst-plugin-qml6", "gst-plugin-qsv",
	"gst-plugin-va", "gst-plugins-bad", "gst-plugins-base",
	"gst-plugins-good", "gst-python", "gst-rtsp-server",
	"gstreamer-devel", "gstreamer-vaapi"
	});

pkgs["gtk-doc"] = {
	url	= "https://gitlab.gnome.org/GNOME/gtk-doc/-/tags",
	regex	= namedTarGz("gtk-doc"),
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

pkgs["gtkmm"] = {
	url	= "https://gitlab.gnome.org/GNOME/gtkmm/-/tags",
	regex	= namedTarGz("gtkmm"),
	filter	= gnomeStable,
};

pkgs["gtkmm3"] = {
	url	= "https://gitlab.gnome.org/GNOME/gtkmm/-/tags",
	regex	= "(3%.%d+%.%d+)",
};

pkgs["gtk4"] = {
	url	= "https://gitlab.gnome.org/GNOME/gtk/-/tags",
	regex	= "gtk-(%d+%.%d+%.%d+).tar.gz",
	filter	= gnomeStable,
};

batchPkgs("gtk4", "gtk-update-icon-cache");

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

pkgs["gtkwave"] = {
	url	= "https://gtkwave.sourceforge.net/",
	regex	= namedTarGz("gtkwave-gtk3"),
};

pkgs["gvfs"] = {
	url	= "https://gitlab.gnome.org/GNOME/gvfs/-/tags",
	regex	= namedTarGz("gvfs"),
};

batchPkgs("gvfs", "gvfs-nfs");

pkgs["happy"] = {
	url	= "https://github.com/haskell/happy/tags",
	regex	= tarGz,
	note	= "GHC may require an older version (1.x)",
};

pkgs["harfbuzz"] = {
	url	= "https://github.com/harfbuzz/harfbuzz/tags",
	regex	= "([.%d]+).tar.gz",
};

batchPkgs("harfbuzz", {
	"harfbuzz-cairo", "harfbuzz-docs", "harfbuzz-icu", "harfbuzz-utils"
	});

pkgs["havoc"] = {
	url	= "https://github.com/ii8/havoc/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["hdparm"] = {
	url	= "https://sourceforge.net/projects/hdparm/files/hdparm/",
	regex	= namedTarGz("hdparm"),
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

pkgs["hidapi"] = {
	url	= "https://github.com/libusb/hidapi/tags",
	regex	= "hidapi-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["highway"] = {
	url	= "https://github.com/google/highway/tags",
	regex	= tarGz,
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

pkgs["hyprgraphics"] = {
	url	= "https://github.com/hyprwm/hyprgraphics/tags",
	regex	= vPrefixedTarGz,
};

pkgs["hyprland"] = {
	url	= "https://github.com/hyprwm/Hyprland/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["hyprland-protocols"] = {
	gitrepo	= "https://github.com/hyprwm/hyprland-protocols.git",
	regex	= vPrefixedTag,
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

pkgs["i2c-tools"] = {
	url	= "https://mirrors.edge.kernel.org/pub/software/utils/i2c-tools",
	regex	= namedTarGz("i2c-tools"),
};

pkgs["icu"] = {
	url	= "https://github.com/unicode-org/icu/releases/latest",
	regex	= "release-([-%d]+)",
	postMatch = replacer('-', '.'),
};

pkgs["idump"] = {
	url	= "https://github.com/uobikiemukot/idump/tags",
	regex	= vPrefixedTarGz,
};

pkgs["ifupdown-ng"] = {
	url	= "https://github.com/ifupdown-ng/ifupdown-ng/tags",
	regex	= "ifupdown-ng-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["imagemagick"] = {
	url	= "https://imagemagick.org/archive/",
	regex	= "ImageMagick-(%d+%.%d+%.%d+-%d+).tar.gz",
	postMatch = replacer('-', '.'),
};

pkgs["imath"] = {
	url	= "https://github.com/AcademySoftwareFoundation/Imath/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["iniparser"] = {
	url	= "https://github.com/ndevilla/iniparser/tags",
	regex	= vPrefixedTarGz,
};

pkgs["inotify-tools"] = {
	url	= "https://github.com/inotify-tools/inotify-tools/tags",
	regex	= "/(%d+.%d+%.%d+%.%d+).tar.gz",
};

pkgs["intel-gmmlib"] = {
	url	= "https://github.com/intel/gmmlib/tags",
	regex	= namedTarGz("intel-gmmlib"),
};

pkgs["intel-media-driver"] = {
	url	= "https://github.com/intel/media-driver/tags",
	regex	= namedTarGz("intel-media"),
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

pkgs["jasper"] = {
	url	= "https://github.com/mdadams/jasper/tags",
	regex	= namedTarGz("version"),
};

pkgs["jbig2dec"] = {
	url	= "https://github.com/ArtifexSoftware/jbig2dec/tags",
	regex	= "/(%d+%.%d+).tar.gz",
};

pkgs["jbigkit"] = {
	url	= "https://www.cl.cam.ac.uk/~mgk25/git/jbigkit/refs/tags/",
	regex	= "v(%d+%.[%.%d]+)",
};

pkgs["jdk23-openjdk"] = {
	url	= "https://github.com/openjdk/jdk23u/tags",
	regex	= "jdk-(%d+[%.%d]+%+%d+).tar.gz",
	postMatch = replacer('%+', 'u'),
};

batchPkgs("jdk23-openjdk", {
	"jre23-openjdk", "openjdk23-src", "openjdk23-doc"
});

pkgs["jq"] = {
	url	= "https://github.com/stedolan/jq/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["js128"] = {
	url	= "https://archive.mozilla.org/pub/firefox/releases/",
	regex	= "(128%.%d+%.%d+)esr/",
};

pkgs["json-c"] = {
	url	= "https://github.com/json-c/json-c/tags",
	regex	= "json-c-([%.%d]+)-%d+.tar.gz",
};

pkgs["json-glib"] = {
	url	= "https://gitlab.gnome.org/GNOME/json-glib/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

batchPkgs("json-glib", "json-glib-docs");

pkgs["jsoncpp"] = {
	url	= "https://github.com/open-source-parsers/jsoncpp/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["jxrlib"] = {
	url	= "https://github.com/glencoesoftware/jxrlib/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["kbd"] = {
	url	= "https://web.git.kernel.org/pub/scm/linux/kernel/git/legion/kbd.git/refs/",
	regex	= namedTarGz("kbd"),
};

pkgs["kdiagram"] = {
	url	= "https://download.kde.org/stable/kdiagram/",
	regex	= "href=\"(%d+%.%d+%.%d+)/\"",
};

pkgs["keyutils"] = {
	url	= "https://people.redhat.com/~dhowells/keyutils/",
	regex	= "(%d+%.%d+%.%d+).tar.bz2",
};

pkgs["kirc"] = {
	url	= "https://github.com/mcpcpc/kirc/tags",
	regex	= "([.%d]+).tar.gz",
};

pkgs["kirigami-addons"] = {
	url	= "https://download.kde.org/stable/kirigami-addons/",
	regex	= namedTar("kirigami-addons"),
};

pkgs["kmod"] = {
	url	= "https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git",
	regex	= namedTarGz("kmod"),
};

batchPkgs("kmod", "libkmod");

pkgs["krb5"] = {
	url	= "https://web.mit.edu/kerberos/dist/",
	regex	= "krb5-(%d+%.[%.%d]+).tar.gz",
};

pkgs["labwc"] = {
	url	= "https://github.com/labwc/labwc/tags",
	regex	= tarGz,
};

pkgs["ladspa"] = {
	url	= "http://www.ladspa.org/download/index.html",
	regex	= "ladspa_sdk_([%d%.]+).tgz",
};

pkgs["lame"] = {
	url	= "https://sourceforge.net/projects/lame/files/lame/",
	regex	= "lame-(%d+%.%d+).tar.gz",
};

pkgs["lapack"] = {
	url	= "https://github.com/Reference-LAPACK/lapack/tags",
	regex	= vPrefixedTarGz,
};

batchPkgs("lapack", {
	"blas", "cblas", "lapacke", "blas64", "cblas64", "lapack64",
	"lapacke64"
});

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

pkgs["lensfun"] = {
	url	= "https://github.com/lensfun/lensfun/tags",
	regex	= vPrefixedTarGz,
	-- 0.3.95? What???
	filter	= function(v) return not v[3] or tonumber(v[3]) < 90; end,
};

pkgs["libadwaita"] = {
	url	= "https://gitlab.gnome.org/GNOME/libadwaita/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

batchPkgs("libadwaita", { "libadwaita-demos", "libadwaita-docs" });

pkgs["libaec"] = {
	url	= "https://gitlab.dkrz.de/k202009/libaec/-/tags",
	regex	= namedVTarGz("libaec"),
};

pkgs["libaio"] = {
	url	= "https://pagure.io/libaio/releases",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libao"] = {
	url	= "https://gitlab.xiph.org/xiph/libao/-/tags",
	regex	= namedTarGz("libao"),
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

pkgs["libavif"] = {
	url	= "https://github.com/AOMediaCodec/libavif/tags",
	regex	= vPrefixedTarGz,
};

pkgs["libayatana-appindicator"] = {
	gitrepo	= "https://github.com/AyatanaIndicators/libayatana-appindicator.git",
	regex	= numericTag,
};

pkgs["libayatana-indicator"] = {
	gitrepo	= "https://github.com/AyatanaIndicators/libayatana-indicator.git",
	regex	= numericTag,
};

pkgs["libb2"] = {
	gitrepo	= "https://github.com/BLAKE2/libb2.git",
	regex	= vPrefixedTag,
};

pkgs["libbpf"] = {
	url	= "https://github.com/libbpf/libbpf/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libbs2b"] = {
	url	= "https://sourceforge.net/p/bs2b/code/HEAD/tree/tags/libbs2b/",
	regex	= "href=\"(%d+%.%d+%.%d+)\"",
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

pkgs["libcanberra"] = {
	url	= "https://0pointer.net/lennart/projects/libcanberra/",
	regex	= "libcanberra-(%d+%.%d+).tar.xz",
};

pkgs["libcap"] = {
	url	= "https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/",
	regex	= "(%d+%.%d+).tar.gz",
};

pkgs["libcdio"] = {
	url	= "https://ftp.gnu.org/gnu/libcdio/",
	regex	= "libcdio-(%d+%.[%.%d]+).tar.bz2",
};

pkgs["libcdio-paranoia"] = {
	url	= "https://github.com/rocky/libcdio-paranoia/tags",
	regex	= "release-(%d+%.%d+%+%d+%.%d+%.%d+).tar.gz",
};

pkgs["libclc"] = {
	url	= "https://github.com/llvm/llvm-project/tags",
	regex	= "llvmorg-([.%d]+).tar.gz",
	note = "follow llvm version",
};

pkgs["libcpuid"] = {
	url	= "https://github.com/anrieff/libcpuid/tags",
	regex	= vPrefixedTarGz,
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

pkgs["libdbusmenu-glib"] = {
	url	= "https://launchpad.net/libdbusmenu",
	regex	= namedTarGz("libdbusmenu"),
};

batchPkgs("libdbusmenu-glib", "libdbusmenu-gtk3");

pkgs["libdbusmenu-lxqt"] = {
	gitrepo	= "https://github.com/lxqt/libdbusmenu-lxqt.git",
	regex	= numericTag,
};

pkgs["libde265"] = {
	url	= "https://github.com/strukturag/libde265/tags",
	regex	= vPrefixedTarGz,
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

pkgs["libdmtx"] = {
	gitrepo	= "https://github.com/dmtx/libdmtx",
	regex	= vPrefixedTag,
}

pkgs["libdrm"] = {
	url	= "https://dri.freedesktop.org/libdrm/",
	regex	= "(%d+%.%d+%.%d+).tar.xz",
};

pkgs["libdvdread"] = {
	url	= "https://code.videolan.org/videolan/libdvdread/-/tags",
	regex	= namedTarGz("libdvdread"),
};

pkgs["libebur128"] = {
	url	= "https://github.com/jiixyj/libebur128/tags",
	regex	= vPrefixedTarGz,
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

batchPkgs("libelf", "elfutils");

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
	url	= "https://github.com/libffi/libffi/tags",
	regex	= vPrefixedTarGz,
};

batchPkgs("libffi", "libffi-static");

pkgs["libftdi"] = {
	url	= "https://www.intra2net.com/en/developer/libftdi/download.php",
	regex	= "libftdi1-(%d+%.%d+).tar.bz2",
};

pkgs["libfm"] = {
	gitrepo	= "https://github.com/lxde/libfm.git",
	regex	= numericTag,
};

batchPkgs("libfm", { "libfm-extra", "libfm-gtk3" });

pkgs["libfm-qt"] = {
	gitrepo	= "https://github.com/lxqt/libfm-qt.git",
	regex	= numericTag,
};

pkgs["libfreexl"] = {
	url	= "https://www.gaia-gis.it/gaia-sins/freexl-sources/",
	regex	= namedTarGz("freexl"),
};

pkgs["libgcrypt"] = {
	url	= "https://gnupg.org/ftp/gcrypt/libgcrypt/",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libgee"] = {
	url	= "https://gitlab.gnome.org/GNOME/libgee/-/tags",
	regex	= namedTarGz("libgee"),
};

pkgs["libgeotiff"] = {
	url	= "https://github.com/OSGeo/libgeotiff/tags",
	regex	= tarGz,
};

pkgs["libgexiv2"] = {
	url	= "https://gitlab.gnome.org/GNOME/gexiv2/-/tags",
	regex	= namedTarGz("gexiv2-gexiv2"),
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

pkgs["libgpiod"] = {
	url	= "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/refs",
	regex	= namedTarGz("libgpiod"),
};

pkgs["libgweather"] = {
	gitrepo	= "https://gitlab.gnome.org/GNOME/libgweather.git",
	regex	= numericTag,
	postMatch = replacer('_', '.'),
	filter	= function(v) return gnomeStable(v) and v[1] ~= "40" end,
};

batchPkgs("libgweather", "libgweather-docs");

pkgs["libhandy"] = {
	url	= "https://gitlab.gnome.org/GNOME/libhandy/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libheif"] = {
	url	= "https://github.com/strukturag/libheif/tags",
	regex	= vPrefixedTarGz,
};

pkgs["libhidapi"] = {
	url	= "https://github.com/libusb/hidapi/tags",
	regex	= "hidapi-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libical"] = {
	url	= "https://github.com/libical/libical/tags",
	regex	= vPrefixedTarGz,
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

pkgs["libjxl"] = {
	url	= "https://github.com/libjxl/libjxl/tags",
	regex	= vPrefixedTarGz,
};

pkgs["libksba"] = {
	url	= "https://www.gnupg.org/ftp/gcrypt/libksba/",
	regex	= "(%d+%.%d+%.%d+).tar.bz2",
};

pkgs["libldac"] = {
	url	= "https://github.com/EHfive/ldacBT/tags",
	regex	= vPrefixedTarGz,
};

pkgs["libliftoff"] = {
	url	= "https://gitlab.freedesktop.org/emersion/libliftoff/-/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["liblqr"] = {
	gitrepo	= "https://github.com/carlobaldassi/liblqr.git",
	regex	= vPrefixedTag,
};

pkgs["libltdl"] = {
	url	= "https://ftp.gnu.org/gnu/libtool/",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["liblxqt"] = {
	gitrepo	= "https://github.com/lxqt/liblxqt.git",
	regex	= numericTag,
};

pkgs["libmad"] = {
	url	= "https://sourceforge.net/projects/mad/files/libmad/",
	regex	= "libmad/(%d+%.%d+%.%d+%w+)/",
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

pkgs["libmpc"] = {
	url	= "https://ftp.gnu.org/gnu/mpc/",
	regex	= namedTarGz("mpc"),
};

pkgs["libmng"] = {
	url	= "https://sourceforge.net/projects/libmng/files/libmng-devel/2.0.3/",
	regex	= "libmng-devel/(%d+%.%d+%.%d+)/",
};

pkgs["libmpdclient"] = {
	url	= "https://www.musicpd.org/download/libmpdclient/2/",
	regex	= "libmpdclient-(%d+%.[%.%d]+).tar.xz",
};

pkgs["libmusicbrainz"] = {
	url	= "https://github.com/metabrainz/libmusicbrainz/tags",
	regex	= namedTarGz("release"),
};

pkgs["libmypaint"] = {
	url	= "https://github.com/mypaint/libmypaint/tags",
	regex	= vPrefixedTarGz,
};

pkgs["libndp"] = {
	url	= "https://github.com/jpirko/libndp/tags",
	regex	= vPrefixedTarGz,
};

pkgs["libnewt"] = {
	url	= "https://releases.pagure.org/newt/",
	regex	= namedTarGz("newt"),
};

pkgs["libnma-common"] = {
	url	= "https://gitlab.gnome.org/GNOME/libnma/-/tags",
	regex	= namedTarGz("libnma"),
};

batchPkgs("libnma-common", { "libnma-gtk3", "libnma-gtk4" });

pkgs["libnotify"] = {
	url	= "https://gitlab.gnome.org/GNOME/libnotify/-/tags",
	regex	= namedTarGz("libnotify"),
};

batchPkgs("libnotify", "libnotify-docs");

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

pkgs["libnsl"] = {
	gitrepo	= "https://github.com/thkukuk/libnsl.git",
	regex	= vPrefixedTag,
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
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libpng"] = {
	url	= "https://libpng.sourceforge.io/index.html",
	regex	= "libpng-(%d+%.%d+%.%d+)</li>",
};

pkgs["libportal"] = {
	url	= "https://github.com/flatpak/libportal/tags",
	regex	= tarGz,
};

batchPkgs("libportal", {
	"libportal-docs", "libportal-gtk3", "libportal-gtk4", "libportal-qt6"
	});

pkgs["libppd"] = {
	url	= "https://github.com/OpenPrinting/libppd/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libprocps"] = {
	gitrepo	= "https://gitlab.com/procps-ng/procps.git",
	regex	= vPrefixedTag,
};

pkgs["libproxy"] = {
	url	= "https://github.com/libproxy/libproxy/tags",
	regex	= tarGz,
};

batchPkgs("libproxy", "libproxy-docs");

pkgs["libpsl"] = {
	gitrepo	= "https://github.com/rockdaboot/libpsl.git",
	regex	= numericTag,
};

pkgs["libpulse"] = {
	url	= "https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/tags",
	regex	= "PulseAudio% ([.%d]+)",
};

pkgs["libpwquality"] = {
	url	= "https://github.com/libpwquality/libpwquality/tags",
	regex	= namedTarGz("libpwquality"),
};

pkgs["libqaccessibilityclient-qt6"] = {
	url	= "https://download.kde.org/Attic/libqaccessibilityclient/",
	regex	= "libqaccessibilityclient-(%d+%.%d+%.%d+).tar.xz",
};

pkgs["libqtxdg"] = {
	gitrepo	= "https://github.com/lxqt/libqtxdg.git",
	regex	= numericTag,
};

pkgs["libraqm"] = {
	gitrepo	= "https://github.com/HOST-Oman/libraqm/",
	regex	= vPrefixedTag,
};

pkgs["libraw"] = {
	url	= "https://www.libraw.org/download",
	regex	= "LibRaw-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libraw1394"] = {
	url	= "https://www.kernel.org/pub/linux/libs/ieee1394",
	regex	= "libraw1394-(%d+%.%d+%.%d+).tar.xz",
};

pkgs["librest"] = {
	url	= "https://gitlab.gnome.org/GNOME/librest/-/tags",
	regex	= namedTarGz("librest"),
};

batchPkgs("librest", { "librest-demos", "librest-docs"});

pkgs["librevenge"] = {
	url	= "https://sourceforge.net/projects/libwpd/files/librevenge/",
	regex	= "librevenge-(%d+%.%d+%.%d+)/",
};

pkgs["librsvg"] = {
	url	= "https://gitlab.gnome.org/GNOME/librsvg/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

batchPkgs("librsvg", "librsvg-docs");

pkgs["librttopo"] = {
	url	= "https://git.osgeo.org/gitea/rttopo/librttopo/tags",
	regex	= namedTarGz("librttopo"),
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

pkgs["libsecret"] = {
	url	= "https://gitlab.gnome.org/GNOME/libsecret/-/tags",
	regex	= namedTarGz("libsecret"),
};

batchPkgs("libsecret", "libsecret-docs");

pkgs["libserialport"] = {
	url	= "https://github.com/sigrokproject/libserialport/tags",
	regex	= "libserialport-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libsfdo"] = {
	url	= "https://gitlab.freedesktop.org/vyivel/libsfdo/-/tags",
	regex	= namedVTarGz("libsfdo"),
};

pkgs["libshumate"] = {
	url	= "https://gitlab.gnome.org/GNOME/libshumate/-/tags",
	regex	= namedTarGz("libshumate"),
};

batchPkgs("libshumate", "libshumate-docs");

pkgs["libsigc++2"] = {
	url	= "https://github.com/libsigcplusplus/libsigcplusplus/tags",
	regex	= "(2.[.%d]+).tar.gz",
};

pkgs["libsigc++3"] = {
	url	= "https://github.com/libsigcplusplus/libsigcplusplus/tags",
	regex	= "(3.[.%d]+).tar.gz",
};

pkgs["libsigsegv"] = {
	url	= "https://ftp.gnu.org/gnu/libsigsegv/",
	regex	= namedTarGz("libsigsegv"),
};

pkgs["libsixel"] = {
	gitrepo	= "https://github.com/saitoha/libsixel",
	regex	= vPrefixedTag,
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

pkgs["libsoup3"] = {
	url	= "https://gitlab.gnome.org/GNOME/libsoup/-/tags",
	regex	= namedTarGz("libsoup"),
};

batchPkgs("libsoup3", "libsoup3-docs");

pkgs["libspatialite"] = {
	url	= "https://www.gaia-gis.it/fossil/libspatialite/index",
	regex	= namedTarGz("libspatialite"),
};

pkgs["libspectre"] = {
	url	= "https://libspectre.freedesktop.org/releases/",
	regex	= namedTarGz("libspectre"),
};

pkgs["libspiro"] = {
	url	= "https://github.com/fontforge/libspiro/tags",
	regex	= "/(%d%d%d%d%d%d%d%d).tar.gz",
};

pkgs["libspng"] = {
	url	= "https://github.com/randy408/libspng/tags",
	regex	= vPrefixedTarGz,
};

pkgs["libsrt"] = {
	url	= "https://github.com/Haivision/srt/tags/",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libsrtp"] = {
	url	= "https://github.com/cisco/libsrtp/tags",
	regex	= vPrefixedTarGz,
};

pkgs["libssh2"] = {
	url	= "https://www.libssh2.org/download/",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libstatgrab"] = {
	gitrepo	= "https://github.com/libstatgrab/libstatgrab.git",
	regex	= "tags/LIBSTATGRAB_([%d%_]+)$",
	postMatch = replacer('_', '.'),
};

pkgs["libsysstat"] = {
	gitrepo	= "https://github.com/lxqt/libsysstat.git",
	regex	= numericTag,
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

pkgs["libtommath"] = {
	url	= "https://github.com/libtom/libtommath/tags",
	regex	= vPrefixedTarGz,
};

pkgs["libucontext"] = {
	url	= "https://github.com/kaniini/libucontext/tags",
	regex	= "(%d+%.[%.%d]+).tar.gz",
};

pkgs["libudev"] = {
	url	= "https://github.com/illiliti/libudev-zero/tags",
	regex	= "([.%d]+).tar.gz",
};

pkgs["libuninameslist"] = {
	gitrepo	= "https://github.com/fontforge/libuninameslist.git",
	regex	= "tags/(%d%d%d%d%d%d%d%d)$",
};

pkgs["libunistring"] = {
	url	= "https://ftp.gnu.org/gnu/libunistring/",
	regex	= "libunistring-(%d+%.%d+).tar.gz",
};

pkgs["libusb"] = {
	url	= "https://github.com/libusb/libusb/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["libutempter"] = {
	gitrepo	= "https://github.com/altlinux/libutempter.git",
	regex	= "tags/(%d+%.%d+%.%d+)-alt1$",
};

pkgs["libutf8proc"] = {
	url	= "https://github.com/JuliaStrings/utf8proc/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["libuv"] = {
	url	= "https://github.com/libuv/libuv/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

batchPkgs("libuv", "libuv-docs");

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

pkgs["libvoikko"] = {
	url	= "https://www.puimula.org/voikko-sources/libvoikko/",
	regex	= namedTarGz("libvoikko"),
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

pkgs["libwmf"] = {
	url	= "https://github.com/caolanm/libwmf/tags",
	regex	= vPrefixedTarGz,
};

pkgs["libxcrypt"] = {
	url	= "https://github.com/besser82/libxcrypt/tags",
	regex	= "v([.%d]+).tar.gz",
};

batchPkgs("libxcrypt", "libxcrypt-compat");

pkgs["libxfce4ui"] = {
	gitrepo	= "https://gitlab.xfce.org/xfce/libxfce4ui.git",
	regex	= namedTag("libxfce4ui"),
	filter	= gnomeStable,
};

pkgs["libxfce4util"] = {
	gitrepo	= "https://gitlab.xfce.org/xfce/libxfce4util.git",
	regex	= namedTag("libxfce4util"),
	filter	= gnomeStable,
};

pkgs["libxfce4windowing"] = {
	gitrepo	= "https://gitlab.xfce.org/xfce/libxfce4windowing.git",
	regex	= namedTag("libxfce4windowing"),
	filter	= gnomeStable,
};

pkgs["libxkbcommon"] = {
	url	= "https://github.com/xkbcommon/libxkbcommon/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libxml2"] = {
	url	= "https://gitlab.gnome.org/GNOME/libxml2/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

batchPkgs("libxml2", "libxml2-docs");

pkgs["libxmlb"] = {
	url	= "https://github.com/hughsie/libxmlb/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["libxslt"] = {
	url	= "https://gitlab.gnome.org/GNOME/libxslt/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

batchPkgs("libxslt", "libxslt-docs");

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

pkgs["licenses"] = {
	gitrepo	= "https://github.com/spdx/license-list-data.git",
	regex	= vPrefixedTag,
};

pkgs["linux"] = {
	url	= "https://kernel.org/pub/linux/kernel/v6.x",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

batchPkgs("linux", { "linux-docs", "linux-devel", "linux-headers" });

pkgs["linux-firmware"] = {
	gitrepo	= "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git",
	regex	= "tags/(%d%d%d%d%d%d%d%d)",
};

pkgs["linux-lts"] = {
	url	= "https://www.kernel.org/feeds/kdist.xml",
	regex	= "<title>(%d+%.%d+%.%d+):%s+longterm</title>",
};

batchPkgs("linux-lts", { "linux-lts-devel" , "linux-lts-docs" });

batchPkgs("linux-firmware", {
	"amd-ucode",
	"linux-firmware-amdgpu", "linux-firmware-atheros",
	"linux-firmware-bnx2x", "linux-firmware-iwlwifi",
	"linux-firmware-liquidio", "linux-firmware-marvell",
	"linux-firmware-mediatek", "linux-firmware-mellanox",
	"linux-firmware-nfp", "linux-firmware-qcom", "linux-firmware-qlogic",
	"linux-firmware-whence"
	});

pkgs["llvm"] = {
	url	= "https://github.com/llvm/llvm-project/tags",
	regex	= "llvmorg-([.%d]+).tar.gz",
};

batchPkgs("llvm", {
	"llvm-libs", "llvm-lto", "lldb", "openmp", "lld", "clang", "flang",
	"mlir", "wasi-libc++", "wasi-libc++abi", "wasi-compiler-rt",
	"llvm-devel", "llvm-tools", "clang-tools",
});

pkgs["lm_sensors"] = {
	gitrepo	= "https://github.com/hramrach/lm-sensors.git",
	regex	= "tags/V(%d+-%d+-%d+)$",
	postMatch = replacer('-', '.'),
};

pkgs["lua51"] = {
	url	= "https://www.lua.org/ftp/",
	regex	= "lua-(5.1[.%d]+).tar.gz",
};

pkgs["lua51-bitop"] = {
	url	= "http://bitop.luajit.org/download.html",
	regex	= namedTarGz("LuaBitOp"),
};

pkgs["lua51-compat53"] = {
	gitrepo	= "https://github.com/lunarmodules/lua-compat-5.3.git",
	regex	= vPrefixedTag,
};

pkgs["lua51-curl"] = {
	url	= "https://github.com/Lua-cURL/Lua-cURLv3/tags",
	regex	= vPrefixedTarGz,
};

pkgs["lua51-cjson"] = {
	url	= "https://github.com/openresty/lua-cjson/tags",
	regex	= "/(%d+%.%d+%.%d+%.%d+).tar.gz",
};

pkgs["lua51-lpeg"] = {
	url	= "http://www.inf.puc-rio.br/~roberto/lpeg",
	regex	= "lpeg-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["lua51-luv"] = {
	url	= "https://github.com/luvit/luv/tags",
	regex	= "/(%d+%.%d+%.%d+-%d+).tar.g",
	postMatch = replacer('-', '.'),
};

batchPkgs("lua51-luv", "libluv");

pkgs["lua51-mpack"] = {
	url	= "https://github.com/libmpack/libmpack-lua/tags",
	regex	= tarGz,
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

pkgs["luajit"] = {
	gitrepo	= "https://github.com/OpenResty/luajit2.git",
	regex	= "([%w]+%s+refs/tags/v[%.%d-]+)",
	postMatch = function(s)
		local hash, tag = s:match("(%w+)%s+refs/tags/v([%d%.%-]+)$");
		local basetag, date = tag:match("([%.%d]+)%-(%d%d%d%d%d%d%d%d)");
		return ("%s.r%s.%s"):format(basetag, date, hash:sub(1, 8));
	end,
};

pkgs["lz4"] = {
	url	= "https://github.com/lz4/lz4/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["lzo"] = {
	url	= "https://www.oberhumer.com/opensource/lzo/download/",
	regex	= "lzo-(%d+%.[%.%d]+).tar.gz",
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

pkgs["mallard-ducktype"] = {
	url	= "https://github.com/projectmallard/mallard-ducktype/tags",
	regex	= tarGz,
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

batchPkgs("mesa", {
			"vulkan-swrast", "vulkan-virtio", "vulkan-intel",
			"vulkan-radeon", "vulkan-mesa-layers"
		  });

pkgs["meson"] = {
	url	= "https://github.com/mesonbuild/meson/tags",
	regex	= "/([.%d]+).tar.gz",
};

pkgs["meson-python"] = {
	url	= "https://github.com/mesonbuild/meson-python/tags",
	regex	= tarGz,
};

pkgs["mg"] = {
	url	= "https://github.com/hboetes/mg/tags",
	regex	= "(%d+).tar.gz",
};

pkgs["mimalloc"] = {
	url	= "https://github.com/microsoft/mimalloc/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["luanti"] = {
	url	= "https://github.com/minetest/minetest/tags",
	regex	= tarGz,
};

batchPkgs("luanti", { "luanti-server", "luanti-common" });

pkgs["lvm2"] = {
	gitrepo	= "https://gitlab.com/lvmteam/lvm2.git",
	regex	= "tags/v(%d+_%d+_%d+)$",
	postMatch = replacer('_', '.'),
};

pkgs["lxc"] = {
	url	= "https://linuxcontainers.org/downloads/lxc/",
	regex	= namedVTarGz("lxc"),
};

pkgs["lximage-qt"] = {
	gitrepo	= "https://github.com/lxqt/lximage-qt",
	regex	= numericTag,
};

pkgs["lxmenu-data"] = {
	url	= "https://sourceforge.net/projects/lxde/files/lxmenu-data%20%28desktop%20menu%29/",
	regex	= namedTar("lxmenu-data"),
};

pkgs["lxqt-about"] = {
	gitrepo	= "https://github.com/lxqt/lxqt-about.git",
	regex	= numericTag,
};

pkgs["lxqt-archiver"] = {
	gitrepo	= "https://github.com/lxqt/lxqt-archiver.git",
	regex	= numericTag,
};

pkgs["lxqt-build-tools"] = {
	gitrepo	= "https://github.com/lxqt/lxqt-build-tools",
	regex	= numericTag,
};

pkgs["lxqt-config"] = {
	gitrepo = "https://github.com/lxqt/lxqt-build-tools.git",
	regex	= numericTag,
};

pkgs["lxqt-globalkeys"] = {
	gitrepo	= "https://github.com/lxqt/lxqt-globalkeys",
	regex	= numericTag,
};

pkgs["lxqt-menu-data"] = {
	gitrepo	= "https://github.com/lxqt/lxqt-menu-data.git",
	regex	= numericTag,
};

pkgs["lxqt-notificationd"] = {
	gitrepo	= "https://github.com/lxqt/lxqt-notificationd.git",
	regex	= numericTag,
};

pkgs["lxqt-panel"] = {
	gitrepo	= "https://github.com/lxqt/lxqt-panel.git",
	regex	= numericTag,
};

pkgs["lxqt-qtplugin"] = {
	gitrepo	= "https://github.com/lxqt/lxqt-qtplugin.git",
	regex	= numericTag,
};

pkgs["lxqt-runner"] = {
	gitrepo	= "https://github.com/lxqt/lxqt-runner.git",
	regex	= numericTag,
};

pkgs["lxqt-session"] = {
	gitrepo	= "https://github.com/lxqt/lxqt-session.git",
	regex	= numericTag,
};

pkgs["lxqt-sudo"] = {
	gitrepo	= "https://github.com/lxqt/lxqt-sudo.git",
	regex	= numericTag,
};

pkgs["lxqt-themes"] = {
	gitrepo	= "https://github.com/lxqt/lxqt-themes.git",
	regex	= numericTag,
};

pkgs["lxqt-wayland-session"] = {
	gitrepo	= "https://github.com/lxqt/lxqt-wayland-session.git",
	regex	= numericTag,
};

pkgs["minicom"] = {
	url	= "https://salsa.debian.org/minicom-team/minicom/-/tags",
	regex	= namedTarGz("minicom"),
};

pkgs["minisign"] = {
	url	= "https://github.com/jedisct1/minisign/tags",
	regex	= "([.%d]+).tar.gz",
};

pkgs["minizip-ng"] = {
	url	= "https://github.com/zlib-ng/minizip-ng/tags",
	regex	= tarGz,
};

pkgs["mlt"] = {
	url	= "https://github.com/mltframework/mlt/tags",
	regex	= vPrefixedTarGz,
};

pkgs["mm-common"] = {
	url	= "https://gitlab.gnome.org/GNOME/mm-common/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["mobile-broadband-provider-info"] = {
	url	= "https://gitlab.gnome.org/GNOME/mobile-broadband-provider-info/-/tags",
	regex	= namedTarGz("mobile-broadband-provider-info"),
};

pkgs["mold"] = {
	url	= "https://github.com/rui314/mold/tags",
	regex	= "([.%d]+).tar.gz",
};

pkgs["mousepad"] = {
	url	= "https://gitlab.xfce.org/apps/mousepad/-/tags",
	regex	= namedTarGz("mousepad-mousepad"),
};

pkgs["mpc"] = {
	url	= "https://www.musicpd.org/download/mpc/0/",
	regex	= "mpc-(%d+%.%d+).tar",
};

pkgs["mpd"] = {
	url	= "https://github.com/MusicPlayerDaemon/MPD/tags",
	regex	= vPrefixedTar,
};

pkgs["mpdecimal"] = {
	url	= "https://www.bytereef.org/mpdecimal/download.html",
	regex	= "mpdecimal-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["mpfr"] = {
	url	= "https://ftp.gnu.org/gnu/mpfr/",
	regex	= namedTar("mpfr"),
};

pkgs["mpg123"] = {
	url	= "https://sourceforge.net/projects/mpg123/files/mpg123/",
	regex	= "/(%d+%.%d+%.%d+)/",
};

pkgs["mpv"] = {
	url	= "https://github.com/mpv-player/mpv/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["mpvpaper"] = {
	url	= "https://github.com/GhostNaN/mpvpaper/tags",
	regex	= tarGz,
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

pkgs["mutt"] = {
	url	= "http://ftp.mutt.org/pub/mutt/",
	regex	= namedTar("mutt"),
};

pkgs["mypaint-brushes1"] = {
	url	= "https://github.com/mypaint/mypaint-brushes/tags",
	regex	= vPrefixedTar,
	filter	= function(v) return v[1] == '1' end,
};

pkgs["nano"] = {
	url	= "https://git.savannah.gnu.org/cgit/nano.git/refs/",
	regex	= "nano-(%d+%.%d+).tar.gz",
};

pkgs["namcap"] = {
	url	= "https://gitlab.archlinux.org/pacman/namcap/-/tags",
	regex	= namedTar("namcap"),
};

pkgs["nasm"] = {
	url	= "https://www.nasm.us/",
	regex	= "releasebuilds/([.%d]+)",
};

pkgs["ncmpc"] = {
	url	= "https://www.musicpd.org/download/ncmpc/0/",
	regex	= namedTar("ncmpc"),
};

pkgs["ncurses"] = {
	url	= "http://ftp.gnu.org/gnu/ncurses/",
	regex	= "(%d+%.%d+).tar.gz",
};

pkgs["neatvnc"] = {
	url	= "https://github.com/any1/neatvnc/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["neon"] = {
	url	= "https://github.com/notroj/neon/tags",
	regex	= tarGz,
};

pkgs["neovim"] = {
	url	= "https://github.com/neovim/neovim/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["netease-cloud-music-gtk"] = {
	url	= "https://github.com/gmg137/netease-cloud-music-gtk/tags",
	regex	= tarGz,
};

pkgs["nethack"] = {
	url	= "http://nethack.org/",
	regex	= "Version (%d+%.%d+%.%d+)",
};

pkgs["nettle"] = {
	url	= "https://ftp.gnu.org/gnu/nettle",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["network-manager-applet"] = {
	url	= "https://gitlab.gnome.org/GNOME/network-manager-applet/-/tags",
	regex	= namedTar("network-manager-applet"),
	filter	= gnomeStable,
};

pkgs["networkmanager"] = {
	url	= "https://github.com/NetworkManager/NetworkManager/tags",
	regex	= tar,
};

batchPkgs("networkmanager", {
	"libnm", "nm-cloud-setup", "networkmanager-docs",
});

pkgs["nftables"] = {
	url	= "https://netfilter.org/projects/nftables/files/",
	regex	= namedTar("nftables"),
};

pkgs["nginx"] = {
	gitrepo = "https://github.com/nginx/nginx.git",
	regex	= namedTag("release"),
	filter	= gnomeStable,
};

pkgs["ninja"] = {
	url	= "https://github.com/ninja-build/ninja/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["niri"] = {
	url	= "https://github.com/YaLTeR/niri/tags",
	regex	= vPrefixedTar,
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

pkgs["node-gyp"] = {
	url	= "https://github.com/nodejs/node-gyp/tags",
	regex	= vPrefixedTar,
};

pkgs["nodejs"] = {
	url	= "https://github.com/nodejs/node/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["nodejs-nopt"] = {
	url	= "https://github.com/npm/nopt/tags",
	regex	= vPrefixedTar,
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

pkgs["ntbtls"] = {
	url	= "https://www.gnupg.org/ftp/gcrypt/ntbtls/",
	regex	= namedTar("ntbtls"),
};

pkgs["nudoku"] = {
	url	= "https://github.com/jubalh/nudoku/tags",
	regex	= "([.%d]+).tar.gz",
};

pkgs["numactl"] = {
	gitrepo	= "https://github.com/numactl/numactl",
	regex	= vPrefixedTag,
};

batchPkgs("numactl", "libnuma");

pkgs["nvtop"] = {
	url	= "https://github.com/Syllo/nvtop/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["nwg-hello"] = {
	url	= "https://github.com/nwg-piotr/nwg-hello/tags",
	regex	= vPrefixedTar,
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

pkgs["opencl-headers"] = {
	url	= "https://github.com/KhronosGroup/OpenCL-Headers/tags",
	regex	= vPrefixedTar,
};

pkgs["opencv"] = {
	url	= "https://github.com/opencv/opencv/tags",
	regex	= tar,
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

batchPkgs("openldap", "libldap");

pkgs["openpmix"] = {
	url	= "https://github.com/openpmix/openpmix/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["openssl"] = {
	url	= "https://www.openssl.org/source/",
	regex	= "openssl-(3.[%.%d]+).tar.gz",
};

pkgs["openttd"] = {
	url	= "https://cdn.openttd.org/openttd-releases/",
	regex	= "(%d+%.[%.%d]+)/",
};

pkgs["openttd-opengfx"] = {
	url	= "https://cdn.openttd.org/opengfx-releases/",
	regex	= "(%d+%.[%.%d]+)/",
};

pkgs["openttd-opensfx"] = {
	url	= "https://cdn.openttd.org/opensfx-releases/",
	regex	= "(%d+%.[%.%d]+)/",
};

pkgs["optipng"] = {
	url	= "https://sourceforge.net/projects/optipng/files/OptiPNG/",
	regex	= "optipng-(%d+%.%d+%.%d+)/",
};

pkgs["ostree"] = {
	url	= "https://github.com/ostreedev/ostree/tags",
	regex	= "v(%d%d%d%d.[%d]+).tar.gz",
};

pkgs["p7zip"] = {
	url	= "https://github.com/p7zip-project/p7zip/tags",
	regex	= vPrefixedTar,
};

pkgs["p11-kit"] = {
	url	= "https://github.com/p11-glue/p11-kit/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

batchPkgs("p11-kit", "libp11-kit");

pkgs["pacman"] = {
	url	= "https://gitlab.archlinux.org/pacman/pacman/-/tags",
	regex	= "v(%d+%.[%.%d]+).tar.gz",
};

batchPkgs("pacman", "libalpm");

pkgs["pam"] = {
	url	= "https://github.com/linux-pam/linux-pam/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["pamixer"] = {
	url	= "https://github.com/cdemoulins/pamixer/tags",
	regex	= tarGz,
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

batchPkgs("papirus-icon-theme", "epapirus-icon-theme");

pkgs["parallel"] = {
	url	= "https://ftpmirror.gnu.org/parallel/",
	regex	= namedTarBz2("parallel"),
};

pkgs["parted"] = {
	url	= "https://ftp.gnu.org/gnu/parted/",
	regex	= namedTar("parted"),
};

pkgs["patch"] = {
	url	= "http://ftp.gnu.org/gnu/patch/",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["patchelf"] = {
	url	= "https://github.com/NixOS/patchelf/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["pavucontrol"] = {
	url	= "https://gitlab.freedesktop.org/pulseaudio/pavucontrol/-/tags",
	regex	= namedVTar("pavucontrol"),
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

pkgs["perl-authen-sasl"] = {
	url	= "https://cpan.metacpan.org/authors/id/E/EH/EHUELS/",
	regex	= namedTar("Authen-SASL"),
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

pkgs["perl-cpan-requirements-dynamic"] = {
	url	= "https://cpan.metacpan.org/authors/id/L/LE/LEONT/",
	regex	= namedTar("CPAN-Requirements-Dynamic"),
};

pkgs["perl-devel-stacktrace"] = {
	url	= "https://cpan.metacpan.org/authors/id/D/DR/DROLSKY/",
	regex	= "Devel-StackTrace-(%d+%.%d+).tar.gz",
};

pkgs["perl-digest-hmac"] = {
	url	= "https://cpan.metacpan.org/authors/id/A/AR/ARODLAND/",
	regex	= namedTar("Digest-HMAC"),
};

pkgs["perl-digest-sha"] = {
	url	= "https://cpan.metacpan.org/authors/id/M/MS/MSHELOR/",
	regex	= namedTar("Digest-SHA"),
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

pkgs["perl-io-socket-inet6"] = {
	url	= "https://cpan.metacpan.org/authors/id/S/SH/SHLOMIF/",
	regex	= namedTar("IO-Socket-INET6"),
};

pkgs["perl-io-socket-ssl"] = {
	url	= "https://cpan.metacpan.org/authors/id/S/SU/SULLR/",
	regex	= namedTar("IO-Socket-SSL"),
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

pkgs["perl-mailtools"] = {
	url	= "https://cpan.metacpan.org/authors/id/M/MA/MARKOV/",
	regex	= namedTar("MailTools"),
};

pkgs["perl-mime-base32"] = {
	url	= "https://cpan.metacpan.org/authors/id/R/RE/REHSACK/",
	regex	= namedTar("MIME-Base32"),
};

pkgs["perl-module-build-tiny"] = {
	url	= "https://metacpan.org/dist/Module-Build-Tiny/releases.rss",
	regex	= "Module-Build-Tiny-(%d.%d+)</link>",
};

pkgs["perl-net-ssleay"] = {
	url	= "https://cpan.metacpan.org/authors/id/C/CH/CHRISN/",
	regex	= namedTar("Net-SSLeay"),
};

pkgs["perl-socket6"] = {
	url	= "https://cpan.metacpan.org/authors/id/U/UM/UMEMOTO/",
	regex	= namedTar("Socket6"),
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
	url	= "https://metacpan.org/dist/Test-Fatal/releases.rss",
	regex	= "Test-Fatal-(%d.%d+)</link>",
};

pkgs["perl-test-most"] = {
	url	= "https://cpan.metacpan.org/authors/id/O/OV/OVID/",
	regex	= "Test-Most-(%d+%.%d+).tar.gz",
};

pkgs["perl-test-needs"] = {
	url	= "https://metacpan.org/dist/Test-Needs/releases.rss",
	regex	= "Test-Needs-(%d.%d+)</link>",
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
	url	= "https://metacpan.org/dist/TimeDate/releases.rss",
	regex	= "TimeDate-(%d.%d+)</link>",
};

pkgs["perl-try-tiny"] = {
	url	= "https://metacpan.org/dist/Try-Tiny/releases.rss",
	regex	= "Try-Tiny-(%d.%d+)</link>",
};

pkgs["perl-uri"] = {
	url	= "https://metacpan.org/dist/URI/releases.rss",
	regex	= "URI-(%d+%.%d+)</link>",
};

pkgs["perl-xml-namespacesupport"] = {
	url	= "https://www.cpan.org/authors/id/P/PE/PERIGRIN/",
	regex	= "XML-NamespaceSupport-(%d+%.%d+).tar.gz",
};

pkgs["perl-xml-parser"] = {
	url	= "https://metacpan.org/dist/XML-Parser/releases.rss",
	regex	= "XML-Parser-(%d+%.%d+)</link>",
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

pkgs["physfs"] = {
	url	= "https://github.com/icculus/physfs/tags",
	regex	= namedTar("release"),
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

batchPkgs("pipewire", { "libpipewire", "gst-plugin-pipewire" });

pkgs["pixman"] = {
	url	= "https://xorg.freedesktop.org/releases/individual/lib/",
	regex	= "pixman-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["pkcs11-helper"] = {
	url	= "https://github.com/OpenSC/pkcs11-helper/tags",
	regex	= namedTar("pkcs11-helper"),
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

pkgs["poppler"] = {
	url	= "https://poppler.freedesktop.org/",
	regex	= namedTar("poppler"),
};

pkgs["poppler-data"] = {
	url	= "https://poppler.freedesktop.org/",
	regex	= namedTar("poppler-data"),
};

pkgs["popt"] = {
	url	= "https://ftp.osuosl.org/pub/rpm/popt/releases/popt-1.x/",
	regex	= "popt-(%d+%.%d+).tar.gz",
};

pkgs["potrace"] = {
	url	= "https://potrace.sourceforge.net/",
	regex	= namedTar("potrace"),
};

pkgs["prismlauncher"] = {
	url	= "https://github.com/PrismLauncher/PrismLauncher/tags",
	regex	= tar,
};

pkgs["proj"] = {
	url	= "https://github.com/OSGeo/PROJ/tags",
	regex	= tar,
};

pkgs["protobuf"] = {
	url	= "https://github.com/protocolbuffers/protobuf/releases",
	regex	= "protobuf-(%d+%.%d+).tar.gz",
};

pkgs["protobuf-c"] = {
	url	= "https://github.com/protobuf-c/protobuf-c/tags",
	regex	= vPrefixedTar,
};

pkgs["pugixml"] = {
	url	= "https://github.com/zeux/pugixml/tags",
	regex	= "v([.%d]+).tar.gz",
};

pkgs["putty"] = {
	url	= "https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html",
	regex	= namedTar("putty"),
};

pkgs["pyalpm"] = {
	url	= "https://gitlab.archlinux.org/archlinux/pyalpm/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python"] = {
	url	= "https://github.com/python/cpython/tags",
	regex	= vPrefixedTar,
};

pkgs["python-appdirs"] = {
	url	= "https://github.com/ActiveState/appdirs/tags",
	regex	= tarGz,
};

pkgs["python-aiounittest"] = {
	url	= "https://github.com/kwarunek/aiounittest/tags",
	regex	= tarGz,
};

pkgs["python-attrs"] = {
	url	= "https://github.com/python-attrs/attrs/tags",
	regex	= "/(%d%d%.%d+%.%d+).tar.gz",
};

pkgs["python-argcomplete"] = {
	url	= "https://github.com/kislyuk/argcomplete/tags",
	regex	= vPrefixedTarGz,
};

pkgs["python-auditwheel"] = {
	url	= "https://github.com/pypa/auditwheel/tags",
	regex	= tarGz,
};

pkgs["python-autocommand"] = {
	url	= "https://github.com/Lucretiel/autocommand/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-babel"] = {
	url	= "https://github.com/python-babel/babel/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-beaker"] = {
	url	= "https://github.com/bbangert/beaker/tags",
	regex	= tarGz,
};

pkgs["python-beautifulsoup4"] = {
	url	= "https://git.launchpad.net/beautifulsoup/tree/CHANGELOG",
	regex	= "%s(%d+%.%d+%.%d+)%s",
};

pkgs["python-boolean.py"] = {
	url	= "https://github.com/bastikr/boolean.py/tags",
	regex	= vPrefixedTarGz,
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

pkgs["python-cattrs"] = {
	url	= "https://github.com/python-attrs/cattrs/tags",
	regex	= vPrefixedTarGz,
};

pkgs["python-certifi"] = {
	url	= "https://github.com/certifi/python-certifi/tags",
	regex	= "(%d%d%d%d%.%d%d%.%d%d).tar.gz",
};

pkgs["python-cffi"] = {
	url	= "https://github.com/python-cffi/cffi/tags",
	regex	= vPrefixedTarGz,
};

pkgs["python-chardet"] = {
	url	= "https://github.com/chardet/chardet/tags",
	regex	= tarGz,
};

pkgs["python-charset-normalizer"] = {
	url	= "https://github.com/Ousret/charset_normalizer/tags",
	regex	= tarGz,
};

pkgs["python-dateutil"] = {
	url	= "https://github.com/dateutil/dateutil/tags",
	regex	= tarGz,
};

pkgs["python-dbusmock"] = {
	url	= "https://github.com/martinpitt/python-dbusmock/tags",
	regex	= tarGz,
};

pkgs["python-ddt"] = {
	url	= "https://github.com/txels/ddt/tags",
	regex	= tarGz,
};

pkgs["python-decorator"] = {
	url	= "https://github.com/micheles/decorator/tags",
	regex	= tarGz,
};

pkgs["python-docutils"] = {
	url	= "https://sourceforge.net/projects/docutils/files/docutils/",
	regex	= "/(%d+%.[%.%d]+)/"
};

pkgs["python-dogpile.cache"] = {
	url	= "https://github.com/sqlalchemy/dogpile.cache/tags",
	regex	= "rel_(%d+_%d+_%d+).tar.gz",
	postMatch = replacer('_', '.'),
};

pkgs["python-editables"] = {
	url	= "https://github.com/pfmoore/editables/tags",
	regex	= "/(%d+%.%d+).tar.gz",
};

pkgs["python-execnet"] = {
	url	= "https://github.com/pytest-dev/execnet/tags",
	regex	= vPrefixedTarGz,
};

pkgs["python-fastjsonschema"] = {
	url	= "https://github.com/horejsek/python-fastjsonschema/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-filelock"] = {
	url	= "https://github.com/benediktschmitt/py-filelock/tags",
	regex	= tarGz,
};

pkgs["python-flit-core"] = {
	url	= "https://github.com/pypa/flit/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-fonttools"] = {
	url	= "https://github.com/fonttools/fonttools/tags",
	regex	= tarGz,
};

pkgs["python-freezegun"] = {
	url	= "https://github.com/spulec/freezegun/tags",
	regex	= tarGz,
};

pkgs["python-fs"] = {
	url	= "https://github.com/PyFilesystem/pyfilesystem2/tags",
	regex	= vPrefixedTarGz,
};

pkgs["python-gitdb"] = {
	url	= "https://github.com/gitpython-developers/gitdb/tags",
	regex	= tarGz,
};

pkgs["python-gitpython"] = {
	url	= "https://github.com/gitpython-developers/gitpython/tags",
	regex	= tarGz,
};

pkgs["python-gobject"] = {
	url	= "https://gitlab.gnome.org/GNOME/pygobject/-/tags",
	regex	= namedTarGz("gobject"),
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

pkgs["python-httplib2"] = {
	url	= "https://github.com/httplib2/httplib2/tags",
	regex	= vPrefixedTarGz,
};

pkgs["python-hypothesis"] = {
	url	= "https://github.com/HypothesisWorks/hypothesis/tags",
	regex	= "hypothesis-python-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-idna"] = {
	url	= "https://github.com/kjd/idna/tags",
	regex	= vPrefixedTarGz,
};

pkgs["python-imagesize"] = {
	url	= "https://github.com/shibukawa/imagesize_py/tags",
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

pkgs["python-more-itertools"] = {
	url	= "https://github.com/more-itertools/more-itertools/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-msgpack"] = {
	url	= "https://github.com/msgpack/msgpack-python/tags",
	regex	= vPrefixedTarGz,
};

pkgs["python-numpy"] = {
	url	= "https://github.com/numpy/numpy/tags",
	regex	= vPrefixedTarGz,
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
	gitrepo	= "https://opendev.org/openstack/pbr.git",
	regex	= "tags/(%d+%.%d+%.%d+)",
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

pkgs["python-pyparsing"] = {
	url	= "https://github.com/pyparsing/pyparsing/tags",
	regex	= tarGz,
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
	url	= "https://github.com/stub42/pytz/tags",
	regex	= "release_(%d%d%d%d.%d).tar.gz",
};

pkgs["python-requests"] = {
	url	= "https://github.com/psf/requests/tags",
	regex	= vPrefixedTarGz,
};

pkgs["python-scripttest"] = {
	url	= "https://github.com/pypa/scripttest/tags",
	regex	= tarGz,
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
	url	= "https://github.com/benjaminp/six/tags",
	regex	= tarGz,
};

pkgs["python-smartypants"] = {
	url	= "https://github.com/leohemsted/smartypants.py/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-smmap"] = {
	url	= "https://github.com/gitpython-developers/smmap/tags",
	regex	= vPrefixedTarGz,
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

pkgs["python-tomli-w"] = {
	url	= "https://github.com/hukkin/tomli-w/tags",
	regex	= tarGz,
};

pkgs["python-tornado"] = {
	url	= "https://github.com/tornadoweb/tornado/tags",
	regex	= vPrefixedTarGz,
};

pkgs["python-tqdm"] = {
	url	= "https://github.com/tqdm/tqdm/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["python-trove-classifiers"] = {
	gitrepo	= "https://github.com/pypa/trove-classifiers.git",
	regex	= "tags/([%d%.]+)",
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

pkgs["python-ufolib2"] = {
	url	= "https://github.com/fonttools/ufoLib2/tags",
	regex	= vPrefixedTarGz,
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

pkgs["python-wrapt"] = {
	url	= "https://github.com/GrahamDumpleton/wrapt/tags",
	regex	= tarGz,
};

pkgs["python-yaml"] = {
	url	= "https://github.com/yaml/pyyaml/tags",
	regex	= "/(%d+%.[%d%.]+).tar.gz",
};

pkgs["qemu-common"] = {
	url	= "https://gitlab.com/qemu-project/qemu/-/tags",
	regex	= namedVTarGz("qemu"),
};

batchPkgs("qemu-common", {
	"qemu-audio-alsa", "qemu-audio-pipewire", "qemu-audio-sdl",
	"qemu-block-curl", "qemu-block-dmg", "qemu-guest-agent",
	"qemu-hw-display-virtio-gpu", "qemu-hw-display-virtio-gpu-gl",
	"qemu-hw-display-virtio-gpu-pci", "qemu-hw-display-virtio-gpu-pci-gl",
	"qemu-hw-display-virtio-vga", "qemu-hw-display-virtio-vga-gl",
	"qemu-hw-s390x-virtio-gpu-ccw", "qemu-hw-usb-host",
	"qemu-system-aarch64", "qemu-system-alpha", "qemu-system-arm",
	"qemu-system-i386", "qemu-system-loongarch64", "qemu-system-m68k",
	"qemu-system-mips", "qemu-system-mips64", "qemu-system-mips64el",
	"qemu-system-mipsel", "qemu-system-ppc", "qemu-system-ppc64",
	"qemu-system-riscv32", "qemu-system-riscv64", "qemu-system-s390x",
	"qemu-system-sparc", "qemu-system-sparc64", "qemu-system-x86_64",
	"qemu-tests", "qemu-tools", "qemu-ui-curses", "qemu-ui-egl-headless",
	"qemu-ui-gtk", "qemu-ui-opengl", "qemu-ui-sdl",

	"qemu-user-static",
	"qemu-user-static-aarch64", "qemu-user-static-alpha",
	"qemu-user-static-arm", "qemu-user-static-i386",
	"qemu-user-static-loongarch64", "qemu-user-static-m68k",
	"qemu-user-static-mips", "qemu-user-static-mips64",
	"qemu-user-static-mips64el", "qemu-user-static-mipsel",
	"qemu-user-static-ppc", "qemu-user-static-ppc64",
	"qemu-user-static-riscv32", "qemu-user-static-riscv64",
	"qemu-user-static-s390x", "qemu-user-static-sparc",
	"qemu-user-static-sparc64", "qemu-user-static-x86_64"
	});

pkgs["qpdf"] = {
	url	= "https://github.com/qpdf/qpdf/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

--[[ Qt6 ]]
pkgs["qt6-base"] = {
	gitrepo	= "https://github.com/qt/qtbase.git",
	regex	= "tags/v(6.[%d%.]+)$",
};

batchPkgs("qt6-base", {
	"qt6-3d", "qt6-5compat", "qt6-charts", "qt6-connectivity",
	"qt6-declarative", "qt6-imageformats", "qt6-languageserver",
	"qt6-location", "qt6-multimedia", "qt6-multimedia-ffmpeg",
	"qt6-multimedia-gstreamer", "qt6-networkauth", "qt6-positioning",
	"qt6-quick3d", "qt6-quicktimeline", "qt6-remoteobjects", "qt6-sensors",
	"qt6-serialport", "qt6-shadertools", "qt6-speech", "qt6-svg",
	"qt6-tools", "qt6-wayland", "qt6-webchannel", "qt6-websockets",
});

pkgs["ragel"] = {
	url	= "https://github.com/adrian-thurston/ragel/tags",
	regex	= tarGz,
};

pkgs["ranger"] = {
	url	= "https://github.com/ranger/ranger/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["rapidjson"] = {
	url	= "https://github.com/Tencent/rapidjson/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["rav1e"] = {
	url	= "https://github.com/xiph/rav1e",
	regex	= "xiph/rav1e/releases/tag/v(%d+%.[%.%d]+)",
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

pkgs["repo"] = {
	gitrepo	= "https://android.googlesource.com/tools/repo.git",
	regex	= vPrefixedTag,
};

pkgs["ripgrep"] = {
	gitrepo	= "https://github.com/BurntSushi/ripgrep.git",
	regex	= numericTag,
};

pkgs["rollmeow"] = {
	gitrepo	= "https://github.com/eweOS/rollmeow.git",
	regex	= vPrefixedTag,
};

pkgs["rrdtool"] = {
	gitrepo	= "https://github.com/oetiker/rrdtool-1.x.git",
	regex	= vPrefixedTag,
};

pkgs["rsync"] = {
	url	= "https://github.com/WayneD/rsync/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["rust"] = {
	gitrepo	= "https://github.com/rust-lang/rust.git",
	regex	= "tags/(%d+%.%d+%.%d+)",
};

pkgs["rust-analyzer"] = {
	gitrepo	= "https://github.com/rust-lang/rust-analyzer.git",
	regex	= "tags/(%d%d%d%d-%d%d-%d%d)$",
	postMatch = replacer('-', '.'),
};

pkgs["rust-bindgen"] = {
	gitrepo	= "https://github.com/rust-lang/rust-bindgen.git",
	regex	= vPrefixedTag,
};

pkgs["sane"] = {
	url	= "https://gitlab.com/sane-project/backends/-/tags",
	regex	= namedTarGz("backends"),
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

pkgs["sdl3"] = {
	url	= "https://github.com/libsdl-org/SDL/tags",
	regex	= "/release-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["sdl2-compat"] = {
	url	= "https://github.com/libsdl-org/sdl2-compat/tags",
	regex	= namedTarGz("release"),
};

pkgs["sdl2-image"] = {
	gitrepo	= "https://github.com/libsdl-org/SDL_image.git",
	regex	= "release-(2%.%d+%.%d+)",
};

pkgs["sdl2-mixer"] = {
	gitrepo	= "https://github.com/libsdl-org/SDL_mixer.git",
	regex	= "tags/release-(2%.[%d%.]+)$",
};

pkgs["sdl2-ttf"] = {
	gitrepo	= "https://github.com/libsdl-org/SDL_ttf.git",
	regex	= "tags/release-(2%.[%d%.]+)$",
};

pkgs["sdl3"] = {
	url	 = "https://github.com/libsdl-org/SDL/releases",
	regex	= namedTarGz("SDL3"),
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

pkgs["shellcheck"] = {
	url	= "https://github.com/koalaman/shellcheck/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["samurai"] = {
	url	= "https://github.com/michaelforney/samurai/tags",
	regex	= "/(%d+%.%d+).tar.gz",
};

pkgs["sdbus-cpp"] = {
	url	= "https://github.com/Kistler-Group/sdbus-cpp/tags",
	regex	= vPrefixedTarGz,
};

pkgs["seahorse"] = {
	url	= "https://gitlab.gnome.org/GNOME/seahorse/-/tags",
	regex	= namedTarGz("seahorse"),
};

pkgs["semver"] = {
	url	= "https://github.com/npm/node-semver/tags",
	regex	= vPrefixedTarGz,
};

pkgs["shellcheck"] = {
	url	= "https://github.com/koalaman/shellcheck/tags",
	regex	= vPrefixedTarGz,
};

pkgs["sfwbar"] = {
	url	= "https://github.com/LBCrion/sfwbar/tags",
	regex	= "v(%d+%.[%.%d]+[_%w]+).tar.gz",
};

pkgs["signify"] = {
	url	= "https://github.com/aperezdc/signify/tags",
	regex	= "v(%d+).tar.gz",
};

pkgs["sing-box"] = {
	url	= "https://github.com/SagerNet/sing-box",
	regex	= "v(%d+%.%d+%.%d+)",
};

pkgs["sip"] = {
	url	= "https://github.com/Python-SIP/sip/tags",
	regex	= tarGz,
};

pkgs["skalibs"] = {
	url	= "http://git.skarnet.org/cgi-bin/cgit.cgi/skalibs/refs/",
	regex	= "skalibs-(%d+%.%d+%.%d+%.%d+).tar.gz",
};

pkgs["sl"] = {
	url	= "https://github.com/eyJhb/sl/tags",
	regex	= "(%d+%.%d+).tar.gz",
};

pkgs["slang"] = {
	url	= "https://www.jedsoft.org/releases/slang/",
	regex	= "slang-(%d+%.%d+%.%d+).tar.bz2",
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
	gitrepo	= "https://github.com/smartmontools/smartmontools.git",
	regex	= "tags/RELEASE_([%d_]+)",
	postMatch = replacer('_', '.'),
};

pkgs["snappy"] = {
	url	= "https://github.com/google/snappy/tags",
	regex	= tarGz,
};

pkgs["snowball"] = {
	url	= "https://github.com/snowballstem/snowball/tags",
	regex	= vPrefixedTarGz,
};

batchPkgs("snowball", "libstemmer");

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

batchPkgs("sof-firmware", "sof-tools");

pkgs["sound-theme-freedesktop"] = {
	url	= "https://people.freedesktop.org/~mccann/dist/",
	regex	= "sound-theme-freedesktop-(%d+%.%d+).tar.bz2",
};

pkgs["soundtouch"] = {
	url	= "https://codeberg.org/soundtouch/soundtouch/tags",
	regex	= tarGz,
};

pkgs["soxr"] = {
	url	= "https://github.com/chirlu/soxr/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["spatialindex"] = {
	url	= "https://github.com/libspatialindex/libspatialindex/tags",
	regex	= tarGz,
};

pkgs["spdlog"] = {
	url	= "https://github.com/gabime/spdlog/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["speex"] = {
	url	= "https://gitlab.xiph.org/xiph/speex/-/tags",
	regex	= namedTarGz("Speex"),
};

pkgs["speexdsp"] = {
	url	= "https://gitlab.xiph.org/xiph/speexdsp/-/tags",
	regex	= namedTarGz("SpeexDSP"),
};

pkgs["spice-protocol"] = {
	url	= "https://gitlab.freedesktop.org/spice/spice-protocol/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["spirv-headers"] = {
	url	= "https://github.com/KhronosGroup/SPIRV-Headers/tags",
	regex	= "sdk-(%d+%.%d+%.%d+%.%d+).tar.gz",
	note = "follow vulkan sdk version",
};

pkgs["spirv-llvm-translator"] = {
	url	= "https://github.com/KhronosGroup/SPIRV-LLVM-Translator/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["spirv-tools"] = {
	url	= "https://github.com/KhronosGroup/SPIRV-Tools/tags",
	regex	= "v(%d%d%d%d%.%d+).tar.gz",
	note = "follow vulkan sdk version",
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

pkgs["suitesparse"] = {
	url	= "https://github.com/DrTimothyAldenDavis/SuiteSparse/tags",
	regex	= vPrefixedTarGz,
};

batchPkgs("suitesparse", "suitesparse-graphblas");

pkgs["supertux"] = {
	url	= "https://github.com/supertux/supertux/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["supertuxkart"] = {
	url	= "https://github.com/supertuxkart/stk-code/tags",
	regex	= "/(%d+%.%d+).tar.gz",
};

pkgs["svt-av1"] = {
	url	= "https://gitlab.com/AOMediaCodec/SVT-AV1/-/tags",
	regex	= "SVT-AV1-v(%d+%.%d+%.%d+).tar.gz",
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

pkgs["swayidle"] = {
	url	= "https://github.com/swaywm/swayidle/tags",
	regex	= tarGz,
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

pkgs["taglib"] = {
	url	= "https://github.com/taglib/taglib/tags",
	regex	= vPrefixedTarGz,
};

pkgs["tcl"] = {
	url	= "https://sourceforge.net/projects/tcl/files/Tcl/",
	regex	= "/(%d+%.[%.%d]+)/",
};

pkgs["tclap"] = {
	url	= "https://sourceforge.net/projects/tclap/files/",
	regex	= "tclap-(%d+%.%d+%.%d+).tar.gz",
};

batchPkgs("tclap", "tclap-doc");

pkgs["tcpdump"] = {
	url	= "https://www.tcpdump.org/release/",
	regex	= namedTar("tcpdump"),
};

pkgs["tdb"] = {
	url	= "https://samba.org/ftp/tdb/",
	regex	= "tdb-(%d+%.%d+%.%d+).tar.gz",
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

pkgs["tftp-hpa"] = {
	url	= "https://git.kernel.org/pub/scm/network/tftp/tftp-hpa.git",
	regex	= "tftp-hpa-(%d+%.%d+).tar.gz",
};

pkgs["thunar"] = {
	url	= "https://gitlab.xfce.org/xfce/thunar/-/tags",
	regex	= namedTarGz("thunar"),
};

pkgs["thunar-archive-plugin"] = {
	url	= "https://gitlab.xfce.org/thunar-plugins/thunar-archive-plugin/-/tags",
	regex	= namedTarGz("thunar-archive-plugin"),
};

pkgs["thunar-media-tags-plugin"] = {
	url	= "https://gitlab.xfce.org/thunar-plugins/thunar-media-tags-plugin/-/tags",
	regex	= namedTarGz("thunar-media-tags-plugin"),
};

pkgs["thunar-vcs-plugin"] = {
	url	= "https://gitlab.xfce.org/thunar-plugins/thunar-vcs-plugin/-/tags",
	regex	= namedTarGz("thunar-vcs-plugin"),
};

pkgs["tinc"] = {
	url	= "https://tinc-vpn.org/download/",
	regex	= "tinc-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["tinymist"] = {
	gitrepo	= "https://github.com/Myriad-Dreamin/tinymist.git",
	regex	= vPrefixedTag,
};

pkgs["tinyxml2"] = {
	url	= "https://github.com/leethomason/tinyxml2/tags",
	regex	= tarGz,
};

pkgs["tl-expected"] = {
	url	= "https://github.com/TartanLlama/expected/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["tllist"] = {
	url	= "https://codeberg.org/dnkl/tllist/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["tmux"] = {
	url	= "https://github.com/tmux/tmux/tags",
	regex	= "(%d+%.%d+[a-z]*).tar.gz",
	postMatch = function(s) return s:gsub("[a-z]", "_%1"); end,
};

pkgs["toml11"] = {
	url	= "https://github.com/ToruNiina/toml11/tags",
	regex	= vPrefixedTarGz,
};

pkgs["tomlplusplus"] = {
	url	= "https://github.com/marzer/tomlplusplus/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["tor"] = {
	url	= "https://dist.torproject.org/",
	regex	= namedTarGz("tor"),
};

pkgs["tree"] = {
	url	= "https://gitlab.com/OldManProgrammer/unix-tree/-/tags",
	regex	= "unix-tree-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["tree-sitter"] = {
	url	= "https://github.com/tree-sitter/tree-sitter/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["ttf-0xproto-nerd"] = {
	url	= "https://github.com/ryanoasis/nerd-fonts/tags",
	regex	= vPrefixedTarGz,
};

batchPkgs("ttf-0xproto-nerd", {
	"otf-aurulent-nerd", "otf-codenewroman-nerd", "otf-comicshanns-nerd",
	"otf-commit-mono-nerd", "otf-droid-nerd", "otf-firamono-nerd",
	"otf-geist-mono-nerd", "otf-hasklig-nerd", "otf-hermit-nerd",
	"otf-monaspace-nerd", "otf-opendyslexic-nerd", "otf-overpass-nerd",
	"ttf-3270-nerd", "ttf-agave-nerd",
	"ttf-anonymouspro-nerd", "ttf-arimo-nerd", "ttf-bigblueterminal-nerd",
	"ttf-bitstream-vera-mono-nerd", "ttf-cascadia-code-nerd",
	"ttf-cascadia-mono-nerd", "ttf-cousine-nerd", "ttf-d2coding-nerd",
	"ttf-daddytime-mono-nerd", "ttf-dejavu-nerd", "ttf-envycoder-nerd",
	"ttf-fantasque-nerd", "ttf-firacode-nerd", "ttf-go-nerd",
	"ttf-gohu-nerd", "ttf-hack-nerd", "ttf-heavydata-nerd",
	"ttf-iawriter-nerd", "ttf-ibmplex-mono-nerd", "ttf-inconsolata-go-nerd",
	"ttf-inconsolata-lgc-nerd", "ttf-inconsolata-nerd", "ttf-intone-nerd",
	"ttf-iosevka-nerd", "ttf-iosevkaterm-nerd", "ttf-iosevkatermslab-nerd",
	"ttf-jetbrains-mono-nerd", "ttf-lekton-nerd",
	"ttf-liberation-mono-nerd", "ttf-lilex-nerd", "ttf-martian-mono-nerd",
	"ttf-meslo-nerd", "ttf-monofur-nerd", "ttf-monoid-nerd",
	"ttf-mononoki-nerd", "ttf-mplus-nerd", "ttf-noto-nerd",
	"ttf-profont-nerd", "ttf-proggyclean-nerd", "ttf-recursive-nerd",
	"ttf-roboto-mono-nerd", "ttf-sharetech-mono-nerd",
	"ttf-sourcecodepro-nerd", "ttf-space-mono-nerd", "ttf-terminus-nerd",
	"ttf-tinos-nerd", "ttf-ubuntu-mono-nerd", "ttf-ubuntu-nerd",
	"ttf-victor-mono-nerd", "ttf-zed-mono-nerd"
	});

pkgs["ttf-dejavu"] = {
	url	= "https://github.com/dejavu-fonts/dejavu-fonts/tags",
	regex	= "version_(%d+_%d+)",
	postMatch = replacer('_', '.'),
};

pkgs["ttf-inter"] = {
	gitrepo	= "https://github.com/rsms/inter.git",
	regex	= vPrefixedTag,
};

batchPkgs("ttf-inter", "ttf-inter-variable");

pkgs["ttf-nerd-fonts-symbols"] = {
	gitrepo	= "https://github.com/ryanoasis/nerd-fonts.git",
	regex	= vPrefixedTag,
};

batchPkgs("ttf-nerd-fonts-symbols",
	  { "ttf-nerd-fonts-symbols-mono", "ttf-nerd-fonts-symbols-common" });

pkgs["ttf-noto-fonts"] = {
	url	= "https://github.com/notofonts/notofonts.github.io/tags",
	regex	= "noto-monthly-release-(%d+%.%d+%.%d+).tar.gz",
};

batchPkgs("ttf-noto-fonts", "ttf-noto-fonts-extra");

pkgs["ttf-roboto"] = {
	gitrepo	= "https://github.com/googlefonts/roboto-3-classic.git",
	regex	= vPrefixedTag,
};

batchPkgs("ttf-roboto", "ttf-roboto-variable");

pkgs["ttf-noto-fonts-emoji"] = {
	url	= "https://github.com/googlefonts/noto-emoji/tags",
	regex	= vPrefixedTarGz,
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

pkgs["typst"] = {
	url	= "https://github.com/typst/typst/tags",
	regex	= vPrefixedTarGz,
};

pkgs["tzdata"] = {
	url	= "https://data.iana.org/time-zones/releases/",
	regex	= "tzdata(%d%d%d%d%w).tar.gz",
};

pkgs["unibilium"] = {
	url	= "https://github.com/neovim/unibilium/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["util-linux"] = {
	url	= "https://github.com/util-linux/util-linux/tags",
	regex	= "v(%d+%.[%.%d]+).tar.gz",
};

batchPkgs("util-linux", "util-linux-libs");

pkgs["utf8cpp"] = {
	url	= "https://github.com/nemtrif/utfcpp/tags/",
	regex	= vPrefixedTarGz,
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

pkgs["vnstat"] = {
	url	= "https://humdi.net/vnstat/",
	regex	= "vnstat-(%d+%.[%.%d]+).tar.gz",
};

pkgs["vte-common"] = {
	url	= "https://gitlab.gnome.org/GNOME/vte/-/tags",
	regex	= "vte-(%d+%.%d+%.%d+).tar.gz",
	-- releases with even minor version are stable
	filter	= function(s) return s[2] % 2 == 0; end,
};

batchPkgs("vte-common", { "vte3", "vte4" });

pkgs["vulkan-headers"] = {
	url	= "https://github.com/KhronosGroup/Vulkan-Headers/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
	note = "follow vulkan sdk version",
};

pkgs["vulkan-icd-loader"] = {
	url	= "https://github.com/KhronosGroup/Vulkan-Loader/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
	note = "follow vulkan sdk version",
};

pkgs["vulkan-tools"] = {
	url	= "https://github.com/KhronosGroup/Vulkan-Tools/tags",
	regex	= vPrefixedTarGz,
	note = "follow vulkan sdk version",
};

pkgs["vulkan-volk"] = {
	url	= "https://github.com/zeux/volk/tags",
	regex	= tarGz,
	note = "follow vulkan sdk version",
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

pkgs["waylyrics"] = {
	url	= "https://github.com/waylyrics/waylyrics/tags",
	regex	= vPrefixedTarGz,
};

pkgs["wayvnc"] = {
	url	= "https://github.com/any1/wayvnc/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["wcm"] = {
	url	= "https://github.com/WayfireWM/wcm/tags",
	regex	= vPrefixedTarGz,
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

pkgs["wf-recorder"] = {
	url	= "https://github.com/ammen99/wf-recorder/tags",
	regex	= vPrefixedTarGz,
};

pkgs["wf-shell"] = {
	url	= "https://github.com/WayfireWM/wf-shell/tags",
	regex	= vPrefixedTarGz,
};

pkgs["wget"] = {
	url	= "https://ftp.gnu.org/gnu/wget/",
	regex	= "wget-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["wine"] = {
	url	= "https://gitlab.winehq.org/wine/wine/-/tags",
	regex	= "tags/wine-(%d+%.%d+)",
};

pkgs["winetricks"] = {
	url	= "https://github.com/Winetricks/winetricks/tags",
	regex	= "/(%d%d%d%d%d%d%d%d).tar.gz",
};

pkgs["wireguard-tools"] = {
	url	= "https://git.zx2c4.com/wireguard-tools/",
	regex	= "/wireguard-tools-(%d+%.%d+%.%d%d%d%d%d%d%d%d).tar.xz",
};

pkgs["wireplumber"] = {
	url	= "https://gitlab.freedesktop.org/pipewire/wireplumber/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

batchPkgs("wireplumber", "libwireplumber");

pkgs["wl-clipboard"] = {
	url	= "https://github.com/bugaevc/wl-clipboard/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["wlogout"] = {
	url	= "https://github.com/ArtsyMacaw/wlogout/tags",
	regex	= "/([.%d]+).tar.gz",
};

pkgs["wlopm"] = {
	gitrepo	= "https://git.sr.ht/~leon_plickat/wlopm",
	regex	= vPrefixedTag,
};

pkgs["wlr-randr"] = {
	url	= "https://git.sr.ht/~emersion/wlr-randr/refs",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["wlroots0.19"] = {
	gitrepo	= "https://gitlab.freedesktop.org/wlroots/wlroots.git",
	regex	= numericTag,
};

batchPkgs("wlroots0.19", "wlroots0.19-devel");

pkgs["wmenu"] = {
	url	= "https://codeberg.org/adnano/wmenu/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["woff2"] = {
	url	= "https://github.com/google/woff2/tags",
	regex	= vPrefixedTarGz,
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
	gitrepo	= "https://bitbucket.org/multicoreware/x265_git.git",
	regex	= "tags/([.%d]+)",
};

batchPkgs("x265", "libx265");

pkgs["xcur2png"] = {
	url	= "https://github.com/eworm-de/xcur2png/tags",
	regex	= tarGz,
};

pkgs["xdg-dbus-proxy"] = {
	url	= "https://github.com/flatpak/xdg-dbus-proxy/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["xdg-desktop-portal"] = {
	url	= "https://github.com/flatpak/xdg-desktop-portal/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

pkgs["xdg-desktop-portal-gtk"] = {
	url	= "https://github.com/flatpak/xdg-desktop-portal-gtk/tags",
	regex	= tarGz,
};

pkgs["xdg-desktop-portal-lxqt"] = {
	url	= "https://github.com/lxqt/xdg-desktop-portal-lxqt/tags",
	regex	= tarGz,
};

pkgs["xdg-desktop-portal-wlr"] = {
	url	= "https://github.com/emersion/xdg-desktop-portal-wlr/tags",
	regex	= vPrefixedTarGz,
};

pkgs["xdg-user-dirs"] = {
	url	= "https://gitlab.freedesktop.org/xdg/xdg-user-dirs/-/tags",
	regex	= "(%d+%.%d+).tar.gz",
};

pkgs["xdg-utils"] = {
	url	= "https://gitlab.freedesktop.org/xdg/xdg-utils/-/tags",
	regex	= "(%d+%.%d+%.%d+).tar.gz",
};

pkgs["xdg-utils-cxx"] = {
	url	= "https://github.com/azubieta/xdg-utils-cxx/tags",
	regex	= vPrefixedTarGz,
};

pkgs["xerces-c"] = {
	url	= "https://xerces.apache.org/xerces-c/download.cgi",
	regex	= namedTarGz("xerces-c"),
};

pkgs["xfburn"] = {
	url	= "https://gitlab.xfce.org/apps/xfburn/-/tags",
	regex	= namedTarGz("xfburn"),
};

pkgs["xfce4-appfinder"] = {
	url	= "https://gitlab.xfce.org/xfce/xfce4-appfinder/-/tags",
	regex	= namedTarGz("xfce4-appfinder"),
	filter	= gnomeStable,
};

pkgs["xfce4-battery-plugin"] = {
	url	= "https://gitlab.xfce.org/panel-plugins/xfce4-battery-plugin/-/tags",
	regex	= namedTarGz("xfce4-battery-plugin"),
};

pkgs["xfce4-clipman-plugin"] = {
	url	= "https://gitlab.xfce.org/panel-plugins/xfce4-clipman-plugin/-/tags",
	regex	= namedTarGz("xfce4-clipman-plugin"),
};

pkgs["xfce4-cpugraph-plugin"] = {
	url	= "https://gitlab.xfce.org/panel-plugins/xfce4-cpugraph-plugin/-/tags",
	regex	= namedTarGz("xfce4-cpugraph-plugin"),
};

pkgs["xfce4-dev-tools"] = {
	url	= "https://gitlab.xfce.org/xfce/xfce4-dev-tools/-/tags",
	regex	= "xfce4-dev-tools-(%d+%.%d+%.%d+).tar.gz",
	filter	= gnomeStable,
};

pkgs["xfce4-dict"] = {
	url	= "https://gitlab.xfce.org/apps/xfce4-dict/-/tags",
	regex	= namedTarGz("xfce4-dict"),
};

pkgs["xfce4-diskperf-plugin"] = {
	url	= "https://gitlab.xfce.org/panel-plugins/xfce4-diskperf-plugin/-/tags",
	regex	= namedTarGz("xfce4-diskperf-plugin"),
};

pkgs["xfce4-indicator-plugin"] = {
	url	= "https://gitlab.xfce.org/panel-plugins/xfce4-indicator-plugin/-/tags",
	regex	= namedTarGz("xfce4-indicator-plugin"),
};

pkgs["xfce4-notifyd"] = {
	url	= "https://gitlab.xfce.org/apps/xfce4-notifyd/-/tags",
	regex	= namedTarGz("xfce4-notifyd"),
};

pkgs["xfce4-panel"] = {
	url	= "https://gitlab.xfce.org/xfce/xfce4-panel/-/tags",
	regex	= namedTarGz("xfce4-panel"),
	filter	= gnomeStable,
};

pkgs["xfce4-places-plugin"] = {
	url	= "https://gitlab.xfce.org/panel-plugins/xfce4-places-plugin/-/tags",
	regex	= namedTarGz("xfce4-places-plugin"),
};

pkgs["xfce4-pulseaudio-plugin"] = {
	url	= "https://gitlab.xfce.org/panel-plugins/xfce4-pulseaudio-plugin/-/tags",
	regex	= namedTarGz("xfce4-pulseaudio-plugin"),
};

pkgs["xfce4-screenshooter"] = {
	url	= "https://gitlab.xfce.org/apps/xfce4-screenshooter/-/tags",
	regex	= namedTarGz("xfce4-screenshooter"),
};

pkgs["xfce4-session"] = {
	url	= "https://gitlab.xfce.org/xfce/xfce4-session/-/tags",
	regex	= namedTarGz("xfce4-session"),
	filter	= gnomeStable,
};

pkgs["xfce4-settings"] = {
	url	= "https://gitlab.xfce.org/xfce/xfce4-settings/-/tags",
	regex	= namedTarGz("xfce4-settings"),
	filter	= gnomeStable,
};

pkgs["xfce4-taskmanager"] = {
	url	= "https://gitlab.xfce.org/apps/xfce4-taskmanager/-/tags",
	regex	= namedTarGz("xfce4-taskmanager"),
};

pkgs["xfce4-terminal"] = {
	url	= "https://gitlab.xfce.org/apps/xfce4-terminal/-/tags",
	regex	= namedTarGz("xfce4-terminal"),
};

pkgs["xfce4-wavelan-plugin"] = {
	url	= "https://gitlab.xfce.org/panel-plugins/xfce4-wavelan-plugin/-/tags",
	regex	= namedTarGz("xfce4-wavelan-plugin"),
};

pkgs["xfce4-whiskermenu-plugin"] = {
	url	= "https://gitlab.xfce.org/panel-plugins/xfce4-whiskermenu-plugin/-/tags",
	regex	= namedVTarGz("xfce4-whiskermenu-plugin"),
};

pkgs["xfconf"] = {
	url	= "https://gitlab.xfce.org/xfce/xfconf/-/tags",
	regex	= namedTarGz("xfconf"),
	filter	= gnomeStable,
};

pkgs["xfdesktop"] = {
	url	= "https://gitlab.xfce.org/xfce/xfdesktop/-/tags",
	regex	= namedTarGz("xfdesktop"),
	filter	= gnomeStable,
};

pkgs["xfmpc"] = {
	url	= "https://gitlab.xfce.org/apps/xfmpc/-/tags",
	regex	= namedTarGz("xfmpc"),
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

pkgs["yelp-tools"] = {
	url	= "https://gitlab.gnome.org/GNOME/yelp-tools/-/tags",
	regex	= "yelp-tools-(%d+%.[%.%d+]).tar.gz",
};

pkgs["yelp-xsl"] = {
	url	= "https://gitlab.gnome.org/GNOME/yelp-xsl/-/tags",
	regex	= "yelp-xsl-(%d+%.[%.%d]+).tar.gz",
};

pkgs["zed"] = {
	gitrepo	= "https://github.com/zed-industries/zed.git",
	regex	= vPrefixedTag,
};

pkgs["zenity"] = {
	url	= "https://gitlab.gnome.org/GNOME/zenity/-/tags",
	regex	= "zenity-(%d+%.%d+%.%d+).tar.gz",
	filter	= cAnd(gnomeStable, ignoreHighVersions),
};

pkgs["zita-convolver"] = {
	url	= "https://kokkinizita.linuxaudio.org/linuxaudio/downloads/index.html",
	regex	= namedTar("zita-convolver"),
};

pkgs["zimg"] = {
	url	= "https://github.com/sekrit-twc/zimg/tags",
	regex	= "release-(%d+%.%d+%.%d+).tar.gz",
};

pkgs["zlib-ng"] = {
	url	= "https://github.com/zlib-ng/zlib-ng/tags",
	regex	= "/(%d+%.%d+%.%d+).tar.gz",
};

batchPkgs("zlib-ng", "zlib-ng-static");

pkgs["zsh"] = {
	url	= "https://zsh.org/pub/",
	regex	= "zsh-(%d+%.%d+).tar.xz",
};

pkgs["zstd"] = {
	url	= "https://github.com/facebook/zstd/tags",
	regex	= "v(%d+%.%d+%.%d+).tar.gz",
};

pkgs["zxing-cpp"] = {
	url	= "https://github.com/nu-book/zxing-cpp/tags",
	regex	= vPrefixedTarGz,
};

pkgs["zziplib"] = {
	url	= "https://github.com/gdraheim/zziplib/tags",
	regex	= vPrefixedTarGz,
};
