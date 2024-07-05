pkgs = {};

loadfile(os.getenv("HOME") .. "/.config/rollmeow/pkglist.lua", "pkglist", _ENV)();

local downStreamVers = {};
do
	local output = io.popen("pacman -Sl | cut -d ' ' -f 2,3");
	for line in output:lines() do
		local name, ver = line:match("(%S+)%s+(.-)%-%d+");
		local epoch, ver1 = ver:match("(%d+):(.+)");
		if epoch then
			ver = ver1;
		end
		downStreamVers[name] = ver;
	end
	output:close();
end

local function
evalDownstream(pkg)
	return downStreamVers[pkg];
end

local function
fetchUpstream(url)
	local ver = io.popen("curl --connect-timeout 5 -Ls " .. url):read("a");
	if ver == "" then
		error("failed to fetch");
	end
	return ver;
end

return
{
	evalDownstream	= evalDownstream,
	fetchUpstream	= fetchUpstream,
	cachePath	= "/tmp/rollmeow.cache.lua",
	packages	= pkgs,
};
