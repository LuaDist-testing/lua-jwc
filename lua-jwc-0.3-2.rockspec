-- This file was automatically generated for the LuaDist project.

package = "lua-jwc"
version = "0.3-2"
-- LuaDist source
source = {
  tag = "0.3-2",
  url = "git://github.com/LuaDist-testing/lua-jwc.git"
}
-- Original source
-- source = {
-- 	url = "hg+http://code.zash.se/lua-jwc/",
-- 	tag = "0.3"
-- }
description = {
	summary = "JSON Web Crypto",
	homepage = "https://code.zash.se/lua-jwc",
	license = "MIT/X11"
}
dependencies = {
	"luaossl", "lua-cjson", "luasocket"
}
build = {
	type = "builtin",
	modules = {
		["jwc.b64url"] = "b64url.lua",
		["jwc.jwk"] = "jwk.lua",
		["jwc.jws"] = "jws.lua"
	}
}