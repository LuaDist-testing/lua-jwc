-- Copyright (c) 2016 Kim Alvefur
--
-- This project is MIT/X11 licensed. Please see the
-- COPYING file in the source package for more information.
--
-- JSON Web Signatures

local digest = require "openssl.digest";
local json = require "cjson";
local b64url = require "jwc.b64url".encode;
local jwk = require "jwc.jwk";

-- Hash function -> key type -> "alg" parameter
local hash_key_algorithm_map = {
	sha256 = {
		rsaEncryption = "RS256"; -- RSA-with-SHA2-256
	};
}

local hash_algorithm = "sha256";

local algorithm_map = hash_key_algorithm_map[hash_algorithm];

local function jws_sign(key, header, payload)
	local alg = algorithm_map[key:type()];
	if not alg then
		return nil, "unsupported-algorithm";
	end

	local jwk_pub, err = jwk.get_public(key);
	if not jwk_pub then return nil, err; end

	local encoded_payload = b64url(json.encode(payload));
	local protected_header = b64url(json.encode(header));

	local unprotected_header = {
		alg = alg;
		jwk = jwk_pub;
	};

	local hash = digest.new(hash_algorithm);
	hash:update(protected_header .. "." .. encoded_payload);
	local signature = b64url(key:sign(hash));

	-- Flattened JSON Serialization
	return json.encode({
		payload = encoded_payload;
		protected = protected_header;
		header = unprotected_header;
		signature = signature;
	});
end

return {
	sign = jws_sign;
}
