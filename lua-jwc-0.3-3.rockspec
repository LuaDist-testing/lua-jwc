-- This file was automatically generated for the LuaDist project.

package = "lua-jwc"
version = "0.3-3"
-- LuaDist source
source = {
  tag = "0.3-3",
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
	license = "MIT"
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