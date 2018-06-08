-- Copyright (c) 2016 Kim Alvefur
--
-- This project is MIT/X11 licensed. Please see the
-- COPYING file in the source package for more information.
--
-- JSON Web Keys

local digest = require "openssl.digest";
local json = require "cjson";
local b64url = require "jwc.b64url".encode;

local function get_public_rsa(key)
	local key_n, key_e = key:getParameters("n", "e");
	return {
		kty = "RSA";
		n = b64url(key_n:tobin());
		e = b64url(key_e:tobin());
	};
end

local key_type_map = {
	rsaEncryption = get_public_rsa;
};

local function get_public(key)
	local get_pubkey = key_type_map[key:type()];
	if not get_pubkey then
		return nil, "unsupported-algorithm";
	end
	return get_pubkey(key);
end

local function thumbprint(key, hash_alg)
	local jwk_pub, err = get_public(key);
	if not jwk_pub then return nil, err; end

	local ordered = {};
	for k,v in pairs(jwk_pub) do
		table.insert(ordered, json.encode(k) .. ":" .. json.encode(v));
	end
	table.sort(ordered);
	local canonical = "{" .. table.concat(ordered, ",") .. "}";
	local hash = digest.new(hash_alg or "sha256");
	hash:update(canonical);
	return b64url(hash:final());
end

return {
	get_public = get_public;
	thumbprint = thumbprint;
}
